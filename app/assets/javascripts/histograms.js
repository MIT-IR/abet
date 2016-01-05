$(function() {
  $("#histogram").highcharts({
    data: { table: "datatable" },
    chart: { type: "column" },
    title: { text: null },
    xAxis: { title: { text: "Grade" } },
    yAxis: { title: { text: "Frequency" } },
    legend: { enabled: false },
  })

  $("#histogram").siblings("#datatable").hide();

  $("[data-role='view-histogram']")
    .show()
    .on("click", function() {
      var el = $(this);
      var semester = $("#result_semester").val();
      var year = $("#result_year").val();
      var endpoint = el.data("endpoint");

      if (semester && endpoint) {
        url = endpoint.replace("year", year);
        url = url.replace("semester", semester);
        window.open(url);
      } else {
        alert("You must select a semester and a year first");
      }
    });

  $("[data-role='histogram-bar-selection']").find("select")
    .on("change", function() {
      $(this).closest("form").trigger("submit");
    });
});
