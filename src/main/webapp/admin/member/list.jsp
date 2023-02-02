<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>留言分类页面</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/res/js2/layui-2.5.4/css/layui.css">
  <script src="${pageContext.request.contextPath}/res/js2/layui-2.5.4/layui.js"></script>
</head>

<body style="padding: 20px;">
  <!-- 页面结构 -->
  <div class="layui-main">
 <script type="text/html" id="toolbarDemo">
  <button class="layui-btn layui-btn-sm" id="add-data-btn" lay-event="add">添加</button>
</script>                          
					
</div>
    <!-- 留言分类表 -->
    <table id="data-tbl" lay-filter="data-tbl"></table>
    <script type="text/html" id="data-tbl-toolbar">
      <a class="layui-btn layui-btn-xs" lay-event="updatedata">编辑</a>
      <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="deletedata">删除</a>
    </script>
  
  
  <!-- 添加留言分类弹出层 -->
  <div id="add-data-layer" style="display: none; padding: 20px">
    <form id="add-data-form" class="layui-form layui-form-pane">
      <div class="layui-form-item">
        <label class="layui-form-label">分类编号</label>
        <div class="layui-input-block">
          <input type="text" name="memberId" class="layui-input" value="99" lay-verify="required" autocomplete="off">
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label">分类名称</label>
        <div class="layui-input-block">
          <input type="text" name="memberName" class="layui-input" value="数学" lay-verify="required">
        </div>
      </div>
      
      
      <div class="layui-form-item">
        <div class="layui-input-block">
          <button class="layui-btn" lay-submit lay-filter="add-data-form-submit">提交</button>
          <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
      </div>
    </form>
  </div>
  
  <!-- 更新留言分类弹出层 -->
  <div id="update-data-layer" style="display: none; padding: 20px">
    <form id="update-data-form" class="layui-form layui-form-pane" lay-filter="update-data-form">
       <div class="layui-form-item">
        <label class="layui-form-label">分类编号</label>
        <div class="layui-input-block">
          <input type="text" name="memberId" class="layui-input" lay-verify="required" autocomplete="off">
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label">分类名称</label>
        <div class="layui-input-block">
          <input type="text" name="memberName" class="layui-input" lay-verify="required">
        </div>
      </div>
     
     
      <div class="layui-form-item">
        <div class="layui-input-block">
          <button class="layui-btn" lay-submit lay-filter="update-data-form-submit">提交</button>
          <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
      </div>
    </form>
  </div>
  
  <!-- 页面JS -->
  <script>
    layui.use(['jquery', 'table', 'layer', 'form'], function() {
      // 加载layui模块，使用其推荐的【预先加载】方式，详见官网【模块规范】一节
      var $ = layui.$;
      var table = layui.table;
      var layer = layui.layer;
      var form = layui.form;
     
      
      
      // 显示所有留言分类
      table.render({
        elem: '#data-tbl',
        url: '${pageContext.request.contextPath}/admin/member/listByPage',
        method: 'get',
        cols: [[
        	
          {field: 'memberId', title: '分类编号'},
          {field: 'memberName', title: '分类名称'},
                  //{templet:'{d.member.messagekindName}', title: '类别'},
          {toolbar: '#data-tbl-toolbar', title: '操作'}
        ]],
        page: true, //是否显示分页
        limits: [5, 10, 15], //显示
        limit: 5, //每页默认显示的数量
        // 表格容器id，用于表格重载
        id: 'data-tbl1212'
        ,toolbar: '#toolbarDemo'
      });
      
   
   
  	table.on('toolbar(data-tbl)', function(obj){
  	   
  	  var event = obj.event;
  	  if(event==='add'){
  	    	$('#add-data-form')[0].reset();
  	        layer.open({
  	          type: 1,
  	          title: '添加留言分类',
  	          skin: 'layui-layer-molv',
  	          area: ['500px'],
  	          content: $('#add-data-layer')
  	        });
  	    };
  	  });
      // 添加留言分类表单提交
      form.on('submit(add-data-form-submit)', function(data) {
        // ajax方式添加留言分类
        $.ajax({
          url: "${pageContext.request.contextPath}/admin/member/save",
          type: "POST",
          data: JSON.stringify(data.field),//将表单数据转换为json格式,控制器硬
          contentType: 'application/json',
          dataType: 'json',
          success: function(data) {
            if (data.code == 1) {
              layer.close(layer.index);
              layer.msg('添加成功');
              table.reload('data-tbl1212');
            } else {
              layer.msg('添加失败');
            }
          },
          error: function() {
            console.log("ajax error");
          }
        });
        // 阻止表单跳转
        return false;
      });
      
      // 监听行工具栏事件：删除留言分类与更新留言分类
      table.on('tool(data-tbl)', function(obj) {
        // 获取当前行数据和lay-event的值
        var data = obj.data;
        var event = obj.event;
        
        // 删除留言分类事件
        if (event === 'deletedata') {
          layer.confirm('确定删除该留言分类吗？', function(index) {
            // ajax方式删除留言分类
            $.ajax({
              url: '${pageContext.request.contextPath}/admin/member/delete',
              type: "POST",
              dataType: 'json',
              data:{memberId:data.memberId},
              success: function(data) {
                if (data.code == 1) {
                  layer.msg('删除成功');
                  table.reload('data-tbl1212');
                } else {
                  layer.msg('删除失败');
                }
              },
              error: function() {
                console.log("ajax error");
              }
            });
            layer.close(index);
          });
        }
        
        // 更新留言分类事件
        if (event === 'updatedata') {
          // 每次显示更新留言分类的表单前自动为表单填写该行的数据
          form.val('update-data-form', {
            "memberId": data.memberId,
            "memberName": data.memberName,
           
           
          });
        
          layer.open({
            type: 1,
            title: '更新留言分类',
            skin: 'layui-layer-molv',
            area: ['500px'],
            content: $('#update-data-layer')
          });
          // 更新留言分类表单提交
          form.on('submit(update-data-form-submit)', function(data) {
            // ajax方式更新留言分类
            $.ajax({
              url: "${pageContext.request.contextPath}/admin/member/update",
              type: "POST",
              data: JSON.stringify(data.field),
              contentType: 'application/json',
              dataType: 'json',
              success: function(data) {
                if (data.code == 1) {
                  layer.close(layer.index);
                  layer.msg('更新成功');
                  table.reload('data-tbl1212');
                } else {
                  layer.msg('更新失败');
                }
              },
              error: function() {
                console.log("ajax error");
              }
            });
            // 阻止表单跳转
            return false;
          });
        }
      });
     
    });
    
  </script>
</body>

</html>