using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Services;
using System.Web.UI.WebControls;

namespace CapaPresentacion
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {      
          if (Session["usuario"] == null)
          {                     
            Session.Add("error", "Debes loguearte para ingresar");
            Response.Redirect("Error.aspx", false);
          }

          if (!Page.IsPostBack)
          {
            if (Session["userName"] != null)
            {
              lblUserName.Text = Session["userName"].ToString();
            }          
          }        
        }

    [WebMethod]
    public static bool Logout()
    {
      HttpContext.Current.Session.Clear();
      HttpContext.Current.Session.Abandon();
      return true;
    }
  }
}
