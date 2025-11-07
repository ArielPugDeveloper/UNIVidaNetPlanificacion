using System;
using System.Collections.Generic;
using UNIVidaNetPlanificacion.Parametrizacion;
using UVNetTransversal.ProgramacionFront.Web.WebForm;

namespace UNIVidaNetPlanificacion
{
    public partial class masterMenu : System.Web.UI.UserControl
    {
        public List<CMenu> Menu = new List<CMenu>();
        public static string RutaDominio = MasterUD.Dominio();
        protected void Page_Load(object sender, EventArgs e)
        {
            Menu = new List<CMenu>
            {
                new CMenu
                {
                    TituloMenu = "Simulación de Usuarios",
                    Icono = "fas fa-user-cog",
                    Url = CVariableURL.SeleccionarUsuario,
                    Modulo = "SimulacionUsuarios",
                    MenuNivel2 = new List<CMenuNivel2>
                    {
                        new CMenuNivel2
                        {
                            TituloMenu = "Simulacion de Usuarios",
                            Icono = "far fa-sticky-note",
                            Url = CVariableURL.SeleccionarUsuario,
                        },
                    },
                },
                new CMenu
                {
                    TituloMenu = "PLANIFICACION",
                    Icono = "fas fa-info-circle",
                    Url = "#",
                    Modulo = "ProgramacionPEE",
                    MenuNivel2 = new List<CMenuNivel2>
                    {
                        new CMenuNivel2
                        {
                            TituloMenu = "Registros PEE",
                          Icono = "far fa-sticky-note",
                            Url = CVariableURL.RegistrosPEE,
                        },
                        new CMenuNivel2
                        {
                            TituloMenu = "Menu",
                            Icono = "far fa-sticky-note",
                            Url = CVariableURL.Inicio,
                        }
                //        new CMenuNivel2
                //        {
                //            TituloMenu = "Modificar Registro PEE",
                //            Icono = "far fa-sticky-note",
                //            Url = CVariableURL.ModificarPEE,
                //        },
                //        new CMenuNivel2
                //        {
                //            TituloMenu = "Seguimiento PEE",
                //            Icono = "far fa-sticky-note",
                //            Url = CVariableURL.ModificarPEE,
                //        },
                    }
                }

                //new CMenu
                //{
                //    TituloMenu = "Programacion POA",
                //    Icono = "fas fa-info-circle",
                //    Url = "#",
                //    Modulo = "Programacion POA",
                //    MenuNivel2 = new List<CMenuNivel2>
                //    {
                //        new CMenuNivel2
                //        {
                //            TituloMenu = "Registros POA",
                //            Icono = "far fa-sticky-note",
                //            Url = CVariableURL.RegistrosPOA,
                //        },
                //        new CMenuNivel2
                //        {
                //            TituloMenu = "Generar POA",
                //            Icono = "far fa-sticky-note",
                //            Url = CVariableURL.GenerarPOA,
                //        },
                //        new CMenuNivel2
                //        {
                //            TituloMenu = "Modificar POA",
                //            Icono = "far fa-sticky-note",
                //            Url = CVariableURL.ModificarPOA,
                //        },
                //        new CMenuNivel2
                //        {
                //            TituloMenu = "Revision y Ampliacion POA",
                //            Icono = "far fa-sticky-note",
                //            Url = CVariableURL.ModificarPEE,
                //        },
                //        new CMenuNivel2
                //        {
                //            TituloMenu = "Reprogramacion POA",
                //            Icono = "far fa-sticky-note",
                //            Url = CVariableURL.ModificarPEE,
                //        },
                //    }
                //},

                //new CMenu
                //{
                //    TituloMenu = "BORRADOR",
                //    Icono = "fas fa-file-signature",
                //    Url = "#",
                //    Modulo = "Prueba",
                //    MenuNivel2 = new List<CMenuNivel2>()
                //},
                //new CMenu
                //{
                //    TituloMenu = "prueba",
                //    Icono = "far fa-mail-bulk",
                //    Url = "#",
                //    Modulo = "Prueba",
                //    MenuNivel2 = new List<CMenuNivel2>
                //    {
                //        new CMenuNivel2
                //        {
                //            TituloMenu = "Opcion de prueba",
                //            Icono = "far fa-sticky-note",
                //            Url = CVariableURL.Prueba,
                //        },
                //    }
                //}
            };
        }
    }
    public class CMenu
    {
        public string TituloMenu { get; set; }
        public string Icono { get; set; }
        public string Url { get; set; }
        public string Modulo { get; set; }

        public List<CMenuNivel2> MenuNivel2 = new List<CMenuNivel2>();

    }
    public class CMenuNivel2
    {
        public string TituloMenu { get; set; }
        public string Icono { get; set; }
        public string Url { get; set; }
        public string SubModulo_formulario { get; set; }

        public List<CMenuNivel3> MenuNivel3 = new List<CMenuNivel3>();
    }
    public class CMenuNivel3
    {
        public string TituloMenu { get; set; }
        public string Icono { get; set; }
        public string Url { get; set; }
        public string Formulario { get; set; }

    }
}