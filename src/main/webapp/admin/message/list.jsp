<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<title>留言信息列表</title>

<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/res/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function checkAll() {
		var d = $("input:checkbox[name='ck']");
		$.each(d, function(i, n) {
			//$(o).attr("checked", "true");
			n.checked = !n.checked;
		})
	}

	function updateMessage() {
		var ck = document.getElementsByName("ck");
		var s = 0;
		var v = "";
		for (var i = 0; i < ck.length; i++) {
			if (ck[i].checked) {
				v = ck[i].value;
				s++;
			}
		}
		if (s != 1) {
			alert("每次只能修改一个，请重新选择");
		} else {
			console.info(v);
			window.location.href = "${pageContext.request.contextPath}/admin/message/toUpdate?messageId="
					+ v;
		}
	}

	function deleteMessage() {
		var ck = document.getElementsByName("ck");
		var tr = $("input:checked").parent().parent();
		var s = "";
		for (var i = 0; i < ck.length; i++) {
			if (ck[i].checked) {
				s += ck[i].value + ",";
			}
		}
		console.info(s);
		if (s == "") {
			alert("请至少选择一个被删除的留言");
			return;
		}
		if (confirm('确实要删除该留言吗?')) {
			$
					.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/admin/message/deleteBatch",
						dataType : "json",
						data : {
							"messageIds" : s
						},
						success : function(data) {

							if (data.msg == "OK") {
								alert("留言删除成功！");
								tr.remove();
								//window.location.reload();
							} else {
								alert("删除留言失败！");
								//window.location.reload();
							}
						}
					});
		}
	}
</script>

</head>

<body>
	<div style="padding: 0px; margin: 0px;">
		<ul class="breadcrumb" style="margin: 0px; padding-left: 20px;">

			<li>留言管理</li>
			<li>显示留言信息</li>

		</ul>
	</div>
		<form
		action="${pageContext.request.contextPath}/admin/message/listByPage"
		method="post" id="f1" class="form-inline">
		<div class="row alert alert-info form-inline"
			style="margin: 0px; padding: 5px;">
			<div class="form-group">
				<label>留言号</label> <input type="text" class="form-control"
					name="messageId" placeholder="请输入留言编号" />
			</div>
			<input type="submit" value="查询留言" class="btn btn-success" />
			
			<shiro:hasPermission name="message:add">
			<a href="${pageContext.request.contextPath}/admin/message/toSave"
			class="btn btn-info">添加留言</a> 
			</shiro:hasPermission>
			
			<shiro:hasPermission name="message:update">
			<input type="button" id="upd" value="修改留言" class="btn btn-info" 
			onclick="updateMessage()" /> 
			</shiro:hasPermission>
			
			<shiro:hasPermission name="message:delete">
			<input type="button" id="del" value="删除留言" class="btn btn-danger"
			onclick="deleteMessage()" /> 
			</shiro:hasPermission>
			
			<shiro:hasPermission name="message:import">
			<a href="${pageContext.request.contextPath}/admin/message/toUpload"
			class="btn btn-info">导入留言</a>
			</shiro:hasPermission>
			
			<a href="${pageContext.request.contextPath}/admin/message/exportFile"
			class="btn btn-info">导出留言</a>

		</div>
	</form>
	<div class="row" style="padding: 15px;">
		<table class="table ">
			<tr>
				<th><input type="checkbox" onclick="checkAll()" /></th>
				<th>留言编号</th>
				<th>留言主题</th>
				<th>留言內容</th>
				<th>留言时间</th>
				<th>回复内容</th>
				<th>留言类别</th>
				<th>审核会员</th>
			</tr>

			<c:forEach items="${pageInfo.list}" var="message" varStatus="v">
				<tr>
					<td><input type="checkbox" id="ids" class="bianhao" name="ck"
						value="${message.messageId}"></td>

					<td>${message.messageId }</td>
					<td>${message.messageTit}</td>
					<td>${message.messageContent}</td>
					<td>${message.messageDate}</td>
					<td>${message.messageReply}</td>
                    <td>${message.messageKind.messagekindName}</td> 
                    <td>${message.messageKind.member.memberName}</td> 
                    


				</tr>

			</c:forEach>
		</table>
		<nav class="navbar navbar-default navbar-fixed-bottom">
			<ul class="pagination">
				<li><a
					href="?Id=${messageId}&pageNum=${pageInfo.pageNum-1 }"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				<c:forEach var="i" begin="1" end="${pageInfo.pages}" step="1">
					<li><a
						href="?Id=${messageId}&pageNum=${i}">${i}</a></li>
				</c:forEach>
				<li><a
					href="?Id=${messageId}&pageNum=${pageInfo.pageNum+1 }"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
	</div>
</body>
</html>
