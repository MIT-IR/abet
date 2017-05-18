$(function() {
  $(document).on('cocoon:before-insert', function(e, insertedItem) {
    $(insertedItem).find("select").selectize();
  });
});
