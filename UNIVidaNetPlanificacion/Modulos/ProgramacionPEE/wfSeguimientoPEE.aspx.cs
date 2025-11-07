using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using UNIVidaNetPlanificacion.Parametrizacion;

namespace UNIVidaNetPlanificacion.Modulos.ProgramacionPEE
{
    public partial class wfSeguimientoPEE : CWebFormGenerico
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidarUsuario();

            string usuarioAutenticado = Usuario;
            string usuarioSimulador = ObtenerNombreUsuarioSimulador();
            ConsoleLog($"Usuario autenticado en wfSeguimientoPEE: '{usuarioAutenticado}'");
            ConsoleLog($"Usuario del Simulador en wfSeguimientoPEE: '{usuarioSimulador}'");

            if (!IsPostBack)
            {
                // Verificar permisos de acceso - Solo Planificador y Encargado Responsable
                if (!CGestionPermisos.EsPlanificador() && !CGestionPermisos.EsEncargadoResponsable())
                {
                    SwalError("Acceso Denegado", "Solo el Planificador y Encargado Responsable pueden acceder a esta página.");
                    Response.Redirect("~/Default.aspx");
                    return;
                }

                // Obtener el número de registro de la URL
                string numeroRegistro = Request.QueryString["Registro"];

                if (!string.IsNullOrEmpty(numeroRegistro))
                {
                    // Cargar datos específicos del registro
                    CargarDatosSeguimiento(numeroRegistro);
                }
                else
                {
                    // Cargar datos por defecto si no hay parámetro
                    CargarDatosSeguimiento();
                }
            }
        }

        private void CargarDatosSeguimiento(string numeroRegistro = null)
        {
            // Datos de prueba basados en la imagen
            string datos = @"[
        {
            ""Perspectiva"": ""Clientes"",
            ""ObjetivoEstrategico"": ""OE 3. Modernizar la gestión empresarial en todos sus componentes."",
            ""AccionEstrategica"": ""AE.3.1. Transformar digitalmente los procesos empresariales de UNIVIDA S.A."",
            ""Resultado"": ""Procesos digitalizados"",
            ""LineaBase"": ""60% procesos digitalizados"",
            ""Indicador"": ""Número de procesos empresariales digitalizados/Número de procesos requeridos"",
            ""TipoEjecucion"": ""Programado"",
            ""Meta2026"": ""100%"",
            ""Meta2027"": ""100%"",
            ""Meta2028"": ""100%"",
            ""Meta2029"": ""100%"",
            ""Meta2030"": ""100%"",
            ""MetaFinal"": ""100% de los procesos empresariales requeridos digitalizados para los clientes internos y externos.""
        }
    ]";
            CargarJsonEnGridView(ref gvSeguimientoIndicadores, datos);
            if (!string.IsNullOrEmpty(numeroRegistro))
            {
                // Aquí puedes cargar datos específicos del registro
                // Por ejemplo, cambiar la unidad responsable según el registro
                txtUnidadResponsable.Text = $"GNTI - Registro {numeroRegistro}";
            }

        }
        protected void lnkVolver_Click(object sender, EventArgs e)
        {
            // Obtener la URL de retorno desde QueryString, si no existe usar página por defecto
            string returnUrl = Request.QueryString["returnUrl"];
            
            if (!string.IsNullOrEmpty(returnUrl))
            {
                // Decodificar la URL si está codificada
                returnUrl = System.Web.HttpUtility.UrlDecode(returnUrl);
                Response.Redirect(returnUrl);
            }
            else
            {
                // Página por defecto si no hay returnUrl
                Response.Redirect("~/Modulos/ProgramacionPEE/wfRegistrosPEE.aspx");
            }
        }

        protected void gvSeguimientoIndicadores_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "VerMetas")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                var dataKeys = gvSeguimientoIndicadores.DataKeys[index];
                string indicador = dataKeys["Indicador"]?.ToString() ?? string.Empty;

                LimpiarMetasModal();

                foreach (GridViewRow row in gvSeguimientoIndicadores.Rows)
                {
                    var rowKeys = gvSeguimientoIndicadores.DataKeys[row.RowIndex];
                    if (rowKeys == null)
                    {
                        continue;
                    }

                    string indicadorRow = rowKeys["Indicador"]?.ToString() ?? string.Empty;
                    if (!indicadorRow.Equals(indicador, StringComparison.OrdinalIgnoreCase))
                    {
                        continue;
                    }

                    string tipo = rowKeys["TipoEjecucion"]?.ToString() ?? string.Empty;
                    if (tipo.Equals("Programado", StringComparison.OrdinalIgnoreCase))
                    {
                        lblProgramadoMeta2026.Text = rowKeys["Meta2026"]?.ToString();
                        lblProgramadoMeta2027.Text = rowKeys["Meta2027"]?.ToString();
                        lblProgramadoMeta2028.Text = rowKeys["Meta2028"]?.ToString();
                        lblProgramadoMeta2029.Text = rowKeys["Meta2029"]?.ToString();
                        lblProgramadoMeta2030.Text = rowKeys["Meta2030"]?.ToString();
                    }
                    else if (tipo.Equals("Ejecutado", StringComparison.OrdinalIgnoreCase))
                    {
                        txtEjecutadoMeta2026.Text = rowKeys["Meta2026"]?.ToString();
                        txtEjecutadoMeta2027.Text = rowKeys["Meta2027"]?.ToString();
                        txtEjecutadoMeta2028.Text = rowKeys["Meta2028"]?.ToString();
                        txtEjecutadoMeta2029.Text = rowKeys["Meta2029"]?.ToString();
                        txtEjecutadoMeta2030.Text = rowKeys["Meta2030"]?.ToString();
                    }
                }

                ScriptManager.RegisterStartupScript(this, GetType(), "ShowMetasModal", "$('#modalMetas').modal('show');", true);
            }
            else if (e.CommandName == "VerMasInfo")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                var dataKeys = gvSeguimientoIndicadores.DataKeys[index];

                lblPerspectiva.Text = dataKeys["Perspectiva"]?.ToString();
                lblObjetivo.Text = dataKeys["ObjetivoEstrategico"]?.ToString();
                lblAccion.Text = dataKeys["AccionEstrategica"]?.ToString();
                lblResultado.Text = dataKeys["Resultado"]?.ToString();
                lblLineaBase.Text = dataKeys["LineaBase"]?.ToString();
                lblMetaGeneral.Text = dataKeys["MetaFinal"]?.ToString();

                ScriptManager.RegisterStartupScript(this, GetType(), "ShowMasInfoModal", "$('#modalMasInfo').modal('show');", true);
            }
        }

        private void LimpiarMetasModal()
        {
            lblProgramadoMeta2026.Text = string.Empty;
            lblProgramadoMeta2027.Text = string.Empty;
            lblProgramadoMeta2028.Text = string.Empty;
            lblProgramadoMeta2029.Text = string.Empty;
            lblProgramadoMeta2030.Text = string.Empty;

            txtEjecutadoMeta2026.Text = string.Empty;
            txtEjecutadoMeta2027.Text = string.Empty;
            txtEjecutadoMeta2028.Text = string.Empty;
            txtEjecutadoMeta2029.Text = string.Empty;
            txtEjecutadoMeta2030.Text = string.Empty;
        }

        private void ConsoleLog(string mensaje)
        {
            string mensajeSafe = mensaje.Replace("'", "\\'").Replace("\r", "").Replace("\n", " ");
            string script = "console.log('[SERVER] " + mensajeSafe + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "consoleLog" + Guid.NewGuid(), script, true);
        }

        private string ObtenerNombreUsuarioSimulador()
        {
            object nombre = Session[CVariableSesion.NombreUsuario];
            return nombre != null ? nombre.ToString() : string.Empty;
        }
    }
}