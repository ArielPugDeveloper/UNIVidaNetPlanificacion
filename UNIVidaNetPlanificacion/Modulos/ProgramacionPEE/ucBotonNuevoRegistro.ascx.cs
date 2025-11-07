using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UNIVidaNetPlanificacion.Parametrizacion;

namespace UNIVidaNetPlanificacion.Modulos.ProgramacionPEE
{
    public partial class ucBotonNuevoRegistro : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)  
        {
            if (!IsPostBack)  
            {
                ConfigurarVisibilidad();
            }
        }

        public void ConfigurarVisibilidad()  
        {
            // solo planificador puede ver el botón
            phNuevoRegistro.Visible = CGestionPermisos.EsPlanificador();  
        }

        protected void lnkNuevoRegistro_Click(object sender, EventArgs e)
        {
            // Calcular las gestiones para el nuevo PEE
            var gestiones = CalcularNuevasGestiones();
            
            // Log para debug
            string script = $"console.log('Gestiones calculadas: {gestiones.Item1} - {gestiones.Item2}');";
            ScriptManager.RegisterStartupScript(this, GetType(), "LogGestiones", script, true);
            
            // Redirigir a la página de nuevo registro PEE con las gestiones calculadas
            Response.Redirect($"~/Modulos/ProgramacionPEE/wfNuevoPEE.aspx?GestionInicial={gestiones.Item1}&GestionFinal={gestiones.Item2}");
        }

        private Tuple<int, int> CalcularNuevasGestiones()
        {
            try
            {
                // Buscar el GridView en la página padre (wfRegistrosPEE)
                var page = this.Page as wfRegistrosPEE;
                
                if (page != null)
                {
                    var gvRegistros = page.FindControl("gvRegistrosPEE") as GridView;
                    
                    if (gvRegistros != null && gvRegistros.Rows.Count > 0)
                    {
                        // Obtener la última fila del GridView
                        var ultimaFila = gvRegistros.Rows[gvRegistros.Rows.Count - 1];
                        
                        // Intentar obtener el valor de la celda "Gestión Final"
                        // Primero intentar con DataItem (más confiable)
                        int ultimaGestionFinal = 0;
                        
                        if (ultimaFila.DataItem != null)
                        {
                            // Acceder al DataItem directamente
                            dynamic dataItem = ultimaFila.DataItem;
                            try
                            {
                                var gestionFinalObj = dataItem.GestionFinal;
                                ultimaGestionFinal = int.Parse(gestionFinalObj.ToString());
                            }
                            catch
                            {
                                // Si falla, intentar con Cells
                                string gestionFinalStr = ultimaFila.Cells[3].Text.Trim();
                                int.TryParse(gestionFinalStr, out ultimaGestionFinal);
                            }
                        }
                        else
                        {
                            // Si no hay DataItem, usar Cells directamente
                            string gestionFinalStr = ultimaFila.Cells[3].Text.Trim();
                            int.TryParse(gestionFinalStr, out ultimaGestionFinal);
                        }
                        
                        // Log para debug
                        string logScript = $"console.log('GridView encontrado. Total filas: {gvRegistros.Rows.Count}');";
                        logScript += $"console.log('Última Gestión Final leída: {ultimaGestionFinal}');";
                        ScriptManager.RegisterStartupScript(this, GetType(), "LogDebugGestiones", logScript, true);
                        
                        if (ultimaGestionFinal > 0)
                        {
                            // Calcular nuevas gestiones: GestionInicial = UltimaGestionFinal + 1
                            int nuevaGestionInicial = ultimaGestionFinal + 1;
                            int nuevaGestionFinal = nuevaGestionInicial + 4; // 5 años
                            
                            string logCalculo = $"console.log('✅ Cálculo exitoso: {ultimaGestionFinal} + 1 = {nuevaGestionInicial}, luego + 4 = {nuevaGestionFinal}');";
                            ScriptManager.RegisterStartupScript(this, GetType(), "LogCalculo", logCalculo, true);
                            
                            return new Tuple<int, int>(nuevaGestionInicial, nuevaGestionFinal);
                        }
                    }
                    else
                    {
                        string logError = "console.log('ERROR: GridView no encontrado o vacío');";
                        ScriptManager.RegisterStartupScript(this, GetType(), "LogError", logError, true);
                    }
                }
                else
                {
                    string logError = "console.log('ERROR: No se pudo obtener la página wfRegistrosPEE');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "LogErrorPage", logError, true);
                }
            }
            catch (Exception ex)
            {
                // Log de excepción
                string logEx = $"console.log('EXCEPCIÓN en CalcularNuevasGestiones: {ex.Message}');";
                ScriptManager.RegisterStartupScript(this, GetType(), "LogException", logEx, true);
            }
            
            // Valores por defecto si no se puede calcular
            string logDefault = "console.log('Usando valores por defecto: 2032 - 2036');";
            ScriptManager.RegisterStartupScript(this, GetType(), "LogDefault", logDefault, true);
            return new Tuple<int, int>(2032, 2036);
        }
    }
}