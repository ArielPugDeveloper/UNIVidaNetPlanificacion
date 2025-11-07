
using AgenteServiciosPlanificacion.Modulos.ProgramacionPEE.ParametrosEntrada;
using AgenteServiciosPlanificacion.ServiciosWebGenericas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UVNetDTOs.DTOsGenericas.Parametro;
using UVNetDTOs.DTOsGenericas.ParametrosEntrada;
using UVNetDTOs.DTOsGenericas.Resultado;

namespace AgenteServiciosPlanificacion.Modulos.ProgramacionPEE
{
    public class CAgenteProgramacionPEE
    {
        public static string NombreBdPlanificacion = "BD_PLANIFICACION.";

        //Método para ejecutar el SP BD_PLANIFICACION.PEE.P_F_AT_T_REGISTRO_PEE_LISTAR
        //------------------------------------------------------------------------------------------------------------------------------
        public static CResultadoJsonDocument FAtTRegistroPeeListar(CPFAtTRegistroPeeListar oPFAtTRegistroPeeListar)
        {
            //Creamos objeto de parametros para ejecucion de SP
            CEParametros oEParametros = new CEParametros(NombreBdPlanificacion + "PEE.P_F_AT_T_REGISTRO_PEE_LISTAR");
            //Adicionamos parametros que necesita el SP
            int c = 0;
            oEParametros.lParametroString.Add(new CParametroString() { PosicionParametro = ++c, NombreParametro = "I_USUARIO_AUT", ValorParametro = oPFAtTRegistroPeeListar.UsuarioAut });
            oEParametros.lParametroString.Add(new CParametroString() { PosicionParametro = ++c, NombreParametro = "I_CODIGO_SISTEMA", ValorParametro = oPFAtTRegistroPeeListar.CodigoSistema });

            CEParametros[] lEParametros = { oEParametros };

            ServiciosWebGenericasManagerClient oSW = new ServiciosWebGenericasManagerClient();
            return oSW.EjecutarSPJsonDocument(lEParametros);
        }
        //Método para ejecutar el SP BD_PLANIFICACION.PEE.P_F_EX_T_REGISTRO_PEE_REGISTRAR
        //------------------------------------------------------------------------------------------------------------------------------
        public static CResultadoInt FExTRegistroPeeRegistrar(CPFExTRegistroPeeRegistrar oPFExTRegistroPeeRegistrar)
        {
            //Creamos objeto de parametros para ejecucion de SP
            CEParametros oEParametros = new CEParametros(NombreBdPlanificacion + "PEE.P_F_EX_T_REGISTRO_PEE_REGISTRAR");
            //Adicionamos parametros que necesita el SP
            int c = 0;
            oEParametros.lParametroString.Add(new CParametroString() { PosicionParametro = ++c, NombreParametro = "I_USUARIO_AUT", ValorParametro = oPFExTRegistroPeeRegistrar.UsuarioAut });
            oEParametros.lParametroString.Add(new CParametroString() { PosicionParametro = ++c, NombreParametro = "I_CODIGO_SISTEMA", ValorParametro = oPFExTRegistroPeeRegistrar.CodigoSistema });
            oEParametros.lParametroInt.Add(new CParametroInt() { PosicionParametro = ++c, NombreParametro = "I_GESTION_INICIAL", ValorParametro = oPFExTRegistroPeeRegistrar.GestionInicial });
            oEParametros.lParametroInt.Add(new CParametroInt() { PosicionParametro = ++c, NombreParametro = "I_GESTION_FINAL", ValorParametro = oPFExTRegistroPeeRegistrar.GestionFinal });
            oEParametros.lParametroString.Add(new CParametroString() { PosicionParametro = ++c, NombreParametro = "I_DATOS_PEE_JSON", ValorParametro = oPFExTRegistroPeeRegistrar.DatosPeeJson });

            CEParametros[] lEParametros = { oEParametros };

            ServiciosWebGenericasManagerClient oSW = new ServiciosWebGenericasManagerClient();
            return oSW.EjecutarSPInt(lEParametros);
        }
        //------------------------------------------------------------------------------------------------------------------------------

        //Método para ejecutar el SP BD_PLANIFICACION.PEE.P_F_AT_T_PEE_LISTAR
        //------------------------------------------------------------------------------------------------------------------------------
        public static CResultadoJsonDocument FAtTPeeListar(CPFAtTPeeListar oPFAtTPeeListar)
        {
            //Creamos objeto de parametros para ejecucion de SP
            CEParametros oEParametros = new CEParametros(NombreBdPlanificacion + "PEE.P_F_AT_T_PEE_LISTAR");
            //Adicionamos parametros que necesita el SP
            int c = 0;
            oEParametros.lParametroString.Add(new CParametroString() { PosicionParametro = ++c, NombreParametro = "I_USUARIO_AUT", ValorParametro = oPFAtTPeeListar.UsuarioAut });
            oEParametros.lParametroString.Add(new CParametroString() { PosicionParametro = ++c, NombreParametro = "I_CODIGO_SISTEMA", ValorParametro = oPFAtTPeeListar.CodigoSistema });
            oEParametros.lParametroInt.Add(new CParametroInt() { PosicionParametro = ++c, NombreParametro = "I_T_REGISTRO_PEE_FK", ValorParametro = oPFAtTPeeListar.TRegistroPeeFk });

            CEParametros[] lEParametros = { oEParametros };

            ServiciosWebGenericasManagerClient oSW = new ServiciosWebGenericasManagerClient();
            return oSW.EjecutarSPJsonDocument(lEParametros);
        }
        //------------------------------------------------------------------------------------------------------------------------------

    }
}
