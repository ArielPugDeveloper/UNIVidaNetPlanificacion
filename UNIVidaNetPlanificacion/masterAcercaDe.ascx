<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="masterAcercaDe.ascx.cs" Inherits="UNIVidaNetPlanificacion.masterAcercaDe" %>

<div class="modal fade" id="modalacercade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Acerca de</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class=" m-4 text-center contacto2">
                    <div class="nombre">
                        UNIVidaNet es la Plataforma Informática Única de UNIVida.
                    </div>
                </div>
            </div>
            <div>
                <img src="<%= RutaDominio %>/Plugins/img/linea.jpg" alt="" class="img-responsive" style="border-radius: 0px 0px 2px 2px;">
            </div>
        </div>
    </div>
</div>
