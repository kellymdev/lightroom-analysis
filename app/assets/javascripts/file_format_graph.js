$.ajax({
        type: "GET",
        contentType: "application/json; charset=utf-8",
        url: 'graphs/file_format_data',
        dataType: 'json',
        success: function (data) {
          drawFileFormats(data);
        },
        error: function (result) {
          error();
        }
      });

function drawFileFormats(data) {
  var margin = {top: 20, right: 30, bottom: 30, left: 40};
  var width = 960 - margin.left - margin.right;
  var height = 400 - margin.top - margin.bottom;
  var radius = Math.min(width, height) / 2;

  var color = d3.scaleOrdinal()
    .range(["#6E9489", "#41434A", "#DEDCC3", "#877963"]);

  var arc = d3.arc()
      .outerRadius(radius - 10)
      .innerRadius(0);

  var labelArc = d3.arc()
      .outerRadius(radius - 40)
      .innerRadius(radius - 40);

  var pie = d3.pie()
      .sort(null)
      .value(function(d) { return d.frequency; });

  var svg = d3.select(".file-format-chart").append("svg")
      .attr("width", width)
      .attr("height", height)
    .append("g")
      .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");
      var g = svg.selectAll(".arc")
      .data(pie(data))
    .enter().append("g")
      .attr("class", "arc");

  g.append("path")
      .attr("d", arc)
      .style("fill", function(d) { return color(d.data.format); });

  g.append("text")
      .attr("transform", function(d) { return "translate(" + labelArc.centroid(d) + ")"; })
      .attr("dy", ".35em")
      .text(function(d) { return d.data.format; });
}