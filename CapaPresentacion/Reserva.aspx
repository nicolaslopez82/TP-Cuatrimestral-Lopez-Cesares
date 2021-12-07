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

    <%-- Requerido para usar Update Panel --%>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <hr />
    <hr />
    <h3> Seleccion de Especialidades - Medicos - Horarios Disponibles </h3>
      <asp:UpdatePanel runat="server">
        <ContentTemplate>
          <div class="row">
                    <div class="col-sm-4">
                      <!-- select -->                      
                      <asp:Label ID="lblEspecialidades" runat="server" Text="Especialidades"></asp:Label>
                      <asp:DropDownList ID="ddlEspecialidades" runat="server" class="btn btn-secondary dropdown-toggle" 
                        AutoPostBack="true" OnSelectedIndexChanged="ddlEspecialidades_SelectedIndexChanged"></asp:DropDownList>
                     </div>
                     <div class="col-sm-4">
                      <asp:Label ID="lblMedicos" runat="server" Text="Medicos"></asp:Label>
                      <asp:DropDownList ID="ddlMedicos" runat="server" class="btn btn-secondary dropdown-toggle"
                        AutoPostBack="true" OnSelectedIndexChanged="ddlMedicos_SelectedIndexChanged"></asp:DropDownList>                      
                     </div>
                    <div class="col-sm-4">
                      <asp:Label ID="lblHorarioDisponible" runat="server" Text="Horarios Disponibles"></asp:Label>
                      <asp:DropDownList ID="ddlHorarioDisponible" runat="server" class="btn btn-secondary dropdown-toggle"></asp:DropDownList>
                    </div>
                  </div>
        </ContentTemplate>
      </asp:UpdatePanel>
    <hr />
    <hr />
      <div class="col-sm-12">
        <div class="form-group">
          <asp:Label ID="lblObservacion" runat="server" Text="Observacion"></asp:Label>
          <asp:TextBox ID="txtObservacion" runat="server" TextMode="MultiLine"
            class="form-control" rows="3" placeholder="Enter ..."></asp:TextBox>
        </div>
      </div>
    <hr />  
    <hr />
    <div class="col-sm-6">
      <div class="form-group">
       <asp:Button ID="btnConfirmarReserva" runat="server" Text="Confirmar Reserva" CssClass="btn btn-primary" OnClick="btnConfirmarReserva_Click"/>
      </div>
    </div>
    
  </section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">    
</asp:Content>
