<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%pageContext.setAttribute("path", request.getContextPath()); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${path }/js/echarts.min.js"></script>
<script type="text/javascript" src="${path}/js/jquery.min.js"></script>
<script type="text/javascript" src="http://cdn-hangzhou.goeasy.io/goeasy.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div id="main" style="width: 600px;height:400px;"></div>
	<script type="text/javascript">
	var goEasy = new GoEasy({
		appkey: 'BC-b813020d33384fd19d6ad31fb8cbcc02'
	});
		goEasy.subscribe({
			channel:'demo_channel',
			onMessage: function(message){
			var r = eval("("+message.content+")");
			 var option = {
			            title: {
			                text: '用户注册数据'
			            },
			            tooltip: {},
			            legend: {
			                data:['男','女']
			            },
			            xAxis: {
			                data: r.months
			            },
			            yAxis: {},
			            series: [{
			                name: '男',
			                type: 'bar',
			                data: r.man
			            },{
			                name: '女',
			                type: 'bar',
			                data: r.woman
			            }
			            ]
			        };

			        // 使用刚指定的配置项和数据显示图表。
			        myChart.setOption(option);
			}
			
		});
	//GoEasy-OTP可以对appkey进行有效保护，详情请参考：GoEasy-Reference
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
		$.post("${path}/time/womanMonth",function(r){
			 // 指定图表的配置项和数据
	        var option = {
	            title: {
	                text: '用户注册数据'
	            },
	            tooltip: {},
	            legend: {
	                data:['男','女']
	            },
	            xAxis: {
	                data: r.months
	            },
	            yAxis: {},
	            series: [{
	                name: '男',
	                type: 'bar',
	                data: r.man
	            },{
	                name: '女',
	                type: 'bar',
	                data: r.woman
	            }
	            ]
	        };

	        // 使用刚指定的配置项和数据显示图表。
	        myChart.setOption(option);
		},"json");
       
    </script>
</body>
</html>