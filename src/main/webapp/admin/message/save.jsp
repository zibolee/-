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



function createMessage() {
	$.post("${pageContext.request.contextPath}/admin/message/save",
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
                <li>留言管理</li>
                <li>添加留言</li>
            </ul>
        </div>

        <form  method="post" class="form-horizontal" id="new_message_form"> 
            <h5 class="page-header alert-info"
                style="margin: 0px; padding: 10px; margin-bottom: 10px">留言基本信息</h5>
            <div class="row">
                <div class="col-sm-5">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">留言编号</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="messageId"
                                   placeholder="请输入留言编号"  id="messageId"  />
                        </div>
                    </div>
                </div>
                <div class="col-sm-5">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">留言名称</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="messageTit"
                                   placeholder="请输入留言名称"   />
                        </div>
                    </div>
                </div>
                <div class="col-sm-5">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">留言时间</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="messageDate"
                                   placeholder="请输入时间"   />
                        </div>
                    </div>
                </div>

                <div class="col-sm-5">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">留言内容</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="messageContent"
                                   placeholder="请输入留言内容"   />
                        </div>
                    </div>
                </div>


                <div class="col-sm-5">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">留言类别</label>
                        <div class="col-sm-5">
                            <select  class="form-control" id="messageKindId" name="messagekindId" >
                            <c:forEach items="${list}" var ="ck" >
								<option value="${ck.messagekindId}">${ck.messagekindName}</option>
							</c:forEach>
                             
                            </select>
                        </div>
                    </div>
                </div>
                
                <div class="col-sm-5">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">附加说明</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="messageReply"
                                   placeholder="请输入留言附加说明"   />
                        </div>
                    </div>
                </div>


            </div>


            <div class="row">
                <div class="col-sm-10" align="center">
                    <input type="button" value="添加留言" class="btn btn-success"  onclick="createMessage()"/> 
                    
                    <a
                        href="${pageContext.request.contextPath}/admin/message/listByPage" class="btn btn-danger">返回上一级</a>
                </div>
            </div>
        </form>

    </body>
</html>
