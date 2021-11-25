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
       // Page.ClientScript.RegisterClientScriptInclude("Pacientes.js", "javascript/Pacientes.js");
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

    [WebMethod]
    public static bool ActualizarDatosPaciente(String id,
                                                String nombres,
                                                String apellido,
                                                String edad,
                                                String sexo,
                                                String nroDocumento,
                                                String direccion,
                                                String telefono)
    {      
      char cSexo = sexo.Equals("Masculino") ? 'M' : 'S';     
      Paciente objPaciente = new Paciente()
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

      bool ok = PacienteNegocio.getInstance().Actualizar(objPaciente);
      return ok;
    }

    [WebMethod]
    public static bool EliminarPaciente(String id)
    {
      Int32 idPaciente = Convert.ToInt32(id);

      bool ok = PacienteNegocio.getInstance().Eliminar(idPaciente);

      return ok;

    }

    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
      // Registro del paciente
      Paciente objPaciente = GetEntity();
      // enviar a la capa de logica de negocio
      bool response = PacienteNegocio.getInstance().RegistrarPaciente(objPaciente);
      if (response)
      {
        clearRegistrarPacienteForm();
        Response.Write("<script>alert('REGISTRO CORRECTO.')</script>");
      }
      else
      {
        Response.Write("<script>alert('REGISTRO INCORRECTO.')</script>");
      }
    }

    private Paciente GetEntity()
    {
      Paciente objPaciente = new Paciente();
      objPaciente.IdPaciente = 0;
      objPaciente.Nombres = txtNombres.Text;
      objPaciente.Apellido = txtApellido.Text;
      objPaciente.Edad = Convert.ToInt32(txtEdad.Text);
      objPaciente.Sexo = (ddlSexo.SelectedValue == "Femenino") ? 'F' : 'M'; // Masculino , Femenino
      objPaciente.NroDocumento = txtNroDocumento.Text;
      objPaciente.Direccion = txtDireccion.Text;
      objPaciente.Telefono = txtTelefono.Text;
      objPaciente.Estado = true;

      return objPaciente;
    }

    private void clearRegistrarPacienteForm()
    {
      txtNombres.Text = "";
      txtApellido.Text = "";
      txtEdad.Text = "";
      ddlSexo.SelectedValue = "Masculino";
      txtNroDocumento.Text = "";
      txtDireccion.Text = "";
      txtTelefono.Text = "";
    }
  }
}
