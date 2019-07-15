<%@ page language="java" contentType="text/html; charset=UTF-8"
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

<body style="background-color:white; ">
<blockquote class="layui-elem-quote quoteBox">
			
				<a class="layui-btn return_btn" onclick="location.href='YJ_pxry.jsp'" ><i class="layui-icon">&#xe65c;</i>返回上一级</a>
			
			
				<form class="layui-form">
					<div class="layui-inline" style="display: none">
						<label class="layui-form-label">客户编号</label>
						<div class="layui-input-block">
							<input type="text" class="layui-input training_id"
								lay-verify="required|url"  id="training_id" name="training_name" disabled="disabled" />
						</div>
					</div>
			<div class="layui-inline">
				<form class="layui-form">
					<div class="layui-inline">
						<label class="layui-form-label">计划名称</label>
						<div class="layui-input-block">
							<input type="text" class="layui-input training_name"
								lay-verify="required|url"  id="training_name" name="training_name" disabled="disabled" />
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">计划年份</label>
						<div class="layui-input-block">
							<input type="text" class="layui-input training_date"
								lay-verify="required|url" name="training_date"
								disabled="disabled" />
						</div>
					</div>
				</form>
			</div>
		</blockquote>

<table class="layui-hide" id="test" lay-filter="test" ></table>
 

 
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit" >确认考勤</a>
   <c:if test="${map.rId==3 }">
  		<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="del" >删除</a>
		</c:if>
 
</script>
              
          

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 --> 
 <script>
 layui.use(['table','form','layer','laytpl'], function(){
	 var table = layui.table
		,laydate = layui.laydate
		,form = layui.form
		,laypage=layui.laypage;
	 
	 var tbl= table.render({
		 
		  elem: '#test',
		  where:{id:$("#training_id").val()},
			  method : "post"
			    ,url:'${pageContext.request.contextPath }/selectpxry.do'
			    ,limits : [ 5, 10, 15, 20 ]
				,limit : 10
				,height: 660
			    ,page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
			    	prev : '上一页',
					next : '下一页',
					first: false //不显示首页
			      ,last: false //不显示尾页
			    }
			  ,parseData : function(res) { //res 即为原始返回的数据
			
					return {
						"code" : res["code"], //解析接口状态
						"msg" : res["msg"], //解析提示文本
						"count" : res["count"], //解析数据长度
						"data" : res["data"]//解析数据列表
					};
				}
	    ,cols: [[
	    	
	    	{type: 'checkbox', fixed: 'left'}
		      ,{field:'ygpx_id', title:'编号', width:120, fixed: 'left',hide:true, unresize: true,style:'display:none;'}
		      ,{field:'gonghao', title:'工号', width:120, edit: 'text', align:'center'}
		      ,{field:'name', title:'姓名', width:100 ,edit: 'text', align:'center'}
		      ,{field:'sex', title:'性别', width:120, edit: 'text', align:'center'}
		      ,{field:'training_type', title:'出勤情况', width:120, edit: 'text', align:'center'}
		      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
	    	
	    ]]
	    ,page: true
	    
	  });
	 

	 table.on('tool(test)', function(obj){
			var data = obj.data;//获取当前行的数据
			var event = obj.event;//获取功能按钮的event
			
			if('edit'==event){
				
				console.log(data);
		    	location.href='${pageContext.request.contextPath }/updatepxry.do?id='+data.ygpx_id+''; 
				
			}else if('del'==event){
				location.href='${pageContext.request.contextPath }/deletepxyg.do?id='+data.ygpx_id;  
			}
			
			
			});
		
	 
	       //点击链接的时候调用
	      $("#linkToCart").click(function(){
	 
	          //得到input的值
	          var count = $("#cid").val();
	         
	 			//设置linkToCart的href的值
	          $("#linkToCart").attr("href","YJ_xinjianjiaowang.jsp?cid="+count);
	          
	      });
	
		 
	});




 </script>

</body>
</html>