using System;
using System.Web;
using UNIVidaNetPlanificacion.Parametrizacion;

namespace UNIVidaNetPlanificacion.Modulos.SimulacionUsuarios
{
    public partial class ucSeleccionarUsuario : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Verificar si ya hay un usuario simulado
                //if (Session[CVariableSesion.RolUsuario] != null)
                //{
                //    string rolActual = Session[CVariableSesion.RolUsuario].ToString();
                //    string nombreUsuario = Session[CVariableSesion.NombreUsuario]?.ToString();
                    
                //    SwalCorrecto("Usuario Actual", $"Ya tienes una sesión activa como: {nombreUsuario} ({rolActual})");
                //}
            }
        }

        protected void btnPlanificador_Click(object sender, EventArgs e)
        {
            SimularUsuario("Planificador", "Juan Carlos Planificador", "PLANIFICADOR");
        }

        protected void btnEncargado1_Click(object sender, EventArgs e)
        {
            SimularUsuario("EncargadoResponsable", "GNTI", "ENCARGADO_GNTI");
        }

        protected void btnEncargado2_Click(object sender, EventArgs e)
        {
            SimularUsuario("EncargadoResponsable", "GNC", "ENCARGADO_GNC");
        }

        protected void btnDependiente1_Click(object sender, EventArgs e)
        {
            SimularUsuario("Dependiente", "JNDS", "DEPENDIENTE_GNTI");
        }

        protected void btnDependiente2_Click(object sender, EventArgs e)
        {
            SimularUsuario("Dependiente", "JNIR", "DEPENDIENTE_GNTI");
        }

        protected void btnDependiente3_Click(object sender, EventArgs e)
        {
            SimularUsuario("Dependiente", "JNV", "DEPENDIENTE_GNC");
        }

        protected void btnDependiente4_Click(object sender, EventArgs e)
        {
            SimularUsuario("Dependiente", "JNMR", "DEPENDIENTE_GNC");
        }

        private void SimularUsuario(string rol, string nombre, string codigo)
        {
            // Guardar datos del usuario en sesión
            Session[CVariableSesion.RolUsuario] = rol;
            Session[CVariableSesion.NombreUsuario] = nombre;
            Session[CVariableSesion.CodigoUsuario] = codigo;
            Session[CVariableSesion.AreaUsuario] = ObtenerArea(rol, codigo);

            // Redirigir según el rol del usuario
            if (rol == CVariableSesion.RolPlanificador)
            {
                // Planificador va a wfRegistrosPEE
                Response.Redirect("~/Modulos/ProgramacionPEE/wfRegistrosPEE.aspx", false);
            }
            else if (rol == CVariableSesion.RolEncargadoResponsable || rol == CVariableSesion.RolDependiente)
            {
                // Encargado Responsable y Dependiente van a wfInicio
                Response.Redirect("~/Modulos/ProgramacionPEE/wfInicio.aspx", false);
            }
            else
            {
                // Por defecto ir a Default.aspx
                Response.Redirect("~/Default.aspx", false);
            }
        }

        private string ObtenerArea(string rol, string codigo)
        {
            switch (codigo)
            {
                case "PLANIFICADOR":
                    return "TODAS";
                case "ENCARGADO_GNTI":
                    return "AREA_GNTI";
                case "ENCARGADO_GNC":
                    return "AREA_GNC";
                case "DEPENDIENTE_GNTI":
                    return "AREA_GNTI";
                case "DEPENDIENTE_GNC":
                    return "AREA_GNC";
                default:
                    return "SIN_AREA";
            }
        }
    }
}