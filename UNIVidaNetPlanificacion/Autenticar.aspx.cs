using System;
using System.Configuration;
using System.Web.Security;
using UNIVidaNetPlanificacion.Parametrizacion;
using UVNetDTOs.DTOsGenericas.Resultado;
using UVNetTransversal.ProgramacionFront.Web.WebForm;
using UVNetTransversal.Seguridad;
using UVNetTransversal.Seguridad.ClasesEntrada;
using UVNetTransversal.Seguridad.ClasesLogicas;

namespace UNIVidaNetPlanificacion
{
    public partial class Autenticar : System.Web.UI.Page
    {
        public static string RutaDominio = MasterUD.Dominio();
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLoginForm_Click(object sender, EventArgs e)
        {
            string vCodigoSistema = ConfigurationManager.AppSettings["CodigoSistema"];
            CMaestroCredenciales oMaestroCredenciales = new CMaestroCredenciales(new CECredenciales() { Usuario = txtUsuario.Text, Contrasenia = txtContraseña.Text }, vCodigoSistema);

            CResultadoString oResultadoString = CNSeguridad.Autenticacion(oMaestroCredenciales);

            if (oResultadoString.Exito)
            {
                FormsAuthentication.RedirectFromLoginPage(txtUsuario.Text, false);
            }
            else
            {
                lblMensaje.Text = oResultadoString.Mensaje;
            }
            divAlerta.Visible = !oResultadoString.Exito;
        }
    }
}