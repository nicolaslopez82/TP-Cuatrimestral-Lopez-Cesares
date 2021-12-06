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
using Newtonsoft.Json;

namespace CapaPresentacion
{
  public partial class Reserva : System.Web.UI.Page
  {

    //ist<Paciente> Pacientelist { get; set; }

    public static Paciente pacienterese = new Paciente();
    List<Especialidad> especialidadList { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
      if (Session["usuario"] == null)
      {
        Session.Add("error", "Debes loguearte para ingresar");
        Response.Redirect("Error.aspx", false);
      }

      if (!Page.IsPostBack)
      {
        // Page.ClientScript.RegisterClientScriptInclude("Pacientes.js", "javascript/Pacientes.js");
      }
    }

    [WebMethod]
    public List<Especialidad> getLista()
    {
      especialidadList = EspecialidadNegocio.getInstance().listarEspecialidad();
      return especialidadList;
    }

    [WebMethod]
    public Dictionary<int, string> LoadDropDownEspecialidades()
    {
      especialidadList = EspecialidadNegocio.getInstance().listarEspecialidad();
      Dictionary<int, string> EspecialidadesData = new Dictionary<int, string>();
      foreach(Especialidad especialidad in especialidadList){
        EspecialidadesData.Add(especialidad.IdEspecialidad, especialidad.Descripcion);
      }
      string json = JsonConvert.SerializeObject(EspecialidadesData);
      return EspecialidadesData;
    }

    [WebMethod(EnableSession = true)]
    public static void CargarSession(String id,
                                                String nombres,
                                                String apellido,
                                                String edad,
                                                String sexo,
                                                String nroDocumento,
                                                String direccion,
                                                String telefono)
    {

      char cSexo = sexo.Equals("Masculino") ? 'M' : 'F';
      Paciente objpaciente = new Paciente()
      {
        IdPaciente = Convert.ToInt32(id),
        Nombres = nombres,
        Apellido = apellido,
        Edad = Convert.ToInt32(edad),
        Sexo = cSexo,
        NroDocumento = nroDocumento,
        Direccion = direccion,
        Telefono = telefono

      };
      //HttpContext.Current.Session.Add("PacienteRese", objpaciente);
      pacienterese = objpaciente;
    }

    //protected void btnRegistrar_Click(object sender, EventArgs e) {
    //  List<Especialidad> EspecialidadList; 
    //  List<Medico> MedicoList; 
    //  List<HorarioDisponible> HorarioDisponibleList;

    //  EspecialidadNegocio.getInstance().listarEspecialidad();

    //  try
    //  {
    //    return PacienteDAO.getInstance().ListarPacientes();
    //  }
    //  catch (Exception ex)
    //  {
    //    throw ex;
    //  }
    //}
  }
}
