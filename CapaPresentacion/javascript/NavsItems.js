// evento click para boton eliminar
$(document).on('click', '.nav-link', function (e) {
 // e.preventDefault();
  // remover clase activa de cualquier nav-item.
  $('.nav-link').removeClass('active')
  // agregar clase active al item.
  $(this).addClass('active');
});
