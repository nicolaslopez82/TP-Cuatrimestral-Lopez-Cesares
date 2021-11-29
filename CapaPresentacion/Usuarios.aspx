<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="CapaPresentacion.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                      <h3 class="card-title">Listado de los usuarios</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                      <table id="usuariosList" class="table table-bordered table-hover table-striped">
                        <thead>
                        <tr>                          
                          <th>ID Usuario</th>
                          <th>Nombres</th>
                          <th>Apellido</th>                    
                          <th>DNI</th>
                          <th>Usuario</th>
                          <th>Acciones</th>                          
                        </tr>
                        </thead>
                          <tbody id="tbl_body_table">
                                <!-- DATA POR MEDIO DE AJAX-->
                            </tbody>                        
                        <tfoot>
                        <tr>
                          <th>ID Usuario</th>
                          <th>Nombres</th>
                          <th>Apellido</th>                               
                          <th>DNI</th>
                          <th>Usuario</th>
                          <th>Acciones</th>              
                        </tr>
                        </tfoot>
                      </table>                      
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

  <!-- /.Modal Actualizar -->
  <div class="modal fade" id="imodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">          
          <div class="modal-content">          
            <div class="modal-header">
              <h3 class="modal-title" id="myModalLabel">Actualizar Datos del Usuario</h3>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
                       
              <div class="modal-body">                   
                    <div class="form-group">
                        <label>NOMBRE</label>
                    </div>
                    <div class="form-group">                       
                      <asp:TextBox ID="txtNombreActualizar" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>APELLIDO</label>
                    </div>
                    <div class="form-group">                       
                      <asp:TextBox ID="txtApellidoActualizar" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                    </div>                    
                    <div class="form-group">
                        <label>DNI</label>
                    </div>
                    <div class="form-group">                        
                        <asp:TextBox ID="txtNroDocumentoActualizar" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>USUARIO</label>
                    </div>
                    <div class="form-group">                       
                      <asp:TextBox ID="txtUsuarioActualizar" runat="server" Text="" CssClass="form-control" Enabled="false"></asp:TextBox>
                    </div>
                </div>            
            
                <div class="modal-footer justify-content-between">              
                  <asp:Button ID="btnActualizarCancelar" runat="server" class="btn btn-secondary" data-dismiss="modal" Text="Cancelar"/>
                  <asp:Button ID="btnActualizarGuardar" runat="server" class="btn btn-primary" data-dismiss="modal" Text="Actualizar"/>
                </div>            
          </div>          
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
  <!-- /.modal -->

  <!-- /.Registro Usuarios -->
  <section class="content">
    <%--<form id="formRegistro" runat="server">--%>
          <LayoutTemplate>
      <!-- Formulario Registro Usuario Nuevo - INICIO -->      
      <div class="row">        
            <div class="col-md-6">              
                <div class="box box-primary">                  
                   <h5 class="card-title">Registro de Usuarios</h5>                  
                  <br/>
                    <div class="box-body">                        
                        <div class="form-group">
                            <label>NOMBRES</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtNombres" runat="server" Text="" CssClass="form-control" placeholder="Ingrese Nombres..."></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>APELLIDO</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtApellido" runat="server" Text="" CssClass="form-control" placeholder="Ingrese Apellido..."></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>DOCUMENTO DE IDENTIDAD</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtNroDocumento" runat="server" Text="" CssClass="form-control" placeholder="Ingrese DNI..."></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="form-group">
                            <label>TIPO USUARIO</label>
                        </div>
                        <div class="form-group">
                            <asp:DropDownList ID="ddlTipoUsuario" runat="server" CssClass="form-control">
                                <asp:ListItem>Administrador</asp:ListItem>
                                <asp:ListItem>Recepcionista</asp:ListItem>
                                <asp:ListItem Selected="true">Medico</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label>USUARIO</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtUsuario" runat="server" Text="" CssClass="form-control" placeholder="Ingrese Usuario..."></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>PASSWORD</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtPassword" runat="server" Text="" CssClass="form-control" placeholder="Ingrese password..." TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>CONFIRMAR PASSWORD</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtConfirmarPassword" runat="server" Text="" CssClass="form-control" placeholder="Confirme password..." TextMode="Password"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>            
        </div>

        <div align="center">
            <table>
                <tr>
                    <td>
                        <asp:Button ID="btnRegistrar" runat="server" CssClass="btn btn-primary" Width="200px" Text="Registrar"  OnClick="btnRegistrar_Click" />                        
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>
                        <asp:Button ID="btnCancelar" runat="server" CssClass="btn btn-danger" Width="200px" Text="Cancelar" />
                    </td>
                </tr>
            </table>
        </div>
      </LayoutTemplate>
     <%--</form>--%>
        <!-- Formulario Registro Usuario Nuevo - FIN -->
    </section>
  <!-- /.content -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
  <script src="javascript/Usuarios.js" type="text/javascript"></script>
</asp:Content>
