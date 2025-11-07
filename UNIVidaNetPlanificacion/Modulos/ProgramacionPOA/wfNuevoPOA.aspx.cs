using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using UNIVidaNetPlanificacion.Parametrizacion;
using UNIVidaNetCoreTecnico.Parametrizacion.CargaArchivos.ExcelAList;
using UNIVidaNetPlanificacion.Parametrizacion.CargaArchivos.ExcelAList;
using UNIVidaNetPlanificacion.Parametrizacion.CargaArchivos.MapeoExcel;
using UVNetDTOs.DTOsGenericas.Resultado;
using UVNetUtilitarios.Serealizacion;
using AgenteServiciosPlanificacion.Modulos.ProgramacionPOA;
using AgenteServiciosPlanificacion.Modulos.ProgramacionPOA.ParametrosEntrada;

namespace UNIVidaNetPlanificacion.Modulos.ProgramacionPOA
{
    public partial class wfNuevoPOA : CWebFormGenerico
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
                if (!CGestionPermisos.EsPlanificador())
                {
                    SwalError("Acceso Denegado", "Solo el Planificador puede acceder a esta página.");
                    Response.Redirect("~/Default.aspx");
                    return;
                }

                // Obtener el Número de Registro desde QueryString
                if (!string.IsNullOrEmpty(Request.QueryString["Registro"]))
                {
                    NumeroRegistroPOA = Request.QueryString["Registro"];
                }

                // Mostrar variable temporal en consola
                ConsoleLog($"NumeroRegistroPOA en wfModificarPOA: '{NumeroRegistroPOA}'");

                // Cargar tabla vacía inicialmente
                CargarJsonEnGridView(ref gvMatrizPOA, "[]");
                
