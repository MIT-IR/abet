$(function() {
  $(".button-cancel").on("click", function(ev) {
    ev.preventDefault();
    history.back();
  });
});
