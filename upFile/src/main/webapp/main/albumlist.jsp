<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% 
	pageContext.setAttribute("path", request.getContextPath());
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>持明法洲主页</title>
	<link type="text/css" rel="stylesheet" href="${path}/themes/default/easyui.css">
	<link type="text/css" rel="stylesheet" href="${path}/themes/IconExtension.css">
	<link type="text/css" rel="stylesheet" href="${path}/themes/icon.css">
	<script type="text/javascript" src="${path}/js/jquery.min.js"></script>   
	<script type="text/javascript" src="${path}/js/jquery.easyui.min.js"></script>  
	<script type="text/javascript" src="${path}/js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${path}/js/datagrid-detailview.js"></script> 
  </head>
  
  <body>
    	<div id="detailsTable">
   			<table>
   			<tr>
   				<td><label>专辑封面:</label></td><td ><img id="image" src="" style="width:200px;height:200px" ></td>
   			</tr>
   			<tr>
   				<td><label>专辑编号:</label></td><td id="ids"></td>
   			</tr>
   			<tr>
   				<td><label>专辑名:</label></td><td id="names"></td>
   			</tr>
   			<tr>
   				<td><label>专辑推荐:</label></td><td id="score"></td>
   			</tr>
   			<tr>
   				<td><label>专辑播音:</label></td><td id="brodcast"></td>
   			</tr>
   			<tr>
   				<td><label>专辑作者:</label></td><td id="author"></td>
   			</tr>
   			<tr>
   				<td><label>专辑简介:</label></td><td id="brief"></td>
   			</tr>
   			<tr>
   				<td><label>发布日期:</label></td><td id="publicTime"></td>
   			</tr>
   			<tr>
   				<td><label>集&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数:</label></td><td id="count"></td>
   			</tr>
   			<tr>
   				<td><label>状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态:</label></td><td id="status"></td>
   			</tr>
   			</table>
   		</div>
   		<script type="text/javascript">
   			$(function(){
   				
   				$.ajax({
   					url:'${path}/album/queryItem',
   					type:'POST',
   					data:"id="+'${param.id}',
   					success:function(r){
   						$('#ids').html(r.id);
   						$('#image').prop("src","${path}/"+"album/"+r.coverImg);
   						$('#names').html(r.title);
   						$('#score').html(r.score);
   						$('#brodcast').html(r.brodcast);
   						$('#author').html(r.author);
   						$('#brief').html(r.brief);
   						$('#publicTime').html(r.publicTime);
   						$('#count').html(r.count);
   						$('#coverImg').html(r.coverImg);
   						$('#status').html(r.status);
   					},
   					error:function(){
   						alert("error");
   					}
   				})
   			})
   		</script>
  </body>
</html>
