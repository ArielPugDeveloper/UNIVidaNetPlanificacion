using AgenteServiciosPlanificacion.Modulos.ProgramacionPOA.ParametrosEntrada;
using AgenteServiciosPlanificacion.ServiciosWebGenericas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UVNetDTOs.DTOsGenericas.Parametro;
using UVNetDTOs.DTOsGenericas.Resultado;

namespace AgenteServiciosPlanificacion.Modulos.ProgramacionPOA
{
    public class CAgenteProgramacionPOA
    {
        public static string NombreBdPlanificacion = "BD_PLANIFICACION.";

        //Método para ejecutar el SP BD_PLANIFICACION.POA.P_F_AT_T_REGISTRO_POA_LISTAR
        //------------------------------------------------------------------------------------------------------------------------------
        public static CResultadoJsonDocument FAtTRegistroPoaListar(CPFAtTRegistroPoaListar oPFAtTRegistroPoaListar)
        {
            //Creamos objeto de parametros para ejecucion de SP
            CEParametros oEParametros = new CEParametros(NombreBdPlanificacion + "POA.P_F_AT_T_REGISTRO_POA_LISTAR");
            //Adicionamos parametros que necesita el SP
            int c = 0;
            oEParametros.lParametroString.Add(new CParametroString() { PosicionParametro = ++c, NombreParametro = "I_USUARIO_AUT", ValorParametro = oPFAtTRegistroPoaListar.UsuarioAut });
            oEParametros.lParametroString.Add(new CParametroString() { PosicionParametro = ++c, NombreParametro = "I_CODIGO_SISTEMA", ValorParametro = oPFAtTRegistroPoaListar.CodigoSistema });
            oEParametros.lParametroInt.Add(new CParametroInt() { PosicionParametro = ++c, NombreParametro = "I_T_REGISTRO_PEE_FK", ValorParametro = oPFAtTRegistroPoaListar.TRegistroPeeFk });

            CEParametros[] lEParametros = { oEParametros };

            ServiciosWebGenericasManagerClient oSW = new ServiciosWebGenericasManagerClient();
            return oSW.EjecutarSPJsonDocument(lEParametros);
        }
        //------------------------------------------------------------------------------------------------------------------------------



        //Método para ejecutar el SP BD_PLANIFICACION.POA.P_F_EX_T_REGISTRO_POA_REGISTRAR
        //------------------------------------------------------------------------------------------------------------------------------
        public static CResultadoInt FExTRegistroPoaRegistrar(CPFExTRegistroPoaRegistrar oPFExTRegistroPoaRegistrar)
        {
            //Creamos objeto de parametros para ejecucion de SP
            CEParametros oEParametros = new CEParametros(NombreBdPlanificacion + "POA.P_F_EX_T_REGISTRO_POA_REGISTRAR");
            //Adicionamos parametros que necesita el SP
            int c = 0;
            oEParametros.lParametroString.Add(new CParametroString() { PosicionParametro = ++c, NombreParametro = "I_USUARIO_AUT", ValorParametro = oPFExTRegistroPoaRegistrar.UsuarioAut });
            oEParametros.lParametroString.Add(new CParametroString() { PosicionParametro = ++c, NombreParametro = "I_CODIGO_SISTEMA", ValorParametro = oPFExTRegistroPoaRegistrar.CodigoSistema });
            oEParametros.lParametroInt.Add(new CParametroInt() { PosicionParametro = ++c, NombreParametro = "I_GESTION", ValorParametro = oPFExTRegistroPoaRegistrar.Gestion });
            oEParametros.lParametroInt.Add(new CParametroInt() { PosicionParametro = ++c, NombreParametro = "I_T_REGISTRO_PEE_FK", ValorParametro = oPFExTRegistroPoaRegistrar.TRegistroPeeFk });
            oEParametros.lParametroString.Add(new CParametroString() { PosicionParametro = ++c, NombreParametro = "I_DATOS_POA_JSON", ValorParametro = oPFExTRegistroPoaRegistrar.DatosPoaJson });

            CEParametros[] lEParametros = { oEParametros };

            ServiciosWebGenericasManagerClient oSW = new ServiciosWebGenericasManagerClient();
            return oSW.EjecutarSPInt(lEParametros);
        }
        //------------------------------------------------------------------------------------------------------------------------------


    }
}
