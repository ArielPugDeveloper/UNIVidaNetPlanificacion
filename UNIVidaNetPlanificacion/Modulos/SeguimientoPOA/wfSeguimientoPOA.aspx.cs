using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using UNIVidaNetPlanificacion.Parametrizacion;

namespace UNIVidaNetPlanificacion.Modulos.SeguimientoPOA
{
    public partial class wfSeguimientoPOA : CWebFormGenerico
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Verificar permisos de acceso - Solo Dependiente
                if (!CGestionPermisos.EsDependiente())
                {
                    SwalError("Acceso Denegado", "Solo el Dependiente puede acceder a esta página.");
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
                    ""Indicador"": ""Número de procesos empresariales digitalizados/Número de procesos requeridos"",
                    ""Ponderacion"": ""10%"",
                    ""ObjetivoGestion"": ""Promover el mejoramiento continuo de la tecnología, la innovación y el funcionamiento óptimo de los sistemas informáticos de UNIVIDA S.A."",
                    ""IndicadorGestion"": ""(Cantidad de ramos habilitados integrados al CORE / cantidad de ramos habilitados)*100"",
                    ""ResultadosEsperados"": ""Implementar al 100% los Seguros de Salud al Core de Seguros de UNIVIDA"",
                    ""AccionesGestion"": ""Implementación al 100% de una plataforma de seguimiento de Siniestros SOAT en UNIVidaApp"",
                    ""IndicadorProducto"": ""Se ha implementado el sistema de gestión de Seguros de Salud en el Sistema CORE de UNIVIDA, como parte del mejoramiento continuo de las operaciones de La Empresa."",
                    ""ResponsablePOA"": ""GNTI"",
                    ""Estado"": ""APROBADO""
                },
                {
                    ""Id"": ""2"",
                    ""Indicador"": ""Número de procesos empresariales digitalizados/Número de procesos requeridos"",
                    ""Ponderacion"": ""0%"",
                    ""ObjetivoGestion"": ""Promover el mejoramiento continuo de la tecnología, la innovación y el funcionamiento óptimo de los sistemas informáticos de UNIVIDA S.A."",
                    ""IndicadorGestion"": ""(Cantidad de ramos habilitados integrados al CORE / cantidad de ramos habilitados)*100"",
                    ""ResultadosEsperados"": ""Implementar al 100% los Seguros de Salud al Core de Seguros de UNIVIDA"",
                    ""AccionesGestion"": ""Implementación al 100% de una plataforma de seguimiento de Siniestros SOAT en UNIVidaApp"",
                    ""IndicadorProducto"": ""Se ha implementado el sistema de gestión de Seguros de Salud en el Sistema CORE de UNIVIDA, como parte del mejoramiento continuo de las operaciones de La Empresa."",
                    ""ResponsablePOA"": ""JNDS"",
                    ""Estado"": ""VACIO""
                },
                {
                    ""Id"": ""3"",
                    ""Indicador"": ""Número de procesos empresariales digitalizados/Número de procesos requeridos"",
                    ""Ponderacion"": ""0%"",
                    ""ObjetivoGestion"": ""Promover el mejoramiento continuo de la tecnología, la innovación y el funcionamiento óptimo de los sistemas informáticos de UNIVIDA S.A."",
                    ""IndicadorGestion"": ""(Cantidad de ramos habilitados integrados al CORE / cantidad de ramos habilitados)*100"",
                    ""ResultadosEsperados"": ""Implementar al 100% los Seguros de Salud al Core de Seguros de UNIVIDA"",
                    ""AccionesGestion"": ""Implementación al 100% de una plataforma de seguimiento de Siniestros SOAT en UNIVidaApp"",
                    ""IndicadorProducto"": ""Se ha implementado el sistema de gestión de Seguros de Salud en el Sistema CORE de UNIVIDA, como parte del mejoramiento continuo de las operaciones de La Empresa."",
                    ""ResponsablePOA"": ""JNDS"",
                    ""Estado"": ""PENDIENTE""
                }
            ]";

            CargarJsonEnGridView(ref gvSeguimientoPOA, datos);
        }

        protected void gvSeguimientoPOA_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // Ya no necesitamos configurar UserControl ya que los botones están integrados directamente
        }

        protected void btnVerFicha_Click(object sender, EventArgs e)
        {
            // Lógica para ver ficha
            SwalAtencion("Función 'Ver Ficha' - En desarrollo");
        }

        protected void lnkVolver_Click(object sender, EventArgs e)
        {
            // Volver a la página anterior (Registros POA)
            Response.Redirect("~/Modulos/ProgramacionPOA/wfRegistrosPOA.aspx");
        }

        protected void btnGenerarSeguimientoPOAExcel_Click(object sender, EventArgs e)
        {
            // Lógica para generar seguimiento POA en Excel
            SwalCorrecto("Generando archivo de seguimiento POA en Excel...");
        }


        protected void btnEnviarRegistros_Click(object sender, EventArgs e)
        {
            // Lógica para enviar registros
            SwalCorrecto("Registros enviados correctamente.");
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string id = btn.CommandArgument;
            
            // Obtener la URL actual para el retorno
            string returnUrl = System.Web.HttpUtility.UrlEncode(Request.Url.PathAndQuery);
            
            // Redirigir a la página de Seguimiento Operativo
            Response.Redirect($"~/Modulos/SeguimientoPOA/wfSeguimientoOperativo.aspx?Id={id}&returnUrl={returnUrl}");
        }

        protected void btnDetalle_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string id = btn.CommandArgument;
            
            // Lógica para ver detalle
            SwalAtencion($"Mostrando detalle del elemento {id}.");
        }

    }
}