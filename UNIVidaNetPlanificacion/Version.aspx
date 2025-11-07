<%@ Page Title="Versiones" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Version.aspx.cs" Inherits="UNIVidaNetPlanificacion.Version" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h2>Versiones</h2>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="/UNIVidaNetPlanificacion/Default"><em class="fa fa-home"></em>Inicio</a></li>
                    </ol>
                </div>
            </div>
        </div>
    </section>

    <section class="content mb-5">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">&nbsp;</h3>
                        </div>
                        <div class="card-body" id="divSinAcceso" runat="server" visible="false">
                            <h3>
                                <asp:Label ID="Label1" runat="server" Text="No tiene los permisos válidos para visualizar esta página" class="control-label"></asp:Label>
                            </h3>
                        </div>
                        <div class="card-body" id="divVersiones" runat="server" visible="false">
                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-8">
                                    <asp:GridView
                                        ID="gvVersiones"
                                        AutoGenerateColumns="false"
                                        DataKeyNames="Orden"
                                        runat="server"
                                        CssClass="table gridViewSimple table-borderless table-striped table-sm table-hover"
                                        OnRowDataBound="gvVersiones_RowDataBound">
                                        <Columns>
                                            <asp:BoundField HeaderText="Versión" DataField="Version" HeaderStyle-Width="150" />
                                            <asp:BoundField HeaderText="Nombre DLL" DataField="Nombre" />
                                            <asp:BoundField HeaderText="Autor" DataField="Autor" />
                                            <asp:BoundField HeaderText="Fecha de Actualización" DataField="Fecha" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                            &nbsp;
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
