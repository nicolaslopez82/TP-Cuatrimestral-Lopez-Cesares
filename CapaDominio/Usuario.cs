using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDominio
{
    public class Usuario
    {
        public int ID { get; set; }
        public TipoUsuario RTipoUsuario { get; set; }
        public String Nombre { get; set; }
        public String Apellido { get; set; }
        public String NroDocumento { get; set; }
        public bool Estado { get; set; }
        public String RUsuario { get; set; }
        public String Contrasenia { get; set; }

        public Usuario() : this(0, new TipoUsuario(), "", "", "", false, "", "") { }

        public Usuario(int ID, TipoUsuario RTipoUsuario, String Nombre, String Apellido, String NroDocumento, bool Estado, String RUsuario, String Contrasenia)
        {
            this.ID = ID;
            this.RTipoUsuario = RTipoUsuario;
            this.Nombre = Nombre;
            this.Apellido = Apellido;
            this.NroDocumento = NroDocumento;
            this.Estado = Estado;
            this.RUsuario = RUsuario;
            this.Contrasenia = Contrasenia;
        }
    }
}
