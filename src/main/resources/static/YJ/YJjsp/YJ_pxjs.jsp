<%@ page language="java" isELIgnored="false"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
<script src="${pageContext.request.contextPath }/js/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath }/layui/layui.js" charset="utf-8"></script>

</head>
<body style="background-color:white; height:700px">
<button type="button" onclick="onAddBtn()" style="margin-right: 50px" class="layui-btn layui-btn-normal"  >
    	新增
    </button>	
<div id="add-main" style="display: none;">
          <form class="layui-form" id="add-form" method="post" action="${pageContext.request.contextPath }/insertpxjs.do">
    			 <div class="layui-form-item center" >
                    <label class="layui-form-label" style="width: 100px" >讲师名称</label>
                    <div class="layui-input-block">
                      <input type="text" name="lecturer_name"    style="width: 240px"   placeholder="请输入配置名称" autocomplete="off" class="layui-input">
                    </div>
                  </div>
                  <div class="layui-form-item">
                    <label class="layui-form-label" style="width: 100px">讲师头衔</label>
                    <div class="layui-input-block">
                      <input type="text" name="lecturer_title"    style="width: 240px"  placeholder="请输入配置类型" autocomplete="off" class="layui-input">
                    </div>
                  </div>
                  <div class="layui-form-item">
                    <label class="layui-form-label" style="width: 100px">联系方式&emsp;</label>
                    <div class="layui-input-block">
                      <input type="text" name="lecturer_phone"    style="width: 240px"  placeholder="请输入配置值" autocomplete="off" class="layui-input">
                      <!-- <input type="hidden" name="id" style="width: 240px" autocomplete="off" class="layui-input"> -->
                    </div>
                  </div>
                  <div class="layui-form-item">
                    <div class="layui-input-block">
                      <button class="layui-btn" lay-submit lay-filter="save"  >立即提交</button>
                      <button type="reset" class="layui-btn layui-btn-primary" id="closeBtn" >重置</button>
                    </div>
                  </div> 
           </form>
        </div>
 
<div id="update-main" style="display: none;">
              <form class="layui-form" id="add-form" method="post"  action="${pageContext.request.contextPath }/updatepxjs.do" >
                 <div class="layui-form-item center" style="display: none" >
                    <label class="layui-form-label" style="width: 100px" >讲师id</label>
                    <div class="layui-input-block">
                      <input type="text" name="lecturer_id" id="lecturer_id"   style="width: 240px"   placeholder="请输入配置名称" autocomplete="off" class="layui-input">
                    </div>
                  </div>
                  <div class="layui-form-item center" >
                    <label class="layui-form-label" style="width: 100px" >讲师名称</label>
                    <div class="layui-input-block">
                      <input type="text" name="lecturer_name" id="lecturer_name"   style="width: 240px"   placeholder="请输入配置名称" autocomplete="off" class="layui-input">
                    </div>
                  </div>
                  <div class="layui-form-item">
                    <label class="layui-form-label" style="width: 100px">讲师头衔</label>
                    <div class="layui-input-block">
                      <input type="text" name="lecturer_title" id="lecturer_title"   style="width: 240px"  placeholder="请输入配置类型" autocomplete="off" class="layui-input">
                    </div>
                  </div>
                  <div class="layui-form-item">
                    <label class="layui-form-label" style="width: 100px">联系方式&emsp;</label>
                    <div class="layui-input-block">
                      <input type="text" name="lecturer_phone" id="lecturer_phone"   style="width: 240px"  placeholder="请输入配置值" autocomplete="off" class="layui-input">
                      <!-- <input type="hidden" name="id" style="width: 240px" autocomplete="off" class="layui-input"> -->
                    </div>
                  </div>
                  <div class="layui-form-item">
                    <div class="layui-input-block">
                      <button class="layui-btn" lay-submit lay-filter="save"  >立即提交</button>
                      <button type="reset" class="layui-btn layui-btn-primary" id="closeBtn" >重置</button>
                    </div>
                  </div> 
              </form>    
        </div>



	<table class="layui-hide" id="test" lay-filter="test" lay-data="{id: 'idTest'}" ></table>
		 
	<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="detail">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
   </script>
	<!-- <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">考勤记录</a> -->

