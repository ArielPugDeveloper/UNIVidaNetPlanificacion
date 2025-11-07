using System;
using System.Web.Security;
using UNIVidaNetPlanificacion.Parametrizacion;
using UVNetTransversal.ProgramacionFront.Web.WebForm;
using UVNetTransversal.Seguridad;
using UVNetTransversal.Seguridad.ClasesEntrada;
using UVNetTransversal.Seguridad.ClasesLogicas;
using UVNetTransversal.Seguridad.GestionAD;

namespace UNIVidaNetPlanificacion
{
    public partial class CambiarContrasena : System.Web.UI.Page
    {
        public static string RutaDominio = MasterUD.Dominio();
        protected void Page_Load(object sender, EventArgs e)
        {
            string vUsuario = "";
            CBUsuarios.ObtenerUsuarioDominio(ref vUsuario);
            txtUsuario.ReadOnly = true;
            txtUsuario.Text = vUsuario;
        }

        protected void btnCambiarContrasena_Click(object sender, EventArgs e)
        {
            if (txtContraseñaNuevaA.Text.Equals(txtContraseñaNuevaB.Text))
            {
                var oMaestroCredenciales = new CMaestroCredenciales(new CECredenciales { Usuario = txtUsuario.Text, Contrasenia = txtContraseña.Text }, txtContraseñaNuevaA.Text);
                var oResultadoString = CNSeguridad.CambiarContrasenia(oMaestroCredenciales);
                if (oResultadoString.Exito)
                {
                    FormsAuthentication.SignOut();
                    Response.Redirect("~/Default");
                }
                else
                {
                    lblMensaje.Text = oResultadoString.Mensaje;
                }
                divAlerta.Visible = !oResultadoString.Exito;
            }
            else
            {
                lblMensaje.Text = "Las contraseñas no coinciden.";
                divAlerta.Visible = true;
            }
        }
    }
}