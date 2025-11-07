<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="wfReportePEE.aspx.cs" Inherits="UNIVidaNetPlanificacion.Modulos.ProgramacionPEE.wfReportePEE" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding: 20px;">
        <div style="margin-bottom: 20px;">
            <asp:Button ID="btnDescargarReportePDF" runat="server" 
                Text="Descargar Reporte PDF" 
                CssClass="btn btn-primary btn-lg" 
                OnClick="btnDescargarReportePDF_Click" />
        </div>
        
        <rsweb:reportviewer keepsessionalive="false"
        id="rptPEE"
        runat="server"
        height="600px"
        width="80%"
        asyncrendering="false"
        sizetoreportcontent="true"
        backcolor="white"
        bordercolor="#124c8c"
        borderstyle="solid">
    <localreport></localreport>
    </rsweb:reportviewer>
    </div>
</asp:Content>
