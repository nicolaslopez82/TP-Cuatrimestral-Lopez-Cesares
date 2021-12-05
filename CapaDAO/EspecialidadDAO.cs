using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDominio;
using CapaAccesoDatos;
using System.Data.SqlClient;


namespace CapaDAO
{
    public class EspecialidadDAO
    {


        #region "PATRON SINGLETON"
        private static EspecialidadDAO daoEspecialidad = null;
        private EspecialidadDAO() { }
        public static EspecialidadDAO getInstance()
        {
            if (daoEspecialidad == null)
            {
                daoEspecialidad = new EspecialidadDAO();
            }
            return daoEspecialidad;
        }
        #endregion



        public bool registrarEspecialidad(Especialidad ObjEspecialidad)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;

            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("SP_AgregarEspecialidad", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Descripcion", ObjEspecialidad.Descripcion);
                con.Open();

                int filas = cmd.ExecuteNonQuery();
                if (filas > 0) response = true;
            }
            catch (Exception ex)
            {
                response = false;

                throw ex;
            }
            finally
            {
                con.Close();
            }
            return response;
        }


        public bool EliminarEspecialidad(Especialidad ObjEspecialidad)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;

            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("SP_EliminarEspecialidad", con);
                cmd.Parameters.AddWithValue("@idEspecialidad", ObjEspecialidad.IdEspecialidad);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                con.Open();

                int filas = cmd.ExecuteNonQuery();
                if (filas > 0) response = true;
            }
            catch (Exception ex)
            {
                response = false;

                throw ex;
            }
            finally
            {
                con.Close();
            }
            return response;
        }

        public bool ModificarDescripcion(Especialidad objEspecialidad)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;


            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("SP_ModificarDescripcion", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idEspecialidad", objEspecialidad.IdEspecialidad);
                cmd.Parameters.AddWithValue("DescripcionNew", objEspecialidad.Descripcion);
                con.Open();

                int filas = cmd.ExecuteNonQuery();
                if (filas > 0) response = true;

            }
            catch (Exception ex)
            {
                response = false;
                throw ex;
            }
            finally
            {
                con.Close();
            }
            return response;
        }

        public List<Especialidad> ListarEspecialidad()
        {
            List<Especialidad> Lista = new List<Especialidad>();
            SqlConnection con = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;

            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("SP_ListarEspecialidad", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Especialidad objEspecialidad = new Especialidad();
                    objEspecialidad.IdEspecialidad = (int)dr["idEspecialidad"];
                    objEspecialidad.Descripcion = (string)dr["descripcion"];
                    objEspecialidad.Estado = (bool)dr["estado"];

                    Lista.Add(objEspecialidad);

                }


            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                con.Close();
            }
            return Lista;
        }
    }
}
