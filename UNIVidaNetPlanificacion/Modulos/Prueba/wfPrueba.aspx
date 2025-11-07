<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="wfPrueba.aspx.cs" Inherits="UNIVidaNetPlanificacion.Modulos.Prueba.wfPrueba" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h2>Componentes personalizados</h2>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item active"><a href="#">Inicio</a></li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>
    <section class="content mb-5">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6">

                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">GridView con filtros</h3>
                        </div>
                        <div class="card-body">
                            <asp:GridView
                                ID="gvFiltros"
                                runat="server"
                                class="table aplicarFiltrosYPaginacion table-borderless table-striped table-sm table-hover"
                                AutoGenerateColumns="False">
                                <Columns>
                                    <asp:BoundField HeaderText="Apellido paterno" DataField="PerApellidoPaterno" />
                                    <asp:BoundField HeaderText="Apellido materno" DataField="PerApellidoMaterno" />
                                    <asp:BoundField HeaderText="Primer nombre" DataField="PerNombrePrimero" />
                                  
                                    <asp:BoundField HeaderText="Tipo documento" DataField="PerTParCliDocumentoIdentidadTipoAbreviacion" />

                                    <asp:BoundField HeaderText="Tipo cliente" DataField="CliTParCliClienteTipoDescripcion" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" />
                                    <asp:TemplateField ItemStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <div class="dropdown">
                                                <button class="btn btn-outline-secondary btn-sm dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    Opciones
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                    <asp:LinkButton class="dropdown-item" runat="server" ID="lnkVerCliente" CommandName="BtnVerCliente" CommandArgument="<%# ((GridViewRow)Container).RowIndex %>">
                                                        <i class="fad fa-user"></i> Ver cliente
                                                    </asp:LinkButton>

                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->

                </div>
                <!-- /.col (left) -->
                <div class="col-md-6">
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">GridView simple</h3>
                        </div>
                        <div class="card-body">

                            <asp:GridView
                                ID="gvSimple"
                                runat="server"
                                PageSize="2"
                                AllowPaging="true"
                                OnPageIndexChanging="gvSimple_PageIndexChanging"
                                class="table gridViewSimple table-borderless table-striped table-sm table-hover"
                                AutoGenerateColumns="False">
                                <PagerStyle CssClass="paginacion-simple" />
                                <Columns>
                                    <asp:BoundField HeaderText="Apellido paterno" DataField="PerApellidoPaterno" />
                                    <asp:BoundField HeaderText="Apellido materno" DataField="PerApellidoMaterno" />
                                    <asp:BoundField HeaderText="Primer nombre" DataField="PerNombrePrimero" />
                                   
                                    <asp:BoundField HeaderText="Tipo documento" DataField="PerTParCliDocumentoIdentidadTipoAbreviacion" />

                                    <asp:BoundField HeaderText="Tipo cliente" DataField="CliTParCliClienteTipoDescripcion" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" />
                                    <asp:TemplateField ItemStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <div class="dropdown">
                                                <button class="btn btn-outline-secondary btn-sm dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    Opciones
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                    <asp:LinkButton class="dropdown-item" runat="server" ID="lnkVerCliente" CommandName="BtnVerCliente" CommandArgument="<%# ((GridViewRow)Container).RowIndex %>">
                                                        <i class="fad fa-user"></i> Ver cliente
                                                    </asp:LinkButton>

                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>

                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
                <!-- /.col (right) -->
            </div>
        </div>
    </section>
    <!-- Modal -->
    <div class="modal fade" id="modalEjemplo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal Ejemplo</h5>
                  
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                      <p>El boton llama a una confirmacion, y el modal no se cerrará</p>
                     <asp:Button CssClass="btn btn-default" ID="Button1" runat="server" Text="Confirmar" OnClick="btnConfirmarBack_Click" />
                            
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>                    
                </div>
            </div>
        </div>
    </div>
    <section class="content mb-5">
        <div class="container-fluid">
            <div class="row">
                
                <!-- /.col (left) -->
                <div class="col-md-6">
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Modal desde c#</h3>
                        </div>
                        <div class="card-body">
                            
                            <asp:Button CssClass="btn btn-success" ID="btnAbrirModalBack" runat="server" Text="Abrir Modal" OnClick="btnAbrirModalBack_Click" />
                            <p>
                                <code> AbrirModal("modalEjemplo");</code>
                            </p>
                            
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
                <!-- /.col (right) -->
            </div>
        </div>
    </section>
    <section class="content mb-5">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6">

                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Alertas desde JavaScript</h3>
                        </div>
                        <div class="card-body">

                            <button class="btn btn-success" type="button" id="btnCorrecto">
                                Correcto!
                            </button>
                            <p>
                                <code>SwalCorrecto("Se registro correctamente!");</code>
                            </p>
                            <button class="btn btn-warning" type="button" id="btnAtencion">
                                Atención!
                            </button>
                            <p>
                                <code>SwalAtencion("No se realizo el registro, verifique nuevamente");</code>
                            </p>
                            <button class="btn btn-danger" type="button" id="btnError">
                                Error!
                            </button>
                            <p>
                                <code>SwalError("Sucedió un error inesperado al procesar su solicitud...");</code>
                            </p>
                            <button class="btn btn-info" type="button" id="btninfo">
                                Correcto toast!
                            </button>
                            <p>
                                <code>ToastCorrecto("Se registro correctamente!");</code>
                            </p>
                            <button class="btn btn-default" type="button" id="btnConfirmar">
                                Confirmar
                            </button>
                            <p>
                                <code>const evento = () => {
                                        SwalCorrecto("Se elimino correctamente!");
                                    }
                                    SwalConfirmar("¿Esta seguro de eliminar el registro?", evento);</code>
                            </p>
                            <script>
                                $("#btnCorrecto").on("click", function () {
                                    SwalCorrecto("Se registro correctamente!");
                                });
                                $("#btnAtencion").on("click", function () {
                                    SwalAtencion("No se realizo el registro, verifique nuevamente");
                                });;
                                $("#btnError").on("click", function () {
                                    SwalError("Sucedió un error inesperado al procesar su solicitud, repórtelo con el Código Nro. 1-1805141037476101");
                                })
                                $("#btninfo").on("click", function () {
                                    ToastCorrecto("Se registro correctamente!");
                                })
                                $("#btnConfirmar").on("click", function () {
                                    const evento = () => {
                                        SwalCorrecto("Se elimino correctamente!");
                                    }
                                    SwalConfirmar("¿Esta seguro de eliminar el registro?", evento);
                                })
                            </script>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->

                </div>
                <!-- /.col (left) -->
                <div class="col-md-6">
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Alertas desde C#</h3>
                        </div>
                        <div class="card-body">
                            <asp:Button CssClass="btn btn-success" ID="btnCorrectoBack" runat="server" Text=" Correcto!" OnClick="btnCorrectoBack_Click" />
                            <p>
                                <code>SwalCorrecto("Se registro correctamente!");</code>
                            </p>
                            <asp:Button CssClass="btn btn-warning" ID="btnAtencionback" runat="server" Text="Atención!" OnClick="btnAtencionback_Click" />
                            <p>
                                <code>SwalAtencion("No se realizo el registro, verifique nuevamente");</code>
                            </p>
                            <asp:Button CssClass="btn btn-danger" ID="btnErrorback" runat="server" Text=" Error!" OnClick="btnErrorback_Click" />
                            <p>
                                <code>SwalError("Sucedió un error inesperado al procesar su solicitud...");</code>
                            </p>
                            <asp:Button CssClass="btn btn-info" ID="btninfoBack" runat="server" Text="Correcto toast!!" OnClick="btninfoBack_Click" />
                            <p>
                                <code>ToastCorrecto("Se registro correctamente!");</code>
                            </p>
                            <asp:Button CssClass="btn btn-default" ID="btnConfirmarBack" runat="server" Text="Confirmar" OnClick="btnConfirmarBack_Click" />
                            <p>
                                <code>SwalConfirmar("¿Esta seguro de eliminar el registro?", "evento");</code>
                            </p>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
                <!-- /.col (right) -->
            </div>
        </div>
    </section>
    <div class="container-fluid">
        <div class="col-sm-6">
            <h2>Componentes admin lte</h2>
        </div>
    </div>
    <section class="content ">
        <div class="container-fluid">
            <!-- card -->
            <div class="card card-primary color-palette-box">
                <div class="card-header">
                    <h3 class="card-title">Card
                    </h3>
                </div>
                <div class="card-body">
                    Contendido de card
                  
                </div>

            </div>
            <!-- /.card-body -->
        </div>
    </section>
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <!-- left column -->
                <div class="col-md-6">
                    <!-- general form elements -->
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Ejemplo rapido</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <div role="form" >
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Correo electronico:</label>                                    
                                    <asp:TextBox CssClass="form-control" ID="TxtCorreo" placeholder="Ingrese su correo electronico" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>                                  
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputFile">Adjuntar archivo</label>
                                    <div class="input-group">
                                        <div class="custom-file">                                            
                                            <asp:FileUpload CssClass="custom-file-input" id="exampleInputFile" runat="server"/>
                                            <label class="custom-file-label" for="exampleInputFile">Seleccione su archivo</label>
                                        </div>

                                    </div>
                                </div>
                                <div class="">
                                  
                                    <asp:CheckBox ID="ChkEjemplo1" runat="server" />
                                    <label class="form-check-label" for="exampleCheck1">Seleleccione</label>
                                </div>
                            </div>
                            <!-- /.card-body -->

                            <div class="card-footer">                                
                                <asp:Button CssClass="btn btn-primary" Text="Enviar" runat="server" />
                            </div>
                        </div>
                    </div>
                    <!-- /.card -->

                    <!-- Form Element sizes -->
                    <div class="card card-success">
                        <div class="card-header">
                            <h3 class="card-title">Altura diferente</h3>
                        </div>
                        <div class="card-body">
                            <asp:TextBox CssClass="form-control form-control-lg" ID="TextBox10" runat="server" placeholder=".form-control-lg"></asp:TextBox>                            
                            <br>
                            <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder=".form-control-lg"></asp:TextBox>                          
                            <br>
                            <asp:TextBox CssClass="form-control form-control-sm" ID="TextBox3" runat="server" placeholder=".form-control-sm"></asp:TextBox>                           
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->

                    <div class="card card-danger">
                        <div class="card-header">
                            <h3 class="card-title">Diferente ancho</h3>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-3">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder=".col-3"></asp:TextBox>
                                  
                                </div>
                                <div class="col-4">
                                     <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder=".col-4"></asp:TextBox>
                                    
                                </div>
                                <div class="col-5">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder=".col-5"></asp:TextBox>                              
                                </div>
                            </div>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->

                    <!-- Input addon -->
                    <div class="card card-info">
                        <div class="card-header">
                            <h3 class="card-title">Input Complementos</h3>
                        </div>
                        <div class="card-body">
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">@</span>
                                </div>
                                 <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="nombre usuario"></asp:TextBox>                                
                            </div>

                            <div class="input-group mb-3">                                
                                 <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" ></asp:TextBox>    
                                <div class="input-group-append">
                                    <span class="input-group-text">.00</span>
                                </div>
                            </div>

                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">$</span>
                                </div>
                                <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" ></asp:TextBox>                                   
                                <div class="input-group-append">
                                    <span class="input-group-text">.00</span>
                                </div>
                            </div>

                            <h4>Con iconos</h4>

                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                </div>
                                <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" ></asp:TextBox>                                   
                            </div>

                            <div class="input-group mb-3">
                                <asp:TextBox CssClass="form-control" ID="TextBox12" runat="server" ></asp:TextBox>
                                <div class="input-group-append">
                                    <span class="input-group-text"><i class="fas fa-check"></i></span>
                                </div>
                            </div>

                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <i class="fas fa-dollar-sign"></i>
                                    </span>
                                </div>
                               <asp:TextBox CssClass="form-control" ID="TextBox13" runat="server" ></asp:TextBox>
                                <div class="input-group-append">
                                    <div class="input-group-text"><i class="fas fa-ambulance"></i></div>
                                </div>
                            </div>

                            <h5 class="mt-4 mb-2">Con casilla de verificación y entradas de radio</h5>

                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">                                               
                                                <asp:CheckBox id="ChkEjemplo" runat="server"/>
                                            </span>
                                        </div>
                                        <asp:TextBox CssClass="form-control" ID="TextBox14" runat="server" ></asp:TextBox>
                                    </div>
                                    <!-- /input-group -->
                                </div>
                                <!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">                                                
                                                <asp:RadioButton id="RdbEjemplo" runat="server"/>
                                            </span>
                                        </div>
                                        <asp:TextBox CssClass="form-control" ID="TextBox15" runat="server" ></asp:TextBox>
                                    </div>
                                    <!-- /input-group -->
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <!-- /.row -->

                            <h5 class="mt-4 mb-2">Con botones</h5>

                            <p>Grande: <code>.input-group.input-group-lg</code></p>

                            <div class="input-group input-group-lg mb-3">
                                <div class="input-group-prepend">
                                    <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown">
                                        Acción
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li class="dropdown-item"><a href="#">Acción</a></li>
                                        <li class="dropdown-item"><a href="#">Otra Acción</a></li>
                                        <li class="dropdown-item"><a href="#">algo mas</a></li>
                                        <li class="dropdown-divider"></li>
                                        <li class="dropdown-item"><a href="#">Enlace separado</a></li>
                                    </ul>
                                </div>
                                <!-- /btn-group -->
                                <asp:TextBox CssClass="form-control" ID="TextBox16" runat="server" ></asp:TextBox>
                            </div>
                            <!-- /input-group -->

                            <p>Normal</p>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">                                    
                                    <asp:Button id="BtnEjemplo10" runat="server" CssClass="btn btn-danger" Text="Acción"/>
                                </div>
                                <!-- /btn-group -->
                                <asp:TextBox CssClass="form-control" ID="TextBox17" runat="server" ></asp:TextBox>
                            </div>
                            <!-- /input-group -->

                            <p>Pequeño <code>.input-group.input-group-sm</code></p>
                            <div class="input-group input-group-sm">
                                <asp:TextBox CssClass="form-control" ID="TextBox18" runat="server" ></asp:TextBox>
                                <span class="input-group-append">                                    
                                     <asp:Button id="Button2" runat="server" CssClass="btn btn-info btn-flat" Text="Acción"/>
                                </span>
                            </div>
                            <!-- /input-group -->
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                    <!-- Horizontal Form -->
                    <div class="card card-info">
                        <div class="card-header">
                            <h3 class="card-title">Formulario Horizontal</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <div class="form-horizontal" >
                            <div class="card-body">
                                <div class="form-group row">
                                    <label for="inputEmail3" class="col-sm-2 col-form-label">Correo electronico</label>
                                    <div class="col-sm-10">
                                        <asp:TextBox CssClass="form-control" ID="TextBox19" runat="server" placeholder="Email" ></asp:TextBox>                                        
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
                                    <div class="col-sm-10">
                                        <asp:TextBox CssClass="form-control" ID="TextBox20" runat="server" placeholder="Password" TextMode="Password" ></asp:TextBox>                             
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="offset-sm-2 col-sm-10">
                                        <div class="">
                                            <asp:CheckBox ID="CheckBox10" runat="server" CssClass="form-check-input"/>                                            
                                            <label class="form-check-label" for="exampleCheck2">Recordar</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-body -->
                            <div class="card-footer">
                                <asp:Button id="Button3" runat="server" CssClass="btn btn-info" Text="Iniciar"/>
                                <asp:Button id="Button4" runat="server" CssClass="btn btn-default float-right" Text="Cancelar"/>
                              
                            </div>
                            <!-- /.card-footer -->
                        </div>
                    </div>
                    <!-- /.card -->

                </div>
                <!--/.col (left) -->
                <!-- right column -->
                <div class="col-md-6">
                    <!-- general form elements disabled -->
                    <div class="card card-warning">
                        <div class="card-header">
                            <h3 class="card-title">Elementos generales</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <div role="form">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <!-- text input -->
                                        <div class="form-group">
                                            <label>Text</label>
                                             <asp:TextBox CssClass="form-control" ID="TextBox21" runat="server" placeholder="Ingrese su información ..." ></asp:TextBox>                                                
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Texto deshabilitado</label>
                                            <asp:TextBox CssClass="form-control" ID="TextBox22" runat="server" placeholder="Ingrese su información ..." Enabled="false"></asp:TextBox>                                                   
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <!-- textarea -->
                                        <div class="form-group">
                                            <label>Textarea</label>
                                            
                                            <asp:TextBox CssClass="form-control" TextMode="MultiLine" Rows="3" ID="TextBox23" runat="server" placeholder="Ingrese su información ..." ></asp:TextBox>                         
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Textarea deshabilitado</label>
                                            <asp:TextBox Enabled="false" CssClass="form-control" TextMode="MultiLine" Rows="3" ID="TextBox24" runat="server" placeholder="Ingrese su información ..." ></asp:TextBox> 
                                            
                                        </div>
                                    </div>
                                </div>

                                <!-- input states -->
                                <div class="form-group">
                                    <label class="col-form-label" for="inputSuccess">
                                        <i class="fas fa-check"></i>TextBox success</label>
                                    <asp:TextBox CssClass="form-control is-valid" ID="TextBox25" runat="server" placeholder="Ingrese su información ..." ></asp:TextBox>           
                                    
                                </div>
                                <div class="form-group">
                                    <label class="col-form-label" for="inputWarning">
                                        <i class="far fa-bell"></i>TextBox warning</label>
                                     <asp:TextBox CssClass="form-control is-warning" ID="TextBox26" runat="server" placeholder="Ingrese su información ..." ></asp:TextBox>
                                    
                                </div>
                                <div class="form-group">
                                    <label class="col-form-label" for="inputError">
                                        <i class="far fa-times-circle"></i>TextBox error</label>
                                     <asp:TextBox CssClass="form-control is-invalid" ID="TextBox27" runat="server" placeholder="Ingrese su información ..." ></asp:TextBox>
                                    
                                </div>

                                <div class="row">
                                    <div class="col-sm-6">
                                        <!-- checkbox -->
                                        <div class="form-group">
                                            <div class="form-check">
                                                <asp:CheckBox ID="CheckBox1" runat="server" CssClass="form-check-input"/>                                                   
                                                <label class="form-check-label">Checkbox</label>
                                            </div>
                                            <div class="form-check">
                                                <asp:CheckBox ID="CheckBox2" runat="server" CssClass="form-check-input" Checked="true"/>
                                                <label class="form-check-label">Checkbox checked</label>
                                            </div>
                                           
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <!-- radio -->
                                        <div class="form-group">
                                            <div class="form-check">
                                                <asp:RadioButton runat="server" id="RadioButton100" class="form-check-input" GroupName="prueba"/>                                                
                                                <label class="form-check-label">Radio</label>
                                            </div>
                                            <div class="form-check">
                                                <asp:RadioButton runat="server" id="RadioButton1" class="form-check-input" GroupName="prueba" Checked="true"/>   
                                                <label class="form-check-label">Radio checked</label>
                                            </div>
                                           
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-6">
                                        <!-- select -->
                                        <div class="form-group">
                                            <label>Select</label>
                                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                                                <asp:ListItem>Opcion 1</asp:ListItem>
                                                <asp:ListItem>Opcion 2</asp:ListItem>
                                                <asp:ListItem>Opcion 3</asp:ListItem>
                                                <asp:ListItem>Opcion 4</asp:ListItem>
                                                <asp:ListItem>Opcion 5</asp:ListItem>                                                
                                            </asp:DropDownList>
                                           
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Select Disabled</label>
                                             <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" Enabled="false">
                                                <asp:ListItem>Opcion 1</asp:ListItem>
                                                <asp:ListItem>Opcion 2</asp:ListItem>
                                                <asp:ListItem>Opcion 3</asp:ListItem>
                                                <asp:ListItem>Opcion 4</asp:ListItem>
                                                <asp:ListItem>Opcion 5</asp:ListItem>                                                
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-6">
                                        <!-- Select multiple-->
                                        <div class="form-group">
                                            <label>Select Multiple</label>
                                            <asp:ListBox runat="server" ID="lblMultiSelect" SelectionMode="multiple" CssClass="form-control ">
                                                <asp:ListItem>Opcion 10</asp:ListItem>
                                                <asp:ListItem>Opcion 20</asp:ListItem>
                                                <asp:ListItem>Opcion 30</asp:ListItem>
                                                <asp:ListItem>Opcion 40</asp:ListItem>
                                                <asp:ListItem>Opcion 50</asp:ListItem>
                                            </asp:ListBox> 
                                        
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Select Multiple Disabled</label>
                                            <asp:ListBox runat="server" ID="ListBox1" SelectionMode="multiple" CssClass="form-control " Enabled="false">
                                                <asp:ListItem>Opcion 10</asp:ListItem>
                                                <asp:ListItem>Opcion 20</asp:ListItem>
                                                <asp:ListItem>Opcion 30</asp:ListItem>
                                                <asp:ListItem>Opcion 40</asp:ListItem>
                                                <asp:ListItem>Opcion 50</asp:ListItem>
                                            </asp:ListBox> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                    <!-- general form elements disabled -->
                    <div class="card card-secondary">
                        <div class="card-header">
                            <h3 class="card-title">Elementos personalizados</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <div role="form">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <!-- checkbox -->
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox">
                                                <input class="custom-control-input" type="checkbox" id="customCheckbox1" value="option1">
                                                <label for="customCheckbox1" class="custom-control-label">Custom Checkbox</label>
                                            </div>
                                            <div class="custom-control custom-checkbox">
                                                <input class="custom-control-input" type="checkbox" id="customCheckbox2" checked="">
                                                <label for="customCheckbox2" class="custom-control-label">Custom Checkbox checked</label>
                                            </div>
                                            <div class="custom-control custom-checkbox">
                                                <input class="custom-control-input" type="checkbox" id="customCheckbox3" disabled="">
                                                <label for="customCheckbox3" class="custom-control-label">Custom Checkbox disabled</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <!-- radio -->
                                        <div class="form-group">
                                            <div class="custom-control custom-radio">
                                                <input class="custom-control-input" type="radio" id="customRadio1" name="customRadio">
                                                <label for="customRadio1" class="custom-control-label">Custom Radio</label>
                                            </div>
                                            <div class="custom-control custom-radio">
                                                <input class="custom-control-input" type="radio" id="customRadio2" name="customRadio" checked="">
                                                <label for="customRadio2" class="custom-control-label">Custom Radio checked</label>
                                            </div>
                                            <div class="custom-control custom-radio">
                                                <input class="custom-control-input" type="radio" id="customRadio3" disabled="">
                                                <label for="customRadio3" class="custom-control-label">Custom Radio disabled</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-6">
                                        <!-- select -->
                                        <div class="form-group">
                                            <label>Custom Select</label>
                                            <select class="custom-select">
                                                <option>option 1</option>
                                                <option>option 2</option>
                                                <option>option 3</option>
                                                <option>option 4</option>
                                                <option>option 5</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Custom Select Disabled</label>
                                            <select class="custom-select" disabled="">
                                                <option>option 1</option>
                                                <option>option 2</option>
                                                <option>option 3</option>
                                                <option>option 4</option>
                                                <option>option 5</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-6">
                                        <!-- Select multiple-->
                                        <div class="form-group">
                                            <label>Custom Select Multiple</label>
                                            <select multiple="" class="custom-select">
                                                <option>option 1</option>
                                                <option>option 2</option>
                                                <option>option 3</option>
                                                <option>option 4</option>
                                                <option>option 5</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Custom Select Multiple Disabled</label>
                                            <select multiple="" class="custom-select" disabled="">
                                                <option>option 1</option>
                                                <option>option 2</option>
                                                <option>option 3</option>
                                                <option>option 4</option>
                                                <option>option 5</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="custom-control custom-switch">
                                        <input type="checkbox" class="custom-control-input" id="customSwitch1">
                                        <label class="custom-control-label" for="customSwitch1">
