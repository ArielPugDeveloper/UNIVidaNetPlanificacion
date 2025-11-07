using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UVNetDTOs.DTOsGenericas.ParametrosEntrada;

namespace AgenteServiciosPlanificacion.Modulos.ProgramacionPEE.ParametrosEntrada
{
    //Clase de parametros de entrada para ejecutar el SP PEE.P_F_AT_T_PEE_LISTAR
    //------------------------------------------------------------------------------------------------------------------------------
    public class CPFAtTPeeListar : CPBase
    {
        public int TRegistroPeeFk { get; set; }
    }
    //------------------------------------------------------------------------------------------------------------------------------
}