<script type="text/javascript">
function onAddBtn(){
    //页面层-自定义
   layer.open({
           type: 1,
           title:"新增讲师",
           closeBtn: false,
           shift: 2,
           area: ['400px', '300px'],
           shadeClose: true,
          // btn: ['新增', '取消'],
          // btnAlign: 'c',
           content: $("#add-main"),
           success: function(layero, index){},
           end:function(){
			  	window.location.reload();
			  }
       });
} 
</script>


<script type="text/javascript"	>
 layui.use(['table','form','laydate','laytpl','layer'], function(){
	 var table = layui.table
		,laydate = layui.laydate
		,form = layui.form
		,laypage=layui.laypage;

	      
	 
	 
	 var tbl= table.render({
		 title:false,
		  elem: '#test',
			  method : "post"
			    ,url:'${pageContext.request.contextPath }/allpxjs.do'
			    ,limits : [ 5, 10, 15, 20 ]
				,limit : 10
			    ,page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
			    	prev : '上一页',
					next : '下一页',
					first: false //不显示首页
			      ,last: false //不显示尾页
			    }
			    ,height: 660
			  ,parseData : function(res) { //res 即为原始返回的数据
			
					return {
						"code" : res["code"], //解析接口状态
						"msg" : res["msg"], //解析提示文本
						"count" : res["count"], //解析数据长度
						"data" : res["data"]
					//解析数据列表
					};
				}
	    ,cols: [[
	      {type: 'checkbox', fixed: 'left' }
	      ,{field: 'id', title: '讲师编号', width:100, fixed: 'left', align:'center', templet:'#titleTpl'}
	      ,{field:'lecturer_name', title:'讲师名称', width:120, fixed: 'left', align:'center'}
	      ,{field:'lecturer_title', title:'讲师头衔', width:120, edit: 'text', align:'center'}
	      ,{field:'lecturer_phone', title:'联系方式', width:120, edit: 'text', align:'center'}
	      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:200}
	    ]]
	   
	    ,page: true
	    ,done:function(res,curr,count){
	    	console.log(res);
	    }
	  });
	 
	 
	         
		      
	  
	 
	 
	 //操作点击事件
		table.on('tool(test)', function(obj){
			var data = obj.data;//获取当前行的数据
			var event = obj.event;//获取功能按钮的event
			
			if('detail'==event){
				 EidtUv(data,obj);
              }
			
			
			else if('del'==event){
				layer.confirm('真的删除行么', function(index){
				      obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
				      layer.close(index);
				      console.log(data);
						location.href='${pageContext.request.contextPath }/deletepxjs.do?lecturer_id='+data.lecturer_id; 
				});
				
			}
			
			
			});
	 
		 function  EidtUv(data,obj) {
		     $("#lecturer_name").val(data.lecturer_name);
		     $("#lecturer_title").val(data.lecturer_title);
		     $("#lecturer_phone").val(data.lecturer_phone);
		     $("#lecturer_id").val(data.lecturer_id);
		     
		     layer.open({
		         title:'修改讲师信息',
		         type:1,
		         closeBtn: false,
		         shadeClose: true,
		         area:['400px','300px'],
		         content:$("#update-main"),
		         end:function(){
					  	window.location.reload();
					  }
		     });
		 }
	

			 
	});
		

 
 
 </script>
 
 <script type="text/html" id="titleTpl">
	 {{d.LAY_TABLE_INDEX+1}}
	 </script>
 

<style>
.layui-table-cell .layui-form-checkbox[lay-skin="primary"]{
		    top: 50%;
		    transform: translateY(-50%);
			}
</style>

</body>
</html>