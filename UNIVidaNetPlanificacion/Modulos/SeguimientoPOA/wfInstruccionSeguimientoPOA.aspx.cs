using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using UNIVidaNetPlanificacion.Parametrizacion;

namespace UNIVidaNetPlanificacion.Modulos.SeguimientoPOA
{
    public partial class wfInstruccionSeguimientoPOA : CWebFormGenerico
    {
        private string NumeroRegistroPEE
        {
            get
            {
                if (ViewState["NumeroRegistroPEE"] != null)
                    return ViewState["NumeroRegistroPEE"].ToString();
                return "";
            }
            set
            {
                ViewState["NumeroRegistroPEE"] = value;
            }
        }

        private string NumeroRegistroPOA
        {
            get
            {
                if (ViewState["NumeroRegistroPOA"] != null)
                    return ViewState["NumeroRegistroPOA"].ToString();
                return "";
            }
            set
            {
                ViewState["NumeroRegistroPOA"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                if (!CGestionPermisos.EsPlanificador())
                {
                    SwalError("Acceso Denegado", "Solo el Planificador puede acceder a esta página.");
                    Response.Redirect("~/Default.aspx");
                    return;
                }

                if (!string.IsNullOrEmpty(Request.QueryString["Registro"]))
                {
                    NumeroRegistroPEE = Request.QueryString["Registro"];
                }

                if (!string.IsNullOrEmpty(Request.QueryString["RegistroPOA"]))
                {
                    NumeroRegistroPOA = Request.QueryString["RegistroPOA"];
                }

                ConsoleLog($"NumeroRegistroPEE en wfInstruccionSeguimientoPOA: '{NumeroRegistroPEE}'");
                ConsoleLog($"NumeroRegistroPOA en wfInstruccionSeguimientoPOA: '{NumeroRegistroPOA}'");

                CargarDatosPrueba();
            }
        }

        private void ConsoleLog(string mensaje)
        {
            string mensajeSafe = mensaje.Replace("'", "\\'").Replace("\r", "").Replace("\n", " ");
            string script = "console.log('[SERVER] " + mensajeSafe + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "consoleLog" + Guid.NewGuid(), script, true);
        }

        private void CargarDatosPrueba()
        {
            var datos = new System.Text.StringBuilder();
            datos.Append("[");
            
            // Variables para rotar valores
            string[] responsables = { "JNDS", "GNTI", "JNIR" };
            string[] estados = { "EN ELABORACION", "RETRASADO", "COMPLETADO" };
            string[] excepciones = { "NO", "SI", "NO" };
            int indexRotacion = 0;
            int contadorSI = 0; // Para alternar SI y Solicita MV
            
            // 2 Objetivos Estratégicos
            for (int oe = 1; oe <= 2; oe++)
            {
                // 5 Indicadores por OE
                for (int ind = 1; ind <= 5; ind++)
                {
                    // 2 Objetivos de Gestión por Indicador
                    for (int og = 1; og <= 2; og++)
                    {
                        // 3 Acciones de Gestión por OG
                        for (int ag = 1; ag <= 3; ag++)
                        {
                            if (datos.Length > 1) datos.Append(",");
                            
                            // Solo mostrar OE en la primera fila de cada OE
                            string oeTexto = (ind == 1 && og == 1 && ag == 1) 
                                ? $"OE {oe}. Objetivo Estratégico {oe}" 
                                : "";
                            
                            // Solo mostrar Indicador en la primera fila de cada Indicador
                            string indTexto = (og == 1 && ag == 1) 
                                ? $"IND {oe}.{ind}. Indicador {oe}.{ind}" 
                                : "";
                            
                            // Solo mostrar OG en la primera fila de cada OG
                            string ogTexto = (ag == 1) 
                                ? $"OG {oe}.{ind}.{og} Objetivo de Gestión {oe}.{ind}.{og}" 
                                : "";
                            
                            string agTexto = $"AG {oe}.{ind}.{og}.{ag} Acción de Gestión {oe}.{ind}.{og}.{ag}";
                            
                            // Determinar el valor de ExcepcionMV
                            string excepcionMV = excepciones[indexRotacion % 3];
                            if (excepcionMV == "SI")
                            {
                                // Alternar entre "SI" y "Solicita Excepcion"
                                excepcionMV = (contadorSI % 2 == 0) ? "SI" : "Solicita Excepcion";
                                contadorSI++;
                            }
                            
                            datos.Append($@"
                {{
                    ""ObjetivoEstrategico"": ""{oeTexto}"",
                    ""Indicador"": ""{indTexto}"",
                    ""ObjetivoGestion"": ""{ogTexto}"",
                    ""AccionGestion"": ""{agTexto}"",
                    ""ResponsablePOA"": ""{responsables[indexRotacion % 3]}"",
                    ""Estado"": ""{estados[indexRotacion % 3]}"",
                    ""ExcepcionMV"": ""{excepcionMV}""
                }}");
                            
                            indexRotacion++;
                        }
                    }
                }
            }
            
            datos.Append("]");

            CargarJsonEnGridView(ref gvSeguimientoInstruccionesPOA, datos.ToString());
        }

        // Método para determinar la clase CSS del botón según el estado
        protected string GetButtonClass(string estado)
        {
            switch (estado.ToUpper())
            {
                case "COMPLETADO":
                    return "btn btn-success btn-sm";
                case "MODIFICANDO":
                case "RETRASADO":
                default:
                    return "btn btn-secondary btn-sm";
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            // Lógica para filtrar datos según los criterios seleccionados
            string responsablePEE = ddlResponsablePEE.SelectedValue;
            string responsablePOA = ddlResponsablePOA.SelectedValue;
            string estado = ddlEstado.SelectedValue;
            string objetivo = ddlObjetivoEstrategico.SelectedValue;
            
            // Por ahora solo recargamos los datos
            CargarDatosPrueba();
            
            SwalCorrecto($"Filtros aplicados: Responsable PEE={responsablePEE}, Responsable POA={responsablePOA}, Estado={estado}, Objetivo={objetivo}");
        }

        protected void btnAmpliar_Click(object sender, EventArgs e)
        {
            // Lógica para ampliar fechas
            SwalAtencion("Función 'Ampliar fechas' - En desarrollo");
        }

        protected void btnRevisar_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string accionGestion = btn.CommandArgument;

            // Obtener la URL actual para el retorno
            string returnUrl = System.Web.HttpUtility.UrlEncode(Request.Url.PathAndQuery);
            
            Response.Redirect($"~/Modulos/SeguimientoPOA/wfSeguimientoOperativo.aspx?returnUrl={returnUrl}");
        }

        protected void btnMVSI_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string accionGestion = btn.CommandArgument;
            
            
            SwalAtencion($"MV SI para acción de gestión {accionGestion} - Función en desarrollo");
        }

        protected void lnkVolver_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("~/Modulos/SeguimientoPOA/wfInstrucciones.aspx");
        }
    }
}