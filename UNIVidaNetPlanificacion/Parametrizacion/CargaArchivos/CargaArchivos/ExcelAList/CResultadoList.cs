using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UNIVidaNetCoreTecnico.Parametrizacion.CargaArchivos.ExcelAList
{
    public class CResultadoList<T>
    {
        public bool Exito { get; set; }
        public List<T> Resultado { get; set; }
        public string Mensaje { get; set; }
        public CResultadoList()
        {
            Exito = false;
            Resultado = new List<T>();
            Mensaje = "";
        }
    }
}