<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<%pageContext.setAttribute("path", request.getContextPath());%>
<head>
	<title>持名法州后台管理中心</title>
	
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    
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
			// form 表单提交
            $("#loginForm").form({
				url:'${path}/admin/insert',
				onSubmit:function(){
				},
				success:function (data) {
	alert("sas")
                    location.href='${path}/login.jsp';
                },
			})
			//点击更换验证码：
			$("#captchaImage").click(function(){//点击更换验证码
				$("#captchaImage").prop('src','${path}/ca/captcha?time='+new Date().getTime());
			});
			$('#adduse').textbox({
				validType:['email','length[0,20]'],
				required:true,
				prompt:'请输入账号',
/*				onChange:function(newvalue,oldvalue){
					if($("#adduse").textbox('isValid')){
					$.ajax({
						url:'${path}/admin/judge',
						type:'POST',
						data:"username="+newvalue,
						success:function(r){
							if(r != "ok"){
								$('#adduse').textbox('clear');
								$("#addu").html("该邮箱已存在");
							}else{
								$("#addu").html("");
							}
						},
						error:function(){
							alert('error')
						}
					})
				  }
				}*/
			});
			//异步请求验证码
			$('#enCode').textbox({
				validType:['null','length[4,5]'],
				onChange:function(newvalue,oldvalue){
					if($("#enCode").textbox('isValid')){
					$.ajax({
						url:'${path}/admin/captcha',
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
							alert('error')
						},
					})
				}else{
					$("#c").html("");
				}
				}
			}); 
		});
	</script>
</head>
<body>
		
		<div class="login">
			<form id="loginForm" action="${path}/admin/insertAdmin" method="post" >
				
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
								<input id="adduse" name="username" class="easyui-textbox" data-options="prompt:'请输入密码',required:true" maxlength="20"/><span id="addu" style="color: red;font-size: 8px"></span>
							</td>
					  </tr>
					  <tr>
							<th>
								密&nbsp;&nbsp;&nbsp;码:
							</th>
							<td>
								<input name="password" class="easyui-textbox" data-options="prompt:'请输入密码',required:true" />
							</td>
					  </tr>
					
						<tr>
							<td>&nbsp;</td>
							<th>验证码:</th>
							<td>
								<input type="text" id="enCode" name="enCode" class="easyui-textbox" maxlength="4" autocomplete="off" data-options="prompt:'验证码',required:true,validType:['null','length[4,5]']" style="width: 80px"/>
								<img id="captchaImage" class="captchaImage" src="${path }/ca/captcha" title="点击更换验证码"/><br/>
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
					</tr>
					<tr>
						<td>&nbsp;</td>
						<th>&nbsp;</th>
						<td>
							<input type="button" class="homeButton" value="" onclick="location.href='${path}/login.jsp'"><input type="submit" class="loginButton" value="注册">
						</td>
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