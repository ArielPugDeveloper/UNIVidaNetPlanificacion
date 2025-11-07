<%@ Page Title="Seguimiento PEE" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="wfSeguimientoPEE.aspx.cs" Inherits="UNIVidaNetPlanificacion.Modulos.ProgramacionPEE.wfSeguimientoPEE" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h2>Plan Estratégico Empresarial - Seguimiento</h2>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item active"><a href="#">Inicio</a></li>
                        <li class="breadcrumb-item active">Programacion PEE</li>
                        <li class="breadcrumb-item active">Seguimiento PEE</li>
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
            <!-- Tabla sin contenedor -->
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <asp:GridView ID="gvSeguimientoIndicadores" runat="server" 
                                    CssClass="table table-bordered mb-0"
                                    AutoGenerateColumns="False"
                                    GridLines="Horizontal"
                                    OnRowCommand="gvSeguimientoIndicadores_RowCommand"
                                    DataKeyNames="Perspectiva,ObjetivoEstrategico,AccionEstrategica,Resultado,LineaBase,Indicador,TipoEjecucion,Meta2026,Meta2027,Meta2028,Meta2029,Meta2030,MetaFinal">
                                    <HeaderStyle CssClass="bg-primary text-white" />
                                    <Columns>
                                        <asp:BoundField HeaderText="INDICADOR" DataField="Indicador" ItemStyle-Width="85%" HeaderStyle-Width="85%" />
                                        <asp:TemplateField HeaderText="OPCIONES" ItemStyle-CssClass="text-center" ItemStyle-Width="15%" HeaderStyle-Width="15%">
                                            <ItemTemplate>
                                                <div class="d-flex flex-column">
                                                    <asp:Button ID="btnVerMetas" runat="server" Text="Metas" CssClass="btn btn-info btn-sm mb-1"
                                                        CommandName="VerMetas" CommandArgument='<%# Container.DataItemIndex %>' />
                                                    <asp:Button ID="btnVerMasInfo" runat="server" Text="Más info" CssClass="btn btn-secondary btn-sm"
                                                        CommandName="VerMasInfo" CommandArgument='<%# Container.DataItemIndex %>' />
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
        <!-- /.container-fluid -->
    </section>

    <!-- Modal Metas -->
    <div class="modal fade" id="modalMetas" tabindex="-1" role="dialog" aria-labelledby="modalMetasLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title" id="modalMetasLabel">Detalle de Metas</h5>
                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead class="bg-light">
                                <tr>
                                    <th>Tipo de ejecución</th>
                                    <th>Meta 2026</th>
                                    <th>Meta 2027</th>
                                    <th>Meta 2028</th>
                                    <th>Meta 2029</th>
                                    <th>Meta 2030</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><asp:Label ID="lblProgramadoTitulo" runat="server" Text="Programado"></asp:Label></td>
                                    <td><asp:Label ID="lblProgramadoMeta2026" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="lblProgramadoMeta2027" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="lblProgramadoMeta2028" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="lblProgramadoMeta2029" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="lblProgramadoMeta2030" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td><asp:Label ID="lblEjecutadoTitulo" runat="server" Text="Ejecutado"></asp:Label></td>
                                    <td><asp:TextBox ID="txtEjecutadoMeta2026" runat="server" CssClass="form-control form-control-sm"></asp:TextBox></td>
                                    <td><asp:TextBox ID="txtEjecutadoMeta2027" runat="server" CssClass="form-control form-control-sm"></asp:TextBox></td>
                                    <td><asp:TextBox ID="txtEjecutadoMeta2028" runat="server" CssClass="form-control form-control-sm"></asp:TextBox></td>
                                    <td><asp:TextBox ID="txtEjecutadoMeta2029" runat="server" CssClass="form-control form-control-sm"></asp:TextBox></td>
                                    <td><asp:TextBox ID="txtEjecutadoMeta2030" runat="server" CssClass="form-control form-control-sm"></asp:TextBox></td>
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

    <!-- Modal Más Información -->
    <div class="modal fade" id="modalMasInfo" tabindex="-1" role="dialog" aria-labelledby="modalMasInfoLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title" id="modalMasInfoLabel">Detalle del Indicador</h5>
                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <dl class="row">
                        <dt class="col-sm-4">Perspectiva</dt>
                        <dd class="col-sm-8"><asp:Label ID="lblPerspectiva" runat="server"></asp:Label></dd>

                        <dt class="col-sm-4">Objetivo estratégico</dt>
                        <dd class="col-sm-8"><asp:Label ID="lblObjetivo" runat="server"></asp:Label></dd>

                        <dt class="col-sm-4">Acción estratégica</dt>
                        <dd class="col-sm-8"><asp:Label ID="lblAccion" runat="server"></asp:Label></dd>

                        <dt class="col-sm-4">Resultado</dt>
                        <dd class="col-sm-8"><asp:Label ID="lblResultado" runat="server"></asp:Label></dd>

                        <dt class="col-sm-4">Línea base</dt>
                        <dd class="col-sm-8"><asp:Label ID="lblLineaBase" runat="server"></asp:Label></dd>

                        <dt class="col-sm-4">Meta</dt>
                        <dd class="col-sm-8"><asp:Label ID="lblMetaGeneral" runat="server"></asp:Label></dd>
                    </dl>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>