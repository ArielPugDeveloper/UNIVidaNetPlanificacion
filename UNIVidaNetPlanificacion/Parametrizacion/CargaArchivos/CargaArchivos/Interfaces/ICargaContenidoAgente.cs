using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UVNetDTOs.DTOsGenericas.Resultado;

namespace UNIVidaNetCoreTecnico.Parametrizacion.CargaArchivos.Interfaces
{
    public interface ICargaContenidoAgente
    {
        CResultadoInt CargaContenidoAgente(string datosJson);
    }
}
