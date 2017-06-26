var drawArpu = function(d3) {
	document.getElementById("chart4").innerHTML = "";
    'use strict';
    
    var arpuChart = chartRaw.data.arpu;
    console.log(arpuChart);
    var countArpu49 = arpuChart[0]['0-49元'];
    var count99 = arpuChart[1]['50-99元'];
    var count199 = arpuChart[2]['100-199元'];
    var count200 = arpuChart[3]['200元以上'];
    
    var dataset = [
        { label: '0-49元', count: countArpu49  },
        { label: '50-99元', count: count99  },
        { label: '100-199元', count: count199  },
        { label: '200元以上', count: count200  },
      ];

        var width = 250;
        var height = 250;
        var radius = Math.min(width, height) / 2;
        var donutWidth = 35;
        var legendRectSize = 18;                                  // NEW
        var legendSpacing = 4;                                    // NEW

        var color = d3.scaleOrdinal(d3.schemeCategory20b);

        var svg = d3.select('#chart4')
          .append('svg')
          .attr('width', width)
          .attr('height', height)
          .append('g')
          .attr('class',"legendpie")
          .attr('transform', 'translate(' + (width / 2) +
            ',' + (height / 2) + ')');

        var arc = d3.arc()
          .innerRadius(radius - donutWidth)
          .outerRadius(radius);

        var pie = d3.pie()
          .value(function(d) { return d.count; })
          .sort(null);

        var path = svg.selectAll('path')
          .data(pie(dataset))
          .enter()
          .append('path')
          .attr('d', arc)
          .attr('fill', function(d, i) {
            return color(d.data.label);
          });

        var legend = svg.selectAll('.legend')                     // NEW
          .data(color.domain())                                   // NEW
          .enter()                                                // NEW
          .append('g')                                            // NEW
          .attr('class', 'legend')                                // NEW
          .attr('transform', function(d, i) {                     // NEW
            var height = legendRectSize + legendSpacing;          // NEW
            var offset =  height * color.domain().length / 2;     // NEW
            var horz = -2 * legendRectSize;                       // NEW
            var vert = i * height - offset;                       // NEW
            return 'translate(' + horz + ',' + vert + ')';        // NEW
          });                                                     // NEW

        legend.append('rect')                                     // NEW
          .attr('width', legendRectSize)                          // NEW
          .attr('height', legendRectSize)                         // NEW
          .style('fill', color)                                   // NEW
          .style('stroke', color);                                // NEW

        legend.append('text')                                     // NEW
          .attr('x', legendRectSize + legendSpacing)              // NEW
          .attr('y', legendRectSize - legendSpacing)              // NEW
          .text(function(d) { return d; });                       // NEW

      }