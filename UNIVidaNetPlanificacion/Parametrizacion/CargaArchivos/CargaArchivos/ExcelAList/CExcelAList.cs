using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace UNIVidaNetCoreTecnico.Parametrizacion.CargaArchivos.ExcelAList
{
    public static class CExcelAList
    {
        public static CResultadoList<T> Convertir<T>(this ExcelWorksheet excelWorksheet, int iniciarEnFila, Dictionary<string, string> map = null, bool bVacios = true) where T : new()
        {

            CResultadoList<T> oResultadoXlsAList = new CResultadoList<T>();

            var doubleADateTime = new Func<double, DateTime>(excelDate =>
            {
                var fechaReferencia = new DateTime(1900, 1, 1);
                if (excelDate < 1)
                {
                    var Hora = DateTime.FromOADate(excelDate);
                    Hora = Hora.AddYears(1900 - Hora.Year);
                    Hora = Hora.AddMonths(1 - Hora.Month);
                    Hora = Hora.AddDays(1 - Hora.Day);
                    return Hora;
                }

                if (excelDate > 60d)
                    excelDate = excelDate - 2;
                else
                    excelDate = excelDate - 1;
                return fechaReferencia.AddDays(excelDate);
            });

            var props = typeof(T).GetProperties()
                .Select(prop =>
                {
                    var displayAttribute = (DisplayAttribute)prop.GetCustomAttributes(typeof(DisplayAttribute), false).FirstOrDefault();
                    return new
                    {
                        Name = prop.Name,
                        DisplayName = displayAttribute == null ? prop.Name : displayAttribute.Name,
                        Order = displayAttribute == null || !displayAttribute.GetOrder().HasValue ? 999 : displayAttribute.Order,
                        PropertyInfo = prop,
                        PropertyType = prop.PropertyType,
                        HasDisplayName = displayAttribute != null
                    };
                })
            .Where(prop => !string.IsNullOrWhiteSpace(prop.DisplayName))
            .ToList();

            var listaRetorno = new List<T>();
            var columnas = new List<CExcelMap>();
            if (excelWorksheet.Dimension == null)
            {
                return RetornarError<T>("El archivo está vacío");
            }

            var inicio = excelWorksheet.Dimension.Start;
            var fin = excelWorksheet.Dimension.End;
            var inicioColumna = inicio.Column;
            var inicioFila = iniciarEnFila == 0 ? inicio.Row : iniciarEnFila;
            var finColumna = ObtenerUltimaColumnaUsada(excelWorksheet, iniciarEnFila);//fin.Column;
            var finFila = ObtenerUltimaFilaUsada(excelWorksheet, iniciarEnFila);

            if (finColumna == 0 || finFila == 0)
            {
                return RetornarError<T>("El formato del archivo no es el correcto");
            }
            // Comprobar nombres de columnas
            for (int col = inicioColumna; col <= finColumna; col++)
            {
                var cellValue = (excelWorksheet.Cells[inicioFila, col].Value ?? string.Empty).ToString().Trim();
                if (!string.IsNullOrWhiteSpace(cellValue))
                {
                    if (map != null && map.Count != 0)
                        if (!map.ContainsKey(cellValue))
                            return RetornarError<T>($"El nombre de la columna \"{cellValue}\" no es valida, favor verifique que los nombres sean los correctos.");
                    columnas.Add(new CExcelMap()
                    {
                        Nombre = cellValue,
                        MapeadoA = map == null || map.Count == 0 ?
                            cellValue :
                            map.ContainsKey(cellValue) ? map[cellValue] : string.Empty,
                        Indice = col
                    });
                }
                else
                {
                    return RetornarError<T>($"La columna nro. {col + 1} no contiene un nombre de cabecera, el archivo excel debe contener una cabecera válida.");
                }
            }

            // Recorrer todas las filas
            for (int i = inicioFila + 1; i <= finFila; i++)
            {
                var item = new T();
                foreach (var column in columnas)
                {
                    var value = excelWorksheet.Cells[i, column.Indice].Value;
                    var valueStr = string.Empty;
                    if (bVacios)
                    {
                        valueStr = value == null ? string.Empty : value.ToString().Trim();
                    }
                    else
                    {
                        valueStr = value == null ? null : value.ToString().Trim();
                    }

                    try
                    {
                        var propAux = string.IsNullOrWhiteSpace(column.MapeadoA) ?
                                              null :
                                              props.First(p => p.Name.Equals(column.MapeadoA, StringComparison.OrdinalIgnoreCase));
                    }
                    catch (Exception e)
                    {

                        return RetornarError<T>($"Ninguna columna del archivo cargado coincide con lo esperado.");
                    }
                    var prop = string.IsNullOrWhiteSpace(column.MapeadoA) ?
                                              null :
                                              props.First(p => p.Name.Equals(column.MapeadoA, StringComparison.OrdinalIgnoreCase));

                    if (prop != null)
                    {
                        var propertyType = prop.PropertyType;
                        object parsedValue = null;

                        if (propertyType == typeof(int?) || propertyType == typeof(int))
                        {
                            int val;
                            if (valueStr == "")
                                valueStr = "0";
                            if (int.TryParse(valueStr, out val))
                                parsedValue = val;
                            else
                                return RetornarError<T>($"La columna \"{column.Nombre}\" no contiene un dato entero válido en la fila nro. {i}");
                        }
                        else if (propertyType == typeof(short?) || propertyType == typeof(short))
                        {
                            short val;
                            if (short.TryParse(valueStr, out val))
                                parsedValue = val;
                            else
                                return RetornarError<T>($"La columna \"{column.Nombre}\" no contiene un dato válido en la fila nro. {i}");
                        }
                        else if (propertyType == typeof(long?) || propertyType == typeof(long))
                        {
                            long val;
                            if (long.TryParse(valueStr, out val))
                                parsedValue = val;
                            else
                                return RetornarError<T>($"La columna \"{column.Nombre}\" no contiene un dato válido en la fila nro. {i}");
                        }
                        else if (propertyType == typeof(decimal?) || propertyType == typeof(decimal))
                        {
                            decimal val;
                            if (valueStr == "")
                                valueStr = "0";
                            if (decimal.TryParse(valueStr, out val))
                                parsedValue = val;
                            else
                                return RetornarError<T>($"La columna \"{column.Nombre}\" no contiene un dato decimal válido en la fila nro. {i}");
                        }
                        else if (propertyType == typeof(double?) || propertyType == typeof(double))
                        {
                            double val;
                            if (double.TryParse(valueStr, out val))
                                parsedValue = val;
                            else
                                return RetornarError<T>($"La columna \"{column.Nombre}\" no contiene un dato válido en la fila nro. {i}");

                        }
                        else if (propertyType == typeof(DateTime?) || propertyType == typeof(DateTime))
                        {
                            try
                            {

                                if (value.GetType() == typeof(double))
                                {
                                    parsedValue = doubleADateTime((double)value);
                                }
                                else if (value.GetType() == typeof(DateTime))
                                    parsedValue = value;
                                else if (EsFecha(value.ToString()))
                                    parsedValue = Convert.ToDateTime(value.ToString());
                            }
                            catch
                            {
                                return RetornarError<T>($"La columna \"{column.Nombre}\" no contiene un dato fecha u hora válido en la fila nro. {i}");
                            }
                        }
                        else if (propertyType.IsEnum)
                        {
                            try
                            {
                                parsedValue = Enum.ToObject(propertyType, int.Parse(valueStr));
                            }
                            catch
                            {
                                parsedValue = Enum.ToObject(propertyType, 0);
                            }
                        }
                        else if (propertyType == typeof(string))
                        {
                            parsedValue = valueStr;
                        }
                        else
                        {
                            try
                            {
                                parsedValue = Convert.ChangeType(value, propertyType);
                            }
                            catch
                            {
                                parsedValue = valueStr;
                            }
                        }

                        try
                        {
                            prop.PropertyInfo.SetValue(item, parsedValue);
                        }
                        catch
                        {
                            return RetornarError<T>($"La columna \"{column.Nombre}\" no contiene un dato válido en la fila nro. {i}");
                        }
                    }
                }

                listaRetorno.Add(item);
            }
            oResultadoXlsAList.Resultado = listaRetorno;
            oResultadoXlsAList.Exito = true;
            return oResultadoXlsAList;
        }
        public static Boolean EsFecha(String fecha)
        {
            try
            {
                Convert.ToDateTime(fecha);
                return true;
            }
            catch
            {
                return false;
            }
        }
        private static CResultadoList<T> RetornarError<T>(string mensaje)
        {
            return new CResultadoList<T>
            {
                Mensaje = mensaje,
                Exito = false
            };
        }

        public static int ObtenerUltimaFilaUsada(ExcelWorksheet sheet, int inicioDeFila)
        {
            if (sheet.Dimension == null) { return 0; } // Si el excel no tiene contenido
            var row = sheet.Dimension.End.Row;
            while (row >= 1)
            {
                if (row >= inicioDeFila)
                {
                    var range = sheet.Cells[row, 1, row, sheet.Dimension.End.Column];
                    if (range.Any(c => !string.IsNullOrEmpty(c.Text)))
                    {
                        break;
                    }
                    row--;
                }
            }
            return row;
        }
        public static int ObtenerUltimaColumnaUsada(ExcelWorksheet sheet, int inicioDeFila)
        {
            if (sheet.Dimension == null) { return 0; } // Si el excel no tiene contenido
            var column = sheet.Dimension.End.Column;
            while (column >= 1)
            {
                var range = sheet.Cells[inicioDeFila, column];
                if (range.Any(c => !string.IsNullOrEmpty(c.Text)))
                {
                    break;
                }
                column--;
            }
            return column;
        }
    }
}