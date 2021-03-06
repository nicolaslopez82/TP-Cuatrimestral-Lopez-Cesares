<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Especialidades.aspx.cs" Inherits="CapaPresentacion.Especialidades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                      <h3 class="card-title">Listado de Especialidades</h3>
                    </div>
              <div>
                <a href="https://localhost:44377/RegistroEspecialidad.aspx" class="btn btn-primary" >Registrar nueva Especialidad</a>
              </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                      <table id="especialidadList" class="table table-bordered table-hover table-striped">
                        <thead>
                        <tr>                          
                          <th>ID Especialidad</th>
                          <th>Descripcion</th>
                          <th>Acciones</th>                          
                        </tr>
                        </thead>
                          <tbody id="tbl_body_table">
                                <!-- DATA POR MEDIO DE AJAX-->
                            </tbody>                        
                        <tfoot>
                        <tr>
                          <th>ID Especialidad</th>
                          <th>Descripcion</th>
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
              <h3 class="modal-title" id="myModalLabel">Actualizar Descripcion</h3>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
                       
              <div class="modal-body">                   
                    <div class="form-group">
                        <label>Descripcion</label>
                    </div>
                    <div class="form-group">                       
                      <asp:TextBox ID="txtDescripcionActualizar" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                    </div>

                <div class="form-group">                       
                      <asp:TextBox ID="txtIDactualizar" runat="server" Text="" enabled="false" CssClass="form-control"></asp:TextBox>
                    </div>
                         
            
                <div class="modal-footer justify-content-between">              
                  <asp:Button ID="btnActualizarCancelar" runat="server" class="btn btn-secondary" data-dismiss="modal" Text="Cancelar"/>
                  <asp:Button  ID="btnActualizarGuardarr" runat="server" class="btn btn-primary" data-dismiss="modal" Text="Actualizar"/>
                </div>            
          </div>          
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
  <!-- /.modal -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
   <script src="javascript/Especialidad.js" type="text/javascript"></script>
</asp:Content>
