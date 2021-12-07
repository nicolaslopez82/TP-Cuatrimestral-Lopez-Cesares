$(document).ready(function () {
  $.ajax({
    type: "GET",
    url: "Reserva/getLista",
    data: "{}",
    success: function (data) {
      var s = '<option value="-1">Please Select a Department</option>';
      for (var i = 0; i < data.length; i++) {
        s += '<option value="' + data[i].IdEspecialidad + '">' + data[i].Descripcion + '</option>';
      }
      $("#departmentsDropdown").html(s);
    }
  });
});

//============================================================//

function templateRow() {
  var template = "<tr>";
  template += ("<td>" + "ID" + "</td>");
  template += ("<td>" + "observacion" + "</td>");
  template += ("<td>" + "fechaCreacionReserva" + "</td>");
  template += ("<td>" + "idMedico" + "</td>");
  template += ("<td>" + "apellido" + "</td>");
  template += ("<td>" + "nombre" + "</td>");
  template += ("<td>" + "fechaHorarioDisponible" + "</td>");
  template += ("<td>" + "acciones" + "</td>");
  template += "</tr>";
  return template;
}

function addRow() {
  var template = templateRow();
  for (var i = 0; i < 10; i++) {
    $("#tbl_body_table").append(template);
  }
}

var tabla, data, dateConverted;

function addRowDT(data) {
  tabla = $("#reservaList").DataTable({
    "aaSorting": [[0, 'desc']],
    "bSort": true,
    "bDestroy": true,
    "aoColumns": [
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      { "bSortable": false }
    ]
  });

  tabla.fnClearTable();
  //tabla.clear().draw();

  for (var i = 0; i < data.length; i++) {
    tabla.fnAddData([
      data[i].IdReserva,     
      datetimeToString(data[i].HorarioDisponibleH.FechaHorarioDisponible),      
      data[i].IdMedico,
      data[i].Ppaciente.Apellido,
      data[i].Ppaciente.Nombres,      
      datetimeToString(data[i].FechaCreacion),      
      data[i].Observacion,


      '<button type="button" value="Actualizar" title="Actualizar" class="btn btn-primary btn-block btn-sm btn-edit" data-target="#imodal" data-toggle="modal"><i class="fa fa-book"></i>  Actualizar</button>' +
      '<button type="button" value="Eliminar" title="Eliminar" class="btn btn-danger btn-block btn-sm btn-delete"><i class="fa fa-book"></i>  Eliminar</button>'
    ]);
  }
  //  ((data[i].Estado == true) ? "Activo" : "Inactivo")
}

function addZero(i) {
  if (i < 10) { i = "0" + i }
  return i;
}

function datetimeToString(dDateTime) {

  var days = ['Domingo', 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado'];

  var fecha = new Date(parseInt(dDateTime.substr(6)));
  console.log(fecha);

  var dd = String(fecha.getDate()).padStart(2, '0');
  var mm = String(fecha.getMonth() + 1).padStart(2, '0'); //Enero es 0.
  var yyyy = fecha.getFullYear();

  var dayName = days[fecha.getDay()];

  let h = addZero(fecha.getHours());
  let m = addZero(fecha.getMinutes());

  return fechaConvertida = dayName + ' ' + dd + '-' + mm + '-' + yyyy + ' ' + h + ":" + m;
}

function sendDataAjax() {
  $.ajax({
    type: "POST",
    url: "Reserva.aspx/ListarReservas",
    data: {},
    contentType: 'application/json; charset=utf-8',
    error: function (xhr, ajaxOptions, thrownError) {
      console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
    },
    success: function (data) {
      addRowDT(data.d);
    }
  });
}

/*
function updateDataAjaxx() {

  var obj = JSON.stringify({
    IdEspecialidad: JSON.stringify(data[0]),
    Descripcion: $("#MainContent_txtDescripcionActualizar").val(),
  });

  $.ajax({
    type: "POST",
    url: "Especialidades.aspx/ActualizarDes",
    data: obj,
    dataType: "json",
    contentType: 'application/json; charset=utf-8',
    error: function (xhr, ajaxOptions, thrownError) {
      console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
    },
    success: function (response) {
      if (response.d) {
        alert("Registro actualizado de manera correcta.");

      } else {
        alert("No se pudo actualizar el registro.");
      }
    }
  });
}
*/



function deleteDataAjax(data) {

  var obj = JSON.stringify({ IdReserva: JSON.stringify(data) });

  $.ajax({
    type: "POST",
    url: "Reserva.aspx/EliminarReserva",
    data: obj,
    dataType: "json",
    contentType: 'application/json; charset=utf-8',
    error: function (xhr, ajaxOptions, thrownError) {
      console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
    },
    success: function (response) {
      if (response.d) {
        alert("Registro eliminado de manera correcta.");
        // paso 2: renderizar el datatable  
        tabla.ajax.reload(null, false);
      } else {
        alert("No se pudo eliminar el registro.");
        // paso 2: renderizar el datatable
        tabla.ajax.reload(null, false);
      }


    }
  });
}

/*
// evento click para boton actualizar
$(document).on('click', '.btn-edit', function (e) {
  e.preventDefault();

  var row = $(this).parent().parent()[0];
  var dataRow = tabla.fnGetData(row);
  //console.log(dataRow);
  data = dataRow;
  fillModalData();
});
*/

// evento click para boton eliminar
$(document).on('click', '.btn-delete', function (e) {
  e.preventDefault();

  //primer método: eliminar la fila del datatble
  var row = $(this).parent().parent()[0];
  var dataRow = tabla.fnGetData(row);

  //segundo método: enviar el codigo del paciente al servidor y eliminarlo, renderizar el datatable
  // paso 1: enviar el id al servidor por medio de ajax
  console.log(dataRow);
  deleteDataAjax(dataRow[0]);
  //Refresh();
});

/*
// cargar datos en el modal
function fillModalData() {
  $('#MainContent_txtIDactualizar').val(data[0]);
  $('#MainContent_txtDescripcionActualizar').val(data[1]);

}
*/

/*
// enviar la informacion al servidor
$("#MainContent_btnActualizarGuardarr").click(function (e) {
  e.preventDefault();
  updateDataAjaxx();
  window.location.replace("Especialidades.aspx");
  //tabla.ajax.reload(null, false);
});
*/

function Refresh() {
  window.location.replace("Reserva-bm.aspx");
}


// Llamando a la funcion de ajax al cargar el documento
sendDataAjax();


