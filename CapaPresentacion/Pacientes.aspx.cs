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
        // Page.ClientScript.RegisterClientScriptInclude("Pacientesjs", "js/Pacientes.js");
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

    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
      // Registro del paciente
      Paciente objPaciente = GetEntity();
      // enviar a la capa de logica de negocio
      bool response = PacienteNegocio.getInstance().RegistrarPaciente(objPaciente);
      if (response)
      {
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
      //objPaciente.IdPaciente = 0;
      //objPaciente.Nombres = txtNombres.Text;
      //objPaciente.Apellido = txtApellido.Text;
      //objPaciente.Edad = Convert.ToInt32(txtEdad.Text);
      //objPaciente.Sexo = (ddlSexo.SelectedValue == "Femenino") ? 'F' : 'M'; // Masculino , Femenino
      //objPaciente.NroDocumento = txtNroDocumento.Text;
      //objPaciente.Direccion = txtDireccion.Text;
      //objPaciente.Telefono = txtTelefono.Text;
      //objPaciente.Estado = true;

      return objPaciente;
    }
  }
}
