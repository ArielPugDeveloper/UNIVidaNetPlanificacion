<%@ Page Title="Reprogramacion Solicitud" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="wfReprogramacionEncargadoSolicitudPOA.aspx.cs" Inherits="UNIVidaNetPlanificacion.Modulos.ProgramacionPOA.wfReprogramacionEncargadoSolicitudPOA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h2>Plan Operativo Anual - Reprogramacion</h2>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item active"><a href="#">Inicio</a></li>
                        <li class="breadcrumb-item active">Programacion POA</li>
                        <li class="breadcrumb-item active">Reprogramacion Solicitud</li>
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
            <!-- Información superior -->
            <div class="row mb-3">
                <div class="col-md-3">
                    <label>Responsable PEE:</label>
                    <asp:TextBox ID="txtResponsablePEE" runat="server" 
                        CssClass="form-control" 
                        Text="Gerencia Nacional de TI" 
                        ReadOnly="true" 
                        BackColor="#f8f9fa" />
                </div>
                <div class="col-md-2">
                    <label>Fecha de inicio:</label>
                    <asp:TextBox ID="txtFechaInicio" runat="server" 
                        CssClass="form-control" 
                        Text="15/01/2025" 
                        ReadOnly="true" 
                        BackColor="#f8f9fa" />
                </div>
                <div class="col-md-2">
                    <label>Fecha limite:</label>
                    <asp:TextBox ID="txtFechaLimite" runat="server" 
                        CssClass="form-control" 
                        Text="30/01/2025" 
                        ReadOnly="true" 
                        BackColor="#f8f9fa" />
                </div>
                <div class="col-md-5 text-right align-self-end">
                    <asp:Button ID="btnVerFicha" runat="server" 
                        Text="Ver Ficha" 
                        CssClass="btn btn-warning mr-2" 
                        OnClick="btnVerFicha_Click" />
                    <asp:Button ID="btnEnviarSolicitudes" runat="server" 
                        Text="Enviar Solicitudes" 
                        CssClass="btn btn-primary" 
                        OnClick="btnEnviarSolicitudes_Click" />
                </div>
            </div>

            <!-- Tabla principal -->
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <asp:GridView ID="gvReprogramacion" runat="server" 
                                    CssClass="table table-bordered mb-0"
                                    AutoGenerateColumns="False"
                                    GridLines="Horizontal"
                                    ShowHeaderWhenEmpty="true"
                                    OnRowDataBound="gvReprogramacion_RowDataBound">
                                    <HeaderStyle CssClass="bg-primary text-white" />
                                    <Columns>
                                        <asp:BoundField HeaderText="Objetivo de gestión" DataField="ObjetivoGestion" ItemStyle-Width="20%" />
                                        <asp:BoundField HeaderText="Indicador de gestión" DataField="IndicadorGestion" ItemStyle-Width="20%" />
                                        <asp:BoundField HeaderText="Resultados esperados" DataField="ResultadosEsperados" ItemStyle-Width="20%" />
                                        <asp:BoundField HeaderText="Acciones de gestión" DataField="AccionesGestion" ItemStyle-Width="20%" />
                                        <asp:BoundField HeaderText="Responsable POA" DataField="ResponsablePOA" ItemStyle-Width="10%" />
                                        
                                        <asp:TemplateField HeaderText="Estado" ItemStyle-Width="10%">
                                            <ItemTemplate>
                                                <%# Eval("Estado") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Opciones" ItemStyle-Width="10%" ItemStyle-CssClass="text-center">
                                            <ItemTemplate>
                                                <div class="d-flex flex-column">
                                                    <button type="button" class="btn btn-primary btn-sm mb-1" onclick="$('#modalRevisar').modal('show');">
                                                        Revisar
                                                    </button>
                                                    <asp:Button ID="btnDetalle" runat="server"
                                                        Text="Detalle"
                                                        CssClass="btn btn-primary btn-sm"
                                                        OnClick="btnDetalle_Click"
                                                        CommandArgument='<%# Eval("Id") %>' />
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

    <!-- Modal para Revisar -->
    <div class="modal fade" id="modalRevisar" tabindex="-1" role="dialog" aria-labelledby="modalRevisarLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 1540px;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalRevisarLabel">Revisar Reprogramación POA</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- Botones superiores -->
                    <div class="row mb-4">
                        <div class="col-12 text-center">
                            <button type="button" class="btn btn-success btn-lg px-5 mr-3" onclick="aprobarRegistro()">Aprobar</button>
                            <button type="button" class="btn btn-danger btn-lg px-5" onclick="devolverRegistro()">Devolver</button>
                        </div>
                    </div>

                    <!-- Campo Motivo (Editable) -->
                    <div class="row mb-4">
                        <div class="col-12">
                            <label class="font-weight-bold">Motivo (En caso de devolución)</label>
                            <textarea id="txtMotivo" class="form-control" rows="3" placeholder="Ingrese motivo..."></textarea>
                        </div>
                    </div>

                    <!-- Campo Motivo de la solicitud (Solo lectura) -->
                    <div class="row mb-4">
                        <div class="col-12">
                            <label class="font-weight-bold">Motivo de la solicitud</label>
                            <textarea class="form-control" rows="3" readonly style="background-color: #f8f9fa;">Por causas de fuerza mayor</textarea>
                        </div>
                    </div>

                    <!-- Campos de contenido -->
                    <div class="row mb-4">
                        <div class="col-md-6">
                            <label class="font-weight-bold">Acciones de gestión</label>
                            <textarea id="txtAccionesGestion" class="form-control" rows="4" readonly style="background-color: #f8f9fa;">Implementación al 100% de una plataforma de seguimiento de Siniestros SOAT en UNIVidaApp</textarea>
                        </div>
                        <div class="col-md-6">
                            <label class="font-weight-bold">Indicador Producto</label>
                            <textarea id="txtIndicadorProducto" class="form-control" rows="4" readonly style="background-color: #f8f9fa;">Se ha implementado el sistema de gestión de Seguros de Salud en el Sistema CORE de UNIVIDA, como parte del mejoramiento continuo de las operaciones de La Empresa.</textarea>
                        </div>
                    </div>

                    <!-- Tabla de meses -->
                    <div class="table-responsive">
                        <table class="table table-bordered" style="min-width: 100%;">
                            <thead style="background-color: #e8f4f8;">
                                <tr>
                                    <th class="text-center" style="width: 110px;">Ene</th>
                                    <th class="text-center" style="width: 110px;">Feb</th>
                                    <th class="text-center" style="width: 110px;">Mar</th>
                                    <th class="text-center" style="width: 110px;">Abr</th>
                                    <th class="text-center" style="width: 110px;">May</th>
                                    <th class="text-center" style="width: 110px;">Jun</th>
                                    <th class="text-center" style="width: 110px;">Jul</th>
                                    <th class="text-center" style="width: 110px;">Ago</th>
                                    <th class="text-center" style="width: 110px;">Sep</th>
                                    <th class="text-center" style="width: 110px;">Oct</th>
                                    <th class="text-center" style="width: 110px;">Nov</th>
                                    <th class="text-center" style="width: 110px;">Dic</th>
                                    <th class="text-center" style="width: 130px;">TIPO</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center font-weight-bold" style="background-color: #f8f9fa;">88000</td>
                                    <td class="align-middle text-center font-weight-bold" style="background-color: #f8f9fa;">Física</td>
                                </tr>
                                <tr>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center font-weight-bold" style="background-color: #f8f9fa;">100%</td>
                                    <td class="align-middle text-center font-weight-bold" style="background-color: #f8f9fa;">Financiera</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function aprobarRegistro() {
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
                    $('#modalRevisar').modal('hide');
                    Swal.fire({
                        title: '¡Aprobado!',
                        text: 'El registro ha sido aprobado correctamente.',
                        icon: 'success',
                        confirmButtonText: 'Entendido'
                    });
                }
            });
        }

        function devolverRegistro() {
            // Obtener el motivo de devolución
            var motivo = document.getElementById('txtMotivo').value.trim();
            
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
                text: '¿Está seguro de que desea devolver este registro?',
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
                        text: 'El registro ha sido devuelto correctamente.',
                        icon: 'success',
                        confirmButtonText: 'Entendido'
                    });
                    // Limpiar el campo motivo
                    document.getElementById('txtMotivo').value = '';
                }
            });
        }
    </script>
</asp:Content>
