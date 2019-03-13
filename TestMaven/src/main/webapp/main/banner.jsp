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
  		<table id="tt"></table>
  		<script type="text/javascript">
  		$('#tt').datagrid({ 
  			width:500, 
  			height:250, 
  			remoteSort:false, 
  			nowrap:false,
  			//ctrl 选中
  			ctrlSelect:true,
  			fitColumns:true,
  			rownumbers:true,
  			checkOnSelect:true,
  			fit:true,
  			url:'${path}/banner/queryAll', 
  			pagination:true,
  			pageNumber:1,
  			pageSize:2,
  			pageList:[2,3,5],
  			columns:[[ 
  			{field:'ck',checkbox:true,width:100},
  			{field:'title',title:'名字',width:80}, 
  			{field:'status',title:'状态',width:100,sortable:true,
  				formatter:function(value,row,index){
  					if(row.status == "y"){
  						return "<a id='a' onclick=\"btn('"+row.id+"')\">"+row.status+"</a>";
  					}else{
  						return "<a id='a' onclick=\"btn('"+row.id+"')\">"+row.status+"</a>";
  					}
  				}}, 
  			{field:'img_path',title:'路径',width:80,align:'right',sortable:true}, 
  			{field:'createTime',title:'时间',width:80,align:'right',sortable:true}, 
  			]], 
  			view: detailview, 
  			detailFormatter: function(rowIndex, rowData){ 
  				if(rowData.status == "y"){
  					var s = "轮播";
  				}else{
  					var s = "未轮播";
  				}
  			return '<table><tr>' + 
  			'<td rowspan=2 style="border:0"><img src="${path}'+rowData.img_path+'" style="height:100px;"></td>' + 
  			'<td style="border:0">' + 
  			'<p>时间: ' + rowData.createTime + '</p>' + 
  			'<p>状态: ' + s + '</p>' + 
  			'<p>事件: ' + rowData.description + '</p>' + 
  			'</td>' + 
  			'</tr></table>'; 
  			}, 
  			//顶部工具栏
  			toolbar:[
  			         {
  			        	 text:'添加',
  			        	 iconCls:'icon-film_add',
  			        	 handler:function(){
  			        		 $('#bannerInsert').dialog({
  			        			 	title:'添加',
  			        			 	buttons:[
  			        			 	         {
  			        			 	        	 text:'确认提交',
  			        			 	        	 iconCls:'icon-ok',
  			        			 	        	 handler:function(){
  			        			 	        		 $('#bannerIn').form('submit',{
  			        			 	        			url:'${path}/banner/insertUpFile',
  			        			 	        			onSubmit:function(){
  			        			 	        				return $('#bannerIn').form('validate');
  			        			 	        			},
  			        			 	        			success:function(){
  			        			 	        				$('#bannerInsert').dialog('close');
  			        			 	        				$('#tt').datagrid('reload');
  			        			 	        				$('#bannerIn').form('clear');
  			        			 	        			}
  			        			 	        		 });
  			        			 	        	 }
  			        			 	         },
  			        			 	         {
  			        			 	        	 text:'取消',
  			        			 	        	 iconCls:'icon-no',
  			        			 	        	 handler:function(){
  			        			 	        		 //关闭窗口
  			        			 	        		$('#bannerInsert').dialog('close');
  			        			 	        		$('#tt').datagrid('reload');
  			        			 	        	 }
  			        			 	         }
  			        			 	         ]
  			        		 });
  			        	 },
  			         },
  			         {
  			        	 text:'批量删除',
  			        	 iconCls:'icon-film_delete',
  			        	 handler:function(){
  			        		var banner =  $('#tt').datagrid('getChecked');
  			        		//查看是否选中行
  			        		if(banner.length == 0){
  			        			$.messager.alert('提示信息','请选中一行数据','warning');
  			        		}else{
  			        			$.messager.confirm('提示信息','您确定删除该行数据吗？',function(r){
  			        				if(r){
  			        					//设置一个空集合
  			        					var list = [];
  			        					for(var i=0;i<banner.length;i++){
  			        						list.push(banner[i].id);
  			        					}
  			        					console.log(list);
  			        					$.ajax({
  			        						url:'${path}/banner/deleteAll',
  			        						type:'POST',
  			        						//将list集合转成json
  			        						data:JSON.stringify(list),
  			        						contentType:'application/json',
  			        						success:function(r){
  			        							$.messager.alert('提示信息','删除成功','info');
  			        							$('#tt').datagrid('reload');
  			        						},
  			        						error:function(){
  			        							alert("error");
  			        						}
  			        					})
  			        				}
  			        			});
  			        		}
  			        	 }
  			         },
  			         {
  			        	text:'修改',
  			        	iconCls:'icon-film_edit',
  			        	handler:function(){
  			        		var sum = $('#tt').datagrid('getSelected');
  			        		if(sum != null){
							//给form表单赋值
							$('#bannerUp').form('load',{
								id:sum.id,
								title:sum.title,
								img_path:sum.img_path,
								description:sum.description,
								status:sum.status,
								createTime:sum.createTime,
							});
							//给图片赋值
							$('img').prop('src',"${path}/"+sum.img_path);
  			        		$('#bannerUpdate').dialog({
  			        			title:'修改',
  			        			buttons:[
  			        			         {
  			        			        	 text:'确认修改',
  			        			        	 iconCls:'icon-ok',
  			        			        	 handler:function(){
  			        			        		 $('#bannerUp').form('submit',{
  			        			        			 url:'${path}/banner/updateBanner',
  			        			        			 onSubmit:function(){
  			        			        				return $('#bannerUp').form('validate');
  			        			        			 },
  			        			        			 success:function(){
  			        			        				 $.messager.alert('提示信息','信息修改成功','info');
  			        			        				 //刷新页面，关系窗口
  			        			        				 $('#bannerUpdate').dialog('close');
  			        			        				 $('#tt').datagrid('reload');
  			        			        			 }
  			        			        		 });
  			        			        	 }
  			        			         },
  			        			         {
  			        			        	 text:'取消',
  			        			        	 iconCls:'icon-no',
  			        			        	 handler:function(){
  			        			        		 //关闭窗口并刷新页面
  			        			        		$('#bannerUpdate').dialog('close');
  			        			        		$('#tt').datagrid('reload');
  			        			        	 }
  			        			         }
  			        			         ]
  			        		});
  			        		}else{
  			        			$.messager.alert('提示信息','请选中一行数据','warning');
  			        		}
  			        	}
  			         },
  			         {
  			        	 text:'刷新',
  			        	 iconCls:'icon-film_star',
  			        	 handler:function(){
  			        		$('#tt').datagrid('reload');
  			        	 }
  			         }
  			         ]
  			});
  		
  		function btn(ids){
  			$.ajax({
  				url:'${path}/banner/status',
  				type:'POST',
  				data:'id='+ids,
  				success:function(r){
  					$('#tt').datagrid('reload');
  					$.messager.alert('提示信息','修改成功','info');
  				},
  				error:function(){
  					alert('error');
  				}
  			});
  		}
  		</script>
  		<!-- 添加   -->
  		<div id="bannerInsert" style="display:none;width:250px;height:230px">
  			<form method="POST" id="bannerIn" enctype="multipart/form-data">
  				<div  style="margin-top:20px;padding-left: 15px">
  					轮播图名:<input name="title" class="easyui-textbox" data-options="required:true," style="width:150px">
  				</div>
  				<div style="margin-top:10px;padding-left: 15px">
  				地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址:<input name="upFile" class="easyui-filebox" data-options="required:true,buttonIcon:'icon-ok',buttonText:'选择图片'" style="width:150px">
  				</div>
  				<div style="margin-top:10px;padding-left: 15px">
  				事&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;件:<input name="description" class="easyui-textbox" data-options="required:true" style="width:150px">
  				</div>
  				<!-- <div style="margin-top:10px;padding-left: 15px">
  				状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态:<input name="status" class="easyui-textbox" data-options="required:true" style="width:150px">	
  				</div> -->
  				<div style="margin-top:10px;padding-left: 15px">
  				状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态:<select name="status" class="easyui-combobox" style="width:150px">
  																<option value="y">正在展示</option>
  																<option value="x">已下架</option>
  														</select>	
  				</div>
  			</form>
  		</div>
  		<!-- 修改  -->
  		<div id="bannerUpdate" style="display:none;width:320px;height:500px;" >
  			<form method="POST" id="bannerUp">
  					<input type="hidden" id="id" name="id">
  				<div style="margin-top:10px;padding-left: 30px">
  				轮&nbsp;播&nbsp;图:<img src="" style="width:195px;height:233px;" >
  				</div>
  				<div style="margin-top:10px;padding-left: 30px">
  				轮播图名:<input class="easyui-textbox" id="title" name="title" data-options="required:true" >
  				</div>
  				<div style="margin-top:10px;padding-left: 30px">
  				路&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;径:<input class="easyui-textbox" id="img_path" name="img_path" data-options="required:true" >	
  				</div>
  				<div style="margin-top:10px;padding-left: 30px">
  				事&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;件:<input class="easyui-textbox" id="description" name="description" data-options="required:true" >
  				</div>
  				<div style="margin-top:10px;padding-left: 30px">
  				状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态:<input class="easyui-textbox" id="status" name="status" data-options="required:true" >
  				</div>
  				<div style="margin-top:10px;padding-left: 30px">
  				上传时间:<input class="easyui-textbox" id="createTime" name="createTime" data-options="disabled:true" >
  				</div>
  			</form>
  		</div>
  </body>
</html>
