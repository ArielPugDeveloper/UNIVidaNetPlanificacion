using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using OfficeOpenXml;
using UNIVidaNetPlanificacion.Parametrizacion;
using UNIVidaNetCoreTecnico.Parametrizacion.CargaArchivos.ExcelAList;
using UNIVidaNetPlanificacion.Parametrizacion.CargaArchivos.ExcelAList;
using UNIVidaNetPlanificacion.Parametrizacion.CargaArchivos.MapeoExcel;
using UVNetDTOs.DTOsGenericas.Resultado;
using UVNetTransversal.Almacenamiento.Archivos;
using UVNetUtilitarios.Serealizacion;
using AgenteServiciosPlanificacion.Modulos.ProgramacionPEE;
using AgenteServiciosPlanificacion.Modulos.ProgramacionPEE.ParametrosEntrada;
using UVNetTransversal.Notificaciones.Mail;
using UVNetTransversal.ProgramacionFront.Web.WebForm;

namespace UNIVidaNetPlanificacion.Modulos.ProgramacionPEE
{
    public partial class wfNuevoPEE : CWebFormGenerico
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CodigoSistema = "064-001-001-001";

            if (!IsPostBack)
            {
                ValidarAccesoUsuario();
                if (!CGestionPermisos.EsPlanificador())
                {
                    SwalError("Acceso Denegado", "Solo el Planificador puede acceder a esta página.");
                    Response.Redirect("~/Default.aspx");
                    return;
                }

                // Los labels de gestión inicial y final empiezan vacíos
                // Se llenarán cuando se cargue el Excel desde el modal
                lblGestionInicial.Text = "";
                lblGestionFinal.Text = "";
            }
            else
            {
                ValidarUsuario();
            }

