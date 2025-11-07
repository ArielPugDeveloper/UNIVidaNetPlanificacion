using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using UNIVidaNetPlanificacion.Parametrizacion;

namespace UNIVidaNetPlanificacion.Modulos.ProgramacionPEE
{
    public partial class ucOpcionesRegistrosPEE : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Lógica de inicialización si es necesaria
        }

        // Método público para configurar la visibilidad desde la página principal
        public void ConfigurarOpcionesSegunRol()
        {
            if (CGestionPermisos.EsPlanificador())
            {
                // Planificador ve todas las opciones
                phOpcionesCompletas.Visible = true;
                phOpcionesLimitadas.Visible = false;
            }
            else
            {
                // Encargado y Dependiente ven opciones limitadas
                phOpcionesCompletas.Visible = false;
                phOpcionesLimitadas.Visible = true;
            }
        }

        protected void lnkRegistrosPOA_Click(object sender, EventArgs e)
        {
            string numeroRegistro = ((LinkButton)sender).CommandArgument;
            Response.Redirect($"~/Modulos/ProgramacionPOA/wfRegistrosPOA.aspx?Registro={numeroRegistro}");
        }

        protected void lnkModificarPEE_Click(object sender, EventArgs e)
        {
            string commandArg = ((LinkButton)sender).CommandArgument;
            string[] parametros = commandArg.Split('|');
            
            string numeroRegistro = parametros[0];
            string gestionInicial = parametros.Length > 1 ? parametros[1] : "";
            string gestionFinal = parametros.Length > 2 ? parametros[2] : "";
            
            Response.Redirect($"~/Modulos/ProgramacionPEE/wfModificarPEE.aspx?Registro={numeroRegistro}&GestionInicial={gestionInicial}&GestionFinal={gestionFinal}");
        }

        protected void lnkSeguimientoPEE_Click(object sender, EventArgs e)
        {
            string numeroRegistro = ((LinkButton)sender).CommandArgument;
            Response.Redirect($"~/Modulos/ProgramacionPEE/wfSeguimientoPEE.aspx?Registro={numeroRegistro}");
        }
    }
}