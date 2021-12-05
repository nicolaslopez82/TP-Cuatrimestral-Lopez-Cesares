using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDominio;
using CapaDAO;

namespace CapaNegocio
{
    public class EspecialidadNegocio
    {
        #region "PATRON SINGLETON"
        private static EspecialidadNegocio objUsuario = null;
        private EspecialidadNegocio() { }
        public static EspecialidadNegocio getInstance()
        {
            if (objUsuario == null)
            {
                objUsuario = new EspecialidadNegocio();
            }
            return objUsuario;
        }
        #endregion


        public bool registrarEspecialidad(Especialidad ObjEspecialidad)
        {
            try
            {
                return EspecialidadDAO.getInstance().registrarEspecialidad(ObjEspecialidad);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public bool EliminarEspecialidad(Especialidad ObjEspecialidad)
        {
            try
            {
                return EspecialidadDAO.getInstance().EliminarEspecialidad(ObjEspecialidad);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public bool ModificarDescripcion(Especialidad ObjEspecialidad)
        {
            try
            {
                return EspecialidadDAO.getInstance().ModificarDescripcion(ObjEspecialidad);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public List<Especialidad> listarEspecialidad()
        {
            try
            {
                return EspecialidadDAO.getInstance().ListarEspecialidad();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
