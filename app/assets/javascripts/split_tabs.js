$(function() {
  var activeClass = "is-active";
  var transitionTimeInMilliSeconds = 300;

  var activateTab = function() {
    var targetTabControl = $(this);
    var targetTabContent = $("[data-content='" + targetTabControl.data("tab") + "']");
    var otherTabControls = $("[data-tab]").not(targetTabControl);
    var otherTabContent = $("[data-content]").not(targetTabContent);

    targetTabControl.addClass(activeClass);
    otherTabControls.removeClass(activeClass);

    targetTabContent.fadeIn(transitionTimeInMilliSeconds);
    otherTabContent.hide();
  };

  $("[data-tab]")
    .on('click', activateTab)
    .first().trigger('click');
});
