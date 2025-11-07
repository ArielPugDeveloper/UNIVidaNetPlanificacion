<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucOpcionesRegistrosPOA.ascx.cs" Inherits="UNIVidaNetPlanificacion.Modulos.ProgramacionPOA.ucOpcionesRegistrosPOA" %>

<!-- Opciones completas para Planificador -->
<asp:PlaceHolder ID="phOpcionesCompletas" runat="server" Visible="false">
    <div class="dropdown">
        <button class="btn btn-outline-secondary btn-sm dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Opciones
        </button>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <asp:LinkButton class="dropdown-item" runat="server" ID="lnkModificarPOA" OnClick="lnkModificarPOA_Click" CommandArgument='<%# Eval("TRegistroPOAFk") %>'>
                <i class="fas fa-calendar-alt"></i> Modificar/Enviar POA
            </asp:LinkButton>
            <asp:LinkButton class="dropdown-item" runat="server" ID="lnkRevisionPOA" OnClick="lnkRevisionPOA_Click" CommandArgument='<%# Eval("TRegistroPOAFk") %>'>
                <i class="fas fa-search-plus"></i> Revisión POA
            </asp:LinkButton>
            <asp:LinkButton class="dropdown-item" runat="server" ID="lnkInstruccionesSeguimiento" OnClick="lnkInstruccionesSeguimiento_Click" CommandArgument='<%# Eval("TRegistroPOAFk") %>'>
                <i class="fas fa-book"></i> Instrucciones y Seguimiento
            </asp:LinkButton>
            <asp:LinkButton class="dropdown-item" runat="server" ID="lnkReprogramacionPOA" OnClick="lnkReprogramacionPOA_Click" CommandArgument='<%# Eval("TRegistroPOAFk") %>'>
                <i class="fas fa-edit"></i> Reprogramacion POA
            </asp:LinkButton>
        </div>
    </div>
</asp:PlaceHolder>

<!-- Opciones limitadas para Encargado Responsable y Dependiente -->
<asp:PlaceHolder ID="phOpcionesLimitadas" runat="server" Visible="false">
    <div class="d-flex flex-column">
        <asp:LinkButton ID="lnkProgramacion" runat="server" 
            Text="Programacion" 
            CssClass="btn btn-primary btn-sm mb-1" 
            OnClick="lnkProgramacion_Click"
            CommandArgument='<%# Eval("TRegistroPOAFk") %>' />
        <asp:LinkButton ID="lnkSeguimiento" runat="server" 
            Text="Seguimiento" 
            CssClass="btn btn-secondary btn-sm mb-1" 
            OnClick="lnkSeguimiento_Click"
            CommandArgument='<%# Eval("TRegistroPOAFk") %>' />
        <asp:LinkButton ID="lnkReprogramacion" runat="server" 
            Text="Reprogramacion" 
            CssClass="btn btn-secondary btn-sm" 
            OnClick="lnkReprogramacion_Click"
            CommandArgument='<%# Eval("TRegistroPOAFk") %>' />
    </div>
</asp:PlaceHolder>