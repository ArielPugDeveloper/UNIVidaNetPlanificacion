using System;
using System.Web.UI;
using UNIVidaNetPlanificacion.Parametrizacion;

namespace UNIVidaNetPlanificacion.Modulos.ProgramacionPEE
{
    public partial class wfInicio : CWebFormGenerico
    {
        private string UsuarioSimulado
        {
            get
            {
                if (ViewState["UsuarioSimulado"] != null)
                    return ViewState["UsuarioSimulado"].ToString();
                return string.Empty;
            }
            set
            {
                ViewState["UsuarioSimulado"] = value;
            }
        }

        private string NombreUsuarioSimulador
        {
            get
            {
                if (ViewState["NombreUsuarioSimulador"] != null)
                    return ViewState["NombreUsuarioSimulador"].ToString();
                return string.Empty;
            }
            set
            {
                ViewState["NombreUsuarioSimulador"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidarUsuario();

            if (!IsPostBack)
            {
                // Verificar permisos de acceso - Solo Encargado Responsable y Dependiente
                if (!CGestionPermisos.EsEncargadoResponsable() && !CGestionPermisos.EsDependiente())
                {
                    SwalError("Acceso Denegado", "Solo el Encargado Responsable y Dependiente pueden acceder a esta página.");
                    Response.Redirect("~/Default.aspx");
                    return;
                }

                UsuarioSimulado = Usuario;
                ConsoleLog($"Usuario autenticado en wfInicio: '{UsuarioSimulado}'");

                NombreUsuarioSimulador = ObtenerNombreUsuarioSimulador();
                ConsoleLog($"Usuario del Simulador en wfInicio: '{NombreUsuarioSimulador}'");
            }
            else
            {
                UsuarioSimulado = Usuario;
                NombreUsuarioSimulador = ObtenerNombreUsuarioSimulador();
                ConsoleLog($"Usuario autenticado en wfInicio (PostBack): '{UsuarioSimulado}'");
                ConsoleLog($"Usuario del Simulador en wfInicio (PostBack): '{NombreUsuarioSimulador}'");
            }
        }

        protected void btnProgramacionPOA_Click(object sender, EventArgs e)
        {
            // Redirigir según el rol del usuario
            if (CGestionPermisos.EsEncargadoResponsable())
            {
                // Encargado Responsable va a wfProgramacionEncargadoPOA
                Response.Redirect("~/Modulos/ProgramacionPOA/wfProgramacionEncargadoPOA.aspx");
            }
            else if (CGestionPermisos.EsDependiente())
            {
                // Dependiente va a wfProgramacionPOA
                Response.Redirect("~/Modulos/ProgramacionPOA/wfProgramacionPOA.aspx");
            }
        }

        protected void btnSeguimientoPOA_Click(object sender, EventArgs e)
        {
            // Redirigir según el rol del usuario
            if (CGestionPermisos.EsEncargadoResponsable())
            {
                // Encargado Responsable va a wfSeguimientoEncargadoPOA
                Response.Redirect("~/Modulos/SeguimientoPOA/wfSeguimientoEncargadoPOA.aspx");
            }
            else if (CGestionPermisos.EsDependiente())
            {
                // Dependiente va a wfSeguimientoPOA
                Response.Redirect("~/Modulos/SeguimientoPOA/wfSeguimientoPOA.aspx");
            }
        }

        protected void btnSeguimientoPEE_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Modulos/ProgramacionPEE/wfSeguimientoPEE.aspx");
        }

        protected void btnReprogramacionPOA_Click(object sender, EventArgs e)
        {
            // Redirigir según el rol del usuario
            if (CGestionPermisos.EsEncargadoResponsable())
            {
                // Encargado Responsable va a wfReprogramacionEncargadoSolicitudPOA
                Response.Redirect("~/Modulos/ProgramacionPOA/wfReprogramacionEncargadoSolicitudPOA.aspx");
            }
            else if (CGestionPermisos.EsDependiente())
            {
                // Dependiente va a wfReprogramacionSolicitudPOA
                Response.Redirect("~/Modulos/ProgramacionPOA/wfReprogramacionSolicitudPOA.aspx");
            }
        }

        protected void btnVerTodosRegistros_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Modulos/ProgramacionPEE/wfRegistrosPEE.aspx");
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
