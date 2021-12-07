<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminIndex.aspx.cs" Inherits="CapaPresentacion.AdminIndex" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <div class="container" >
     <div class="card-deck mt-3">

 <! –– CARD DE LISTA DE USUARIOS ––>

     
  <div class="card" style="width: 18rem;">
  <img src="https://cdn.pixabay.com/photo/2018/04/18/18/56/user-3331257_960_720.png" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Listado de Usuarios </h5>
    <p class="card-text">Aqui puede dar de alta, modificar y eliminar un usuario</p>
    <a href="Usuarios.aspx" onclick="" class="btn btn-primary">CLICK AQUI!</a>
  </div>
   
</div>

       
  
     
   <! –– CARD DE PACIENTES ––>

  <div class="card" style="width: 18rem;">
  <img src="https://rochepacientes.es/dam/assets/images/artritis-medico-paciente.jpg" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Listado de pacientes </h5>
    <p class="card-text">Aqui puede dar de alta, modificar, eliminar  y hacer una reserva a un Paciente </p>
    <a href="Pacientes.aspx" onclick="" class="btn btn-primary">CLICK AQUI!</a>
  </div>
</div>

  <! –– CARD DE Especialidades ––>
  
  <div class="card" style="width: 18rem;">
  <img src="https://static.wixstatic.com/media/7869d1_b307bfb560804a5893200b191d944665~mv2.png/v1/fill/w_867,h_571,al_c/7869d1_b307bfb560804a5893200b191d944665~mv2.png" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Listado de Especialidades</h5>
    <p class="card-text">Aqui puede dar de alta, modificar, eliminar  y crear una nueva Especialidad</p>
    <a href="Especialidades.aspx" onclick="" class="btn btn-primary">CLICK AQUI!</a>
  </div>
</div>

      <! –– CARD DE Reservas––>
     

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
