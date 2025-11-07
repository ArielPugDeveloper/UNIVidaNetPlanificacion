<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="wfPractica.aspx.cs" Inherits="UNIVidaNetSISTEMA_PEE_POA.Modulos.Prueba.wfPractica" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h2>Práctica</h2>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item active"><a href="#">Práctica</a></li>
                    </ol>
                </div>
            </div>
        </div>
    </section>
    <section class="content mb-5">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card card-outline card-uvrojo">
                        <div class="card-header">
                            <h3 class="card-title"><i class="far fa-flask mr-3"></i>Práctica con DescripcionSistemaO</h3>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <label>Código del Sistema:</label>
                                <asp:TextBox ID="txtCodigoSistema" runat="server" CssClass="form-control" Text="001" placeholder="Ingrese código del sistema"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Button ID="btnConsultar" runat="server" Text="Consultar Descripción" CssClass="btn btn-primary" OnClick="btnConsultar_Click" />
                            </div>
                            <div class="form-group">
                                <label>Descripción del Sistema:</label>
                                <asp:Label ID="lblDescripcion" runat="server" CssClass="form-control" style="min-height: 100px; background-color: #f8f9fa; padding: 10px; border: 1px solid #dee2e6;"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
