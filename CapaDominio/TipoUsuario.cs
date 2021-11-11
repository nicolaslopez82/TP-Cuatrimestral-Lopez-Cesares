using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDominio
{
    public class TipoUsuario
    {
        public int ID { get; set; }
        public String Descripcion { get; set; }
        public bool Estado { get; set; }

        public TipoUsuario()
        {
        }

        public TipoUsuario(int ID, String Descripcion, bool Estado)
        {
            this.ID = ID;
            this.Descripcion = Descripcion;
            this.Estado = Estado;
        }
    }
}
