using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using CapaDominio;
using CapaNegocio;
using System.Web.Security;
using System.Web.SessionState;

namespace CapaPresentacion
{
  public partial class Login : System.Web.UI.Page
  {
    
    protected void Page_Load(object sender, EventArgs e)
    {
      if (!Page.IsPostBack)
      {
        Session["UserSessionId"] = null;
      }
    }

    protected void LoginUser_Authenticate(object sender, EventArgs e)
    {
     
        Usuario usuario = UsuarioNegocio.getInstance().AccesoSistema(Login1.UserName, Login1.Password);

        if (usuario != null)
        {
          SessionIDManager manager = new SessionIDManager();
          //SessionManager.UserSessionId = objEmpleado.ID.ToString();
          bool redirected = false;
          bool isAdded = false;
          string newID = manager.CreateSessionID(Context);
          manager.SaveSessionID(Context, newID, out redirected, out isAdded);          
          FormsAuthentication.RedirectFromLoginPage(Login1.UserName, false);
          Response.Redirect("index.aspx");
        }
        else
        {
          Response.Write("<script>alert('Usuario y/o Password incorrecto.')</script>");
        }    
    }

  }
}
