using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UNIVidaNetCoreTecnico.Parametrizacion.CargaArchivos.Interfaces;
using UVNetDTOs.DTOsGenericas.Resultado;
using UVNetUtilitarios.Serealizacion;

namespace UNIVidaNetCoreTecnico.Parametrizacion.CargaArchivos.Carga
{
    public class CCargaContenido<T>
    {
        readonly ITipoContenido<T> contenido;
        readonly ICargaContenidoAgente agenteContenido;

        public CCargaContenido(ITipoContenido<T> contenido, ICargaContenidoAgente agenteContenido)
        {
            this.contenido = contenido;
            this.agenteContenido = agenteContenido;
        }

        public CResultadoInt Cargar()
        {
            var contenidoList = contenido.ConvertirAList(1);
            if (contenidoList.Exito)
                return agenteContenido.CargaContenidoAgente(CSerealizacion.ObjetoEnJson(contenidoList.Resultado));
            else
                return new CResultadoInt() { Exito = contenidoList.Exito, Mensaje = contenidoList.Mensaje };

        }
    }
}