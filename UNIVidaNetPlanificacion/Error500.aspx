<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Error500.aspx.cs" Inherits="UNIVidaNetPlanificacion.Error500" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Error 500</h1>
                </div>
            </div>
        </div>
    </section>
    <section class="content">
        <div class="error-page col-md-8">
            <h2 class="headline text-danger">
                <i class="fas fa-bug"></i>
            </h2>
            <div class="error-content">
                <h2>
                    <strong><asp:Label ID="LblMensaje" runat="server" Text=""></asp:Label></strong>
                </h2>
                <p>
                    <a href="/UNIVidaNetPlanificacion/Default.aspx" class="btn btn-primary">
                        <em class="fa fa-arrow-left"></em>
                        Volver a la página de inicio
                    </a>
                </p>
            </div>
        </div>
    </section>
</asp:Content>
