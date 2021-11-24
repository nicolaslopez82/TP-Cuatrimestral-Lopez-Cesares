using System;
using System.Collections.Generic;
using CapaDominio;
using CapaDAO;

namespace CapaNegocio
{
    public class PacienteNegocio
    {
        #region "PATRON SINGLETON"
        private static PacienteNegocio objUsuario = null;
        private PacienteNegocio() { }
        public static PacienteNegocio getInstance()
        {
            if (objUsuario == null)
            {
                objUsuario = new PacienteNegocio();
            }
            return objUsuario;
        }
        #endregion

        public bool RegistrarPaciente(Paciente objPaciente)
        {
            try
            {
                return PacienteDAO.getInstance().RegistrarPaciente(objPaciente);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<Paciente> ListarPacientes()
        {
            try
            {
                return PacienteDAO.getInstance().ListarPacientes();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool Actualizar(Paciente objPaciente)
        {
            try
            {
                return PacienteDAO.getInstance().Actualizar(objPaciente);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool Eliminar(int idPaciente)
        {
            try
            {
                return PacienteDAO.getInstance().Eliminar(idPaciente);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Paciente BuscarPacienteDNI(string dni)
        {
            try
            {
                return PacienteDAO.getInstance().BuscarPacienteDNI(dni);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
