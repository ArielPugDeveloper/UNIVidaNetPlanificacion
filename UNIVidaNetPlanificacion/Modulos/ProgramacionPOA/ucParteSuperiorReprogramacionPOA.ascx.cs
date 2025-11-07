using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UNIVidaNetPlanificacion.Parametrizacion;

namespace UNIVidaNetPlanificacion.Modulos.ProgramacionPOA
{
    public partial class ucParteSuperiorReprogramacionPOA : CWebControlGenerico
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ConfigurarFiltrosSegunRol();
            }
        }

        public void ConfigurarFiltrosSegunRol()
        {
            if (CGestionPermisos.EsPlanificador())
            {
                // Planificador ve filtros completos
                phFiltrosCompletos.Visible = true;
                phFiltrosSimplificados.Visible = false;
            }
            else if (CGestionPermisos.EsEncargadoResponsable() || CGestionPermisos.EsDependiente())
            {
                // Encargado Responsable y Dependiente ven filtros simplificados
                phFiltrosCompletos.Visible = false;
                phFiltrosSimplificados.Visible = true;
            }
            else
            {
                // Por defecto, ocultar todo
                phFiltrosCompletos.Visible = false;
                phFiltrosSimplificados.Visible = false;
            }
        }

        // Eventos para filtros completos (Planificador)
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            SwalAtencion("Función 'Buscar' - En desarrollo");
        }

        protected void btnHabilitar_Click(object sender, EventArgs e)
        {
            SwalAtencion("Función 'Habilitar' - En desarrollo");
        }

        protected void btnGenerarPOAExcel_Click(object sender, EventArgs e)
        {
            SwalAtencion("Función 'Generar POA (Excel)' - En desarrollo");
        }

        // Eventos para filtros simplificados (Encargado Responsable y Dependiente)
        protected void btnVerFicha_Click(object sender, EventArgs e)
        {
            SwalAtencion("Función 'Ver Ficha' - En desarrollo");
        }

        protected void btnEnviarSolicitudes_Click(object sender, EventArgs e)
        {
            SwalAtencion("Función 'Enviar Solicitudes' - En desarrollo");
        }
    }
}