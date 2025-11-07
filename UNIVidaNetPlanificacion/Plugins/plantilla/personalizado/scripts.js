//inicializacion de plugins admin lte y propios UNIVida
//LCHAVEZ
$(document).ready(function () {

    habilitarEntradaConCalendario();
    habilitarEntradaConRangoDeFechas();
    habilitarEntradaConRangoDeFechasHora();
    habilitarFiltroEnDropDownList();
    mostrarAnimacionCargaAlRealizarAccionesConPostBack();
    ocultarAnimacionCargaAlRealizarAccionesSinPostBack();
    habilitarFiltrosYPagiancionALasTablas();
    habilitarInputFile();
    habilitarInputMask();
    gridViewEstiloSimple();
    mantenerModalAbierto();
});
function gridViewEstiloSimple() {
    $(".gridViewSimple").each(function () {
        var idTabla = $(this).attr('id');

        AgregarHeadTable(idTabla);
    });
}
function AgregarHeadTable(idTabla) {
    console.log(idTabla);
    idTabla = "#" + idTabla;
    console.log($(idTabla));
    var headTmp = $(idTabla).find('tbody').children('tr:first');
    console.log(headTmp);
    $(idTabla).find('tbody').children('tr:first').remove();
    var head = "<thead>" + $(headTmp).html() + "</thead>";
    $(idTabla).prepend(head);

}
function habilitarInputMask() {
    $('[data-mask]').inputmask();
}
function habilitarInputFile() {
    $(document).ready(function () {
        bsCustomFileInput.init();
    });
}
function habilitarEntradaConCalendario() {
    $.fn.datepicker.dates['es'] = {
        format: 'dd/mm/yyyy',
        firstDay: 1,
        days: ["Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"],
        daysShort: ["Dom", "Lun", "Mar", "Mié", "Jue", "Vie", "Sáb", "Dom"],
        daysMin: ["Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa", "Do"],
        months: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
        monthsShort: ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"],
        today: "Hoy"
    };
    $('.calendario').datepicker({
        language: "es",
        autoclose: true,
        orientation: 'bottom'
    });
}

function habilitarEntradaConRangoDeFechas() {
    $('.calendarioRango').daterangepicker({
        "locale": {
            'format': 'DD/MM/YYYY',
            'firstDay': 1,
            'daysOfWeek': ["Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa"],
            'monthNames': ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
            "applyLabel": "Aplicar",
            "cancelLabel": "Cancelar",
            "fromLabel": "Desde",
            "toLabel": "Hasta",
            "customRangeLabel": "Personalizar"
        }
    });
}
function habilitarEntradaConRangoDeFechasHora() {
    $('.calendarioFechaHoraRango').daterangepicker({
        timePicker: true,
        timePickerIncrement: 30,
        "locale": {
            'format': 'DD/MM/YYYY hh:mm A',
            'firstDay': 1,
            'daysOfWeek': ["Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa"],
            'monthNames': ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
            "applyLabel": "Aplicar",
            "cancelLabel": "Cancelar",
            "fromLabel": "Desde",
            "toLabel": "Hasta",
            "customRangeLabel": "Personalizar"
        }
    });
}
function habilitarFiltroEnDropDownList() {
    $(".selector").select2();
}

function obtenerBotonesParaExportacion(tabla) {
    return tabla.hasClass('exportarAExcel') ? [{
        extend: 'excelHtml5',
        text: 'Exportar a Excel',
        exportOptions: {
            columns: ':visible'
        }
    }, {
        extend: 'colvis',
        text: 'Columnas'
    }] : [];
}

