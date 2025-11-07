using System;
using System.Collections.Generic;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using UNIVidaNetPlanificacion.Parametrizacion;

namespace UNIVidaNetPlanificacion.Modulos.ProgramacionPOA
{
    public partial class wfProgramacionPOA : CWebFormGenerico
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
            // Estructura: 3 Ind × 2 OG × 1 IG × 3 RE = 18 registros
            Random random = new Random(42);
            
            string[] estados = {
                "SIN REGISTRAR", "REGISTRADO", "PENDIENTE", "DEVUELTO", "APROBADO"
            };

            // Datos realistas para Indicadores
            string[] indicadores = {
                "Número de procesos empresariales digitalizados/Número de procesos requeridos",
                "Índice de satisfacción del cliente interno/externo",
                "Porcentaje de cumplimiento de objetivos estratégicos"
            };

            // Datos realistas para Objetivos de Gestión
            string[,] objetivosGestion = {
                { "Promover el mejoramiento continuo de la tecnología, la innovación y el funcionamiento óptimo de los sistemas informáticos de UNIVIDA S.A.",
                  "Garantizar la disponibilidad y seguridad de la información empresarial mediante sistemas robustos y actualizados" },
                { "Incrementar la satisfacción del cliente mediante la mejora continua de los procesos de atención y servicio",
                  "Desarrollar estrategias de fidelización que fortalezcan la relación con los clientes actuales y potenciales" },
                { "Asegurar el cumplimiento de los objetivos estratégicos mediante el monitoreo y evaluación constante de indicadores clave",
                  "Implementar mecanismos de control y seguimiento que permitan la toma de decisiones oportunas y fundamentadas" }
            };

            // Datos realistas para Indicadores de Gestión
            string[,] indicadoresGestion = {
                { "(Cantidad de ramos habilitados integrados al CORE / cantidad de ramos habilitados)*100",
                  "(Número de incidentes de seguridad resueltos / Total de incidentes reportados)*100" },
                { "(Número de clientes satisfechos / Total de clientes encuestados)*100",
                  "(Tasa de retención de clientes / Total de clientes activos)*100" },
                { "(Objetivos estratégicos cumplidos / Total de objetivos planificados)*100",
                  "(Indicadores con valores dentro del rango esperado / Total de indicadores monitoreados)*100" }
            };

            // Datos realistas para Resultados Esperados
            string[,] resultadosEsperados = {
                { "Implementar al 100% los Seguros de Salud al Core de Seguros de UNIVIDA",
                  "Migrar el 80% de los procesos manuales a plataformas digitales durante el primer semestre",
                  "Reducir en un 30% el tiempo de respuesta en los procesos críticos de negocio" },
                { "Reducir el tiempo de atención al cliente en un 25% mediante la optimización de procesos",
                  "Alcanzar un índice de satisfacción superior al 90% en las encuestas trimestrales",
                  "Implementar un sistema de seguimiento de quejas que reduzca el tiempo de resolución en un 40%" },
                { "Cumplir con el 95% de los objetivos estratégicos establecidos para la gestión 2026",
                  "Establecer un sistema de alertas tempranas que identifique desviaciones mayores al 10%",
                  "Generar reportes ejecutivos mensuales con análisis de tendencias y recomendaciones estratégicas" }
            };

            StringBuilder jsonBuilder = new StringBuilder();
            jsonBuilder.Append("[");
            int id = 1;

            for (int ind = 0; ind < 3; ind++)
            {
                string indicador = indicadores[ind];

                for (int og = 0; og < 2; og++)
                {
                    string objetivoGestion = objetivosGestion[ind, og];
                    string indicadorGestion = indicadoresGestion[ind, og];

                    for (int re = 0; re < 3; re++)
                    {
                        string resultadoEsperado = resultadosEsperados[og, re];
                        string estado = estados[random.Next(estados.Length)];

                        if (id > 1)
                        {
                            jsonBuilder.Append(",");
                        }

                        jsonBuilder.AppendLine();
                        jsonBuilder.AppendLine("        {");
                        jsonBuilder.AppendLine($"            \"Id\": \"{id}\",");
                        jsonBuilder.AppendLine($"            \"Indicador\": \"{indicador}\",");
                        jsonBuilder.AppendLine($"            \"ObjetivoGestion\": \"{objetivoGestion}\",");
                        jsonBuilder.AppendLine($"            \"IndicadorGestion\": \"{indicadorGestion}\",");
                        jsonBuilder.AppendLine($"            \"ResultadosEsperados\": \"{resultadoEsperado}\",");
                        jsonBuilder.AppendLine($"            \"Estado\": \"{estado}\"");
                        jsonBuilder.Append("        }");

                        id++;
                    }
                }
            }

            jsonBuilder.AppendLine();
            jsonBuilder.Append("    ]");

            string datos = jsonBuilder.ToString();
            CargarJsonEnGridView(ref gvProgramacionPOA, datos);
        }

        protected void gvProgramacionPOA_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // Ya no se necesita configurar UserControl, el botón está directamente en el template
        }

        protected void btnVerFicha_Click(object sender, EventArgs e)
        {
            // Lógica para ver ficha
            SwalAtencion("Función 'Ver Ficha' - En desarrollo");
        }

        protected void btnAñadirRegistro_Click(object sender, EventArgs e)
        {
            // Lógica para añadir un nuevo registro
            SwalCorrecto("Añadir Registro", "Funcionalidad en desarrollo");
        }

        protected void btnGenerarPOAExcel_Click(object sender, EventArgs e)
        {
            // Lógica para generar POA en Excel
            SwalCorrecto("Generando archivo POA en Excel...");
        }

        protected void btnEnviarRegistros_Click(object sender, EventArgs e)
        {
            // Lógica para enviar registros
            SwalCorrecto("Registros enviados correctamente.");
        }


        protected void lnkVolver_Click(object sender, EventArgs e)
        {
            // Volver a la página anterior (Registros POA)
            Response.Redirect("~/Modulos/ProgramacionPOA/wfRegistrosPOA.aspx");
        }
    }
}