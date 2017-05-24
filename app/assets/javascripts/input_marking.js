$(function(){
  var markInput = function() {
    input = $(this)
    value = $.trim(input.val());

    if (value) {
      input.
        addClass("has-items").
        removeClass("is-empty");
    } else {
      input.
        addClass("is-empty").
        removeClass("has-items");
    }
  };

  $("input[type='text']").
    on("blur", markInput).
    each(markInput);
});
