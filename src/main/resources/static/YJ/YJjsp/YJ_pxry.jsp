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
      <label class="layui-form-label">年份</label>
      <div class="layui-input-inline">
        <input type="text"  class="layui-input" id="test2" placeholder="请选择年份">
      </div>
      <button class="layui-btn" lay-filter="YJ" lay-submit>查询</button>
    </div>
    
     
 </div>
 </form>

 <table class="layui-hide" id="test" lay-filter="test" lay-data="{id: 'idTest'}" ></table>
		 
	<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="detail">查看人员</a>
    </script>
	<!-- <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">考勤记录</a> -->
<script type="text/javascript"	>
layui.use(['table','form','laydate','laytpl','layer'], function(){
	 var table = layui.table
		,laydate = layui.laydate
		,form = layui.form
		,laypage=layui.laypage;
	 
	 
	//layui年分选择器的下拉框控件
		 laydate.render({
			    elem: '#test2'
			    ,type: 'year'
			  });
	 
	 
	 var tbl= table.render({
		 title:false,
		  elem: '#test',
			  method : "post"
			    ,url:'${pageContext.request.contextPath }/alltraining_plan.do'
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
	      ,{field: 'id', title: '计划编号', width:100, fixed: 'left', align:'center', templet:'#titleTpl'}
	      ,{field:'training_id', title:'计划编号', width:120, fixed: 'left',hide:true, align:'center'}
	      ,{field:'training_name', title:'计划名称', width:120, edit: 'text', align:'center'}
	      ,{field:'training_date', title:'培训年份', width:180 ,edit: 'text', align:'center',templet:function(d){
				return layui.util.toDateString(d.training_date, 'yyyy年 ');}   }
	      ,{field:'training_place', title:'培训地点', width:180 ,edit: 'text', align:'center'}
	      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:100, align:'center'}
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
				aa(data); 
			}
			});
	 
		form.on('submit(YJ)',function(data){
			//弹出loading
			var year = document.getElementById("test2").value
			//var index = parent.layer.msg('查询中，请稍候',{icon: 16,time:false,shade:0.8});
			tbl.reload({	
				where: { //设定异步数据接口的额外参数，任意设
					 "year": year//data.field获取表单所有数据 键值对方式
				 //…
					 },
				page: {
					curr: 1 //重新从第 1 页开始
				},
				done: function(res, curr, count){
					setTimeout(function(){
	                    parent.layer.close(index);
	                },1000);
				},
			
			})
			return false;
		}) 
		

			 
	});
//计划人员
function aa(usable){
	var index = layui.layer.open({
		title: false,
		type :2 ,
		closeBtn: false,
        shadeClose: true,
		content : "${pageContext.request.contextPath }/YJ/YJjsp/pxry.jsp",
		success : function(layero, index){
			var body = layui.layer.getChildFrame('body', index);
			if(usable){
				 body.find(".training_id").val(usable.training_id); 
				 body.find(".training_name").val(usable.training_name); 
				 body.find(".training_date").val(usable.training_date); 
			}
		},
		 
	})
	layui.layer.full(index);
	window.sessionStorage.setItem("index",index);
	//改变窗口大小时，重置弹窗的宽高，防止超出可视区域（如F12调出debug的操作）
	$(window).on("resize",function(){
		layui.layer.full(window.sessionStorage.getItem("index"));
	})
}
 
 
 </script>

 

<style>
.layui-table-cell .layui-form-checkbox[lay-skin="primary"]{
		    top: 50%;
		    transform: translateY(-50%);
			}
</style>
<!-- layui编号 1,2,3 -->
 <script type="text/html" id="titleTpl">
	 {{d.LAY_TABLE_INDEX+1}}
	 </script>
</body>
</html>