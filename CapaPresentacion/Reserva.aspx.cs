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

    public static Paciente pacienterese = new Paciente();    

    protected void Page_Load(object sender, EventArgs e)
    {
      if (Session["usuario"] == null)
      {
        Session.Add("error", "Debes loguearte para ingresar");
        Response.Redirect("Error.aspx", false);
      }

      try
      {
        if (!Page.IsPostBack)
        {
          //obtengo datos y los guardo en sesión.
          Session["listaMedicos"] = MedicoNegocio.getInstance().ListarMedicos();
          Session["listaHorariosDisponibles"] = HorarioDisponibleNegocio.getInstance().ListarHorariosDisponibles();

          //configuro desplegable POKEMONS desde db pero solo lo cargo
          //ddlMedicos.DataSource = EspecialidadNegocio.getInstance().listarEspecialidad();;
          //ddlMedicos.DataBind();

          //configuro desplegable TIPOS desde db con id y desc
          ddlEspecialidades.DataSource = EspecialidadNegocio.getInstance().listarEspecialidad();
          ddlEspecialidades.DataTextField = "Descripcion";
          ddlEspecialidades.DataValueField = "IdEspecialidad";
          ddlEspecialidades.DataBind();
        }
      }
      catch (Exception ex)
      {
        Session.Add("error", ex);
      }      
    }

    protected void ddlEspecialidades_SelectedIndexChanged(object sender, EventArgs e)
    {
      if (IsPostBack)
      {
        int id = int.Parse(ddlEspecialidades.SelectedItem.Value);
        ddlMedicos.DataSource = ((List<Medico>)Session["listaMedicos"]).FindAll(x => x.Especialidad.IdEspecialidad == id);
        ddlMedicos.DataTextField = "Apellido";                
        ddlMedicos.DataValueField = "IdMedico";
        ddlMedicos.DataBind();
      }
    }

    protected void ddlMedicos_SelectedIndexChanged(object sender, EventArgs e)
    {
      if (IsPostBack)
      {
        int id = int.Parse(ddlMedicos.SelectedItem.Value);
        ddlHorarioDisponible.DataSource = ((List<HorarioDisponible>)Session["listaHorariosDisponibles"]).FindAll(x => x.RMedico.IdMedico == id);
        ddlHorarioDisponible.DataTextField = "FechaHorarioDisponible";
        ddlHorarioDisponible.DataValueField = "IdHorarioDisponible";
        ddlHorarioDisponible.DataBind();
      }
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
      HttpContext.Current.Session.Add("PacienteRese", objpaciente);
      pacienterese = objpaciente;
    }

    [WebMethod]
    public List<Especialidad> getLista()
    {
      try
      {
        return EspecialidadNegocio.getInstance().listarEspecialidad();         
      }
      catch (Exception ex)
      {
        throw ex;
      }      
    }

    [WebMethod]
    public void ListarEspecialidades()
    {
      try
      {         
        JavaScriptSerializer js = new JavaScriptSerializer();
        Context.Response.Write(js.Serialize(EspecialidadNegocio.getInstance().listarEspecialidad()));
      }
      catch (Exception ex)
      {
        throw ex;
      }
    }

    [WebMethod]
    public List<Medico> ListarMedicosPorEspecialidad(int idEspecialidad)
    {
      try
      {
        return MedicoNegocio.getInstance().BuscarMedicosPorEspecialidad(idEspecialidad);
      }
      catch (Exception ex)
      {
        throw ex;
      }      
    }

    [WebMethod]
    public List<HorarioDisponible> ListarHorariosDisponiblesPorMedico(int idMedico)
    {
      try
      {
        return HorarioDisponibleNegocio.getInstance().ListarHorariosDisponiblesPorMedico(idMedico);
      }
      catch (Exception ex)
      {
        throw ex;
      }
    }    
  }
}
