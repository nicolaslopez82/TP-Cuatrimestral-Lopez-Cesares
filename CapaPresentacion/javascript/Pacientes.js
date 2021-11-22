
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
      '<button type="button" value="Actualizar" title="Actualizar" class="btn btn-primary btn-block btn-sm btn-edit" data-target="#modal-actualizar" data-toggle="modal" onclick="cargarModalActualizar()"><i class="fa fa-book"></i>  Actualizar</button>' +
      '<button type="button" value="Eliminar" title="Eliminar" class="btn btn-danger btn-block btn-sm btn-delete"><i class="fa fa-book"></i>  Eliminar</button>'
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




function cargarModalActualizar() {
  e.preventDefault();
  var row = $(this).parent().parent()[0];
  data = tabla.fillModalData(row);
  fillModalData();  
}

// evento click para boton actualizar
//$(document).on('click', '.btn-edit', function (e) {
//  e.preventDefault();

//  var row = $(this).parent().parent()[0];
//  data = tabla.fillModalData(row);
//  fillModalData();

//});

// cargar datos en el modal
function fillModalData() {
  $("#txtNombreActualizar").val('nicolas');
  $("#txtApellidoActualizar").val('lopez');
  $("#txtEdadActualizar").val(data[3]);
  $("#txtSexoActualizar").val(data[4]);
  $("#txtNroDocumentoActualizar").val(data[5]);
  $("#txtDireccionActualizar").val(data[6]);
  $("#txtTelefonoActualizar").val(data[7]);
}

// enviar la informacion al servidor
$("#btnActualizarGuardar").click(function (e) {
  e.preventDefault();
  updateDataAjax();
});

// Llamando a la funcion de ajax al cargar el documento
sendDataAjax();



