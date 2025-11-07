using AgenteServiciosPlanificacion.Modulos.ProgramacionPEE;
using AgenteServiciosPlanificacion.Modulos.ProgramacionPEE.EntidadSalida;
using AgenteServiciosPlanificacion.Modulos.ProgramacionPEE.ParametrosEntrada;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UNIVidaNetPlanificacion.Parametrizacion;
using UVNetDTOs.DTOsGenericas.Resultado;
using UVNetUtilitarios.Serealizacion;


namespace UNIVidaNetPlanificacion.Modulos.ProgramacionPEE
{
    public partial class wfReportePEE : CWebFormGenerico
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
            CodigoSistema = "070-001-001-001";

            if (!IsPostBack)
            {
                ValidarAccesoUsuario();
                
                // Capturar el número de registro PEE desde el QueryString
                if (!string.IsNullOrEmpty(Request.QueryString["Registro"]))
                {
                    NumeroRegistroPEE = Request.QueryString["Registro"];
                }

                rptPEE.LocalReport.ReportPath = Server.MapPath("../Reportes/rptPEE.rdlc");
                ObtenerDatos();
            }
            else
            {
                ValidarUsuario();
            }
        }

        protected void ObtenerDatos()
        {
            CPFAtTPeeListar oPFAtTPeeListar = new CPFAtTPeeListar();
            oPFAtTPeeListar.UsuarioAut = Usuario;
            oPFAtTPeeListar.CodigoSistema = CodigoSistema;
            
            // Usar el NumeroRegistroPEE si existe, sino usar valor por defecto
            if (!string.IsNullOrEmpty(NumeroRegistroPEE) && int.TryParse(NumeroRegistroPEE, out int registroId))
            {
                oPFAtTPeeListar.TRegistroPeeFk = registroId;
                ConsoleLog($"Cargando reporte para Registro PEE: {registroId}");
            }
            else
            {
                oPFAtTPeeListar.TRegistroPeeFk = 87; // Valor por defecto para pruebas
                ConsoleLog("Cargando reporte con valor por defecto: 87");
            }
            
            CResultadoJsonDocument oResultadoJsonDocument = CAgenteProgramacionPEE.FAtTPeeListar(oPFAtTPeeListar);
            if (oResultadoJsonDocument.Exito)
            {
                List<PlanEstrategicoEmpresarial> datos = CSerealizacion.JsonEnObjeto<List<PlanEstrategicoEmpresarial>>(oResultadoJsonDocument.Resultado);
                rptPEE.LocalReport.DataSources.Clear();
                rptPEE.LocalReport.DataSources.Add(new ReportDataSource("dsPlanEstrategicoEmpresarial", datos));
                rptPEE.LocalReport.Refresh();
                
                ConsoleLog($"Reporte cargado exitosamente con {datos.Count} registros");
            }
            else
            {
                ConsoleLog($"Error al cargar datos: {oResultadoJsonDocument.Mensaje}");
                SwalError(oResultadoJsonDocument.Mensaje);
            }
        }

        private void ConsoleLog(string mensaje)
        {
            string mensajeEscapado = mensaje
                .Replace("\\", "\\\\")
                .Replace("'", "\\'")
                .Replace("\"", "\\\"")
                .Replace("\n", "\\n")
                .Replace("\r", "\\r")
                .Replace("\t", "\\t");

            string script = $"console.log('{mensajeEscapado}');";
            ScriptManager.RegisterStartupScript(this, GetType(), "ConsoleLog_" + Guid.NewGuid(), script, true);
        }

        protected void btnDescargarReportePDF_Click(object sender, EventArgs e)
        {
            try
            {
                // 1. Crear instancia del LocalReport
                LocalReport report = new LocalReport();
                
                // 2. Configurar la ruta del archivo .rdlc
                string reportPath = Server.MapPath("../Reportes/rptPEE.rdlc");
                report.ReportPath = reportPath;
                
                // 3. Renderizar como PDF (sin datos por ahora, los agregarás después)
                string mimeType;
                string encoding;
                string fileNameExtension;
                string[] streams;
                Warning[] warnings;
                
                byte[] pdfBytes = report.Render(
                    "PDF",
                    null,
                    out mimeType,
                    out encoding,
                    out fileNameExtension,
                    out streams,
                    out warnings
                );
                
                // 4. Descargar el PDF
                Response.Clear();
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment; filename=ReporteSeguimientoPEE_" + DateTime.Now.ToString("yyyyMMdd_HHmmss") + ".pdf");
                Response.BinaryWrite(pdfBytes);
                Response.End();
            }
            catch (Exception ex)
            {
                // Mostrar error detallado
                string errorDetallado = ex.Message;
                if (ex.InnerException != null)
                {
                    errorDetallado += " | Inner: " + ex.InnerException.Message;
                }
                
                // Log en consola para debugging
                System.Diagnostics.Debug.WriteLine("ERROR COMPLETO: " + ex.ToString());
                
                SwalError("Error al generar el PDF: " + errorDetallado);
            }
        }
    }
}