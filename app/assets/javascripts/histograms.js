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
});
