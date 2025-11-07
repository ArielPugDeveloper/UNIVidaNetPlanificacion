<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wfSeleccionarUsuario.aspx.cs" Inherits="UNIVidaNetPlanificacion.Modulos.SimulacionUsuarios.wfSeleccionarUsuario" MasterPageFile="~/Site.Master" ResponseEncoding="utf-8" %>
<%@ Register Src="ucSeleccionarUsuario.ascx" TagName="ucSeleccionarUsuario" TagPrefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Simulaci&#243;n de Usuarios</h1>
                </div>
            </div>
        </div>
    </div>
    
    <section class="content">
        <div class="container-fluid">
            <uc:ucSeleccionarUsuario ID="ucSeleccionarUsuario1" runat="server" />
        </div>
    </section>
</asp:Content>
