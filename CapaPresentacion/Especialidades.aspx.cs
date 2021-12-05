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
  public partial class Especialidades : System.Web.UI.Page
  {

    public List<Especialidad> especialidadList { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
      especialidadList = EspecialidadNegocio.getInstance().listarEspecialidad();
    }

    [WebMethod]
    public static List<Especialidad> ListarEspe()
    {
      List<Especialidad> lista = null;

      try
      {
        lista = EspecialidadNegocio.getInstance().listarEspecialidad();
      }
      catch (Exception ex)
      {

        lista = new List<Especialidad>();
      }
      return lista;
    }

    [WebMethod]
    public static bool ActualizarDes(string IdEspecialidad, string Descripcion)
    {
      Especialidad objespe = new Especialidad()
      {
        IdEspecialidad = Convert.ToInt32(IdEspecialidad),
        Descripcion = Descripcion
      };

      bool aux = EspecialidadNegocio.getInstance().ModificarDescripcion(objespe);

      return aux;


    }

    [WebMethod]
    public static bool EliminarEspe(string IdEspecialidad)
    {
      Especialidad objespe = new Especialidad()
      {
        IdEspecialidad = Convert.ToInt32(IdEspecialidad)
      };

      bool aux = EspecialidadNegocio.getInstance().EliminarEspecialidad(objespe);

      return aux;


    }


    /*
    protected void btnAceptar_Click(object sender, EventArgs e)
    {
      Especialidad objespe = new Especialidad();
      objespe.Descripcion = txtDescripcion.Text;
      objespe.Estado = true;



        bool aux= EspecialidadNegocio.getInstance().registrarEspecialidad(objespe);
      if (aux)
      {
        Response.Redirect("Especialidades.aspx");
      }
      else
      {
        Response.Write("<script>alert('Especialidad No Registrada.')</script>");
      }
    }
    */
  }
}
