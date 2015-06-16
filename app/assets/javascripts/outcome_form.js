$(function(){
  var alignmentContainer = $("fieldset.alignments");

  var alignmentSorter = function(a, b) {
    var aName = a.getAttribute("data-order");
    var bName = b.getAttribute("data-order");

    if (aName > bName) {
      return 1;
    } else if (aName < bName) {
      return -1;
    } else {
      return 0;
    }
  };

  if (alignmentContainer.length) {
    var alignments = alignmentContainer.children("fieldset.alignment");
    alignments.sort(alignmentSorter);
    alignments.detach().appendTo(alignmentContainer);
  }
});
