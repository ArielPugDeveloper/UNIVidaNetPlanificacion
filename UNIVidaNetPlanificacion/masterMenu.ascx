<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="masterMenu.ascx.cs" Inherits="UNIVidaNetPlanificacion.masterMenu" %>
<nav class="mt-2">
   <ul class="nav nav-pills nav-sidebar flex-column text-sm nav-legacy nav-compact nav-child-indent" data-widget="treeview" role="menu" data-accordion="true" id="menuPrincipal">
        <%-- <li class="nav-header">
            <small>MENÚ PRINCIPAL</small>
        </li>--%>
        <li class="nav-item has-treeview">
            <a href="<%= RutaDominio %>/Default" class="nav-link" id="menuInicio">
                <i class="nav-icon far fa-home" id="menuInicio"></i>
                <p>
                    Inicio
                </p>
            </a>
        </li>
        <% foreach (var nivel1 in Menu)
            { %>
        <li class="nav-item has-treeview <%= nivel1.Modulo %>">
            <a href=" <%= nivel1.Url %>" class="nav-link">
                <i class="nav-icon <%= nivel1.Icono %>"></i>
                <p>
                    <%= nivel1.TituloMenu %>
                </p>
                <% if (nivel1.MenuNivel2.Count > 0)
                    { %>
                <i class="right fas fa-angle-left"></i>
                <% } %>
            </a>
            <ul class="nav nav-treeview">
                <% foreach (var nivel2 in nivel1.MenuNivel2)
                    { %>
                <li class="nav-item <%= nivel2.SubModulo_formulario %>">
                    <a href=" <%= nivel2.Url %>" class="nav-link">
                        <i class="nav-icon <%= nivel2.Icono %>"></i>
                        <p>
                            <%= nivel2.TituloMenu %>
                        </p>
                        <% if (nivel2.MenuNivel3.Count > 0)
                            { %>
                        <i class="right fas fa-angle-left"></i>
                        <% } %>
                    </a>
                    <% if (nivel2.MenuNivel3.Count > 0)
                        { %>
                    <ul class="nav nav-treeview">
                        <% } %>

                        <% foreach (var nivel3 in nivel2.MenuNivel3)
                            { %>
                        <li class="nav-item <%= nivel3.Formulario %>">
                            <a href=" <%= nivel3.Url %>" class="nav-link">
                                <i class="nav-icon <%= nivel3.Icono %>"></i>
                                <p><%= nivel3.TituloMenu %></p>
                            </a>
                        </li>
                        <% } %>
                        <% if (nivel2.MenuNivel3.Count > 0)
                            { %>
                    </ul>
                    <% } %>
                </li>
                <% } %>
            </ul>
        </li>
        <% } %>
    </ul>
</nav>
<script>
    $(document).ready(function () {
        let menu = $("#menuPrincipal").children("li").toArray();
       
        activarMenu();
    })
    function activarMenu() {

        let url = window.location.pathname;

        let modulo = obtenerModulo(url);
        let subModulo = obtenerSubModulo(url);
        let formulario = obtenerFormulario(url);

        console.log(modulo, subModulo, formulario);

        if (modulo == false || modulo == undefined) {
            console.log("inicio")
            $("#menuInicio").addClass("active");
        }
        if (subModulo == false) {
            console.log("modulo y formulario")
            $("." + modulo).addClass("menu-open").children("a").addClass("active")
            $("." + modulo).find("." + formulario).addClass("menu-open").children("a").addClass("active");
        }
        if (modulo && subModulo && formulario) {
            $("." + modulo).addClass("menu-open").children("a").addClass("active")
            $("." + modulo).find("." + subModulo).addClass("menu-open").children("a").addClass("active");
            $("." + modulo).find("." + subModulo).find("." + formulario).children("a").addClass("active");

           
        }
    }
    function obtenerModulo(url) {
        var carpetas = url.split('/');
        if (carpetas[2] != "") {
            return carpetas[3];
        }
        else {
            return false;
        }
    }
    function obtenerSubModulo(url) {
        var carpetas = url.split('/');
        if (carpetas[4] != "" && carpetas[4] != undefined) {
            if (carpetas[4].substr(0, 2) != "wf")
                return carpetas[4];
            else
                return false
        }
        else {
            return false;
        }
    }
    function obtenerFormulario(url) {
        let carpetas = url.split('/');
        let i = carpetas.length - 1;
        if (carpetas[i] != "" && carpetas[i] != undefined) {

            if (carpetas[i].substr(0, 2) == "wf")
                return carpetas[i].split("?")[0].split(".")[0];
            else
                return false
        }
        else {
            return false;
        }
    }
</script>
