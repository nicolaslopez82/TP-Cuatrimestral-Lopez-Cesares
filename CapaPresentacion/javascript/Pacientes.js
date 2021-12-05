
function templateRow() {
  var template = "<tr>";
  template += ("<td>" + "123" + "</td>");
  template += ("<td>" + "Jorge Junior" + "</td>");
  template += ("<td>" + "Rodriguez Castillo" + "</td>");
  template += ("<td>" + "123" + "</td>");
  template += ("<td>" + 'M' + "</td>");
  template += ("<td>" + "123" + "</td>");
  template += ("<td>" + "123" + "</td>");
  template += ("<td>" + "123" + "</td>");
  template += ("<td>" + "123" + "</td>");
  template += "</tr>";
  return template;
}

function addRow() {
  var template = templateRow();
  for (var i = 0; i < 10; i++) {
    $("#tbl_body_table").append(template);
  }
}

var tabla, data;

function addRowDT(data) {
  tabla = $("#pacientesList").DataTable({
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
      null,
      { "bSortable": false }
    ]
  });

  tabla.fnClearTable();
  //tabla.clear().draw();

  for (var i = 0; i < data.length; i++) {
    tabla.fnAddData([
      data[i].IdPaciente,
      data[i].Nombres,
      data[i].Apellido,
      data[i].Edad,
      data[i].Sexo = 'M' ? "Masculino" : "Femenino",
      data[i].NroDocumento,
      data[i].Direccion,
      data[i].Telefono,
      '<button type="button" value="Actualizar" title="Actualizar" class="btn btn-primary btn-block btn-sm btn-edit" data-target="#imodal" data-toggle="modal"><i class="fa fa-book"></i>  Actualizar</button>' +
      '<button type="button" value="Eliminar" title="Eliminar" class="btn btn-danger btn-block btn-sm btn-delete"><i class="fa fa-book"></i>  Eliminar</button>' +
      '<button type="button" value="Reservar" title="Reservar" class="btn btn-warning btn-block btn-sm btn-update"><i class="fa fa-book"></i>  Reservar</button>'
    ]);
  }
  //  ((data[i].Estado == true) ? "Activo" : "Inactivo")
}

function sendDataAjax() {
  $.ajax({
    type: "POST",
    url: "Pacientes.aspx/ListarPacientes",
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

function updateDataAjax() {

  var obj = JSON.stringify({
    id: JSON.stringify(data[0]),
    nombres: $("#MainContent_txtNombreActualizar").val(),
    apellido: $("#MainContent_txtApellidoActualizar").val(),
    edad: $("#MainContent_txtEdadActualizar").val(),
    sexo: $("#MainContent_txtSexoActualizar").val(),
    nroDocumento: $("#MainContent_txtNroDocumentoActualizar").val(),
    direccion: $("#MainContent_txtDireccionActualizar").val(),
    telefono: $("#MainContent_txtTelefonoActualizar").val()
  });

  $.ajax({
    type: "POST",
    url: "Pacientes.aspx/ActualizarDatosPaciente",
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


function deleteDataAjax(data) {

  var obj = JSON.stringify({ id: JSON.stringify(data) });

  $.ajax({
    type: "POST",
    url: "Pacientes.aspx/EliminarPaciente",
    data: obj,
    dataType: "json",
    contentType: 'application/json; charset=utf-8',
    error: function (xhr, ajaxOptions, thrownError) {
      console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
    },
    success: function (response) {
      if (response.d) {
        alert("Registro eliminado de manera correcta.");
      } else {
        alert("No se pudo eliminar el registro.");
      }
    }
  });
}

function RedirectReserva(data) {

  var obj = JSON.stringify({
    id: JSON.stringify(data[0]),
    nombres: JSON.stringify(data[1]),
    apellido: JSON.stringify(data[2]),
    edad: JSON.stringify(data[3]),
    sexo: JSON.stringify(data[4]),
    nroDocumento: JSON.stringify(data[5]),
    direccion: JSON.stringify(data[6]),
    telefono: JSON.stringify(data[7])
  });

  $.ajax({
    type: "POST",
    url: "Reserva.aspx/CargarSession",
    data: obj,
    dataType: "json",
    contentType: 'application/json; charset=utf-8'

  });
  window.location.replace("Reserva.aspx");
}



// evento click para boton actualizar
$(document).on('click', '.btn-edit', function (e) {
  e.preventDefault();

  var row = $(this).parent().parent()[0];
  var dataRow = tabla.fnGetData(row);
  //console.log(dataRow);
  data = dataRow;
  fillModalData();

});

// evento click para boton eliminar
$(document).on('click', '.btn-delete', function (e) {
  e.preventDefault();

  //primer método: eliminar la fila del datatble
  var row = $(this).parent().parent()[0];
  var dataRow = tabla.fnGetData(row);

  //segundo método: enviar el codigo del paciente al servidor y eliminarlo, renderizar el datatable
  // paso 1: enviar el id al servidor por medio de ajax
  deleteDataAjax(dataRow[0]);
  // paso 2: renderizar el datatable
  sendDataAjax();

});


//Evento click reserver
$(document).on('click', '.btn-update', function (e) {
  e.preventDefault();

  var row = $(this).parent().parent()[0];
  var dataRow = tabla.fnGetData(row);
  //console.log(dataRow);
  data = dataRow;
  RedirectReserva(data);

});


// cargar datos en el modal
function fillModalData() {
  $('#MainContent_txtNombreActualizar').val(data[1]);
  $('#MainContent_txtApellidoActualizar').val(data[2]);
  $('#MainContent_txtEdadActualizar').val(data[3]);
  $('#MainContent_txtSexoActualizar').val(data[4]);
  $('#MainContent_txtNroDocumentoActualizar').val(data[5]);
  $('#MainContent_txtDireccionActualizar').val(data[6]);
  $('#MainContent_txtTelefonoActualizar').val(data[7]);
}

// enviar la informacion al servidor
$("#MainContent_btnActualizarGuardar").click(function (e) {
  e.preventDefault();
  updateDataAjax();
  sendDataAjax();
});

// Llamando a la funcion de ajax al cargar el documento
sendDataAjax();



