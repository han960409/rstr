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
  <h2>get과 post을 모두 처리..</h2>
	<h3>${param.no1} + ${param.no2} = ${param.no1 + param.no2}</h3>
</div>
<div class="container">
	<form id="frm01" class="form"  method="post"> 
	<!-- 질문 action을 생략하면 어디를 호출하까요?? 이 jsp를 호출한 url을 일단 호출하고,
		method방식만 바꾸어 요청 처리한다.  -->
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input placeholder="번호1" name="no1"  class="form-control mr-sm-2" />
	    <input placeholder="번호2" name="no2"  class="form-control mr-sm-2"/>
	    <button class="btn btn-info" type="submit">Search</button>
 	</nav>
	</form>
</div>
</body>
</html>