function obtenerConfiguracionParaDataTables(configuracionDOM, tabla, paginacion = true) {
    const menuCantidadDeRegistros = [[10, 25, 50, 100, -1], [10, 25, 50, 100, "Todos"]];
    const lenguaje = {
        "decimal": "",
        "emptyTable": "No se han encontrado registros.",
        "info": "Mostrando _START_ a _END_ de _TOTAL_ registros",
        "infoEmpty": "Mostrando 0 a 0 de 0 registros",
        "infoFiltered": "(filtrados de _MAX_ registros totales)",
        "infoPostFix": "",
        "thousands": ",",
        "lengthMenu": "Mostrando _MENU_ registros",
        "loadingRecords": "Cargando...",
        "processing": "Procesando...",
        "search": "Buscar:",
        "zeroRecords": "No existen registros para los parámetros de búsqueda.",
        "paginate": {
            "first": "Primero",
            "last": "Último",
            "next": "Siguiente",
            "previous": "Anterior"
        }
    };
    return {
        dom: configuracionDOM,
        orderCellsTop: true,
        language: lenguaje,
        stateSave: true,
        order: [],
        paging: paginacion,
        lengthMenu: menuCantidadDeRegistros,
        buttons: obtenerBotonesParaExportacion(tabla)
    };
}

function habilitarFiltrosYPagiancionALasTablas() {
    var busquedaPorColumnas = function () {
        var contexto = this;
        $('.busqueda-por-columnas', this.header().parentNode.parentNode.childNodes[1].childNodes[this.header().cellIndex]).on('keyup change', function () {
            if (contexto.search() !== this.value) {
                contexto.search(this.value).draw();
            }
        });
    };

    $('<thead></thead>').prependTo('.aplicarFiltrosYPaginacion[id*=gv]').append($('.aplicarFiltrosYPaginacion[id*=gv] tr:lt(2)'));
    $('.aplicarFiltrosYPaginacion[id*=gv]').DataTable(obtenerConfiguracionParaDataTables("<'row buttonsExport'<'col-md-12'<'pull-right'B>>><'row'<'col-sm-12'tr>><'row paginacion-tabla'<'col-sm-5'l><'col-sm-7'p>>",
        $('.aplicarFiltrosYPaginacion[id*=gv]'))).columns().every(busquedaPorColumnas);
    $('<thead></thead>').prependTo('.aplicarFiltros[id*=gv]').append($('.aplicarFiltros[id*=gv] tr:lt(2)'));
    $('.aplicarFiltros[id*=gv]').DataTable(obtenerConfiguracionParaDataTables("<'row buttonsExport'<'col-md-12'<'pull-right'B>>><'row'<'col-sm-12'tr>>",
        $('.aplicarFiltros[id*=gv]'), false)).columns().every(busquedaPorColumnas);
    $('<thead></thead>').prependTo('.aplicarPaginacion[id*=gv]').append($('.aplicarPaginacion[id*=gv] tr:first'));
    $('.aplicarPaginacion[id*=gv]').DataTable(obtenerConfiguracionParaDataTables("<'row buttonsExport'<'col-md-12'<'pull-right'B>>><'row'<'col-sm-12'tr>><'row paginacion-tabla'<'col-sm-5'l><'col-sm-7'p>>",
        $('.aplicarPaginacion[id*=gv]'))).columns().every(busquedaPorColumnas);
    $('div.dataTables_length select').addClass('form-control form-control-sm select-paginacion-custom');
    $('.input-busqueda').addClass('form-control-sm');
}

function mostrarAnimacionCargaAlRealizarAccionesConPostBack() {
    $(window).on('beforeunload', function () {
        mostrarCargando();
    });
}

function ocultarAnimacionCargaAlRealizarAccionesSinPostBack() {
    $(".btnDescargar").on("click", function () {
        setTimeout(function () {
            ocultarCargando();
        }, 1000);
    });
}