                // Inicializar label de gestión vacío
                lblGestionPOA.Text = "";
            }
            else
            {
                ValidarUsuario();
            }
        }

        protected void btnEnviarPOA_Click(object sender, EventArgs e)
        {
            try
            {
                // 1. Validar que se haya cargado una gestión
                if (string.IsNullOrEmpty(lblGestionPOA.Text))
                {
                    SwalError("Debe cargar primero un archivo Excel con el botón 'Cargar Otros OKR's' para establecer la gestión.");
                    return;
                }

                // 2. Validar que haya datos del Excel cargados
                if (string.IsNullOrEmpty(hfDatosPoaJson.Value))
                {
                    SwalError("Debe cargar primero un archivo Excel con los OKR's.");
                    return;
                }

                // 3. Validar que se tenga el número de registro PEE
                if (string.IsNullOrEmpty(NumeroRegistroPOA))
                {
                    SwalError("No se pudo obtener el número de registro PEE. Por favor, regrese a Registros PEE e intente nuevamente.");
                    return;
                }

                // 4. Obtener la gestión del label
                int gestion = int.Parse(lblGestionPOA.Text);
                int tRegistroPeeFk = int.Parse(NumeroRegistroPOA);

                // 5. Crear el objeto de parámetros
                CPFExTRegistroPoaRegistrar oPFExTRegistroPoaRegistrar = new CPFExTRegistroPoaRegistrar();
                oPFExTRegistroPoaRegistrar.UsuarioAut = Usuario;
                oPFExTRegistroPoaRegistrar.CodigoSistema = CodigoSistema;
                oPFExTRegistroPoaRegistrar.Gestion = gestion;
                oPFExTRegistroPoaRegistrar.TRegistroPeeFk = tRegistroPeeFk;
                oPFExTRegistroPoaRegistrar.DatosPoaJson = hfDatosPoaJson.Value;

                // 6. Ejecutar el SP
                ConsoleLog($"ENVIANDO AL SP: Gestion={gestion}, TRegistroPeeFk={tRegistroPeeFk}");
                ConsoleLog($"JSON: {hfDatosPoaJson.Value}");
                CResultadoInt oResultadoInt = CAgenteProgramacionPOA.FExTRegistroPoaRegistrar(oPFExTRegistroPoaRegistrar);
                ConsoleLog($"RESULTADO SP: Exito={oResultadoInt.Exito}, Mensaje={oResultadoInt.Mensaje}");

                // 7. Verificar resultado
                if (oResultadoInt.Exito)
                {
                    hfDatosPoaJson.Value = "";
                    hfGestionPOA.Value = "";
                    lblGestionPOA.Text = "";

                    string script = @"
                        Swal.fire({
                            title: '¡Registrado!',
                            text: 'El POA ha sido registrado correctamente.',
                            icon: 'success',
                            confirmButtonText: 'Aceptar'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                window.location.href = 'wfRegistrosPOA.aspx';
                            }
                        });
                    ";
                    ScriptManager.RegisterStartupScript(this, GetType(), "RegistroExitosoPOA", script, true);
                }
                else
                {
                    SwalError("Error al registrar: " + oResultadoInt.Mensaje);
                }
            }
            catch (FormatException)
            {
                SwalError("La gestión debe ser un número válido.");
            }
            catch (Exception ex)
            {
                string errorDetallado = $"Error: {ex.Message}\n\nStackTrace: {ex.StackTrace}";
                if (ex.InnerException != null)
                {
                    errorDetallado += $"\n\nInnerException: {ex.InnerException.Message}";
                }
                ConsoleLog($"ERROR AL REGISTRAR POA: {errorDetallado}");
                SwalError("Error al registrar el POA: " + ex.Message);
            }
        }

        protected void btnVerFicha_Click(object sender, EventArgs e)
        {
            // Lógica para ver ficha
            SwalAtencion("Función 'Ver Ficha' en desarrollo");
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            // Lógica para modificar todos los elementos de la matriz POA
            SwalCorrecto("Los cambios han sido guardados correctamente");
        }
        protected void btnGenerarPEEExcel_Click(object sender, EventArgs e)
        {
            // Lógica para generar PEE en Excel
            SwalCorrecto("Generando archivo PEE en Excel...");
        }

        protected void lnkVolver_Click(object sender, EventArgs e)
        {
            // Volver a la página anterior (Registros POA)
            Response.Redirect("~/Modulos/ProgramacionPOA/wfRegistrosPOA.aspx");
        }

        protected void btnCargarOtrosPOA_Click(object sender, EventArgs e)
        {
            try
            {
                // Validar que se haya seleccionado un archivo
                if (!fuCargarOKRsModalPOA.HasFile)
                {
                    SwalError("Por favor, seleccione un archivo Excel.");
                    return;
                }

                // Validar extensión del archivo
                string extension = System.IO.Path.GetExtension(fuCargarOKRsModalPOA.FileName).ToUpper();
                if (extension != ".XLS" && extension != ".XLSX")
                {
                    SwalError("El archivo debe ser de tipo Excel (.xls o .xlsx)");
                    return;
                }

                // Leer el archivo como byte[]
                byte[] archivoBytes = fuCargarOKRsModalPOA.FileBytes;

                // Validar y convertir el Excel
                var resultado = ValidarYConvertirExcelPOA(archivoBytes);

                if (!resultado.Exito)
                {
                    SwalError(resultado.Mensaje);
                    return;
                }

                // Serializar a JSON
                string json = CSerealizacion.ObjetoEnJson(resultado.Resultado);
                ConsoleLog(json); // Mostrar el JSON en la consola

                // Guardar el JSON completo en HiddenField para usarlo después
                hfDatosPoaJson.Value = json;

                // Convertir el JSON del Excel al formato del GridView (sin columnas FK)
                string jsonGridView = ConvertirJsonExcelPOAAGridView(json);

                // Cargar en el GridView
                CargarJsonEnGridView(ref gvMatrizPOA, jsonGridView);

                // Actualizar el label de Gestión desde el HiddenField
                if (!string.IsNullOrEmpty(hfGestionPOA.Value))
                {
                    lblGestionPOA.Text = hfGestionPOA.Value;
                }

                // Cerrar el modal y mostrar mensaje de éxito
                string script = @"
                    $('#modalCargarOtrosOKRs').modal('hide');
                    Swal.fire({
                        title: '¡Cargado!',
                        text: 'El archivo POA ha sido cargado correctamente. Los datos se muestran en la tabla.',
                        icon: 'success',
                        confirmButtonText: 'Entendido'
                    });
                ";
                ScriptManager.RegisterStartupScript(this, GetType(), "CargarExitosoPOA", script, true);
            }
            catch (Exception ex)
            {
                SwalError("Error al procesar el archivo: " + ex.Message);
            }
        }

        private string ConvertirJsonExcelPOAAGridView(string jsonExcel)
        {
            try
            {
                // Deserializar el JSON del Excel a una lista de CIndicadoresPOA
                var listaExcel = Newtonsoft.Json.JsonConvert.DeserializeObject<List<CIndicadoresPOA>>(jsonExcel);

                // Crear una lista de objetos con los nombres esperados por el GridView (sin columnas FK)
                var listaGridView = new List<object>();

                int id = 1;
                foreach (var item in listaExcel)
                {
                    var obj = new Dictionary<string, object>
                    {
                        { "Id", id++.ToString() },
                        { "ObjetivosEstrategicos", item.ObjetivoEstrategico ?? "" },
                        { "Indicador", item.Indicador ?? "" },
                        { "ObjetivoGestion", item.ObjetivoGestion ?? "" },
                        { "IndicadorGestion", item.IndicadorGestion ?? "" },
                        { "ResultadoGestion", item.ResultadoGestion ?? "" },
                        { "ResponsablePOA", item.ResponsablePOA ?? "" }
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

        private CResultadoList<CIndicadoresPOA> ValidarYConvertirExcelPOA(byte[] archivo)
        {
            try
            {
                // Crear instancia del lector de Excel
                CContenidoXls<CIndicadoresPOA> lector = new CContenidoXls<CIndicadoresPOA>(archivo);

                // Asignar el mapeo flexible (busca variaciones de headers con/sin tildes)
                var mapeoFlexible = CIndicadoresPOA.ObtenerMapeoFlexible();
                lector.AsignarMap(mapeoFlexible);

                // Convertir a lista - empezar en fila 1 (headers) y usar true para procesar headers
                CResultadoList<CIndicadoresPOA> resultado = lector.ConvertirAList(1, true);

                if (!resultado.Exito || resultado.Resultado == null)
                {
                    return resultado;
                }

                // Rellenar valores vacíos de celdas combinadas
                RellenarCeldasCombinadasPOA(resultado.Resultado);

                return resultado;
            }
            catch (Exception ex)
            {
                return new CResultadoList<CIndicadoresPOA>
                {
                    Exito = false,
                    Mensaje = "Error al procesar el archivo Excel: " + ex.Message
                };
            }
        }

        private void RellenarCeldasCombinadasPOA(List<CIndicadoresPOA> lista)
        {
            string ultimoObjetivoEstrategico = "";
            string ultimoIndicador = "";
            string ultimoObjetivoGestion = "";
            string ultimoIndicadorGestion = "";

            for (int i = 0; i < lista.Count; i++)
            {
                var item = lista[i];

                // Rellenar Objetivo Estratégico si está vacío
                if (string.IsNullOrWhiteSpace(item.ObjetivoEstrategico))
                {
                    item.ObjetivoEstrategico = ultimoObjetivoEstrategico;
                }
                else
                {
                    ultimoObjetivoEstrategico = item.ObjetivoEstrategico;
                }

                // Rellenar Indicador si está vacío
                if (string.IsNullOrWhiteSpace(item.Indicador))
                {
                    item.Indicador = ultimoIndicador;
                }
                else
                {
                    ultimoIndicador = item.Indicador;
                }

                // Rellenar Objetivo de Gestión si está vacío
                if (string.IsNullOrWhiteSpace(item.ObjetivoGestion))
                {
                    item.ObjetivoGestion = ultimoObjetivoGestion;
                }
                else
                {
                    ultimoObjetivoGestion = item.ObjetivoGestion;
                }

                // Rellenar Indicador de Gestión si está vacío
                if (string.IsNullOrWhiteSpace(item.IndicadorGestion))
                {
                    item.IndicadorGestion = ultimoIndicadorGestion;
                }
                else
                {
                    ultimoIndicadorGestion = item.IndicadorGestion;
                }
            }
        }

        private void ConsoleLog(string mensaje)
        {
            string script = $"console.log('{mensaje.Replace("'", "\\'")}');";
            ScriptManager.RegisterStartupScript(this, GetType(), "ConsoleLog_" + Guid.NewGuid(), script, true);
        }
    }
}