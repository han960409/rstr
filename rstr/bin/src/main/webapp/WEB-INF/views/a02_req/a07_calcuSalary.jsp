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
  <h2>알바 급여 내용</h2>

</div>
<%-- 
		
--%>
<div class="container">
	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input placeholder="이름" name="name"  class="form-control mr-sm-2" />
	    <input placeholder="시간당 급여" name="pay"  class="form-control mr-sm-2"/>
	    <input placeholder="근무시간" name="whour"  class="form-control mr-sm-2"/>
	    <button class="btn btn-info" type="submit">급여 계산</button>
 	</nav>
	</form>
   <table class="table table-hover table-striped">
   	<col width="25%">
   	<col width="25%">
   	<col width="25%">
   	<col width="25%">
    <thead>
      <tr class="table-success text-center">
        <th>이름</th>
        <th>시간당 급여</th>
        <th>시간</th>
        <th>총급여</th>
      </tr>
    </thead>	
    <tbody>
    	<tr><td>${param.name}</td>
    		<td><fmt:formatNumber value="${param.pay}"/> </td>
    		<td>${param.whour}</td>
    		<td><fmt:formatNumber value="${param.pay*param.whour}"/></td></tr>
    </tbody>
	</table>    
    
</div>
</body>
</html>