using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapaPresentacion
{
  public partial class index : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      if (Session["usuario"] == null)
      {
        Session.Add("error", "Debes loguearte para ingresar");
        Response.Redirect("Error.aspx", false);
      }

      if (!Page.IsPostBack)
      {}
    }
  }
}
