$(document).ready(function () {
  var especialidadesDDL = $('#especialidades');
  var medicosDDL = $('#medicos');
  var horariosDisponiblesDDL = $('#horariosDisponibles');

  $.ajax({
    url: 'Reserva/ListarEspecialidades',
    method: 'post',
    dataType: 'json',
    success: function (data) {
      especialidadesDDL.append($('<option/>', { value: -1, text: 'Select Especialidades' }));
      medicosDDL.append($('<option />', { value: -1, text: 'Select Medico' }));
      horariosDisponiblesDDL.append($('<option />', { value: -1, text: 'Select Horario Disponible' }));
      medicosDDL.prop('disabled', true);
      horariosDisponiblesDDL.prop('disabled', true);

      $(data).each(function (index, item) {
        especialidadesDDL.append($('<option/>', { value: item.IdEspecialidad, text: item.Descripcion }));
      });
    },
    error: function (err) {      
      alert(err);
    }
  });

  especialidadesDDL.change(function () {
    if ($(this).val() == "-1") {
      medicosDDL.empty();
      horariosDisponiblesDDL.empty();
      medicosDDL.append($('<option />', { value: -1, text: 'Select Medico' }));
      horariosDisponiblesDDL.append($('<option />', { value: -1, text: 'Select Horario Disponible' }));
      medicosDDL.val('-1');
      horariosDisponiblesDDL.val('-1');
      medicosDDL.prop('disabled', true);
      horariosDisponiblesDDL.prop('disabled', true);
    }
    else {
      horariosDisponiblesDDL.val('-1');
      horariosDisponiblesDDL.prop('disabled', true);
      $.ajax({
        url: 'Reserva.aspx/ListarMedicosPorEspecialidad', //ListarMedicosPorEspecialidad
        method: 'post',
        dataType: 'json',
        data: { IdEspecialidad: $(this).val() },
        success: function (data) {
          medicosDDL.empty();
          medicosDDL.append($('<option />', { value: -1, text: 'Select Medico' }));
          $(data).each(function (index, item) {
            medicosDDL.append($('<option/>', { value: item.IdMedico, text: item.Nombre + item.Apellido}));
          });
          medicosDDL.val('-1');
          medicosDDL.prop('disabled', false);
        },
        error: function (err) {
          alert(err);
        }
      });
    }
  });

  medicosDDL.change(function () {
    if ($(this).val() == "-1") {
      horariosDisponiblesDDL.empty();
      horariosDisponiblesDDL.append($('<option />', { value: -1, text: 'Select Horario Disponible' }));
      horariosDisponiblesDDL.val('-1');
      horariosDisponiblesDDL.prop('disabled', true);
    }
    else {
      $.ajax({
        url: 'Reserva.aspx/ListarHorariosDisponiblesPorMedico', //ListarHorariosDisponiblesPorMedico
        method: 'post',
        dataType: 'json',
        data: { IdMedico: $(this).val() },
        success: function (data) {
          horariosDisponiblesDDL.empty();
          horariosDisponiblesDDL.append($('<option/>', { value: -1, text: 'Select Horarios Disponibles' }));
          $(data).each(function (index, item) {
            horariosDisponiblesDDL.append($('<option/>', { value: item.IdHorarioDisponible, text: item.FechaHorarioDisponible }));
          });
          horariosDisponiblesDDL.val('-1');
          horariosDisponiblesDDL.prop('disabled', false);
        },
        error: function (err) {
          alert(err);
        }
      });
    }
  });
});

