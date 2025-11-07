<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="masterContacto.ascx.cs" Inherits="UNIVidaNetPlanificacion.masterContacto" %>
<div class="modal fade" id="modalcontacto" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title" style="width: 100%; margin-left: 49px;">
                    <div style="width: 200px; display: block; margin: 0 auto 0 auto;">
                        <img src="<%= RutaDominio %>/Plugins/img/univida.png" alt="" class="img-responsive">
                    </div>
                </div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>

            </div>
            <div class="modal-body mb-4">
               
                <div class="container">
                    <div class="row mb-3">
                        <div class="col-md-12 contacto2 text-center">
                            <div class="otros">Para dudas y/o sugerencias contáctese con nosotros</div>
                        </div>
                    </div>
                    <div id="divContactos" runat="server"></div>

                </div>

            </div>
            <div >
                <img src="<%= RutaDominio %>/Plugins/img/linea.jpg" alt="" class="img-responsive" style="border-radius: 0px 0px 2px 2px;">
            </div>
        </div>
    </div>
</div>
