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
  }
}
