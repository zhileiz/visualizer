function addCities(){
	document.getElementById("testChart").innerHTML = "";
	var testWidth = 640;
	var testHeight = 120;
	var margin = {top: 0, right: 50, bottom: 0, left: 40};
	var svg = d3.select('#testChart')
			.append('svg')
			.attr('width', testWidth)
			.attr('height', testHeight);	
	g = svg.append('g')
			.attr("transform", "translate(" + margin.left + "," +margin.top + ")");
	//define scales
	let	x = d3.scaleLinear().rangeRound([0, testWidth/1.2]),
		y = d3.scaleBand().rangeRound([testHeight, 0]).padding(0.1);
    var fromChart = chartRaw.data.ufrom;
    var key1st = Object.keys(fromChart[1]);
    var key2nd = Object.keys(fromChart[2]);
    var key3rd = Object.keys(fromChart[3]);
    var key4th = Object.keys(fromChart[4]);
    var key5th = Object.keys(fromChart[5]);
    var count1st = fromChart[1][key1st];
    var count2nd = fromChart[2][key2nd];
    var count3rd = fromChart[3][key3rd];
    var count4th = fromChart[4][key4th];
    var count5th = fromChart[5][key5th];
    console.log(key1st);
    var data = [
        { country: key1st, percentExpenditure: count1st },
        { country: key2nd, percentExpenditure: count2nd },
        { country: key3rd, percentExpenditure: count3rd },
        { country: key4th, percentExpenditure: count4th },
        { country: key5th, percentExpenditure: count5th },
      ];
	//sort data
	data.sort(function(a,b) { return a.percentExpenditure - b.percentExpenditure; });
	//define domains based on data
	x.domain([0, d3.max(data, function(d) { return d.percentExpenditure; })]);
	y.domain(data.map(function(d) { return d.country; }));
	//append x axis to svg
	g.append("g")
		.attr("class", "x-axis")
		.attr("transform", "translate(0," + testHeight + ")")
		.call(d3.axisBottom(x))
		.append("text")
		.attr("y", 30)
		.attr("x", 650)
		.style("fill", "#9C9EDE")
		.style("font-size", "20px")
		.text("% of GDP");
	//append y axis to svg
	g.append("g")
		.attr("class", "y-axis")
		.call(d3.axisLeft(y));
	//append rects to svg based on data
	g.selectAll(".bar")
		.data(data)
		.enter()
		.append("rect")
		.attr("class", "bar")
		.attr("x", 0)
		.attr("y", function(d) { return y(d.country); })
		.attr("height", y.bandwidth()-10)
		.attr("width", function(d) { return x(d.percentExpenditure); })
		.style("fill", "#9C9EDE");
}
	
	