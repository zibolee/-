<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
		$.post("${pageContext.request.contextPath}//system/role2/update",
		$("#update_message_form").serialize(),function(data){
		        if(data.msg =="OK"){
		            alert("角色修改成功！");
		            window.location.reload();
		        }else{
		            alert("角色修改失败！");
		            window.location.reload();
		        }
		    });
		}
	
	</script>
	



</head>

  
  <body>
 <div style="padding: 0px; margin: 0px;">
		<ul class="breadcrumb" style="margin: 0px; padding-left: 20px;">
			<li>角色管理</li>
			<li>修改角色</li>
		</ul>
	</div>
<form  method="post" class="form-horizontal"  id="update_message_form">
		<h5 class="page-header alert-info"
			style="margin: 0px; padding: 10px; margin-bottom: 10px">角色基本信息</h5>
		<div class="row">
		
			
		  <div class="col-sm-5">
				<div class="form-group">
					<label class="col-sm-3 control-label">角色编号</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="roleId"
							value="${role.roleId}"  readonly/>
					</div>
				</div>
			</div>	
			
			
			<div class="col-sm-5">
				<div class="form-group">
					<label class="col-sm-3 control-label">角色名称</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="roleName"
							value="${role.roleName}" />
					</div>
				</div>
			</div>
			
			
			<div class="col-sm-5">
				<div class="form-group">
					<label class="col-sm-3 control-label">权限列表</label>
					<div class="col-sm-9">
						 <c:forEach items="${list1}" var="module">
         <input type="checkbox" name="moduleId" value="${module.id}" 
                  <c:if test="${fn:contains(list2,module)}">
                   checked
                  </c:if>
/>${module.name}
     </c:forEach>
					</div>
				</div>
			</div>


			
			</div>
		<div class="row">
			<div class="col-sm-10" align="center">
				<input type="button" value="确认修改" class="btn btn-success" onclick="updateMessage()"/> <a
					href="${pageContext.request.contextPath}/system/role2/list" class="btn btn-danger">返回上一级</a>
			</div>
		</div>
	</form>
	
  </body>
</html>
