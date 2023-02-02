<%-- 
    Document   : main
    Created on : 2015-11-15, 10:15:22
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title></title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/add.css"
	type="text/css" media="screen" />

<script type="text/javascript" src="${pageContext.request.contextPath}/res/js/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/bootstrap.min.css">
<script type="text/javascript">

$(document).ready(function(){
	$("#btn").click(function(){
		var username=$("#username").val();
		var password=$("#password").val();
		var code=$("#code").val();
		$.ajax({
			url:"${pageContext.request.contextPath}/system/user/login",
			type:"post",
			data:{"username":username,"password":password,"code":code},
			dataType:"json",
			success:function(data){
				if(data!=null){
					/* alert("欢迎登陆！！！"+"${pageContext.request.contextPath}/"+data.msg); */
					console.log(data);
					window.location.href = "${pageContext.request.contextPath}/"+data.msg;
					window.event.returnValue=false;
				}
			}
		});
	});
});
</script>

</head>
<body>
	<div class="jumbotron">


		<div class="div_from_aoto" style="width: 500px;">
			<h3>欢迎使用留言管理系统</h3>

			<FORM >
				<DIV class="control-group">
					<label class="laber_from">用户名</label>
					<DIV class="controls">
						<INPUT class="input_from" type=text id="username" name="username">
						<P class=help-block></P>
					</DIV>
				</DIV>
				<DIV class="control-group">
					<LABEL class="laber_from">密码</LABEL>
					<DIV class="controls">
						<INPUT class="input_from" type=password id="password" name="password">${msg}
						<P class=help-block></P>
					</DIV>
				</DIV>
				
				<DIV class="control-group">
					<LABEL class="laber_from">验证码</LABEL>
					<DIV class="controls">
						<INPUT class="input_from" type=text id="code" name="code"><img src="${pageContext.request.contextPath}/system/user/getImage" alt="">
						<P class=help-block></P>
					</DIV>
				</DIV>


				<DIV class="control-group">
					<LABEL class="laber_from"></LABEL>
					<button class="btn btn-lg btn-primary " id="btn">登 陆</button>
				</DIV>
			</FORM>
		</div>
	</div>
</body>
</html>
