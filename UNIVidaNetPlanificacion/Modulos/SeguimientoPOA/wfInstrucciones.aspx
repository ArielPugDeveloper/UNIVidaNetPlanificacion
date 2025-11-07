<%@ Page Title="Instrucciones" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="wfInstrucciones.aspx.cs" Inherits="UNIVidaNetPlanificacion.Modulos.SeguimientoPOA.wfInstrucciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h2>Plan Operativo Anual - Registro de Instrucciones</h2>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item active"><a href="#">Inicio</a></li>
                        <li class="breadcrumb-item active">Seguimiento POA</li>
                        <li class="breadcrumb-item active">Instrucciones</li>
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
            <!-- Barra de acciones -->
            <div class="row mb-3">
                <div class="col-md-2">
                    <button type="button" class="btn btn-success btn-block" onclick="$('#modalAgregarInstruccion').modal('show');">
                        Agregar nueva instruccion
                    </button>
                </div>
                <div class="col-md-8">
                    <!-- Espacio central -->
                </div>
                <div class="col-md-2">
                    <asp:Button ID="btnSeguimientoPEE" runat="server" 
                        Text="Seguimiento PEE" 
                        CssClass="btn btn-success btn-block mb-2" 
                        OnClick="btnSeguimientoPEE_Click" />
                    <asp:Button ID="btnSeguimientoPOA" runat="server" 
                        Text="Seguimiento POA" 
                        CssClass="btn btn-success btn-block" 
                        OnClick="btnSeguimientoPOA_Click" />
                </div>
            </div>

            <!-- Tabla -->
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <asp:GridView ID="gvInstrucciones" runat="server" 
                                    CssClass="table table-bordered mb-0"
                                    AutoGenerateColumns="False"
                                    GridLines="Horizontal"
                                    AllowPaging="false"
                                    ShowFooter="false"
                                    ShowHeaderWhenEmpty="true">
                                    <HeaderStyle CssClass="bg-primary text-white" />
                                    <Columns>
                                        <asp:BoundField HeaderText="Instruccion" DataField="Instruccion" />
                                        <asp:BoundField HeaderText="Fecha de presentacion" DataField="FechaPresentacion" />
                                        <asp:BoundField HeaderText="Fecha limite" DataField="FechaLimite" />
                                        <asp:BoundField HeaderText="Fecha Completado" DataField="FechaCompletado" />
                                        <asp:BoundField HeaderText="Estado" DataField="Estado" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Modal para Agregar Instrucción -->
    <div class="modal fade" id="modalAgregarInstruccion" tabindex="-1" role="dialog" aria-labelledby="modalAgregarInstruccionLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalAgregarInstruccionLabel">Agregar instrucción</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row mb-3">
                        <div class="col-md-3 d-flex align-items-center">
                            <label class="mb-0">Fecha limite</label>
                        </div>
                        <div class="col-md-9">
                            <div class="input-group">
                                <input type="date" class="form-control" id="txtFechaLimite" />
                                <div class="input-group-append">
                                    <span class="input-group-text">
                                        <i class="fas fa-calendar-alt"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-3 d-flex align-items-center">
                            <label class="mb-0">Hora limite</label>
                        </div>
                        <div class="col-md-9">
                            <div class="input-group">
                                <input type="time" class="form-control" id="txtHoraLimite" value="15:00" />
                                <div class="input-group-append">
                                    <span class="input-group-text">
                                        <i class="fas fa-clock"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-3 d-flex align-items-center">
                            <label class="mb-0">Instructivo:</label>
                        </div>
                        <div class="col-md-9">
                            <textarea class="form-control" id="txtInstructivo" rows="3"></textarea>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-3 d-flex align-items-center">
                            <label class="mb-0">Adjuntar</label>
                        </div>
                        <div class="col-md-9">
                            <div class="form-group mb-0">
                                <input type="file" id="fileAdjunto" class="form-control" />
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <p class="text-muted mb-0">Se enviará una notificación a todos los responsables POA junto con el archivo adjunto.</p>
                        </div>
                    </div>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-success btn-lg px-5" onclick="agregarInstruccion()">Agregar</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function agregarInstruccion() {
            var fechaLimite = document.getElementById('txtFechaLimite').value;
            var horaLimite = document.getElementById('txtHoraLimite').value;
            var instructivo = document.getElementById('txtInstructivo').value;
            var archivo = document.getElementById('fileAdjunto').files.length;

            if (!fechaLimite) {
                Swal.fire({
                    title: 'Atención',
                    text: 'Por favor ingrese la fecha límite.',
                    icon: 'warning',
                    confirmButtonText: 'Entendido'
                });
                return;
            }

            if (!horaLimite) {
                Swal.fire({
                    title: 'Atención',
                    text: 'Por favor ingrese la hora límite.',
                    icon: 'warning',
                    confirmButtonText: 'Entendido'
                });
                return;
            }

            if (!instructivo) {
                Swal.fire({
                    title: 'Atención',
                    text: 'Por favor ingrese el instructivo.',
                    icon: 'warning',
                    confirmButtonText: 'Entendido'
                });
                return;
            }

            // Cerrar modal y mostrar mensaje de éxito
            $('#modalAgregarInstruccion').modal('hide');
            
            Swal.fire({
                title: '¡Agregado!',
                text: 'La instrucción ha sido agregada correctamente y se ha enviado la notificación.',
                icon: 'success',
                confirmButtonText: 'Entendido'
            }).then(() => {
                // Limpiar campos
                document.getElementById('txtFechaLimite').value = '';
                document.getElementById('txtHoraLimite').value = '15:00';
                document.getElementById('txtInstructivo').value = '';
                document.getElementById('fileAdjunto').value = '';
            });
        }
    </script>
</asp:Content>