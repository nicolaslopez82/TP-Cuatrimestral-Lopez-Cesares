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
    public class HorarioDisponibleDAO
    {
        #region "PATRON SINGLETON"
        private static HorarioDisponibleDAO daoHorarioDisponible = null;
        private HorarioDisponibleDAO() { }
        public static HorarioDisponibleDAO getInstance()
        {
            if (daoHorarioDisponible == null)
            {
                daoHorarioDisponible = new HorarioDisponibleDAO();
            }
            return daoHorarioDisponible;
        }
        #endregion

        public List<HorarioDisponible> ListarHorariosDisponiblesPorMedico(int idMedico)
        {
            // HorarioDisponible = HD
            List<HorarioDisponible> HDLista = new List<HorarioDisponible>();
            SqlConnection con = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;

            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("SP_ListarHorariosDisponiblesPorMedico", con);
                cmd.Parameters.AddWithValue("@idMedico", idMedico);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                con.Open();

                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    HorarioDisponible objHorarioDisponible = new HorarioDisponible();
                    {
                        objHorarioDisponible.IdHorarioDisponible = (int)dr["idHorarioDisponible"];
                        objHorarioDisponible.FechaHorarioDisponible = (DateTime)dr["fechaHorarioDisponible"];                   
                    }
                    HDLista.Add(objHorarioDisponible);
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

            return HDLista;

        }
    }
}
