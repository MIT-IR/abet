$(function() {
  var modalOverlay = $(".modal-overlay");
  var visibleModalClass = "modal-visible";

  $(".modal-trigger").click(function() {
    var targetModalName = $(this).data("target-modal-name");
    var targetModal = $("[data-modal-name=" + targetModalName + "]");

    modalOverlay.addClass(visibleModalClass);
    targetModal.addClass(visibleModalClass);
  });

  $(".modal-close, .modal-overlay").click(function() {
    $(".modal.modal-visible").removeClass(visibleModalClass);
    modalOverlay.removeClass(visibleModalClass);
  });
});
