using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using UNIVidaNetPlanificacion.Parametrizacion;
using Newtonsoft.Json;

namespace UNIVidaNetPlanificacion.Modulos.ProgramacionPOA
{
    public partial class wfReprogramacionPOA : CWebFormGenerico
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Verificar permisos de acceso - Solo Planificador puede acceder
                if (!CGestionPermisos.EsPlanificador())
                {
                    SwalError("Acceso Denegado", "Solo el Planificador puede acceder a esta página.");
                    Response.Redirect("~/Default.aspx");
                    return;
                }

                CargarDatosPrueba();
            }
        }

        private void CargarDatosPrueba()
        {
            // Datos de prueba basados en la imagen
            string datos = @"[
                {
                    ""Id"": ""1"",
                    ""ObjetivoEstrategico"": """",
                    ""AccionEstrategica"": """",
                    ""Indicador"": """",
                    ""ObjetivoGestion"": ""Promover el mejoramiento continuo de la tecnología, la innovación y el funcionamiento óptimo de los sistemas informáticos de UNIVIDA S.A."",
                    ""Ponderacion"": ""10%"",
                    ""AccionesGestion"": ""Implementación al 100% de una plataforma de seguimiento de Siniestros SOAT en UNIVidaApp"",
                    ""IndicadoresProducto"": """",
                    ""Estado"": ""MODIFICACION APROBADA"",
                    ""ResponsablePOA"": ""GNTI"",
                    ""TipoFila"": ""Principal""
                },
                {
                    ""Id"": ""2"",
                    ""ObjetivoEstrategico"": """",
                    ""AccionEstrategica"": """",
                    ""Indicador"": """",
                    ""ObjetivoGestion"": """",
                    ""Ponderacion"": ""10%"",
                    ""AccionesGestion"": """",
                    ""IndicadoresProducto"": ""Implementación al 100% de una plataforma de seguimiento de Siniestros SOAT en UNIVidaApp"",
                    ""Estado"": ""MODIFICACION RECHAZADA"",
                    ""ResponsablePOA"": ""GNTI"",
                    ""TipoFila"": ""SubIndicador""
                },
                {
                    ""Id"": ""3"",
                    ""ObjetivoEstrategico"": """",
                    ""AccionEstrategica"": """",
                    ""Indicador"": """",
                    ""ObjetivoGestion"": ""Promover el mejoramiento continuo de la tecnología, la innovación y el funcionamiento óptimo de los sistemas informáticos de UNIVIDA S.A."",
                    ""Ponderacion"": ""10%"",
                    ""AccionesGestion"": ""Implementación al 100% de una plataforma de seguimiento de Siniestros SOAT en UNIVidaApp"",
                    ""IndicadoresProducto"": """",
                    ""Estado"": ""INHABILITACION APROBADA"",
                    ""ResponsablePOA"": ""GNTI"",
                    ""TipoFila"": ""Principal""
                },
                {
                    ""Id"": ""4"",
                    ""ObjetivoEstrategico"": """",
                    ""AccionEstrategica"": """",
                    ""Indicador"": """",
                    ""ObjetivoGestion"": """",
                    ""Ponderacion"": ""10%"",
                    ""AccionesGestion"": """",
                    ""IndicadoresProducto"": ""Implementación al 100% de una plataforma de seguimiento de Siniestros SOAT en UNIVidaApp"",
                    ""Estado"": ""INHABILITACION RECHAZADA"",
                    ""ResponsablePOA"": ""GNTI"",
                    ""TipoFila"": ""SubIndicador""
                },
                {
                    ""Id"": ""5"",
                    ""ObjetivoEstrategico"": """",
                    ""AccionEstrategica"": """",
                    ""Indicador"": """",
                    ""ObjetivoGestion"": ""Promover el mejoramiento continuo de la tecnología, la innovación y el funcionamiento óptimo de los sistemas informáticos de UNIVIDA S.A."",
                    ""Ponderacion"": ""10%"",
                    ""AccionesGestion"": ""Implementación al 100% de una plataforma de seguimiento de Siniestros SOAT en UNIVidaApp"",
                    ""IndicadoresProducto"": """",
                    ""Estado"": ""SOLICITA MODIFICACION"",
                    ""ResponsablePOA"": ""GNC"",
                    ""TipoFila"": ""Principal""
                },
                {
                    ""Id"": ""6"",
                    ""ObjetivoEstrategico"": """",
                    ""AccionEstrategica"": """",
                    ""Indicador"": """",
                    ""ObjetivoGestion"": """",
                    ""Ponderacion"": ""10%"",
                    ""AccionesGestion"": """",
                    ""IndicadoresProducto"": ""Implementación al 100% de una plataforma de seguimiento de Siniestros SOAT en UNIVidaApp"",
                    ""Estado"": ""SOLICITA INHABILITACION"",
                    ""ResponsablePOA"": ""GNC"",
                    ""TipoFila"": ""SubIndicador""
                }
            ]";

            gvReprogramacionPOA.DataSource = JsonConvert.DeserializeObject<List<dynamic>>(datos);
            gvReprogramacionPOA.DataBind();
        }

        protected void gvReprogramacionPOA_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // Este método puede quedar vacío o eliminarse si no se necesita lógica adicional
        }

        protected void lnkVolver_Click(object sender, EventArgs e)
        {
            // Volver a la página anterior (Registros POA)
            Response.Redirect("~/Modulos/ProgramacionPOA/wfRegistrosPOA.aspx");
        }

        // Método del botón Revisar
        protected void btnRevisar_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string id = btn.CommandArgument;
            
            // Lógica para revisar
            SwalAtencion($"Revisando elemento ID {id}.");
        }

        protected void btnHabilitar_Click(object sender, EventArgs e)
        {
            // Lógica para habilitar reprogramación
            SwalCorrecto("Habilitado", "La reprogramación ha sido habilitada correctamente.");
        }
    }
}