using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UNIVidaNetCoreTecnico.Parametrizacion.CargaArchivos.MapeoExcel
{
    public class CClienteResumido
    {
        public string TipoDocumentoIdentidad { get; set; }
        public int NumeroDocumentoIdentidad { get; set; }
        public string ExtensionDocumentoIdentidad { get; set; }
        public string DepartamentoDocumentoIdentidad { get; set; }
        public string PrimerNombre { get; set; }
        public string SegundoNombre { get; set; }
        public string ApellidoPaterno { get; set; }
        public string ApellidoMaterno { get; set; }
        public string ApellidoCasada { get; set; }
        public string Genero { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Nacionalidad { get; set; }
        public string DepartamentoNacimiento { get; set; }
        public string PaisResidencia { get; set; }
        public string Profesion { get; set; }
        public string DomicilioParticular { get; set; }
        public string ActividadPrimaria { get; set; }
        public string EstadoCivil { get; set; }
        public string EstadoValidacion { get; set; }
        public string TelefonoMovil { get; set; }
       
        public static Dictionary<string, string> ObtenerColumnas()
        {
            Dictionary<string, string> columnasExcel = new Dictionary<string, string>();
        

            columnasExcel.Add("TIPO_DOC_IDENTIDAD", "TipoDocumentoIdentidad");
            columnasExcel.Add("NRO_DOC_IDENTIDAD", "NumeroDocumentoIdentidad");
            columnasExcel.Add("EXT_DOC_IDENTIDAD", "ExtensionDocumentoIdentidad");
            columnasExcel.Add("DPTO_DOC_IDENTIDAD", "DepartamentoDocumentoIdentidad");
            columnasExcel.Add("PRIMER_NOMBRE", "PrimerNombre");
            columnasExcel.Add("SEGUNDO_NOMBRE", "SegundoNombre");
            columnasExcel.Add("APELLIDO_PATERNO", "ApellidoPaterno");
            columnasExcel.Add("APELLIDO_MATERNO", "ApellidoMaterno");
            columnasExcel.Add("APELLIDO_CASADA", "ApellidoCasada");
            columnasExcel.Add("GENERO", "Genero");
            columnasExcel.Add("FECHA_NACIMIENTO", "FechaNacimiento");
            columnasExcel.Add("NACIONALIDAD", "Nacionalidad");
            columnasExcel.Add("DPTO_NACIMIENTO", "DepartamentoNacimiento");
            columnasExcel.Add("PAIS_RESIDENCIA", "PaisResidencia");
            columnasExcel.Add("PROFESION", "Profesion");
            columnasExcel.Add("DOMICILIO_PARTICULAR", "DomicilioParticular");
            columnasExcel.Add("ACTIVIDAD_PRIMARIA", "ActividadPrimaria");
            columnasExcel.Add("ESTADO_CIVIL", "EstadoCivil");
            columnasExcel.Add("TELEFONO_MOVIL", "TelefonoMovil");

            return columnasExcel;
        }
    }
}