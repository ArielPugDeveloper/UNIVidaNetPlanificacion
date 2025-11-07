<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UNIVidaNetPlanificacion.Default" %>

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
                <div class="col-md-8">
                    <div class="card card-outline card-uvrojo">
                        <div class="card-header">
                            <h3 class="card-title"><i class="far fa-book mr-3"></i>Descripción</h3>
                        </div>
                        <div class="card-body">
                            <asp:Label ID="lblDescripcion" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card card-outline card-uvrojo">
                        <div class="card-header">
                            <h3 class="card-title"><i class="far fa-download mr-3"></i>Descargas</h3>
                        </div>
                        <div class="card-body p-0">
                            <ul class="products-list product-list-in-card pl-2 pr-2">
                                <li class="item">
                                    <div class="product-img" style="padding-left: 10px;">
                                        <i class="far fa-file-pdf" style="font-size: 40px;"></i>
                                    </div>
                                    <div class="product-info">
                                        <a href="javascript:void(0)" class="product-title">Manual de usuario
                        <span class="badge badge-info float-right">Descargar</span></a>
                                        <span class="product-description">Manual.pdf
                                        </span>
                                    </div>
                                </li>

                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="card card-outline card-uvazul">
                        <div class="card-header">
                            <h3 class="card-title"><i class="far fa-newspaper mr-3"></i>Noticias</h3>
                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                    <i class="fas fa-minus"></i>
                                </button>
                            </div>
                        </div>
                        <div class="card-body">
                            <asp:GridView ID="gvNoticias" runat="server"
                                DataKeyNames=""
                                AutoGenerateColumns="false"
                                class="table table-striped table-responsive">
                                <Columns>
                                    <asp:BoundField HeaderText="Publicación" DataField="FechaPublicacion" ItemStyle-Width="100" />
                                    <asp:BoundField HeaderText="Título" DataField="Titulo" ItemStyle-Width="300" />
                                    <asp:BoundField HeaderText="Detalle" DataField="Detalle" />
                                </Columns>
                            </asp:GridView>
                            <div runat="server" id="divMensajeNoticias" visible="false" class="alert alert-info text-center">
                                <asp:Label ID="lblMensajeNoticias" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <style>
        .imagenBorde {
            background-image: url("<%= RutaDominio %>/Plugins/img/borde.jpg");
            background-repeat: no-repeat, repeat;
            width: 100%;
            height: 10px;
            background-size: cover;
            margin-left: 68px;
            bottom: 47px;
            position: fixed;
            right: 0;
            z-index: 1033;
        }
    </style>
    <div class="imagenBorde"></div>
</asp:Content>
