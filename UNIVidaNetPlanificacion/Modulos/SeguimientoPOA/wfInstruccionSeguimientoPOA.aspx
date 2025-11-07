<%@ Page Title="Seguimiento de Instrucciones POA" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="wfInstruccionSeguimientoPOA.aspx.cs" Inherits="UNIVidaNetPlanificacion.Modulos.SeguimientoPOA.wfInstruccionSeguimientoPOA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h2>Plan Operativo Anual - Seguimiento de Instrucciones</h2>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item active"><a href="#">Inicio</a></li>
                        <li class="breadcrumb-item active">Seguimiento POA</li>
                        <li class="breadcrumb-item active">Seguimiento Instrucciones POA</li>
                    </ol>
                    <div class="float-sm-right mt-2">
                        <asp:LinkButton ID="lnkVolver" runat="server" Text="Volver" CssClass="btn btn-secondary" OnClick="lnkVolver_Click" />
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="content mb-5">
        <div class="container-fluid">
            <!-- Fechas y botón Ampliar -->
            <div class="row mb-3">
                <div class="col-md-2">
                    <label>Fecha Instrucción asignada:</label>
                    <asp:TextBox ID="txtFechaInstruccionAsignada" runat="server" 
                        CssClass="form-control" 
                        Text="30/10/2025" 
                        ReadOnly="true" 
                        BackColor="#f8f9fa" />
                </div>
                <div class="col-md-2">
                    <label>Fecha límite asignada:</label>
                    <asp:TextBox ID="txtFechaLimiteAsignada" runat="server" 
                        CssClass="form-control" 
                        Text="30/11/2025" 
                        ReadOnly="true" 
                        BackColor="#f8f9fa" />
                </div>
                <div class="col-md-2">
                    <label>Última fecha de ampliación:</label>
                    <asp:TextBox ID="txtUltimaFechaAmpliacion" runat="server" 
                        CssClass="form-control" 
                        Text="10/12/2025" 
                        ReadOnly="true" 
                        BackColor="#f8f9fa" />
                </div>
                <div class="col-md-2">
                    <label>&nbsp;</label>
                    <button type="button" class="btn btn-success btn-block" onclick="$('#modalAmpliarFecha').modal('show');">
                        Ampliar fecha límite
                    </button>
                </div>
                <div class="col-md-4">
                    <!-- Espacio para futuras acciones -->
                </div>
            </div>

            <!-- Tabla -->
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <asp:GridView ID="gvSeguimientoInstruccionesPOA" runat="server" 
                                    CssClass="table table-bordered mb-0"
                                    AutoGenerateColumns="False"
                                    GridLines="Horizontal"
                                    AllowPaging="false"
                                    ShowFooter="false"
                                    ShowHeaderWhenEmpty="true">
                                    <HeaderStyle CssClass="bg-primary text-white" />
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <select id="filtroObjetivoEstrategico" class="form-control form-control-sm" onchange="filtrarTablaInstrucciones()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;">
                                                    <option value="">Todos</option>
                                                </select>
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Objetivo Estratégico</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="12%" />
                                            <ItemTemplate>
                                                <%# Eval("ObjetivoEstrategico") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroIndicador" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTablaInstrucciones()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Indicador</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="12%" />
                                            <ItemTemplate>
                                                <%# Eval("Indicador") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroObjetivoGestion" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTablaInstrucciones()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Objetivo de gestión</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="12%" />
                                            <ItemTemplate>
                                                <%# Eval("ObjetivoGestion") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroAccionGestion" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTablaInstrucciones()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Acción de Gestión</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="12%" />
                                            <ItemTemplate>
                                                <%# Eval("AccionGestion") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroResponsablePOA" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTablaInstrucciones()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Responsable POA</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="10%" />
                                            <ItemTemplate>
                                                <%# Eval("ResponsablePOA") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <select id="filtroEstado" class="form-control form-control-sm" onchange="filtrarTablaInstrucciones()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;">
                                                    <option value="">Todos</option>
                                                    <option value="EN ELABORACION">EN ELABORACION</option>
                                                    <option value="RETRASADO">RETRASADO</option>
                                                    <option value="COMPLETADO">COMPLETADO</option>
                                                </select>
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Estado</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="10%" />
                                            <ItemTemplate>
                                                <%# Eval("Estado") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <select id="filtroExcepcionMV" class="form-control form-control-sm" onchange="filtrarTablaInstrucciones()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;">
                                                    <option value="">Todos</option>
                                                    <option value="NO">NO</option>
                                                    <option value="SI">SI</option>
                                                    <option value="Solicita Excepcion">Solicita Excepcion</option>
                                                </select>
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Excepción MV</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="10%" />
                                            <ItemTemplate>
                                                <%# Eval("ExcepcionMV") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField HeaderText="Opciones" ItemStyle-CssClass="text-center">
                                            <ItemTemplate>
                                                <div class="d-flex flex-column align-items-stretch" style="width: 80px; margin: 0 auto;">
                                                    <button type="button" class="btn btn-info btn-sm mb-1" onclick="abrirModalRevisar()">
                                                        Revisar
                                                    </button>
                                                    <button type="button" class="btn btn-secondary btn-sm" onclick="$('#modalMV').modal('show');">
                                                        MV
                                                    </button>
                                                </div>
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

    <!-- Modal Revisar - Seguimiento Operativo -->
    <div class="modal fade" id="modalRevisar" tabindex="-1" role="dialog" aria-labelledby="modalRevisarLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalRevisarLabel">Seguimiento Operativo</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- Sección media - Detalles de acción e indicador -->
                    <div class="row mb-4">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Acción de gestión:</label>
                                <textarea id="txtAccionGestionModal" class="form-control" rows="2" readonly style="background-color: #f8f9fa;">Implementación al 100% de una plataforma de seguimiento de Siniestros SOAT en UNIVidaApp</textarea>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Indicador de producto:</label>
                                <textarea id="txtIndicadorProductoModal" class="form-control" rows="2" readonly style="background-color: #f8f9fa;">Implementación al 100% de una plataforma de seguimiento de Siniestros SOAT en UNIVidaApp</textarea>
                            </div>
                        </div>
                    </div>

                    <!-- Sección cronograma -->
                    <div class="card mb-4">
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
                                            <td>0</td>
                                            <td>0</td>
                                            <td>0</td>
                                            <td>10</td>
                                            <td>20</td>
                                            <td>30</td>
                                            <td>40</td>
                                            <td>50</td>
                                            <td>70</td>
                                            <td>80</td>
                                            <td>90</td>
                                            <td>100</td>
                                            <td>Programado</td>
                                        </tr>
                                        <tr>
                                            <td>0</td>
                                            <td>0</td>
                                            <td>0</td>
                                            <td>8</td>
                                            <td>15</td>
                                            <td>25</td>
                                            <td>35</td>
                                            <td>45</td>
                                            <td>60</td>
                                            <td>70</td>
                                            <td>85</td>
                                            <td>95</td>
                                            <td>Ejecutado</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- Sección inferior - Descripciones -->
                    <div class="row mb-4">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Descripción:</label>
                                <textarea id="txtDescripcionModal" class="form-control" rows="4" readonly style="background-color: #f8f9fa;">Durante el tercer trimestre se logró implementar el módulo de seguimiento de siniestros SOAT en la aplicación móvil UNIVidaApp, alcanzando un 70% de avance según lo programado. Se realizaron las pruebas de integración con el sistema CORE y se capacitó al personal de soporte técnico.</textarea>
                            </div>
                            <div class="form-group">
                                <label>Justificación:</label>
                                <textarea id="txtJustificacionModal" class="form-control" rows="4" readonly style="background-color: #f8f9fa;">El avance del 70% se debe a retrasos en la entrega de especificaciones técnicas por parte del área de Siniestros, lo cual retrasó el desarrollo de ciertos módulos. Sin embargo, se logró mantener el cronograma ajustado gracias a la reasignación de recursos del equipo de desarrollo.</textarea>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Acción Correctiva:</label>
                                <textarea id="txtAccionCorrectivaModal" class="form-control" rows="4" readonly style="background-color: #f8f9fa;">Se establecerá un canal de comunicación directo con el área de Siniestros para agilizar la entrega de especificaciones. Adicionalmente, se programarán reuniones semanales de seguimiento para asegurar el cumplimiento de los plazos establecidos y evitar demoras en las siguientes fases del proyecto.</textarea>
                            </div>
                            <div class="form-group">
                                <label>Medios de Verificación:</label>
                                <textarea id="txtMediosVerificacionModal" class="form-control" rows="4" readonly style="background-color: #f8f9fa;">- Actas de reuniones de seguimiento del proyecto
