<%@ page language="java"
    contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=6254YFdX7nkww3tFT0YLR3ie6nC60kv8"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/library/Heatmap/2.0/src/Heatmap_min.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/library/GeoUtils/1.2/src/GeoUtils_min.js"></script>
    <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
    <script src="https://use.fontawesome.com/d94b0d3b0f.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.js"></script>
    <link rel="stylesheet" href="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.css" />
    <script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.js"></script>
    <link rel="stylesheet" href="http://api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.css" />
    <script src="http://d3js.org/d3.v4.min.js" charset="utf-8"></script>
    <link rel="stylesheet" href="stylesheet2.css" />
    <title>上海联通实时人群热力图</title>
  </head>

  <body>
    <div class="info-overlay" id="color-scale">Hello World</div>
    <div id="container" style="position:relative;"></div>
  </body>

</html>
<script type="text/javascript">
	// ##########
	// 1. 全局变量
	// ##########
    var gridData = [];
    var counts = [];
    var polygonMap = new Map();
    // #####################
    // 2. 地图和热力图展示类函数
    // #####################
    //初始化百度地图
    var map = new BMap.Map("container");
    var point = new BMap.Point(121.7, 31.16);
    map.centerAndZoom(point, 11);
    map.setMapStyle({style:'midnight'});
    globalDisable(map);
    function globalDisable(map){
        map.disableContinuousZoom();
        map.disableDoubleClickZoom();
        map.setMinZoom(11);
        map.setMaxZoom(16);
    }
    
    function getGrids(){
        $.ajax({
            url:"services/mapGrid",
            type:"post",
            async:true,
            dataType:"json",
            data:{name:"this"},
            success:function(data){
              gridData = data;
              console.log(data);
            }
           });
    }
    function getCount(){
        $.ajax({
            url:"services/count",
            type:"post",
            async:true,
            dataType:"json",
            data:{name:"this"},
            success:function(data){
              counts = data;
            }
           });
    }
    
    getGrids();
    getCount();
    var o = setTimeout("populate()",300);
    var p = setTimeout("populateColor()",1200);
    var q = setInterval("populateColor()",5000);
    
    function populate(){
    	for (var i = 0; i < gridData.length; i++){
    		try{
    		var id = gridData[i].id;
    		var swlng = parseFloat(gridData[i].swlng);
            var swlat = parseFloat(gridData[i].swlat);
            var selng = parseFloat(gridData[i].selng);
            var selat = parseFloat(gridData[i].selat);
            var nwlng = parseFloat(gridData[i].nwlng);
            var nwlat = parseFloat(gridData[i].nwlat);
            var nelng = parseFloat(gridData[i].nelng);
            var nelat = parseFloat(gridData[i].nelat);
            var polygon = new BMap.Polygon(
                    [new BMap.Point(swlng,swlat), new BMap.Point(selng,selat),new BMap.Point(nelng,nelat),new BMap.Point(nwlng,nwlat)],
                    {fillColor:"#000083",strokeColor:"white", strokeWeight:1, strokeOpacity:0.1}
            );
            map.addOverlay(polygon);
            polygonMap.set(id,polygon);
    		}catch(err){
    			console.log("error at:" + i);
    		}
    	}
    	console.log(polygonMap.size);
    }
    
    function populateColor(){
    	console.log("populated");
    	for (var i = 0; i < counts.length; i ++){
    		var id = counts[i].gridId;
    		if (polygonMap.has(id)){
    			var count = parseInt(counts[i].count);
    			if (count > 0 && count <= 10){
    				polygonMap.get(id).setFillColor("#03B0DD");
    			} else if (count > 10 && count <= 100) {
                    polygonMap.get(id).setFillColor("#11FFF3");
    			} else if (count > 100 && count <= 500) {
                    polygonMap.get(id).setFillColor("#82FF80");
                } else if (count > 500 && count <= 1500) {
                    polygonMap.get(id).setFillColor("#E3FF1D");
                } else if (count > 1500 && count <= 3000) {
                    polygonMap.get(id).setFillColor("#FD8800");
                } else if (count > 3000 && count <= 8000) {
                    polygonMap.get(id).setFillColor("#FB3500");
                } else if (count > 8000 && count <= 15000) {
                    polygonMap.get(id).setFillColor("#BF0000");
                } else if (count > 15000){
                	polygonMap.get(id).setFillColor("#800000");
                }
    		} else {
    			console.log("want to find: " + id + "\n")
    		}
    	}
    }
    
    

</script>