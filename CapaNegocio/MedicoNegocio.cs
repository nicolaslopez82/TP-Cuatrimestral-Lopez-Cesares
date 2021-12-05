using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDominio;
using CapaDAO;

namespace CapaNegocio
{
    class MedicoNegocio
    {
        #region "PATRON SINGLETON"
        private static MedicoNegocio objMedico = null;
        private MedicoNegocio() { }
        public static MedicoNegocio getInstance()
        {
            if (objMedico == null)
            {
                objMedico = new MedicoNegocio();
            }
            return objMedico;
        }
        #endregion

        public Medico BuscarMedico(String dni)
        {
            try
            {
                return MedicoDAO.getInstance().BuscarMedico(dni);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool eliminarMedico(Medico objMedico)
        {
            try
            {
                return MedicoDAO.getInstance().EliminarMedico(objMedico);
            }
            catch (Exception ex)

            {

                throw ex;
            }
        }
        public bool ModificarEspecialidadMedico(Medico objMedico)
        {
            try
            {
                return MedicoDAO.getInstance().ModificarEspecialidadMedico(objMedico);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

    }
}
