using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaDominio;
using CapaNegocio;

namespace CapaPresentacion
{
  public partial class RegistroEspecialidad : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void btnAceptar_Click(object sender, EventArgs e)
    {
      Especialidad objEspecialidad = new Especialidad();
      objEspecialidad.Descripcion = txtDescripcion.Text;

      bool ok = EspecialidadNegocio.getInstance().registrarEspecialidad(objEspecialidad);

      Response.Redirect("Especialidades.aspx");

    }
  }
}
