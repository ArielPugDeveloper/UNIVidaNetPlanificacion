namespace UNIVidaNetPlanificacion.Parametrizacion
{
    public enum TipoUsuario
    {
        Planificador = 1,
        EncargadoResponsable = 2,
        Dependiente = 3
    }

    public enum Permiso
    {
        VerRegistrosPEE = 1,
        CrearRegistroPEE = 2,
        ModificarRegistroPEE = 3,
        EliminarRegistroPEE = 4,
        VerRegistrosPOA = 5,
        CrearRegistroPOA = 6,
        ModificarRegistroPOA = 7,
        EliminarRegistroPOA = 8,
        AprobarRegistros = 9,
        SolicitarAprobacion = 10,
        GestionarUsuarios = 11,
        VerReportes = 12,
        ConfiguracionSistema = 13
    }
}