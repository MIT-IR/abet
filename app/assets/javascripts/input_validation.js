$(function(){
  $(document).on("change", ".field_with_errors", function() {
    $(this).removeClass("field_with_errors");
  });
});
