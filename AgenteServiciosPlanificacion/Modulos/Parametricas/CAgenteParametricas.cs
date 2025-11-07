using AgenteServiciosPlanificacion.Modulos.Parametricas.ParametrosEntrada;
using AgenteServiciosPlanificacion.ServiciosWebGenericas;

using UVNetDTOs.DTOsGenericas.Parametro;
using UVNetDTOs.DTOsGenericas.Resultado;

namespace AgenteServiciosPlanificacion.Modulos.Parametricas
{
    public class CAgenteParametricas
    {
        public static string NombreBdPlanificacion = "BD_PLANIFICACION.";
        //Método para ejecutar el SP BD_UV.PARAMETRICAS.P_UV_PAR_GENERICA_L
        //------------------------------------------------------------------------------------------------------------------------------
        public static CResultadoJsonDocument UvParGenericaL(CPUvParGenericaL oPUvParGenericaL)
        {
            //Creamos objeto de parametros para ejecucion de SP
            CEParametros oEParametros = new CEParametros("BD_UV.PARAMETRICAS.P_UV_PAR_GENERICA_L");
            //Adicionamos parametros que necesita el SP
            int c = 0;
            oEParametros.lParametroString.Add(new CParametroString() { PosicionParametro = ++c, NombreParametro = "I_USUARIO_AUT", ValorParametro = oPUvParGenericaL.UsuarioAut });
            oEParametros.lParametroString.Add(new CParametroString() { PosicionParametro = ++c, NombreParametro = "I_CODIGO_SISTEMA", ValorParametro = oPUvParGenericaL.CodigoSistema });
            oEParametros.lParametroString.Add(new CParametroString() { PosicionParametro = ++c, NombreParametro = "I_AGRUPADOR", ValorParametro = oPUvParGenericaL.Agrupador });

            CEParametros[] lEParametros = { oEParametros };

            ServiciosWebGenericasManagerClient oSW = new ServiciosWebGenericasManagerClient();
            return oSW.EjecutarSPJsonDocument(lEParametros);
        }
        //------------------------------------------------------------------------------------------------------------------------------
        public static CResultadoJsonDocument FAtParDllUnividaL(CPFAtParDllUnividaL oPFAtParDllUnividaL)
        {
            var oEParametros = new CEParametros("BD_UV.PARAMETRICAS.P_F_AT_PAR_DLL_UNIVIDA_L");
            int c = 0;
            oEParametros.lParametroString.Add(new CParametroString { PosicionParametro = ++c, NombreParametro = "I_USUARIO_AUT", ValorParametro = oPFAtParDllUnividaL.UsuarioAut });
            oEParametros.lParametroString.Add(new CParametroString { PosicionParametro = ++c, NombreParametro = "I_CODIGO_SISTEMA", ValorParametro = oPFAtParDllUnividaL.CodigoSistema });
            CEParametros[] lEParametros = { oEParametros };
            return new ServiciosWebGenericasManagerClient().EjecutarSPJsonDocument(lEParametros);
        }

        //Método para ejecutar el SP BD_UV.INFORMACION.P_DESCRIPCION_SISTEMA_O
        //------------------------------------------------------------------------------------------------------------------------------
        public static CResultadoString DescripcionSistemaO(CPDescripcionSistemaO oPDescripcionSistemaO)
        {
            //Creamos objeto de parametros para ejecucion de SP
            CEParametros oEParametros = new CEParametros("BD_UV.INFORMACION.P_DESCRIPCION_SISTEMA_O");
            //Adicionamos parametros que necesita el SP
            int c = 0;
            oEParametros.lParametroString.Add(new CParametroString() { PosicionParametro = ++c, NombreParametro = "I_USUARIO_AUT", ValorParametro = oPDescripcionSistemaO.UsuarioAut });
            oEParametros.lParametroString.Add(new CParametroString() { PosicionParametro = ++c, NombreParametro = "I_CODIGO_SISTEMA", ValorParametro = oPDescripcionSistemaO.CodigoSistema });
            oEParametros.lParametroString.Add(new CParametroString() { PosicionParametro = ++c, NombreParametro = "I_SISTEMA_FK", ValorParametro = oPDescripcionSistemaO.SistemaFk });

            CEParametros[] lEParametros = { oEParametros };

            ServiciosWebGenericasManagerClient oSW = new ServiciosWebGenericasManagerClient();
            return oSW.EjecutarSPString(lEParametros);
        }
        //------------------------------------------------------------------------------------------------------------------------------
        //Método para ejecutar el SP BD_UV.INFORMACION.P_NOTICIAS_L
        //------------------------------------------------------------------------------------------------------------------------------
        public static CResultadoJsonDocument NoticiasL(CPNoticiasL oPNoticiasL)
        {
            //Creamos objeto de parametros para ejecucion de SP
            CEParametros oEParametros = new CEParametros("BD_UV.INFORMACION.P_NOTICIAS_L");
            //Adicionamos parametros que necesita el SP
            int c = 0;
            oEParametros.lParametroString.Add(new CParametroString() { PosicionParametro = ++c, NombreParametro = "I_USUARIO_AUT", ValorParametro = oPNoticiasL.UsuarioAut });
            oEParametros.lParametroString.Add(new CParametroString() { PosicionParametro = ++c, NombreParametro = "I_CODIGO_SISTEMA", ValorParametro = oPNoticiasL.CodigoSistema });

            CEParametros[] lEParametros = { oEParametros };

            ServiciosWebGenericasManagerClient oSW = new ServiciosWebGenericasManagerClient();
            return oSW.EjecutarSPJsonDocument(lEParametros);
        }

        //Método para ejecutar el SP BD_PLANIFICACION.PARAMETRICAS.P_F_AT_PAR_PEE_REGISTRO_PEE_ESTADO_LISTAR
        //------------------------------------------------------------------------------------------------------------------------------
        public static CResultadoJsonDocument FAtParPeeRegistroPeeEstadoListar(CPFAtParPeeRegistroPeeEstadoListar oPFAtParPeeRegistroPeeEstadoListar)
        {
            //Creamos objeto de parametros para ejecucion de SP
            CEParametros oEParametros = new CEParametros(NombreBdPlanificacion + "PARAMETRICAS.P_F_AT_PAR_PEE_REGISTRO_PEE_ESTADO_LISTAR");
            //Adicionamos parametros que necesita el SP
            int c = 0;
            oEParametros.lParametroString.Add(new CParametroString() { PosicionParametro = ++c, NombreParametro = "I_USUARIO_AUT", ValorParametro = oPFAtParPeeRegistroPeeEstadoListar.UsuarioAut });
            oEParametros.lParametroString.Add(new CParametroString() { PosicionParametro = ++c, NombreParametro = "I_CODIGO_SISTEMA", ValorParametro = oPFAtParPeeRegistroPeeEstadoListar.CodigoSistema });

            CEParametros[] lEParametros = { oEParametros };

            ServiciosWebGenericasManagerClient oSW = new ServiciosWebGenericasManagerClient();
            return oSW.EjecutarSPJsonDocument(lEParametros);
        }
        //------------------------------------------------------------------------------------------------------------------------------

    }
}
