<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="masterUsuarioMenu.ascx.cs" Inherits="UNIVidaNetPlanificacion.masterUsuarioMenu" %>
<div class="user-panel mt-3 pb-3 mb-3" style="color: white">
    <div class="d-flex">
        <div class="image">
            <asp:Image runat="server" ID="imagenUsuario" ImageUrl="Plugins/img/user2-160x160.jpg" CssClass="img-circle elevation-2" />
        </div>
        <div class="info">
            <div class="d-block">
                <asp:Label ID="empNombre" runat="server"></asp:Label>
                <br />
                <asp:Label ID="empApellido" runat="server"></asp:Label>
            </div>
        </div>
    </div>
    <div class="text-center">
        <div class="cargo ">
            <small>
                <asp:Label ID="empCargo" runat="server"></asp:Label></small>
        </div>
        <div class="sucursal">
            <small>
                <asp:Label ID="empSucursal" runat="server"></asp:Label></small>
        </div>
    </div>
</div>
