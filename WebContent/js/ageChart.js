var drawAge = function(d3) {
	document.getElementById("chart1").innerHTML = "";
    'use strict';
    
    var ageChart = chartRaw.data.age;
    console.log(ageChart);
    var agekey1st = Object.keys(ageChart[0]);
    var agekey2nd = Object.keys(ageChart[1]);
    var agekey3rd = Object.keys(ageChart[2]);
    var agekey4th = Object.keys(ageChart[3]);
    var agekey5th = Object.keys(ageChart[4]);
    var agekey6th = Object.keys(ageChart[5]);
    var agekey7th = Object.keys(ageChart[6]);
    var agekey8th = Object.keys(ageChart[7]);
    var agecount39 = ageChart[0][agekey1st];
    var agecount49 = ageChart[1][agekey2nd];
    var agecount29 = ageChart[2][agekey3rd];
    var agecount59 = ageChart[3][agekey4th];
    var agecount60 = ageChart[4][agekey5th];
    var agecount25 = ageChart[5][agekey6th];
    var agecount22 = ageChart[6][agekey7th];
    var agecount17 = ageChart[7][agekey8th];

        var dataset = [
          { label: '18岁以下', count: agecount17  },
          { label: '18到22岁', count: agecount22  },
          { label: '22到25岁', count: agecount25  },
          { label: '26岁到29岁', count: agecount29  },
          { label: '30岁到39岁', count: agecount39  },
          { label: '40岁到49岁', count: agecount49  },
          { label: '50岁到59岁', count: agecount59  },
          { label: '60岁以上', count: agecount60 }
        ];

        var width = 250;
        var height = 250;
        var radius = Math.min(width, height) / 2;
        var donutWidth = 35;
        var legendRectSize = 18;                                  // NEW
        var legendSpacing = 4;                                    // NEW

        var color = d3.scaleOrdinal(d3.schemeCategory20b);

        var svg = d3.select('#chart1')
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