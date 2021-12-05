<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reserva.aspx.cs" Inherits="CapaPresentacion.Reserva" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
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
                        
                        <td> <%: pacienterese.IdPaciente %> </td>
                        <td> <%: pacienterese.Nombres %> </td>
                        <td> <%: pacienterese.Apellido %> </td>
                        <td> <%: pacienterese.Edad %> </td>
                        <td> <%: pacienterese.Sexo %> </td>
                        <td> <%: pacienterese.NroDocumento%> </td>
                        <td> <%: pacienterese.Direccion%> </td>
                        <td> <%: pacienterese.Telefono %> </td>



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


  <section>
    <form id="myForm">  
        <label for="departmentsDropdown"><b>Departments</b></label>  
        <select class="form-control" id="departmentsDropdown" name="departmentsDropdown"></select>  
    </form> 

  </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
  <script src="javascript/Reserva.js" type="text/javascript"></script>
</asp:Content>
