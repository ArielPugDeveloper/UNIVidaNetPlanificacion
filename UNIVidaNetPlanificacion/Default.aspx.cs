using AgenteServiciosPlanificacion.Modulos.Parametricas;
using AgenteServiciosPlanificacion.Modulos.Parametricas.ParametrosEntrada;
using System;
using System.Configuration;
using UNIVidaNetPlanificacion.Parametrizacion;
using UVNetDTOs.DTOsGenericas.Resultado;
using UVNetTransversal.ProgramacionFront.Web.WebForm;

namespace UNIVidaNetPlanificacion
{
    public partial class Default : CBWebFormGenerico
    {
        public static string RutaDominio = MasterUD.Dominio();
        public string CodigoSistemaBase = ConfigurationManager.AppSettings["CodigoSistema"];
        protected void Page_Load(object sender, EventArgs e)
        {
            CodigoSistema = CodigoSistemaBase;
            ///PRUEBA
            if (!IsPostBack)
            {
                base.ValidarUsuario();

                // Redirigir según el rol del usuario
                if (CGestionPermisos.EsPlanificador())
                {
                    // Planificador va a wfRegistrosPEE
                    Response.Redirect("~/Modulos/ProgramacionPEE/wfRegistrosPEE.aspx");
                    return;
                }
                else if (CGestionPermisos.EsEncargadoResponsable() || CGestionPermisos.EsDependiente())
                {
                    // Encargado Responsable y Dependiente van a wfInicio
                    Response.Redirect("~/Modulos/ProgramacionPEE/wfInicio.aspx");
                    return;
                }

                CargaDescripcion();
                CargaGrillaNoticias();
            }
            else
            {
                base.ValidarUsuario();
            }
        }


        public void CargaDescripcion()
        {
            var oPDescripcionSistemaO = new CPDescripcionSistemaO
            {
                UsuarioAut = Usuario,
                CodigoSistema = CodigoSistemaBase,
                SistemaFk = CodigoSistemaBase
            };
            var cResultadoString = CAgenteParametricas.DescripcionSistemaO(oPDescripcionSistemaO);
            if (cResultadoString.Exito)
            {
                lblDescripcion.Text = cResultadoString.Resultado;
            }
            else
            {
                lblDescripcion.Text = cResultadoString.Mensaje;
            }
        }

        public void CargaGrillaNoticias()
        {
            CPNoticiasL oPNoticiasL = new CPNoticiasL()
            {
                UsuarioAut = Usuario,
                CodigoSistema = CodigoSistemaBase
            };

            CResultadoJsonDocument cResultadoJson = CAgenteParametricas.NoticiasL(oPNoticiasL);

            if (cResultadoJson.Exito)
            {
                base.CargarJsonEnGridView(ref gvNoticias, cResultadoJson.Resultado);
                divMensajeNoticias.Visible = false;
            }
            else
            {
                divMensajeNoticias.Visible = true;
                lblMensajeNoticias.Text = cResultadoJson.Mensaje;
            }
        }
    }
}