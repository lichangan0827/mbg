<%@ page language="java" pageEncoding="UTF-8"%>
<% 
	pageContext.setAttribute("path", request.getContextPath());
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>轮播图主页</title>
    
	<link type="text/css" rel="stylesheet" href="${path}/themes/default/easyui.css">
	<link type="text/css" rel="stylesheet" href="${path}/themes/IconExtension.css">
	<link type="text/css" rel="stylesheet" href="${path}/themes/icon.css">
	<script type="text/javascript" src="${path}/js/jquery.min.js"></script>   
	<script type="text/javascript" src="${path}/js/jquery.easyui.min.js"></script>  
	<script type="text/javascript" src="${path}/js/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript" src="${path}/js/datagrid-detailview.js"></script> 
	
	
	
  </head>
  
  <body>
  		<table id="userAll"></table>
  		<script type="text/javascript">
  		$(function(){
  			$('#userAll').datagrid({ 
  				width:500, 
  				height:250, 
  				remoteSort:false, 
  				singleSelect:true, 
  				nowrap:false,
  				fit:true,
  				fitColumns:true, 
  				url:'${path}/user/findAll',
  				pagination:true,
  	  			pageNumber:1,
  	  			pageSize:2,
  	  			pageList:[2,3,20],
  	  			toolbar:[
  	  			         {
  	  			        	 text:'下载',
  	  			        	 iconCls:'icon-add',
  	  			        	 handler:function(){
  	  			        		window.location.href = ' ${path}/user/downloadExcel';
  	  			        	 }
  	  			         }
  	  			         ],
  				columns:[[ 
  				{field:'dharmaName',title:'法名',width:80}, 
  				{field:'sex',title:'性别',width:80,}, 
  				{field:'privoince',title:'省份',width:80,}, 
  				{field:'city',title:'城市',width:80,}, 
  				{field:'creatTime',title:'注册时间',width:80,},
  				{field:'status',title:'状态',width:80,} 
  				]], 
  				view: detailview, 
  				detailFormatter: function(rowIndex, rowData){ 
  				return '<table><tr>' + 
  				'<td rowspan=2 style="border:0"><img src="${path}'+rowData.photo+'" style="height:50px;"></td>' + 
  				'<td style="border:0">' + 
  				'<p>姓名: ' + rowData.realname + '</p>' + 
  				'<p>签名: ' + rowData.sign  + '</p>' + 
  				'<p>手机号: ' + rowData.phoneNum + '</p>' + 
  				'</td>' + 
  				'</tr></table>'; 
  				} 
  				});

  		})
  		</script>
  </body>
</html>
