$(function() {
  var fileInput = "input[type='file']";
  var fileName = ".file-name";
  var removeLink = "a.remove_fields";

  $(document).on("cocoon:before-insert", ".attachments", function(e, insertedItem) {
    $(insertedItem).find(fileInput).hide().click();
    $(insertedItem).find(removeLink).hide();

    $(insertedItem).on("change", function(ev) {
      var selectedFileName = ev.target.files[0].name;
      $(this).find(fileName).text(selectedFileName);
      $(this).find(removeLink).show();
    });
  });
});
