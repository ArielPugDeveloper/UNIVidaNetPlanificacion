using System;
using System.Configuration;
using System.IO;
using System.Reflection;
using System.Web;
using System.Web.Configuration;
using UNIVidaNetPlanificacion.Parametrizacion;
using UVNetTransversal.ProgramacionFront.Web.WebForm;

namespace UNIVidaNetPlanificacion
{
    public partial class CapturaErrores : CBWebFormGenerico
    {
        public string CodigoSistemaBase = ConfigurationManager.AppSettings["CodigoSistema"];
        protected void Page_Load(object sender, EventArgs e)
        {
            CodigoSistema = CodigoSistemaBase;
            ValidarUsuario();

            if (!IsPostBack)
            {
                var Roles = oTransUsuarioDatos.lRol;
                bool MonitoreoDeSistemas = false;

                if (Roles != null)
                {
                    if (this.ValidaRol(44))
                        MonitoreoDeSistemas = true;
                }

                if (MonitoreoDeSistemas)
                {
                    ValidaCapturaDeErrores();
                    divCapturaErrores.Visible = divCapturaBotones.Visible = true;
                }
                else
                {
                    divSinAcceso.Visible = true;
                }
            }
        }
        protected void ValidaCapturaDeErrores()
        {

            string Carpeta = WebConfigurationManager.AppSettings["DirectorioArchivosErrores"].ToString();
            string Ruta = Path.GetDirectoryName(Assembly.GetExecutingAssembly().GetName().CodeBase).Substring(6).Replace(@"\bin", "");
            bool Verificacion = true;

            var Configuracion = WebConfigurationManager.OpenWebConfiguration("~/Web.config");
            var Errores = ((CustomErrorsSection)Configuracion.GetSection("system.web/customErrors")).Errors;

            if (Carpeta.Substring(Carpeta.Length - 1, 1) == "\\")
                Carpeta = Carpeta.Remove(Carpeta.Length - 1);

            // Se valida que la ruta del Directorio de Errores en el Web.config esté correcta
            Verificacion = ValidaDirectorioDeErrores(Verificacion, Carpeta);

            // Se valida que el directorio exista en la ruta indicada
            Verificacion = ValidaExistenciaDirectorio(Verificacion, Carpeta);

            // Se valida que la aplicación pueda escribir en el directorio
            Verificacion = ValidaPermisosDirectorio(Verificacion, Carpeta);

            // Se valida que la captura de errores en el Web.config esté habilitada
            Verificacion = ValidaCapturaHabilitada(Verificacion);

            // Se valida que el pa página de redirección del error 404 sea correcta
            Verificacion = ValidaConfiguracionError404(Verificacion, Errores[0]);

            // Se valida que el pa página de redirección del error 500 sea correcta
            Verificacion = ValidaConfiguracionError500(Verificacion, Errores[1]);

            // Se valida la existencia del archivo Error404
            Verificacion = ValidaExistenciaError404(Verificacion, Ruta);

            // Se valida la existencia del archivo Error500
            Verificacion = ValidaExistenciaError500(Verificacion, Ruta);

            // Si todas las validaciones tienen éxito se habilitan los botones para la prueba de errores
            if (Verificacion)
            {
                lnkError404.Enabled = lnkError500.Enabled = true;
            }
            else
            {
                lnkError404.Enabled = lnkError500.Enabled = false;
                lnkError404.CssClass = lnkError500.CssClass = "btn btn-large btn-primary disabled";
            }
        }
        protected bool ValidaDirectorioDeErrores(bool Verificacion, string Carpeta)
        {
            string RutaDominio = MasterUD.Dominio();
            string Directorio = @"D:\AdjuntosDeSistemas\";

            if (Carpeta.ToLower() == (Directorio + RutaDominio.Replace("/", "")).ToLower())
            {
                txtRuta.Text = "La ruta " + Carpeta + " es correcta";
                txtRuta.Attributes.Add("class", "form-control form-control-sm is-valid");
                spnRuta.Attributes.Add("class", "input-group-text alert-success");
                emRuta.Attributes.Add("class", "fa fa-check");
            }
            else
            {
                txtRuta.Text = "La ruta debe ser " + Directorio + RutaDominio.Replace("/", "");
                txtRuta.Attributes.Add("class", "form-control form-control-sm is-invalid");
                spnRuta.Attributes.Add("class", "input-group-text alert-danger");
                emRuta.Attributes.Add("class", "far fa-times");

                Verificacion = false;
            }

            return Verificacion;
        }
        protected bool ValidaExistenciaDirectorio(bool Verificacion, string Carpeta)
        {
            if (Directory.Exists(Carpeta))
            {
                txtCarpeta.Text = "El directorio de Errores existe";

                txtCarpeta.Attributes.Add("class", "form-control form-control-sm is-valid");
                spnCarpeta.Attributes.Add("class", "input-group-text alert-success");
                emCarpeta.Attributes.Add("class", "fa fa-check");
            }
            else
            {
                txtCarpeta.Text = "No se pudo encontrar el Directorio de errores";

                txtCarpeta.Attributes.Add("class", "form-control form-control-sm is-invalid");
                spnCarpeta.Attributes.Add("class", "input-group-text alert-danger");
                emCarpeta.Attributes.Add("class", "far fa-times");

                Verificacion = false;
            }

            return Verificacion;
        }
        protected bool ValidaPermisosDirectorio(bool Verificacion, string Carpeta)
        {
            try
            {
                using (FileStream fs = File.Create(Path.Combine(Carpeta, "AccesoTemporal.txt"), 1, FileOptions.DeleteOnClose))
                {
                    fs.Close();
                    txtEscritura.Text = "Se tiene los permisos de escritura en el Directorio de Errores";

                    txtEscritura.Attributes.Add("class", "form-control form-control-sm is-valid");
                    spnEscritura.Attributes.Add("class", "input-group-text alert-success");
                    emEscritura.Attributes.Add("class", "fa fa-check");
                }
            }
#pragma warning disable CS0168 // La variable 'ex' se ha declarado pero nunca se usa
            catch (Exception ex)
#pragma warning restore CS0168 // La variable 'ex' se ha declarado pero nunca se usa
            {
                txtEscritura.Text = "No se pueden guardar archivos en el Directorio. Revise los permisos de escritura";

                txtEscritura.Attributes.Add("class", "form-control form-control-sm is-invalid");
                spnEscritura.Attributes.Add("class", "input-group-text alert-danger");
                emEscritura.Attributes.Add("class", "far fa-times");

                Verificacion = false;
            }

            return Verificacion;
        }
        protected bool ValidaCapturaHabilitada(bool Verificacion)
        {
            bool CapturaErroresHabilitada = HttpContext.Current.IsCustomErrorEnabled;

            if (CapturaErroresHabilitada)
            {
                txtCapturaHabilitada.Text = "La captura de errores está habilitada";

                txtCapturaHabilitada.Attributes.Add("class", "form-control form-control-sm is-valid");
                spnCapturaHabilitada.Attributes.Add("class", "input-group-text alert-success");
                emCapturaHabilitada.Attributes.Add("class", "fa fa-check");
            }
            else
            {
                txtCapturaHabilitada.Text = "Debe habilitar la captura de errores en el Web.Config";

                txtCapturaHabilitada.Attributes.Add("class", "form-control form-control-sm is-invalid");
                spnCapturaHabilitada.Attributes.Add("class", "input-group-text alert-danger");
                emCapturaHabilitada.Attributes.Add("class", "far fa-times");

                Verificacion = false;
            }

            return Verificacion;
        }
        protected bool ValidaConfiguracionError404(bool Verificacion, CustomError Error404)
        {
            if (Error404.Redirect == "~/Error404.aspx" || Error404.Redirect == "Error404.aspx")
            {
                txtError404WC.Text = "El archivo Error404 está correctamente configurado";

                txtError404WC.Attributes.Add("class", "form-control form-control-sm is-valid");
                spnError404WC.Attributes.Add("class", "input-group-text alert-success");
                emError404WC.Attributes.Add("class", "fa fa-check");
            }
            else
            {
                txtError404WC.Text = "La redirección en el Web.config debe ser ~/Error404.aspx";

                txtError404WC.Attributes.Add("class", "form-control form-control-sm is-invalid");
                spnError404WC.Attributes.Add("class", "input-group-text alert-danger");
                emError404WC.Attributes.Add("class", "far fa-times");

                Verificacion = false;
            }

            return Verificacion;
        }
        protected bool ValidaConfiguracionError500(bool Verificacion, CustomError Error500)
        {
            if (Error500.Redirect == "~/Error500.aspx")
            {
                txtError500WC.Text = "El archivo Error500 está correctamente configurado";

                txtError500WC.Attributes.Add("class", "form-control form-control-sm is-valid");
                spnError500WC.Attributes.Add("class", "input-group-text alert-success");
                emError500WC.Attributes.Add("class", "fa fa-check");
            }
            else
            {
                txtError500WC.Text = "La redirección en el Web.config debe ser ~/Error500.aspx";

                txtError500WC.Attributes.Add("class", "form-control form-control-sm is-invalid");
                spnError500WC.Attributes.Add("class", "input-group-text alert-danger");
                emError500WC.Attributes.Add("class", "far fa-times");

                Verificacion = false;
            }

            return Verificacion;
        }
        protected bool ValidaExistenciaError404(bool Verificacion, string Ruta)
        {
            string Error404 = @"\Error404.aspx";

            if (File.Exists(Ruta + Error404))
            {
                txtError404.Text = "El archivo Error404 existe";

                txtError404.Attributes.Add("class", "form-control form-control-sm is-valid");
                spnError404.Attributes.Add("class", "input-group-text alert-success");
                emError404.Attributes.Add("class", "fa fa-check");
            }
            else
            {
                txtError404.Text = "No se pudo hallar el archivo Error404";

                txtError404.Attributes.Add("class", "form-control form-control-sm is-invalid");
                spnError404.Attributes.Add("class", "input-group-text alert-danger");
                emError404.Attributes.Add("class", "far fa-times");

                Verificacion = false;
            }

            return Verificacion;
        }
        protected bool ValidaExistenciaError500(bool Verificacion, string Ruta)
        {
            string Error500 = @"\Error500.aspx";

            if (File.Exists(Ruta + Error500))
            {
                txtError500.Text = "El archivo Error500 existe";

                txtError500.Attributes.Add("class", "form-control form-control-sm is-valid");
                spnError500.Attributes.Add("class", "input-group-text alert-success");
                emError500.Attributes.Add("class", "fa fa-check");
            }
            else
            {
                txtError500.Text = "No se pudo hallar el archivo Error500";

                txtError500.Attributes.Add("class", "form-control form-control-sm is-invalid");
                spnError500.Attributes.Add("class", "input-group-text alert-danger");
                emError500.Attributes.Add("class", "far fa-times");

                Verificacion = false;
            }

            return Verificacion;
        }

        protected void lnkError404_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PaginaInexistente.aspx");
        }
        protected void lnkError500_Click(object sender, EventArgs e)
        {
            int Numero = Convert.ToInt32("error");
        }
    }
}
