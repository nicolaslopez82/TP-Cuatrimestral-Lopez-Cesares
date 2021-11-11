<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CapaPresentacion.Login" %>

<!DOCTYPE html>
<html class="bg-black" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="content-language" content="es" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>UTN Clinica | Log in</title>
     <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="./plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/dist/css/adminlte.min.css">
</head>
<body class="hold-transition login-page">
  <div class="login-box">
    <div class="login-logo">
    <a href="/index.html"><b>UTN</b>-Clinica</a>
  </div>
    <!-- /.login-logo -->
    <div class="card">
      <form id="form1" runat="server">
        <div class="card-body login-card-body">
          <p class="login-box-msg">Login para iniciar sesion</p> 
            <div class="form-box" id="login-box">
                <asp:Login ID="Login1" runat="server" EnableViewState="false" OnAuthenticate="LoginUser_Authenticate" Width="100%">
                    <LayoutTemplate>
                       <div class="input-group mb-3">
                          <asp:TextBox ID="UserName" runat="server" CssClass="form-control" placeholder="Ingrese usuario..."></asp:TextBox>
                            <div class="input-group-append">
                              <div class="input-group-text">
                                <span class="fas fa-envelope"></span>
                              </div>
                            </div>
                         </div>

                         <div class="input-group mb-3">
                            <asp:TextBox ID="Password" runat="server" CssClass="form-control" placeholder="Ingrese clave..." TextMode="Password"></asp:TextBox>
                              <div class="input-group-append">
                                <div class="input-group-text">
                                  <span class="fas fa-lock"></span>
                                </div>
                              </div>
                          </div>

                         <div class="row">
                          <asp:Label ID="LblError" runat="server" CssClass="alert-danger" ></asp:Label>
                         </div>

                         <div class="row">                                
                            <asp:Button ID="btnIngresar" CommandName="Login" runat="server" Text="Inicar Sesion" CssClass="btn bg-olive btn-block" />
                         </div>
                    
                  </LayoutTemplate>
                </asp:Login>
            </div>
            <div class="row">
              <br>
            </div>
              <p class="mb-1">
                <a href="forgot-password.html">Olvide mi password</a>
              </p>
              <p class="mb-0">
                <a href="Registro.aspx" class="text-center">Registrar como nuevo miembro</a>
              </p>
          <%--</div>--%>
      </form>
     </div>
    <!-- /.login-card-body -->
    </div>
<!-- /.login-box -->

<!-- jQuery -->
<script src="/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/dist/js/adminlte.min.js"></script>
  </body>
</html>
