using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.Script.Serialization;
using CapaDominio;
using CapaNegocio;

namespace CapaPresentacion
{
  public partial class Usuarios : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      if (!Page.IsPostBack)
      {
        // Page.ClientScript.RegisterClientScriptInclude("Usuarios.js", "javascript/Usuarios.js");
      }
    }

    [WebMethod]
    public static List<Usuario> ListarUsuarios()
    {
      List<Usuario> Lista = null;
      try
      {
        Lista = UsuarioNegocio.getInstance().ListarUsuarios();
      }
      catch (Exception ex)
      {
        Lista = new List<Usuario>();
      }
      return Lista;
    }

    [WebMethod]
    public static bool ActualizarDatosUsuario(String idUsuario,
                                                String nombres,
                                                String apellido,                                      
                                                String nroDocumento,
                                                String usuario)
    {
      Usuario objUsuario = new Usuario()
      {
        ID = Convert.ToInt32(idUsuario),
        Nombre = nombres,
        Apellido = apellido,
        NroDocumento = nroDocumento,
        RUsuario = usuario
      };

      bool ok = UsuarioNegocio.getInstance().Actualizar(objUsuario);
      return ok;
    }

    [WebMethod]
    public static bool EliminarUsuario(String idUsuario)
    {
      Int32 ID = Convert.ToInt32(idUsuario);

      bool ok = UsuarioNegocio.getInstance().Eliminar(ID);

      return ok;

    }

    //public static AgregarUsuario()
    //{
    //  if (UsuarioNombre.Text == "" ||
    //      UsuarioApellido.Text == "" ||
    //      UsuarioDNI.Text == "" ||
    //      UsuarioUser.Text == "" ||
    //      UsuarioPassword.Text == "" ||
    //      UsuarioRePassword.Text == "")
    //  {
    //    lblError.Text = "Ningun campo puede quedar vacio.";
    //  }
    //  else
    //  {
    //    if (UsuarioPassword.Text != UsuarioRePassword.Text)
    //    {
    //      lblErrorContrasenia.Text = "Las contrasenias no coinciden.";
    //    }
    //    else
    //    {
    //      bool existeUsuario = UsuarioNegocio.getInstance().BuscarSiExisteUsuarioPorUsuario(UsuarioUser.Text);

    //      if (!existeUsuario)
    //      {
    //        TipoUsuario tipoUsuario = new TipoUsuario(3, "Medico", true);
    //        Usuario usuarioAGuardar = new Usuario(-1, tipoUsuario, UsuarioNombre.Text, UsuarioApellido.Text, UsuarioDNI.Text, true, UsuarioUser.Text, UsuarioPassword.Text);
    //        bool usuarioAgregado = UsuarioNegocio.getInstance().RegistrarUsuario(usuarioAGuardar);
    //        if (usuarioAgregado == true)
    //        {
    //          //Response.Write("<script>alert('Usuario registrado correctamente.')</script>");
    //          //Response.Redirect("Login.aspx");
    //        }
    //        else
    //        {
    //          //Response.Write("<script>alert('Usuario No Registrado.')</script>");
    //        }
    //      }
    //      else
    //      {
    //        //Response.Write("<script>alert('Nombre de usuario ya registrado.')</script>");
    //      }
    //    }
    //  }
    //}
  }
}
