<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
    <head>
        <title>添加留言信息</title>

        <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
        <meta http-equiv="description" content="this is my page">
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/bootstrap.min.css">
        <script type="text/javascript" src="${pageContext.request.contextPath}/res/js/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/res/js/bootstrap.min.js"></script>
    </head>
    
    <script type="text/javascript">


//         $("#courseId").ready(function () {

//             $("#courseId").blur(function (e) {

//                 var courseId = $("#courseId").val();
//                 if ($.trim($("#courseId").val()).length > 0) {

//                     $.ajax({type: "post", url: "checkCourseId", dataType: "json", data: {"courseId": courseId}, success: function (data) {

//                             if (data != null) {
//                                 alert("该留言编号以被注册,请检查后重新输入留言号");
//                             }
//                         }})
//                 }
//             })
//         })
function createMessage() {
	$.post("${pageContext.request.contextPath}//system/role2/add",
	$("#new_message_form").serialize(),function(data){
	        if(data.msg =="OK"){
	            alert("留言创建成功！");
	            window.location.reload();
	        }else{
	            alert("留言创建失败！");
	            window.location.reload();
	        }
	    });
	}


    </script>
    <body>

        <div style="padding: 0px; margin: 0px;">
            <ul class="breadcrumb" style="margin: 0px; padding-left: 20px;">
                <li>角色管理</li>
                <li>添加角色</li>
            </ul>
        </div>

        <form  method="post" class="form-horizontal" id="new_message_form"> 
            <h5 class="page-header alert-info"
                style="margin: 0px; padding: 10px; margin-bottom: 10px">角色基本信息</h5>
            <div class="row">
                <div class="col-sm-5">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">角色名称</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="roleName"
                                   placeholder="请输入角色名称"  id="roleId"  />
                        </div>
                    </div>
                </div>
               


                <div class="col-sm-5">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">权限列表</label>
                        <div class="col-sm-9">
                            <c:forEach items="${list}" var="module">
         <input type="checkbox" name="moduleId" value="${module.id}"/>${module.name}
</c:forEach>
                        </div>
                    </div>
                </div>
                
               

            </div>


            <div class="row">
                <div class="col-sm-10" align="center">
                    <input type="button" value="添加留言" class="btn btn-success"  onclick="createMessage()"/> 
                    
                    <a
                        href="${pageContext.request.contextPath}/system/role2/list" class="btn btn-danger">返回上一级</a>
                </div>
            </div>
        </form>

    </body>
</html>
