using System;
using System.Collections.Generic;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using UNIVidaNetPlanificacion.Parametrizacion;

namespace UNIVidaNetPlanificacion.Modulos.ProgramacionPOA
{
    public partial class wfRevisionPOA : CWebFormGenerico
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Verificar permisos de acceso
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
            // Estructura: 2 OE × 3 AE × 2 Ind × 2 OG × 2 RG × 2 AG = 96 registros
            Random random = new Random(42);
            string[] objetivosEstrategicos = {
                "OE 01. Incrementar la satisfacción del cliente",
                "OE 02. Mejorar la eficiencia operativa"
            };

            string[] responsables = {
                "GNTI", "GNC", "JNIR", "JNDS", "JNV", "JNMR"
            };

            string[] estados = {
                "PRESENTADO", "EN ELABORACION", "COMPLETADO", "RETRASADO"
            };

            StringBuilder jsonBuilder = new StringBuilder();
            jsonBuilder.Append("[");
            int id = 1;

            for (int oe = 1; oe <= 2; oe++)
            {
                string objetivoEstrategico = objetivosEstrategicos[oe - 1];

                for (int ae = 1; ae <= 3; ae++)
                {
                    string accionEstrategica = $"AE {oe}.{ae}. Acción estratégica {ae} del objetivo {oe}";

                    for (int ind = 1; ind <= 2; ind++)
                    {
                        string indicador = $"Indicador {oe}.{ae}.{ind}";

                        for (int og = 1; og <= 2; og++)
                        {
                            string objetivoGestion = $"OG {oe}.{ae}.{ind}.{og}. Objetivo de gestión {og}";

                            for (int rg = 1; rg <= 2; rg++)
                            {
                                string resultadoGestion = $"RG {oe}.{ae}.{ind}.{og}.{rg}. Resultado de gestión {rg}";

                                for (int ag = 1; ag <= 2; ag++)
                                {
                                    string accionGestion = $"AG {oe}.{ae}.{ind}.{og}.{rg}.{ag}. Acción de gestión {ag}";
                                    string responsable = responsables[random.Next(responsables.Length)];
                                    string estado = estados[random.Next(estados.Length)];

                                    if (id > 1)
                                    {
                                        jsonBuilder.Append(",");
                                    }

                                    jsonBuilder.AppendLine();
                                    jsonBuilder.AppendLine("        {");
                                    jsonBuilder.AppendLine($"            \"Id\": \"{id}\",");
                                    jsonBuilder.AppendLine($"            \"ObjetivosEstrategicos\": \"{objetivoEstrategico}\",");
                                    jsonBuilder.AppendLine($"            \"AccionEstrategica\": \"{accionEstrategica}\",");
                                    jsonBuilder.AppendLine($"            \"Indicador\": \"{indicador}\",");
                                    jsonBuilder.AppendLine($"            \"ObjetivoGestion\": \"{objetivoGestion}\",");
                                    jsonBuilder.AppendLine($"            \"IndicadorGestion\": \"{resultadoGestion}\",");
                                    jsonBuilder.AppendLine($"            \"AccionGestion\": \"{accionGestion}\",");
                                    jsonBuilder.AppendLine($"            \"Responsable\": \"{responsable}\",");
                                    jsonBuilder.AppendLine($"            \"FechaUltimaObservacion\": \"26/09/2025\",");
                                    jsonBuilder.AppendLine($"            \"Estado\": \"{estado}\"");
                                    jsonBuilder.Append("        }");

                                    id++;
                                }
                            }
                        }
                    }
                }
            }

            jsonBuilder.AppendLine();
            jsonBuilder.Append("    ]");

            string datos = jsonBuilder.ToString();
            CargarJsonEnGridView(ref gvRevisionPOA, datos);
        }

        protected void lnkVolver_Click(object sender, EventArgs e)
        {
            // Volver específicamente a la página de Registros PEE
            Response.Redirect("wfRegistrosPOA.aspx");
        }

        protected void btnAmpliar_Click(object sender, EventArgs e)
        {
            // Abrir el modal usando el método de la clase base
            AbrirModal("modalAmpliarFecha");
        }

        protected void btnGenerarPOAExcel_Click(object sender, EventArgs e)
        {
            SwalCorrecto("Generando archivo POA en Excel...");
        }

        protected void btnRevisar_Click(object sender, EventArgs e)
        {
            string id = ((Button)sender).CommandArgument;
            
            // Obtener la URL actual para el retorno
            string returnUrl = System.Web.HttpUtility.UrlEncode(Request.Url.PathAndQuery);
            
            Response.Redirect($"~/Modulos/ProgramacionPOA/wfEjecucion.aspx?Id={id}&returnUrl={returnUrl}");
        }
    }
}