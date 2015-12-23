$(function() {
  $("[data-behavior='auto-submit']").on("change", function() {
    $(this).closest("form").submit();
  });
});
