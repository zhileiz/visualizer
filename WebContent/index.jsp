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
    <link rel="stylesheet" href="stylesheets.css" />
    <title>上海联通实时人群热力图</title>
  </head>

  <body>
        <div class="choosePos" onclick="showMain()">
            <i class="fa fa-map-marker fa-5x"></i>
        </div>
        <div class="chooseDrop" id="mainChoices">
            <div style="margin-top:120px;">
                <div id="clickAllCity" class="dropdownitem" onclick="seeRegion(cityCenter, 11)">全市</div>
                <div class="dropdownitem" onclick="showDrop()">区县</div>
                <div class="dropdownitem" onclick="showAreas()">热点</div>
                <div onclick="showMain()"><i class="fa fa-angle-double-up fa-2x" aria-hidden="true"></i></div>
            </div>
        </div>
        <div class="chooseDrop" id="maindrop" style="margin-left:120px;">
            <div style="margin-top:163px;">
              <div id="clickHuangpu" class="dropdownitem" onclick="seeDistrict('上海市黄浦区')">黄浦</div>
              <div id="clickXuhui" class="dropdownitem" onclick="seeDistrict('上海市徐汇区')">徐汇</div>
              <div id="clickChangning" class="dropdownitem" onclick="seeDistrict('上海市长宁区')">长宁</div>
              <div id="clickJingan" class="dropdownitem" onclick="seeDistrict('上海市静安区')">静安</div>
              <div id="clickPutuo" class="dropdownitem" onclick="seeDistrict('上海市普陀区')">普陀</div>
              <div id="clickHongkou" class="dropdownitem" onclick="seeDistrict('上海市虹口区')">虹口</div>
              <div id="clickYangpu" class="dropdownitem" onclick="seeDistrict('上海市杨浦区')">杨浦</div>
              <div id="clickMinhang" class="dropdownitem" onclick="seeDistrict('上海市闵行区')">闵行</div>
              <div id="clickBaoshan" class="dropdownitem" onclick="seeDistrict('上海市宝山区')">宝山</div>
              <div id="clickJiading" class="dropdownitem" onclick="seeDistrict('上海市嘉定区')">嘉定</div>
              <div id="clickPudong" class="dropdownitem" onclick="seeDistrict('上海市浦东区')">浦东</div>
              <div id="clickJinshan" class="dropdownitem" onclick="seeDistrict('上海市金山区')">金山</div>
              <div id="clickSongjiang" class="dropdownitem" onclick="seeDistrict('上海市松江区')">松江</div>
              <div id="clickQingpu" class="dropdownitem" onclick="seeDistrict('上海市青浦区')">青浦</div>
              <div id="clickFengxian" class="dropdownitem" onclick="seeDistrict('上海市奉贤区')">奉贤</div>
              <div id="clickChongming" class="dropdownitem" onclick="seeDistrict('上海市崇明区')">崇明</div>
              <div onclick="showDrop()"><i class="fa fa-angle-double-up fa-3x" aria-hidden="true"></i></div>
            </div>
        </div>
        <div class="chooseDrop" id="mainAreas" style="margin-left:120px;">
            <div style="margin-top:206px;">
              <div id="clickRenMinGuangChang" class="dropdownitem" onclick="seeRegion(rmgc, 17)">人民广场</div>
              <div id="clickDiShiNi" class="dropdownitem" onclick="seeRegion(dsn, 16)">迪士尼</div>
              <div id="clickZhongShanGongYuan" class="dropdownitem" onclick="seeRegion(zsgy, 17)">中山公园</div>
              <div id="clickPuDongJiChang" class="dropdownitem" onclick="seeRegion(pdjc, 15)">浦东机场</div>
              <div onclick="showAreas()"><i class="fa fa-angle-double-up fa-3x" aria-hidden="true"></i></div>
            </div>
        </div>
    <div class="chartButton" onclick="showDetails()">
         
    </div>
    <div class="infobox">
        当前区域总人数：<span id="total">
    </div>
    <div class="chartbox" id="myCharts">
         <div class="row">
            <div class="chart" id="testChart2"></div>
         </div>
        <div class="row">
            <div class="col">
                <div class="chartbox-sub">年龄</div>
                <div class="chart" id ="chart1"></div>
            </div>
            <div class="col">
                <div class="chartbox-sub">性别</div>
                <div class="chart" id ="chart2"></div>
            </div>
         </div>
        <div class="row">
            <div class="col">
                <div class="chartbox-sub">归属地</div>
                <div class="chart" id ="chart3"></div>
            </div>
            <div class="col">
                <div class="chartbox-sub">ARPU值</div>
                <div class="chart" id ="chart4"></div>
            </div>
         </div>
         <div class="row" style="margin-top:20px;">
            <div class="chart" id="testChart"></div>
         </div>
    </div>
    </div>  
    <div hidden class="switch-box">
        <div class="row justify-content-center" id="switch">
            <div class="col-3">选区</div>
            <div class="col-6">
            <div id="div1" class="open1">
            <div id="div2" class="open2"></div>
            </div>
        </div>
        <div class="col-3"> 拖拽</div>
    </div>
  </div>
  <div hidden class="infobox2">
  </span>&nbsp&nbsp栅格数：<span id="number"></span><!-- &nbsp&nbsp最大值：<span id="max"></span--><br/>
        划定区域总人数：<span id="total2"></span>&nbsp&nbsp栅格数：<span id="number2"></span>
  划定区域总人数：<span id="total2"></span><br/>栅格数：<span id="number2"></span><br/>最大值：<span id="max2"></span>
            <div class="row justify-content-center" id="switch2">
            <div class="col-3">放大</div>
            <div class="col-6">
            <div id="div3" class="open1">
            <div id="div4" class="open2"></div>
            </div>
        </div>
        <div class="col-3"> 选择</div>
    </div>
    </div>
    <div id="container" style="position:relative;"></div>
  </body>

