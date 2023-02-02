<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
  <head>
    <title>查看</title>
	
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/bootstrap.min.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/res/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/res/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	function updateMessage() {
		$.post("${pageContext.request.contextPath}/admin/message/update",
		$("#update_message_form").serialize(),function(data){
		        if(data.msg =="OK"){
		            alert("留言修改成功！");
		            window.location.reload();
		        }else{
		            alert("留言修改失败！");
		            window.location.reload();
		        }
		    });
		}
	
	</script>
	



</head>

  
  <body>
 <div style="padding: 0px; margin: 0px;">
		<ul class="breadcrumb" style="margin: 0px; padding-left: 20px;">
			<li>留言管理</li>
			<li>修改留言</li>
		</ul>
	</div>
<form  method="post" class="form-horizontal"  id="update_message_form">
		<h5 class="page-header alert-info"
			style="margin: 0px; padding: 10px; margin-bottom: 10px">留言基本信息</h5>
		<div class="row">
		<div class="col-sm-5">
				<div class="form-group">
					<label class="col-sm-3 control-label">编号</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="messageId"
						readonly="true"	 value="${message.messageId}"/>
					</div>
				</div>
			</div>
			<div class="col-sm-5">
				<div class="form-group">
					<label class="col-sm-3 control-label">名称</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="messageTit"
							value="${message.messageTit}" />
					</div>
				</div>
			</div>
			<div class="col-sm-5">
				<div class="form-group">
					<label class="col-sm-3 control-label">时间</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="messageDate"
							value="${message.messageDate}" />
					</div>
				</div>
			</div>
			<div class="col-sm-5">
				<div class="form-group">
					<label class="col-sm-3 control-label">内容</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="messageContent"
							value="${message.messageContent}"  />

					</div>
				</div>
			</div>

			<div class="col-sm-5">
				<div class="form-group">
					<label class="col-sm-3 control-label">类别</label>
					<div class="col-sm-5">
						<select  class="form-control" id="rol" name="messagekindId" >
							<c:forEach items="${list}" var ="ck" >
								<option value="${ck.messagekindId}" <c:if test="${ck.messagekindId == message.messagekindId}"> selected</c:if>>${ck.messagekindName}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			
			<div class="col-sm-5">
				<div class="form-group">
					<label class="col-sm-3 control-label">回复信息</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="messageReply"
							value="${message.messageReply}" />
					</div>
				</div>
			</div>


			
			</div>
		<div class="row">
			<div class="col-sm-10" align="center">
				<input type="button" value="确认修改" class="btn btn-success" onclick="updateMessage()"/> <a
					href="${pageContext.request.contextPath}/admin/message/listByPage" class="btn btn-danger">返回上一级</a>
			</div>
		</div>
	</form>
	
  </body>
</html>
