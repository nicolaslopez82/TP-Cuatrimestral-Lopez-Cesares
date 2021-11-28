
function templateRow() {
  var template = "<tr>";
  template += ("<td>" + "ID" + "</td>");
  template += ("<td>" + "nombre" + "</td>");
  template += ("<td>" + "apellido" + "</td>");
  template += ("<td>" + "dni" + "</td>");
  template += ("<td>" + "usuario" + "</td>");  
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

var tabla, data;

function addRowDT(data) {
  tabla = $("#usuariosList").DataTable({
    "aaSorting": [[0, 'desc']],
    "bSort": true,
    "bDestroy": true,
    "aoColumns": [      
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
      data[i].ID,
      data[i].Nombre,
      data[i].Apellido,   
      data[i].NroDocumento,
      data[i].RUsuario,
      '<button type="button" value="Actualizar" title="Actualizar" class="btn btn-primary btn-block btn-sm btn-edit" data-target="#imodal" data-toggle="modal"><i class="fa fa-book"></i>  Actualizar</button>' +
      '<button type="button" value="Eliminar" title="Eliminar" class="btn btn-danger btn-block btn-sm btn-delete"><i class="fa fa-book"></i>  Eliminar</button>'
    ]);
  }
  //  ((data[i].Estado == true) ? "Activo" : "Inactivo")
}

function sendDataAjax() {
  $.ajax({
    type: "POST",
    url: "Usuarios.aspx/ListarUsuarios",
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
    idUsuario: JSON.stringify(data[0]),
    nombres: $("#MainContent_txtNombreActualizar").val(),
    apellido: $("#MainContent_txtApellidoActualizar").val(),    
    nroDocumento: $("#MainContent_txtNroDocumentoActualizar").val(),    
    usuario: $("#MainContent_txtUsuarioActualizar").val()
  });

  $.ajax({
    type: "POST",
    url: "Usuarios.aspx/ActualizarDatosUsuario",
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

  var obj = JSON.stringify({ idUsuario: JSON.stringify(data) });

  $.ajax({
    type: "POST",
    url: "Usuarios.aspx/EliminarUsuario",
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
  console.log(dataRow);
  deleteDataAjax(dataRow[0]);
});


// cargar datos en el modal
function fillModalData() {
  $('#MainContent_txtIDActualizar').val(data[0]);
  $('#MainContent_txtNombreActualizar').val(data[1]);
  $('#MainContent_txtApellidoActualizar').val(data[2]);  
  $('#MainContent_txtNroDocumentoActualizar').val(data[3]);  
  $('#MainContent_txtUsuarioActualizar').val(data[4]);
}

// enviar la informacion al servidor
$("#MainContent_btnActualizarGuardar").click(function (e) {
  e.preventDefault();
  updateDataAjax();
  //tabla.ajax.reload(null, false);
});


// Llamando a la funcion de ajax al cargar el documento
sendDataAjax();



