<%@ Page Title="UNIVidaNetPlanificacion - Captura de Errores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CapturaErrores.aspx.cs" Inherits="UNIVidaNetPlanificacion.CapturaErrores" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h2>UNIVidaNetPlanificacion</h2>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item active"><a href="#">Inicio</a></li>
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
                            <h3 class="card-title"><i class="far fa-book mr-3"></i>Descripción</h3>
                        </div>
                        <div class="card-body" id="divCapturaErrores" runat="server" visible="false">
                            <div class="row justify-content-md-center">
                                <div class="col-md-8 form-horizontal">
                                    <div class="form-group row">
                                        <asp:Label ID="lblRuta" runat="server" Text="Validación del Directorio de Errores:" class="col-form-label col-md-4"></asp:Label>
                                        <div class="col-md-8">
                                            <div id="divRuta" runat="server" class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span id="spnRuta" runat="server">
                                                        <em id="emRuta" runat="server"></em>
                                                    </span>
                                                </div>
                                                <asp:TextBox runat="server" ID="txtRuta" ReadOnly="true" Style="text-transform: unset!important; background: #fff !important" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-8 form-horizontal">
                                    <div class="form-group row">
                                        <asp:Label ID="lblCarpeta" runat="server" Text="Existencia del Directorio de Errores:" class="col-form-label col-md-4"></asp:Label>
                                        <div class="col-md-8">
                                            <div id="divCarpeta" runat="server" class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span id="spnCarpeta" runat="server">
                                                        <em id="emCarpeta" runat="server"></em>
                                                    </span>
                                                </div>
                                                <asp:TextBox runat="server" ID="txtCarpeta" ReadOnly="true" Style="text-transform: unset!important; background: #fff !important" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-8 form-horizontal">
                                    <div class="form-group row">
                                        <asp:Label ID="lblEscritura" runat="server" Text="Permisos de escritura en el Directorio:" class="col-form-label col-md-4"></asp:Label>
                                        <div class="col-md-8">
                                            <div id="divEscritura" runat="server" class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span id="spnEscritura" runat="server">
                                                        <em id="emEscritura" runat="server"></em>
                                                    </span>
                                                </div>
                                                <asp:TextBox runat="server" ID="txtEscritura" ReadOnly="true" Style="text-transform: unset!important; background: #fff !important" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-8 form-horizontal">
                                    <div class="form-group row">
                                        <asp:Label ID="lblCapturaHabilitada" runat="server" Text="Estado de captura de errores:" class="col-form-label col-md-4"></asp:Label>
                                        <div class="col-md-8">
                                            <div id="divCapturaHabilitada" runat="server" class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span id="spnCapturaHabilitada" runat="server">
                                                        <em id="emCapturaHabilitada" runat="server"></em>
                                                    </span>
                                                </div>
                                                <asp:TextBox runat="server" ID="txtCapturaHabilitada" ReadOnly="true" Style="text-transform: unset!important; background: #fff !important" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-8 form-horizontal">
                                    <div class="form-group row">
                                        <asp:Label ID="lblError404WC" runat="server" Text="Configuración página de error 404:" class="col-form-label col-md-4"></asp:Label>
                                        <div class="col-md-8">
                                            <div id="divError404WC" runat="server" class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span id="spnError404WC" runat="server">
                                                        <em id="emError404WC" runat="server"></em>
                                                    </span>
                                                </div>
                                                <asp:TextBox runat="server" ID="txtError404WC" ReadOnly="true" Style="text-transform: unset!important; background: #fff !important" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-8 form-horizontal">
                                    <div class="form-group row">
                                        <asp:Label ID="lblError500WC" runat="server" Text="Configuración página de error 500:" class="col-form-label col-md-4"></asp:Label>
                                        <div class="col-md-8">
                                            <div id="divError500WC" runat="server" class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span id="spnError500WC" runat="server">
                                                        <em id="emError500WC" runat="server"></em>
                                                    </span>
                                                </div>
                                                <asp:TextBox runat="server" ID="txtError500WC" ReadOnly="true" Style="text-transform: unset!important; background: #fff !important" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-8 form-horizontal">
                                    <div class="form-group row">
                                        <asp:Label ID="lblError404" runat="server" Text="Existencia de la página Error404:" class="col-form-label col-md-4"></asp:Label>
                                        <div class="col-md-8">
                                            <div id="divError404" runat="server" class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span id="spnError404" runat="server">
                                                        <em id="emError404" runat="server"></em>
                                                    </span>
                                                </div>
                                                <asp:TextBox runat="server" ID="txtError404" ReadOnly="true" Style="text-transform: unset!important; background: #fff !important" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-8 form-horizontal">
                                    <div class="form-group row">
                                        <asp:Label ID="lblError500" runat="server" Text="Existencia de la página Error500:" class="col-form-label col-md-4"></asp:Label>
                                        <div class="col-md-8">
                                            <div id="divError500" runat="server" class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span id="spnError500" runat="server">
                                                        <em id="emError500" runat="server"></em>
                                                    </span>
                                                </div>
                                                <asp:TextBox runat="server" ID="txtError500" ReadOnly="true" Style="text-transform: unset!important; background: #fff !important" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" id="divSinAcceso" runat="server" visible="false">
                            <div class="col-md-12">
                                <div class="alert alert-danger">
                                    <h3>
                                        <asp:Label ID="lblMensaje" runat="server" Text="No tiene los permisos válidos para visualizar esta página" class="col-form-label"></asp:Label>
                                    </h3>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer" id="divCapturaBotones" runat="server" visible="false">
                            <div class="col-md-12 text-center">
                                <asp:LinkButton ID="lnkError404" runat="server" class="btn btn-large btn-primary" CausesValidation="False" OnClick="lnkError404_Click">
                                    <em class="fa fa-cogs"></em>
                                    Probar captura de errores 404
                                </asp:LinkButton>
                                &nbsp;&nbsp;
                                <asp:LinkButton ID="lnkError500" runat="server" class="btn btn-large btn-primary" CausesValidation="False" OnClick="lnkError500_Click">
                                    <em class="fa fa-cogs"></em>
                                    Probar captura de errores 500
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
