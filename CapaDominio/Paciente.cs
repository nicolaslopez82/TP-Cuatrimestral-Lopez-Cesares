using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDominio
{
    public class Paciente
    {
        public int IdPaciente { get; set; }
        public String Nombres { get; set; } //
        public String Apellido { get; set; }        // 
        public int Edad { get; set; } //
        public char Sexo { get; set; } //
        public String NroDocumento { get; set; } //
        public String Direccion { get; set; } //
        public String Telefono { get; set; } //
        public bool Estado { get; set; }


        public Paciente() : this(0, "", "", 0, ' ', "", "", "", false) { }


        public Paciente(int _IdPaciente, String _Nombres, String _Apellido, int _Edad, char _Sexo
            , String _NroDocumento, String _Direccion, String _Telefono, bool _Estado)
        {

            this.IdPaciente = _IdPaciente;
            this.Nombres = _Nombres;
            this.Apellido = _Apellido;
            this.Edad = _Edad;
            this.Sexo = _Sexo;
            this.NroDocumento = _NroDocumento;
            this.Direccion = _Direccion;
            this.Telefono = _Telefono;
            this.Estado = _Estado;
        }
    }
}
