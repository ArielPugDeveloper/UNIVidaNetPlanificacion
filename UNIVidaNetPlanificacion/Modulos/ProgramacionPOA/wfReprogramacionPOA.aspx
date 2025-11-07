<%@ Page Title="Reprogramacion POA" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="wfReprogramacionPOA.aspx.cs" Inherits="UNIVidaNetPlanificacion.Modulos.ProgramacionPOA.wfReprogramacionPOA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h2>Plan Operativo Anual - Reprogramacion</h2>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item active"><a href="#">Inicio</a></li>
                        <li class="breadcrumb-item active">Programacion POA</li>
                        <li class="breadcrumb-item active">Reprogramacion POA</li>
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
            <!-- Campos de gestión y fecha límite -->
            <div class="row mb-3">
                <div class="col-md-2">
                    <label>Gestión</label>
                    <asp:TextBox ID="txtGestion" runat="server" 
                        CssClass="form-control" 
                        Text="2026" 
                        ReadOnly="true" 
                        BackColor="#f8f9fa" />
                </div>
                <div class="col-md-2">
                    <label>Fecha límite</label>
                    <asp:TextBox ID="txtFechaLimite" runat="server" 
                        CssClass="form-control" 
                        Text="15/06/25" 
                        ReadOnly="true" 
                        BackColor="#f8f9fa" />
                </div>
                <div class="col-md-2">
                    <label>Hora límite</label>
                    <asp:TextBox ID="txtHoraLimite" runat="server" 
                        CssClass="form-control" 
                        Text="15:00" 
                        ReadOnly="true" 
                        BackColor="#f8f9fa" />
                </div>
                <div class="col-md-2">
                    <label>&nbsp;</label>
                    <button type="button" class="btn btn-success btn-block" onclick="abrirModalHabilitar()">HABILITAR</button>
                </div>
                <div class="col-md-2">
                    <label>&nbsp;</label>
                    <button type="button" class="btn btn-success btn-block" onclick="abrirModalAmpliarFechaLimite()">Ampliar fecha límite</button>
                </div>
            </div>

            <!-- Tabla -->
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <asp:GridView ID="gvReprogramacionPOA" runat="server" 
                                    CssClass="table table-bordered mb-0"
                                    AutoGenerateColumns="False"
                                    GridLines="Horizontal"
                                    AllowPaging="false"
                                    ShowFooter="false"
                                    ShowHeaderWhenEmpty="true"
                                    OnRowDataBound="gvReprogramacionPOA_RowDataBound">
                                    <HeaderStyle CssClass="bg-primary text-white" />
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <select id="filtroObjetivoEstrategico" class="form-control form-control-sm" onchange="filtrarTablaReprogramacion()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;">
                                                    <option value="">Todos</option>
                                                </select>
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Objetivo Estratégico</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="10%" />
                                            <ItemTemplate>
                                                <%# Eval("ObjetivoEstrategico") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroAccionEstrategica" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTablaReprogramacion()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Acción Estratégica</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="10%" />
                                            <ItemTemplate>
                                                <%# Eval("AccionEstrategica") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroIndicador" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTablaReprogramacion()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Indicador</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="10%" />
                                            <ItemTemplate>
                                                <%# Eval("Indicador") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroObjetivoGestion" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTablaReprogramacion()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Objetivo de Gestión</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="10%" />
                                            <ItemTemplate>
                                                <%# Eval("ObjetivoGestion") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroPonderacion" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTablaReprogramacion()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Ponderación</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="8%" />
                                            <ItemTemplate>
                                                <%# Eval("Ponderacion") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroAccionesGestion" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTablaReprogramacion()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Acciones de Gestión</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="10%" />
                                            <ItemTemplate>
                                                <%# Eval("AccionesGestion") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroIndicadoresProducto" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTablaReprogramacion()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Indicadores Producto</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="10%" />
                                            <ItemTemplate>
                                                <%# Eval("IndicadoresProducto") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <select id="filtroEstado" class="form-control form-control-sm" onchange="filtrarTablaReprogramacion()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;">
                                                    <option value="">Todos</option>
                                                    <option value="REGISTRADO">REGISTRADO</option>
                                                    <option value="PENDIENTE">PENDIENTE</option>
                                                    <option value="APROBADO">APROBADO</option>
                                                    <option value="RECHAZADO">RECHAZADO</option>
                                                    <option value="DEVUELTO">DEVUELTO</option>
                                                </select>
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Estado</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="8%" />
                                            <ItemTemplate>
                                                <%# Eval("Estado") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroResponsablePOA" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTablaReprogramacion()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Responsable POA</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="8%" />
                                            <ItemTemplate>
                                                <%# Eval("ResponsablePOA") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Opciones" ItemStyle-Width="100px" ItemStyle-CssClass="text-center">
                                            <ItemTemplate>
                                                <button type="button" class="btn btn-primary btn-sm" onclick="$('#modalRevisar').modal('show');">
                                                    Revisar
                                                </button>
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

    <!-- Modal Habilitar Reprogramacion -->
    <div class="modal fade" id="modalHabilitar" tabindex="-1" role="dialog" aria-labelledby="modalHabilitarLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalHabilitarLabel">Habilitar Reprogramacion</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="text-center mb-4">
                        <p>Se enviara la notificación a todos los responsables POA de que la reprogramacion esta disponible</p>
                        <button type="button" class="btn btn-success btn-lg" onclick="confirmarHabilitar()">HABILITAR</button>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Fecha limite</label>
                        <div class="col-sm-8">
                            <input type="date" id="txtFechaLimiteModal" class="form-control" value="2025-01-15" />
                        </div>
                    </div>
                    <div class="form-group row mb-0">
                        <label class="col-sm-4 col-form-label">Hora limite</label>
                        <div class="col-sm-8">
                            <input type="time" id="txtHoraLimiteModal" class="form-control" value="13:00" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal para Revisar -->
    <div class="modal fade" id="modalRevisar" tabindex="-1" role="dialog" aria-labelledby="modalRevisarLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 1540px;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalRevisarLabel">Revisar Reprogramación POA</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- Botones superiores -->
                    <div class="row mb-4">
                        <div class="col-12 text-center">
                            <button type="button" class="btn btn-success btn-lg px-5 mr-3" onclick="aprobarRegistro()">Aprobado</button>
                            <button type="button" class="btn btn-danger btn-lg px-5" onclick="devolverRegistro()">Rechazado</button>
                        </div>
                    </div>

                    <!-- Campo Motivo (Editable) -->
                    <div class="row mb-4">
                        <div class="col-12">
                            <label class="font-weight-bold">Motivo (En caso de rechazo)</label>
                            <textarea id="txtMotivo" class="form-control" rows="3" placeholder="Ingrese motivo..."></textarea>
                        </div>
                    </div>

                    <!-- Campo Motivo de la solicitud (Solo lectura) -->
                    <div class="row mb-4">
                        <div class="col-12">
                            <label class="font-weight-bold">Motivo de la solicitud</label>
                            <textarea class="form-control" rows="3" readonly style="background-color: #f8f9fa;">Por causas de fuerza mayor</textarea>
                        </div>
                    </div>

                    <!-- Campos de contenido -->
                    <div class="row mb-4">
                        <div class="col-md-6">
                            <label class="font-weight-bold">Acciones de gestión</label>
                            <textarea id="txtAccionesGestion" class="form-control" rows="4" readonly style="background-color: #f8f9fa;">Implementación al 100% de una plataforma de seguimiento de Siniestros SOAT en UNIVidaApp</textarea>
                        </div>
                        <div class="col-md-6">
                            <label class="font-weight-bold">Indicador Producto</label>
                            <textarea id="txtIndicadorProducto" class="form-control" rows="4" readonly style="background-color: #f8f9fa;">Se ha implementado el sistema de gestión de Seguros de Salud en el Sistema CORE de UNIVIDA, como parte del mejoramiento continuo de las operaciones de La Empresa.</textarea>
                        </div>
                    </div>

                    <!-- Tabla de meses -->
                    <div class="table-responsive">
                        <table class="table table-bordered" style="min-width: 100%;">
                            <thead style="background-color: #e8f4f8;">
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
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center font-weight-bold" style="background-color: #f8f9fa;">88000</td>
                                    <td class="align-middle text-center font-weight-bold" style="background-color: #f8f9fa;">Física</td>
                                </tr>
                                <tr>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center" style="background-color: #f8f9fa;"></td>
                                    <td class="text-center font-weight-bold" style="background-color: #f8f9fa;">100%</td>
                                    <td class="align-middle text-center font-weight-bold" style="background-color: #f8f9fa;">Financiera</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        </div>

    <script type="text/javascript">
        // Función para abrir el modal de Habilitar
        function abrirModalHabilitar() {
            $('#modalHabilitar').modal('show');
        }

        // Función para confirmar la habilitación
        function confirmarHabilitar() {
            var fechaLimite = document.getElementById('txtFechaLimiteModal').value;
            var horaLimite = document.getElementById('txtHoraLimiteModal').value;

            if (!fechaLimite || !horaLimite) {
                Swal.fire({
                    title: 'Campos incompletos',
                    text: 'Por favor complete la fecha y hora límite.',
                    icon: 'warning',
                    confirmButtonText: 'Entendido'
                });
                return;
            }

            Swal.fire({
                title: '¿Confirmar habilitación?',
                text: 'Se enviará la notificación a todos los responsables POA.',
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#28a745',
                cancelButtonColor: '#6c757d',
                confirmButtonText: 'Sí, habilitar',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    $('#modalHabilitar').modal('hide');
                    Swal.fire({
                        title: '¡Habilitado!',
                        text: 'La reprogramación ha sido habilitada correctamente y se han enviado las notificaciones.',
                        icon: 'success',
                        confirmButtonText: 'Entendido'
                    });
                }
            });
        }

        // Cargar opciones del dropdown de Objetivo Estratégico al cargar la página
        window.addEventListener('DOMContentLoaded', function() {
            cargarOpcionesObjetivosEstrategicosReprogramacion();
        });

        function cargarOpcionesObjetivosEstrategicosReprogramacion() {
            var tabla = document.getElementById('<%= gvReprogramacionPOA.ClientID %>');
            var filas = tabla.getElementsByTagName('tr');
            var opciones = new Set();
            opciones.add('');

            for (var i = 1; i < filas.length; i++) {
                var celdas = filas[i].getElementsByTagName('td');
                if (celdas.length > 0) {
                    var textoOE = celdas[0].textContent.trim();
                    if (textoOE) {
                        opciones.add(textoOE);
                    }
                }
            }

            var select = document.getElementById('filtroObjetivoEstrategico');
            if (select) {
                select.innerHTML = '<option value="">Todos</option>';
                
                opciones.forEach(function(opcion) {
                    if (opcion !== '') {
                        var option = document.createElement('option');
                        option.value = opcion;
                        option.text = opcion;
                        select.add(option);
                    }
                });
            }
        }

        function filtrarTablaReprogramacion() {
            var tabla = document.getElementById('<%= gvReprogramacionPOA.ClientID %>');
            var filas = tabla.getElementsByTagName('tr');

            var filtroOE = document.getElementById('filtroObjetivoEstrategico').value.trim();
            var filtroAE = document.getElementById('filtroAccionEstrategica').value.toLowerCase();
            var filtroInd = document.getElementById('filtroIndicador').value.toLowerCase();
            var filtroOG = document.getElementById('filtroObjetivoGestion').value.toLowerCase();
            var filtroPon = document.getElementById('filtroPonderacion').value.toLowerCase();
            var filtroAG = document.getElementById('filtroAccionesGestion').value.toLowerCase();
            var filtroIP = document.getElementById('filtroIndicadoresProducto').value.toLowerCase();
            var filtroEst = document.getElementById('filtroEstado').value.trim(); // Dropdown - coincidencia exacta
            var filtroResp = document.getElementById('filtroResponsablePOA').value.toLowerCase();

            for (var i = 1; i < filas.length; i++) {
                var celdas = filas[i].getElementsByTagName('td');
                if (celdas.length > 0) {
                    var textoOE = celdas[0].textContent.trim();
                    var textoAE = celdas[1].textContent.toLowerCase();
                    var textoInd = celdas[2].textContent.toLowerCase();
                    var textoOG = celdas[3].textContent.toLowerCase();
                    var textoPon = celdas[4].textContent.toLowerCase();
                    var textoAG = celdas[5].textContent.toLowerCase();
                    var textoIP = celdas[6].textContent.toLowerCase();
                    var textoEst = celdas[7].textContent.trim(); // Dropdown - coincidencia exacta
                    var textoResp = celdas[8].textContent.toLowerCase();

                    var mostrar = true;

                    if (filtroOE && textoOE !== filtroOE) mostrar = false;
                    if (filtroAE && textoAE.indexOf(filtroAE) === -1) mostrar = false;
                    if (filtroInd && textoInd.indexOf(filtroInd) === -1) mostrar = false;
                    if (filtroOG && textoOG.indexOf(filtroOG) === -1) mostrar = false;
                    if (filtroPon && textoPon.indexOf(filtroPon) === -1) mostrar = false;
                    if (filtroAG && textoAG.indexOf(filtroAG) === -1) mostrar = false;
                    if (filtroIP && textoIP.indexOf(filtroIP) === -1) mostrar = false;
                    if (filtroEst && textoEst !== filtroEst) mostrar = false; // Coincidencia exacta para dropdown
                    if (filtroResp && textoResp.indexOf(filtroResp) === -1) mostrar = false;

                    filas[i].style.display = mostrar ? '' : 'none';
                }
            }
        }

        // Funciones para el modal de Revisar
        function aprobarRegistro() {
            Swal.fire({
                title: '¿Confirmar aprobación?',
                text: '¿Está seguro de que desea aprobar este registro?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#28a745',
                cancelButtonColor: '#6c757d',
                confirmButtonText: 'Sí, aprobar',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    $('#modalRevisar').modal('hide');
                    Swal.fire({
                        title: '¡Aprobado!',
                        text: 'El registro ha sido aprobado correctamente.',
                        icon: 'success',
                        confirmButtonText: 'Entendido'
                    });
                }
            });
        }

        function devolverRegistro() {
            // Obtener el motivo de rechazo
            var motivo = document.getElementById('txtMotivo').value.trim();
            
            if (motivo === '') {
                Swal.fire({
                    title: 'Motivo requerido',
                    text: 'Por favor ingrese el motivo de rechazo.',
                    icon: 'warning',
                    confirmButtonText: 'Entendido'
                });
                return;
            }
            
            Swal.fire({
                title: '¿Confirmar rechazo?',
                text: '¿Está seguro de que desea rechazar este registro?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#dc3545',
                cancelButtonColor: '#6c757d',
                confirmButtonText: 'Sí, rechazar',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    $('#modalRevisar').modal('hide');
                    Swal.fire({
                        title: '¡Rechazado!',
                        text: 'El registro ha sido rechazado correctamente.',
                        icon: 'success',
                        confirmButtonText: 'Entendido'
                    });
                    // Limpiar el campo motivo
                    document.getElementById('txtMotivo').value = '';
                }
            });
        }

        // Función para abrir el modal de Ampliar fecha límite
        function abrirModalAmpliarFechaLimite() {
            Swal.fire({
                title: 'Ampliar fecha límite',
                text: 'Funcionalidad en desarrollo',
                icon: 'info',
                confirmButtonText: 'Entendido'
            });
        }
    </script>
</asp:Content>