Alternar este elemento de interruptor personalizado</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="custom-control custom-switch custom-switch-off-danger custom-switch-on-success">
                                        <input type="checkbox" class="custom-control-input" id="customSwitch3">
                                        <label class="custom-control-label" for="customSwitch3">
Alternar este elemento de interruptor personalizado con colores personalizados peligro / éxito</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="custom-control custom-switch">
                                        <input type="checkbox" class="custom-control-input" disabled="" id="customSwitch2">
                                        <label class="custom-control-label" for="customSwitch2">Elemento de interruptor personalizado deshabilitado</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="customRange1">Custom range</label>
                                    <asp:TextBox TextMode="Range" CssClass="custom-range" ID="customRange1" runat="server"></asp:TextBox>
                                    
                                </div>
                                <div class="form-group">
                                    <label for="customRange1">Custom range (custom-range-danger)</label>
                                    
                                    <asp:TextBox TextMode="Range" CssClass="custom-range custom-range-danger" ID="TextBox28" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="customRange1">Custom range (custom-range-teal)</label>
                                    <asp:TextBox TextMode="Range" CssClass="custom-range custom-range-teal" ID="TextBox29" runat="server"></asp:TextBox>
                                    
                                </div>
                                <div class="form-group">
                                    <!-- <label for="customFile">Custom File</label> -->

                                    <div class="custom-file">                                        
                                          <asp:FileUpload CssClass="custom-file-input" id="FileUpload1" runat="server"/>
                                        <label class="custom-file-label" for="customFile">Adjuntar archivo</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                </div>
                            </div>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
                <!--/.col (right) -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </section>
    <section class="content mb-5">
        <div class="container-fluid">
            <div class="card card-default" data-select2-id="50">
                <div class="card-header">
                    <h3 class="card-title">componente Select2</h3>

                    <div class="card-tools">
                        <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i></button>
                        <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i></button>
                    </div>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <p>Para utilizar el componente select2 debe agregar la clase: <span class="text-red">selector</span></p>
                    <div class="row">


                        <div class="col-md-6">
                            <div class="form-group">

                                <label>Simple</label>
                                 <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control selector" >
                                                <asp:ListItem>Opcion 1</asp:ListItem>
                                                <asp:ListItem>Opcion 2</asp:ListItem>
                                                <asp:ListItem>Opcion 3</asp:ListItem>
                                                <asp:ListItem>Opcion 4</asp:ListItem>
                                                <asp:ListItem>Opcion 5</asp:ListItem>                                                
                                </asp:DropDownList>
                                 

                            </div>
                            <!-- /.form-group -->
                            <div class="form-group">
                                <label>Disabled</label>
                                 <asp:DropDownList ID="DropDownList4" runat="server" CssClass="form-control selector" Enabled="false" >
                                                <asp:ListItem>Opcion 1</asp:ListItem>
                                                <asp:ListItem>Opcion 2</asp:ListItem>
                                                <asp:ListItem>Opcion 3</asp:ListItem>
                                                <asp:ListItem>Opcion 4</asp:ListItem>
                                                <asp:ListItem>Opcion 5</asp:ListItem>                                                
                                </asp:DropDownList>
                               
                            </div>
                            <!-- /.form-group -->
                        </div>
                        <!-- /.col -->
                        <div class="col-md-6" data-select2-id="47">
                            <div class="form-group" data-select2-id="46">
                                <label>Multiple</label>
                                <asp:ListBox runat="server" ID="ListBox3" SelectionMode="multiple" CssClass="form-control selector" Enabled="false">
                                                <asp:ListItem>Opcion 10</asp:ListItem>
                                                <asp:ListItem>Opcion 20</asp:ListItem>
                                                <asp:ListItem>Opcion 30</asp:ListItem>
                                                <asp:ListItem>Opcion 40</asp:ListItem>
                                                <asp:ListItem>Opcion 50</asp:ListItem>
                                            </asp:ListBox>

                            </div>
                            <!-- /.form-group -->
                            <div class="form-group">
                                <label>Disabled Result</label>
                                <asp:ListBox runat="server" ID="ListBox2" SelectionMode="multiple" CssClass="form-control selector" Enabled="false">
                                                <asp:ListItem>Opcion 10</asp:ListItem>
                                                <asp:ListItem>Opcion 20</asp:ListItem>
                                                <asp:ListItem Enabled="false">Opcion 30 (disabled)</asp:ListItem>
                                                <asp:ListItem>Opcion 40</asp:ListItem>
                                                <asp:ListItem>Opcion 50</asp:ListItem>
                                            </asp:ListBox>
                            </div>
                            <!-- /.form-group -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.card-body -->
                <div class="card-footer">
                    Para mas información: <a href="https://select2.github.io/">documentacion de select2 </a>
                </div>
            </div>
        </div>
    </section>

    <section class="content mb-5">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6">

                    <div class="card card-danger">
                        <div class="card-header">
                            <h3 class="card-title">Input masks</h3>
                        </div>
                        <div class="card-body">
                            <!-- Date dd/mm/yyyy -->
                            <div class="form-group">
                                <label>Date masks:</label>

                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                                    </div>
                                    <asp:TextBox ID="TextBox0" CssClass="form-control"  runat="server" data-inputmask-alias="datetime" data-inputmask-inputformat="dd/mm/yyyy" data-mask="" im-insert="false"></asp:TextBox>
                                   
                                </div>
                                <!-- /.input group -->
                            </div>
                            <!-- /.form group -->

                            <!-- Date mm/dd/yyyy -->
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                                    </div>
                                     <asp:TextBox ID="TextBox30" CssClass="form-control"  runat="server" data-inputmask-alias="datetime" data-inputmask-inputformat="mm/dd/yyyy" data-mask="" im-insert="false"></asp:TextBox>
                                   
                                </div>
                                <!-- /.input group -->
                            </div>
                            <!-- /.form group -->

                            <!-- phone mask -->
                            <div class="form-group">
                                <label>US phone mask:</label>

                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                    </div>
                                    <asp:TextBox ID="TextBox31" CssClass="form-control"  runat="server"  data-inputmask="&quot;mask&quot;: &quot;(999) 999-9999&quot;" data-mask="" im-insert="true"></asp:TextBox>
                                   
                                </div>
                                <!-- /.input group -->
                            </div>
                            <!-- /.form group -->

                            <!-- phone mask -->
                            <div class="form-group">
                                <label>Intl US phone mask:</label>

                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                    </div>
                                    <asp:TextBox ID="TextBox32" CssClass="form-control"  runat="server" data-inputmask="'mask': ['999-999-9999 [x99999]', '+099 99 99 9999[9]-9999']" data-mask="" im-insert="true"></asp:TextBox>
                                    
                                </div>
                                <!-- /.input group -->
                            </div>
                            <!-- /.form group -->

                            <!-- IP mask -->
                            <div class="form-group">
                                <label>IP mask:</label>

                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-laptop"></i></span>
                                    </div>
                                    <asp:TextBox ID="TextBox33" CssClass="form-control"  runat="server" data-inputmask="'alias': 'ip'" data-mask="" im-insert="true"></asp:TextBox>
                                    
                                </div>
                                <!-- /.input group -->
                            </div>
                            <!-- /.form group -->

                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->

                </div>
                <!-- /.col (left) -->
                <div class="col-md-6">
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Calendario</h3>
                        </div>
                        <div class="card-body">
                            <p>Para el uso de daterengepicker debe agregar la clase <span class="text-red">calendarioRango</span></p>
                            <!-- Date range -->
                            <div class="form-group">
                                <label>Rango de fechas:</label>

                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="far fa-calendar-alt"></i>
                                        </span>
                                    </div>
                                    <asp:TextBox ID="TextBox34" CssClass="form-control calendarioRango"  runat="server" ></asp:TextBox>
                                    
                                </div>
                                <!-- /.input group -->
                            </div>
                            <!-- /.form group -->

                            <!-- Date and time range -->
                            <div class="form-group">
                                 <p>Para el uso de daterengepicker debe agregar la clase <span class="text-red">calendarioFechaHoraRango</span></p>
                                <label>Rango de fecha y hora</label>

                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="far fa-clock"></i></span>
                                    </div>
                                    <asp:TextBox ID="TextBox35" CssClass="form-control calendarioFechaHoraRango"  runat="server" ></asp:TextBox>
                                    
                                </div>
                                <!-- /.input group -->
                            </div>
                            <!-- /.form group -->
                            <div class="form-group">
                                 <p>Para el uso de datepicker debe agregar la clase <span class="text-red">calendario</span></p>
                                <label>Solo Fecha</label>

                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                                    </div>
                                    <asp:TextBox ID="TextBox36" CssClass="form-control calendario"  runat="server" ></asp:TextBox>
                                    
                                </div>
                                <!-- /.input group -->
                            </div>



                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->



                </div>
                <!-- /.col (right) -->
            </div>
        </div>
    </section>


</asp:Content>
