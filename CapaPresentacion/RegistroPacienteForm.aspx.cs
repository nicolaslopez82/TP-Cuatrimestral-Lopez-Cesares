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
  public partial class RegistroPacienteForm : System.Web.UI.Page
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
        // Page.ClientScript.RegisterClientScriptInclude("Pacientes.js", "javascript/Pacientes.js");
      }
    }

    // Registro del paciente

    protected void btnRegistrar_Click(object sender, EventArgs e)
    {

      if (!(validarCamposPaciente()))
      {
        Response.Write("<script>alert('REGISTRO INCORRECTO, NO PUEDE HABER CAMPOS INCOMPLETOS.')</script>");
        return;
      }

      Paciente objPaciente = GetEntity();

      // enviar a la capa de logica de negocio
      bool response = PacienteNegocio.getInstance().RegistrarPaciente(objPaciente);
      if (response)
      {
        clearRegistrarPacienteForm();
        Response.Write("<script>alert('REGISTRO CORRECTO.')</script>");
        Response.Redirect("Pacientes.aspx");
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

    private bool validarCamposPaciente()
    {
      if (txtNombres.Text.Equals("") || txtNombres.Text == null ||
          txtApellido.Text.Equals("") || txtApellido.Text == null ||
          txtEdad.Text.Equals("") || txtEdad.Text == null ||
          ddlSexo.Text.Equals("") || ddlSexo.Text == null ||
          txtNroDocumento.Text.Equals("") || txtNroDocumento.Text == null ||
          txtDireccion.Text.Equals("") || txtDireccion.Text == null ||
          txtTelefono.Text.Equals("") || txtTelefono.Text == null)
      { return false; }
      else { return true; }
    }  
  }
}
