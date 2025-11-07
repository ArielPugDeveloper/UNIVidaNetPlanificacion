using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AgenteServiciosPlanificacion.Modulos.Parametricas.EntidadSalida
{
    public class CMapeoEjemplo
    {
        public int Secuencial { get; set; }
        public string Descripcion { get; set; }

    
        public static Dictionary<string, string> ObtenerColumnas()
        {
            Dictionary<string, string> columnasExcel = new Dictionary<string, string>();

            columnasExcel.Add("SECUENCIAL", "Secuencial");
            columnasExcel.Add("DESCRIPCION", "Descripcion");

            return columnasExcel;
        }

    }
}
