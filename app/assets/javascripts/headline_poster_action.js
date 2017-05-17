$(function() {
  var $headlinePosterAction = $(".headline-poster-action");
  var headlineTakeoverClass = "headline-poster-takeover";

  $headlinePosterAction.mouseenter(function() {
    $("body").addClass(headlineTakeoverClass);
  });

  $headlinePosterAction.mouseleave(function() {
    $("body").removeClass(headlineTakeoverClass);
  });
});
