$.ajax({
        type: "GET",
        contentType: "application/json; charset=utf-8",
        url: 'graphs/lenses_by_camera_data',
        dataType: 'json',
        success: function (data) {
          drawLensesByCamera(data);
        },
        error: function (result) {
        }
      });

function drawLensesByCamera(data) {
  var margin = {top: 20, right: 30, bottom: 30, left: 40};
  var width = 960 - margin.left - margin.right;
  var height = 400 - margin.top - margin.bottom;

  var x = d3.scaleBand().rangeRound([0, width]);
  var y = d3.scaleLinear().range([height, 0]);
  var xAxis = d3.axisBottom().scale(x);
  var yAxis = d3.axisLeft().scale(y);

  var div = d3.select("body").append("div")
    .attr("class", "pairs-tooltip")
    .style("opacity", 0);

  var chart = d3.select(".lenses-by-camera-chart")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
    .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

  x.domain(data.map(function(d) { return d.lens; }));
  y.domain([0, d3.max(data, function(d) { return d.frequency; })]);

  chart.append("g")
    .attr("class", "y axis")
    .call(yAxis);

  chart.append("text")
    .attr("class", "axis-label")
    .attr("transform", "rotate(-90)")
    .attr("y", 0 - margin.left)
    .attr("x", 0 - (height / 2))
    .attr("dy", "1em")
    .style("text-anchor", "middle")
    .text("Frequency");

  chart.selectAll(".bar")
    .data(data)
    .enter().append("rect")
    .attr("class", "bar")
    .attr("x", function(d) { return x(d.lens); })
    .attr("y", function(d) { return y(d.frequency); })
    .attr("height", function(d) { return height - y(d.frequency); })
    .attr("width", 20)
    .on('mouseover', function(d) {
      d3.select(this)
        .style('fill', '#877963');
      div.transition()
        .duration(200)
        .style("opacity", .9);
      div.html(d.lens + '<br/>' + d.frequency)
        .style("left", (d3.event.pageX) + "px")
        .style("top", (d3.event.pageY - 28) + "px");
    })
    .on('mouseout', function(d) {
      d3.select(this)
        .style('fill', '#6E9489');
      div.transition()
        .duration(500)
        .style("opacity", 0);
    });
}