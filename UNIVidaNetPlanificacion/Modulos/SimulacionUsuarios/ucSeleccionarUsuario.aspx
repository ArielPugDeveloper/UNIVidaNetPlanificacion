<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucSeleccionarUsuario.ascx.cs" Inherits="UNIVidaNetPlanificacion.Modulos.SimulacionUsuarios.ucSeleccionarUsuario" %>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Simulación de Usuarios</h1>
                    </div>
                </div>
            </div>
        </section>

        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">Seleccionar Usuario para Simular</h3>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <!-- PLANIFICADOR -->
                                    <div class="col-lg-4 col-md-6 mb-4">
                                        <div class="card card-primary h-100">
                                            <div class="card-header">
                                                <h3 class="card-title">PLANIFICADOR</h3>
                                            </div>
                                            <div class="card-body text-center">
                                                <i class="fas fa-user-tie fa-3x text-primary mb-3"></i>
                                                <h4>Juan Carlos Planificador</h4>
                                                <p class="text-muted">Acceso completo al sistema</p>
                                                <asp:Button ID="btnPlanificador" runat="server" 
                                                    Text="Iniciar como Planificador" 
                                                    CssClass="btn btn-primary btn-block" 
                                                    OnClick="btnPlanificador_Click" />
                                            </div>
                                        </div>
                                    </div>

                                    <!-- ENCARGADOS RESPONSABLES -->
                                    <div class="col-lg-4 col-md-6 mb-4">
                                        <div class="card card-success h-100">
                                            <div class="card-header">
                                                <h3 class="card-title">ENCARGADOS RESPONSABLES</h3>
                                            </div>
                                            <div class="card-body">
                                                <div class="mb-3">
                                                    <h5>GNTI</h5>
                                                    <p class="text-muted">Área: GNTI</p>
                                                    <asp:Button ID="btnEncargado1" runat="server" 
                                                        Text="Iniciar como GNTI" 
                                                        CssClass="btn btn-success btn-sm btn-block" 
                                                        OnClick="btnEncargado1_Click" />
                                                </div>
                                                <div>
                                                    <h5>GNC</h5>
                                                    <p class="text-muted">Área: GNC</p>
                                                    <asp:Button ID="btnEncargado2" runat="server" 
                                                        Text="Iniciar como GNC" 
                                                        CssClass="btn btn-success btn-sm btn-block" 
                                                        OnClick="btnEncargado2_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- DEPENDIENTES -->
                                    <div class="col-lg-4 col-md-12 mb-4">
                                        <div class="card card-warning h-100">
                                            <div class="card-header">
                                                <h3 class="card-title">DEPENDIENTES</h3>
                                            </div>
                                            <div class="card-body">
                                                <div class="mb-3">
                                                    <h5>JNDS</h5>
                                                    <p class="text-muted">Dependiente de: GNTI</p>
                                                    <asp:Button ID="btnDependiente1" runat="server" 
                                                        Text="Iniciar como JNDS" 
                                                        CssClass="btn btn-warning btn-sm btn-block" 
                                                        OnClick="btnDependiente1_Click" />
                                                </div>
                                                <div class="mb-3">
                                                    <h5>JNIR</h5>
                                                    <p class="text-muted">Dependiente de: GNTI</p>
                                                    <asp:Button ID="btnDependiente2" runat="server" 
                                                        Text="Iniciar como JNIR" 
                                                        CssClass="btn btn-warning btn-sm btn-block" 
                                                        OnClick="btnDependiente2_Click" />
                                                </div>
                                                <div class="mb-3">
                                                    <h5>JNV</h5>
                                                    <p class="text-muted">Dependiente de: GNC</p>
                                                    <asp:Button ID="btnDependiente3" runat="server" 
                                                        Text="Iniciar como JNV" 
                                                        CssClass="btn btn-warning btn-sm btn-block" 
                                                        OnClick="btnDependiente3_Click" />
                                                </div>
                                                <div>
                                                    <h5>JNMR</h5>
                                                    <p class="text-muted">Dependiente de: GNC</p>
                                                    <asp:Button ID="btnDependiente4" runat="server" 
                                                        Text="Iniciar como JNMR" 
                                                        CssClass="btn btn-warning btn-sm btn-block" 
                                                        OnClick="btnDependiente4_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>