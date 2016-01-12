$(function() {
  $("[data-role='histogramable']").find("select").on("change", function() {
    $("#semester").val($("#result_semester").val());
    $("#year").val($("#result_year").val());
    $("[data-role='histogram-link']").remove();
    $("form[data-role='gradebook-form']").submit();
  });
});
