$(function() {
  var faqRow = $("[data-role='faq-row']");

  faqRow.click(function() {
    var faqAnswer = $(this).children("[data-role='faq-row-answer']");
    var plusSignLineVertical = $(this).find("[data-role='plus-sign-line-vertical']");

    faqAnswer.slideToggle();
    plusSignLineVertical.toggle();
  });
});
