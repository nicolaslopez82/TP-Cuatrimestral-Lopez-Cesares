using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDominio;
using CapaDAO;

namespace CapaNegocio
{
    public class HorarioDisponibleNegocio
    {
        #region "PATRON SINGLETON"
        private static HorarioDisponibleNegocio negocioHorarioDisponible = null;
        private HorarioDisponibleNegocio() { }
        public static HorarioDisponibleNegocio getInstance()
        {
            if (negocioHorarioDisponible == null)
            {
                negocioHorarioDisponible = new HorarioDisponibleNegocio();
            }
            return negocioHorarioDisponible;
        }
        #endregion

        public List<HorarioDisponible> ListarHorariosDisponiblesPorMedico(int idMedico) 
        {
            try
            {
                return HorarioDisponibleDAO.getInstance().ListarHorariosDisponiblesPorMedico(idMedico);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
