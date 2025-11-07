<%@ Page Title="Formulario del Comprometido" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="wfFormularioComprometido.aspx.cs" Inherits="UNIVidaNetPresupuestos.Modulos.EjecucionPresupuestaria.FormularioComprometido.wfFormularioComprometido" %>


<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField runat="server" ID="HfTUnidadEjecutoraFk" />
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <%-- <h2>Formato de reporte</h2>--%>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="/UNIVidaNetPresupuestos/Default"><em class="fa fa-home"></em>Inicio</a></li>
                        <li class="breadcrumb-item active"><strong>FORMULARIO DE REGISTRO DEL COMPROMETIDO</strong></li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>
    <section class="content mb-5">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title"><em class="fa fa-clipboard"></em>FORMULARIO DE REGISTRO DEL COMPROMETIDO</h3>
                        </div>
                        <div class="card-body">
                            <div class="row justify-content-center">
                                <div class="col-lg-12 table-responsive">
                                    <div class="form-group row">
                                        <rsweb:ReportViewer ID="Report1" runat="server" Height="" Width="" AsyncRendering="false" SizeToReportContent="true" BackColor="White">
                                            <LocalReport ReportPath="Modulos\EjecucionPresupuestaria\FormularioComprometido\rptFormularioComprometido.rdlc">
                                            </LocalReport>
                                        </rsweb:ReportViewer>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class=" form-group col-md-12  align-center text-center">
                            <asp:LinkButton ID="lnkbtnVolver" runat="server" CssClass="btn btn-info  modoConsulta" OnClick="lnkbtnVolver_Click">
                                            <em class="fa fa-undo"></em> &nbsp; Volver </asp:LinkButton>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
            </div>
        </div>
    </section>
</asp:Content>


