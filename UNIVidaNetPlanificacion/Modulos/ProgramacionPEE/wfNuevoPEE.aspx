<%@ Page Title="Nuevo PEE" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="wfNuevoPEE.aspx.cs" Inherits="UNIVidaNetPlanificacion.Modulos.ProgramacionPEE.wfNuevoPEE" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="hfDatosIndicadoresCargar" runat="server" EnableViewState="true" />
    <asp:HiddenField ID="hfArchivoIndicadoresCargar" runat="server" EnableViewState="true" />
    <asp:HiddenField ID="hfGestionInicial" runat="server" EnableViewState="true" />
    <asp:HiddenField ID="hfGestionFinal" runat="server" EnableViewState="true" />
    
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h2>Plan Estratégico Empresarial - Nuevo Registro</h2>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item active"><a href="#">Inicio</a></li>
                        <li class="breadcrumb-item active">Programacion PEE</li>
                        <li class="breadcrumb-item active">Nuevo Registro</li>
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
            <!-- Labels de Gestión Inicial y Final -->
            <div class="row mb-3">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="font-weight-bold" style="color: #495057;">Gestión Inicial:</label>
                        <asp:Label ID="lblGestionInicial" runat="server" 
                            CssClass="form-control" 
                            Style="background-color: #e9ecef; border-radius: 5px; padding: 10px; font-size: 1rem;"
                            Text="" />
                    </div>
                        </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                        <label class="font-weight-bold" style="color: #495057;">Gestión Final:</label>
                        <asp:Label ID="lblGestionFinal" runat="server" 
                            CssClass="form-control" 
                            Style="background-color: #e9ecef; border-radius: 5px; padding: 10px; font-size: 1rem;"
                            Text="" />
                                            </div>
                                        </div>
                                    </div>

            <!-- Barra de acciones superior -->
            <div class="row mb-3">
                <div class="col-md-2">
                    <asp:Button ID="btnRegistrarPEE" runat="server" 
                        Text="Registrar PEE" 
                        CssClass="btn btn-success" 
                        OnClick="btnRegistrarPEE_Click" />
                </div>
                <div class="col-md-10">
                    <div class="d-flex align-items-center justify-content-end">
                        <asp:Button ID="btnGuardar" runat="server" 
                            Text="Guardar Cambios" 
                            CssClass="btn btn-success mr-3" 
                            OnClick="btnGuardar_Click"
                            OnClientClick="return verificarCambiosAntesDeGuardar();" />
                        
                        <div class="d-flex align-items-center">
                            <label class="mb-0 mr-2 font-weight-bold">Cambios:</label>
                            <input type="text" id="txtPorcentajeCambio" class="form-control form-control-sm text-center" 
                                style="width: 80px; font-weight: bold;" readonly />
                            <span class="ml-1">%</span>
                        </div>
                        
                        <div class="d-flex align-items-center ml-4">
                            <label class="mb-0 mr-2 font-weight-bold">Límite:</label>
                            <input type="text" id="txtLimitePorcentaje" class="form-control form-control-sm text-center" 
                                value="20" style="width: 60px; font-weight: bold;" onchange="actualizarEstadoBoton();" />
                            <span class="ml-1">%</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

            <div class="row mb-3">
                <div class="col-md-2">
                    <button type="button" class="btn btn-warning" onclick="$('#modalCargarOtroPEE').modal('show');">
                        <i class="fas fa-upload"></i> Cargar otro PEE
                    </button>
                                            </div>
                <div class="col-md-10">
                    <div class="d-flex align-items-center justify-content-end">
                        <button type="button" class="btn btn-secondary" onclick="limpiarFiltros()" title="Limpiar filtros">
                            <i class="fas fa-eraser"></i> Limpiar Filtros
                        </button>
                                    </div>
                                </div>
                            </div>

            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <asp:GridView ID="gvIndicadores" runat="server" 
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
                                                <input type="text" id="filtroPerspectiva" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTabla()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Perspectiva</div>
                                            </HeaderTemplate>
                                            <HeaderStyle Width="130px" />
                                            <ItemStyle Width="130px" />
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtPerspectiva" runat="server" 
                                                    Text='<%# Eval("Perspectiva") %>' 
                                                    TextMode="MultiLine"
                                                    Rows="1"
                                                    style="width: 100%; border: none; padding: 8px; background: transparent; outline: none; resize: none; overflow: hidden;" 
                                                    oninput="this.style.height='auto'; this.style.height=this.scrollHeight+'px';" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <select id="filtroObjetivos" class="form-control form-control-sm" onchange="filtrarTabla()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;">
                                                    <option value="">Todos</option>
                                                </select>
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Objetivo Estratégico</div>
                                            </HeaderTemplate>
                                            <HeaderStyle Width="150px" />
                                            <ItemStyle Width="150px" />
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtObjetivosEstrategicos" runat="server" 
                                                    Text='<%# Eval("ObjetivosEstrategicos") %>' 
                                                    TextMode="MultiLine"
                                                    Rows="1"
                                                    style="width: 100%; border: none; padding: 8px; background: transparent; outline: none; resize: none; overflow: hidden;" 
                                                    oninput="this.style.height='auto'; this.style.height=this.scrollHeight+'px';" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroAcciones" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTabla()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Acción Estratégica</div>
                                            </HeaderTemplate>
                                            <HeaderStyle Width="150px" />
                                            <ItemStyle Width="150px" />
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtAccionesEstrategicas" runat="server" 
                                                    Text='<%# Eval("AccionesEstrategicas") %>' 
                                                    TextMode="MultiLine"
                                                    Rows="1"
                                                    style="width: 100%; border: none; padding: 8px; background: transparent; outline: none; resize: none; overflow: hidden;" 
                                                    oninput="this.style.height='auto'; this.style.height=this.scrollHeight+'px';" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroResultado" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTabla()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Resultado</div>
                                            </HeaderTemplate>
                                            <HeaderStyle Width="140px" />
                                            <ItemStyle Width="140px" />
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtResultado" runat="server" 
                                                    Text='<%# Eval("Resultado") %>' 
                                                    TextMode="MultiLine"
                                                    Rows="1"
                                                    style="width: 100%; border: none; padding: 8px; background: transparent; outline: none; resize: none; overflow: hidden;" 
                                                    oninput="this.style.height='auto'; this.style.height=this.scrollHeight+'px';" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroLineaBase" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTabla()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Línea Base</div>
                                            </HeaderTemplate>
                                            <HeaderStyle Width="80px" />
                                            <ItemStyle Width="80px" />
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtLineaBase" runat="server" 
                                                    Text='<%# Eval("LineaBase") %>' 
                                                    style="width: 100%; border: none; padding: 8px; background: transparent; outline: none;" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroIndicador" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTabla()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Indicador</div>
                                            </HeaderTemplate>
                                            <HeaderStyle Width="130px" />
                                            <ItemStyle Width="130px" />
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtIndicador" runat="server" 
                                                    Text='<%# Eval("Indicador") %>' 
                                                    TextMode="MultiLine"
                                                    Rows="1"
                                                    style="width: 100%; border: none; padding: 8px; background: transparent; outline: none; resize: none; overflow: hidden;" 
                                                    oninput="this.style.height='auto'; this.style.height=this.scrollHeight+'px';" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroMeta1" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTabla()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Meta 1</div>
                                            </HeaderTemplate>
                                            <HeaderStyle Width="80px" />
                                            <ItemStyle Width="80px" />
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtMeta1" runat="server" 
                                                    Text='<%# Eval("Meta1") %>' 
                                                    style="width: 100%; border: none; padding: 8px; background: transparent; outline: none;" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroMeta2" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTabla()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Meta 2</div>
                                            </HeaderTemplate>
                                            <HeaderStyle Width="80px" />
                                            <ItemStyle Width="80px" />
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtMeta2" runat="server" 
                                                    Text='<%# Eval("Meta2") %>' 
                                                    style="width: 100%; border: none; padding: 8px; background: transparent; outline: none;" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroMeta3" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTabla()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Meta 3</div>
                                            </HeaderTemplate>
                                            <HeaderStyle Width="80px" />
                                            <ItemStyle Width="80px" />
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtMeta3" runat="server" 
                                                    Text='<%# Eval("Meta3") %>' 
                                                    style="width: 100%; border: none; padding: 8px; background: transparent; outline: none;" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroMeta4" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTabla()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Meta 4</div>
                                            </HeaderTemplate>
                                            <HeaderStyle Width="80px" />
                                            <ItemStyle Width="80px" />
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtMeta4" runat="server" 
                                                    Text='<%# Eval("Meta4") %>' 
                                                    style="width: 100%; border: none; padding: 8px; background: transparent; outline: none;" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroMeta5" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTabla()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Meta 5</div>
                                            </HeaderTemplate>
                                            <HeaderStyle Width="80px" />
                                            <ItemStyle Width="80px" />
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtMeta5" runat="server" 
                                                    Text='<%# Eval("Meta5") %>' 
                                                    style="width: 100%; border: none; padding: 8px; background: transparent; outline: none;" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroMeta" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTabla()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Meta</div>
                                            </HeaderTemplate>
                                            <HeaderStyle Width="130px" />
                                            <ItemStyle Width="130px" />
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtMeta" runat="server" 
                                                    Text='<%# Eval("Meta") %>' 
                                                    TextMode="MultiLine"
                                                    Rows="1"
                                                    style="width: 100%; border: none; padding: 8px; background: transparent; outline: none; resize: none; overflow: hidden;" 
                                                    oninput="this.style.height='auto'; this.style.height=this.scrollHeight+'px';" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="text" id="filtroResponsable" class="form-control form-control-sm" placeholder="Filtrar..." onkeyup="filtrarTabla()" style="margin: 0; border: none; border-radius: 0; margin-bottom: 5px;" />
                                                <div style="padding: 8px; text-align: center; font-weight: bold;">Responsable PEE</div>
                                            </HeaderTemplate>
                                            <HeaderStyle Width="140px" />
                                            <ItemStyle Width="140px" />
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtResponsablePEE" runat="server" 
                                                    Text='<%# Eval("Responsable PEE") %>' 
                                                    style="width: 100%; border: none; padding: 8px; background: transparent; outline: none;" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </section>

    <!-- Modal para Guardar y Enviar PEE -->
    <div class="modal fade" id="modalEnviarPEE" tabindex="-1" role="dialog" aria-labelledby="modalEnviarPEELabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalEnviarPEELabel">Guardar el Registro PEE</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body text-center py-4">
                    <p class="mb-3" style="font-size: 1.05rem;">
                        ¿Está seguro que quiere guardar el registro oficialmente sin opción a sobreescribir un nuevo PEE? 
                        Se enviará una notificación a todos los responsables PEE.
                    </p>
                    <p class="text-muted mb-4" style="font-size: 0.95rem;">
                        <strong>Nota:</strong> Aún tendrá opción de modificar el registro manualmente en sistema pero con restricciones.
                    </p>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-success btn-lg px-5" onclick="confirmarEnvio()">
                        Sí, estoy seguro
                    </button>
                    </div>
                            </div>
                        </div>
                    </div>

    <!-- Modal para Cargar otro PEE -->
    <!-- Modal para Cargar otro PEE -->
    <div class="modal fade" id="modalCargarOtroPEE" tabindex="-1" role="dialog" aria-labelledby="modalCargarOtroPEELabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalCargarOtroPEELabel">Plan Estratégico Empresarial - Cargar Otro PEE</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Cargar Otro PEE</h3>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <!-- Sección Gestiones -->
                                <div class="col-md-6">
                    <div class="form-group">
                                        <label>Gestión Inicial:</label>
                                        <input type="text" id="txtGestionInicialCargar" class="form-control" value="2026" 
                                            maxlength="4"
                                            onkeypress="return soloNumerosCargar(event)" 
                                            onpaste="return false" 
                                            oninput="this.value = this.value.replace(/[^0-9]/g, '').substring(0, 4); validarFormularioCargar();" 
                                            onblur="validarFormularioCargar();" />
                    </div>
                    
                    <div class="form-group">
                                        <label>Gestión Final:</label>
                                        <input type="text" id="txtGestionFinalCargar" class="form-control" value="2030" 
                                            maxlength="4"
                                            onkeypress="return soloNumerosCargar(event)" 
                                            onpaste="return false" 
                                            oninput="this.value = this.value.replace(/[^0-9]/g, '').substring(0, 4); validarFormularioCargar();" 
                                            onblur="validarFormularioCargar();" />
                                    </div>
                                </div>

                                <!-- Sección Cargar indicadores -->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Cargar indicadores:</label>
                                        <asp:FileUpload ID="fuArchivoSobrescribirPEE" runat="server"
                                            CssClass="form-control" 
                                            accept=".xlsx,.xls" />
                                        <div class="mt-2">
                                            <button type="button" class="btn btn-success" onclick="descargarPlantillaPEE()">
                                                Descargar Plantilla
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <hr class="my-4">

                            <!-- Botón Cargar -->
                            <div class="row">
                                <div class="col-12 text-center">
                                    <asp:Button ID="btnCargarOtroPEE" runat="server" 
                                        CssClass="btn btn-success btn-lg" 
                                        Text="Cargar"
                                        OnClientClick="return guardarGestionesEnHiddenFields();"
                                        OnClick="btnCargarOtroPEE_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Auto-ajustar altura de TextBoxes al cargar la página
        window.addEventListener('DOMContentLoaded', function() {
            autoAjustarTextboxes();
            inicializarSistemaCambios();
        });

        function autoAjustarTextboxes() {
            const textboxes = document.querySelectorAll('textarea[style*="resize: none"]');
            textboxes.forEach(function(textbox) {
                textbox.style.height = 'auto';
                textbox.style.height = textbox.scrollHeight + 'px';
            });
        }

        // ===== SISTEMA CENTRALIZADO DE DETECCIÓN DE CAMBIOS =====
        
        function inicializarSistemaCambios() {
            // Guardar valores originales al cargar
            guardarValoresOriginales();
            
            // Inicializar detector de cambios
            inicializarDetectorCambios();
            
            // Actualizar porcentaje inicial
            actualizarPorcentajeCambio();
        }

        function guardarValoresOriginales() {
            const gridView = document.getElementById('<%= gvIndicadores.ClientID %>');
            const filas = gridView.querySelectorAll('tbody tr');
            
            filas.forEach(fila => {
                const textboxes = fila.querySelectorAll('textarea');
                textboxes.forEach(tb => {
                    // Guardar el valor original en el atributo data-original
                    tb.setAttribute('data-original', tb.value);
                });
            });
        }

        function inicializarDetectorCambios() {
            const gridView = document.getElementById('<%= gvIndicadores.ClientID %>');
            
            // Event delegation: escuchar en la tabla, no en cada casilla
            gridView.addEventListener('input', function(e) {
                if (e.target.tagName === 'TEXTAREA') {
                    detectarCambio(e.target);
                }
            });
        }

        function detectarCambio(textbox) {
            const valorOriginal = textbox.getAttribute('data-original') || '';
            const valorActual = textbox.value;
            
            if (valorOriginal !== valorActual) {
                // Campo modificado - resaltar visualmente
                textbox.style.backgroundColor = '#fff3cd'; // Amarillo suave
                textbox.style.borderLeft = '3px solid #ffc107'; // Borde amarillo
                textbox.style.borderRadius = '3px';
            } else {
                // Campo sin cambios - quitar resaltado
                textbox.style.backgroundColor = '';
                textbox.style.borderLeft = '';
                textbox.style.borderRadius = '';
            }
            
            // Actualizar porcentaje en tiempo real
            actualizarPorcentajeCambio();
        }

        function calcularCambiosTotales() {
            const gridView = document.getElementById('<%= gvIndicadores.ClientID %>');
            const textboxes = gridView.querySelectorAll('textarea');
            
            let totalCampos = 0;
            let camposModificados = 0;
            let detallesCambios = [];
            
            textboxes.forEach(tb => {
                totalCampos++;
                const original = tb.getAttribute('data-original') || '';
                const actual = tb.value;
                
                if (original !== actual) {
                    camposModificados++;
                    // Obtener el nombre del campo (ID del textbox)
                    const nombreCampo = tb.id.replace('txt', '').replace(/\d+/g, '');
                    detallesCambios.push({
                        campo: nombreCampo,
                        original: original.substring(0, 50) + (original.length > 50 ? '...' : ''),
                        actual: actual.substring(0, 50) + (actual.length > 50 ? '...' : '')
                    });
                }
            });
            
            const porcentajeCambio = Math.round((camposModificados / totalCampos) * 100);
            return { 
                total: totalCampos, 
                modificados: camposModificados, 
                porcentaje: porcentajeCambio,
                detalles: detallesCambios
            };
        }

        function limpiarResaltadoCambios() {
            const gridView = document.getElementById('<%= gvIndicadores.ClientID %>');
            const textboxes = gridView.querySelectorAll('textarea');
            
            textboxes.forEach(tb => {
                tb.style.backgroundColor = '';
                tb.style.borderLeft = '';
                tb.style.borderRadius = '';
            });
        }

        function actualizarPorcentajeCambio() {
            const cambios = calcularCambiosTotales();
            const txtPorcentaje = document.getElementById('txtPorcentajeCambio');
            
            if (txtPorcentaje) {
                txtPorcentaje.value = cambios.porcentaje;
                
                // Cambiar color según el porcentaje
                if (cambios.porcentaje > 20) {
                    txtPorcentaje.style.backgroundColor = '#f8d7da'; // Rojo suave
                    txtPorcentaje.style.color = '#721c24';
                } else if (cambios.porcentaje > 10) {
                    txtPorcentaje.style.backgroundColor = '#fff3cd'; // Amarillo suave
                    txtPorcentaje.style.color = '#856404';
                } else {
                    txtPorcentaje.style.backgroundColor = '#d4edda'; // Verde suave
                    txtPorcentaje.style.color = '#155724';
                }
            }
            
            // Actualizar estado del botón
            actualizarEstadoBoton();
        }

        function actualizarEstadoBoton() {
            const btnGuardar = document.getElementById('<%= btnGuardar.ClientID %>');
            const txtPorcentaje = document.getElementById('txtPorcentajeCambio');
            const txtLimite = document.getElementById('txtLimitePorcentaje');
            
            if (btnGuardar && txtPorcentaje && txtLimite) {
                const porcentajeActual = parseInt(txtPorcentaje.value) || 0;
                const limite = parseInt(txtLimite.value) || 20;
                
                if (porcentajeActual > limite) {
                    // Deshabilitar botón
                    btnGuardar.disabled = true;
                    btnGuardar.className = 'btn btn-secondary mr-3';
                    btnGuardar.title = `Cambios (${porcentajeActual}%) exceden el límite (${limite}%)`;
                } else {
                    // Habilitar botón
                    btnGuardar.disabled = false;
                    btnGuardar.className = 'btn btn-success mr-3';
                    btnGuardar.title = 'Guardar cambios';
                }
            }
        }

        function verificarCambiosAntesDeGuardar() {
            const cambios = calcularCambiosTotales();
            
            if (cambios.modificados === 0) {
                Swal.fire({
                    title: 'Sin cambios',
                    text: 'No se han detectado modificaciones en la tabla.',
                    icon: 'info',
                    confirmButtonText: 'Entendido'
                });
                return false; // No proceder con el guardado
            }
            
            // Mostrar resumen de cambios
            let mensaje = `Se han modificado ${cambios.modificados} de ${cambios.total} campos (${cambios.porcentaje}%)\n\n`;
            mensaje += '¿Desea guardar estos cambios?';
            
            Swal.fire({
                title: 'Confirmar guardado',
                text: mensaje,
                icon: 'question',
                showCancelButton: true,
                confirmButtonText: 'Sí, guardar',
                cancelButtonText: 'Cancelar',
                confirmButtonColor: '#28a745',
                cancelButtonColor: '#6c757d'
            }).then((result) => {
                if (result.isConfirmed) {
                    // Proceder con el guardado del servidor
                    __doPostBack('<%= btnGuardar.UniqueID %>', '');
                }
            });
            
            return false; // Prevenir el postback automático
        }

        function incrementar(textBoxId) {
            var textBox = document.getElementById(textBoxId);
            var valor = parseInt(textBox.value) || 0;
            textBox.value = valor + 1;
        }

        function decrementar(textBoxId) {
            var textBox = document.getElementById(textBoxId);
            var valor = parseInt(textBox.value) || 0;
            if (valor > 0) {
                textBox.value = valor - 1;
            }
        }

        function confirmarEnvio() {
            $('#modalEnviarPEE').modal('hide');
            Swal.fire({
                title: '¡Guardado y Enviado!',
                text: 'El registro PEE ha sido guardado oficialmente y se ha enviado la notificación a todos los responsables PEE.',
                icon: 'success',
                confirmButtonColor: '#28a745',
                confirmButtonText: 'Entendido'
            });
        }

        // Función para permitir solo números enteros (modal Cargar)
        function soloNumerosCargar(event) {
            var charCode = event.which ? event.which : event.keyCode;
            if (charCode >= 48 && charCode <= 57 || charCode == 8 || charCode == 9 || charCode == 27 || charCode == 13 || charCode == 46) {
                return true;
            } else {
                return false;
            }
        }

        // Función para validar el formulario del modal Cargar (opcional ahora)
        function validarFormularioCargar() {
            // La validación ahora se hace en el servidor
            // Esta función se mantiene para compatibilidad con eventos onchange
        }

        // Función para guardar las gestiones en HiddenFields antes del postback
        function guardarGestionesEnHiddenFields() {
            var gestionInicial = document.getElementById('txtGestionInicialCargar').value;
            var gestionFinal = document.getElementById('txtGestionFinalCargar').value;
            
            // Guardar en HiddenFields
            document.getElementById('<%= hfGestionInicial.ClientID %>').value = gestionInicial;
            document.getElementById('<%= hfGestionFinal.ClientID %>').value = gestionFinal;
            
            return true; // Permitir el postback
        }

        function descargarPlantillaPEE() {
            Swal.fire({
                title: 'Descargando...',
                text: 'La plantilla de Excel se está descargando.',
                icon: 'info',
                confirmButtonText: 'Entendido'
            });
        }

        // Validar al abrir el modal Cargar
        $('#modalCargarOtroPEE').on('shown.bs.modal', function () {
            validarFormularioCargar();
        });

        // Función para cargar las opciones únicas de Objetivos Estratégicos
        function cargarOpcionesObjetivos() {
            var tabla = document.getElementById('<%= gvIndicadores.ClientID %>');
            if (!tabla) return; // Si la tabla no existe, salir
            
            var filas = tabla.getElementsByTagName('tr');
            var objetivosUnicos = new Set();
            
            // Recorrer todas las filas (empezando desde 1 para saltar el header)
            for (var i = 1; i < filas.length; i++) {
                var fila = filas[i];
                if (fila.cells[1]) {
                    var textBox = fila.cells[1].querySelector('input[type="text"]');
                    var objetivo = textBox ? textBox.value.trim() : fila.cells[1].textContent.trim();
                    if (objetivo) {
                        objetivosUnicos.add(objetivo);
                    }
                }
            }
            
            // Llenar el dropdown con las opciones únicas
            var dropdown = document.getElementById('filtroObjetivos');
            if (!dropdown) return; // Si el dropdown no existe, salir
            
            // Limpiar opciones existentes (excepto "Todos")
            while (dropdown.options.length > 1) {
                dropdown.remove(1);
            }
            
            // Agregar las opciones únicas ordenadas
            var objetivosArray = Array.from(objetivosUnicos).sort();
            objetivosArray.forEach(function(objetivo) {
                var option = document.createElement('option');
                option.value = objetivo;
                option.text = objetivo;
                dropdown.add(option);
            });
        }
        
        function filtrarTabla() {
            var tabla = document.getElementById('<%= gvIndicadores.ClientID %>');
            var filas = tabla.getElementsByTagName('tr');
            
            // Obtener valores de todos los filtros
            var filtros = {
                perspectiva: document.getElementById('filtroPerspectiva').value.toLowerCase(),
                objetivos: document.getElementById('filtroObjetivos').value.trim(),
                acciones: document.getElementById('filtroAcciones').value.toLowerCase(),
                resultado: document.getElementById('filtroResultado').value.toLowerCase(),
                lineaBase: document.getElementById('filtroLineaBase').value.toLowerCase(),
                indicador: document.getElementById('filtroIndicador').value.toLowerCase(),
                meta1: document.getElementById('filtroMeta1').value.toLowerCase(),
                meta2: document.getElementById('filtroMeta2').value.toLowerCase(),
                meta3: document.getElementById('filtroMeta3').value.toLowerCase(),
                meta4: document.getElementById('filtroMeta4').value.toLowerCase(),
                meta5: document.getElementById('filtroMeta5').value.toLowerCase(),
                meta: document.getElementById('filtroMeta').value.toLowerCase(),
                responsable: document.getElementById('filtroResponsable').value.toLowerCase()
            };
            
            // Recorrer todas las filas (empezando desde 1 para saltar el header)
            for (var i = 1; i < filas.length; i++) {
                var fila = filas[i];
                var mostrar = true;
                
                // Función auxiliar para obtener el valor de un TextBox
                function obtenerValorTextBox(celda) {
                    var textBox = celda.querySelector('input[type="text"]');
                    return textBox ? textBox.value : celda.textContent;
                }
                
                // Verificar cada filtro
                if (filtros.perspectiva && fila.cells[0] && !obtenerValorTextBox(fila.cells[0]).toLowerCase().includes(filtros.perspectiva)) {
                    mostrar = false;
                }
                // Filtro de objetivos usa comparación exacta
                if (mostrar && filtros.objetivos && fila.cells[1] && obtenerValorTextBox(fila.cells[1]).trim() !== filtros.objetivos) {
                    mostrar = false;
                }
                if (mostrar && filtros.acciones && fila.cells[2] && !obtenerValorTextBox(fila.cells[2]).toLowerCase().includes(filtros.acciones)) {
                    mostrar = false;
                }
                if (mostrar && filtros.resultado && fila.cells[3] && !obtenerValorTextBox(fila.cells[3]).toLowerCase().includes(filtros.resultado)) {
                    mostrar = false;
                }
                if (mostrar && filtros.lineaBase && fila.cells[4] && !obtenerValorTextBox(fila.cells[4]).toLowerCase().includes(filtros.lineaBase)) {
                    mostrar = false;
                }
                if (mostrar && filtros.indicador && fila.cells[5] && !obtenerValorTextBox(fila.cells[5]).toLowerCase().includes(filtros.indicador)) {
                    mostrar = false;
                }
                if (mostrar && filtros.meta1 && fila.cells[6] && !obtenerValorTextBox(fila.cells[6]).toLowerCase().includes(filtros.meta1)) {
                    mostrar = false;
                }
                if (mostrar && filtros.meta2 && fila.cells[7] && !obtenerValorTextBox(fila.cells[7]).toLowerCase().includes(filtros.meta2)) {
                    mostrar = false;
                }
                if (mostrar && filtros.meta3 && fila.cells[8] && !obtenerValorTextBox(fila.cells[8]).toLowerCase().includes(filtros.meta3)) {
                    mostrar = false;
                }
                if (mostrar && filtros.meta4 && fila.cells[9] && !obtenerValorTextBox(fila.cells[9]).toLowerCase().includes(filtros.meta4)) {
                    mostrar = false;
                }
                if (mostrar && filtros.meta5 && fila.cells[10] && !obtenerValorTextBox(fila.cells[10]).toLowerCase().includes(filtros.meta5)) {
                    mostrar = false;
                }
                if (mostrar && filtros.meta && fila.cells[11] && !obtenerValorTextBox(fila.cells[11]).toLowerCase().includes(filtros.meta)) {
                    mostrar = false;
                }
                if (mostrar && filtros.responsable && fila.cells[12] && !obtenerValorTextBox(fila.cells[12]).toLowerCase().includes(filtros.responsable)) {
                    mostrar = false;
                }
                
                // Mostrar u ocultar la fila
                fila.style.display = mostrar ? '' : 'none';
            }
        }
        
        function limpiarFiltros() {
            // Limpiar todos los campos de filtro
            document.getElementById('filtroPerspectiva').value = '';
            document.getElementById('filtroObjetivos').value = '';
            document.getElementById('filtroAcciones').value = '';
            document.getElementById('filtroResultado').value = '';
            document.getElementById('filtroLineaBase').value = '';
            document.getElementById('filtroIndicador').value = '';
            document.getElementById('filtroMeta1').value = '';
            document.getElementById('filtroMeta2').value = '';
            document.getElementById('filtroMeta3').value = '';
            document.getElementById('filtroMeta4').value = '';
            document.getElementById('filtroMeta5').value = '';
            document.getElementById('filtroMeta').value = '';
            document.getElementById('filtroResponsable').value = '';
            
            // Mostrar todas las filas
            filtrarTabla();
        }
        
        // Cargar las opciones del dropdown cuando la página termine de cargar
        document.addEventListener('DOMContentLoaded', function() {
            cargarOpcionesObjetivos();
        });
    </script>
</asp:Content>