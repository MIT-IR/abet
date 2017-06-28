$(function() {
  var fileInput = "input[type='file']";
  var fileName = ".file-name";

  $(document).on("cocoon:before-insert", ".attachments", function(e, insertedItem) {
    $(insertedItem).find(fileInput).click();

    $(insertedItem).on("change", function(ev) {
      var selectedFileName = ev.target.files[0].name;
      $(this).find(fileName).text(selectedFileName);
    });
  });
});

$(document).on("click", function(e) {
    e.preventDefault();
   $("#attachments-list").toggleClass("is-hidden");
});
