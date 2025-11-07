using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using UNIVidaNetCoreTecnico.Parametrizacion.CargaArchivos.ExcelAList;
using UNIVidaNetCoreTecnico.Parametrizacion.CargaArchivos.Interfaces;


namespace UNIVidaNetPlanificacion.Parametrizacion.CargaArchivos.ExcelAList
{
    public class CContenidoXls<T> : ITipoContenido<T> where T : new()
    {
        private byte[] archivo;
        private Dictionary<string, string> map;
        
        public CContenidoXls(byte[] archivo)
        {
            this.archivo = archivo;
            this.map = new Dictionary<string, string>();
        }
        public void AsignarMap(Dictionary<string, string> map)
        {
            this.map = map;
        }
        public CResultadoList<T> ConvertirAList(int iniciarEnFila)
        {

            using (MemoryStream ms = new MemoryStream(this.archivo))
            {
                try
                {

                    using (ExcelPackage excelPackage = new ExcelPackage(ms))
                    {
                        ExcelWorksheet firstWorksheet = excelPackage.Workbook.Worksheets[1];
                        return CExcelAList.Convertir<T>(firstWorksheet, iniciarEnFila, this.map);
                    }
                }
                catch (Exception)
                {

                    using (var package = new ExcelPackage())
                    {
                        var sheet = package.Workbook.Worksheets.Add("CSV");
                        var file = System.Text.Encoding.Default.GetString(this.archivo);


                        var format = new ExcelTextFormat()
                        {
                            Delimiter = ',',
                            Culture = CultureInfo.InvariantCulture,


                            TextQualifier = '"'


                        };
                        sheet.Cells["A1"].LoadFromText(file, format);
                        ExcelWorksheet firstWorksheet = package.Workbook.Worksheets[1];
                        return CExcelAList.Convertir<T>(firstWorksheet, iniciarEnFila, this.map);
                    }
                }

            }
        }
        public CResultadoList<T> ConvertirAList(int iniciarEnFila, bool bVacios)
        {

            using (MemoryStream ms = new MemoryStream(this.archivo))
            {
                try
                {

                    using (ExcelPackage excelPackage = new ExcelPackage(ms))
                    {
                        ExcelWorksheet firstWorksheet = excelPackage.Workbook.Worksheets[1];
                        return CExcelAList.Convertir<T>(firstWorksheet, iniciarEnFila, this.map, bVacios);
                    }
                }
                catch (Exception)
                {

                    using (var package = new ExcelPackage())
                    {
                        var sheet = package.Workbook.Worksheets.Add("CSV");
                        var file = System.Text.Encoding.Default.GetString(this.archivo);


                        var format = new ExcelTextFormat()
                        {
                            Delimiter = ',',
                            Culture = CultureInfo.InvariantCulture,


                            TextQualifier = '"'


                        };
                        sheet.Cells["A1"].LoadFromText(file, format);
                        ExcelWorksheet firstWorksheet = package.Workbook.Worksheets[1];
                        return CExcelAList.Convertir<T>(firstWorksheet, iniciarEnFila, this.map, bVacios);
                    }
                }

            }
        }
    }
}