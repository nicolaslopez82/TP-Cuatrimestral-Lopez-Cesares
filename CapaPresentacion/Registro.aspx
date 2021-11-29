<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="CapaPresentacion.Registro" %>

<!DOCTYPE html>
<html class="bg-black" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="content-language" content="es" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>UTN Clinica | Registrar</title>
     <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="./plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/dist/css/adminlte.min.css">
</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
    <a href="/index.html"><b>UTN</b>-Clinica</a>
  </div>
    <!-- /.login-logo -->
    <div class="card">
      <form id="formRegistro" runat="server">
        <div class="card-body login-card-body">
          <p class="login-box-msg">Registrar Usuario</p> 
            <div class="form-box" id="login-box">                
                    <LayoutTemplate>
                       <div class="input-group mb-3">
                          <asp:TextBox ID="RegisterNombre" runat="server" CssClass="form-control" placeholder="Ingrese nombre..."></asp:TextBox>
                          <div class="input-group-append">
                            <div class="input-group-text">
                              <span class="fas fa-user"></span>
                            </div>
                          </div>
                        </div>

                         <div class="input-group mb-3">
                            <asp:TextBox ID="RegisterApellido" runat="server" CssClass="form-control" placeholder="Ingrese apellido..."></asp:TextBox>
                            <div class="input-group-append">
                              <div class="input-group-text">
                                <span class="fas fa-user"></span>
                              </div>
                            </div>
                          </div>
		                  <div class="input-group mb-3">
                            <asp:TextBox ID="RegisterDNI" runat="server" CssClass="form-control" placeholder="Ingrese DNI..."></asp:TextBox>
                            <div class="input-group-append">
                              <div class="input-group-text">
                                <span class="fas fa-user"></span>
                              </div>
                            </div>
                          </div>
                          <div class="input-group mb-3">                            
                            <asp:TextBox ID="RegisterUsuario" runat="server" CssClass="form-control" placeholder="Ingrese Usuario..."></asp:TextBox>
                            <div class="input-group-append">
                              <div class="input-group-text">
                                <span class="fas fa-envelope"></span>
                              </div>
                            </div>
                          </div>
                          <div class="input-group mb-3">
                            <asp:TextBox ID="RegisterPassword" runat="server" CssClass="form-control" placeholder="Ingrese password..." TextMode="Password"></asp:TextBox>
                            <div class="input-group-append">
                              <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                              </div>
                            </div>
                          </div>
                          <div class="input-group mb-3">
                           <asp:TextBox ID="RegisterRePassword" runat="server" CssClass="form-control" placeholder="Confirme password..." TextMode="Password"></asp:TextBox>
                            <div class="input-group-append">
                              <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-8">
                              <div class="icheck-primary">
                                <input type="checkbox" id="agreeTerms" name="terms" value="agree"/>
                                <label for="agreeTerms">
                                 Acepto los terminos <a href="#">terminos</a>
                                </label>
                              </div>
                            </div>
                            <!-- /.col -->
                            <div class="col-4">
                              <%--<button type="submit" class="btn btn-primary btn-block">Registrar</button>--%>
                               <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" CssClass="btn btn-primary btn-block" OnClick="BtnRegistrar_Click" />
                            </div>
                            <!-- /.col -->
                          </div>
                          <asp:TableRow runat="server">
                           <asp:TableCell ColumnSpan="2" runat="server">
                            <asp:Label runat="server" CssClass="alert-danger" ID="lblError"></asp:Label>
                            <asp:Label runat="server" CssClass="alert-danger" ID="lblErrorContrasenia"></asp:Label>
                           </asp:TableCell>
                          </asp:TableRow>
                  </LayoutTemplate>          
            </div>            
          </div>
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





<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>--%>
