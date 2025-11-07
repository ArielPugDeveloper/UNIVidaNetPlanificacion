using System;
using System.Collections.Generic;

namespace UNIVidaNetPlanificacion.Parametrizacion.CargaArchivos.MapeoExcel
{
    public class CIndicadoresPEE
    {
        // Propiedades que coinciden con las columnas del Excel
        public string Perspectiva { get; set; }
        public string ObjetivoEstrategico { get; set; }
        public string AccionEstrategica { get; set; }
        public string Resultado { get; set; }
        public string LineaBase { get; set; }
        public string Indicador { get; set; }
        public string Meta1 { get; set; }
        public string Meta2 { get; set; }
        public string Meta3 { get; set; }
        public string Meta4 { get; set; }
        public string Meta5 { get; set; }
        public string Meta { get; set; }
        public string ResponsablePEE { get; set; }
        public string ResponsablePEEFK { get; set; }

        // Mapeo: Nombre de columna en Excel → Nombre de propiedad en C#
        public static Dictionary<string, string> ObtenerColumnas()
        {
            var columnas = new Dictionary<string, string>();

            // Mapeo flexible - busca variaciones de nombres
            columnas.Add("Perspectiva", "Perspectiva");
            columnas.Add("Objetivo Estratégico", "ObjetivoEstrategico");
            columnas.Add("Objetivo Estrategico", "ObjetivoEstrategico"); // Sin tilde
            columnas.Add("Accion Estratégica", "AccionEstrategica");
            columnas.Add("Accion Estrategica", "AccionEstrategica"); // Sin tilde
            columnas.Add("Resultado", "Resultado");
            columnas.Add("Línea Base", "LineaBase");
            columnas.Add("Linea Base", "LineaBase"); // Sin tilde
            columnas.Add("Indicador", "Indicador");
            columnas.Add("Meta 2022", "Meta2022");
            columnas.Add("Meta 2023", "Meta2023");
            columnas.Add("Meta 2024", "Meta2024");
            columnas.Add("Meta 2025", "Meta2025");
            columnas.Add("Meta 2026", "Meta2026");
            columnas.Add("Meta", "Meta");
            columnas.Add("Responsable PEE", "ResponsablePEE");

            return columnas;
        }
        
        // Mapeo simplificado - usa los headers del Excel exactos
        // Este método verifica variaciones comunes de los headers
        // IMPORTANTE: El orden importa porque CExcelAList usa .Contains() no .Equals()
        public static Dictionary<string, string> ObtenerMapeoFlexible()
        {
            var columnas = new Dictionary<string, string>();
            
            // El mapeo debe coincidir EXACTAMENTE con los headers de la fila 1 del Excel
            // Según tu plantilla, los headers son:
            columnas.Add("Perspectiva", "Perspectiva");
            columnas.Add("Objetivo Estratégico", "ObjetivoEstrategico");
            columnas.Add("Objetivo Estrategico", "ObjetivoEstrategico");  // Sin tilde
            columnas.Add("Accion Estratégica", "AccionEstrategica");
            columnas.Add("Accion Estrategica", "AccionEstrategica");      // Sin tilde
            columnas.Add("Resultado", "Resultado");
            columnas.Add("Línea Base", "LineaBase");
            columnas.Add("Linea Base", "LineaBase");                      // Sin tilde
            columnas.Add("Indicador", "Indicador");
            
            // Mapeo genérico de columnas Meta
            columnas.Add("Meta 1", "Meta1");
            columnas.Add("Meta 2", "Meta2");
            columnas.Add("Meta 3", "Meta3");
            columnas.Add("Meta 4", "Meta4");
            columnas.Add("Meta 5", "Meta5");
            columnas.Add("Meta", "Meta");
            
            columnas.Add("Responsable PEE", "ResponsablePEE");
            columnas.Add("Responsable PEE FK", "ResponsablePEEFK");
            columnas.Add("ResponsablePEEFK", "ResponsablePEEFK");  // Sin espacios
            
            return columnas;
        }
    }
}