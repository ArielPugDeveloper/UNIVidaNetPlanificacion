<%@ Page Title="Registros POA" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="wfRegistrosPOA.aspx.cs" Inherits="UNIVidaNetPlanificacion.Modulos.ProgramacionPOA.wfRegistrosPOA" %>

<%@ Register Src="~/Modulos/ProgramacionPOA/ucOpcionesRegistrosPOA.ascx" TagPrefix="uc1" TagName="ucOpcionesRegistrosPOA" %>
<%@ Register Src="ucBotonGenerarPOA.ascx" TagName="ucBotonGenerarPOA" TagPrefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h2>Plan Operativo Anual</h2>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item active"><a href="#">Inicio</a></li>
                        <li class="breadcrumb-item active">Programacion POA</li>
                        <li class="breadcrumb-item active">Registros POA</li>
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
                <div class="col-md-6">
                    <uc2:ucBotonGenerarPOA ID="ucBotonGenerarPOA1" runat="server" />
                </div>
                <div class="col-md-6 text-right">
                    <asp:Button ID="btnGenerarPEEExcel" runat="server" 
                        Text="Generar PEE (Excel)" 
                        CssClass="btn btn-success" 
                        OnClick="btnGenerarPEEExcel_Click" />
                </div>
            </div>

            <!-- Tabla -->
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <asp:GridView ID="gvRegistrosPOA" runat="server" 
                                    CssClass="table table-bordered mb-0"
                                    AutoGenerateColumns="False"
                                    GridLines="Horizontal"
                                    OnRowDataBound="gvRegistrosPOA_RowDataBound">
                                    <HeaderStyle CssClass="bg-primary text-white" />
                                    <Columns>
                                        <asp:BoundField HeaderText="Numero de registro" DataField="TRegistroPOAFk" />
                                        <asp:BoundField HeaderText="Fecha de Registro" DataField="TRegistroPOAFechaAdicion" />
                                        <asp:BoundField HeaderText="Gestión" DataField="TRegistroPOAGestion" />
                                        <asp:BoundField HeaderText="Estado" DataField="EstadoDescripcion" />
                                       <asp:TemplateField HeaderText="Opciones" ItemStyle-CssClass="text-center">
                                            <ItemTemplate>
                                                <uc1:ucOpcionesRegistrosPOA runat="server" ID="ucOpcionesRegistrosPOA" />
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

</asp:Content>