﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDominio;
using System.Data.SqlClient;
using CapaAccesoDatos;


namespace CapaDAO
{
    public class ReservaDAO
    {
        #region "PATRON SINGLETON"
        private static ReservaDAO daoReserva = null;
        private ReservaDAO() { }
        public static ReservaDAO getInstance()
        {
            if (daoReserva == null)
            {
                daoReserva = new ReservaDAO();
            }
            return daoReserva;
        }
        #endregion

        public bool RegistrarReserva(Reserva objreserva)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;
            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("SP_AgregarReserva", con);
                cmd.Parameters.AddWithValue("@idmedico", objreserva.IdMedico);
                cmd.Parameters.AddWithValue("@idPaciente", objreserva.Ppaciente.IdPaciente);
                cmd.Parameters.AddWithValue("@idhorario", objreserva.HorarioDisponibleH.IdHorarioDisponible);
                cmd.Parameters.AddWithValue("@idobservacion", objreserva.Observacion);
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

        public bool EliminarReserva(int idReserva)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;
            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("SP_EliminarReserva", con);
                cmd.Parameters.AddWithValue("@idReserva", idReserva);
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

        public List<Reserva> ListarReservas()
        {
            List<Reserva> Lista = new List<Reserva>();
            SqlConnection con = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;

            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("SP_ListaReserva", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Reserva objreserva = new Reserva();
                    objreserva.IdReserva = (int)dr["idReserva"];
                    objreserva.Observacion = (string)dr["observacion"];
                    objreserva.FechaCreacion = (DateTime)dr["fechaCreacionReserva"];
                    objreserva.Ppaciente = new Paciente();
                    objreserva.Ppaciente.Apellido = (string)dr["apellido"];
                    objreserva.Ppaciente.Nombres = (string)dr["nombre"];
                    objreserva.HorarioDisponibleH = new HorarioDisponible();
                    objreserva.HorarioDisponibleH.FechaHorarioDisponible = (DateTime)dr["fechaHorarioDisponible"];

                    Lista.Add(objreserva);

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