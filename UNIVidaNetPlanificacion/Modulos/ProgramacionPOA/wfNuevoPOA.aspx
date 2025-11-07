<%@ Page Title="Nuevo POA" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="wfNuevoPOA.aspx.cs" Inherits="UNIVidaNetPlanificacion.Modulos.ProgramacionPOA.wfNuevoPOA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- HiddenField para guardar el JSON del Excel -->
    <asp:HiddenField ID="hfDatosPoaJson" runat="server" />
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h2>POA - MATRIZ DE PROGRAMACIÓN DE OPERACIONES</h2>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item active"><a href="#">Inicio</a></li>
                        <li class="breadcrumb-item active">Programacion POA</li>
                        <li class="breadcrumb-item active">Modificar POA</li>
                    </ol>
                    <div class="float-sm-right mt-2">
                        <asp:LinkButton ID="lnkVolver" runat="server" Text="Volver" CssClass="btn btn-secondary" OnClick="lnkVolver_Click" />
                    </div>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>

    <section class="content mb-5">
        <div class="container-fluid">
            <!-- Barra de acciones -->
            <div class="row mb-3">
                <div class="col-md-2">
                    <asp:Button ID="btnEnviarPOA" runat="server" 
                        CssClass="btn btn-success btn-block mb-2" 
                        Text="Guardar y enviar POA" 
                        OnClick="btnEnviarPOA_Click" />
                    <button type="button" class="btn btn-warning btn-block" onclick="guardarGestionEnHiddenField(); $('#modalCargarOtrosOKRs').modal('show');">
                        <i class="fas fa-upload"></i> Cargar Otros OKR's
                    </button>
                </div>
                <div class="col-md-6">
                    <!-- Label de Gestión -->
                    <div class="form-group">
                        <label style="font-weight: normal; margin-bottom: 5px;">Gestión:</label>
                        <asp:Label ID="lblGestionPOA" runat="server" 
                            CssClass="form-control" 
                            Style="background-color: #e9ecef; cursor: default;" 
                            Text=""></asp:Label>
                        <asp:HiddenField ID="hfGestionPOA" runat="server" />
                    </div>
                </div>
                <div class="col-md-4">
                    <asp:Button ID="btnModificar" runat="server" 
                        Text="Modificar" 
                        CssClass="btn btn-primary btn-block mb-2" 
                        OnClick="btnModificar_Click" />
                    <button type="button" class="btn btn-secondary btn-block" onclick="limpiarFiltrosPOA()" title="Limpiar filtros">
                        <i class="fas fa-eraser"></i> Limpiar Filtros
                    </button>
                </div>
            </div>

            <!-- Tabla principal -->
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <asp:GridView ID="gvMatrizPOA" runat="server" 
                                    CssClass="table table-bordered mb-0"
                                    AutoGenerateColumns="False"
                                    GridLines="Horizontal"
                                    ShowHeaderWhenEmpty="true">
                                    <HeaderStyle CssClass="bg-primary text-white" />
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <select id="filtroObjetivosEstrategicos" class="form-control form-control-sm" onchange="filtrarTablaPOA()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;">
                                                    <option value="">Todos</option>
                                                </select>
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Objetivos estratégicos</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="15%" />
                                            <ItemTemplate>
                                                <%# Eval("ObjetivosEstrategicos") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroIndicador" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTablaPOA()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Indicador</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="15%" />
                                            <ItemTemplate>
                                                <%# Eval("Indicador") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroObjetivoGestion" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTablaPOA()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Objetivo de gestión</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="15%" />
                                            <ItemTemplate>
                                                <%# Eval("ObjetivoGestion") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroIndicadorGestion" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTablaPOA()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Indicador de gestión</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="15%" />
                                            <ItemTemplate>
                                                <%# Eval("IndicadorGestion") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroResultadoGestion" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTablaPOA()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Resultado de Gestión</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="15%" />
                                            <ItemTemplate>
                                                <%# Eval("ResultadoGestion") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroResponsablePOA" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTablaPOA()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Responsable POA</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="10%" />
                                            <ItemTemplate>
                                                <%# Eval("ResponsablePOA") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>

    <!-- JavaScript para los filtros y funciones -->
    <script>
        // Cargar opciones del dropdown de Objetivos Estratégicos al cargar la página
        window.addEventListener('DOMContentLoaded', function() {
            cargarOpcionesObjetivosEstrategicos();
        });

        function cargarOpcionesObjetivosEstrategicos() {
            var tabla = document.getElementById('<%= gvMatrizPOA.ClientID %>');
            var filas = tabla.getElementsByTagName('tr');
            var opciones = new Set();
            opciones.add(''); // Opción "Todos"

            // Recorrer todas las filas de datos (saltar el header)
            for (var i = 1; i < filas.length; i++) {
                var celdas = filas[i].getElementsByTagName('td');
                if (celdas.length > 0) {
                    var textoOE = celdas[0].textContent.trim();
                    if (textoOE) {
                        opciones.add(textoOE);
                    }
                }
            }

            // Llenar el dropdown
            var select = document.getElementById('filtroObjetivosEstrategicos');
            if (select) {
                // Limpiar opciones excepto "Todos"
                select.innerHTML = '<option value="">Todos</option>';
                
                // Agregar opciones únicas
                opciones.forEach(function(opcion) {
                    if (opcion !== '') {
                        var option = document.createElement('option');
                        option.value = opcion;
                        option.text = opcion;
                        select.add(option);
                    }
                });
            }
        }

        function filtrarTablaPOA() {
            var tabla = document.getElementById('<%= gvMatrizPOA.ClientID %>');
            var filas = tabla.getElementsByTagName('tr');

            // Obtener valores de los filtros
            var filtroOE = document.getElementById('filtroObjetivosEstrategicos').value.trim();
            var filtroInd = document.getElementById('filtroIndicador').value.toLowerCase();
            var filtroOG = document.getElementById('filtroObjetivoGestion').value.toLowerCase();
            var filtroIG = document.getElementById('filtroIndicadorGestion').value.toLowerCase();
            var filtroRG = document.getElementById('filtroResultadoGestion').value.toLowerCase();
            var filtroResp = document.getElementById('filtroResponsablePOA').value.toLowerCase();

            // Recorrer todas las filas de datos (saltar el header)
            for (var i = 1; i < filas.length; i++) {
                var celdas = filas[i].getElementsByTagName('td');
                if (celdas.length > 0) {
                    var textoOE = celdas[0].textContent.trim();
                    var textoInd = celdas[1].textContent.toLowerCase();
                    var textoOG = celdas[2].textContent.toLowerCase();
                    var textoIG = celdas[3].textContent.toLowerCase();
                    var textoRE = celdas[4].textContent.toLowerCase();
                    var textoResp = celdas[5].textContent.toLowerCase();

                    var mostrar = true;

                    // Aplicar filtros
                    if (filtroOE && textoOE !== filtroOE) mostrar = false;
                    if (filtroInd && textoInd.indexOf(filtroInd) === -1) mostrar = false;
                    if (filtroOG && textoOG.indexOf(filtroOG) === -1) mostrar = false;
                    if (filtroIG && textoIG.indexOf(filtroIG) === -1) mostrar = false;
                    if (filtroRG && textoRG.indexOf(filtroRG) === -1) mostrar = false;
                    if (filtroResp && textoResp.indexOf(filtroResp) === -1) mostrar = false;

                    // Mostrar u ocultar fila
                    filas[i].style.display = mostrar ? '' : 'none';
                }
            }
        }

        function limpiarFiltrosPOA() {
            document.getElementById('filtroObjetivosEstrategicos').value = '';
            document.getElementById('filtroIndicador').value = '';
            document.getElementById('filtroObjetivoGestion').value = '';
            document.getElementById('filtroIndicadorGestion').value = '';
            document.getElementById('filtroResultadoGestion').value = '';
            document.getElementById('filtroResponsablePOA').value = '';
            filtrarTablaPOA();
        }

        // Ya no se necesitan validaciones JavaScript porque el botón ahora es asp:Button
        // y las validaciones se hacen en el servidor

        function descargarPlantillaOKRs() {
            Swal.fire({
                title: 'Descargando...',
                text: 'La plantilla de OKR\'s se está descargando.',
                icon: 'info',
                confirmButtonText: 'Entendido'
            });
        }

        function guardarGestionEnHiddenField() {
            // Esta función se ejecuta ANTES de abrir el modal
            // No hace nada por ahora, la gestión se guarda al generar
        }

        function guardarGestionAntesDeGenerar() {
            var txtGestion = document.getElementById('txtGestionPOAModal');
            var hfGestion = document.getElementById('<%= hfGestionPOA.ClientID %>');
            
            // Validar que se haya ingresado una gestión válida
            if (txtGestion.value.trim().length !== 4) {
                Swal.fire({
                    title: 'Gestión requerida',
                    text: 'Por favor, ingrese una gestión de 4 dígitos.',
                    icon: 'warning',
                    confirmButtonText: 'Entendido'
                });
                return false; // Cancelar el PostBack
            }
            
            // Guardar la gestión en el HiddenField
            hfGestion.value = txtGestion.value;
            
            return true; // Permitir el PostBack
        }

        function incrementar(textBoxId) {
            var textBox = document.getElementById(textBoxId);
            var valor = textBox.value;
            // Lógica para incrementar AE.3.1. a AE.3.2., etc.
            Swal.fire({
                icon: 'info',
                title: 'Información',
                text: 'Función de incremento en desarrollo'
            });
        }

        function decrementar(textBoxId) {
            var textBox = document.getElementById(textBoxId);
            var valor = textBox.value;
            // Lógica para decrementar AE.3.1. a AE.3.0., etc.
            Swal.fire({
                icon: 'info',
                title: 'Información',
                text: 'Función de decremento en desarrollo'
            });
        }
    </script>

    <!-- Modal para Cargar Otros OKR's -->
    <!-- Modal para Cargar Otros OKR's -->
    <div class="modal fade" id="modalCargarOtrosOKRs" tabindex="-1" role="dialog" aria-labelledby="modalCargarOtrosOKRsLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalCargarOtrosOKRsLabel">Cargar Otros OKR's</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Cargar Archivo POA</h3>
                        </div>
                        <div class="card-body">
                            <!-- Input de Gestión -->
                            <div class="row mb-4">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="txtGestionPOAModal" style="font-weight: normal;">Gestión</label>
                                        <input type="text" id="txtGestionPOAModal" class="form-control" 
                                            placeholder="2026" 
                                            maxlength="4"
                                            onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                    </div>
                                </div>
                            </div>

                            <hr class="my-4">

                            <!-- Botón Descargar Plantilla -->
                            <div class="row mb-4">
                                <div class="col-12 text-center">
                                    <button type="button" class="btn btn-success btn-lg" onclick="descargarPlantillaOKRs()">
                                        Descargar Plantilla
                                    </button>
                                </div>
                            </div>

                            <hr class="my-4">

                            <!-- Sección Cargar OKR's -->
                            <div class="row mb-4">
                                <div class="col-12">
                                    <h4><strong>Cargar OKR's</strong></h4>
                    <div class="form-group">
                                        <asp:FileUpload ID="fuCargarOKRsModalPOA" runat="server" 
                                            CssClass="form-control" 
                                            accept=".xlsx,.xls" />
                                    </div>
                                </div>
                    </div>
                
                            <hr class="my-4">

                            <!-- Sección Respaldo -->
                            <div class="row mb-4">
                                <div class="col-12">
                                    <h4><strong>Respaldo</strong></h4>
                                    <div class="form-group">
                                        <input type="file" id="fuRespaldoModalPOA" class="form-control" 
                                            accept=".pdf" />
                                    </div>
                                </div>
                            </div>

                            <hr class="my-4">

                            <!-- Botón Generar -->
                            <div class="row">
                                <div class="col-12 text-right">
                                    <asp:Button ID="btnGenerarOKRsModal" runat="server" 
                                        CssClass="btn btn-success btn-lg" 
                                        Text="Generar" 
                                        OnClick="btnCargarOtrosPOA_Click"
                                        OnClientClick="return guardarGestionAntesDeGenerar();" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal para Enviar POA -->
    <div class="modal fade" id="modalEnviarPOA" tabindex="-1" role="dialog" aria-labelledby="modalEnviarPOALabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header" style="border-bottom: 1px solid #dee2e6;">
                    <h5 class="modal-title" id="modalEnviarPOALabel" style="font-weight: 600; color: #333;">Enviar POA</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" style="padding: 2rem;">
                    <p class="mb-2" style="font-size: 0.95rem; line-height: 1.6;">
                        Se enviara la notificación a todos los responsables POA y se guardaran los OKR's sin opcion a volver sobrescribir un nuevo registro de OKR's.
                    </p>
                    <p class="mb-4" style="font-size: 0.9rem; color: #6c757d;">
                        <strong>Nota:</strong> Aun podra modifcar los OKR's manualmente pero con restricciones.
                    </p>
                
                    <div class="form-group mb-3">
                        <label for="txtFechaPresentacion" style="font-weight: 500; color: #495057;">Fecha presentación OKR's</label>
                        <input type="text" class="form-control" id="txtFechaPresentacion" value="30/11/2025" readonly style="background-color: #e9ecef;" />
                    </div>
                
                    <div class="form-group mb-4">
                        <label for="txtFechaLimite" style="font-weight: 500; color: #495057;">Asignar fecha limite para llenar registros:</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="txtFechaLimite" value="12/10/2025" />
                            <div class="input-group-append">
                                <button class="btn btn-outline-secondary" type="button" id="btnCalendario">
                                    <i class="fas fa-calendar-alt"></i>
                                </button>
                            </div>
                        </div>
                    </div>

                    <div class="text-center">
                        <button type="button" class="btn btn-success btn-lg px-5" id="btnConfirmarEnvio" style="border-radius: 25px;">
                            Enviar
                        </button>
                </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            // Inicializar datepicker para la fecha límite
            $('#txtFechaLimite').datepicker({
                format: 'dd/mm/yyyy',
                autoclose: true,
                todayHighlight: true
            });

            // Botón del calendario
            $('#btnCalendario').click(function () {
                $('#txtFechaLimite').datepicker('show');
            });

            // Confirmar envío
            $('#btnConfirmarEnvio').click(function () {
                var fechaLimite = $('#txtFechaLimite').val();

                if (fechaLimite === '') {
                    Swal.fire({
                        icon: 'warning',
                        title: 'Atención',
                        text: 'Por favor seleccione una fecha límite'
                    });
                    return;
                }

                // Aquí puedes hacer la llamada al servidor
                $('#modalEnviarPOA').modal('hide');

                Swal.fire({
                    icon: 'success',
                    title: 'Éxito',
                    text: 'POA enviado correctamente'
                });
            });
        });
    </script>
</asp:Content>