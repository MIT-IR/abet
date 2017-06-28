$(function() {
  $("[data-expands]").on("click", function(e) {
    var expander = $(this);
    var expansionTarget = expander.data("expands");

    expander.siblings(expansionTarget).toggleClass("is-hidden");
  });
});