            // SIEMPRE cargar indicadores (incluso en postback) para que persistan los datos
            CargarIndicadores();
        }

        private void CargarIndicadores()
        {
            // Obtener datos desde HiddenField
            string jsonExcel = hfDatosIndicadoresCargar.Value;

            // Verificar si hay datos cargados desde el Excel
            if (!string.IsNullOrEmpty(jsonExcel))
            {
                // Convertir el JSON del Excel al formato del GridView
                string jsonGridView = ConvertirJsonExcelAGridView(jsonExcel);
                CargarJsonEnGridView(ref gvIndicadores, jsonGridView);
                return;
            }

            // Si no hay datos del Excel, mostrar tabla completamente vacía (sin filas)
            string datosVacios = @"[]";
            CargarJsonEnGridView(ref gvIndicadores, datosVacios);
        }

        private string ConvertirJsonExcelAGridView(string jsonExcel)
        {
            try
            {
                // Deserializar el JSON del Excel a una lista de CIndicadoresPEE
                var listaExcel = Newtonsoft.Json.JsonConvert.DeserializeObject<List<CIndicadoresPEE>>(jsonExcel);

                // Crear una lista de objetos anónimos con los nombres esperados por el GridView
                var listaGridView = new List<object>();

                int id = 1;
                foreach (var item in listaExcel)
                {
                    var obj = new Dictionary<string, object>
                    {
                        { "Id", id++.ToString() },
                        { "Perspectiva", item.Perspectiva ?? "" },
                        { "ObjetivosEstrategicos", item.ObjetivoEstrategico ?? "" },
                        { "AccionesEstrategicas", item.AccionEstrategica ?? "" },
                        { "Resultado", item.Resultado ?? "" },
                        { "LineaBase", item.LineaBase ?? "" },
                        { "Indicador", item.Indicador ?? "" },
                        { "Meta1", item.Meta1 ?? "" },
                        { "Meta2", item.Meta2 ?? "" },
                        { "Meta3", item.Meta3 ?? "" },
                        { "Meta4", item.Meta4 ?? "" },
                        { "Meta5", item.Meta5 ?? "" },
                        { "Meta", item.Meta ?? "" },
                        { "Responsable PEE", item.ResponsablePEE ?? "" },
                        { "Responsable PEE FK", item.ResponsablePEEFK ?? "" }
                    };
                    listaGridView.Add(obj);
                }

                // Serializar de vuelta a JSON
                return Newtonsoft.Json.JsonConvert.SerializeObject(listaGridView);
            }
            catch (Exception ex)
            {
                return "[]"; // Retornar array vacío en caso de error
            }
        }

        protected void lnkVolver_Click(object sender, EventArgs e)
        {
            // Volver específicamente a la página de Registros PEE
            Response.Redirect("wfRegistrosPEE.aspx");
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                // Recorrer todas las filas del GridView y extraer los valores de los TextBoxes
                List<Dictionary<string, string>> datosModificados = new List<Dictionary<string, string>>();

                foreach (GridViewRow fila in gvIndicadores.Rows)
                {
                    if (fila.RowType == DataControlRowType.DataRow)
                    {
                        Dictionary<string, string> datosFila = new Dictionary<string, string>();

                        // Extraer valores de cada TextBox en la fila
                        var textBoxes = fila.Controls.OfType<TextBox>().ToList();
                        foreach (var textBox in textBoxes)
                        {
                            string nombreCampo = textBox.ID.Replace("txt", "");
                            datosFila[nombreCampo] = textBox.Text;
                        }

                        if (datosFila.Count > 0)
                        {
                            datosModificados.Add(datosFila);
                        }
                    }
                }

                // Aquí iría la lógica para guardar en base de datos
                // Por ahora, solo mostramos un mensaje de éxito

                string mensaje = $"Se han procesado {datosModificados.Count} filas con modificaciones.";
                SwalCorrecto(mensaje);
            }
            catch (Exception ex)
            {
                SwalError("Error al guardar los cambios: " + ex.Message);
            }
        }

        protected void btnRegistrarPEE_Click(object sender, EventArgs e)
            {
                try
                {
                // 1. Validar que se hayan cargado las gestiones
                if (string.IsNullOrEmpty(lblGestionInicial.Text) || string.IsNullOrEmpty(lblGestionFinal.Text))
                {
                    SwalError("Debe cargar primero un archivo Excel con el botón 'Cargar Otro PEE' para establecer las gestiones.");
                    return;
                }

                // 2. Validar que haya datos del Excel cargados
                if (string.IsNullOrEmpty(hfDatosIndicadoresCargar.Value))
                {
                    SwalError("Debe cargar primero un archivo Excel con los indicadores.");
                    return;
                }

                // 3. Obtener las gestiones de los labels
                int gestionInicial = int.Parse(lblGestionInicial.Text);
                int gestionFinal = int.Parse(lblGestionFinal.Text);

                // 4. Crear el objeto de parámetros
                CPFExTRegistroPeeRegistrar oPFExTRegistroPeeRegistrar = new CPFExTRegistroPeeRegistrar();
                oPFExTRegistroPeeRegistrar.UsuarioAut = Usuario;
                oPFExTRegistroPeeRegistrar.CodigoSistema = CodigoSistema;
                oPFExTRegistroPeeRegistrar.GestionInicial = gestionInicial;
                oPFExTRegistroPeeRegistrar.GestionFinal = gestionFinal;
                oPFExTRegistroPeeRegistrar.DatosPeeJson = hfDatosIndicadoresCargar.Value;
                
                // 5. Ejecutar el SP
                ConsoleLog($"ENVIANDO AL SP: GestionInicial={gestionInicial}, GestionFinal={gestionFinal}");
                ConsoleLog($"JSON: {hfDatosIndicadoresCargar.Value}");
                CResultadoInt oResultadoInt = CAgenteProgramacionPEE.FExTRegistroPeeRegistrar(oPFExTRegistroPeeRegistrar);
                ConsoleLog($"RESULTADO SP: Exito={oResultadoInt.Exito}, Mensaje={oResultadoInt.Mensaje}");
                
                // 6. Verificar resultado
                if (oResultadoInt.Exito)
                {
                    // 7. ENVIAR CORREO DE NOTIFICACIÓN
                    int registroPeeId = oResultadoInt.Resultado;
                    ConsoleLog($"ID DEL REGISTRO PEE CREADO: {registroPeeId}");
                    
                    try
                    {
                        EnviarNotificacionPEE(gestionInicial, gestionFinal, registroPeeId);
                    }
                    catch (Exception exMail)
                    {
                        ConsoleLog($"ERROR AL ENVIAR CORREO: {exMail.Message}");
                        // No detenemos el flujo si falla el correo
                    }

                    // Limpiar los datos después de registrar
                    hfDatosIndicadoresCargar.Value = "";
                    hfArchivoIndicadoresCargar.Value = "";
                    hfGestionInicial.Value = "";
                    hfGestionFinal.Value = "";
                    lblGestionInicial.Text = "";
                    lblGestionFinal.Text = "";








                    string script = @"
                        Swal.fire({
                            title: '¡Registrado!',
                            text: 'El nuevo PEE ha sido registrado correctamente.',
                            icon: 'success',
                            confirmButtonText: 'Aceptar'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                window.location.href = 'wfRegistrosPEE.aspx';
                            }
                        });
                    ";
                    ScriptManager.RegisterStartupScript(this, GetType(), "RegistroExitoso", script, true);
                    }
                    else
                    {
                    SwalError("Error al registrar: " + oResultadoInt.Mensaje);
                    }
                }
            catch (FormatException)
            {
                SwalError("Las gestiones deben ser números válidos.");
                }
                catch (Exception ex)
                {
                // Log detallado para debugging
                string errorDetallado = $"Error: {ex.Message}\n\nStackTrace: {ex.StackTrace}";
                if (ex.InnerException != null)
                {
                    errorDetallado += $"\n\nInnerException: {ex.InnerException.Message}";
                }
                ConsoleLog($"ERROR AL REGISTRAR PEE: {errorDetallado}");
                SwalError("Error al registrar el PEE: " + ex.Message);
            }
        }

        protected void btnCargarOtroPEE_Click(object sender, EventArgs e)
        {
            try
            {
                // Validar que se haya seleccionado un archivo
                if (!fuArchivoSobrescribirPEE.HasFile)
                {
                    SwalError("Por favor, seleccione un archivo Excel.");
                    return;
                }

                // Validar extensión del archivo
                string extension = System.IO.Path.GetExtension(fuArchivoSobrescribirPEE.FileName).ToUpper();
                if (extension != ".XLS" && extension != ".XLSX")
                {
                    SwalError("El archivo debe ser de tipo Excel (.xls o .xlsx)");
                    return;
                }

                // Leer el archivo como byte[]
                byte[] archivoBytes = fuArchivoSobrescribirPEE.FileBytes;

                // Validar y convertir el Excel
                var resultado = ValidarYConvertirExcelCargar(archivoBytes);

                if (!resultado.Exito)
                {
                    SwalError(resultado.Mensaje);
                    return;
                }

                // Serializar a JSON
                string json = CSerealizacion.ObjetoEnJson(resultado.Resultado);
                
                // DEBUG: Mostrar el primer elemento para verificar ResponsablePEEFK
                if (resultado.Resultado != null && resultado.Resultado.Count > 0)
                {
                    var primerElemento = resultado.Resultado[0];
                    ConsoleLog($"DEBUG - ResponsablePEEFK del primer elemento: '{primerElemento.ResponsablePEEFK}'");
                }
                
                ConsoleLog(json); // Mostrar solo el JSON en la consola

                // Guardar en HiddenField
                hfDatosIndicadoresCargar.Value = json;
                hfArchivoIndicadoresCargar.Value = fuArchivoSobrescribirPEE.FileName;

                // Leer las gestiones desde los HiddenFields y actualizar los labels
                string gestionInicial = hfGestionInicial.Value;
                string gestionFinal = hfGestionFinal.Value;

                if (!string.IsNullOrEmpty(gestionInicial))
                {
                    lblGestionInicial.Text = gestionInicial;
                }

                if (!string.IsNullOrEmpty(gestionFinal))
                {
                    lblGestionFinal.Text = gestionFinal;
                }

                // Cargar los datos en el GridView INMEDIATAMENTE (sin reload)
                CargarIndicadores();

                // Cerrar el modal y mostrar mensaje de éxito
                string script = @"
                    $('#modalCargarOtroPEE').modal('hide');
                    Swal.fire({
                        title: '¡Cargado!',
                        text: 'El nuevo PEE ha sido cargado correctamente. Los datos se muestran en la tabla.',
                        icon: 'success',
                        confirmButtonText: 'Entendido'
                    });
                ";
                ScriptManager.RegisterStartupScript(this, GetType(), "CargarExitosoCargar", script, true);
            }
            catch (Exception ex)
            {
                SwalError("Error al procesar el archivo: " + ex.Message);
            }
        }

        private CResultadoList<CIndicadoresPEE> ValidarYConvertirExcelCargar(byte[] archivo)
        {
            try
            {
                // Crear instancia del lector de Excel
                CContenidoXls<CIndicadoresPEE> lector = new CContenidoXls<CIndicadoresPEE>(archivo);

                // Asignar el mapeo flexible (busca variaciones de headers con/sin tildes)
                var mapeoFlexible = CIndicadoresPEE.ObtenerMapeoFlexible();
                lector.AsignarMap(mapeoFlexible);

                // Convertir a lista - empezar en fila 1 (headers) y usar true para procesar headers
                CResultadoList<CIndicadoresPEE> resultado = lector.ConvertirAList(1, true);

                if (!resultado.Exito || resultado.Resultado == null)
                {
                    return resultado;
                }

                // Rellenar valores vacíos de celdas combinadas
                RellenarCeldasCombinadasCargar(resultado.Resultado);

                return resultado;
                }
                catch (Exception ex)
                {
                return new CResultadoList<CIndicadoresPEE>
                {
                    Exito = false,
                    Mensaje = "Error al procesar el archivo Excel: " + ex.Message
                };
            }
        }

        private void RellenarCeldasCombinadasCargar(List<CIndicadoresPEE> lista)
        {
            string ultimaPerspectiva = "";
            string ultimoObjetivo = "";
            string ultimaAccion = "";

            for (int i = 0; i < lista.Count; i++)
            {
                var item = lista[i];

                // Rellenar Perspectiva si está vacía
                if (string.IsNullOrWhiteSpace(item.Perspectiva))
                {
                    item.Perspectiva = ultimaPerspectiva;
                }
                else
                {
                    ultimaPerspectiva = item.Perspectiva;
                }

                // Rellenar Objetivo Estratégico si está vacío
                if (string.IsNullOrWhiteSpace(item.ObjetivoEstrategico))
                {
                    item.ObjetivoEstrategico = ultimoObjetivo;
                }
                else
                {
                    ultimoObjetivo = item.ObjetivoEstrategico;
                }

                // Rellenar Acción Estratégica si está vacía
                if (string.IsNullOrWhiteSpace(item.AccionEstrategica))
                {
                    item.AccionEstrategica = ultimaAccion;
            }
            else
            {
                    ultimaAccion = item.AccionEstrategica;
                }
            }
        }

        private void ConsoleLog(string mensaje)
        {
            // Escapar correctamente todos los caracteres especiales para JavaScript
            string mensajeEscapado = mensaje
                .Replace("\\", "\\\\")  // Backslashes primero
                .Replace("'", "\\'")    // Comillas simples
                .Replace("\"", "\\\"")  // Comillas dobles
                .Replace("\n", "\\n")   // Saltos de línea
                .Replace("\r", "\\r")   // Retorno de carro
                .Replace("\t", "\\t");  // Tabulaciones

            string script = $"console.log('{mensajeEscapado}');";
            ScriptManager.RegisterStartupScript(this, GetType(), "ConsoleLog_" + Guid.NewGuid(), script, true);
        }

        private void EnviarNotificacionPEE(int gestionInicial, int gestionFinal, int registroPeeId)
        {
            try
            {
                ConsoleLog("=== INICIANDO ENVÍO DE CORREO ===");

                // 1. CONFIGURAR EL CORREO
                CNotificacionesMailO oNotificacionesMailO = new CNotificacionesMailO();

                // Secuencial del correo (ID del template en la BD)
                string secuencialCorreo = ConfigurationManager.AppSettings["CorreoSecuencialRegistroPEE"];
                if (string.IsNullOrEmpty(secuencialCorreo))
                {
                    ConsoleLog("WARNING: No existe 'CorreoSecuencialRegistroPEE' en Web.config. Usando valor por defecto 2001");
                    oNotificacionesMailO.Secuencial = 1014;
                }
                else
                {
                    oNotificacionesMailO.Secuencial = int.Parse(secuencialCorreo);
                }

                // Destinatarios (por ahora envío al usuario actual, luego puedes cambiar esto)
                string correoDestinatario = "amoraless@univida.bo";
                oNotificacionesMailO.lDestinatario = new List<CDestinatario> { new CDestinatario(correoDestinatario) };

                // CC vacío
                oNotificacionesMailO.lCc = new List<CCc>();

                // Asunto
                oNotificacionesMailO.Asunto = $"Nuevo PEE Registrado - Gestiones {gestionInicial} a {gestionFinal}";

                // Parámetros del correo (datos que se insertarán en el template)
                oNotificacionesMailO.lParametroMail = new List<CParametroMail>
                {
                    new CParametroMail
                    {
                        Correlatividad = 1,
                        ParTipoCuerpoFk = 3, // Tipo "texto"
                        Contenido = gestionInicial.ToString(),
                        TipoParametroSecuencial = 0
                    },
                    new CParametroMail
                    {
                        Correlatividad = 2,
                        ParTipoCuerpoFk = 3,
                        Contenido = gestionFinal.ToString(),
                        TipoParametroSecuencial = 0
                    },
                    new CParametroMail
                    {
                        Correlatividad = 3,
                        ParTipoCuerpoFk = 3,
                        Contenido = registroPeeId.ToString(),
                        TipoParametroSecuencial = 0
                    }
                };

                ConsoleLog($"Correo configurado - Destinatario: {correoDestinatario}, Asunto: {oNotificacionesMailO.Asunto}");

                // 2. ENVIAR EL CORREO (verificando si está habilitado)
                bool valEnviarCorreo = Convert.ToBoolean(ConfigurationManager.AppSettings["EnviarCorreo"]);
                
                ConsoleLog($"EnviarCorreo config: {valEnviarCorreo}");

                if (valEnviarCorreo)
                {
                    ConsoleLog("Enviando correo...");
                    
                    // Usar base.EnviarCorreo() porque heredamos de CWebFormGenerico
                    CResultadoJsonDocument resultado = base.EnviarCorreo(oNotificacionesMailO);

                    if (resultado.Exito)
                    {
                        ConsoleLog("✅ CORREO ENVIADO EXITOSAMENTE");
                    }
                    else
                    {
                        ConsoleLog($"❌ ERROR AL ENVIAR CORREO: {resultado.Mensaje}");
                    }
                }
                else
                {
                    ConsoleLog("⚠️ ENVÍO DE CORREO DESACTIVADO en Web.config (EnviarCorreo=false)");
                }
            }
            catch (Exception ex)
            {
                ConsoleLog($"EXCEPCIÓN EN EnviarNotificacionPEE: {ex.Message}");
                ConsoleLog($"StackTrace: {ex.StackTrace}");
                // No lanzamos la excepción para que no afecte el flujo principal
            }
        }
    }

    // Clase para el Header Template de las columnas Meta dinámicas
    public class MetaHeaderTemplate : ITemplate
    {
        private int _year;

        public MetaHeaderTemplate(int year)
        {
            _year = year;
        }

        public void InstantiateIn(Control container)
        {
            // Input de filtro
            TextBox txtFiltro = new TextBox();
            txtFiltro.ID = $"filtroMeta{_year}";
            txtFiltro.CssClass = "form-control form-control-sm";
            txtFiltro.Attributes["placeholder"] = "Filtrar...";
            txtFiltro.Attributes["onkeyup"] = "filtrarTabla()";
            txtFiltro.Attributes["style"] = "margin: 0; border: none; border-radius: 0; margin-bottom: 5px;";
            container.Controls.Add(txtFiltro);

            // Div con el título
            Literal litDiv = new Literal();
            litDiv.Text = $"<div style=\"padding: 8px; text-align: center; font-weight: bold;\">Meta {_year}</div>";
            container.Controls.Add(litDiv);
        }
    }

    // Clase para el Item Template de las columnas Meta dinámicas
    public class MetaItemTemplate : ITemplate
    {
        private int _year;

        public MetaItemTemplate(int year)
        {
            _year = year;
        }

        public void InstantiateIn(Control container)
        {
            TextBox txtMeta = new TextBox();
            txtMeta.ID = $"txtMeta{_year}";
            txtMeta.CssClass = "form-control";
            txtMeta.Attributes["style"] = "width: 100%; border: none; padding: 8px; background: transparent; outline: none;";
            txtMeta.DataBinding += new EventHandler(txtMeta_DataBinding);
            container.Controls.Add(txtMeta);
        }

        private void txtMeta_DataBinding(object sender, EventArgs e)
        {
            TextBox txtMeta = (TextBox)sender;
            GridViewRow container = (GridViewRow)txtMeta.NamingContainer;

            if (container.DataItem != null)
            {
                // Intentar obtener el valor dinámico según el año
                string fieldName = $"Meta{_year}";
                try
                {
                    var dataItem = container.DataItem;
                    var property = dataItem.GetType().GetProperty(fieldName);
                    if (property != null)
                    {
                        var value = property.GetValue(dataItem, null);
                        txtMeta.Text = value?.ToString() ?? "";
                    }
                }
                catch
                {
                    txtMeta.Text = "";
                }
            }
        }
    }
}
