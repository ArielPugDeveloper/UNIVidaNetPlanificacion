<%@ Page Title="" Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" CodeBehind="CambiarContrasena.aspx.cs" Inherits="UNIVidaNetPlanificacion.CambiarContrasena" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .contenido-login {
            max-width: 500px;
        }
    </style>
    <div class="contenido-login mx-auto">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header text-center">
                        <img src="<%= RutaDominio %>/Plugins/img/univida.png" style="max-width: 40%; margin: 10px">
                    </div>
                    <div class="card-body m-3">
                        <div class="form-group login">
                            <label class="otros" for="txtUsuario">Usuario</label>
                            <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" placeholder="Ingrese su nombre de usuario"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvtxtUsuario" runat="server" ErrorMessage="El campo usuario es requerido" ControlToValidate="txtUsuario" ForeColor="Red" class="control-label" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group login">
                            <label class="otros" for="txtContraseña">Contraseña</label>
                            <asp:TextBox TextMode="Password" ID="txtContraseña" runat="server" CssClass="form-control" placeholder="Ingrese su contraseña"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvtxtcontrasena" runat="server" ErrorMessage="El campo Contraseña es requerido" ControlToValidate="txtContraseña" ForeColor="Red" class="control-label" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group login">
                            <label class="otros" for="txtContraseñaNuevaA">Contraseña nueva</label>
                            <asp:TextBox TextMode="Password" ID="txtContraseñaNuevaA" runat="server" CssClass="form-control" placeholder="Contraseña nueva"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="El campo Contraseña nueva es requerido" ControlToValidate="txtContraseñaNuevaA" ForeColor="Red" class="control-label" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group login">
                            <label class="otros" for="txtContraseñaNuevaB">Confirmar Contraseña</label>
                            <asp:TextBox TextMode="Password" ID="txtContraseñaNuevaB" runat="server" CssClass="form-control" placeholder="Confirmar Contraseña"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="El campo confirmar Contraseña es requerido" ControlToValidate="txtContraseñaNuevaB" ForeColor="Red" class="control-label" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="alert alert-danger animated bounce" role="alert" id="divAlerta" runat="server" visible="false">
                            <asp:Label ID="lblMensaje" runat="server" Display="Dynamic"></asp:Label>
                        </div>
                        <div class="row mt-4 mb-2">
                            <div class="col-md-6">
                                <a href='javascript:history.go(-1)' class="btn btn-outline-secondary btn-block ">Cancelar</a>
                            </div>
                            <div class="col-md-6">
                                <asp:Button ID="btnCambiarContrasena" runat="server" Text="Cambiar contraseña" class="btn btn-primary btn-block" OnClick="btnCambiarContrasena_Click" />
                            </div>
                        </div>
                    </div>
                    <div>
                        <img src="<%= RutaDominio %>/Plugins/img/linea.jpg" alt="" class="img-responsive" style="border-radius: 0px 0px 50px 50px;">
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
