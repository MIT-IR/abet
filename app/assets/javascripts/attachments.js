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

  $(".attachments-expandable-link").on("click", function(e) {
    e.preventDefault();
    $(this).siblings(".assignment-attachments").toggleClass("is-hidden");
  });
});
