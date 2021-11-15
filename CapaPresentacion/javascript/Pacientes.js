
function templateRow() {
  var template = "<tr>";
  template += ("<td>" + "123" + "</td>");
  template += ("<td>" + "Jorge Junior" + "</td>");
  template += ("<td>" + "Rodriguez Castillo" + "</td>");
  //template += ("<td>" + "123" + "</td>");
  //template += ("<td>" + "123" + "</td>");
  //template += ("<td>" + "123" + "</td>");
  //template += ("<td>" + "123" + "</td>");
  //template += ("<td>" + "123" + "</td>");
  //template += ("<td>" + "123" + "</td>");
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
      //null,
      //null,
      //null,
      //null,
      //null,
      //null,      
      { "bSortable": false }
    ]
  });

  tabla.fnClearTable();
  //tabla.clear().draw();

  for (var i = 0; i < data.length; i++) {
    tabla.fnAddData([
      data[i].IdPaciente,
      data[i].Nombres,
      data[i].Apellido//,
      //data[i].Edad,
      //((data[i].Sexo == 'M') ? "Masculino" : "Femenino"),
      //data[i].Direccion,
      //data[i].NroDocumento,
      //data[i].NroDocumento,
      //data[i].NroDocumento
      //'<button type="button" value="Actualizar" title="Actualizar" class="btn btn-info btn-block btn-flat" data-target="#imodal" data-toggle="modal"><i class="fa fa-bell" aria-hidden="true"></i></button>&nbsp;' +
      //'<button type="button" value="Eliminar" title="Eliminar" class="btn btn-danger btn-block btn-sm"><i class="fa fa-bell" aria-hidden="true"></i></button>'
      //'<button type="button" value="Actualizar" title="Actualizar" class="btn btn-primary btn-edit" data-target="#imodal" data-toggle="modal"><i class="fa fa-check-square-o" aria-hidden="true"></i></button>&nbsp;' +
      //'<button type="button" value="Eliminar" title="Eliminar" class="btn btn-danger btn-delete"><i class="fa fa-minus-square-o" aria-hidden="true"></i></button>'
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

// Llamando a la funcion de ajax al cargar el documento
sendDataAjax();

