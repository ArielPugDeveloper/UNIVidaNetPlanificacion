<%@ Page Title="Seguimiento POA" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="wfSeguimientoPOA.aspx.cs" Inherits="UNIVidaNetPlanificacion.Modulos.SeguimientoPOA.wfSeguimientoPOA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h2>Plan Operativo Anual - Indicadores</h2>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item active"><a href="#">Inicio</a></li>
                        <li class="breadcrumb-item active">Seguimiento POA</li>
                        <li class="breadcrumb-item active">Indicadores</li>
                    </ol>
                    <div class="float-sm-right mt-2">
                        <asp:Button ID="btnVerFicha" runat="server" Text="Ver Ficha" CssClass="btn btn-warning" OnClick="btnVerFicha_Click" />
                        <asp:LinkButton ID="lnkVolver" runat="server" Text="Volver" CssClass="btn btn-secondary" OnClick="lnkVolver_Click" />
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="content mb-5">
        <div class="container-fluid">
            <!-- Filtros -->
            <div class="row mb-3">
                <div class="col-md-2">
                    <label>Gestión:</label>
                    <asp:TextBox ID="txtGestion" runat="server" CssClass="form-control" Text="2026" />
                </div>
                <div class="col-md-2">
                    <label>Ultima instruccion inicio:</label>
                    <asp:TextBox ID="txtUltimaInstruccionInicio" runat="server" CssClass="form-control" Text="15/01/2025" />
                </div>
                <div class="col-md-2">
                    <label>Hora limite:</label>
                    <asp:TextBox ID="txtHoraLimite" runat="server" CssClass="form-control" Text="30/01/2025" />
                </div>
                <div class="col-md-4">
                    <!-- Espacio adicional -->
                </div>
                <div class="col-md-2">
                    <label>&nbsp;</label>
                    <asp:Button ID="btnGenerarSeguimientoPOAExcel" runat="server" Text="Generar Seguimiento POA (Excel)" CssClass="btn btn-primary btn-block" OnClick="btnGenerarSeguimientoPOAExcel_Click" />
                </div>
            </div>

            <!-- Segunda fila de filtros -->
            <div class="row mb-3">
                <div class="col-md-2">
                    <label>Responsable PEE:</label>
                    <asp:TextBox ID="txtResponsablePEE" runat="server" CssClass="form-control" Text="Gerencia Nacional de TI" />
                </div>
                <div class="col-md-2">
                    <label>Ultima Instruccion limite:</label>
                    <asp:TextBox ID="txtUltimaInstruccionLimite" runat="server" CssClass="form-control" Text="30/01/2025" />
                </div>
                <div class="col-md-6">
                    <!-- Espacio adicional -->
                </div>
                <div class="col-md-2">
                    <label>&nbsp;</label>
                    <asp:Button ID="btnEnviarRegistros" runat="server" Text="Enviar Registros" CssClass="btn btn-primary btn-block" OnClick="btnEnviarRegistros_Click" />
                </div>
            </div>

            <!-- Tabla -->
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <asp:GridView ID="gvSeguimientoPOA" runat="server"
                                    CssClass="table table-bordered mb-0"
                                    AutoGenerateColumns="False"
                                    GridLines="Horizontal"
                                    AllowPaging="false"
                                    ShowFooter="false"
                                    ShowHeaderWhenEmpty="true"
                                    OnRowDataBound="gvSeguimientoPOA_RowDataBound">
                                    <HeaderStyle CssClass="bg-primary text-white" />
                                    <Columns>
                                        <asp:BoundField HeaderText="Objetivo de Gestión" DataField="ObjetivoGestion" />
                                        <asp:BoundField HeaderText="Indicador de Gestión" DataField="IndicadorGestion" />
                                        <asp:BoundField HeaderText="Resultados Esperados" DataField="ResultadosEsperados" />
                                        <asp:BoundField HeaderText="Acciones de Gestión" DataField="AccionesGestion" />
                                        <asp:BoundField HeaderText="Estado" DataField="Estado" />
                                        <asp:TemplateField HeaderText="Opciones" ItemStyle-Width="120px">
                                            <ItemTemplate>
                                                <div class="d-flex flex-column">
                                                    <button type="button" class="btn btn-primary btn-sm mb-1" onclick="abrirModalRevisar()">
                                                        Registrar
                                                    </button>
                                                    <asp:Button ID="btnDetalle" runat="server"
                                                        Text="Detalle"
                                                        CssClass="btn btn-primary btn-sm mb-1"
                                                        OnClick="btnDetalle_Click"
                                                        CommandArgument='<%# Eval("Id") %>' />
                                                    <button type="button" class="btn btn-info btn-sm" onclick="$('#modalMasInfo').modal('show');">
                                                        Más Info
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
                                <textarea id="txtAccionGestionModal" class="form-control" rows="2">Implementación al 100% de una plataforma de seguimiento de Siniestros SOAT en UNIVidaApp</textarea>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Indicador de producto:</label>
                                <textarea id="txtIndicadorProductoModal" class="form-control" rows="2">Implementación al 100% de una plataforma de seguimiento de Siniestros SOAT en UNIVidaApp</textarea>
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
                                            <td><input type="text" class="form-control form-control-sm text-center" value="0" style="border: none; background: transparent;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" value="0" style="border: none; background: transparent;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" value="0" style="border: none; background: transparent;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" value="10" style="border: none; background: transparent;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" value="20" style="border: none; background: transparent;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" value="30" style="border: none; background: transparent;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" value="40" style="border: none; background: transparent;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" value="50" style="border: none; background: transparent;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" value="70" style="border: none; background: transparent;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" value="80" style="border: none; background: transparent;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" value="90" style="border: none; background: transparent;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" value="100" style="border: none; background: transparent;" /></td>
                                            <td class="text-center">Programado</td>
                                        </tr>
                                        <tr>
                                            <td><input type="text" class="form-control form-control-sm text-center" value="0" style="border: none; background: transparent;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" value="0" style="border: none; background: transparent;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" value="0" style="border: none; background: transparent;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" value="8" style="border: none; background: transparent;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" value="15" style="border: none; background: transparent;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" value="25" style="border: none; background: transparent;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" value="35" style="border: none; background: transparent;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" value="45" style="border: none; background: transparent;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" value="60" style="border: none; background: transparent;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" value="70" style="border: none; background: transparent;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" value="85" style="border: none; background: transparent;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" value="95" style="border: none; background: transparent;" /></td>
                                            <td class="text-center">Ejecutado</td>
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
                                <textarea id="txtDescripcionModal" class="form-control" rows="4" placeholder="Ingrese descripción..."></textarea>
                            </div>
                            <div class="form-group">
                                <label>Justificación:</label>
                                <textarea id="txtJustificacionModal" class="form-control" rows="4" placeholder="Ingrese justificación..."></textarea>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Acción Correctiva:</label>
                                <textarea id="txtAccionCorrectivaModal" class="form-control" rows="4" placeholder="Ingrese acción correctiva..."></textarea>
                            </div>
                            <div class="form-group">
                                <label>Medios de Verificación:</label>
                                <textarea id="txtMediosVerificacionModal" class="form-control" rows="4" placeholder="Ingrese medios de verificación..."></textarea>
                            </div>
                        </div>
                    </div>

                    <!-- Sección de carga de archivos -->
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Medios de Verificación</h3>
                        </div>
                        <div class="card-body">
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label>Cargar respaldo de medios de verificación:</label>
                                    <input type="file" id="fileUploadModal" class="form-control" />
                                </div>
                                <div class="col-md-3">
                                    <label>&nbsp;</label>
                                    <button type="button" class="btn btn-primary btn-block" onclick="adjuntarArchivoModal()">Adjuntar</button>
                                </div>
                                <div class="col-md-3">
                                    <label>Con excepción MV:</label>
                                    <input type="text" id="txtConExcepcionMVModal" class="form-control" value="NO" readonly style="background-color: #f8f9fa;" />
                                </div>
                            </div>

                            <!-- Tabla de archivos adjuntos -->
                            <div class="table-responsive">
                                <table class="table table-bordered mb-0">
                                    <thead class="bg-light">
                                        <tr>
                                            <th>Nombre adjunto</th>
                                            <th>Fecha</th>
                                            <th style="width: 100px;">Archivo</th>
                                            <th style="width: 100px;">Opción</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbodyArchivosAdjuntos">
                                        <tr>
                                            <td>Documento_Respaldo_1.pdf</td>
                                            <td>25/10/2025</td>
                                            <td><button type="button" class="btn btn-sm btn-info" onclick="abrirArchivo(1)">Abrir</button></td>
                                            <td><button type="button" class="btn btn-sm btn-danger" onclick="eliminarArchivo(1)">Eliminar</button></td>
                                        </tr>
                                        <tr>
                                            <td>Informe_Progreso.docx</td>
                                            <td>28/10/2025</td>
                                            <td><button type="button" class="btn btn-sm btn-info" onclick="abrirArchivo(2)">Abrir</button></td>
                                            <td><button type="button" class="btn btn-sm btn-danger" onclick="eliminarArchivo(2)">Eliminar</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-success btn-lg px-5 mr-3" onclick="guardarSeguimiento()">Guardar</button>
                    <button type="button" class="btn btn-primary btn-lg px-4" onclick="solicitarExcepcionMV()">Solicitar Excepcion a MV</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Solicitar Excepcion a MV -->
    <div class="modal fade" id="modalSolicitarExcepcionMV" tabindex="-1" role="dialog" aria-labelledby="modalSolicitarExcepcionMVLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header" style="border-bottom: none;">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body text-center">
                    <h3 class="mb-4" style="color: #17a2b8; font-weight: bold;">Solicitar Excepcion a MV</h3>
                    
                    <div class="text-left mb-4">
                        <label class="font-weight-bold">Motivo</label>
                        <textarea id="txtMotivoExcepcionMV" class="form-control" rows="3" placeholder=""></textarea>
                    </div>

                    <button type="button" class="btn btn-success btn-lg px-5" onclick="confirmarSolicitudExcepcionMV()">Confirmar Solicitud</button>
                </div>
            </div>
        </div>
        </div>

    <script>
        // Función para abrir el modal de Revisar
        function abrirModalRevisar() {
            $('#modalRevisar').modal('show');
        }

        // Función para guardar seguimiento
        function guardarSeguimiento() {
            Swal.fire({
                title: '¿Guardar cambios?',
                text: '¿Está seguro de que desea guardar los cambios del seguimiento?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#28a745',
                cancelButtonColor: '#6c757d',
                confirmButtonText: 'Sí, guardar',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    $('#modalRevisar').modal('hide');
                    Swal.fire({
                        title: '¡Guardado!',
                        text: 'El seguimiento ha sido guardado correctamente.',
                        icon: 'success',
                        confirmButtonText: 'Entendido'
                    });
                }
            });
        }

        // Función para solicitar excepción a MV
        function solicitarExcepcionMV() {
            $('#modalSolicitarExcepcionMV').modal('show');
        }

        // Función para confirmar solicitud de excepción a MV
        function confirmarSolicitudExcepcionMV() {
            var motivo = document.getElementById('txtMotivoExcepcionMV').value.trim();
            
            if (motivo === '') {
                Swal.fire({
                    title: 'Motivo requerido',
                    text: 'Por favor ingrese el motivo de la solicitud.',
                    icon: 'warning',
                    confirmButtonText: 'Entendido'
                });
                return;
            }

            $('#modalSolicitarExcepcionMV').modal('hide');
            $('#modalRevisar').modal('hide');
            
            Swal.fire({
                title: '¡Solicitud enviada!',
                text: 'La solicitud de excepción a MV ha sido enviada correctamente.',
                icon: 'success',
                confirmButtonText: 'Entendido'
            });
            
            // Limpiar el campo motivo
            document.getElementById('txtMotivoExcepcionMV').value = '';
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
    </script>

    <!-- Modal para Más Info -->
    <div class="modal fade" id="modalMasInfo" tabindex="-1" role="dialog" aria-labelledby="modalMasInfoLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 1400px;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalMasInfoLabel">Información Adicional</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="table-responsive">
                        <table class="table table-bordered mb-0">
                            <thead class="bg-success text-white">
                                <tr>
                                    <th class="text-center align-middle" style="width: 33%;">INDICADOR</th>
                                    <th class="text-center align-middle" style="width: 33%;">OBJETIVO DE GESTIÓN</th>
                                    <th class="text-center align-middle" style="width: 34%;">INDICADOR DE GESTIÓN</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="align-middle" style="background-color: #ffffff; padding: 15px;">
                                        Promover el mejoramiento continuo de la tecnología, la innovación y el funcionamiento óptimo de los sistemas informáticos de UNIVIDA S.A.
                                    </td>
                                    <td class="align-middle" style="background-color: #ffffff; padding: 15px;">
                                        Promover el mejoramiento continuo de la tecnología, la innovación y el funcionamiento óptimo de los sistemas informáticos de UNIVIDA S.A.
                                    </td>
                                    <td class="align-middle" style="background-color: #ffffff; padding: 15px;">
                                        (Cantidad de ramos habilitados integrados al CORE / cantidad de ramos habilitados)*100
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
