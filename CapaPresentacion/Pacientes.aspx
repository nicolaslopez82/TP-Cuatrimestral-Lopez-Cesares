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
                      <h3 class="card-title">DataTable with default features</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                      <table id="pacientesList" class="table table-bordered table-striped">
                        <thead>
                        <tr>
                          <th>IdPaciente</th>
                          <th>Nombre</th>
                          <th>Apellido</th>
                          <%--<th>Edad</th>
                          <th>Sexo</th>
                          <th>Direccion</th>
                          <th>DNI</th>
                          <th>Acciones</th>
                          <th>Acciones1</th>--%>
                        </tr>
                        </thead>
                          <tbody id="tbl_body_table">
                                <!-- DATA POR MEDIO DE AJAX-->
                            </tbody>                        
                        <tfoot>
                        <tr>
                          <th>IdPaciente</th>
                          <th>Nombre</th>
                          <th>Apellido</th>
                          <%--<th>Edad</th>
                          <th>Sexo</th>
                          <th>Direccion</th>
                          <th>DNI</th>
                          <th>Acciones</th>
                          <th>Acciones1</th>--%>
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
  <!-- /.content -->
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="footer" runat="server">
  <script src="javascript/Pacientes.js" type="text/javascript"></script>
</asp:Content>
