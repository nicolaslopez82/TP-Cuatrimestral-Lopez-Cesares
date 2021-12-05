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
