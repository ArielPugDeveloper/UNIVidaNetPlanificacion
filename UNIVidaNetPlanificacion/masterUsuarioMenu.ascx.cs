using System;
using System.DirectoryServices;
using System.IO;
using UNIVidaNetPlanificacion.Parametrizacion;
using UVNetTransversal.ProgramacionFront.Web.WebForm;

namespace UNIVidaNetPlanificacion
{
    public partial class masterUsuarioMenu : System.Web.UI.UserControl
    {
        public static string RutaDominio = MasterUD.Dominio();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                MasterUD MU = new MasterUD();
                var DatosUsuario = MU.Datos();
                empNombre.Text = MasterUD.ObtenerNombres();
                empApellido.Text = MasterUD.ObtenerApellidos();
                empCargo.Text = DatosUsuario.EmpleadoCargo;
                empSucursal.Text = "SUCURSAL " + MasterUD.ObtenerSucursal();
                ObtenerImagenUsuario(DatosUsuario.EmpleadoUsuario);
            }
            catch (Exception ex)
            {
                empNombre.Text = "Usuario NO Afiliado en";
                empApellido.Text = "Plataforma Informática";
            }
        }

        private void ObtenerImagenUsuario(string usuario)
        {
            var dominio = System.Net.NetworkInformation.IPGlobalProperties.GetIPGlobalProperties().DomainName;
            if (!string.IsNullOrEmpty(dominio))
            {
                usuario = usuario.Split('_')[0];
                var directoryEntry = new DirectoryEntry("LDAP://univida.bo");
                var directorySearcher = new DirectorySearcher(directoryEntry)
                {
                    Filter = string.Format("(&(SAMAccountName={0}))", usuario)
                };
                var datosUsuario = directorySearcher.FindOne();
                if (datosUsuario.Properties["thumbnailPhoto"].Count > 0)
                {
                    var bytes = datosUsuario.Properties["thumbnailPhoto"][0] as byte[];
                    using (var ms = new MemoryStream(bytes))
                    {
                        imagenUsuario.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(ms.ToArray(), 0, ms.ToArray().Length);
                    }
                }
            }
            else
            {
                imagenUsuario.ImageUrl = "Plugins/img/user2-160x160.jpg";
            }
        }
    }
}