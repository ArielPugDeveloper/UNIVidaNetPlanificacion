<%@ Page Title="Revisión POA" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="wfRevisionPOA.aspx.cs" Inherits="UNIVidaNetPlanificacion.Modulos.ProgramacionPOA.wfRevisionPOA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h2>Plan Operativo Anual - Revisión</h2>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item active"><a href="#">Inicio</a></li>
                        <li class="breadcrumb-item active">Programacion POA</li>
                        <li class="breadcrumb-item active">Revisión POA</li>
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
            <!-- Fechas de referencia y botones -->
            <div class="row mb-3">
                <div class="col-md-3">
                    <div class="mb-2">
                        <label>Fecha de presentación de OKR's:</label>
                    <asp:TextBox ID="txtFechaPresentacion" runat="server" 
                        CssClass="form-control" 
                        Text="30/10/2025" 
                        ReadOnly="true" 
                        BackColor="#f8f9fa" />
                </div>
                    <div class="mb-2">
                    <label>Fecha límite asignada:</label>
                    <asp:TextBox ID="txtFechaLimite" runat="server" 
                        CssClass="form-control" 
                        Text="30/11/2025" 
                        ReadOnly="true" 
                        BackColor="#f8f9fa" />
                </div>
                    <div>
                    <label>Última fecha de ampliación:</label>
                    <asp:TextBox ID="txtUltimaAmpliacion" runat="server" 
                        CssClass="form-control" 
                        Text="10/12/2025" 
                        ReadOnly="true" 
                        BackColor="#f8f9fa" />
                </div>
                </div>
                <div class="col-md-7">
                    <!-- Espacio central -->
            </div>
                <div class="col-md-2">
                    <div class="d-flex flex-column">
                    <asp:Button ID="btnAmpliar" runat="server" 
                            Text="Ampliar fecha limite" 
                            CssClass="btn btn-success btn-block mb-2" 
                        OnClick="btnAmpliar_Click" />
                    <asp:Button ID="btnGenerarPOAExcel" runat="server" 
                        Text="Generar POA (Excel)" 
                            CssClass="btn btn-success btn-block mb-2" 
                        OnClick="btnGenerarPOAExcel_Click" />
                        <button type="button" class="btn btn-secondary btn-block" onclick="limpiarFiltrosRevisionPOA()" title="Limpiar filtros">
                            <i class="fas fa-eraser"></i> Limpiar Filtros
                        </button>
                    </div>
                </div>
            </div>

            <!-- Tabla principal -->
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <asp:GridView ID="gvRevisionPOA" runat="server" 
                                    CssClass="table table-bordered mb-0"
                                    AutoGenerateColumns="False"
                                    GridLines="Horizontal">
                                    <HeaderStyle CssClass="bg-primary text-white" />
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <select id="filtroObjetivosEstrategicos" class="form-control form-control-sm" onchange="filtrarTablaRevisionPOA()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;">
                                                    <option value="">Todos</option>
                                                </select>
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Objetivos estratégicos</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="12%" />
                                            <ItemTemplate>
                                                <%# Eval("ObjetivosEstrategicos") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroAccionEstrategica" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTablaRevisionPOA()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Acción estratégica</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="12%" />
                                            <ItemTemplate>
                                                <%# Eval("AccionEstrategica") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroIndicador" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTablaRevisionPOA()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Indicador</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="10%" />
                                            <ItemTemplate>
                                                <%# Eval("Indicador") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroObjetivoGestion" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTablaRevisionPOA()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Objetivo de gestión</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="12%" />
                                            <ItemTemplate>
                                                <%# Eval("ObjetivoGestion") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroResultadoGestion" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTablaRevisionPOA()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Resultado de gestión</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="12%" />
                                            <ItemTemplate>
                                                <%# Eval("IndicadorGestion") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroAccionGestion" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTablaRevisionPOA()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Acción de gestión</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="12%" />
                                            <ItemTemplate>
                                                <%# Eval("AccionGestion") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroResponsablePOA" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTablaRevisionPOA()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Responsable POA</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="8%" />
                                            <ItemTemplate>
                                                <%# Eval("Responsable") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroFechaObservacion" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTablaRevisionPOA()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Fecha de última observación</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="8%" />
                                            <ItemTemplate>
                                                <%# Eval("FechaUltimaObservacion") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroEstado" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTablaRevisionPOA()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Estado</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="8%" />
                                            <ItemTemplate>
                                                <%# Eval("Estado") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Opciones" ItemStyle-CssClass="text-center">
                                            <ItemStyle Width="6%" />
                                            <ItemTemplate>
                                                <button type="button" 
                                                    class='<%# Eval("Estado").ToString() == "COMPLETADO" ? "btn btn-success btn-sm" : "btn btn-secondary btn-sm" %>'
                                                    <%# Eval("Estado").ToString() == "COMPLETADO" ? "" : "disabled" %>
                                                    onclick='<%# Eval("Estado").ToString() == "COMPLETADO" ? "abrirModalRevision(\"" + Eval("Id") + "\")" : "" %>'>
                                                    Revisar
                                                </button>
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
    </section>

    <!-- JavaScript para filtros -->
    <script>
        // Cargar opciones del dropdown de Objetivos Estratégicos al cargar la página
        window.addEventListener('DOMContentLoaded', function() {
            cargarOpcionesObjetivosEstrategicosRevision();
        });

        function cargarOpcionesObjetivosEstrategicosRevision() {
            var tabla = document.getElementById('<%= gvRevisionPOA.ClientID %>');
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

        function filtrarTablaRevisionPOA() {
            var tabla = document.getElementById('<%= gvRevisionPOA.ClientID %>');
            var filas = tabla.getElementsByTagName('tr');

            // Obtener valores de los filtros
            var filtroOE = document.getElementById('filtroObjetivosEstrategicos').value.trim();
            var filtroAE = document.getElementById('filtroAccionEstrategica').value.toLowerCase();
            var filtroInd = document.getElementById('filtroIndicador').value.toLowerCase();
            var filtroOG = document.getElementById('filtroObjetivoGestion').value.toLowerCase();
            var filtroRG = document.getElementById('filtroResultadoGestion').value.toLowerCase();
            var filtroAG = document.getElementById('filtroAccionGestion').value.toLowerCase();
            var filtroResp = document.getElementById('filtroResponsablePOA').value.toLowerCase();
            var filtroFecha = document.getElementById('filtroFechaObservacion').value.toLowerCase();
            var filtroEstado = document.getElementById('filtroEstado').value.toLowerCase();

            // Recorrer todas las filas de datos (saltar el header)
            for (var i = 1; i < filas.length; i++) {
                var celdas = filas[i].getElementsByTagName('td');
                if (celdas.length > 0) {
                    var textoOE = celdas[0].textContent.trim();
                    var textoAE = celdas[1].textContent.toLowerCase();
                    var textoInd = celdas[2].textContent.toLowerCase();
                    var textoOG = celdas[3].textContent.toLowerCase();
                    var textoRG = celdas[4].textContent.toLowerCase();
                    var textoAG = celdas[5].textContent.toLowerCase();
                    var textoResp = celdas[6].textContent.toLowerCase();
                    var textoFecha = celdas[7].textContent.toLowerCase();
                    var textoEstado = celdas[8].textContent.toLowerCase();

                    var mostrar = true;

                    // Aplicar filtros
                    if (filtroOE && textoOE !== filtroOE) mostrar = false;
                    if (filtroAE && textoAE.indexOf(filtroAE) === -1) mostrar = false;
                    if (filtroInd && textoInd.indexOf(filtroInd) === -1) mostrar = false;
                    if (filtroOG && textoOG.indexOf(filtroOG) === -1) mostrar = false;
                    if (filtroRG && textoRG.indexOf(filtroRG) === -1) mostrar = false;
                    if (filtroAG && textoAG.indexOf(filtroAG) === -1) mostrar = false;
                    if (filtroResp && textoResp.indexOf(filtroResp) === -1) mostrar = false;
                    if (filtroFecha && textoFecha.indexOf(filtroFecha) === -1) mostrar = false;
                    if (filtroEstado && textoEstado.indexOf(filtroEstado) === -1) mostrar = false;

                    // Mostrar u ocultar fila
                    filas[i].style.display = mostrar ? '' : 'none';
                }
            }
        }

        function limpiarFiltrosRevisionPOA() {
            document.getElementById('filtroObjetivosEstrategicos').value = '';
            document.getElementById('filtroAccionEstrategica').value = '';
            document.getElementById('filtroIndicador').value = '';
            document.getElementById('filtroObjetivoGestion').value = '';
            document.getElementById('filtroResultadoGestion').value = '';
            document.getElementById('filtroAccionGestion').value = '';
            document.getElementById('filtroResponsablePOA').value = '';
            document.getElementById('filtroFechaObservacion').value = '';
            document.getElementById('filtroEstado').value = '';
            filtrarTablaRevisionPOA();
        }
    </script>

        <!-- Modal para Ampliar fecha -->
    <div class="modal fade" id="modalAmpliarFecha" tabindex="-1" role="dialog" aria-labelledby="modalAmpliarFechaLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalAmpliarFechaLabel">Ampliar fecha</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body text-center">
                    <div class="form-group">
                        <label class="mb-3">Fecha de ampliación</label>
                        <div class="input-group justify-content-center">
                            <input type="date" class="form-control" id="txtFechaAmpliacion" value="2025-09-25" style="max-width: 200px;" />
                            <div class="input-group-append">
                                <span class="input-group-text">
                                    <i class="fas fa-calendar-alt"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="text-center mt-4">
                        <button type="button" class="btn btn-success btn-lg px-5" onclick="confirmarAmpliacion()">Ampliar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function confirmarAmpliacion() {
            var fecha = document.getElementById('txtFechaAmpliacion').value;
            
            Swal.fire({
                title: '¿Confirmar ampliación?',
                text: '¿Está seguro de que desea ampliar la fecha a ' + fecha + '?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#28a745',
                cancelButtonColor: '#6c757d',
                confirmButtonText: 'Sí, ampliar',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    $('#modalAmpliarFecha').modal('hide');
                    Swal.fire('¡Ampliado!', 'La fecha ha sido ampliada correctamente.', 'success');
                }
            });
        }

        function abrirModalRevision(id) {
            // Aquí puedes cargar los datos específicos del registro si es necesario
            $('#modalRevision').modal('show');
        }

        function observarRegistro() {
            var motivo = document.getElementById('txtMotivoObservacionModal').value;
            
            if (!motivo || motivo.trim() === '') {
                Swal.fire({
                    title: 'Atención',
                    text: 'Por favor ingrese un motivo para la observación.',
                    icon: 'warning',
                    confirmButtonText: 'Entendido'
                });
                return;
            }

            Swal.fire({
                title: '¿Confirmar observación?',
                text: '¿Está seguro de que desea observar este registro?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#dc3545',
                cancelButtonColor: '#6c757d',
                confirmButtonText: 'Sí, observar',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    $('#modalRevision').modal('hide');
                    Swal.fire('¡Observado!', 'El registro ha sido observado correctamente.', 'success');
                }
            });
        }

        function aprobarRegistroModal() {
            Swal.fire({
                title: '¿Confirmar aprobación?',
                text: '¿Está seguro de que desea aprobar este registro?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#28a745',
                cancelButtonColor: '#6c757d',
                confirmButtonText: 'Sí, aprobar',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    $('#modalRevision').modal('hide');
                    Swal.fire('¡Aprobado!', 'El registro ha sido aprobado correctamente.', 'success');
                }
            });
        }

        function devolverRegistroModal() {
            Swal.fire({
                title: '¿Confirmar devolución?',
                text: '¿Está seguro de que desea devolver este registro?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#ffc107',
                cancelButtonColor: '#6c757d',
                confirmButtonText: 'Sí, devolver',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    $('#modalRevision').modal('hide');
                    Swal.fire('¡Devuelto!', 'El registro ha sido devuelto correctamente.', 'warning');
                }
            });
        }
    </script>

    <!-- Modal para Revisión (contenido de wfEjecucion) -->
    <div class="modal fade" id="modalRevision" tabindex="-1" role="dialog" aria-labelledby="modalRevisionLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 1400px;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalRevisionLabel">Plan Operativo Anual - Cronograma de Ejecución</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- Sección superior - Responsable POA y Motivo (Para Planificador) -->
                    <div class="row mb-4">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Responsable POA:</label>
                                <input type="text" class="form-control" id="txtResponsablePOAModal" value="Gerencia nacional de TI" readonly />
                                <button type="button" class="btn btn-danger mt-2" onclick="observarRegistro()">Observar</button>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Motivo (en caso de observación):</label>
                                <textarea class="form-control" id="txtMotivoObservacionModal" rows="3"></textarea>
                            </div>
                        </div>
                    </div>

                    <!-- Sección media - Descripción del plan y métricas -->
                    <div class="row mb-4">
                        <div class="col-md-8">
                            <div class="form-group">
                                <label>Resultado Esperado:</label>
                                <input type="text" class="form-control" id="txtResultadoEsperadoModal" value="Implementar al 100% los Seguros de Salud al Core de Seguros de UNIVIDA" />
                            </div>
                            <div class="form-group">
                                <label>Acciones de gestión:</label>
                                <textarea class="form-control" id="txtAccionesGestionModal" rows="3">Implementación de Seguros de Salud en el Sistema CORE de UNIVIDA, como parte del mejoramiento continuo de las operaciones de La Empresa.</textarea>
                            </div>
                            <div class="form-group">
                                <label>Indicador Producto:</label>
                                <textarea class="form-control" id="txtIndicadorProductoModal" rows="3">Se ha implementado el sistema de gestión de Seguros de Salud en el Sistema CORE de UNIVIDA, como parte del mejoramiento continuo de las operaciones de La Empresa.</textarea>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Unidad Responsable:</label>
                                <input type="text" class="form-control" id="txtUnidadResponsableModal" value="Gerencia Nacional de TI" />
                            </div>
                            <div class="form-group">
                                <label>META POA:</label>
                                <input type="text" class="form-control" id="txtMetaPOAModal" value="100 %" />
                            </div>
                            <div class="form-group">
                                <label>Presupuesto Programado:</label>
                                <input type="text" class="form-control" id="txtPresupuestoProgramadoModal" value="88.000,0000" />
                            </div>
                        </div>
                    </div>

                    <!-- Sección inferior - Cronograma de ejecución -->
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">PROGRAMACIÓN - CRONOGRAMA DE EJECUCION</h3>
                        </div>
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-bordered mb-0">
                                    <thead class="bg-primary text-white">
                                        <tr>
                                            <th style="width: 60px;">Ene</th>
                                            <th style="width: 60px;">Feb</th>
                                            <th style="width: 60px;">Mar</th>
                                            <th style="width: 60px;">Abr</th>
                                            <th style="width: 60px;">May</th>
                                            <th style="width: 60px;">Jun</th>
                                            <th style="width: 60px;">Jul</th>
                                            <th style="width: 60px;">Ago</th>
                                            <th style="width: 60px;">Sep</th>
                                            <th style="width: 60px;">Oct</th>
                                            <th style="width: 60px;">Nov</th>
                                            <th style="width: 60px;">Dic</th>
                                            <th style="width: 100px;">Tipo</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>40%</td>
                                            <td></td>
                                            <td>35%</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>25%</td>
                                            <td class="font-weight-bold">Física</td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>88.000</td>
                                            <td class="font-weight-bold">Financiera</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>