</html>

<script type="text/javascript" src="js/sexChart.js"></script>
<script type="text/javascript" src="js/originChart.js"></script>
<script type="text/javascript" src="js/testChart.js"></script>
<script type="text/javascript" src="js/ageChart.js"></script>
<script type="text/javascript" src="js/arpuChart.js"></script>
<script type="text/javascript" src="js/testChart2.js"></script>
<script type="text/javascript">
    // #################
    // 0. 全局变量
    // #################
    // 地图覆盖物
    var layers = []; // 区域覆盖物
    var points =[]; //栅格点
    var chartRaw;
    var regionPoints = []; //区域栅格点
    var overlays = []; //矩形覆盖物
    // 地理位置
    var cityCenter = new BMap.Point(121.7, 31.16); //地图初始中心点
    var rmgc = new BMap.Point(121.481139,31.235301); // 人民广场
    var dsn = new BMap.Point(121.674752,31.147665); // 迪士尼
    var zsgy = new BMap.Point(121.425139,31.224753); // 中山公园
    var pdjc = new BMap.Point(121.81484,31.156873); // 浦东机场
    // 展示数据
    var totalShow = 0;
    var districtMax = 0;
    // ################
    // 1. 控件和操作类函数
    // ################
    
    // 地图选区操作
    // a. 选择热点区域
    function seeRegion(point, level){
    	clearAll();
    	removeRegion(layers);
        changeCenter(point,level);
    }
    // b. 选择行政区县
    function seeDistrict(name){
        getBoundary(name);
        var t = setTimeout("get()",1000);
        var v = setTimeout("setTotal(totalShow)",2000);
    }
    
    function setTotal(total){
        document.getElementById("total").innerHTML = total;
        heatmapOverlay.setDataSet({data:regionPoints,max:districtMax});
    }
    
    // #####################
    // 2. 地图和热力图展示类函数
    // #####################
    //初始化百度地图
    var map = new BMap.Map("container");
    var point = new BMap.Point(121.7, 31.16);
    map.centerAndZoom(point, 11);
    map.disableScrollWheelZoom();
    map.setMapStyle({style:'midnight'});
    function globalDisable(map){
        map.disableContinuousZoom();
        map.disableDoubleClickZoom();
        map.setMinZoom(11);
        map.setMaxZoom(16);
    }
    //查看是否支持热力图
    if(!isSupportCanvas()){
        alert('热力图目前只支持有canvas支持的浏览器,您所使用的浏览器不能使用热力图功能~')
    }
    //初始化热力图
    heatmapOverlay = new BMapLib.HeatmapOverlay({"radius":12});
    enable = true;
    map.addOverlay(heatmapOverlay);
    function get(enable){
        map.disableDragging();
        enable = false;
        $.ajax({
            url:"services/heatmap",
            type:"post",
            async:true,
            dataType:"json",
            success:function(data){
              points = data;
            },
            complete:function(){
                var max = countCurrent(map);
                enable = true;
                redrawByZoomLevel(map,max);
                map.enableDragging();
                globalDisable(map);
            }
           });
    }
    get();
    get2();
    var time = setTimeout(console.log(chartRaw),500);
    var t = setInterval("get()",5000);
    //判断浏览区是否支持canvas
    function isSupportCanvas(){
        var elem = document.createElement('canvas');
        return !!(elem.getContext && elem.getContext('2d'));
    }
    
    function get2(){
    	var locations = boundToArray(map.getBounds());
        $.ajax({
            url:"services/peoplePic",
            type:"post",
            async:true,
            dataType:"json",
            data:{x1:locations[0],x2:locations[1],x3:locations[2],x4:locations[3]},
            success:function(data){
              chartRaw = data;
            }
           });
    }
    
    function boundToArray(b){
    	var locations = [];
    	var sw = b.getSouthWest();
    	var ne = b.getNorthEast();
    	locations.push(sw.lng.toString());
        locations.push(sw.lat.toString());
        locations.push(ne.lng.toString());
        locations.push(ne.lat.toString());
        return locations;
    }
    
    
    var chartInterval = 0;
    function showDetails(){
    	var k = document.getElementById("myCharts");
    	if (k.style.display === 'none'){
    		k.style.display = "block";
    		get2();    	
    		var time = setTimeout(console.log(chartRaw),500);
    		drawGender(d3);
    		drawOrigin(d3);
    		drawAge(d3);
    		drawArpu(d3);
    		addCities();
    	    chartInterval = setInterval("get2()",5000);
    	} else {
    		k.style.display = 'none';
    		clearInterval(chartInterval);
    	}
    }
    get2();

    // #####################
    // 3. 拖拽绘画矩形选区函数
    // #####################

    //鼠标绘制完成回调方法   获取各个点的经纬度
    var overlaycomplete = function(e){
    	clearAll();
        overlays.push(e.overlay);
        if (document.getElementById("div3").className != "open1"){
        var path = e.overlay.getPath();//Array<Point> 返回多边型的点数组
        var pointSW = new BMap.Point(path[3].lng,path[3].lat);
        var pointNE = new BMap.Point(path[1].lng,path[1].lat);
        var bound = new BMap.Bounds(pointSW,pointNE);
        var center = bound.getCenter();
        map.panTo(center, false);
        while (map.getBounds().containsBounds(bound)){
            map.zoomIn();
            map.panTo(center, false);
        }
        var max = countCurrent(map);
        redrawByZoomLevel(map,max);
      } else {
        var path = e.overlay.getPath();//Array<Point> 返回多边型的点数组
        var pointSW = new BMap.Point(path[3].lng,path[3].lat);
        var pointNE = new BMap.Point(path[1].lng,path[1].lat);
        var bound = new BMap.Bounds(pointSW,pointNE);
        countRegion(map,bound);
      }
    };
    
    var styleOptions = {
        strokeColor:"red",    //边线颜色。
        strokeWeight: 3,       //边线的宽度，以像素为单位。
        strokeOpacity: 0.8,       //边线透明度，取值范围0 - 1。
        fillOpacity: 0,      //填充的透明度，取值范围0 - 1。
        strokeStyle: 'solid' //边线的样式，solid或dashed。
    }
    //实例化鼠标绘制工具
    var drawingManager = new BMapLib.DrawingManager(map, {
        isOpen: false, //是否开启绘制模式
        enableDrawingTool: false, //是否显示工具栏
        drawingMode:BMAP_DRAWING_RECTANGLE,//绘制模式  多边形
        drawingToolOptions: {
            anchor: BMAP_ANCHOR_TOP_RIGHT, //位置
            offset: new BMap.Size(5, 5), //偏离值
            drawingModes:[
                BMAP_DRAWING_RECTANGLE
            ]
        },
        rectangleOptions: styleOptions //多边形的样式
    });

     //添加鼠标绘制工具监听事件，用于获取绘制结果
    drawingManager.addEventListener('overlaycomplete', overlaycomplete);
    function clearAll() {
        for(var i = 0; i < overlays.length; i++){
            map.removeOverlay(overlays[i]);
        }
        globalDisable(map);
        overlays.length = 0
    }

    // #####################
    // 4. 地图和热力图重绘函数
    // #####################

    //根据可视区域展示总人数，返回热力图最大值
    function countCurrent(map){
        var total = 0;
        var number = 0;
        var max = 0;
        var onhand = 0;
        var boundary = map.getBounds();
        for (var point in points){
            var longit = parseFloat(points[point].lng);
            var latit = parseFloat(points[point].lat);
            var temp = new BMap.Point(longit,latit);
            if (boundary.containsPoint(temp)){
                var curr = parseInt(points[point].count);
                total = total + curr;
                if (curr > max){
                    max = curr;
                }
                number = number + 1;
            }
        }
        document.getElementById("total").innerHTML = total;
        document.getElementById("number").innerHTML = number;
        //document.getElementById("max").innerHTML = max;
        return (max+total/number)/2.5;
    }

    function countRegion(map, bounds){
      var total = 0;
      var number = 0;
      var max = 0;
      var onhand = 0;
      var boundary = bounds;
      for (var point in points){
          var longit = parseFloat(points[point].lng);
          var latit = parseFloat(points[point].lat);
          var temp = new BMap.Point(longit,latit);
          if (boundary.containsPoint(temp)){
              var curr = parseInt(points[point].count);
              total = total + curr;
              if (curr > max){
                  max = curr;
              }
              number = number + 1;
          }
      }
      document.getElementById("total").innerHTML = total;
      document.getElementById("number2").innerHTML = number;
     // document.getElementById("max2").innerHTML = max;
    }

    // 地图选区重绘函数
    function changeMapPos(point,zoom,radius,scale){
        map.removeOverlay(heatmapOverlay);
        map.centerAndZoom(point, zoom);
        heatmapOverlay = new BMapLib.HeatmapOverlay({"radius":radius});
        map.addOverlay(heatmapOverlay);
        map.enableDragging();
        heatmapOverlay.setDataSet({data:points,max:scale});
    }

    function changeCenter(point,level){
        changeMapPos(point,level,280,3000);
        var max = countCurrent(map);
        redrawByZoomLevel(map,max);
    }

    // 根据缩放大小重绘热力图
    function redrawByZoomLevel(map,curmax){
    	if (enable){
        var zoomLevel = map.getZoom();
        var center = map.getCenter;
       if (zoomLevel == 10){
    	    heatmapOverlay.setOptions({"radius":10});
            heatmapOverlay.setDataSet({data:points,max:curmax});
        }
        else if (zoomLevel == 11){
            heatmapOverlay.setOptions({"radius":12});
            heatmapOverlay.setDataSet({data:points,max:curmax});
        }
        else if (zoomLevel == 12){
            heatmapOverlay.setOptions({"radius":20});
            heatmapOverlay.setDataSet({data:points,max:curmax});
        }
        else if (zoomLevel == 13){
            heatmapOverlay.setOptions({"radius":40});
            heatmapOverlay.setDataSet({data:points,max:curmax});
        }
        else if (zoomLevel == 14){
            heatmapOverlay.setOptions({"radius":70});
            heatmapOverlay.setDataSet({data:points,max:curmax});
        }
        else if (zoomLevel == 15){
            heatmapOverlay.setOptions({"radius":110});
            heatmapOverlay.setDataSet({data:points,max:curmax});
        } 
        if (zoomLevel == 16){
            heatmapOverlay.setOptions({"radius":160});
            heatmapOverlay.setDataSet({data:points,max:curmax});
        }
    	}
        globalDisable(map);
    }
    
    
    // #############
    // 5. 左侧下拉菜单
    // #############
    //选区下拉框
    //主下拉菜单
    function showDrop(){
        var x = document.getElementById('maindrop');
        var y = document.getElementById('mainAreas');
        if (x.style.display === 'none'){
            x.style.display = 'block';
            if (y.style.display === 'block'){
                showAreas();
            }
        } else {
            x.style.display = 'none';
        }
    }
    //行政区县
    function showAreas(){
        var x = document.getElementById('mainAreas');
        var y = document.getElementById('maindrop');
        if (x.style.display === 'none'){
            x.style.display = 'block';
            if (y.style.display === 'block'){
                showDrop();
            }
        } else {
            x.style.display = 'none';
        }
    }
    //热点区域
    function showMain(){
        var x = document.getElementById('mainChoices');
        var y = document.getElementById('maindrop');
        var z = document.getElementById('mainAreas');
        if (x.style.display === 'none'){
            x.style.display = 'block';
        } else {
            x.style.display = 'none';
            if (y.style.display === 'block'){
                showDrop();
            }
            if (z.style.display === 'block'){
                showAreas();
            }
        }
    }
    
    showDrop();
    showMain();
    showAreas();
    globalDisable(map);

    // ##########
    // 6. 地图事件
    // ##########

    // 拖拽时重绘地图
    map.addEventListener("dragend",function(evt){
        var div1=document.getElementById("div1");
        if (div1.className=="open1"){
            var max = countCurrent(map);
            redrawByZoomLevel(map,max);
        } else {
            alert(evt.point.lng + "," + evt.point.lat);
        }
        map.disableContinuousZoom();
        map.disableDoubleClickZoom();
        map.setMinZoom(11);
        map.setMaxZoom(16);
    });
    
    //鼠标滚轮缩放
    var scrollFunc = function (e) {
        if (e.wheelDelta) {  //判断浏览器IE，谷歌滑轮事件
            if (e.wheelDelta > 0) { //当滑轮向上滚动时
                map.zoomIn();
                var max = countCurrent(map);
                redrawByZoomLevel(map,max);
                globalDisable(map);
            }
            if (e.wheelDelta < 0) { //当滑轮向下滚动时
                map.zoomOut();
                var max = countCurrent(map);
                redrawByZoomLevel(map,max);
                globalDisable(map);
            }
        }
    }
    //滚动滑轮触发scrollFunc方法  //ie 谷歌
    window.onmousewheel = scrollFunc;

    window.onload=function(){
        var div2=document.getElementById("div2");
        var div1=document.getElementById("div1");
        var div3=document.getElementById("div3");
        var div4=document.getElementById("div4");
        div2.onclick=function(){
            if (div1.className=="close1"){
                div1.className="open1";
                div2.className="open2";
                map.enableDragging();
                drawingManager.close();
                globalDisable(map);
            } else {
                div1.className="close1";
                div2.className="close2";
                map.disableDragging();
                drawingManager.open();
                globalDisable(map);
            }
        }
        div4.onclick=function(){
            if (div3.className =="close1"){
                div3.className="open1";
                div4.className="open2";
                globalDisable(map);
            } else {
                div3.className="close1";
                div4.className="close2";
                map.disableDragging();
                drawingManager.open();
                globalDisable(map);
            }
        }
    }
    
    // shift键切换
    document.onkeydown = checkKey;
    function checkKey(e){
        e = e || window.event;
        var div2=document.getElementById("div2");
        var div1=document.getElementById("div1");
        if (e.keyCode == "16"){
            if (div1.className=="close1"){
                div1.className="open1";
                div2.className="open2";
                map.enableDragging();
                clearAll();
                drawingManager.close();
            } else {
                div1.className="close1";
                div2.className="close2";
                map.disableDragging();
                drawingManager.open();
            }
        }
        globalDisable(map);
    }

    // #############
    // 7. 绘制行政区县
    // #############
    function getBoundary(k){
        var bdary = new BMap.Boundary();
        removeRegion(layers);
        bdary.get(k, function(rs){       //获取行政区域
            var count = rs.boundaries.length; //行政区域的点有多少个
            if (count === 0) {
                alert('未能获取当前输入行政区域');
                return ;
            }
            var pointArray = [];
            regionPoints.splice(0,regionPoints.length);
            var total = 0;
            var number = 0;
            var max = 0;
            var onhand = 0;
            for (var i = 0; i < count; i++) {
                var ply = new BMap.Polygon(rs.boundaries[i], {strokeWeight: 2, strokeColor: "#ff0000"}); //建立多边形覆盖物
                map.addOverlay(ply);  //添加覆盖物
                layers.push(ply);
                pointArray = pointArray.concat(ply.getPath());
                for (var point in points){
                    var longit = parseFloat(points[point].lng);
                    var latit = parseFloat(points[point].lat);
                    var temp = new BMap.Point(longit,latit);
                    if (BMapLib.GeoUtils.isPointInPolygon(temp,ply)){
                    	regionPoints.push(point);
                        var curr = parseInt(points[point].count);
                        total = total + curr;
                        if (curr > max){
                            max = curr;
                        }
                        number = number + 1;
                    }
                }
            }
            map.setViewport(pointArray);
            totalShow = total;
            districtMax = max;
        });
        return layers[0];
    }
    
    function removeRegion(layers){
        for (var i = 0; i < layers.length; i++){
            map.removeOverlay(layers.shift());
        }
    }
    

</script>