using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using UVNetTransversal.AgenteServicios.Seguridad.UsuariosInternos.EntidadesSalida;
using UVNetTransversal.ProgramacionFront.Web.WebForm;

namespace UNIVidaNetPlanificacion.Parametrizacion
{
    public class MasterUD : CBWebFormGenerico
    {
        public static string Dominio()
        {
            string Dom;
            string Url = HttpContext.Current.Request.Url.AbsolutePath;
            string[] Segmento = Url.Split('/');

            if (Segmento[1] == "Modulos" || Segmento[1] == "default" || Segmento[1] == "default.aspx")
            {
                Dom = "";
            }
            else
            {
                Dom = "/" + Segmento[1];
            }
            return Dom;
        }
        public CTransUsuarioDatos Datos()
        {
            CodigoSistema = ConfigurationManager.AppSettings["CodigoSistema"];
            base.ValidarUsuario();
            return oTransUsuarioDatos;
        }
        public static string ObtenerNombreCompleto()
        {
            var DatosUsuario = new MasterUD().Datos();
            return DatosUsuario.EmpleadoNombreCompleto;
        }
        public static string ObtenerNombres()
        {
            var DatosUsuario = new MasterUD().Datos();
            return DatosUsuario.EmpleadoNombrePrim + " " + DatosUsuario.EmpleadoNombreSeg;
        }
        public static string ObtenerApellidos()
        {
            var DatosUsuario = new MasterUD().Datos();
            return DatosUsuario.EmpleadoApPaterno + " " + DatosUsuario.EmpleadoApMaterno;
        }
        public static string ObtenerSucursal()
        {
            var DatosUsuario = new MasterUD().Datos();
            return DatosUsuario.SucursalNombre;
        }
    }
}