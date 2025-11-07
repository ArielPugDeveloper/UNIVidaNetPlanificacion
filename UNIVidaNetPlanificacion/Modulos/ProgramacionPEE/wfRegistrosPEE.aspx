<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wfRegistrosPEE.aspx.cs" Inherits="UNIVidaNetPlanificacion.Modulos.ProgramacionPEE.wfRegistrosPEE" MasterPageFile="~/Site.Master" %>

<%@ Register Src="~/Modulos/ProgramacionPEE/ucBotonNuevoRegistro.ascx" TagPrefix="uc1" TagName="ucBotonNuevoRegistro" %>
<%@ Register Src="~/Modulos/ProgramacionPEE/ucOpcionesRegistrosPEE.ascx" TagPrefix="uc2" TagName="ucOpcionesRegistrosPEE" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        
        <asp:HiddenField ID="hfDatosIndicadores" runat="server" />
        <asp:HiddenField ID="hfArchivoIndicadores" runat="server" />
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h2>Plan Estratégico Empresarial - Registros</h2>
                    </div>
                </div>
            </div>
        </section>

    <section class="content mb-5">
        <div class="container-fluid">
            <!-- Barra de acciones -->
            <div class="row mb-3" >
                <div class="col-md-3">
                    <label>Estado:</label>
                    <select id="ddlEstado" class="form-control" onchange="filtrarPorEstado(this.value)">
                        <option value="Todos" selected>Todos</option>
                        <option value="EMITIDO">EMITIDO</option>
                        <option value="CERRADO">CERRADO</option>
                    </select>
                </div>
            
                <!-- Botón Nuevo Registro (User Control) -->
                <uc1:ucBotonNuevoRegistro runat="server" ID="ucBotonNuevoRegistro" />

            </div>

            <!-- Tabla -->
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <asp:GridView ID="gvRegistrosPEE" runat="server" 
                                    CssClass="table table-bordered mb-0" 
                                    AutoGenerateColumns="false" 
                                    AllowPaging="false"
                                    ShowFooter="false"
                                    ShowHeaderWhenEmpty="true"
                                    OnRowDataBound="gvRegistrosPEE_RowDataBound">
                                    <HeaderStyle CssClass="bg-primary text-white" />
                                    <Columns>

                                        <asp:BoundField DataField="TRegistroPEEFk" HeaderText="Numero Registro" />
                                        <asp:BoundField DataField="TRegistroPEEFechaAdicion" HeaderText="Fecha Adicion" />
                                        <asp:BoundField DataField="TRegistroPEEGestionInicial" HeaderText="Gestión Inicial" />
                                        <asp:BoundField DataField="TRegistroPEEGestionFinal" HeaderText="Gestión Final" />
                                        <asp:BoundField DataField="EstadoDescripcion" HeaderText="Estado" />
                                    
                                    <asp:TemplateField HeaderText="Opciones" ItemStyle-Width="200px">
                                        <ItemTemplate>
                                            <uc2:ucOpcionesRegistrosPEE runat="server" ID="ucOpcionesRegistrosPEE" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <script>
        function incrementar(textBoxId) {
            var textBox = document.getElementById(textBoxId);
            var valor = parseInt(textBox.value);
            textBox.value = valor + 1;
        }

        function decrementar(textBoxId) {
            var textBox = document.getElementById(textBoxId);
            var valor = parseInt(textBox.value);
            if (valor > 2020) {
                textBox.value = valor - 1;
            }
        }

        // Función para filtrar la tabla por estado
        function filtrarPorEstado(estadoSeleccionado) {
            var tabla = document.getElementById('<%= gvRegistrosPEE.ClientID %>');
            if (!tabla) return;
            
            var filas = tabla.getElementsByTagName('tr');
            
            // Empezar desde 1 para saltar el header
            for (var i = 1; i < filas.length; i++) {
                var fila = filas[i];
                var celdaEstado = fila.cells[4]; // La columna Estado es la 5ta (índice 4)
                
                if (celdaEstado) {
                    var estadoFila = celdaEstado.textContent || celdaEstado.innerText || '';
                    estadoFila = estadoFila.trim();
                    
                    // Mostrar si es "Todos" o si coincide exactamente con el estado
                    if (estadoSeleccionado === 'Todos' || estadoFila === estadoSeleccionado) {
                        fila.style.display = '';
                    } else {
                        fila.style.display = 'none';
                    }
                }
            }
        }

        // Función para permitir solo números enteros
        function soloNumeros(event) {
            var charCode = event.which ? event.which : event.keyCode;
            if (charCode >= 48 && charCode <= 57 || charCode == 8 || charCode == 9 || charCode == 27 || charCode == 13 || charCode == 46) {
                return true;
            } else {
                return false;
            }
        }

        // Función para validar el formulario del modal (ya no se necesita)
        function validarFormularioModal() {
            // La validación ahora se hace en el servidor
            return true;
        }

        function registrarNuevoPEE() {
            // Esta función ya no se usa, el botón Registrar hace postback directo
            return true;
        }
    </script>

</asp:Content>