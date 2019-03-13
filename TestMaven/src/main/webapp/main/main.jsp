<%@ page language="java" pageEncoding="UTF-8"%>
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
	<script src="${path }/js/echarts.min.js"></script> 
	<script type="text/javascript" src="${path}/js/jquery.easyui.min.js"></script>  
	<script type="text/javascript" src="${path}/js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${path}/js/datagrid-detailview.js"></script>
	<script type="text/javascript" src="http://cdn-hangzhou.goeasy.io/goeasy.js"></script>
	<script type="text/javascript" src="https://www.echartsjs.com/gallery/vendors/echarts/map/js/china.js?_v_=1548453451319"></script>  
  </head>
  
  <body class="easyui-layout">
    	<div data-options="region:'north',split:true" style="height:10%;background-color:  #5C160C">
    		<div style="font-size: 24px;color: #FAF7F7;font-family: 楷体;font-weight: 900;width: 500px;float:left;padding-left: 20px;padding-top: 10px" >持名法州后台管理系统</div>
    		<div style="font-size: 12px;color: #FAF7F7;font-family: 楷体;width: 300px;float:right;padding-top:15px">欢迎您:${sessionScope.username} &nbsp;<a id="buttonPassword" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改密码</a>&nbsp;&nbsp;<a href="${path }/admin/end" class="easyui-linkbutton" data-options="iconCls:'icon-01'">退出系统</a></div>
    	</div>   
    	<div data-options="region:'south',split:true" style="height:10%;background-color:  #5C160C"">
    		<div style="text-align: center;font-size:15px; color: #FAF7F7;font-family: 楷体" >&copy;百知教育 htf@zparkhr.com.cn</div>
    	</div>   
    	<div id='west' class="easyui-accordion" data-options="region:'west',title:'菜单导航',split:true" style="width:15%;">
    		
    	</div>   
   		<div data-options="region:'center',">
   			<div id="tabs" class="easyui-tabs" data-options="fit:true,narrow:true,pill:true">
   				<div title='主页' data-options="iconCls:'icon-neighbourhood'," style="background-image: url(image/shouye.jpg);background-repeat: no-repeat;background-size:100% 100%"></div>
   			</div>
   		</div> 
   	
   	<script type="text/javascript">
   		$(function(){
   			//登录
   			
   			$.ajax({
   				url:'${path}/meun/queryAll',
   				type:'POST',
   				dataType:'json',
   				success:function(r){
   					for(var i=0;i<r.length;i++){
   						if(r[i].parentId==0){
   							//二级页面
   							var html ='';
   							for(var j=0;j<r[i].list.length;j++){
   								html+='<div style="padding-left: 50px;"><a class="easyui-linkbutton"  href="#" onclick=\'addTap("'+r[i].list[j].title+'","'+r[i].list[j].href+'","'+r[i].list[j].iconCls+'")\' data-options="width:100,iconCls:\''+r[i].list[j].iconCls+'\'" >'+r[i].list[j].title+'</a></div></br>';
   							}
   							//一级页面
							$('#west').accordion('add', {
								id:r[i].id,
								title: r[i].title,
								iconCls:r[i].iconCls,
	   							selected:false,
	   							content:html,
							});
   						}
   					}
   					
   				},
   				error:function(){
   						alert("error")	;
   				}
   			});
   			//修改密码
   			$("#buttonPassword").linkbutton({
   				onClick:function(){
   					$("#updatePassword").dialog({
   						title:'修改密码',
   						buttons:[
   						        {
   						        	text:'确认提交',
   						        	iconCls:'icon-ok',
   						        	handler:function(){
   						        		$("#updataForm").form('submit',{
   						        			url:'${path}/admin/updatePassword',
   						        			onSubmit:function(){
   						        				return $('#updataForm').form('validate');
   						        			},
   						        			success:function(){
   						        				$("#updatePassword").dialog('close');	
   						        			$.messager.alert('提示信息','密码修改成功,请返回页面重新登录','info',function(){window.location.href = ' ${path}/login.jsp';});
   						        			
   						        			}
   						        		})
   						        	}
   						        },
   						        {
   						        	text:'取消',
   						        	iconCls:'icon-no',
   						        	handler:function(){
   						        		$("#updatePassword").dialog('close');
   						        	}
   						        }
   						        ]
   					})
   				}
   			});
   			//确认原密码是否正确
   			 $("#updatapwd1").textbox({
   				onChange:function(newvalue,oldvalue){
   					$.ajax({
   						url:'${path}/admin/selectPassword',
   						type:'POST',
   						data:"username="+'${sessionScope.username}'+"&password="+newvalue,
   						success:function(r){
   							if(r == "ok"){
   							 $("#updatapwd3").html("");
   							}else{
   							 $("#updatapwd1").textbox('clear');
   							 $("#updatapwd3").html("密码错误");
   							}
   						},
   						error:function(){
   							alert("error");
   						}
   					})
   				}
   			}); 
   		});
   		function addTap(title,href,iconCls){
				var falg = $('#tabs').tabs('exists',title);
				if(falg){
					$('#tabs').tabs('select',title);
				}else{
					$('#tabs').tabs('add',{
						title:title,
						iconCls:iconCls,
						href:href,
			  			closable:true,
					});
				}
			}
   	//添加函数功能封装
		function addTaps(options){
			if(!$('#tabs').tabs('exists',options.title)){
				$('#tabs').tabs('add',options);
			}else{
				$('#tabs').tabs('select',options.title);
			}
		}
   	</script>  
   	<div id="updatePassword" style="display: none;width:300px;height:160px">
   		<form method="POST" id="updataForm">
   		<div style="margin-top:15px;padding-left: 17px">
   			原密码:<input class="easyui-textbox" id="updatapwd1" name="usernameaa" data-options="required:true" >
   			<span id="updatapwd3" style="color: red"></span>
   		</div>
   		<div style="margin-top:10px;padding-left: 17px">
   			现密码:<input class="easyui-textbox" id="updatapwd1" name="password" data-options="required:true" >
   				<input type="hidden" name="username" value="${sessionScope.username}">
   		</div>
   		</form>
   	</div>
  </body>
</html>
