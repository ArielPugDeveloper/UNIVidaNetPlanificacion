using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using UNIVidaNetPlanificacion.Parametrizacion;

namespace UNIVidaNetPlanificacion.Modulos.SeguimientoPOA
{
    public partial class wfInstruccionSeguimientoPEE : CWebFormGenerico
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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Verificar permisos de acceso - Solo Planificador
                if (!CGestionPermisos.EsPlanificador())
                {
                    SwalError("Acceso Denegado", "Solo el Planificador puede acceder a esta página.");
                    Response.Redirect("~/Default.aspx");
                    return;
                }

                // Capturar el número de registro PEE desde el QueryString
                if (!string.IsNullOrEmpty(Request.QueryString["Registro"]))
                {
                    NumeroRegistroPEE = Request.QueryString["Registro"];
                }

                ConsoleLog($"NumeroRegistroPEE en wfInstruccionSeguimientoPEE: '{NumeroRegistroPEE}'");

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
            // Datos de prueba basados en la imagen
            string datos = @"[
                {
                    ""ObjetivoEstrategico"": ""OE 1. Objetivo Estratégico 1"",
                    ""AccionEstrategica"": """",
                    ""Indicador"": ""IND-001"",
                    ""ResponsablePEE"": ""GNTI"",
                    ""Estado"": ""PRESENTADO""
                },
                {
                    ""ObjetivoEstrategico"": """",
                    ""AccionEstrategica"": """",
                    ""Indicador"": ""IND-002"",
                    ""ResponsablePEE"": ""GNTI"",
                    ""Estado"": ""EN ELABORACION""
                },
                {
                    ""ObjetivoEstrategico"": """",
                    ""AccionEstrategica"": """",
                    ""Indicador"": ""IND-003"",
                    ""ResponsablePEE"": ""GNTI"",
                    ""Estado"": ""COMPLETADO""
                },
                {
                    ""ObjetivoEstrategico"": ""OE 2. Objetivo Estratégico 2"",
                    ""AccionEstrategica"": """",
                    ""Indicador"": ""IND-004"",
                    ""ResponsablePEE"": ""GNC"",
                    ""Estado"": ""PRESENTADO""
                },
                {
                    ""ObjetivoEstrategico"": """",
                    ""AccionEstrategica"": """",
                    ""Indicador"": ""IND-005"",
                    ""ResponsablePEE"": ""GNC"",
                    ""Estado"": ""EN ELABORACION""
                },
                {
                    ""ObjetivoEstrategico"": """",
                    ""AccionEstrategica"": """",
                    ""Indicador"": ""IND-006"",
                    ""ResponsablePEE"": ""GNC"",
                    ""Estado"": ""RETRASADO""
                }
            ]";

            CargarJsonEnGridView(ref gvSeguimientoInstrucciones, datos);
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            // Lógica para filtrar datos según los criterios seleccionados
            string responsable = ddlResponsablePEE.SelectedValue;
            string estado = ddlEstado.SelectedValue;
            string objetivo = ddlObjetivoEstrategico.SelectedValue;
            
            // Por ahora solo recargamos los datos
            CargarDatosPrueba();
            
            SwalCorrecto($"Filtros aplicados: Responsable={responsable}, Estado={estado}, Objetivo={objetivo}");
        }

        protected void btnAmpliar_Click(object sender, EventArgs e)
        {
            // Lógica para ampliar fechas
            SwalAtencion("Función 'Ampliar fechas' - En desarrollo");
        }

        protected void btnRevisar_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string indicador = btn.CommandArgument;

            // Obtener la URL actual para el retorno
            string returnUrl = System.Web.HttpUtility.UrlEncode(Request.Url.PathAndQuery);
            
            // Redirigir a la página de Seguimiento PEE
            Response.Redirect($"~/Modulos/ProgramacionPEE/wfSeguimientoPEE.aspx?Indicador={indicador}&returnUrl={returnUrl}");
        }


        protected void lnkVolver_Click(object sender, EventArgs e)
        {
            // Volver a la página anterior (Registros POA)
            Response.Redirect("~/Modulos/SeguimientoPOA/wfInstrucciones.aspx");
        }

        protected void btnGenerarPEE_Click(object sender, EventArgs e)
        {
            // Redirigir a la página de Reporte PEE pasando el registro
            if (!string.IsNullOrEmpty(NumeroRegistroPEE))
            {
                Response.Redirect($"~/Modulos/ProgramacionPEE/wfReportePEE.aspx?Registro={NumeroRegistroPEE}");
            }
            else
            {
                Response.Redirect("~/Modulos/ProgramacionPEE/wfReportePEE.aspx");
            }
        }
    }
}