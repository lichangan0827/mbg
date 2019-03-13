<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
  				url:'${path}/upfile/queryAll',
  				pagination:true,
  	  			pageNumber:1,
  	  			pageSize:2,
  	  			pageList:[2,3,20],
  	  			toolbar:[
  	  			         {
  	  			        	 text:'下载',
  	  			        	 iconCls:'icon-add',
  	  			        	 handler:function(){
                                 var banner =  $('#userAll').datagrid('getChecked');
  	  			        		window.location.href = ' ${path}/upfile/download?id='+banner[0].url;
  	  			        	 }
  	  			         },
                    {
                        text:'添加音频',
                        iconCls:'icon-cdr_add',
                        handler:function(){
                         $("#chapterInsert").dialog({
							 title:'添加',
                             buttons:[
								 {
								     text:'确认',
                                     iconCls:'icon-ok',
									 handler:function () {
										 $("#chapterIn").form('submit',{
											 url:'${path}/upfile/insert',
											 onSubmit:function () {
                                                 return $('#chapterIn').form('validate');
                                             },
											 success:function () {
                                                 $('#userAll').datagrid('reload');
                                                 $('#chapterIn').form('clear');
                                             }
										 })
                                     }
								 },
								 {
								     text:'取消',
                                     iconCls:'icon-on',
									 handler:function () {
                                         $('#treegrid').treegrid('reload');
                                     }
								 }
							 ]
						 })
                        }
                    },
  	  			         ],
  				columns:[[ 
  				{field:'id',title:'编号',width:80},
  				{field:'url',title:'地址',width:80,},
  				{field:'username',title:'名字',width:80,},
  				]],
  				view: detailview, 
  				detailFormatter: function(rowIndex, rowData){ 
  				return '<table><tr>' + 
  				'<td rowspan=2 style="border:0"><img src="${path}/album/'+rowData.url+'" style="height:50px;"></td>' +
  				'<td style="border:0">' + 
  				'<p>姓名: ' + rowData.url + '</p>' +
  				'<p>签名: ' + rowData.url  + '</p>' +
  				'<p>手机号: ' + rowData.url + '</p>' +
  				'</td>' +
  				'</tr></table>'; 
  				} 
  				});

  		})
  		</script>
		<!-- 添加章节  -->
		<div id="chapterInsert" style="display:none;width:250px;height:200px">
			<form method="POST" id="chapterIn" enctype="multipart/form-data">
				<div  style="margin-top:15px;padding-left: 15px">
					章节名:<input name="username" class="easyui-textbox" data-options="required:true," style="width:150px">
				</div>
				<div  style="margin-top:15px;padding-left: 15px">
					地&nbsp;&nbsp;&nbsp;址:<input name="upFile" class="easyui-filebox" data-options="required:true,buttonIcon:'icon-ok',buttonText:'选择音频'" style="width:150px">
				</div>
				<input id="albumId" type="hidden" name="albumId" value="">
			</form>
		</div>
  </body>
</html>
