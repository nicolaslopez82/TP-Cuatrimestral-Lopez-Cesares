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
   
        <table>
            <tr>
                <td>Especialidades
                </td>
                <td>
                    <select id="continents">
                    </select>
                </td>
            </tr>
            <tr>
                <td>Medicos</td>
                <td>
                    <select id="countries">
                    </select>
                </td>
            </tr>
            <tr>
                <td>Horarios Disponibles</td>
                <td>
                    <select id="cities">
                    </select>
                </td>
            </tr>
        </table>
   
  </section>

  <style>
  select {
    width: 250px;
        }
</style>

  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
  <script src="javascript/Reserva.js" type="text/javascript"></script> 
  <script src="javascript/ReservaDropDownList.js" type="text/javascript"></script> 
</asp:Content>
