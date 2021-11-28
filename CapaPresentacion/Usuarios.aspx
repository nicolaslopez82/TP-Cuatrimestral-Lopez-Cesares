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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
  <script src="javascript/Usuarios.js" type="text/javascript"></script>
</asp:Content>
