using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDominio
{
    public class HorarioDisponible
    {
        public int IdHorarioDisponible { get; set; }
        public Medico RMedico { get; set; }
        public DateTime FechaHorarioDisponible { get; set; }
        public bool Estado { get; set; }
    }
}
