<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucBotonGenerarPOA.ascx.cs" Inherits="UNIVidaNetPlanificacion.Modulos.ProgramacionPOA.ucBotonGenerarPOA" %>

<asp:PlaceHolder ID="phGenerarPOA" runat="server">
    <asp:LinkButton ID="lnkGenerarPOA" runat="server" 
        CssClass="btn btn-success" 
        OnClick="lnkGenerarPOA_Click">
        Generar POA
    </asp:LinkButton>
</asp:PlaceHolder>
