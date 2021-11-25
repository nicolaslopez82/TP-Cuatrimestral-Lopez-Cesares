<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pacientes.aspx.cs" Inherits="CapaPresentacion.Pacientes" %>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                      <h3 class="card-title">Listado de Pacientes</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                      <table id="pacientesList" class="table table-bordered table-hover table-striped">
                        <thead>
                        <tr>
                          <th>IdPaciente</th>
                          <th>Nombres</th>
                          <th>Apellido</th>
                          <th>Edad</th>
                          <th>Sexo</th>
                          <th>DNI</th>
                          <th>Direccion</th>                          
                          <th>Telefono</th>
                          <th>Acciones</th>
                        </tr>
                        </thead>
                          <tbody id="tbl_body_table">
                                <!-- DATA POR MEDIO DE AJAX-->
                            </tbody>                        
                        <tfoot>
                        <tr>                          
                          <th>IdPaciente</th>
                          <th>Nombres</th>
                          <th>Apellido</th>
                          <th>Edad</th>
                          <th>Sexo</th>
                          <th>DNI</th>
                          <th>Direccion</th>                          
                          <th>Telefono</th>
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

  <div class="modal fade" id="imodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">          
          <div class="modal-content">          
            <div class="modal-header">
              <h4 class="modal-title" id="myModalLabel">Actualizar Paciente</h4>
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
                        <label>EDAD</label>
                    </div>
                    <div class="form-group">                        
                        <asp:TextBox ID="txtEdadActualizar" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>SEXO</label>
                    </div>
                    <div class="form-group">                        
                        <asp:TextBox ID="txtSexoActualizar" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>DNI</label>
                    </div>
                    <div class="form-group">                        
                        <asp:TextBox ID="txtNroDocumentoActualizar" runat="server" Text="" CssClass="form-control" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>DIRECCION</label>
                    </div>
                    <div class="form-group">                        
                        <asp:TextBox ID="txtDireccionActualizar" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>TELEFONO</label>
                    </div>
                    <div class="form-group">                        
                        <asp:TextBox ID="txtTelefonoActualizar" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                    </div>                  
                </div>            
            
                <div class="modal-footer justify-content-between">              
                  <asp:Button ID="btnActualizarCancelar" runat="server" class="btn btn-secondary" data-dismiss="modal" Text="Cancelar"/>
                  <asp:Button ID="btnActualizarGuardar" runat="server" class="btn btn-primary" Text="Actualizar"/>
                </div>            
          </div>          
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->  



  

  <section class="content">
    <%--<form id="formRegistro" runat="server">--%>
          <LayoutTemplate>
      <!-- Formulario Registro Paciente Nuevo - INICIO -->      
      <div class="row">
        
            <div class="col-md-6">              
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="form-group">
                            <label>DOCUMENTO DE IDENTIDAD</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtNroDocumento" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>NOMBRES</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtNombres" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>APELLIDO</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtApellido" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>                        
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="form-group">
                            <label>SEXO</label>
                        </div>
                        <div class="form-group">
                            <asp:DropDownList ID="ddlSexo" runat="server" CssClass="form-control">
                                <asp:ListItem>Masculino</asp:ListItem>
                                <asp:ListItem>Femenino</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label>EDAD</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtEdad" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>TELEFONO</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtTelefono" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>DIRECCION</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtDireccion" runat="server" Text="" CssClass="form-control"></asp:TextBox>
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
        <!-- Formulario Registro Paciente Nuevo - FIN -->

    </section>
  <!-- /.content -->
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="footer" runat="server">
  <script src="javascript/Pacientes.js" type="text/javascript"></script>
</asp:Content>
