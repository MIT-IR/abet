$(function() {
  var splitTabsContainer = ".split-tabs";
  var splitTab = ".split-tab";
  var splitTabPanel = ".split-tab-panel";
  var activeClass = "is-active";
  var transitionTime = 300;

  $(splitTab + ":first-child")
    .addClass(activeClass)
    .closest(splitTabsContainer)
    .siblings(splitTabPanel + ":first-of-type")
    .show();

  $(splitTab).click(function() {
    $(this)
      .siblings(splitTab)
      .removeClass(activeClass)
      .closest(splitTabsContainer)
      .siblings(splitTabPanel)
      .hide();

    $(this)
      .addClass(activeClass)
      .closest(splitTabsContainer)
      .siblings(splitTabPanel)
      .eq($(this).index(splitTab))
      .fadeIn(transitionTime);
  });
});
