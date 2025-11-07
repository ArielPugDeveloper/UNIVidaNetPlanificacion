using AgenteServiciosPlanificacion.Modulos.ProgramacionPEE;
using AgenteServiciosPlanificacion.Modulos.ProgramacionPEE.ParametrosEntrada;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using UNIVidaNetPlanificacion.Parametrizacion;
using UVNetDTOs.DTOsGenericas.Resultado;

namespace UNIVidaNetPlanificacion.Modulos.ProgramacionPEE
{
    public partial class wfRegistrosPEE : CWebFormGenerico
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CodigoSistema = "070-001-001-001";
            if (!IsPostBack)
            {
                ValidarAccesoUsuario();
                CargarDatosPEE();
                
                // Configurar el UserControl del botón nuevo registro
                ucBotonNuevoRegistro.ConfigurarVisibilidad();
            }
            else
            {
                ValidarUsuario();
            }
        }

        private void CargarDatosPEE()
        {
            CPFAtTRegistroPeeListar oPFAtTRegistroPeeListar = new CPFAtTRegistroPeeListar()
            {
                UsuarioAut = Usuario,
                CodigoSistema = CodigoSistema
            };

            CResultadoJsonDocument oResultadoJsonDocumentRegistro = CAgenteProgramacionPEE.FAtTRegistroPeeListar(oPFAtTRegistroPeeListar);
            if (oResultadoJsonDocumentRegistro.Exito)
            {
                ConsoleLog("JSON de BD: " + oResultadoJsonDocumentRegistro.Resultado);
                CargarJsonEnGridView(ref gvRegistrosPEE, oResultadoJsonDocumentRegistro.Resultado);
            }
            else
            {
                SwalAtencion(oResultadoJsonDocumentRegistro.Mensaje);
            }
        }

        protected void gvRegistrosPEE_PageIndexChanging(object sender, System.Web.UI.WebControls.GridViewPageEventArgs e)
        {
            gvRegistrosPEE.PageIndex = e.NewPageIndex;
            CargarDatosPEE();
        }

        protected void gvRegistrosPEE_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == System.Web.UI.WebControls.DataControlRowType.DataRow)
            {
                var ucOpciones = e.Row.FindControl("ucOpcionesRegistrosPEE") as ucOpcionesRegistrosPEE;
                if (ucOpciones != null)
                {
                    ucOpciones.ConfigurarOpcionesSegunRol();
                }
            }
        }

        private void ConsoleLog(string mensaje)
        {
            string mensajeSafe = mensaje.Replace("'", "\\'").Replace("\r", "").Replace("\n", " ");
            string script = "console.log('[SERVER] " + mensajeSafe + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "consoleLog" + Guid.NewGuid(), script, true);
        }
    }
}