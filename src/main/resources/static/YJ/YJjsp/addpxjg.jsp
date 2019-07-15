
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
	 action=<c:if test="${map==null }">"${pageContext.request.contextPath }/insertpxjg.do"</c:if>  
	 		<c:if test="${map!=null }">"${pageContext.request.contextPath }/updatepxjg.do"</c:if>
	  style="text-align:center;"   >
          <h3 >培训机构</h3>
          
    <div class="layui-form-item" style="display: none">
    <label class="layui-form-label">机构id</label>
    <div class="layui-input-block">
      <input type="text" name="institutions_id"  value="${map.institutions_id}"  lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
    </div>
  </div>   
    <div class="layui-form-item">
    <label class="layui-form-label">机构名称</label>
    <div class="layui-input-block">
      <input type="text" name="institutions_name" value="${map.institutions_name}" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
    </div>
  </div> 
  
  
   <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">机构介绍</label>
    <div class="layui-input-block">
      <textarea placeholder="请输入内容" name="institutions_introduce"  class="layui-textarea">${map.institutions_introduce}</textarea>
    </div>
  </div>
  
    <div class="layui-form-item">
    <label class="layui-form-label">联系人</label>
    <div class="layui-input-inline">
      <input type="text" name="institutions_contact" value="${map.institutions_contact}" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
    
     <label class="layui-form-label">联系方式</label>
    <div class="layui-input-inline">
      <input type="text" name="institutions_phone" value="${map.institutions_phone}" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
    
  </div>
  
   <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">培训经历</label>
    <div class="layui-input-block">
      <textarea placeholder="请输入内容" name="institutions_experience" class="layui-textarea">${map.institutions_experience}</textarea>
    </div>
  </div>
  
   <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">背景</label>
    <div class="layui-input-block">
      <textarea placeholder="请输入内容" name="institutions_background" class="layui-textarea">${map.institutions_background}</textarea>
    </div>
  </div>
  
  
   <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">备注</label>
    <div class="layui-input-block">
      <textarea placeholder="请输入内容" name="institutions_note" class="layui-textarea">${map.institutions_note}</textarea>
    </div>
  </div>
  
  
    
   
   <button 	class="layui-btn layui-btn-normal" type="submit" lay-event="getCheckData" >提交</button>
   <button class="layui-btn layui-btn-danger" type="button" onclick="javascript:history.back(-1);">返回</button>
  </form>
  </div>
 



  
</body>
</html>