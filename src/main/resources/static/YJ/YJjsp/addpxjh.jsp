
<%@ page language="java" contentType="text/html; charset=UTF-8"
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



<div style="margin: 0px auto; width: 640px"> 
	<form class="layui-form" method="post"  
	 action=<c:if test="${map==null }">"${pageContext.request.contextPath }/insertpxjh.do"</c:if>  
	 		<c:if test="${map!=null }">"${pageContext.request.contextPath }/updatepxjh.do"</c:if>
	  style="text-align:center;"   >
          <h3 >培训计划</h3>
          
    <div class="layui-form-item" style="display: none" >
    <label class="layui-form-label">计划名称</label>
    <div class="layui-input-inline">
      <input type="text" name="training_id" value="${map.training_id}" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div>      
   <div class="layui-form-item" >
    <label class="layui-form-label">计划名称</label>
    <div class="layui-input-inline">
      <input type="text" name="training_name" value="${map.training_name}" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div>
  
  
    <div class="layui-form-item" >
    <div class="layui-inline">
      <label class="layui-form-label">开始时间</label>
      <div class="layui-input-inline">
        <input type="text" name="training_starttime" value="${map.training_starttime}" class="layui-input" id="test11" placeholder="请选择">
      </div>
      
    <div class="layui-inline">
      <label class="layui-form-label">结束时间</label>
      <div class="layui-input-inline">
        <input type="text" name="training_endtime" value="${map.training_endtime}" class="layui-input" id="test12" placeholder="请选择">
      </div>
    
     </div>
    </div>
   </div>
   
   <div class="layui-form-item">
   <label class="layui-form-label">年份</label>
      <div class="layui-input-inline">
        <input type="text" name="training_date" value="${map.training_date}"  class="layui-input" id="test2" placeholder="请选择年份">
      </div>
    <label class="layui-form-label">地点</label>
    <div class="layui-input-inline">
      <input type="text" name="training_place" value="${map.training_place}" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div>
  
  <div class="layui-form-item">
   <label class="layui-form-label">讲师</label>
   <div class="layui-input-inline">
		<select id="rid"  name="lecturer_id"  >
					<option value=''></option>
					
				</select>	
	</div>
     <label class="layui-form-label">目标</label>
    <div class="layui-input-inline">
      <input type="text" name="training_target" value="${map.training_target}" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">内容</label>
    <div class="layui-input-block">
      <textarea placeholder="请输入内容" name="training_content"   class="layui-textarea">${map.training_content}</textarea>
    </div>
  </div>
   <c:if test="${map.training_name==null }">
   <table class="layui-hide" id="test" lay-filter="test" lay-data="{id: 'idTest'}" ></table>
   </c:if>
   <button 	class="layui-btn layui-btn-normal"  type="submit" onclick="del()"   >提交</button>
   <button class="layui-btn layui-btn-danger" type="button" onclick="javascript:history.back(-1);">返回</button>
  </form>
  </div>
  <script type="text/javascript">
  var table;
	layui.use(['table','form','laydate','laytpl','layer'], function(){
		 var laydate = layui.laydate
			,form = layui.form
			,laypage=layui.laypage;
		 table = layui.table;
			

		 $.post('${pageContext.request.contextPath }/alltraining_lecturer.do', function(data) {
	 			$(data).each(
					function() {
							var id = "${map.lecturer_id}";
							if(this.lecturer_id==id){
								$("#rid").append(
										
										"<option selected='selected'  value='"+this.lecturer_id +"' >"
														+ this.lecturer_name + "</option>");
							}else{
               					$("#rid").append(
										
										"<option  value='"+this.lecturer_id +"' >"
														+ this.lecturer_name + "</option>");
							}
					
						});

					form.render('select');
				  
			}, 'json');
		 
		
			 
			 
			 var tbl= table.render({
				 title:false,
				  elem: '#test',
					  method : "post"
					    ,url:'${pageContext.request.contextPath }/allyuangong.do'
					    ,limits : [ 5, 10, 15, 20 ]
						,limit : 5
					    ,page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
					    	prev : '上一页',
							next : '下一页',
							first: false //不显示首页
					      ,last: false //不显示尾页
					    }
					    ,id: 'ngkz'
					    ,height: 278
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
			      ,{field: 'id', title: '员工编号', width:100, fixed: 'left', align:'center', templet:'#titleTpl'}
			      ,{field:'yg_id', title:'员工id', width:140, fixed: 'left',hide:true, align:'center'}
			      ,{field:'name', title:'员工姓名', width:140, edit: 'text', align:'center'}
			      ,{field:'sex', title:'性别', width:100 ,edit: 'text', align:'center'}
			      ,{field:'phone', title:'电话', width:242 ,edit: 'text', align:'center'}
			      
			    ]]
			   
			    ,page: true
			    ,done:function(res,curr,count){
			    	console.log(res);
			    }
	
	
		 });
		 
//layui年分选择器的下拉框控件
		laydate.render({
		    elem: '#test11'
		    ,format: 'yyyy.MM.dd'
		  });
		 laydate.render({
			    elem: '#test12'
			    ,format: 'yyyy.MM.dd'
			  });
			 
		 
		
		 
		//layui年分选择器的下拉框控件
		 laydate.render({
			    elem: '#test2'
			    ,type: 'year'
			  });
		 
	
		 
	});
	
	function del(){
		
		var checkStatus = table.checkStatus('ngkz'); //idTest 即为基础参数 id 对应的值s
	
            	 layui.use('layer', function(){
     				
     				if(checkStatus.data.length==0){
     					layer.msg("请选择一行", {
     						time : 2000, //2s后自动关闭
     					});
     				}else{
     					
     					$.each(checkStatus.data,function(i,n){
     						$.post("${pageContext.request.contextPath }/insertpxjh.do",n);
     					});
     				
     				}
     		    })
		                
		           
		
}
	
  
  </script>
  <!-- layui编号 1,2,3 -->
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