using AgenteServiciosPlanificacion.Modulos.Parametricas;
using AgenteServiciosPlanificacion.Modulos.Parametricas.EntidadSalida;
using AgenteServiciosPlanificacion.Modulos.Parametricas.ParametrosEntrada;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Web;
using UNIVidaNetPlanificacion.Parametrizacion;
using UVNetDTOs.DTOsGenericas.Resultado;
using UVNetTransversal.AgenteServicios.Seguridad.UsuariosInternos.EntidadesSalida;
using UVNetTransversal.ProgramacionFront.Web.WebForm;
using UVNetUtilitarios.Serealizacion;

namespace UNIVidaNetPlanificacion
{
    public partial class masterContacto : System.Web.UI.UserControl
    {
        public static string RutaDominio = MasterUD.Dominio();
        protected void Page_Load(object sender, EventArgs e)
        {
            MasterUD MU = new MasterUD();
            CTransUsuarioDatos datosUsuario = MU.Datos();
            this.ObtenerContactos(datosUsuario.EmpleadoUsuario, ConfigurationManager.AppSettings["CodigoSistema"]);
        }
        private void ObtenerContactos(string usuario, string codigoSistema)
        {
            if (Session[CVariableSesion.DatosContacto] == null)
            {
                CPUvParGenericaL oPUvParGenericaL = new CPUvParGenericaL();
                oPUvParGenericaL.UsuarioAut = usuario;
                oPUvParGenericaL.CodigoSistema = codigoSistema;
                oPUvParGenericaL.Agrupador = "CONTACTO";
                CResultadoJsonDocument oResultadoJsonDocument = CAgenteParametricas.UvParGenericaL(oPUvParGenericaL);
                string contactoHTML = "";
                if (oResultadoJsonDocument.Exito)
                {
                    List<CPUvParGenerica> uvPargenericas = CSerealizacion.JsonEnObjeto<List<CPUvParGenerica>>(oResultadoJsonDocument.Resultado);
                    foreach (CPUvParGenerica uvParGenerica in uvPargenericas)
                    {
                        String[] contacto = uvParGenerica.VALOR.Split('|');
                        contactoHTML += $@"
                         <div class=""row mt-3"">
                            <div class=""col-md-12 text-center bloque contacto2 "">
                                <div class=""nombre"">{uvParGenerica.TEXTO}</div>
                                <div class=""cargo"">{contacto[0]}</div>
                                <div class=""otros"">
                                    <a href=""mailto: {contacto[1]}"" > {contacto[1]}</a> | {contacto[2]}
                                </div>
                            </div>
                         </div>
                    ";
                    }
                }
                Session[CVariableSesion.DatosContacto] = contactoHTML.ToString();
            }

            divContactos.InnerHtml = Session[CVariableSesion.DatosContacto].ToString();
        }
    }
}