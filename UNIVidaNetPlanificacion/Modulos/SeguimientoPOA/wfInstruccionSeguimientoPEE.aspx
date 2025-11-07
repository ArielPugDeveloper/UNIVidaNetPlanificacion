<%@ Page Title="Seguimiento de Instrucciones PEE" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="wfInstruccionSeguimientoPEE.aspx.cs" Inherits="UNIVidaNetPlanificacion.Modulos.SeguimientoPOA.wfInstruccionSeguimientoPEE" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h2>Plan Estratégico Empresarial - Seguimiento de Instrucciones</h2>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item active"><a href="#">Inicio</a></li>
                        <li class="breadcrumb-item active">Seguimiento POA</li>
                        <li class="breadcrumb-item active">Seguimiento Instrucciones PEE</li>
                    </ol>
                    <div class="float-sm-right mt-2">
                        <asp:LinkButton ID="lnkVolver" runat="server" Text="Volver" CssClass="btn btn-secondary" OnClick="lnkVolver_Click" />
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="content mb-5">
        <div class="container-fluid">
            <!-- Fechas y botón Ampliar -->
            <div class="row mb-3">
                <div class="col-md-2">
                    <label>Fecha Instrucción asignada:</label>
                    <asp:TextBox ID="txtFechaInstruccionAsignada" runat="server" 
                        CssClass="form-control" 
                        Text="30/10/2025" 
                        ReadOnly="true" 
                        BackColor="#f8f9fa" />
                </div>
                <div class="col-md-2">
                    <label>Fecha límite asignada:</label>
                    <asp:TextBox ID="txtFechaLimiteAsignada" runat="server" 
                        CssClass="form-control" 
                        Text="30/11/2025" 
                        ReadOnly="true" 
                        BackColor="#f8f9fa" />
                </div>
                <div class="col-md-2">
                    <label>Última fecha de ampliación:</label>
                    <asp:TextBox ID="txtUltimaFechaAmpliacion" runat="server" 
                        CssClass="form-control" 
                        Text="10/12/2025" 
                        ReadOnly="true" 
                        BackColor="#f8f9fa" />
                </div>
                <div class="col-md-2">
                    <label>&nbsp;</label>
                    <button type="button" class="btn btn-success btn-block" onclick="$('#modalAmpliarFecha').modal('show');">
                        Ampliar fecha límite
                    </button>
                </div>
                <div class="col-md-2">
                    <label>&nbsp;</label>
                    <asp:Button ID="btnGenerarPEE" runat="server" 
                        Text="Generar PEE" 
                        CssClass="btn btn-primary btn-block" 
                        OnClick="btnGenerarPEE_Click" />
                </div>
                <div class="col-md-2">
                    <!-- Espacio para futuras acciones -->
                </div>
            </div>

            <!-- Tabla -->
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <asp:GridView ID="gvSeguimientoInstrucciones" runat="server" 
                                    CssClass="table table-bordered mb-0"
                                    AutoGenerateColumns="False"
                                    GridLines="Horizontal"
                                    AllowPaging="false"
                                    ShowFooter="false"
                                    ShowHeaderWhenEmpty="true">
                                    <HeaderStyle CssClass="bg-primary text-white" />
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <select id="filtroObjetivoEstrategico" class="form-control form-control-sm" onchange="filtrarTablaPEE()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;">
                                                    <option value="">Todos</option>
                                                </select>
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Objetivo estratégico</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="20%" />
                                            <ItemTemplate>
                                                <%# Eval("ObjetivoEstrategico") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroAccionEstrategica" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTablaPEE()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Acción estratégica</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="20%" />
                                            <ItemTemplate>
                                                <%# Eval("AccionEstrategica") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroIndicador" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTablaPEE()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Indicador</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="20%" />
                                            <ItemTemplate>
                                                <%# Eval("Indicador") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroResponsablePEE" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTablaPEE()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Responsable PEE</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="15%" />
                                            <ItemTemplate>
                                                <%# Eval("ResponsablePEE") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <select id="filtroEstado" class="form-control form-control-sm" onchange="filtrarTablaPEE()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;">
                                                    <option value="">Todos</option>
                                                    <option value="PRESENTADO">PRESENTADO</option>
                                                    <option value="EN ELABORACION">EN ELABORACION</option>
                                                    <option value="COMPLETADO">COMPLETADO</option>
                                                    <option value="RETRASADO">RETRASADO</option>
                                                </select>
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Estado</div>
                                            </HeaderTemplate>
                                            <ItemStyle Width="15%" />
                                            <ItemTemplate>
                                                <%# Eval("Estado") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField HeaderText="Opciones" ItemStyle-CssClass="text-center">
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

    <!-- Modal para Revisar -->
    <div class="modal fade" id="modalRevisar" tabindex="-1" role="dialog" aria-labelledby="modalRevisarLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalRevisarLabel">Revisión de Instrucción PEE</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- Botón Observar -->
                    <div class="row mb-3">
                        <div class="col-md-12">
                            <button type="button" class="btn btn-danger btn-lg" onclick="observarInstruccion()">Observar</button>
                        </div>
                    </div>

                    <!-- Campo Motivo -->
                    <div class="row mb-3">
                        <div class="col-md-12">
                            <label class="font-weight-bold">Motivo</label>
                            <textarea id="txtMotivoObservacion" class="form-control" rows="4" placeholder="Ingrese el motivo de la observación..."></textarea>
                        </div>
                    </div>

                    <!-- Tabla de Metas -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-bordered mb-0">
                                    <thead class="bg-success text-white">
                                        <tr>
                                            <th class="text-center">TIPO DE EJECUCIÓN</th>
                                            <th class="text-center">METAS 2026</th>
                                            <th class="text-center">METAS 2027</th>
                                            <th class="text-center">METAS 2028</th>
                                            <th class="text-center">METAS 2029</th>
                                            <th class="text-center">METAS 2030</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="text-center font-weight-bold">Programado</td>
                                            <td class="text-center">100%</td>
                                            <td class="text-center">100%</td>
                                            <td class="text-center">100%</td>
                                            <td class="text-center">100%</td>
                                            <td class="text-center">100%</td>
                                        </tr>
                                        <tr>
                                            <td class="text-center font-weight-bold">Ejecutado</td>
                                            <td class="text-center">60%</td>
                                            <td class="text-center"></td>
                                            <td class="text-center"></td>
                                            <td class="text-center"></td>
                                            <td class="text-center"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal para Ampliar fecha -->
    <div class="modal fade" id="modalAmpliarFecha" tabindex="-1" role="dialog" aria-labelledby="modalAmpliarFechaLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalAmpliarFechaLabel">Ampliar fecha</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label font-weight-bold">Fecha</label>
                        <div class="col-sm-9">
                            <input type="date" id="txtFechaAmpliacion" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="font-weight-bold">Motivo:</label>
                        <textarea id="txtMotivoAmpliacion" class="form-control" rows="5" placeholder="Ingrese el motivo..."></textarea>
                    </div>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-success btn-lg px-5" onclick="confirmarAmpliacion()">Ampliar</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function observarInstruccion() {
            var motivo = document.getElementById('txtMotivoObservacion').value;

            if (!motivo || motivo.trim() === '') {
                Swal.fire({
                    title: 'Atención',
                    text: 'Por favor ingrese el motivo de la observación.',
                    icon: 'warning',
                    confirmButtonText: 'Entendido'
                });
                return;
            }

            Swal.fire({
                title: '¿Confirmar observación?',
                text: '¿Está seguro de que desea observar esta instrucción?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#dc3545',
                cancelButtonColor: '#6c757d',
                confirmButtonText: 'Sí, observar',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    $('#modalRevisar').modal('hide');
                    Swal.fire({
                        title: '¡Observado!',
                        text: 'La instrucción ha sido observada correctamente.',
                        icon: 'success',
                        confirmButtonText: 'Entendido'
                    }).then(() => {
                        // Limpiar campo
                        document.getElementById('txtMotivoObservacion').value = '';
                    });
                }
            });
        }

        function confirmarAmpliacion() {
            var fecha = document.getElementById('txtFechaAmpliacion').value;
            var motivo = document.getElementById('txtMotivoAmpliacion').value.trim();

            if (!fecha) {
                Swal.fire({
                    title: 'Fecha requerida',
                    text: 'Por favor seleccione una fecha.',
                    icon: 'warning',
                    confirmButtonText: 'Entendido'
                });
                return;
            }

            if (motivo === '') {
                Swal.fire({
                    title: 'Motivo requerido',
                    text: 'Por favor ingrese el motivo de la ampliación.',
                    icon: 'warning',
                    confirmButtonText: 'Entendido'
                });
                return;
            }

            $('#modalAmpliarFecha').modal('hide');

            Swal.fire({
                title: '¡Fecha ampliada!',
                text: 'La fecha límite ha sido ampliada correctamente.',
                icon: 'success',
                confirmButtonText: 'Entendido'
            }).then(() => {
                // Limpiar campos
                document.getElementById('txtFechaAmpliacion').value = '';
                document.getElementById('txtMotivoAmpliacion').value = '';
            });
        }

        // Cargar opciones del dropdown de Objetivo Estratégico al cargar la página
        window.addEventListener('DOMContentLoaded', function() {
            cargarOpcionesObjetivosEstrategicosPEE();
        });

        function cargarOpcionesObjetivosEstrategicosPEE() {
            var tabla = document.getElementById('<%= gvSeguimientoInstrucciones.ClientID %>');
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

        function filtrarTablaPEE() {
            var tabla = document.getElementById('<%= gvSeguimientoInstrucciones.ClientID %>');
            var filas = tabla.getElementsByTagName('tr');

            var filtroOE = document.getElementById('filtroObjetivoEstrategico').value.trim();
            var filtroAE = document.getElementById('filtroAccionEstrategica').value.toLowerCase();
            var filtroInd = document.getElementById('filtroIndicador').value.toLowerCase();
            var filtroResp = document.getElementById('filtroResponsablePEE').value.toLowerCase();
            var filtroEst = document.getElementById('filtroEstado').value.trim();

            for (var i = 1; i < filas.length; i++) {
                var celdas = filas[i].getElementsByTagName('td');
                if (celdas.length > 0) {
                    var textoOE = celdas[0].textContent.trim();
                    var textoAE = celdas[1].textContent.toLowerCase();
                    var textoInd = celdas[2].textContent.toLowerCase();
                    var textoResp = celdas[3].textContent.toLowerCase();
                    var textoEst = celdas[4].textContent.trim();

                    var mostrar = true;

                    if (filtroOE && textoOE !== filtroOE) mostrar = false;
                    if (filtroAE && textoAE.indexOf(filtroAE) === -1) mostrar = false;
                    if (filtroInd && textoInd.indexOf(filtroInd) === -1) mostrar = false;
                    if (filtroResp && textoResp.indexOf(filtroResp) === -1) mostrar = false;
                    if (filtroEst && textoEst !== filtroEst) mostrar = false;

                    filas[i].style.display = mostrar ? '' : 'none';
                }
            }
        }
    </script>
</asp:Content>