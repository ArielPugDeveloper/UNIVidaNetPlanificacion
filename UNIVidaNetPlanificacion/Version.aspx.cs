
using AgenteServiciosPlanificacion.Modulos.Parametricas;
using AgenteServiciosPlanificacion.Modulos.Parametricas.ParametrosEntrada;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web.UI.WebControls;


using UVNetTransversal.ProgramacionFront.Web.WebForm;
using UVNetUtilitarios.Serealizacion;

namespace UNIVidaNetPlanificacion
{
    public partial class Version : CBWebFormGenerico
    {
        private CFAtParDllUnividaL[] aFAtParDllUnividaL;
        private readonly string NombreProyecto = Assembly.GetExecutingAssembly().GetName().Name;

        protected void Page_Load(object sender, EventArgs e)
        {
            CodigoSistema = ConfigurationManager.AppSettings["CodigoSistema"];
            ValidarUsuario();
            if (!IsPostBack)
            {
                var Roles = oTransUsuarioDatos.lRol;
                bool MonitoreoDeSistemas = false;
                if (Roles != null)
                {
                    foreach (var Rol in Roles)
                    {
                        if (Rol.RolId == 44)
                        {
                            MonitoreoDeSistemas = true;
                            break;
                        }
                    }
                }

                if (MonitoreoDeSistemas)
                {
                    ObtenerListadoDllsUnivida();
                    var informacionDlls = ObtenerInformacionDlls();
                    CargarJsonEnGridView(ref gvVersiones, CSerealizacion.ObjetoEnJson(informacionDlls));

                    divVersiones.Visible = true;
                }
                else
                {
                    divSinAcceso.Visible = true;
                }
            }
        }

        private void ObtenerListadoDllsUnivida()
        {
            var oResultadoJsonDocument = CAgenteParametricas.FAtParDllUnividaL(new CPFAtParDllUnividaL(CodigoSistema, Usuario));
            aFAtParDllUnividaL = oResultadoJsonDocument.Exito ? CSerealizacion.JsonEnObjeto<CFAtParDllUnividaL[]>(oResultadoJsonDocument.Resultado) : new CFAtParDllUnividaL[10];
        }

        private List<CDll> ObtenerInformacionDlls()
        {
            string rutaEjecucion = Path.GetDirectoryName(Assembly.GetExecutingAssembly().GetName().CodeBase).Substring(6);
            string[] rutasArchivosDll = Directory.GetFiles(rutaEjecucion, "*.dll", SearchOption.TopDirectoryOnly);
            var informacionDlls = new List<CDll>();
            foreach (string rutaArchivoDll in rutasArchivosDll)
            {
                informacionDlls.Add(ObtenerInformacionDll(rutaArchivoDll));
            }
            return informacionDlls.OrderBy(x => x.Orden).ToList();
        }

        private CDll ObtenerInformacionDll(string rutaArchivo)
        {
            var archivoDll = Assembly.LoadFrom(rutaArchivo);
            return new CDll
            {
                Nombre = archivoDll.GetName().Name,
                Version = archivoDll.GetName().Version.ToString(),
                Autor = FileVersionInfo.GetVersionInfo(rutaArchivo).CompanyName,
                Fecha = File.GetLastWriteTime(rutaArchivo).ToString(),
                Orden = DeterminarOrdenSegunTipoDll(archivoDll.GetName().Name)
            };
        }

        private int DeterminarOrdenSegunTipoDll(string nombreDll)
        {
            if (nombreDll == NombreProyecto)
            {
                return 1;
            }
            if (nombreDll.Contains("Agente"))
            {
                return 2;
            }
            if (Array.Exists(aFAtParDllUnividaL, x => x.NombreDll == nombreDll))
            {
                return 3;
            }
            return 4;
        }

        protected void gvVersiones_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int orden = Convert.ToInt32(gvVersiones.DataKeys[e.Row.RowIndex].Values["Orden"]);
                if (orden == 1)
                {
                    e.Row.BackColor = ColorTranslator.FromHtml("#F0FFE1");
                }
                if (orden == 2 || orden == 3)
                {
                    e.Row.BackColor = ColorTranslator.FromHtml("#E8FCFF");
                }
            }
        }
    }

    public class CDll
    {
        public string Nombre { get; set; }

        public string Version { get; set; }

        public string Autor { get; set; }

        public string Fecha { get; set; }

        public int Orden { get; set; }
    }
}