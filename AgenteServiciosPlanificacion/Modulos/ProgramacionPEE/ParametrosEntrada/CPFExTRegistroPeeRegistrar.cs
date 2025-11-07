using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UVNetDTOs.DTOsGenericas.ParametrosEntrada;

namespace AgenteServiciosPlanificacion.Modulos.ProgramacionPEE.ParametrosEntrada
{
    //Clase de parametros de entrada para ejecutar el SP PEE.P_F_EX_T_REGISTRO_PEE_REGISTRAR
    //------------------------------------------------------------------------------------------------------------------------------
    public class CPFExTRegistroPeeRegistrar : CPBase
    {
        public int GestionInicial { get; set; }
        public int GestionFinal { get; set; }
        public string DatosPeeJson { get; set; }
    }
    //------------------------------------------------------------------------------------------------------------------------------
}
