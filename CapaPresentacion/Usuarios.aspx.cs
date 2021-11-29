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

    // Registro del Usuario 
    protected void btnRegistrar_Click(object sender, EventArgs e)
    {

      if (TieneCamposVacios())
      {
        Response.Write("<script>alert('Registro de usuario incorrecto, no pueden haber campos incompletos.')</script>");
        return;
      }

      if (!(MismaConfirmarPassword()))
      {
        Response.Write("<script>alert('Las contrasenias no coinciden.')</script>");
        return;
      }

      if (EsUsuarioExistente())
      {
        Response.Write("<script>alert('Nombre de usuario ya registrado.')</script>");
        return;
      }

      Usuario objUsuario = GetEntity();

      bool usuarioAgregado = UsuarioNegocio.getInstance().RegistrarUsuario(objUsuario);
      if (usuarioAgregado == true)
      {
        Response.Write("<script>alert('Usuario registrado correctamente.')</script>");
        Response.Redirect("Usuarios.aspx");
        return;
      }
      else
      {
        Response.Write("<script>alert('Usuario No Registrado.')</script>");
        return;
      }
    }

    private Usuario GetEntity()
    {
      Usuario objUsuario = new Usuario();

      switch (ddlTipoUsuario.SelectedValue)
      {
        case "Administrador":
          objUsuario.RTipoUsuario.ID = 1;
          break;

        case "Recepcionista":
          objUsuario.RTipoUsuario.ID = 2;
          break;

        case "Medico":
          objUsuario.RTipoUsuario.ID = 3;
          break;

        default:
          objUsuario.RTipoUsuario.ID = 3;
          break;
      }
      
      objUsuario.Nombre = txtNombres.Text;
      objUsuario.Apellido = txtApellido.Text;            
      objUsuario.NroDocumento = txtNroDocumento.Text;
      objUsuario.RUsuario = txtUsuario.Text;
      objUsuario.Contrasenia = txtPassword.Text;      
      objUsuario.Estado = true;

      return objUsuario;
    }

    private bool TieneCamposVacios()
    {
      if (txtNombres.Text == "" ||
          txtApellido.Text == "" ||
          txtNroDocumento.Text == "" ||
          txtUsuario.Text == "" ||
          txtPassword.Text == "" ||
          txtConfirmarPassword.Text == "")
      {return true;}
      else 
      {return false;}
    }

    private bool MismaConfirmarPassword()
    {
      if (txtPassword.Text.Equals(txtConfirmarPassword)) {return true;}
      else { return true;}
    }

    private bool EsUsuarioExistente()   
    {
      bool existeUsuario = UsuarioNegocio.getInstance().BuscarSiExisteUsuarioPorUsuario(txtUsuario.Text);
      return existeUsuario;
    }

    private void LimpiarCamposRegistroUsuarios()
    {
      //ddlTipoUsuario.SelectedValue = "Medico";
      txtNombres.Text = "";
      txtApellido.Text = "";
      txtNroDocumento.Text = "";
      txtUsuario.Text = "";
      txtPassword.Text = "";
      txtConfirmarPassword.Text = "";
    }
  }
}
