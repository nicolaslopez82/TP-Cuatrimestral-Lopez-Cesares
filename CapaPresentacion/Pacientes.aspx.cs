using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.Script.Serialization;
using CapaNegocio;
using CapaDominio;

namespace CapaPresentacion
{
  public partial class Pacientes : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      if (!Page.IsPostBack)
      {
        // Page.ClientScript.RegisterClientScriptInclude("pacientejs", "js/paciente.js");
      }
    }

    [WebMethod]
    public static List<Paciente> ListarPacientes()
    {
      List<Paciente> Lista = null;
      try
      {
        Lista = PacienteNegocio.getInstance().ListarPacientes();
      }
      catch (Exception ex)
      {
        Lista = new List<Paciente>();
      }
      return Lista;
    }
  }
}
