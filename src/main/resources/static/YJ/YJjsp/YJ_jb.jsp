<%@ page language="java" isELIgnored="false"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<form class="layui-form" >
 	<div class="layui-form-item">
	<div class="layui-inline">
      <label class="layui-form-label">考勤时间</label>
      <div class="layui-input-inline">
        <input type="text" class="layui-input" id="test1" placeholder="yyyy-MM-dd">
      </div>
      <label class="layui-form-label">员工工号</label>
      <div class="layui-input-inline">
        <input type="text" class="layui-input" id="gonghao" >
      </div>
     <button class="layui-btn" lay-filter="YJ" lay-submit>查询</button>
    </div>
    
     
     
     <button type="button" id="demo1" style="float: right; margin-right: 50px" class="layui-btn layui-btn-normal"  >
    	新增
    </button>	
     
 </div>
 </form>

 
 



	<table class="layui-hide" id="test" lay-filter="test" lay-data="{id: 'idTest'}" ></table>
		 
	<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="detail">修改</a>
   </script>
<script type="text/javascript"	>

$('#demo1').on('click',function(){
	location.href="YJ_jbxx.jsp";
	});




 layui.use(['table','form','laydate','laytpl','layer'], function(){
	 var table = layui.table
		,laydate = layui.laydate
		,form = layui.form
		,laypage=layui.laypage;
	 
	 
	//layui日期选择器的下拉框控件
		 laydate.render({
		    elem: '#test1'
		  });
	 
	 
	 var tbl= table.render({
		 title:false,
		  elem: '#test',
			  method : "post"
			    ,url:'${pageContext.request.contextPath }/YJ_alljbxx.do'
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
	      ,{field: 'gonghao', title: '工号', width:150, fixed: 'left', align:'center'}
	      ,{field:'overtime_id', title:'id', width:120, fixed: 'left',hide:true, align:'center'}
	      ,{field:'name', title:'员工姓名', width:200, edit: 'text', align:'center'}
	      ,{field:'overtime_starttime', title:'开始时间', width:200 ,edit: 'text', align:'center'
	    	  ,templet:function(d){
					return layui.util.toDateString(d.attendance_time, 'yyyy年MM月dd日 ');}  
	      }
	      ,{field:'overtime_endtime', title:'结束时间', width:200 ,edit: 'text', align:'center'
	    	  ,templet:function(d){
				return layui.util.toDateString(d.attendance_time, 'yyyy年MM月dd日 ');}}
	      ,{field:'overtime_type', title:'加班类型', width:150, edit: 'text', align:'center'}
	      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:100,align:'center'}
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
				console.log(data);
		    	location.href='${pageContext.request.contextPath }/selectjbxx.do?id='+data.overtime_id;  
			}
		});
	 
	 
	 
		form.on('submit(YJ)',function(data){
			//弹出loading
			var riqi = document.getElementById("test1").value
			var gonghao = document.getElementById("gonghao").value
			//var index = parent.layer.msg('查询中，请稍候',{icon: 16,time:false,shade:0.8});
			tbl.reload({	
				where: { //设定异步数据接口的额外参数，任意设
					 "riqi": riqi,//data.field获取表单所有数据 键值对方式
				 	 "gonghao":gonghao
					 //…
				 
					 },
				page: {
					curr: 1 //重新从第 1 页开始
				},
				done: function(res, curr, count){
					setTimeout(function(){
	                    parent.layer.close(index);
	                },200);
				},
			
			})
			return false;
		}) 
		

			 
	});


 
 
 </script>

 

<style>
.layui-table-cell .layui-form-checkbox[lay-skin="primary"]{
		    top: 50%;
		    transform: translateY(-50%);
			}
</style>

</body>
</html>