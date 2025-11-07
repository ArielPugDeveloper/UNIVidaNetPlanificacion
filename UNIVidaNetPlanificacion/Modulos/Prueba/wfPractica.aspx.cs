using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using AgenteServiciosSISTEMA_PEE_POA.Modulos.Parametricas;
using AgenteServiciosSISTEMA_PEE_POA.Modulos.Parametricas.ParametrosEntrada;
using System.Configuration;
using UNIVidaNetSISTEMA_PEE_POA.Parametrizacion;
using UVNetDTOs.DTOsGenericas.Resultado;

namespace UNIVidaNetSISTEMA_PEE_POA.Modulos.Prueba
{
    public partial class wfPractica : CWebFormGenerico
    {
        public string CodigoSistemaBase = ConfigurationManager.AppSettings["CodigoSistema"];
        protected void Page_Load(object sender, EventArgs e)
        {
            CodigoSistema = CodigoSistemaBase;
            if (!IsPostBack)
            {
                base.ValidarUsuario();
                CargarDescripcionSistema();
            }
            else
            {
                base.ValidarUsuario();
            }
        }

        public void CargarDescripcionSistema()
        {
            var oPDescripcionSistemaO = new CPDescripcionSistemaO
            {
                UsuarioAut = Usuario,
                CodigoSistema = CodigoSistemaBase,
                SistemaFk = "001"  // Código del sistema que queremos consultar
            };

            var cResultadoString = CAgenteParametricas.DescripcionSistemaO(oPDescripcionSistemaO);

            if (cResultadoString.Exito)
            {
                lblDescripcion.Text = cResultadoString.Resultado;
                SwalCorrecto("Descripción cargada correctamente");
            }
            else
            {
                lblDescripcion.Text = cResultadoString.Mensaje;
                SwalError("Error al cargar la descripción: " + cResultadoString.Mensaje);
            }
        }
        
        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            try
            {
                // Validar que se ingresó un código
                if (string.IsNullOrWhiteSpace(txtCodigoSistema.Text))
                {
                    SwalAtencion("Por favor ingrese un código de sistema");
                    return;
                }

                // Crear objeto de parámetros
                var oPDescripcionSistemaO = new CPDescripcionSistemaO
                {
                    UsuarioAut = Usuario,
                    CodigoSistema = CodigoSistemaBase,
                    SistemaFk = txtCodigoSistema.Text.Trim()
                };

                // Llamar a la función
                var cResultadoString = CAgenteParametricas.DescripcionSistemaO(oPDescripcionSistemaO);

                // Verificar resultado
                if (cResultadoString.Exito)
                {
                    lblDescripcion.Text = cResultadoString.Resultado;
                    SwalCorrecto("Descripción cargada correctamente");
                }
                else
                {
                    lblDescripcion.Text = cResultadoString.Mensaje;
                    SwalError("Error al cargar la descripción: " + cResultadoString.Mensaje);
                }
            }
            catch (Exception ex)
            {
                lblDescripcion.Text = "Error: " + ex.Message;
                SwalError("Error inesperado: " + ex.Message);
            }
        }
    }
}