function _SweetAlert(titulo, texto, tipo, url, cerrar, funcionDespuesDeConfirmar) {

    window.onload = function () {
        if (typeof history.pushState === "function") {
            history.pushState("jibberish", null, null);
            window.onpopstate = function () {
                history.pushState('newjibberish', null, null);
            };
        }
        else {
            var ignoreHashChange = true;
            window.onhashchange = function () {
                if (!ignoreHashChange) {
                    ignoreHashChange = true;
                    window.location.hash = Math.random();
                }
                else {
                    ignoreHashChange = false;
                }
            };
        }
    };
    Swal.fire({
        title: titulo,
        text: texto,
        type: tipo,
        showCancelButton: funcionDespuesDeConfirmar !== "" && funcionDespuesDeConfirmar,
        //confirmButtonColor: '#00a65a',
        confirmButtonText: 'Aceptar',
        cancelButtonText: 'Cancelar',
        cancelButtonColor: '#124c8c',
        allowOutsideClick: cerrar === 'true',
        allowEscapeKey: cerrar === 'true'
    }).then((result) => {
        if (result.value) {
            if (url !== "") {
                window.location.href = url;
                mostrarCargando();
            }
            if (funcionDespuesDeConfirmar !== "" && funcionDespuesDeConfirmar) {
                window[funcionDespuesDeConfirmar]("");
                mostrarCargando();
            }

        }
    });
}

function returnAjax(url, objetoParametros, OnSuccess, loading = true) {
    if (loading) {
        mostrarCargando(false);
    }
    $.ajax({
        type: 'POST',
        url: url,
        data: JSON.stringify(objetoParametros),
        dataType: 'json',
        contentType: "application/json; charset=utf-8",
        success: function (response) {
            ocultarCargando();
            OnSuccess(response);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(jqXHR);
            if (jqXHR.status === "401") {
                swal({
                    title: 'Atencion!',
                    text: "Su sesion finalizo, por favor inicie sesion para continuar",
                    type: 'warning',
                    allowOutsideClick: false
                }, function (resultado) {
                    if (resultado) {
                        location.reload();
                    }
                });
            }
            else {
                swal({
                    title: 'Error!',
                    text: errorThrown + ', ' + jqXHR.responseJSON.Message,
                    type: 'error',
                    allowOutsideClick: false
                });
            }
            ocultarCargando();
        }
    });
}

function mostrarCargando(validacion = true) {
    var customElement = `
        <div class="loading-screen-wrapper">
            <div class="loading-screen-icon">
             
               <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="margin: auto; ; display: block;" width="120px" height="120px" viewBox="0 0 100 100" preserveAspectRatio="xMidYMid">
                    <g transform="rotate(24.8821 50 50)">
                        <path d="M95 50 A45 45 0 0 1 63.905764746872634 92.79754323328191" fill="none" stroke="#c70e29" stroke-width="3"></path>
                        <path d="M63.905764746872634 92.79754323328191 A45 45 0 0 1 13.594235253127373 76.4503363531613" fill="none" stroke="#0860a8" stroke-width="3"></path>
                        <path d="M13.594235253127373 76.4503363531613 A45 45 0 0 1 13.594235253127366 23.549663646838713" fill="none" stroke="#017042" stroke-width="3"></path>
                        <path d="M13.594235253127366 23.549663646838713 A45 45 0 0 1 63.90576474687263 7.202456766718086" fill="none" stroke="#ffdd00" stroke-width="3"></path>
                        <path d="M63.90576474687263 7.202456766718086 A45 45 0 0 1 95 49.999999999999986" fill="none" stroke="#f58220" stroke-width="3"></path>
                        <animateTransform attributeName="transform" type="rotate" values="0 50 50;360 50 50" times="0;1" dur="1s" repeatCount="indefinite"></animateTransform>
                    </g>
                </svg>
                <div class="text-center">
                    <div style="margin-top: -65px;margin-bottom: 40px;">
                         <div class="imgLoading"></div>
                    </div>
                    <div style="color: #005395"><b>Estamos procesando su solicitud.</b></div>
                    <div style="color: #c81f3c"><b>Espere un momento por favor.</b></div>
                </div>
            </div>
        </div>
        `;
    if (validacion) {
        if (Page_IsValid) {
            $("body").LoadingOverlay("show", {
                size: 10,
                image: "",
                custom: customElement
            });
        }
    }
    else {
        $("body").LoadingOverlay("show", {
            size: 10,
            image: "",
            custom: customElement
        });
    }
}

function ocultarCargando() {
    $("body").LoadingOverlay("hide");
}

