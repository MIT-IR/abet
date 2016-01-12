$(function() {
  $("[data-role='histogramable']").find("select").on("change", function() {
    $("#semester").val($("#result_semester").val());
    $("#year").val($("#result_year").val());

    $("form[data-role='gradebook-form']").submit();
  });
});
