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
        $(function () {  
	        $.ajax({  
		            type: "GET",  
		            //调用后台方法获取数据 
		            url: "${pageContext.request.contextPath}/admin/messageKind/pieByKindId",
					dataType : 'json',
					success : function(result) {
						console.log(result);
						var option = {
							title : {
								text : '留言分类饼状图展示'
							},
							tooltip : {},
							series : [ {
								name : '留言统计',
								type : 'pie',
								radius : '55%',// 饼图的半径，外半径为可视区尺寸（容器高宽中较小一项）的 55% 长度。
								//样例数据格式[ {value:235, name:'视频广告'},{value:274, name:'联盟广告'}]
								data : result//后台传过来时responseBody已经将list转为json串了
							} ]
						};
						// 设定option各种参数。
						myChart.setOption(option);
					}
		});
	});


			     
		
		
       
      
    </script>
</body>
</html>