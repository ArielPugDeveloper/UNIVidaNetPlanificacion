<%@ Page Title="Seguimiento POA" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="wfSeguimientoEncargadoPOA.aspx.cs" Inherits="UNIVidaNetPlanificacion.Modulos.SeguimientoPOA.wfSeguimientoEncargadoPOA" %>

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
                                        <asp:BoundField HeaderText="Responsable POA" DataField="ResponsablePOA" />
                                        <asp:BoundField HeaderText="Estado" DataField="Estado" />
                                        <asp:TemplateField HeaderText="Opciones" ItemStyle-Width="120px">
                                            <ItemTemplate>
                                                <div class="d-flex flex-column">
                                                    <button type="button" class="btn btn-primary btn-sm mb-1" onclick="abrirModalRevisar()">
                                                        Revisar
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
                    <!-- Botones superiores -->
                    <div class="row mb-4">
                        <div class="col-12 text-center">
                            <button type="button" class="btn btn-success btn-lg px-5 mr-3" onclick="aprobarSeguimiento()">Aprobar</button>
                            <button type="button" class="btn btn-danger btn-lg px-5" onclick="devolverSeguimiento()">Devolver</button>
                        </div>
                    </div>

                    <!-- Campo Motivo -->
                    <div class="row mb-4">
                        <div class="col-12">
                            <label class="font-weight-bold">Motivo (En caso de devolución)</label>
                            <textarea id="txtMotivoSeguimiento" class="form-control" rows="3" placeholder="Ingrese motivo..."></textarea>
                        </div>
                    </div>

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
                                <textarea id="txtDescripcionModal" class="form-control" rows="4" readonly style="background-color: #f8f9fa;"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Justificación:</label>
                                <textarea id="txtJustificacionModal" class="form-control" rows="4" readonly style="background-color: #f8f9fa;"></textarea>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Acción Correctiva:</label>
                                <textarea id="txtAccionCorrectivaModal" class="form-control" rows="4" readonly style="background-color: #f8f9fa;"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Medios de Verificación:</label>
                                <textarea id="txtMediosVerificacionModal" class="form-control" rows="4" readonly style="background-color: #f8f9fa;"></textarea>
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

    <script>
        // Función para abrir el modal de Revisar
        function abrirModalRevisar() {
            $('#modalRevisar').modal('show');
        }

        // Función para aprobar seguimiento
        function aprobarSeguimiento() {
            Swal.fire({
                title: '¿Confirmar aprobación?',
                text: '¿Está seguro de que desea aprobar este seguimiento?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#28a745',
                cancelButtonColor: '#6c757d',
                confirmButtonText: 'Sí, aprobar',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    $('#modalRevisar').modal('hide');
                    Swal.fire({
                        title: '¡Aprobado!',
                        text: 'El seguimiento ha sido aprobado correctamente.',
                        icon: 'success',
                        confirmButtonText: 'Entendido'
                    });
                }
            });
        }

        // Función para devolver seguimiento
        function devolverSeguimiento() {
            // Obtener el motivo de devolución
            var motivo = document.getElementById('txtMotivoSeguimiento').value.trim();
            
            if (motivo === '') {
                Swal.fire({
                    title: 'Motivo requerido',
                    text: 'Por favor ingrese el motivo de devolución.',
                    icon: 'warning',
                    confirmButtonText: 'Entendido'
                });
                return;
            }
            
            Swal.fire({
                title: '¿Confirmar devolución?',
                text: '¿Está seguro de que desea devolver este seguimiento?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#dc3545',
                cancelButtonColor: '#6c757d',
                confirmButtonText: 'Sí, devolver',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    $('#modalRevisar').modal('hide');
                    Swal.fire({
                        title: '¡Devuelto!',
                        text: 'El seguimiento ha sido devuelto correctamente.',
                        icon: 'success',
                        confirmButtonText: 'Entendido'
                    });
                    // Limpiar el campo motivo
                    document.getElementById('txtMotivoSeguimiento').value = '';
                }
            });
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
