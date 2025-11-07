using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UVNetDTOs.DTOsGenericas.ParametrosEntrada;

namespace AgenteServiciosPlanificacion.Modulos.ProgramacionPOA.ParametrosEntrada
{
    //Clase de parametros de entrada para ejecutar el SP POA.P_F_EX_T_REGISTRO_POA_REGISTRAR
    //------------------------------------------------------------------------------------------------------------------------------
    public class CPFExTRegistroPoaRegistrar : CPBase
    {
        public int Gestion { get; set; }
        public int TRegistroPeeFk { get; set; }
        public string DatosPoaJson { get; set; }
    }
    //------------------------------------------------------------------------------------------------------------------------------
}
