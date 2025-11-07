using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using UNIVidaNetPlanificacion.Parametrizacion;
using Newtonsoft.Json;

namespace UNIVidaNetPlanificacion.Modulos.ProgramacionPOA
{
    public partial class wfReprogramacionSolicitudPOA : CWebFormGenerico
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
                    ""ObjetivoGestion"": ""Promover el mejoramiento continuo de la tecnología, la innovación y el funcionamiento óptimo de los sistemas informáticos de UNIVIDA S.A."",
                    ""IndicadorGestion"": ""(Cantidad de ramos habilitados integrados al CORE / cantidad de ramos habilitados)*100"",
                    ""ResultadosEsperados"": ""Implementar al 100% los Seguros de Salud al Core de Seguros de UNIVIDA"",
                    ""Ponderacion"": ""10%"",
                    ""AccionesGestion"": ""Implementación al 100% de una plataforma de seguimiento de Siniestros SOAT en UNIVidaApp"",
                    ""IndicadorProducto"": ""Se ha implementado el sistema de gestión de Seguros de Salud en el Sistema CORE de UNIVIDA, como parte del mejoramiento continuo de las operaciones de La Empresa."",
                    ""ResponsablePOA"": ""GNTI"",
                    ""Estado"": ""SOLICITA INHABILITACION""
                },
                {
                    ""Id"": ""2"",
                    ""Indicador"": ""Número de procesos empresariales digitalizados/Número de procesos requeridos"",
                    ""ObjetivoGestion"": ""Promover el mejoramiento continuo de la tecnología, la innovación y el funcionamiento óptimo de los sistemas informáticos de UNIVIDA S.A."",
                    ""IndicadorGestion"": ""(Cantidad de ramos habilitados integrados al CORE / cantidad de ramos habilitados)*100"",
                    ""ResultadosEsperados"": ""Implementar al 100% los Seguros de Salud al Core de Seguros de UNIVIDA"",
                    ""Ponderacion"": ""10%"",
                    ""AccionesGestion"": ""Implementación al 100% de una plataforma de seguimiento de Siniestros SOAT en UNIVidaApp"",
                    ""IndicadorProducto"": ""Se ha implementado el sistema de gestión de Seguros de Salud en el Sistema CORE de UNIVIDA, como parte del mejoramiento continuo de las operaciones de La Empresa."",
                    ""ResponsablePOA"": ""JNDS"",
                    ""Estado"": ""SOLICITA MODIFICACION PENDIENTE""
                },
                {
                    ""Id"": ""3"",
                    ""Indicador"": ""Número de procesos empresariales digitalizados/Número de procesos requeridos"",
                    ""ObjetivoGestion"": ""Promover el mejoramiento continuo de la tecnología, la innovación y el funcionamiento óptimo de los sistemas informáticos de UNIVIDA S.A."",
                    ""IndicadorGestion"": ""(Cantidad de ramos habilitados integrados al CORE / cantidad de ramos habilitados)*100"",
                    ""ResultadosEsperados"": ""Implementar al 100% los Seguros de Salud al Core de Seguros de UNIVIDA"",
                    ""Ponderacion"": ""10%"",
                    ""AccionesGestion"": ""Implementación al 100% de una plataforma de seguimiento de Siniestros SOAT en UNIVidaApp"",
                    ""IndicadorProducto"": ""Se ha implementado el sistema de gestión de Seguros de Salud en el Sistema CORE de UNIVIDA, como parte del mejoramiento continuo de las operaciones de La Empresa."",
                    ""ResponsablePOA"": ""JNDS"",
                    ""Estado"": ""SOLICITA MODIFICACION""
                }
            ]";

            gvReprogramacion.DataSource = JsonConvert.DeserializeObject<List<dynamic>>(datos);
            gvReprogramacion.DataBind();
        }

        protected void lnkVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Modulos/ProgramacionPOA/wfReprogramacionPOA.aspx");
        }

        protected void btnVerFicha_Click(object sender, EventArgs e)
        {
            SwalCorrecto("Ver Ficha", "Funcionalidad en desarrollo");
        }

        protected void btnEnviarSolicitudes_Click(object sender, EventArgs e)
        {
            SwalCorrecto("Enviar Solicitudes", "Las solicitudes han sido enviadas correctamente");
        }

        protected void gvReprogramacion_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // Ya no se necesita configurar UserControl
        }

        // Métodos de los botones de opciones del Dependiente
        protected void btnModificar_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string id = btn.CommandArgument;
            
            // Redirigir a la página de Ejecución
            Response.Redirect($"~/Modulos/ProgramacionPOA/wfEjecucion.aspx?Id={id}");
        }

        protected void btnDetalle_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string id = btn.CommandArgument;
            
            // Lógica para ver detalle
            SwalAtencion($"Mostrando detalle del elemento {id}.");
        }

        protected void btnInhabilitar_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string id = btn.CommandArgument;
            
            // Lógica para inhabilitar
            SwalAtencion($"Inhabilitando elemento {id}.");
        }
    }
}
