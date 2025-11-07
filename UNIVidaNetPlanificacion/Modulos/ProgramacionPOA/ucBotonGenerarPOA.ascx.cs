using System;
using System.Web.UI;
using UNIVidaNetPlanificacion.Parametrizacion;

namespace UNIVidaNetPlanificacion.Modulos.ProgramacionPOA
{
    public partial class ucBotonGenerarPOA : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ConfigurarVisibilidad();
            }
        }

        public void ConfigurarVisibilidad()
        {
            phGenerarPOA.Visible = CGestionPermisos.EsPlanificador();
        }

        protected void lnkGenerarPOA_Click(object sender, EventArgs e)
        {
            // Obtener el número de registro desde la página padre (wfRegistrosPOA)
            var paginaPadre = this.Page as wfRegistrosPOA;
            string numeroRegistro = "";
            
            if (paginaPadre != null)
            {
                // Acceder a la propiedad pública de la página padre
                numeroRegistro = paginaPadre.ObtenerNumeroRegistroPOA();
            }
            
            // Redirigir con el parámetro si existe
            if (!string.IsNullOrEmpty(numeroRegistro))
            {
                Response.Redirect($"~/Modulos/ProgramacionPOA/wfNuevoPOA.aspx?Registro={numeroRegistro}");
            }
            else
            {
                Response.Redirect("~/Modulos/ProgramacionPOA/wfNuevoPOA.aspx");
            }
        }
    }
}