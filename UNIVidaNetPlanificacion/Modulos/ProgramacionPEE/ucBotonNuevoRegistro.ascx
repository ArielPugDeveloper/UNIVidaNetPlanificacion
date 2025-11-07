<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucBotonNuevoRegistro.ascx.cs" Inherits="UNIVidaNetPlanificacion.Modulos.ProgramacionPEE.ucBotonNuevoRegistro" %>

<asp:PlaceHolder ID="phNuevoRegistro" runat="server" Visible="false">
    <div class="col-md-3">
        <label>&nbsp;</label>
        <asp:LinkButton ID="lnkNuevoRegistro" runat="server" 
            Text="Nuevo registro" 
            CssClass="btn btn-success btn-block"
            OnClick="lnkNuevoRegistro_Click" />
    </div>
</asp:PlaceHolder>