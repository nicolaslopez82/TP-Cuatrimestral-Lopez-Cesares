<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reserva-bm.aspx.cs" Inherits="CapaPresentacion.Reserva_bm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                      <h3 class="card-title">Listado de Reservas</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                      <table id="reservaList" class="table table-bordered table-hover table-striped">
                        <thead>
                        <tr>                          
                          <th>ID Reserva</th>
                          <th>Horario Disponible</th>
                          <th>id Medico</th>
                          <th>Apellido paciente</th>
                          <th>Nombre Paciente</th>
                          <th>Fecha Creacion</th>
                          <th>Observacion</th>
                          <th>Acciones</th>                          
                        </tr>
                        </thead>
                          <tbody id="tbl_body_table">
                                <!-- DATA POR MEDIO DE AJAX-->
                            </tbody>                        
                        <tfoot>
                        <tr>
                          <th>ID Reserva</th>
                          <th>Horario Disponible</th>
                          <th>id Medico</th>
                          <th>Apellido paciente</th>
                          <th>Nombre Paciente</th>
                          <th>Fecha Creacion</th>
                          <th>Observacion</th>
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
              <h3 class="modal-title" id="myModalLabel">Actualizar Datos de la Reserva</h3>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
                       
              <div class="modal-body">                                 
                    <div class="form-group">
                        <label>Codigo Reserva</label>
                    </div>
                    <div class="form-group">                       
                      <asp:TextBox ID="txtIdReservaActualizar" runat="server" Text="" CssClass="form-control" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Horario Disponible</label>
                    </div>
                    <div class="form-group">
                      <%--<asp:DropDownList ID="ddlHorarioDisponibleActualizar" runat="server"></asp:DropDownList>--%>
                      <asp:TextBox ID="txtHorarioDisponibleActualizar" runat="server" Text="" CssClass="form-control" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Codigo Medico</label>
                    </div>
                    <div class="form-group">                        
                        <asp:TextBox ID="txtIdMedicoActualizar" runat="server" Text="" CssClass="form-control" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Apellido Paciente</label>
                    </div>
                    <div class="form-group">                        
                        <asp:TextBox ID="txtApellidoPacienteActualizar" runat="server" Text="" CssClass="form-control" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Nombres Paciente</label>
                    </div>
                    <div class="form-group">                        
                        <asp:TextBox ID="txtNombresPacientesActualizar" runat="server" Text="" CssClass="form-control" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Fecha Creacion de Reserva</label>
                    </div>
                    <div class="form-group">                        
                        <asp:TextBox ID="txtFechaCreacionReservaActualizar" runat="server" Text="" CssClass="form-control" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Observaciones</label>
                    </div>
                    <div class="form-group">                        
                        <asp:TextBox ID="txtObservacionesActualizar" runat="server" Text="" CssClass="form-control"></asp:TextBox>
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



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">

  <script src="javascript/Reserva.js" type="text/javascript"></script>
</asp:Content>

