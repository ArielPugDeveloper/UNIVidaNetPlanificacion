<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucParteSuperiorReprogramacionPOA.ascx.cs" Inherits="UNIVidaNetPlanificacion.Modulos.ProgramacionPOA.ucParteSuperiorReprogramacionPOA" %>

<!-- Filtros completos para Planificador -->
<asp:PlaceHolder ID="phFiltrosCompletos" runat="server" Visible="false">
    <div class="card card-info card-outline">
        <div class="card-header">
            <h3 class="card-title">Filtros de Búsqueda</h3>
            <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i></button>
            </div>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Objetivo Estrategico:</label>
                        <asp:DropDownList ID="ddlObjetivoEstrategico" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Todos" Value="Todos" Selected="True" />
                            <asp:ListItem Text="OE.1" Value="OE.1" />
                            <asp:ListItem Text="OE.2" Value="OE.2" />
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Responsable POA:</label>
                        <asp:DropDownList ID="ddlResponsablePOA" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Todos" Value="Todos" Selected="True" />
                            <asp:ListItem Text="GNTI" Value="GNTI" />
                            <asp:ListItem Text="GNC" Value="GNC" />
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>INDICADOR:</label>
                        <asp:DropDownList ID="ddlIndicador" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Todos" Value="Todos" Selected="True" />
                            <asp:ListItem Text="Indicador 1" Value="Indicador 1" />
                            <asp:ListItem Text="Indicador 2" Value="Indicador 2" />
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Objetivo de Gestion:</label>
                        <asp:DropDownList ID="ddlObjetivoGestion" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Todos" Value="Todos" Selected="True" />
                            <asp:ListItem Text="OG.1" Value="OG.1" />
                            <asp:ListItem Text="OG.2" Value="OG.2" />
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Gestión:</label>
                        <asp:TextBox ID="txtGestion" runat="server" CssClass="form-control" Text="2020" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 text-right">
                    <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn btn-secondary" OnClick="btnBuscar_Click" />
                </div>
            </div>
        </div>
    </div>

    <!-- Acciones y Fechas -->
    <div class="row mb-3">
        <div class="col-md-2">
            <asp:Button ID="btnHabilitar" runat="server" Text="HABILITAR" CssClass="btn btn-success btn-block" OnClick="btnHabilitar_Click" />
        </div>
        <div class="col-md-3">
            <label>Fecha limite:</label>
            <asp:TextBox ID="txtFechaLimite" runat="server" CssClass="form-control" Text="15/06/25" />
        </div>
        <div class="col-md-2">
            <label>Hora limite:</label>
            <asp:TextBox ID="txtHoraLimite" runat="server" CssClass="form-control" Text="15:00" />
        </div>
        <div class="col-md-5 text-right">
            <asp:Button ID="btnGenerarPOAExcel" runat="server" Text="Generar POA (Excel)" CssClass="btn btn-success" OnClick="btnGenerarPOAExcel_Click" />
        </div>
    </div>
</asp:PlaceHolder>

<!-- Filtros simplificados para Encargado Responsable y Dependiente -->
<asp:PlaceHolder ID="phFiltrosSimplificados" runat="server" Visible="false">
    <div class="row mb-3">
        <div class="col-md-2">
            <label>Gestión:</label>
            <asp:TextBox ID="txtGestionSimplificado" runat="server" CssClass="form-control" Text="2026" />
        </div>
        <div class="col-md-2">
            <label>Fecha de inicio:</label>
            <asp:TextBox ID="txtFechaInicio" runat="server" CssClass="form-control" Text="15/01/2025" />
        </div>
        <div class="col-md-2">
            <label>INDICADOR:</label>
            <asp:DropDownList ID="ddlIndicadorSimplificado" runat="server" CssClass="form-control">
                <asp:ListItem Text="Todos" Value="Todos" Selected="True" />
                <asp:ListItem Text="Indicador 1" Value="1" />
                <asp:ListItem Text="Indicador 2" Value="2" />
            </asp:DropDownList>
        </div>
        <div class="col-md-2">
            <label>&nbsp;</label>
            <asp:Button ID="btnVerFicha" runat="server" Text="Ver Ficha" CssClass="btn btn-warning btn-block" OnClick="btnVerFicha_Click" />
        </div>
    </div>

    <div class="row mb-3">
        <div class="col-md-2">
            <label>Responsable PEE:</label>
            <asp:TextBox ID="txtResponsablePEE" runat="server" CssClass="form-control" Text="Gerencia Nacional de TI" />
        </div>
        <div class="col-md-2">
            <label>Fecha limite:</label>
            <asp:TextBox ID="txtFechaLimiteSimplificado" runat="server" CssClass="form-control" Text="30/01/2025" />
        </div>
        <div class="col-md-2">
            <label>Estado:</label>
            <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control">
                <asp:ListItem Text="Todos" Value="Todos" Selected="True" />
                <asp:ListItem Text="APROBADO" Value="APROBADO" />
                <asp:ListItem Text="VACIO" Value="VACIO" />
                <asp:ListItem Text="PENDIENTE" Value="PENDIENTE" />
            </asp:DropDownList>
        </div>
        <div class="col-md-2">
            <label>&nbsp;</label>
            <asp:Button ID="btnGenerarPOAExcelSimplificado" runat="server" Text="Generar POA (Excel)" CssClass="btn btn-primary btn-block" OnClick="btnGenerarPOAExcel_Click" />
        </div>
        <div class="col-md-2">
            <label>&nbsp;</label>
            <asp:Button ID="btnEnviarSolicitudes" runat="server" Text="Enviar Solicitudes" CssClass="btn btn-primary btn-block" OnClick="btnEnviarSolicitudes_Click" />
        </div>
    </div>
</asp:PlaceHolder>