<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pacientes.aspx.cs" Inherits="CapaPresentacion.Pacientes" %>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <!-- /.Datatable Listado Pacientes -->
      <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                      <h1 class="card-title">Listado de Pacientes</h1>
                    </div>
              <div>
                <a href="https://localhost:44377/RegistroPacienteForm.aspx" class="btn btn-primary" >Registrar nuevo Paciente</a>
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
   <!-- /.Datatable -->

  <!-- /.Modal Actualizar -->
  <div class="modal fade" id="imodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">          
          <div class="modal-content">          
            <div class="modal-header">
              <h3 class="modal-title" id="myModalLabel">Actualizar Datos del Paciente</h3>
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
                  <asp:Button ID="btnActualizarGuardar" runat="server" class="btn btn-primary" data-dismiss="modal" Text="Actualizar"/>
                </div>            
          </div>          
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
  <!-- /.modal -->  
  <!-- /.content -->
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="footer" runat="server">
  <script src="javascript/Pacientes.js" type="text/javascript"></script>
</asp:Content>
