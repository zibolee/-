<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>ECharts</title>
    <!-- 引入 echarts.js -->
     <script  src="${pageContext.request.contextPath}/res/js/jquery.min.js"></script>
     <script  src="${pageContext.request.contextPath}/res/js/echarts/echarts.js"></script>
      
     
</head>
<body>
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="width: 600px;height:400px;"></div>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
      //5.定义数据存放数组(动态变)
		var names = []; //建立一个类别数组（实际用来盛放X轴坐标值）
		var nums = []; //建立一个销量数组（实际用来盛放Y坐标值）
		//没有下句话不显示数据
		$.ajaxSettings.async = false;
		
		$.getJSON('${pageContext.request.contextPath}/admin/messageKind/barByKindId', function (result) {
			for (var i = 0; i < result.length; i++) {
				names.push(result[i].messagekindName); //迭代取出类别数据并填入类别数组
		
				nums.push(result[i].count); //迭代取出销量并填入销量数组
			}
		});
			 var option = {
			            title: {
			                text: '留言分类统计'
			            },
			            tooltip: {},
			            legend: {
			                data:['分类统计']
			            },
			            xAxis: {
			                data: names
			            },
			            yAxis: {},
			            series: [{
			                name: '门数',
			                type: 'bar',
			                data: nums
			            }]
			        };


			        // 使用刚指定的配置项和数据显示图表。
			        myChart.setOption(option);
		
		
        // 指定图表的配置项和数据
      
    </script>
</body>
</html>