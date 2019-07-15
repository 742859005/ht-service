
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

<form class="layui-form"  style="text-align:center;"  method="post" 
 action=<c:if test="${ma==null }">"${pageContext.request.contextPath }/YJ_insertjb.do"</c:if>  
	 	<c:if test="${ma!=null }">"${pageContext.request.contextPath }/YJ_updatejb.do"</c:if>
        >
	
          <h3 >员工信息</h3>
    <div class="layui-form-item" style="display: none" >
    <label class="layui-form-label">加班id</label>
    <div class="layui-input-inline">
      <input type="text" name="attendance_id" id="attendance_id" value="${ma.attendance_id}" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div>        
          
          
          
    <div class="layui-form-item" style="display: none" >
    <label class="layui-form-label">员工id</label>
    <div class="layui-input-inline">
      <input type="text" name="yg_id" id="yg_id" value="${ma.yg_id}" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div>  
  
  
  <div class="layui-form-item" >
    <label class="layui-form-label">员工工号</label>
   <div class="layui-input-inline"> 
		<select  id="rid"  name="gonghao"  lay-filter="test"    <c:if test="${ma!=null }"> disabled="disabled</c:if> "  >
					<option value=''></option>
		</select>	
	</div>
    <label class="layui-form-label">员工姓名</label>
    <div class="layui-input-inline">
      <input type="text" name="name" id="name" value="${ma.name}"   <c:if test="${ma!=null }"> readonly="true"</c:if>  lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
  
     <label class="layui-form-label">性别</label>
    <div class="layui-input-inline">
      <input type="text" name="sex" id="sex" value="${ma.sex}"  <c:if test="${ma!=null }"> readonly="true"</c:if> lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
    <label class="layui-form-label">员工身份证</label>
    <div class="layui-input-inline">
      <input type="text" name="sfz" id="sfz"  value="${ma.sfz}" <c:if test="${ma!=null }"> readonly="true"</c:if> lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
       <label class="layui-form-label">所学专业</label>
    <div class="layui-input-inline">
      <input type="text" name="zhuanye" id="zhuanye" value="${ma.zhuanye}" <c:if test="${ma!=null }"> readonly="true"</c:if> lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
    <label class="layui-form-label">电话</label>
    <div class="layui-input-inline">
      <input type="text" name="phone" id="phone" value="${ma.phone}"  <c:if test="${ma!=null }"> readonly="true"</c:if> lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div>
 
   <h3>加班信息</h3>
   
  <div class="layui-form-item">
  <div class="layui-inline" style="display: none">
      <label class="layui-form-label">加班id</label>
      <div class="layui-input-inline">
        <input type="text" class="layui-input" id="overtime_id" name="overtime_id"  value="${ma.overtime_id} " >
      </div>
      </div>
    <label class="layui-form-label">加班类型</label>
   <div class="layui-input-inline">
		<select id="overtime_type"  name="overtime_type"  >
					<option value='0'> 请选择</option>
					<option value='平日加班'> 平日加班</option>
					<option value=休息日加班> 休息日加班</option>
		</select>	
	</div>
  </div>

  <div class="layui-form-item">
   <div class="layui-inline">
      <label class="layui-form-label">开始时间</label>
      <div class="layui-input-inline">
        <input type="text" class="layui-input" id="test6" name="overtime_starttime"  value="${ma.overtime_starttime} " placeholder="yyyy-MM-dd HH:mm:ss">
      </div>
      
       
      <label class="layui-form-label">结束时间</label>
      <div class="layui-input-inline">
        <input type="text" class="layui-input" id="test7" name="overtime_endtime" value="${ma.overtime_endtime} " placeholder="yyyy-MM-dd HH:mm:ss">
      </div>
    </div>
  </div>
    
  
  
  
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">加班备注</label>
    <div class="layui-input-block">
      <textarea placeholder="请输入内容" id="attendance_note" name="overtime_note"    class="layui-textarea">${ma.overtime_note}</textarea>
    </div>
  </div>
  
  
   <button 	class="layui-btn layui-btn-normal"  type="submit" >提交</button>
   <button class="layui-btn layui-btn-danger" type="button" onclick="javascript:history.back(-1);">返回</button>
  </form>
  </div>
  
  
  
  <script type="text/javascript">
  $("#overtime_type").val('${type}');
  var table;
	layui.use(['table','form','laydate','laytpl','layer'], function(){
		 var laydate = layui.laydate
			,form = layui.form
			,layer = layui.layer
			,laypage=layui.laypage;
		 
		    table = layui.table;
			
		   
       
    	   $.post('${pageContext.request.contextPath }/YJ_selectyg.do', function(data) {
	 			$(data).each(
					function() {
							var id = "${ma.yg_id}";
							if(this.yg_id==id){
								$("#rid").append(
										
										"<option selected='selected'  value='"+this.yg_id +"' >"
														+ this.gonghao + "</option>");
							}else{
              					$("#rid").append(
										
										"<option  value='"+this.yg_id +"' >"
														+ this.gonghao + "</option>");
							}
					
						});

					form.render('select');
				  
			}, 'json');
     
		
		 
		
		 form.on('select(test)', function(data){
			  console.log(data.elem); //得到select原始DOM对象
			  console.log(data.value); //得到被选中的值
			  console.log(data.othis); //得到美化后的DOM对象
			 
			  
			  $.post("${pageContext.request.contextPath }/YJ_selectygyg.do",{"id":data.value},function(data){
				  console.log(data);
				  $("#yg_id").val(data.yg.yg_id);
				  $("#name").val(data.yg.name);
				  $("#sex").val(data.yg.sex);
				  $("#sfz").val(data.yg.sfz);
				  $("#zhuanye").val(data.yg.zhuanye);
				  $("#phone").val(data.yg.phone);
				  
			});
		});
		
			 
			

		//layui年分选择器的下拉框控件
		 laydate.render({
		    elem: '#attendance_time'
		  });
		 laydate.render({
			    elem: '#test6'
			    ,type: 'datetime'
			  });
		 laydate.render({
			    elem: '#test7'
			    ,type: 'datetime'
			  });
		
		 
	
		 
	});
 </script>

  
  
</body>
</html>