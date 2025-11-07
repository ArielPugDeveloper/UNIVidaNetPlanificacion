using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using UNIVidaNetPlanificacion.Parametrizacion;

namespace UNIVidaNetPlanificacion.Modulos.SeguimientoPOA
{
    public partial class wfInstrucciones : CWebFormGenerico
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

        private string NumeroRegistroPOASeleccionado
        {
            get
            {
                if (ViewState["NumeroRegistroPOASeleccionado"] != null)
                    return ViewState["NumeroRegistroPOASeleccionado"].ToString();
                return "";
            }
            set
            {
                ViewState["NumeroRegistroPOASeleccionado"] = value;
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

                // Capturar el número de registro POA desde el QueryString
                if (!string.IsNullOrEmpty(Request.QueryString["RegistroPOA"]))
                {
                    NumeroRegistroPOASeleccionado = Request.QueryString["RegistroPOA"];
                }

                ConsoleLog($"NumeroRegistroPEE en wfInstrucciones: '{NumeroRegistroPEE}'");
                ConsoleLog($"NumeroRegistroPOASeleccionado en wfInstrucciones: '{NumeroRegistroPOASeleccionado}'");

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
                    ""Instruccion"": ""R-005"",
                    ""FechaPresentacion"": ""24/02/2025"",
                    ""FechaLimite"": ""19/03/2025"",
                    ""FechaCompletado"": ""22/09/2025"",
                    ""Estado"": ""COMPLETADO""
                },
                {
                    ""Instruccion"": ""R-006"",
                    ""FechaPresentacion"": ""24/05/2025"",
                    ""FechaLimite"": ""19/06/2025"",
                    ""FechaCompletado"": ""22/09/2025"",
                    ""Estado"": ""COMPLETADO""
                },
                {
                    ""Instruccion"": ""R-007"",
                    ""FechaPresentacion"": ""24/08/2025"",
                    ""FechaLimite"": ""19/09/2025"",
                    ""FechaCompletado"": ""22/09/2025"",
                    ""Estado"": ""COMPLETADO""
                },
                {
                    ""Instruccion"": ""R-008"",
                    ""FechaPresentacion"": ""24/11/2025"",
                    ""FechaLimite"": ""19/12/2025"",
                    ""FechaCompletado"": ""22/09/2025"",
                    ""Estado"": ""PENDIENTE""
                }
            ]";

            CargarJsonEnGridView(ref gvInstrucciones, datos);
        }

        protected void btnAgregarInstruccion_Click(object sender, EventArgs e)
        {
            // Lógica para agregar nueva instrucción
            SwalAtencion("Función 'Agregar nueva instrucción' - En desarrollo");
        }

        protected void btnSeguimientoPEE_Click(object sender, EventArgs e)
        {
            // Redirigir a la página de Seguimiento de Instrucciones PEE pasando solo el registro PEE
            if (!string.IsNullOrEmpty(NumeroRegistroPEE))
            {
                Response.Redirect($"~/Modulos/SeguimientoPOA/wfInstruccionSeguimientoPEE.aspx?Registro={NumeroRegistroPEE}");
            }
            else
            {
                Response.Redirect("~/Modulos/SeguimientoPOA/wfInstruccionSeguimientoPEE.aspx");
            }
        }

        protected void btnSeguimientoPOA_Click(object sender, EventArgs e)
        {
            // Redirigir a la página de Seguimiento de Instrucciones POA pasando ambos registros
            string registroPEE = NumeroRegistroPEE ?? string.Empty;
            string registroPOA = NumeroRegistroPOASeleccionado ?? string.Empty;

            string url = $"~/Modulos/SeguimientoPOA/wfInstruccionSeguimientoPOA.aspx?Registro={registroPEE}&RegistroPOA={registroPOA}";
            Response.Redirect(url);
        }

        protected void lnkVolver_Click(object sender, EventArgs e)
        {
            // Volver a la página anterior (Registros POA)
            Response.Redirect("~/Modulos/ProgramacionPOA/wfRegistrosPOA.aspx");
        }
    }
}