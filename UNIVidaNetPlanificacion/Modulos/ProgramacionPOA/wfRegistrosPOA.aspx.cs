using AgenteServiciosPlanificacion.Modulos.ProgramacionPOA;
using AgenteServiciosPlanificacion.Modulos.ProgramacionPOA.ParametrosEntrada;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using UNIVidaNetPlanificacion.Parametrizacion;
using UVNetDTOs.DTOsGenericas.Resultado;

namespace UNIVidaNetPlanificacion.Modulos.ProgramacionPOA
{
    public partial class wfRegistrosPOA : CWebFormGenerico
    {
        // Variable temporal para guardar el Número de Registro POA
        private string NumeroRegistroPOA
        {
            get
            {
                if (ViewState["NumeroRegistroPOA"] != null)
                    return ViewState["NumeroRegistroPOA"].ToString();
                return "";
            }
            set
            {
                ViewState["NumeroRegistroPOA"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            CodigoSistema = "070-001-001-001";
            if (!IsPostBack)
            {
                ValidarAccesoUsuario();
                
                // Obtener el Número de Registro desde QueryString (viene de wfRegistrosPEE)
                if (!string.IsNullOrEmpty(Request.QueryString["Registro"]))
                {
                    NumeroRegistroPOA = Request.QueryString["Registro"];
                }
                
                CargarDatosPOA();

                ucBotonGenerarPOA1.ConfigurarVisibilidad();
                
                // Mostrar variable temporal en consola
                ConsoleLog($"NumeroRegistroPOA en wfRegistrosPOA: '{NumeroRegistroPOA}'");
            }
            else 
            {
                ValidarAccesoUsuario();
            }
        }

        private void CargarDatosPOA()
        {
            // Validar que tengamos el número de registro PEE
            if (string.IsNullOrEmpty(NumeroRegistroPOA))
            {
                SwalError("No se pudo obtener el número de registro PEE. Por favor, regrese a Registros PEE e intente nuevamente.");
                return;
            }

            // Convertir el número de registro a entero
            int tRegistroPeeFk = 0;
            if (!int.TryParse(NumeroRegistroPOA, out tRegistroPeeFk))
            {
                SwalError("El número de registro PEE no es válido.");
                return;
            }

            // Crear objeto de parámetros
            CPFAtTRegistroPoaListar oPFAtTRegistroPoaListar = new CPFAtTRegistroPoaListar();
            oPFAtTRegistroPoaListar.UsuarioAut = Usuario;
            oPFAtTRegistroPoaListar.CodigoSistema = CodigoSistema;
            oPFAtTRegistroPoaListar.TRegistroPeeFk = tRegistroPeeFk;

            // Ejecutar SP
            ConsoleLog($"Enviando al SP: TRegistroPeeFk={tRegistroPeeFk}");
            CResultadoJsonDocument oResultadoJsonDocumentRegistro = CAgenteProgramacionPOA.FAtTRegistroPoaListar(oPFAtTRegistroPoaListar);
            
            if (oResultadoJsonDocumentRegistro.Exito)
            {
                ConsoleLog("JSON de BD: " + oResultadoJsonDocumentRegistro.Resultado);
                CargarJsonEnGridView(ref gvRegistrosPOA, oResultadoJsonDocumentRegistro.Resultado);
            }
            else
            {
                SwalAtencion(oResultadoJsonDocumentRegistro.Mensaje);
            }
        }

        private void ConfigurarOpcionesGridView()
        {
            foreach (System.Web.UI.WebControls.GridViewRow row in gvRegistrosPOA.Rows)
            {
                if (row.RowType == System.Web.UI.WebControls.DataControlRowType.DataRow)
                {
                    var ucOpciones = row.FindControl("ucOpcionesRegistrosPOA") as ucOpcionesRegistrosPOA;
                    if (ucOpciones != null)
                    {
                        ucOpciones.ConfigurarOpcionesSegunRol();
                    }
                }
            }
        }

        protected void gvRegistrosPOA_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == System.Web.UI.WebControls.DataControlRowType.DataRow)
            {
                // Encontrar el UserControl en la fila
                var ucOpciones = e.Row.FindControl("ucOpcionesRegistrosPOA") as ucOpcionesRegistrosPOA;
                if (ucOpciones != null)
                {
                    // Configurar las opciones según el rol del usuario
                    ucOpciones.ConfigurarOpcionesSegunRol();
                }
            }
        }

        protected void btnGenerarPEEExcel_Click(object sender, EventArgs e)
        {
            // Lógica para generar PEE en Excel
            SwalCorrecto("Generando archivo PEE en Excel...");
        }

        protected void lnkVolver_Click(object sender, EventArgs e)
        {
            // Volver a la página anterior (Registros PEE)
            Response.Redirect("~/Modulos/ProgramacionPEE/wfRegistrosPEE.aspx");
        }

        public string ObtenerNumeroRegistroPOA()
        {
            return NumeroRegistroPOA;
        }

        private void ConsoleLog(string mensaje)
        {
            string mensajeSafe = mensaje.Replace("'", "\\'").Replace("\r", "").Replace("\n", " ");
            string script = "console.log('[SERVER] " + mensajeSafe + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "consoleLog" + Guid.NewGuid(), script, true);
        }
    }
}