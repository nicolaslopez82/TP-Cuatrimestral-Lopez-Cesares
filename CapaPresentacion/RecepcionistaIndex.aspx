<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RecepcionistaIndex.aspx.cs" Inherits="CapaPresentacion.RecepcionistaIndex" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <div class="container" >
     <div class="card-deck mt-3">

      <! –– CARD DE PACIENTES ––>

      <div class="card" style="width: 18rem;">
      <img src="https://rochepacientes.es/dam/assets/images/artritis-medico-paciente.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Listado de pacientes </h5>
        <p class="card-text">Aqui puede dar de alta, modificar, eliminar  y hacer una reserva a un Paciente </p>
        <a href="Pacientes.aspx" onclick="" class="btn btn-primary">CLICK AQUI!</a>
      </div>
    </div>
       </div>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
