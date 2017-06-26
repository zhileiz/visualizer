
// set the dimensions and margins of the graph
var test2margin = {top: 5, right: 15, bottom: 25, left: 25},
    test2width = 580 - test2margin.left - test2margin.right,
    test2height = 120 - test2margin.top - test2margin.bottom;

// parse the date / time	
var parseTime = d3.timeParse("%d-%b-%y");

// set the ranges
var xtst = d3.scaleTime().range([0, test2width]);
var ytst = d3.scaleLinear().range([test2height, 0]);

// define the line
var valueline = d3.line()
    .x(function(d) { return xtst(d.date); })
    .y(function(d) { return ytst(d.close); });

// append the svg obgect to the body of the page
// appends a 'group' element to 'svg'
// moves the 'group' element to the top left margin
var svg = d3.select("#testChart2").append("svg")
    .attr("width", test2width + test2margin.left + test2margin.right)
    .attr("height", test2height + test2margin.top + test2margin.bottom)
  .append("g")
    .attr("transform",
          "translate(" + test2margin.left + "," + test2margin.top + ")");

var data = [
    { date: '1-May-12', close: 58.13},
    { date: '2-May-12', close: 52.13},
    { date: '3-May-12', close: 38.13},
    { date: '4-May-12', close: 68.13},
    { date: '5-May-12', close: 98.13},
  ];
  // format the data
  data.forEach(function(d) {
      d.date = parseTime(d.date);
      d.close = d.close;
  });

  // Scale the range of the data
  xtst.domain(d3.extent(data, function(d) { return d.date; }));
  ytst.domain([d3.min(data, function(d) { return d.close; })-30, d3.max(data, function(d) { return d.close; })]);

  // Add the valueline path.
  svg.append("path")
      .attr("class", "line")
      .attr("d", valueline(data));
  
  svg.selectAll("dot")
  	.data(data)
  	.enter().append("circle")
  	.attr("r",5)
  	.attr("cx", function(d){return xtst(d.date);})
  	.attr("cy", function(d){return ytst(d.close);})
  	.attr("fill","#9C9EDE");

  // Add the X Axis
  svg.append("g")
      .attr("transform", "translate(0," + test2height + ")")
      .call(d3.axisBottom(xtst));
  
  
  
  
  
  