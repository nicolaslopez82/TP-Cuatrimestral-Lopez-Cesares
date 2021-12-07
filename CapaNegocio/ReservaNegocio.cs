using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDAO;
using CapaDominio;

namespace CapaNegocio
{
    public class ReservaNegocio
    {
        #region "PATRON SINGLETON"
        private static ReservaNegocio aux = null;
        private ReservaNegocio() { }
        public static ReservaNegocio getInstance()
        {
            if (aux == null)
            {
                aux = new ReservaNegocio();
            }
            return aux;
        }
        #endregion

        public bool RegistrarReserva(int idPaciente, int idMedico, int idHorarioDisponible, string observacion)
        {
            try
            {
                return ReservaDAO.getInstance().RegistrarReserva(idPaciente, idMedico, idHorarioDisponible, observacion);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public bool RegistrarReserva(Reserva objreserva)
        {
            try
            {
                return ReservaDAO.getInstance().RegistrarReserva(objreserva);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public bool EliminarReserva(int idReserva)
        {

            try
            {
                return ReservaDAO.getInstance().EliminarReserva(idReserva);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public List<Reserva> ListarReservas()
        {
            try
            {
                return ReservaDAO.getInstance().ListarReservas();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }       

        //Listar Reservas por Medico
        public List<Reserva> ListarReservaPorMedico(int idmedico)
        {
            try
            {
                return ReservaDAO.getInstance().ListarReservasPorMedico(idmedico);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
