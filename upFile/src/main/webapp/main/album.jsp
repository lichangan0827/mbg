<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% 
	pageContext.setAttribute("path", request.getContextPath());
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>专辑图主页</title>
    
	<link type="text/css" rel="stylesheet" href="${path}/themes/default/easyui.css">
	<link type="text/css" rel="stylesheet" href="${path}/themes/IconExtension.css">
	<link type="text/css" rel="stylesheet" href="${path}/themes/icon.css">
	<script type="text/javascript" src="${path}/js/jquery.min.js"></script>   
	<script type="text/javascript" src="${path}/js/jquery.easyui.min.js"></script>  
	<script type="text/javascript" src="${path}/js/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript" src="${path}/js/datagrid-detailview.js"></script> 
	
	
	
  </head>
  
  <body>
  		<table id="treegrid"></table>
  		<script type="text/javascript">
  		$('#treegrid').treegrid({    
  		    url:'${path}/album/queryAll',
  		    idField:'id',    
  		    treeField:'title',  
  		    fit:true,
  		 	fitColumns:true,
  		 	pagination:true,
  			pageNumber:1,
  			pageSize:20,
  			pageList:[2,3,20],
  		    columns:[[    
  		        {field:'title',title:'名字',width:100},    
  		        {field:'url',title:'下载路径',width:60},    
  		        {field:'size',title:'章节大小',width:80},    
  		        {field:'duration',title:'章节时长',width:80}    
  		    ]],
  		    toolbar:[
  		             {
  		            	 text:'专辑详情',
  		            	 iconCls:'icon-cd_go',
  		            	 handler:function(){
  		            		var chapter = $('#treegrid').datagrid('getChecked');
  		            		if(chapter != ""){
  		            			if(chapter[0].status == undefined){
  		            				$.messager.alert('提示信息','请选文件夹','warning');
  		            			}else{
  		            				addTaps({
  		         						title:'商品详细信息',
  		         						href:'albumlist.jsp?id='+chapter[0]. id,
  		         						closable:true,		
  		         					});  
  		            			}
  		            		}else{
  		            			$.messager.alert('提示信息','请选中一行数据','warning');
  		            		}
  		            	 }
  		             },
  		             {
  		            	 text:'添加专辑',
  		            	 iconCls:'icon-cd_add',
  		            	 handler:function(){
  		            		 $('#albumInsert').dialog({
  		            			 title:'添加专辑',
  		            			 buttons:[
  		            			          {
  		            			        	  text:'确认提交',
  		            			        	  iconCls:'icon-ok',
  		            			        	  handler:function(){
  		            			        		  $('#albumIn').form('submit',{
  		            			        			  url:'${path}/album/insertAlbum',
  		            			        			  onSubmit:function(){
  		            			        				return $('#albumIn').form('validate');
  		            			        			  },
  		            			        			  success:function(r){
  		            			        				 //关闭窗口 刷新页面
  		            			        				$('#albumIn').form('clear');
  		            			        				 $('#albumInsert').dialog('close');
  		            			        				 $('#treegrid').treegrid('reload');
  		            			        			  }
  		            			        		  })
  		            			        	  }
  		            			          },
  		            			          {
  		            			        	  text:'取消',
  		            			        	  iconCls:'icon-no',
  		            			        	  handler:function(){
  		            			        		  //关闭窗口刷新页面
  		            			        		$('#albumInsert').dialog('close');
  		            			        		$('#treegrid').treegrid('reload')
  		            			        	  }
  		            			          }
  		            			          ]
  		            		 })
  		            	 }
  		             },
  		             {
  		            	 text:'添加音频',
  		            	 iconCls:'icon-cdr_add',
  		            	 handler:function(){
  		            		var chapter = $('#treegrid').datagrid('getChecked');
  		            		$('#albumId').val(chapter[0].id);
  		            		 if(chapter != ""){
  		            			 if(chapter[0].status != undefined){
  		            		 $('#chapterInsert').dialog({
  		            			 title:'添加章节',
  		            			 buttons:[
  		            			          {
  		            			        	  text:'确认添加',
  		            			        	  iconCls:'icon-ok',
  		            			        	  handler:function(){
  		            			        		  $('#chapterIn').form('submit',{
  		            			        			  url:'${path}/chapter/insertChapter',
  		            			        				  onSubmit:function(){
  		            			        				return $('#chapterIn').form('validate');
  		            			        			  },
  		            			        			  success:function(r){
  		            			        				//关闭窗口刷新页面
  		    		            			        	$('#chapterInsert').dialog('close');
  		    		            			        	$('#treegrid').treegrid('reload');
  		    		            			        	$('#chapterIn').form('clear');
  		    		            			        	
  		            			        			  },
  		            			        		  });
  		            			        	  }
  		            			          },
  		            			          {
  		            			        	  text:'取消',
  		            			        	  iconCls:'icon-no',
  		            			        	  handler:function(){
  		            			        		//关闭窗口刷新页面
    		            			        	$('#chapterInsert').dialog('close');
    		            			        	$('#treegrid').treegrid('reload');
  		            			        	  }
  		            			          }
  		            			          ]
  		            		 });
  		            			 }else{
  		            				$.messager.alert('提示信息','请选中文件','warning');
  		            			 }
  		            		 }else{
  		            			$.messager.alert('提示信息','请选中一行数据','warning');
  		            		 }
  		            	 }
  		             },
  		             {
  		            	 text:'下载音频',
  		            	 iconCls:'icon-cdr_eject',
  		            	 handler:function(){
  		            		var chapter = $('#treegrid').datagrid('getChecked');
  		            		if(chapter != ""){
  		            			if(chapter[0].status != undefined){
  		            				$.messager.alert('提示信息','请选文件','warning')
  		            			}else{
  		            				window.location.href = ' ${path}/chapter/download?id='+chapter[0].url+'';
  		            				/* $.ajax({
  		            					url:'${path}/chapter/download',
  		            					type:'POST',
  		            					data:'id='+chapter[0].url,
  		            					success:function(r){
  		            						alert(r);
  		            					},
  		            					error:function(){
  		            						alert('error');
  		            					}
  		            				}) */
  		            			}
  		            		}else{
  		            			$.messager.alert('提示信息','请选中一行数据','warning');
  		            		}
  		            	 }
  		             }
  		             ]
  		});  
  		</script>
  		<!-- 添加专辑  -->
  		<div id="albumInsert" style="display:none;width:250px;height:400px">
  			<form method="POST" id="albumIn" enctype="multipart/form-data">
  				<div  style="margin-top:15px;padding-left: 15px">
  					专辑名:<input name="title" class="easyui-textbox" data-options="required:true," style="width:150px">
  				</div>
  				<div  style="margin-top:15px;padding-left: 15px">
  					推荐度:<input name="score" class="easyui-textbox" data-options="required:true," style="width:150px">
  				</div>
  				<div  style="margin-top:15px;padding-left: 15px">
  					播&nbsp;&nbsp;&nbsp;音:<input name="brodcast" class="easyui-textbox" data-options="required:true," style="width:150px">
  				</div>
  				<div  style="margin-top:15px;padding-left: 15px">
  					作&nbsp;&nbsp;&nbsp;者:<input name="author" class="easyui-textbox" data-options="required:true," style="width:150px">
  				</div>
  				<div  style="margin-top:15px;padding-left: 15px">
  					简&nbsp;&nbsp;&nbsp;介:<input name="brief" class="easyui-textbox" data-options="required:true," style="width:150px">
  				</div>
  				<div  style="margin-top:15px;padding-left: 15px">
  					集&nbsp;&nbsp;&nbsp;数:<input name="count" class="easyui-textbox" data-options="required:true," style="width:150px">
  				</div>
  				<div  style="margin-top:15px;padding-left: 15px">
  					封&nbsp;&nbsp;&nbsp;面:<input name="upFile" class="easyui-filebox" data-options="required:true,buttonIcon:'icon-ok',buttonText:'选择封面'" style="width:150px">
  				</div>
  				<div  style="margin-top:15px;padding-left: 15px">
  					状&nbsp;&nbsp;&nbsp;态:<input name="status" class="easyui-textbox" data-options="required:true," style="width:150px">
  				</div>
  			</form>
  		</div>
  		<!-- 添加章节  -->
  		<div id="chapterInsert" style="display:none;width:250px;height:200px">
  		<form method="POST" id="chapterIn" enctype="multipart/form-data">
  			<div  style="margin-top:15px;padding-left: 15px">
  				章节名:<input name="title" class="easyui-textbox" data-options="required:true," style="width:150px">
  			</div>
  			<div  style="margin-top:15px;padding-left: 15px">
  				地&nbsp;&nbsp;&nbsp;址:<input name="upFile" class="easyui-filebox" data-options="required:true,buttonIcon:'icon-ok',buttonText:'选择音频'" style="width:150px">
  			</div>
  			<input id="albumId" type="hidden" name="albumId" value="">
  		</form>
  		</div>
  </body>
</html>
