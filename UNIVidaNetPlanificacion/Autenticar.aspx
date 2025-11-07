<%@ Page Title="Inicio Sesión" Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" CodeBehind="Autenticar.aspx.cs" Inherits="UNIVidaNetPlanificacion.Autenticar" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .contenido-login {
            max-width: 500px;
        }
        .input-group-text {
            color: #004c7c !important;
            background-color: #ffffff !important;
        }
    </style>
    <div class="contenido-login mx-auto">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header text-center">
                        <img src="<%= RutaDominio %>/Plugins/img/UNIVida.png" style="max-width: 40%; margin: 10px">
                    </div>
                    <div class="card-body m-3">
                        <div class="form-group login">
                            <label class="otros" for="txtUsuario">Usuario</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <em class="fa fa-user"></em>
                                    </span>
                                </div>
                                <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" placeholder="Ingrese su nombre de usuario"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvtxtUsuario" runat="server" ErrorMessage="El campo usuario es requerido" ControlToValidate="txtUsuario" ForeColor="Red" class="control-label" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group login">
                            <label class="otros" for="txtContraseña">Contraseña</label>
                            <div class="input-group" id="Pass">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <em class="fa fa-lock"></em>
                                    </span>
                                </div>
                                <asp:TextBox TextMode="Password" ID="txtContraseña" runat="server" CssClass="form-control" placeholder="Ingrese su contraseña"></asp:TextBox>
                                <div class="input-group-append" style="cursor: pointer">
                                    <span class="input-group-text" id="MuestraPass" title="Mostrar Contraseña" data-toggle="tooltip">
                                        <em class="fa fa-eye-slash"></em>
                                    </span>
                                </div>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvtxtcontrasena" runat="server" ErrorMessage="El campo contraseña es requerido" ControlToValidate="txtContraseña" ForeColor="Red" class="control-label"></asp:RequiredFieldValidator>
                        </div>
                        <div class="alert alert-danger animated bounce" role="alert" id="divAlerta" runat="server" visible="false">
                            <asp:Label ID="lblMensaje" runat="server" Display="Dynamic"></asp:Label>
                        </div>
                        <asp:Button ID="btnGuardar" runat="server" Text="Iniciar Sesión" class="btn btn-primary btn-block mt-4 mb-2" OnClick="btnLoginForm_Click" />
                    </div>
                    <div>
                        <img src="<%= RutaDominio %>/Plugins/img/linea.jpg" alt="" class="img-responsive" style="border-radius: 0px 0px 50px 50px;">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('#MainContent_txtContraseña').keypress(function (e) {
                var s = String.fromCharCode(e.which);
                if ((s.toUpperCase() === s && s.toLowerCase() !== s && !e.shiftKey) ||
                    (s.toUpperCase() !== s && s.toLowerCase() === s && e.shiftKey)) {
                    if ($('#capsalert').length < 1) $('#Pass').before('<div id="capsalert" style="color:red">¡La tecla <strong>Bloq Mayús</strong> está activada!</div>');
                } else {
                    if ($('#capsalert').length > 0) $('#capsalert').remove();
                }
            });
        });
    </script>
</asp:Content>
