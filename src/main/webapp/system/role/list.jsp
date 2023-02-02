
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>
    <head>
        <title>课程信息列表</title>

        <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
        <meta http-equiv="description" content="this is my page">
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/bootstrap.min.css">
        <script type="text/javascript" src="${pageContext.request.contextPath}/res/js/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/res/js/bootstrap.min.js"></script>
       

    </head>

    <body>
        <div style="padding: 0px; margin: 0px;">
            <ul class="breadcrumb" style="margin: 0px; padding-left: 20px;">
                <li>管理</li>
                <li>角色管理</li>

            </ul>
        </div>
        <a
				href="${pageContext.request.contextPath}/system/role/toAdd"
				class="btn btn-success">添加角色</a>
        
        <div class="row" style="padding: 15px;">
            <table class="table ">
                <tr>
                   
                    <th>角色编号</th>
                    <th>角色名称</th>
                    <th colspan="2"></th>
                   
                </tr>

                <c:forEach items="${list}" var ="role" varStatus="v">
                    <tr>
                        <td>${role.roleId}</td>
                        <td>${role.roleName}</td>
                         <td>
                    <a href="${pageContext.request.contextPath}/system/role/toUpdate?roleId=${role.roleId}">更新</a>  
                </td>
                 <td>
                    <a href="${pageContext.request.contextPath}/system/role/delete?roleId=${role.roleId}">删除</a>  
                </td>
                       
                    </tr>
                </c:forEach>
            </table>
           
        </div>
    </body>
</html>
