using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using CapaDominio;
using CapaAccesoDatos;

namespace CapaDAO
{
    public class UsuarioDAO
    {
        #region "PATRON SINGLETON"
        private static UsuarioDAO daoUsuario = null;
        private static string Patron = "utnclinica";
        private UsuarioDAO() { }
        public static UsuarioDAO getInstance()
        {
            if (daoUsuario == null)
            {
                daoUsuario = new UsuarioDAO();
            }
            return daoUsuario;
        }
        #endregion

        public Usuario AccesoSistema(String user, String pass)
        {
            SqlConnection conexion = null;
            SqlCommand cmd = null;
            Usuario objUsuario = null;
            SqlDataReader dr = null;
            try
            {
                conexion = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("SP_ValidarUsuario", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@usuario", user);
                cmd.Parameters.AddWithValue("@contrasenia", pass);
                cmd.Parameters.AddWithValue("@patron", Patron);
                conexion.Open();
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    objUsuario = new Usuario();
                    objUsuario.ID = Convert.ToInt32(dr["idUsuario"].ToString());
                    objUsuario.RUsuario = dr["usuario"].ToString();
                    objUsuario.Contrasenia = dr["contrasenia"].ToString();
                    objUsuario.Nombre = dr["nombre"].ToString();
                    objUsuario.Apellido = dr["apellido"].ToString();
                    objUsuario.NroDocumento = dr["nroDocumento"].ToString();
                    objUsuario.Estado = true;
                }
            }
            catch (Exception ex)
            {
                objUsuario = null;
                throw ex;
            }
            finally
            {
                conexion.Close();
            }
            return objUsuario;
        }

        public Usuario BuscarUsuarioPorDNI(String nroDocumento)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            Usuario objUsuario = new Usuario();

            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("SP_BuscarUsuarioPorDNI", con);
                cmd.Parameters.AddWithValue("@prmNroDocumento", nroDocumento);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();

                dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    objUsuario.ID = Convert.ToInt32(dr["idUsuario"].ToString());
                    objUsuario.Nombre = dr["nombre"].ToString();
                    objUsuario.Apellido = dr["apellido"].ToString();
                    objUsuario.NroDocumento = dr["nroDocumento"].ToString();
                    objUsuario.RTipoUsuario.Descripcion = dr["usuario"].ToString();
                }

            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                con.Close();
            }

            return objUsuario;
        }

        public Usuario BuscarUsuarioPorUsuario(String usuario)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            Usuario objUsuario = new Usuario();

            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("SP_BuscarUsuarioPorUsuario", con);
                cmd.Parameters.AddWithValue("@prmUsuario", usuario);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();

                dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    objUsuario.ID = Convert.ToInt32(dr["idUsuario"].ToString());
                    objUsuario.Nombre = dr["nombre"].ToString();
                    objUsuario.Apellido = dr["apellido"].ToString();
                    objUsuario.NroDocumento = dr["nroDocumento"].ToString();
                    objUsuario.RTipoUsuario.Descripcion = dr["usuario"].ToString();
                }

            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                con.Close();
            }

            return objUsuario;
        }

        public bool BuscarSiExisteUsuarioPorUsuario(String usuario)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;   
            Usuario objUsuario = new Usuario();
            int nResult = 0;

            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("SP_BuscarSiExisteUsuarioPorUsuario", con);
                cmd.Parameters.AddWithValue("@prmUsuario", usuario);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                
                nResult =  (int)cmd.ExecuteScalar();
                if (nResult == 1) { return true; }                
                
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                con.Close();
            }

            return false;
        }

        public bool RegistrarUsuario(Usuario usuario) 
        {
            SqlConnection con = null;
            SqlCommand cmd = null;    
            bool response = false;

            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("SP_AgregarUsuario", con);
                cmd.Parameters.AddWithValue("@idTipoUsuario", usuario.RTipoUsuario.ID);
                cmd.Parameters.AddWithValue("@nombre", usuario.Nombre);
                cmd.Parameters.AddWithValue("@apellido", usuario.Apellido);
                cmd.Parameters.AddWithValue("@nroDocumento", usuario.NroDocumento);
                cmd.Parameters.AddWithValue("@estado", usuario.Estado);
                cmd.Parameters.AddWithValue("@usuario", usuario.RUsuario);
                cmd.Parameters.AddWithValue("@contrasenia", usuario.Contrasenia);
                cmd.Parameters.AddWithValue("@patron", Patron);

                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();

                int filas = cmd.ExecuteNonQuery();
                if (filas > 0) response = true;

            }
            catch (Exception e)
            {
                response = false;
                throw e;
            }
            finally
            {
                con.Close();
            }

            return response;
        }

        public List<Usuario> ListarUsuarios()
        {
            List<Usuario> Lista = new List<Usuario>();
            SqlConnection con = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;

            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("SP_ListarUsuarios", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Usuario objUsuario = new Usuario();
                    //objUsuario.Apellido = (string)dr["apellido"];
                    //objUsuario.Nombre = (string)dr["nombre"];
                    //objUsuario.NroDocumento = (string)dr["nroDocumento"];                    
                    // objUsuario.RUsuario = (string)dr["usuario"];
                    objUsuario.ID = Convert.ToInt32(dr["idUsuario"].ToString());
                    objUsuario.Nombre = dr["nombre"].ToString();
                    objUsuario.Apellido = dr["apellido"].ToString();
                    objUsuario.NroDocumento = dr["nroDocumento"].ToString();
                    objUsuario.RUsuario = dr["usuario"].ToString();

                    Lista.Add(objUsuario);
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
