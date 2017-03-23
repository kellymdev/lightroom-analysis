$.ajax({
        type: "GET",
        contentType: "application/json; charset=utf-8",
        url: 'graphs/cameras_by_year_data',
        dataType: 'json',
        success: function (data) {
          drawCamerasByYear(data);
        },
        error: function (result) {
        }
      });

function drawCamerasByYear(data) {
  var margin = {top: 20, right: 30, bottom: 30, left: 40};
  var width = 960 - margin.left - margin.right;
  var height = 400 - margin.top - margin.bottom;

  var x0 = d3.scaleBand().rangeRound([0, width]).paddingInner(0.1);
  var x1 = d3.scaleBand().padding(0.05);
  var y = d3.scaleLinear().rangeRound([height, 0]);
  var z = d3.scaleOrdinal().range(["#41434A", "#6E9489", "#DEDCC3", "#877963", "#FFF", "#C1E8D7"]);
  var xAxis = d3.axisBottom().scale(x0);
  var yAxis = d3.axisLeft().scale(y);

  var chart = d3.select(".camera-year-chart")
  .attr("width", width + margin.left + margin.right)
  .attr("height", height + margin.top + margin.bottom)
  .append("g")
  .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

  var cameraNames = d3.keys(data[0]).filter(function(key) { return key !== "year"; });

  data.forEach(function(d) {
    d.cameras = cameraNames.map(function(name) { return {name: name, value: +d[name]}; });
  });

  x0.domain(data.map(function(d) { return d.year; }));
  x1.domain(cameraNames).rangeRound([0, x0.bandwidth()]);
  y.domain([0, d3.max(data, function(d) { return d3.max(d.cameras, function(d) { return d.value; }); })]);

  chart.append("g")
    .attr("class", "x axis")
    .attr("transform", "translate(0," + height + ")")
    .call(xAxis);

  chart.append("g")
    .attr("class", "y axis")
    .call(yAxis)
    .append("text")
    .attr("transform", "rotate(-90)")
    .attr("y", 6)
    .attr("dy", "0.71em")
    .style("text-anchor", "end")
    .text("Frequency");

  var year = chart.selectAll(".year")
    .data(data)
    .enter().append("g")
    .attr("class", "g")
    .attr("transform", function(d) { return "translate(" + x0(d.year) + ",0)"; });

  year.selectAll("rect")
    .data(function(d) { return d.cameras; })
    .enter().append("rect")
    .attr("width", x1.bandwidth())
    .attr("x", function(d) { return x1(d.name); })
    .attr("y", function(d) { return y(d.value); })
    .attr("height", function(d) { return height - y(d.value); })
    .style("fill", function(d) { return z(d.name); })

  var legend = chart.append("g")
    .attr("font-family", "sans-serif")
    .attr("font-size", 10)
    .attr("text-anchor", "end")
    .selectAll("g")
    .data(Array.from(new Set(data.map(function(d) { return d.camera; }))))
    .enter().append("g")
    .attr("transform", function(d, i) { return "translate(0," + i * 20 + ")"; });

  legend.append("rect")
    .attr("x", width - 19)
    .attr("width", 19)
    .attr("height", 19)
    .attr("fill", z);

  legend.append("text")
    .attr("x", width - 24)
    .attr("y", 9.5)
    .attr("dy", "0.32em")
    .text(function(d) { return d; });
}