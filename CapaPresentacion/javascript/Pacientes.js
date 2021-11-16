
function templateRow() {
  var template = "<tr>";  
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
  tabla = $("#pacientesList").dataTable({
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
      data[i].Nombres,
      data[i].Apellido,
      data[i].Edad,
      data[i].Sexo = 'M' ? "Masculino" : "Femenino",
      data[i].NroDocumento,
      data[i].Direccion,
      data[i].Telefono,                          
      //'<button type="button" value="Actualizar" title="Actualizar" class="btn btn-info btn-block btn-flat" data-target="#imodal" data-toggle="modal"><i class="fa fa-bell" aria-hidden="true"></i></button>&nbsp;' +
      //'<button type="button" value="Eliminar" title="Eliminar" class="btn btn-danger btn-block btn-sm"><i class="fa fa-bell" aria-hidden="true"></i></button>'
      '<button type="button" class="btn btn-info btn-block btn-sm" data-toggle="modal" data-target="#modal-info"><i class="fa fa-book"></i>  Actualizar</button>&nbsp;' +
      '<button type="button" class="btn btn-danger btn-block btn-sm" data-toggle="modal" data-target="#modal-danger"><i class="fa fa-book"></i>  Eliminar</button>'
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

  var obj = JSON.stringify({ id: JSON.stringify(data[0]), direccion: $("#txtModalDireccion").val() });

  $.ajax({
    type: "POST",
    url: "GestionarPaciente.aspx/ActualizarDatosPaciente",
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


// cargar datos en el modal
function fillModalData() {
  $("#txtFullName").val(data[1] + " " + data[2]);
  $("#txtModalDireccion").val(data[6]);
}

// evento click para boton actualizar
$(document).on('click', '.btn-info', function (e) {
  e.preventDefault();

  var row = $(this).parent().parent()[0];
  data = tabla.fillModalData(row);
  fillModalData();

});

// Llamando a la funcion de ajax al cargar el documento
sendDataAjax();



