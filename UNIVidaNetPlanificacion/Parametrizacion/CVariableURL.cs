

using System;
using System.Web;

namespace UNIVidaNetPlanificacion.Parametrizacion
{
    public class CVariableURL
    {
        public static string RutaAbsoluta = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath;
        public static readonly string Prueba = RutaAbsoluta + "/Modulos/Prueba/wfPrueba";
        public static readonly string Inicio = RutaAbsoluta + "/Modulos/ProgramacionPEE/wfInicio";
        public static readonly string RegistrosPEE = RutaAbsoluta + "/Modulos/ProgramacionPEE/wfRegistrosPEE";
        public static readonly string ModificarPEE = RutaAbsoluta + "/Modulos/ProgramacionPEE/wfModificarPEE";
        public static readonly string SeguimientoPEE = RutaAbsoluta + "/Modulos/ProgramacionPEE/wfSeguimientoPEE";
        public static readonly string RegistrosPOA = RutaAbsoluta + "/Modulos/ProgramacionPOA/wfRegistrosPOA";
        public static readonly string GenerarPOA = RutaAbsoluta + "/Modulos/ProgramacionPOA/wfGenerarPOA";
        public static readonly string ModificarPOA = RutaAbsoluta + "/Modulos/ProgramacionPOA/wfModificarPOA";
        public static readonly string ReprogramacionPOA = RutaAbsoluta + "/Modulos/ProgramacionPOA/wfReprogramacionPOA";
        public static readonly string ProgramacionPOA = RutaAbsoluta + "/Modulos/ProgramacionPOA/wfProgramacionPOA";
        public static readonly string EjecucionPOA = RutaAbsoluta + "/Modulos/ProgramacionPOA/wfEjecucion";
        public static readonly string SeguimientoPOA = RutaAbsoluta + "/Modulos/SeguimientoPOA/wfSeguimientoPOA";
        public static readonly string SeguimientoOperativo = RutaAbsoluta + "/Modulos/SeguimientoPOA/wfSeguimientoOperativo";

        public static readonly string SeleccionarUsuario = RutaAbsoluta + "/Modulos/SimulacionUsuarios/wfSeleccionarUsuario";

    }
}