function eliminarAlmacenamientoLocal() {
    Object.keys(localStorage).forEach(function (key) {
        localStorage.removeItem(key);
    });
}

function swalConfirmarBack(texto, funcionAceptar) {
    const funcion = () => {
        __doPostBack(funcionAceptar);
    };
    SwalConfirmar(texto, funcion);
}
function swalEventoBack(titulo, texto, tipo, funcionAceptar, txtbtnConfirmar, txtbtnCancelar) {
    const funcion = () => {
        __doPostBack(funcionAceptar);
    };
    SwalAceptarCancelar(texto, funcion, titulo, tipo, txtbtnConfirmar, txtbtnCancelar, false);
}
function SwalAceptarCancelar(texto, funcionAceptar, titulo = "", tipo = "", txtbtnConfirmar = "Si, continuar", txtbtnCancelar = "Cancelar", html = "true") {
    Swal.fire({
        title: titulo,
        text: texto,
        html: html ? '<div class="alert alert-success">' + texto + '</div>' : texto,
        type: tipo,
        showCancelButton: true,
        confirmButtonColor: '#00a65a',
        cancelButtonColor: '#124c8c',
        confirmButtonText: txtbtnConfirmar,
        cancelButtonText: txtbtnCancelar,
        allowOutsideClick: false

    }).then((result) => {
        if (result.value) {
            if (funcionAceptar !== "" && funcionAceptar) {
                funcionAceptar();
            }

        }
    });
}

function SwalConfirmar(texto, funcion) {
    SwalAceptarCancelar(texto, funcion, "", "question", "Si, continuar", "Cancelar", false);
}
function SwalAtencion(texto) {
    Swal.fire({
        title: 'Atención',
        text: texto,
        type: "warning",
        allowOutsideClick: false
    });
}
function SwalCorrecto(texto) {
    Swal.fire({
        title: 'Correcto',
        text: texto,
        type: "success",
        allowOutsideClick: false
    });
}
function SwalError(texto) {
    Swal.fire({
        title: 'Error',
        text: texto,
        type: "error",
        allowOutsideClick: false
    });
}
function ToastCorrecto(mensaje) {
    const Toast = Swal.mixin({
        toast: true,
        position: 'top',
        showConfirmButton: false,
        timer: 7000
    });

    Toast.fire({
        type: 'success',
        title: mensaje
    });
}

function mantenerModalAbierto() {
    var session = "modalRegistro";
    const datos = sessionStorage.getItem(session);   
    if (datos) {
        datosArray = JSON.parse(datos);
        datosArray.forEach(md => {
            if ($("#" + md).hasClass("modal")) {
                $("#" + md).removeClass("fade");
                $("#" + md).modal("show");
            }
        });
    }   
}
function registrarModal(idModal) {
    var session = "modalRegistro";
    const datos = sessionStorage.getItem(session);    
    var datosArray = new Array();
    if (datos) {    
        datosArray = JSON.parse(datos);       
    }
    datosArray.push(idModal);
    sessionStorage.setItem(session, JSON.stringify(datosArray));
}
function quitarRegistroModal(idModal) {
    var session = "modalRegistro";
    const datos = sessionStorage.getItem(session);
    var datosArray = new Array();
    if (datos) {

        datosArray = JSON.parse(datos);
        datosArray = datosArray.filter(e => e !== idModal);
        sessionStorage.setItem(session, JSON.stringify(datosArray));  
    }    
}
$(document).ready(function () {
    $('.modal').on('hide.bs.modal', function (e) {
        quitarRegistroModal(this.id);
    });
    $('.fulAdjunto').change(function () {
        document.getElementById("MainContent_btnAdjunto").click();
    });   
    $("#MuestraPass").mousedown(function () {
        $("#MainContent_txtContraseña").attr('type', 'text');
        $("#MuestraPass em").attr('class', 'fa fa-eye');
    });
    $("#MuestraPass").mouseup(function () {
        $("#MainContent_txtContraseña").attr('type', 'password');
        $("#MuestraPass em").attr('class', 'fa fa-eye-slash');
    });
});