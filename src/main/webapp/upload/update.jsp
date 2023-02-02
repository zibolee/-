<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<title>查看</title>

<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/bootstrap.min.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/js/bootstrap.min.js"></script>


	
	<link rel="stylesheet" href="<%=basePath%>res2/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	
	<script type="text/javascript" src="<%=basePath%>res2/validform/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>res2/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript"
	src="<%=basePath%>res2/ztree/js/jquery.ztree.excheck.js"></script>

<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<script type="text/javascript">
		
		$(function() {
			var setting = {
					check: {
						enable: true,
						chkStyle: "checkbox",
						chkboxType: { "Y": "ps", "N": "ps" }
					},
					data: {
						simpleData: {
							enable: true
						}
					}
				};
			
			$.ajax({
				url: "<%=basePath%>ajaxGetModuleIdsByRoleId",
				data:{roleId:${role.roleId}},
				dataType: "json",
				success : function(data) {
					$.fn.zTree.init($("#treeDemo"), setting, data).expandAll(true);
				}
			});
			
		});

       function submitForm() {
			var ids = '';
			var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
			var nodes = treeObj.getCheckedNodes(true);
			for (var i = 0; i < nodes.length; i++) {
				if(ids == '') {
					ids += nodes[i].id;
				} else {
					ids += ","+nodes[i].id;
				}
			}
			
// 		if ($("input[name=roleId]:checked").val()==undefined) {
// 			alert("请选择一个角色！");
// 			return;
// 		}
		
		if (ids=='') {
			alert("请选择模块！");
			return;
		}
			//$("#roleId").val($("input[name=roleId]:checked").val());
			$("#moduleIds").val(ids);
			$("#addForm").submit();
		}
		
// 		function showBack() {
// 			var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
// 			var nodes = treeObj.getCheckedNodes(true);
// 			for (var i=0; i<nodes.length; i++) {
// 				var node = nodes[i];
// 				node.checked = false;
// 				treeObj.updateNode(node);
// 			}
			
// 			var roleId = $("input[name=roleId]:checked").val();
// 			$.ajax({
// 				data:{roleId:roleId},
// 				url: "ajaxGetModuleIdsByRoleId",
// 				dataType: "json",
// 				success: function(data) {
// 					for(var i=0; i<data.length; i++) {
// 						var moduleId = data[i];
// 						var node = treeObj.getNodeByParam("id", moduleId, null);
// 						node.checked = true;
// 						treeObj.updateNode(node);
// 					}
// 				}
// 			});
// 		}
		
	</script>


</head>


<body>
	<div style="padding: 0px; margin: 0px;">
		<ul class="breadcrumb" style="margin: 0px; padding-left: 20px;">
			<li>角色管理</li>
			<li>修改角色</li>
		</ul>
	</div>
	<form method="post" action="<%=basePath%>system/role/updateRoleModuleRelation" class="form-horizontal" id="addForm">
		<h5 class="page-header alert-info"
			style="margin: 0px; padding: 10px; margin-bottom: 10px">角色基本信息</h5>
		<div class="row">
			<div class="col-sm-5">
				<div class="form-group">
					<label class="col-sm-3 control-label">角色编号</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="roleId"
							value="${role.roleId}" readonly />
					</div>
				</div>
			</div>
			<div class="col-sm-5">
				<div class="form-group">
					<label class="col-sm-3 control-label">角色名称</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="roleName"
							value="${role.roleName}" /> <input type="hidden" id="moduleIds"
							name="moduleIds">
					</div>
				</div>
			</div>
		</div>

	</form>

	<div class="col-md-8">
		<div class="page-header">
			<h3>当前菜单目录</h3>
		</div>
		<ul id="treeDemo" class="ztree"></ul>
	</div>

	<div class="row">
		<div class="form-group">
			<div class="col-sm-offset-4 col-sm-10">
				<button type="button" onclick="submitForm()" class="btn btn-default">保存</button>
			</div>
		</div>
	</div>


</body>
</html>
