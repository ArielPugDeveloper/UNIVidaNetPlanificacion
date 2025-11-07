using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UNIVidaNetCoreTecnico.Parametrizacion.CargaArchivos.ExcelAList;

namespace UNIVidaNetCoreTecnico.Parametrizacion.CargaArchivos.Interfaces
{
    public interface ITipoContenido<T>
    {
        CResultadoList<T> ConvertirAList(int iniciarEnFila);
        CResultadoList<T> ConvertirAList(int iniciarEnFila, bool bVacios);

    }
}