using System;
using System.Collections.Generic;
using System.Web;
using UNIVidaNetPlanificacion.Parametrizacion;

namespace UNIVidaNetPlanificacion.Parametrizacion
{
    public class CGestionPermisos
    {
        public static bool EsPlanificador()
        {
            string rol = HttpContext.Current.Session[CVariableSesion.RolUsuario]?.ToString();
            return rol == CVariableSesion.RolPlanificador;
        }

        public static bool EsEncargadoResponsable()
        {
            string rol = HttpContext.Current.Session[CVariableSesion.RolUsuario]?.ToString();
            return rol == CVariableSesion.RolEncargadoResponsable;
        }

        public static bool EsDependiente()
        {
            string rol = HttpContext.Current.Session[CVariableSesion.RolUsuario]?.ToString();
            return rol == CVariableSesion.RolDependiente;
        }

        public static bool TienePermiso(Permiso permiso)
        {
            if (EsPlanificador())
                return true;

            if (EsEncargadoResponsable())
                return PermisosEncargadoResponsable.Contains(permiso);

            if (EsDependiente())
                return PermisosDependiente.Contains(permiso);

            return false;
        }

        private static readonly List<Permiso> PermisosEncargadoResponsable = new List<Permiso>
        {
            Permiso.VerRegistrosPEE, Permiso.CrearRegistroPEE, Permiso.ModificarRegistroPEE,
            Permiso.VerRegistrosPOA, Permiso.CrearRegistroPOA, Permiso.ModificarRegistroPOA,
            Permiso.AprobarRegistros, Permiso.VerReportes
        };

        private static readonly List<Permiso> PermisosDependiente = new List<Permiso>
        {
            Permiso.VerRegistrosPEE, Permiso.CrearRegistroPEE,
            Permiso.VerRegistrosPOA, Permiso.CrearRegistroPOA,
            Permiso.SolicitarAprobacion
        };
    }
}