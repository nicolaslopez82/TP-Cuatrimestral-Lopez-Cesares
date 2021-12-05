using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDominio;
using System.Data.SqlClient;
using CapaAccesoDatos;

namespace CapaDAO
{
    public class MedicoDAO
    {
        #region "PATRON SINGLETON"
        private static MedicoDAO daoMedico = null;
        private MedicoDAO() { }
        public static MedicoDAO getInstance()
        {
            if (daoMedico == null)
            {
                daoMedico = new MedicoDAO();
            }
            return daoMedico;
        }
        #endregion

        //Buscador de medico por DNI
        public Medico BuscarMedico(String dni)
        {
            SqlConnection conexion = null;
            SqlCommand cmd = null;
            Medico objMedico = null;
            SqlDataReader dr = null;

            try
            {
                conexion = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("SP_BuscarMedico", conexion);
                cmd.Parameters.AddWithValue("@prmDni", dni);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                conexion.Open();

                dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    // instanciar nuestro objeto
                    objMedico = new Medico()
                    {
                        IdMedico = Convert.ToInt32(dr["idMedico"].ToString()),
                        ID = Convert.ToInt32(dr["idUsuario"].ToString()),
                        Nombre = dr["nombre"].ToString(),
                        Apellido = dr["apellido"].ToString(),
                        Especialidad = new Especialidad()
                        {
                            IdEspecialidad = Convert.ToInt32(dr["idEspecialidad"].ToString()),
                            Descripcion = dr["descripcion"].ToString(),
                        },
                        Estado = Convert.ToBoolean(dr["estadoMedico"].ToString())
                    };
                }


            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conexion.Close();
            }
            return objMedico;
        }


        //Ingresar un nuevo medico a la tabla
        public bool registrarMedico(Medico objMedico)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;

            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("SP_InsertarMedico", con);
                cmd.Parameters.AddWithValue("@idUsuarioEntrante", objMedico.ID);
                cmd.Parameters.AddWithValue("@idEspecialidadEntrante", objMedico.Especialidad);
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

        // Eliminar un medico (Da de baja o elimina depende el trigger)
        public bool EliminarMedico(Medico objmedico)
        {

            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;

            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("SP_EliminarMedico", con);
                cmd.Parameters.AddWithValue("idMedicoEntrante", objmedico.IdMedico);

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

        // Modificar la especialidad de un medico
        public bool ModificarEspecialidadMedico(Medico objMedico)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;

            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("SP_ModificarEspecialidadMedico", con);
                cmd.Parameters.AddWithValue("@idMedicoEntrante", objMedico.IdMedico);
                cmd.Parameters.AddWithValue("@idEspecialidadNuevo", objMedico.Especialidad.IdEspecialidad);

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

        //Volver a dar de alta a un Medico
        public bool DarDeAltaAMedico(Medico objMedico)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;

            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("SP_DarAltaMedico", con);
                cmd.Parameters.AddWithValue("@idMedicoEntrante", objMedico.IdMedico);

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
        //Lista de medicos 

        public List<Medico> ListaMedicos()
        {
            List<Medico> Lista = new List<Medico>();
            SqlConnection con = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;


            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("SP_ListaMedicos", con);

                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                con.Open();

                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Medico objMedico = new Medico();
                    {
                        objMedico.IdMedico = (int)dr["idMedico"];

                        objMedico.Especialidad = new Especialidad();
                        objMedico.Especialidad.IdEspecialidad = (int)dr["IdEspecialidad"];
                        objMedico.Especialidad.Descripcion = (string)dr["descripcion"];

                        objMedico.Nombre = (string)dr["nombre"];
                        objMedico.Apellido = (string)dr["apellido"];
                        objMedico.NroDocumento = (string)dr["nroDocumento"];



                    }
                    Lista.Add(objMedico);
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

        //Lista Medicos Dados de baja

        public List<Medico> ListaMedicosDEBAJA()
        {
            List<Medico> Lista = new List<Medico>();
            SqlConnection con = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;


            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("SP_ListaMedicosDEBAJA", con);

                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                con.Open();

                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Medico objMedico = new Medico();
                    {
                        objMedico.IdMedico = (int)dr["idMedico"];

                        objMedico.Especialidad = new Especialidad();
                        objMedico.Especialidad.IdEspecialidad = (int)dr["IdEspecialidad"];
                        objMedico.Especialidad.Descripcion = (string)dr["descripcion"];

                        objMedico.Nombre = (string)dr["nombre"];
                        objMedico.Apellido = (string)dr["apellido"];
                        objMedico.NroDocumento = (string)dr["nroDocumento"];



                    }
                    Lista.Add(objMedico);
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
