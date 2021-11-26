////// evento click para boton eliminar
////$(document).on('click', '.nav-link', function (e) {
////  e.preventDefault();
////  // remover clase activa de cualquier nav-item.
////  $('.nav-link').removeClass('active')
////  // agregar clase active al item.
////  $(this).closest('.nav-link').addClass('active')
////});

// evento click para boton eliminar
function activeLinkControl() { 
  $('.nav-item').click(function () {
  // remover clase activa de cualquier nav-item.
  $('.nav-item').removeClass('active')
  // agregar clase active al item.
  $(this).closest('.nav-item').addClass('active')
});
}

$(document).ready(function () {
  activeLinkControl()
});
