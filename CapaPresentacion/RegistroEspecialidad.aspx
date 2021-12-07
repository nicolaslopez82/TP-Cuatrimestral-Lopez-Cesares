<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistroEspecialidad.aspx.cs" Inherits="CapaPresentacion.RegistroEspecialidad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label">Ingrese el nombre de la nueva Especialidad</label>
    <asp:TextBox ID="txtDescripcion" class="form-control" runat="server"></asp:TextBox>
  <div id="emailHelp" class="form-text">Recorda que solo admite 25 caracteres</div>
<asp:Button ID="btnAceptar" class="btn btn-success" OnClick="btnAceptar_Click" runat="server" Text="Registrar" />
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
