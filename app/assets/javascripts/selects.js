$(function() {
  $("select[data-allow-empty-option]").selectize({
    allowEmptyOption: true,
  });

  $("select").not("[data-allow-empty-option]").selectize({});
});
