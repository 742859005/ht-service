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

<button type="button" id="demo1" style=" margin-right: 50px" class="layui-btn layui-btn-normal"  >
    	新增
 </button>	

<table class="layui-hide" id="test" lay-filter="test" lay-data="{id: 'idTest'}" ></table>
		 
	<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="detail">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
   </script>
	<!-- <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">考勤记录</a> -->
<script type="text/javascript"	>

$('#demo1').on('click',function(){
	location.href="addpxjg.jsp";
	});




 layui.use(['table','form','laydate','laytpl','layer'], function(){
	 var table = layui.table
		,laydate = layui.laydate
		,form = layui.form
		,laypage=layui.laypage;
	 
	  var tbl= table.render({
		 title:false,
		  elem: '#test',
			  method : "post"
			    ,url:'${pageContext.request.contextPath}/allpxjg.do'
			    ,limits : [ 5, 10, 15, 20 ]
				,limit : 10
			    ,page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
			    	prev : '上一页',
					next : '下一页',
					first: false //不显示首页
			      ,last: false //不显示尾页
			    }
			    ,height: 600
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
	      ,{field: 'id', title: '机构编号', width:100, fixed: 'left', align:'center', templet:'#titleTpl'}
	      ,{field:'institutions_name', title:'机构名称', width:300, fixed: 'left',hide:true, align:'center'}
	      ,{field:'institutions_contact', title:'联系人', width:200, edit: 'text', align:'center'}
	      ,{field:'institutions_phone', title:'联系电话	', width:250 ,edit: 'text', align:'center'}
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
				console.log(data);
		    	location.href='${pageContext.request.contextPath }/selectpxjg.do?institutions_id='+data.institutions_id;  
				
			}else if('del'==event){
				layer.confirm('真的删除行么', function(index){
				      obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
				      layer.close(index);
				      console.log(data);
						location.href='${pageContext.request.contextPath }/deletepxjg.do?institutions_id='+data.institutions_id; 
				});
				
			}
			
			
			});
	 
	
		
});


 
 
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