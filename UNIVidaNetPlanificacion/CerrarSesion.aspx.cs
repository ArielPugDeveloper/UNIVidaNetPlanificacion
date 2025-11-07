using System;
using System.Web.Security;
using UNIVidaNetPlanificacion.Parametrizacion;
using UVNetTransversal.ProgramacionFront.Web.WebForm;

namespace UNIVidaNetPlanificacion
{
    public partial class CerrarSesion : System.Web.UI.Page
    {
        public static string RutaDominio = MasterUD.Dominio();
        protected void Page_Load(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Session.Abandon();
            Response.Redirect(RutaDominio + "/Autenticar");
        }
    }
}