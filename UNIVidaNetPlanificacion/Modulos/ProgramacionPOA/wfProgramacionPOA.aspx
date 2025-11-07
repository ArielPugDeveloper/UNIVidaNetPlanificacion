<%@ Page Title="Programacion POA" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="wfProgramacionPOA.aspx.cs" Inherits="UNIVidaNetPlanificacion.Modulos.ProgramacionPOA.wfProgramacionPOA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h2>Plan Operativo Anual - Indicadores</h2>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item active"><a href="#">Inicio</a></li>
                        <li class="breadcrumb-item active">Programacion POA</li>
                        <li class="breadcrumb-item active">Indicadores</li>
                    </ol>
                    <div class="float-sm-right mt-2">
                        <asp:LinkButton ID="lnkVolver" runat="server" Text="Volver" CssClass="btn btn-secondary" OnClick="lnkVolver_Click" />
                    </div>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>

    <section class="content mb-5">
        <div class="container-fluid">
            <!-- Filtros -->
            <div class="row mb-3">
                <div class="col-md-3">
                    <label>Gestión:</label>
                    <asp:TextBox ID="txtGestion" runat="server" CssClass="form-control" Text="2026" ReadOnly="true" style="background-color: #e9ecef;" />
                </div>
                <div class="col-md-3">
                    <label>Fecha OKR's recibidos:</label>
                    <asp:TextBox ID="txtFechaOKR" runat="server" CssClass="form-control" Text="15/01/2025" ReadOnly="true" style="background-color: #e9ecef;" />
                </div>
                <div class="col-md-3">
                    <label>Responsable PEE:</label>
                    <asp:TextBox ID="txtResponsablePEE" runat="server" CssClass="form-control" Text="Gerencia Nacional de TI" ReadOnly="true" style="background-color: #e9ecef;" />
                </div>
                <div class="col-md-3">
                    <label>Fecha limite:</label>
                    <asp:TextBox ID="txtFechaLimite" runat="server" CssClass="form-control" Text="30/01/2025" ReadOnly="true" style="background-color: #e9ecef;" />
                </div>
            </div>

            <!-- Acciones -->
            <div class="row mb-3">
                <div class="col-md-6">
                    <asp:Button ID="btnVerFicha" runat="server" Text="Ver Ficha" CssClass="btn btn-warning mr-2" OnClick="btnVerFicha_Click" />
                    <asp:Button ID="btnGenerarPOAExcel" runat="server" Text="Generar POA (Excel)" CssClass="btn btn-primary" OnClick="btnGenerarPOAExcel_Click" />
                </div>
                <div class="col-md-6 text-right">
                    <button type="button" class="btn btn-primary mr-2" onclick="abrirModalPonderaciones()">Ponderaciones</button>
                    <asp:Button ID="btnAñadirRegistro" runat="server" Text="Añadir Registro" CssClass="btn btn-success mr-2" OnClick="btnAñadirRegistro_Click" />
                    <asp:Button ID="btnEnviarRegistros" runat="server" Text="Enviar Registros" CssClass="btn btn-primary" OnClick="btnEnviarRegistros_Click" />
                </div>
            </div>

            <!-- Tabla -->
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <asp:GridView ID="gvProgramacionPOA" runat="server" 
                                    CssClass="table table-bordered mb-0"
                                    AutoGenerateColumns="False"
                                    GridLines="Horizontal"
                                    AllowPaging="false"
                                    ShowFooter="false"
                                    ShowHeaderWhenEmpty="true"
                                    OnRowDataBound="gvProgramacionPOA_RowDataBound">
                                    <HeaderStyle CssClass="bg-primary text-white" />
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroObjetivoGestion" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTablaProgramacionPOA()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Objetivo de gestión</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="25%" />
                                            <ItemTemplate>
                                                <%# Eval("ObjetivoGestion") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroIndicadorGestion" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTablaProgramacionPOA()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Indicador de gestión</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="25%" />
                                            <ItemTemplate>
                                                <%# Eval("IndicadorGestion") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroResultadosEsperados" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTablaProgramacionPOA()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Resultados esperados</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="25%" />
                                            <ItemTemplate>
                                                <%# Eval("ResultadosEsperados") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <select id="filtroEstado" class="form-control form-control-sm" onchange="filtrarTablaProgramacionPOA()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;">
                                                    <option value="">Todos</option>
                                                    <option value="SIN REGISTRAR">SIN REGISTRAR</option>
                                                    <option value="REGISTRADO">REGISTRADO</option>
                                                    <option value="PENDIENTE">PENDIENTE</option>
                                                    <option value="DEVUELTO">DEVUELTO</option>
                                                    <option value="APROBADO">APROBADO</option>
                                                </select>
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Estado</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="10%" />
                                            <ItemTemplate>
                                                <%# Eval("Estado") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Opciones</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="10%" CssClass="text-center" />
                                            <ItemTemplate>
                                                    <div class="d-flex flex-column">
                                                    <button type="button" class="btn btn-primary btn-sm mb-1" onclick="$('#modalRegistrar').modal('show');">
                                                        Registrar
                                                    </button>
                                                    <button type="button" class="btn btn-info btn-sm" onclick="$('#modalMasInfo').modal('show');">
                                                        Más Info
                                                    </button>
                                                    </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script type="text/javascript">
                function filtrarTablaProgramacionPOA() {
                    var tabla = document.getElementById('<%= gvProgramacionPOA.ClientID %>');
                    var filas = tabla.getElementsByTagName('tr');

                    var filtroObjetivoGestion = document.getElementById('filtroObjetivoGestion').value.toLowerCase();
                    var filtroIndicadorGestion = document.getElementById('filtroIndicadorGestion').value.toLowerCase();
                    var filtroResultadosEsperados = document.getElementById('filtroResultadosEsperados').value.toLowerCase();
                    var filtroEstado = document.getElementById('filtroEstado').value.trim();

                    for (var i = 1; i < filas.length; i++) {
                        var celdas = filas[i].getElementsByTagName('td');
                        if (celdas.length > 0) {
                            var textoObjetivoGestion = celdas[0].textContent.toLowerCase();
                            var textoIndicadorGestion = celdas[1].textContent.toLowerCase();
                            var textoResultadosEsperados = celdas[2].textContent.toLowerCase();
                            var textoEstado = celdas[3].textContent.trim();

                            var mostrar = true;

                            if (filtroObjetivoGestion && textoObjetivoGestion.indexOf(filtroObjetivoGestion) === -1) mostrar = false;
                            if (filtroIndicadorGestion && textoIndicadorGestion.indexOf(filtroIndicadorGestion) === -1) mostrar = false;
                            if (filtroResultadosEsperados && textoResultadosEsperados.indexOf(filtroResultadosEsperados) === -1) mostrar = false;
                            if (filtroEstado && textoEstado !== filtroEstado) mostrar = false;

                            filas[i].style.display = mostrar ? '' : 'none';
                        }
                    }
                }
            </script>
        </div>
    </section>

            <!-- Modal para Registrar -->
            <div class="modal fade" id="modalRegistrar" tabindex="-1" role="dialog" aria-labelledby="modalRegistrarLabel" aria-hidden="true">
                <div class="modal-dialog modal-xl" role="document" style="max-width: 1540px;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalRegistrarLabel">Registrar Programación POA</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- Campos superiores -->
                    <div class="row mb-4">
                        <div class="col-md-6">
                            <label class="font-weight-bold">Acciones de gestión</label>
                            <textarea id="txtAccionesGestion" class="form-control" rows="4" placeholder="Ingrese las acciones de gestión..."></textarea>
                        </div>
                        <div class="col-md-6">
                            <label class="font-weight-bold">Indicador Producto</label>
                            <textarea id="txtIndicadorProducto" class="form-control" rows="4" placeholder="Ingrese el indicador producto..."></textarea>
                        </div>
                    </div>

                            <!-- Tabla de meses -->
                            <div class="table-responsive">
                                <table class="table table-bordered" style="min-width: 100%;">
                                    <thead class="bg-light">
                                        <tr>
                                            <th class="text-center" style="width: 110px;">Ene</th>
                                            <th class="text-center" style="width: 110px;">Feb</th>
                                            <th class="text-center" style="width: 110px;">Mar</th>
                                            <th class="text-center" style="width: 110px;">Abr</th>
                                            <th class="text-center" style="width: 110px;">May</th>
                                            <th class="text-center" style="width: 110px;">Jun</th>
                                            <th class="text-center" style="width: 110px;">Jul</th>
                                            <th class="text-center" style="width: 110px;">Ago</th>
                                            <th class="text-center" style="width: 110px;">Sep</th>
                                            <th class="text-center" style="width: 110px;">Oct</th>
                                            <th class="text-center" style="width: 110px;">Nov</th>
                                            <th class="text-center" style="width: 110px;">Dic</th>
                                            <th class="text-center" style="width: 130px;">TIPO</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><input type="text" class="form-control form-control-sm text-center" id="txtFisicaEne" style="border: none; background: transparent; padding: 8px;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" id="txtFisicaFeb" style="border: none; background: transparent; padding: 8px;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" id="txtFisicaMar" style="border: none; background: transparent; padding: 8px;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" id="txtFisicaAbr" style="border: none; background: transparent; padding: 8px;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" id="txtFisicaMay" style="border: none; background: transparent; padding: 8px;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" id="txtFisicaJun" style="border: none; background: transparent; padding: 8px;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" id="txtFisicaJul" style="border: none; background: transparent; padding: 8px;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" id="txtFisicaAgo" style="border: none; background: transparent; padding: 8px;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" id="txtFisicaSep" style="border: none; background: transparent; padding: 8px;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" id="txtFisicaOct" style="border: none; background: transparent; padding: 8px;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" id="txtFisicaNov" style="border: none; background: transparent; padding: 8px;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" id="txtFisicaDic" style="border: none; background: transparent; padding: 8px;" /></td>
                                            <td class="align-middle text-center font-weight-bold">Física</td>
                                        </tr>
                                        <tr>
                                            <td><input type="text" class="form-control form-control-sm text-center" id="txtFinancieraEne" style="border: none; background: transparent; padding: 8px;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" id="txtFinancieraFeb" style="border: none; background: transparent; padding: 8px;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" id="txtFinancieraMar" style="border: none; background: transparent; padding: 8px;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" id="txtFinancieraAbr" style="border: none; background: transparent; padding: 8px;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" id="txtFinancieraMay" style="border: none; background: transparent; padding: 8px;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" id="txtFinancieraJun" style="border: none; background: transparent; padding: 8px;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" id="txtFinancieraJul" style="border: none; background: transparent; padding: 8px;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" id="txtFinancieraAgo" style="border: none; background: transparent; padding: 8px;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" id="txtFinancieraSep" style="border: none; background: transparent; padding: 8px;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" id="txtFinancieraOct" style="border: none; background: transparent; padding: 8px;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" id="txtFinancieraNov" style="border: none; background: transparent; padding: 8px;" /></td>
                                            <td><input type="text" class="form-control form-control-sm text-center" id="txtFinancieraDic" style="border: none; background: transparent; padding: 8px;" /></td>
                                            <td class="align-middle text-center font-weight-bold">Financiera</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-success btn-lg px-5" onclick="guardarRegistro()">Guardar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Ponderaciones -->
    <div class="modal fade" id="modalPonderaciones" tabindex="-1" role="dialog" aria-labelledby="modalPonderacionesLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalPonderacionesLabel">Ponderaciones</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="table-responsive">
                        <table class="table table-bordered mb-0">
                            <thead class="bg-primary text-white">
                                <tr>
                                    <th style="width: 15%;">Responsables POA</th>
                                    <th style="width: 35%;">Acción de gestión</th>
                                    <th style="width: 35%;">Indicador de producto</th>
                                    <th style="width: 15%;">Ponderación</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>JNDS</td>
                                    <td>Implementación al 100% de una plataforma de seguimiento de Siniestros SOAT en UNIVidaApp</td>
                                    <td>Plataforma de seguimiento implementada y operativa</td>
                                    <td>
                                        <input type="number" class="form-control text-center" value="25" min="0" max="100" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>JNDS</td>
                                    <td>Desarrollo e implementación del módulo de gestión de pólizas digitales</td>
                                    <td>Módulo de pólizas digitales funcionando correctamente</td>
                                    <td>
                                        <input type="number" class="form-control text-center" value="30" min="0" max="100" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>JNIR</td>
                                    <td>Actualización del sistema de cotizaciones en línea con nuevos productos</td>
                                    <td>Sistema de cotizaciones actualizado con todos los productos vigentes</td>
                                    <td>
                                        <input type="number" class="form-control text-center" value="20" min="0" max="100" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>JNIR</td>
                                    <td>Integración del sistema de notificaciones push con la aplicación móvil</td>
                                    <td>Sistema de notificaciones push integrado y funcionando</td>
                                    <td>
                                        <input type="number" class="form-control text-center" value="25" min="0" max="100" />
                                    </td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="3" class="text-right font-weight-bold">TOTAL:</td>
                                    <td class="text-center font-weight-bold" id="totalPonderacion">100</td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-success btn-lg px-5" onclick="guardarPonderaciones()">Guardar</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Función para abrir el modal de Ponderaciones
        function abrirModalPonderaciones() {
            $('#modalPonderaciones').modal('show');
            calcularTotalPonderacion();
        }

        // Función para calcular el total de ponderaciones
        function calcularTotalPonderacion() {
            var inputs = document.querySelectorAll('#modalPonderaciones input[type="number"]');
            var total = 0;
            
            inputs.forEach(function(input) {
                var valor = parseInt(input.value) || 0;
                total += valor;
            });
            
            document.getElementById('totalPonderacion').textContent = total;
            
            // Cambiar color si no suma 100
            if (total !== 100) {
                document.getElementById('totalPonderacion').style.color = 'red';
            } else {
                document.getElementById('totalPonderacion').style.color = 'black';
            }
        }

        // Agregar event listeners a los inputs de ponderación
        document.addEventListener('DOMContentLoaded', function() {
            var inputs = document.querySelectorAll('#modalPonderaciones input[type="number"]');
            inputs.forEach(function(input) {
                input.addEventListener('input', calcularTotalPonderacion);
            });
        });

        // Función para guardar ponderaciones
        function guardarPonderaciones() {
            var total = parseInt(document.getElementById('totalPonderacion').textContent);
            
            if (total !== 100) {
                Swal.fire({
                    title: 'Atención',
                    text: 'La suma de las ponderaciones debe ser igual a 100. Actualmente suma ' + total + '.',
                    icon: 'warning',
                    confirmButtonText: 'Entendido'
                });
                return;
            }

            $('#modalPonderaciones').modal('hide');
            
            Swal.fire({
                title: '¡Guardado!',
                text: 'Las ponderaciones han sido guardadas correctamente.',
                icon: 'success',
                confirmButtonText: 'Entendido'
            });
        }

        function guardarRegistro() {
            // Validar que al menos un campo esté lleno
            var accionesGestion = document.getElementById('txtAccionesGestion').value;
            var indicadorProducto = document.getElementById('txtIndicadorProducto').value;
            
            if (!accionesGestion && !indicadorProducto) {
                Swal.fire({
                    title: 'Atención',
                    text: 'Por favor complete al menos un campo antes de guardar.',
                    icon: 'warning',
                    confirmButtonText: 'Entendido'
                });
                return;
            }

            $('#modalRegistrar').modal('hide');
            
            Swal.fire({
                title: '¡Guardado!',
                text: 'El registro ha sido guardado correctamente.',
                icon: 'success',
                confirmButtonText: 'Entendido'
            });
        }
    </script>

    <!-- Modal para Más Info -->
    <div class="modal fade" id="modalMasInfo" tabindex="-1" role="dialog" aria-labelledby="modalMasInfoLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 1400px;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalMasInfoLabel">Información Adicional</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="table-responsive">
                        <table class="table table-bordered mb-0">
                            <thead class="bg-success text-white">
                                <tr>
                                    <th class="text-center align-middle" style="width: 33%;">INDICADOR</th>
                                    <th class="text-center align-middle" style="width: 33%;">OBJETIVO DE GESTIÓN</th>
                                    <th class="text-center align-middle" style="width: 34%;">INDICADOR DE GESTIÓN</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="align-middle" style="background-color: #ffffff; padding: 15px;">
                                        Promover el mejoramiento continuo de la tecnología, la innovación y el funcionamiento óptimo de los sistemas informáticos de UNIVIDA S.A.
                                    </td>
                                    <td class="align-middle" style="background-color: #ffffff; padding: 15px;">
                                        Promover el mejoramiento continuo de la tecnología, la innovación y el funcionamiento óptimo de los sistemas informáticos de UNIVIDA S.A.
                                    </td>
                                    <td class="align-middle" style="background-color: #ffffff; padding: 15px;">
                                        (Cantidad de ramos habilitados integrados al CORE / cantidad de ramos habilitados)*100
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>