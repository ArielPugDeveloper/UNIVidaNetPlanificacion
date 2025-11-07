<%@ Page Title="Reprogramacion Solicitud" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="wfReprogramacionSolicitudPOA.aspx.cs" Inherits="UNIVidaNetPlanificacion.Modulos.ProgramacionPOA.wfReprogramacionSolicitudPOA" %>

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
                                        <asp:BoundField HeaderText="Objetivo de gestión" DataField="ObjetivoGestion" ItemStyle-Width="25%" />
                                        <asp:BoundField HeaderText="Indicador de gestión" DataField="IndicadorGestion" ItemStyle-Width="25%" />
                                        <asp:BoundField HeaderText="Resultados esperados" DataField="ResultadosEsperados" ItemStyle-Width="25%" />
                                        <asp:BoundField HeaderText="Acciones de gestión" DataField="AccionesGestion" ItemStyle-Width="25%" />
                                        
                                        <asp:TemplateField HeaderText="Estado" ItemStyle-Width="10%">
                                            <ItemTemplate>
                                                <%# Eval("Estado") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Opciones" ItemStyle-Width="10%" ItemStyle-CssClass="text-center">
                                            <ItemTemplate>
                                                <div class="d-flex flex-column">
                                                    <button type="button" class="btn btn-primary btn-sm mb-1" onclick="$('#modalModificar').modal('show');">
                                                        Modificar
                                                    </button>
                                                    <asp:Button ID="btnDetalle" runat="server"
                                                        Text="Detalle"
                                                        CssClass="btn btn-primary btn-sm mb-1"
                                                        OnClick="btnDetalle_Click"
                                                        CommandArgument='<%# Eval("Id") %>' />
                                                    <button type="button" class="btn btn-warning btn-sm" onclick="$('#modalInhabilitar').modal('show');">
                                                        Inhabilitar
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

    <!-- Modal para Modificar -->
    <div class="modal fade" id="modalModificar" tabindex="-1" role="dialog" aria-labelledby="modalModificarLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 1540px;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalModificarLabel">Modificar Programación POA</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- Campo Motivo -->
                    <div class="row mb-4">
                        <div class="col-12">
                            <label class="font-weight-bold">Motivo:</label>
                            <textarea id="txtMotivoModal" class="form-control" rows="3" placeholder="Ingrese el motivo..."></textarea>
                        </div>
                    </div>

                    <!-- Campos superiores -->
                    <div class="row mb-4">
                        <div class="col-md-6">
                            <label class="font-weight-bold">Acciones de gestión</label>
                            <textarea id="txtAccionesGestionModal" class="form-control" rows="4">Implementación al 100% de una plataforma de seguimiento de Siniestros SOAT en UNIVidaApp</textarea>
                        </div>
                        <div class="col-md-6">
                            <label class="font-weight-bold">Indicador Producto</label>
                            <textarea id="txtIndicadorProductoModal" class="form-control" rows="4">Se ha implementado el sistema de gestión de Seguros de Salud en el Sistema CORE de UNIVIDA, como parte del mejoramiento continuo de las operaciones de La Empresa.</textarea>
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
                                    <td><input type="text" class="form-control form-control-sm text-center" style="border: none; background: transparent; padding: 8px;" /></td>
                                    <td><input type="text" class="form-control form-control-sm text-center" style="border: none; background: transparent; padding: 8px;" /></td>
                                    <td><input type="text" class="form-control form-control-sm text-center" style="border: none; background: transparent; padding: 8px;" /></td>
                                    <td><input type="text" class="form-control form-control-sm text-center" style="border: none; background: transparent; padding: 8px;" /></td>
                                    <td><input type="text" class="form-control form-control-sm text-center" style="border: none; background: transparent; padding: 8px;" /></td>
                                    <td><input type="text" class="form-control form-control-sm text-center" style="border: none; background: transparent; padding: 8px;" /></td>
                                    <td><input type="text" class="form-control form-control-sm text-center" style="border: none; background: transparent; padding: 8px;" /></td>
                                    <td><input type="text" class="form-control form-control-sm text-center" style="border: none; background: transparent; padding: 8px;" /></td>
                                    <td><input type="text" class="form-control form-control-sm text-center" style="border: none; background: transparent; padding: 8px;" /></td>
                                    <td><input type="text" class="form-control form-control-sm text-center" style="border: none; background: transparent; padding: 8px;" /></td>
                                    <td><input type="text" class="form-control form-control-sm text-center" style="border: none; background: transparent; padding: 8px;" /></td>
                                    <td><input type="text" class="form-control form-control-sm text-center" value="88000" style="border: none; background: transparent; padding: 8px;" /></td>
                                    <td class="align-middle text-center font-weight-bold">Física</td>
                                </tr>
                                <tr>
                                    <td><input type="text" class="form-control form-control-sm text-center" style="border: none; background: transparent; padding: 8px;" /></td>
                                    <td><input type="text" class="form-control form-control-sm text-center" style="border: none; background: transparent; padding: 8px;" /></td>
                                    <td><input type="text" class="form-control form-control-sm text-center" style="border: none; background: transparent; padding: 8px;" /></td>
                                    <td><input type="text" class="form-control form-control-sm text-center" style="border: none; background: transparent; padding: 8px;" /></td>
                                    <td><input type="text" class="form-control form-control-sm text-center" style="border: none; background: transparent; padding: 8px;" /></td>
                                    <td><input type="text" class="form-control form-control-sm text-center" style="border: none; background: transparent; padding: 8px;" /></td>
                                    <td><input type="text" class="form-control form-control-sm text-center" style="border: none; background: transparent; padding: 8px;" /></td>
                                    <td><input type="text" class="form-control form-control-sm text-center" style="border: none; background: transparent; padding: 8px;" /></td>
                                    <td><input type="text" class="form-control form-control-sm text-center" style="border: none; background: transparent; padding: 8px;" /></td>
                                    <td><input type="text" class="form-control form-control-sm text-center" style="border: none; background: transparent; padding: 8px;" /></td>
                                    <td><input type="text" class="form-control form-control-sm text-center" style="border: none; background: transparent; padding: 8px;" /></td>
                                    <td><input type="text" class="form-control form-control-sm text-center" value="100%" style="border: none; background: transparent; padding: 8px;" /></td>
                                    <td class="align-middle text-center font-weight-bold">Financiera</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-success btn-lg px-5" onclick="guardarModificacion()">Guardar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal para Inhabilitar -->
    <div class="modal fade" id="modalInhabilitar" tabindex="-1" role="dialog" aria-labelledby="modalInhabilitarLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalInhabilitarLabel">Solicitar inhabilitación</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p class="mb-3">¿Seguro que desea solicitar la inhabilitación de esta acción de gestión?</p>
                    
                    <div class="form-group">
                        <label class="font-weight-bold">Motivo:</label>
                        <textarea id="txtMotivoInhabilitar" class="form-control" rows="6" placeholder="Ingrese el motivo..."></textarea>
                    </div>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-success btn-lg px-5" onclick="confirmarInhabilitacion()">Si, solicitar</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function guardarModificacion() {
            var motivo = document.getElementById('txtMotivoModal').value;
            var accionesGestion = document.getElementById('txtAccionesGestionModal').value;
            var indicadorProducto = document.getElementById('txtIndicadorProductoModal').value;

            if (!motivo || motivo.trim() === '') {
                Swal.fire({
                    title: 'Atención',
                    text: 'Por favor ingrese el motivo de la modificación.',
                    icon: 'warning',
                    confirmButtonText: 'Entendido'
                });
                return;
            }

            $('#modalModificar').modal('hide');
            
            Swal.fire({
                title: '¡Guardado!',
                text: 'La modificación ha sido guardada correctamente.',
                icon: 'success',
                confirmButtonText: 'Entendido'
            }).then(() => {
                // Limpiar campos
                document.getElementById('txtMotivoModal').value = '';
            });
        }

        function confirmarInhabilitacion() {
            var motivo = document.getElementById('txtMotivoInhabilitar').value.trim();

            if (motivo === '') {
                Swal.fire({
                    title: 'Atención',
                    text: 'Por favor ingrese el motivo de la inhabilitación.',
                    icon: 'warning',
                    confirmButtonText: 'Entendido'
                });
                return;
            }

            $('#modalInhabilitar').modal('hide');

            Swal.fire({
                title: '¡Solicitud enviada!',
                text: 'La solicitud de inhabilitación ha sido enviada correctamente.',
                icon: 'success',
                confirmButtonText: 'Entendido'
            }).then(() => {
                // Limpiar campo
                document.getElementById('txtMotivoInhabilitar').value = '';
            });
        }
    </script>
</asp:Content>
