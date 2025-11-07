using System;
using System.Web.Configuration;
using UVNetTransversal.ProgramacionFront.Web.WebForm;

namespace UNIVidaNetPlanificacion
{
    public partial class Error404 : CBErrorWebForm
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Mensaje = WebConfigurationManager.AppSettings["Transversal_MensajeError"].ToString() + RegistrarError();
            LblMensaje.Text = Mensaje.Replace("Código ", "Código <br />");
        }

    }
}