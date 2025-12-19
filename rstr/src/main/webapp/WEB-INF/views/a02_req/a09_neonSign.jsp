<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="UTF-8"/> 
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/com/bootstrap.min.css" >
<style>
	td{text-align:center;}
</style>
<script src="${path}/com/jquery-3.7.1.js"></script>
<script src="${path}/com/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>네온사인</h2>
  <h3>${neonSign.msg} - ${neonSign.color} - ${neonSign.fontSize} </h3>
  <h3 style="color:${neonSign.color};font-size:${neonSign.fontSize}pt">${neonSign.msg}</h3>
</div>
<div class="container">
	<form id="frm01" class="form"  >
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input placeholder="메시지입력" name="msg"  class="form-control mr-sm-2" />
	    <select  name="color"  class="form-control mr-sm-2">
	    	<option value="">색상을 선택하세요</option>
	    	<option value="red">빨강</option>
	    	<option value="orange">오렌지</option>
	    	<option value="navy">네이비</option>
	    	<option value="green">초록</option>
	    	<option value="purple">보라</option>
	    </select>
	    <input placeholder="글자크기" name="fontSize" type="number" class="form-control mr-sm-2"/>
	    <button class="btn btn-info" type="submit">네온사인 생성</button>

 	</nav>
	</form>
    
</div>

</body>
</html>