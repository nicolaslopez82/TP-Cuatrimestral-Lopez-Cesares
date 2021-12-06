using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDominio
{
    public class Reserva
    {
        public int IdReserva { get; set; }

        // HD = Horario Disponible
        public HorarioDisponible HorarioDisponibleH { get; set; }
        public int IdMedico { get; set; }
        public Paciente Ppaciente { get; set; }
        public DateTime FechaCreacion { get; set; }
        public String Observacion { get; set; }
        public bool Estado { get; set; }

    }
}
