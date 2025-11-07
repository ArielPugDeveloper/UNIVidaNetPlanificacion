using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UNIVidaNetPlanificacion.Parametrizacion;

namespace UNIVidaNetPlanificacion.Modulos.ProgramacionPOA
{
    public partial class ucOpcionesRegistrosPOA : CWebControlGenerico
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
                // Planificador ve dropdown completo
                phOpcionesCompletas.Visible = true;
                phOpcionesLimitadas.Visible = false;
            }
            else
            {
                // Encargado y Dependiente ven 3 botones verticales
                phOpcionesCompletas.Visible = false;
                phOpcionesLimitadas.Visible = true;
            }
        }

        // Eventos del dropdown del Planificador
        protected void lnkModificarPOA_Click(object sender, EventArgs e)
        {
            string numeroRegistro = ((LinkButton)sender).CommandArgument;
            Response.Redirect($"~/Modulos/ProgramacionPOA/wfModificarPOA.aspx?Registro={numeroRegistro}");
        }

        protected void lnkRevisionPOA_Click(object sender, EventArgs e)
        {
            string numeroRegistro = ((LinkButton)sender).CommandArgument;
            Response.Redirect($"~/Modulos/ProgramacionPOA/wfRevisionPOA.aspx?Registro={numeroRegistro}");
        }


        protected void lnkInstruccionesSeguimiento_Click(object sender, EventArgs e)
        {
            string numeroRegistroPOA = ((LinkButton)sender).CommandArgument;
            string numeroRegistroPEE = ObtenerNumeroRegistroPEE();

            string url = "~/Modulos/SeguimientoPOA/wfInstrucciones.aspx";
            if (!string.IsNullOrEmpty(numeroRegistroPEE))
            {
                url += $"?Registro={numeroRegistroPEE}&RegistroPOA={numeroRegistroPOA}";
            }
            else
            {
                url += $"?RegistroPOA={numeroRegistroPOA}";
            }

            Response.Redirect(url);
        }

        private string ObtenerNumeroRegistroPEE()
        {
            var pagina = this.Page as wfRegistrosPOA;
            if (pagina != null)
            {
                return pagina.ObtenerNumeroRegistroPOA();
            }
            return string.Empty;
        }

        protected void lnkReprogramacionPOA_Click(object sender, EventArgs e)
        {
            string numeroRegistro = ((LinkButton)sender).CommandArgument;
            Response.Redirect($"~/Modulos/ProgramacionPOA/wfReprogramacionPOA.aspx?Registro={numeroRegistro}");
        }

        // Eventos de los botones para Encargado/Dependiente
        protected void lnkProgramacion_Click(object sender, EventArgs e)
        {
            string numeroRegistro = ((LinkButton)sender).CommandArgument;
            Response.Redirect($"~/Modulos/ProgramacionPOA/wfProgramacionPOA.aspx?Registro={numeroRegistro}");
        }

        protected void lnkSeguimiento_Click(object sender, EventArgs e)
        {
            string numeroRegistro = ((LinkButton)sender).CommandArgument;
            Response.Redirect($"~/Modulos/SeguimientoPOA/wfSeguimientoPOA.aspx?Registro={numeroRegistro}");
        }

        protected void lnkReprogramacion_Click(object sender, EventArgs e)
        {
            string numeroRegistro = ((LinkButton)sender).CommandArgument;
            Response.Redirect($"~/Modulos/ProgramacionPOA/wfReprogramacionSolicitudPOA.aspx?Registro={numeroRegistro}");
        }
    }
}