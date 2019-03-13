<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<!DOCTYPE>
<%pageContext.setAttribute("path", request.getContextPath());%>
<head>
	<title>持名法州后台管理中心</title>
	
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <style type="text/css">
			.erro{
				color: red;
			}
			.ok{}
			.over{
				color: green;
			}
			
		</style>
	<link rel="icon" href="${path }/img/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" href="${path }/css/common.css" type="text/css"></link>
	<link rel="stylesheet" href="${path }/css/login.css" type="text/css"></link>
	<script type="text/javascript" src="${path }/script/jquery.js"></script>
	<script type="text/javascript" src="${path }/script/common.js"></script>
	<link type="text/css" rel="stylesheet" href="${path}/themes/default/easyui.css">
	<link type="text/css" rel="stylesheet" href="${path}/themes/IconExtension.css">
	<link type="text/css" rel="stylesheet" href="${path}/themes/icon.css">
	<script type="text/javascript" src="${path}/js/jquery.min.js"></script>   
	<script type="text/javascript" src="${path}/js/jquery.easyui.min.js"></script>  
	<script type="text/javascript" src="${path}/js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">
		$(function(){
			//点击更换验证码：
			$("#captchaImage").click(function(){//点击更换验证码
				$("#captchaImage").prop('src','${path}/ca/captcha?time='+new Date().getTime());
			});
			// form 表单提交
			$("#loginForm").form({
				url:'${path}/admin/login',
				onSubmit:function(){

				},
				success:function(data){
				    var data = JSON.parse(data);
                    if(data.status == '300'){
                        $("#message").empty();
                        $("#message").append('<font color=red>用户名错误</font>');
                    }else if(data.status == '400'){
                        $("#message").empty();
                        $("#message").append('<font color=red>密码错误</font>');
                    }else{
                        location.href='${pageContext.request.contextPath}/main/main.jsp';
                    }
                },
			})


			//账号
			$("#use").textbox({
				validType:['email','length[0,20]'],
				required:true,
				prompt:'请输入账号',

			});
			//异步请求验证码
/*			$('#enCode').textbox({
				validType:['null','length[4,5]'],
				onChange:function(newvalue,oldvalue){
					if($("#enCode").textbox('isValid')){
					$.ajax({
						//url:'${path}/admin/captcha',
						type:'POST',
						success:function(r){
							var ca = r.trim();
							if($('#enCode').val() != ca){
								//清空
								$('#enCode').textbox('clear');
								$("#c").html("您输入的验证码有误");
							}else{
								$("#c").html("");
							}
						},
						error:function(){
							alert('error');
						},
					})
				}else{
					$("#c").html("");
				}
				}
			});*/

			/* $("form").submit(function(){
				$("input").trigger("blur");
				if($(".erro").length>1){return false;}
			}); */

		});
	</script>
</head>
<body>
		
		<div class="login">
			<form id="loginForm" action="${path}/admin/login" method="post" >
				
				<table>
				
					<tbody>
						<tr>
							<td width="190" rowspan="2" align="center" valign="bottom">
								<img src="${path }/img/header_logo.gif" />
							</td>
							<th>
								用户名:
							</th>
							<td>
								<input id="use" name="username" class="easyui-textbox" maxlength="20"/><span style="color: red"></span>
							</td>
					  </tr>
					  <tr>
							<th>
								密&nbsp;&nbsp;&nbsp;码:
							</th>
							<td>
								<input type="password" name="password" class="easyui-textbox" data-options="prompt:'请输入密码',required:true" autocomplete="off"/>
							</td>
					  </tr>
					
						<tr>
							<td>&nbsp;</td>
							<th>验证码:</th>
							<td>
								<input type="text" id="enCode" name="enCode" class="easyui-textbox" maxlength="4" autocomplete="off" data-options="prompt:'验证码',required:true,validType:['null','length[4,5]']" style="width: 80px"/>
							<%--	<img id="captchaImage" class="captchaImage" src="${path }/ca/captcha" title="点击更换验证码"/><br>--%>
								
							<span id="c" style="font-size: 12px; padding-top: 10px;color: red"></span>
							</td>
						</tr>					
					<tr>
						<td>
							&nbsp;
						</td>
						<th>
							&nbsp;
						</th>
						<td><span id="message"></span></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<th>&nbsp;</th>
						<td>
							<input type="button" class="homeButton" value="" onclick="location.href='${path}/addAdmin.jsp'"><input type="submit" class="loginButton" value="登录">
					</tr>
				</tbody></table>
				<div class="powered">COPYRIGHT © 2008-2017.</div>
				<div class="link">
					<a href="http://www.chimingfowang.com/">持名佛网首页</a> |
					<a href="http://www.chimingbbs.com/">交流论坛</a> |
					<a href="">关于我们</a> |
					<a href="">联系我们</a> |
					<a href="">授权查询</a>
				</div>
			</form>
		</div>
</body>
</html>