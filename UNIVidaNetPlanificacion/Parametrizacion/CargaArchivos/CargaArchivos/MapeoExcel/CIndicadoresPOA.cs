using System;
using System.Collections.Generic;

namespace UNIVidaNetPlanificacion.Parametrizacion.CargaArchivos.MapeoExcel
{
    public class CIndicadoresPOA
    {
        // Propiedades que coinciden con las columnas del Excel
        public string ObjetivoEstrategico { get; set; }
        public string Indicador { get; set; }
        public string ObjetivoGestion { get; set; }
        public string IndicadorGestion { get; set; }
        public string ResultadoGestion { get; set; }
        public string ResponsablePOA { get; set; }
        public string ResponsablePOAFK { get; set; }
        public string IndicadorFK { get; set; }

        // Mapeo: Nombre de columna en Excel → Nombre de propiedad en C#
        public static Dictionary<string, string> ObtenerColumnas()
        {
            var columnas = new Dictionary<string, string>();

            // Mapeo flexible - busca variaciones de nombres
            columnas.Add("Objetivo Estratégico", "ObjetivoEstrategico");
            columnas.Add("Objetivo Estrategico", "ObjetivoEstrategico"); // Sin tilde
            columnas.Add("Indicador", "Indicador");
            columnas.Add("Objetivo de Gestion", "ObjetivoGestion");
            columnas.Add("Objetivo de Gestión", "ObjetivoGestion"); // Con tilde
            columnas.Add("Indicador de Gestion", "IndicadorGestion");
            columnas.Add("Indicador de Gestión", "IndicadorGestion"); // Con tilde
            columnas.Add("Resultado de Gestion", "ResultadoGestion");
            columnas.Add("Resultado de Gestión", "ResultadoGestion"); // Con tilde
            columnas.Add("Responsable POA", "ResponsablePOA");
            columnas.Add("Responsable POA FK", "ResponsablePOAFK");
            columnas.Add("Indicador FK", "IndicadorFK");

            return columnas;
        }
        
        // Mapeo simplificado - usa los headers del Excel exactos
        // Este método verifica variaciones comunes de los headers
        // IMPORTANTE: El orden importa porque CExcelAList usa .Contains() no .Equals()
        public static Dictionary<string, string> ObtenerMapeoFlexible()
        {
            var columnas = new Dictionary<string, string>();
            
            // El mapeo debe coincidir EXACTAMENTE con los headers de la fila 1 del Excel
            // Según la plantilla POA, los headers son:
            columnas.Add("Objetivo Estratégico", "ObjetivoEstrategico");
            columnas.Add("Objetivo Estrategico", "ObjetivoEstrategico");  // Sin tilde
            columnas.Add("Indicador", "Indicador");
            columnas.Add("Objetivo de Gestion", "ObjetivoGestion");
            columnas.Add("Objetivo de Gestión", "ObjetivoGestion");         // Con tilde
            columnas.Add("Indicador de Gestion", "IndicadorGestion");
            columnas.Add("Indicador de Gestión", "IndicadorGestion");       // Con tilde
            columnas.Add("Resultado de Gestion", "ResultadoGestion");
            columnas.Add("Resultado de Gestión", "ResultadoGestion");       // Con tilde
            columnas.Add("Responsable POA", "ResponsablePOA");
            columnas.Add("Responsable POA FK", "ResponsablePOAFK");
            columnas.Add("ResponsablePOAFK", "ResponsablePOAFK");           // Sin espacios
            columnas.Add("Indicador FK", "IndicadorFK");
            columnas.Add("IndicadorFK", "IndicadorFK");                     // Sin espacios
            
            return columnas;
        }
    }
}
