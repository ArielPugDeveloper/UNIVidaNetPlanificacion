<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucOpcionesRegistrosPEE.ascx.cs" Inherits="UNIVidaNetPlanificacion.Modulos.ProgramacionPEE.ucOpcionesRegistrosPEE" %>

<!-- Opciones para Planificador -->
<asp:PlaceHolder ID="phOpcionesCompletas" runat="server" Visible="false">
    <div class="d-flex flex-column">
        <asp:LinkButton ID="lnkModificarPEE" runat="server" 
            Text="Modificar/Guardar PEE" 
            CssClass="btn btn-sm btn-secondary mb-1"
            OnClientClick="Swal.fire({title: 'En desarrollo', text: 'Esta funcionalidad estará disponible próximamente', icon: 'info'}); return false;" />
    
        <asp:LinkButton ID="lnkRegistrosPOA" runat="server" 
            Text="Registros POA" 
            CssClass="btn btn-sm btn-primary"
            OnClick="lnkRegistrosPOA_Click" 
            CommandArgument='<%# Eval("TRegistroPEEFk") %>' />
    </div>
</asp:PlaceHolder>

<!-- Opciones para Encargado/Dependiente -->
<asp:PlaceHolder ID="phOpcionesLimitadas" runat="server" Visible="false">
    <div class="d-flex flex-column">
        <asp:LinkButton ID="lnkRegistrosPOALimitado" runat="server" 
            Text="Registros POA" 
            CssClass="btn btn-sm btn-primary mb-1"
            OnClick="lnkRegistrosPOA_Click" 
            CommandArgument='<%# Eval("TRegistroPEEFk") %>' />
    
        <asp:LinkButton ID="lnkSeguimientoPEELimitado" runat="server" 
            Text="Seguimiento PEE" 
            CssClass="btn btn-sm btn-secondary"
            OnClick="lnkSeguimientoPEE_Click" 
            CommandArgument='<%# Eval("TRegistroPEEFk") %>' />
    </div>
</asp:PlaceHolder>