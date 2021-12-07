<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MedicoIndex.aspx.cs" Inherits="CapaPresentacion.MedicoIndex" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <! –– CARD DE RESERVAS ––>

   <div class="container" >
     <div class="card-deck mt-3">
     

  <div class="card" style="width: 18rem;">
  <img src="https://www.itfluence.com/wp-content/uploads/2020/02/google-calendar-trucos-g-suite-itfluence.png" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Listado de Reservas</h5>
    <p class="card-text">Aqui puede eliminar o modificar una observacion de una Reserva</p>
    <a href="Reserva-bm.aspx" onclick="" class="btn btn-primary">CLICK AQUI!</a>
  </div>
</div>

      </div>
  </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