- Informes de avance quincenal del equipo de desarrollo
- Capturas de pantalla del módulo implementado en ambiente de pruebas
- Certificados de capacitación del personal técnico
- Registros de pruebas de integración con el sistema CORE</textarea>
                            </div>
                        </div>
                    </div>

                    <!-- Sección de carga de archivos -->
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Medios de Verificación</h3>
                        </div>
                        <div class="card-body">
                            <!-- Tabla de archivos adjuntos -->
                            <div class="table-responsive">
                                <table class="table table-bordered mb-0">
                                    <thead class="bg-light">
                                        <tr>
                                            <th>Nombre adjunto</th>
                                            <th>Fecha</th>
                                            <th style="width: 100px;">Archivo</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbodyArchivosAdjuntos">
                                        <tr>
                                            <td>Documento_Respaldo_1.pdf</td>
                                            <td>25/10/2025</td>
                                            <td><button type="button" class="btn btn-sm btn-info" onclick="abrirArchivo(1)">Abrir</button></td>
                                        </tr>
                                        <tr>
                                            <td>Informe_Progreso.docx</td>
                                            <td>28/10/2025</td>
                                            <td><button type="button" class="btn btn-sm btn-info" onclick="abrirArchivo(2)">Abrir</button></td>
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

    <!-- Modal MV (Excepción a Medio de Verificación) -->
    <div class="modal fade" id="modalMV" tabindex="-1" role="dialog" aria-labelledby="modalMVLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalMVLabel">Excepción a Medio de Verificación</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- Botones de acción -->
                    <div class="row mb-3">
                        <div class="col-12">
                            <button type="button" class="btn btn-success btn-block mb-2" onclick="aceptarSolicitud()">
                                Aceptar Solicitud
                            </button>
                            <button type="button" class="btn btn-danger btn-block" onclick="rechazarSolicitud()">
                                Rechazar Solicitud
                            </button>
                        </div>
                    </div>

                    <!-- Campo Motivo -->
                    <div class="row">
                        <div class="col-12">
                            <label class="font-weight-bold">Motivo</label>
                            <textarea id="txtMotivoMV" class="form-control" rows="3" placeholder="Ingrese el motivo..."></textarea>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Función para abrir el modal de Revisar
        function abrirModalRevisar() {
            $('#modalRevisar').modal('show');
        }

        // Funciones para el modal de Seguimiento Operativo
        function adjuntarArchivoModal() {
            Swal.fire({
                title: '¡Archivo adjuntado!',
                text: 'El archivo ha sido adjuntado correctamente.',
                icon: 'success',
                confirmButtonText: 'Entendido'
            });
        }

        function abrirArchivo(id) {
            Swal.fire({
                title: 'Abrir archivo',
                text: 'Abriendo archivo ID: ' + id,
                icon: 'info',
                confirmButtonText: 'Entendido'
            });
        }

        function eliminarArchivo(id) {
            Swal.fire({
                title: '¿Eliminar archivo?',
                text: '¿Está seguro de que desea eliminar este archivo?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#dc3545',
                cancelButtonColor: '#6c757d',
                confirmButtonText: 'Sí, eliminar',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        title: '¡Eliminado!',
                        text: 'El archivo ha sido eliminado correctamente.',
                        icon: 'success',
                        confirmButtonText: 'Entendido'
                    });
                }
            });
        }

        // Funciones para el modal MV
        function aceptarSolicitud() {
            var motivo = document.getElementById('txtMotivoMV').value;

            Swal.fire({
                title: '¿Confirmar aceptación?',
                text: '¿Está seguro de que desea aceptar esta solicitud?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#28a745',
                cancelButtonColor: '#6c757d',
                confirmButtonText: 'Sí, aceptar',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    $('#modalMV').modal('hide');
                    Swal.fire({
                        title: '¡Aceptado!',
                        text: 'La solicitud ha sido aceptada correctamente.',
                        icon: 'success',
                        confirmButtonText: 'Entendido'
                    }).then(() => {
                        // Limpiar campo
                        document.getElementById('txtMotivoMV').value = '';
                    });
                }
            });
        }

        function rechazarSolicitud() {
            var motivo = document.getElementById('txtMotivoMV').value;

            if (!motivo || motivo.trim() === '') {
                Swal.fire({
                    title: 'Atención',
                    text: 'Por favor ingrese el motivo del rechazo.',
                    icon: 'warning',
                    confirmButtonText: 'Entendido'
                });
                return;
            }

            Swal.fire({
                title: '¿Confirmar rechazo?',
                text: '¿Está seguro de que desea rechazar esta solicitud?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#dc3545',
                cancelButtonColor: '#6c757d',
                confirmButtonText: 'Sí, rechazar',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    $('#modalMV').modal('hide');
                    Swal.fire({
                        title: '¡Rechazado!',
                        text: 'La solicitud ha sido rechazada correctamente.',
                        icon: 'error',
                        confirmButtonText: 'Entendido'
                    }).then(() => {
                        // Limpiar campo
                        document.getElementById('txtMotivoMV').value = '';
                    });
                }
            });
        }

        function confirmarAmpliacion() {
            var fecha = document.getElementById('txtFechaAmpliacionPOA').value;
            var motivo = document.getElementById('txtMotivoAmpliacionPOA').value.trim();

            if (!fecha) {
                Swal.fire({
                    title: 'Fecha requerida',
                    text: 'Por favor seleccione una fecha.',
                    icon: 'warning',
                    confirmButtonText: 'Entendido'
                });
                return;
            }

            if (motivo === '') {
                Swal.fire({
                    title: 'Motivo requerido',
                    text: 'Por favor ingrese el motivo de la ampliación.',
                    icon: 'warning',
                    confirmButtonText: 'Entendido'
                });
                return;
            }

            $('#modalAmpliarFecha').modal('hide');

            Swal.fire({
                title: '¡Fecha ampliada!',
                text: 'La fecha límite ha sido ampliada correctamente.',
                icon: 'success',
                confirmButtonText: 'Entendido'
            }).then(() => {
                // Limpiar campos
                document.getElementById('txtFechaAmpliacionPOA').value = '';
                document.getElementById('txtMotivoAmpliacionPOA').value = '';
            });
        }

        // Cargar opciones del dropdown de Objetivo Estratégico al cargar la página
        window.addEventListener('DOMContentLoaded', function() {
            cargarOpcionesObjetivosEstrategicosInstrucciones();
        });

        function cargarOpcionesObjetivosEstrategicosInstrucciones() {
            var tabla = document.getElementById('<%= gvSeguimientoInstruccionesPOA.ClientID %>');
            var filas = tabla.getElementsByTagName('tr');
            var opciones = new Set();
            opciones.add('');

            for (var i = 1; i < filas.length; i++) {
                var celdas = filas[i].getElementsByTagName('td');
                if (celdas.length > 0) {
                    var textoOE = celdas[0].textContent.trim();
                    if (textoOE) {
                        opciones.add(textoOE);
                    }
                }
            }

            var select = document.getElementById('filtroObjetivoEstrategico');
            if (select) {
                select.innerHTML = '<option value="">Todos</option>';
                
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

        function filtrarTablaInstrucciones() {
            var tabla = document.getElementById('<%= gvSeguimientoInstruccionesPOA.ClientID %>');
            var filas = tabla.getElementsByTagName('tr');

            var filtroOE = document.getElementById('filtroObjetivoEstrategico').value.trim();
            var filtroInd = document.getElementById('filtroIndicador').value.toLowerCase();
            var filtroOG = document.getElementById('filtroObjetivoGestion').value.toLowerCase();
            var filtroAG = document.getElementById('filtroAccionGestion').value.toLowerCase();
            var filtroResp = document.getElementById('filtroResponsablePOA').value.toLowerCase();
            var filtroEst = document.getElementById('filtroEstado').value.trim();
            var filtroExc = document.getElementById('filtroExcepcionMV').value.trim();

            for (var i = 1; i < filas.length; i++) {
                var celdas = filas[i].getElementsByTagName('td');
                if (celdas.length > 0) {
                    var textoOE = celdas[0].textContent.trim();
                    var textoInd = celdas[1].textContent.toLowerCase();
                    var textoOG = celdas[2].textContent.toLowerCase();
                    var textoAG = celdas[3].textContent.toLowerCase();
                    var textoResp = celdas[4].textContent.toLowerCase();
                    var textoEst = celdas[5].textContent.trim();
                    var textoExc = celdas[6].textContent.trim();

                    var mostrar = true;

                    if (filtroOE && textoOE !== filtroOE) mostrar = false;
                    if (filtroInd && textoInd.indexOf(filtroInd) === -1) mostrar = false;
                    if (filtroOG && textoOG.indexOf(filtroOG) === -1) mostrar = false;
                    if (filtroAG && textoAG.indexOf(filtroAG) === -1) mostrar = false;
                    if (filtroResp && textoResp.indexOf(filtroResp) === -1) mostrar = false;
                    if (filtroEst && textoEst !== filtroEst) mostrar = false;
                    if (filtroExc && textoExc !== filtroExc) mostrar = false;

                    filas[i].style.display = mostrar ? '' : 'none';
                }
            }
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
                <div class="modal-body">
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label font-weight-bold">Fecha</label>
                        <div class="col-sm-9">
                            <input type="date" id="txtFechaAmpliacionPOA" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="font-weight-bold">Motivo:</label>
                        <textarea id="txtMotivoAmpliacionPOA" class="form-control" rows="5" placeholder="Ingrese el motivo..."></textarea>
                    </div>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-success btn-lg px-5" onclick="confirmarAmpliacion()">Ampliar</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>