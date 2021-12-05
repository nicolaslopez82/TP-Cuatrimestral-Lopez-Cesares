using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDominio
{
    public class Medico : Usuario
    {
        public int IdMedico { get; set; }
        public Especialidad Especialidad { get; set; }
        public bool Estado { get; set; }


        public Medico()
            : base()
        {

        }
        /*
        public Medico(int IdMedico, Especialidad Especialidad, bool Estado)
            : base(0, new TipoUsuario(), "", "", "", "", true, "", "", "")
        {
            this.IdMedico = IdMedico;
            this.Especialidad = Especialidad;
            this.Estado = Estado;
        }
        */
    }
}
