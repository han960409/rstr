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
  <h2>여행에 필요한 아이템들</h2>
</div>
<div class="container">
   <table class="table table-hover table-striped">
   	<col width="20%">
   	<col width="80%">
    <thead>
      <tr class="table-success text-center">
        <th>번호</th>
        <th>아이템</th>
      </tr>
    </thead>	
    <tbody>
    	<c:forEach var="item" items="${travelItems}" varStatus="sts">
    	<tr><td>${sts.count}</td><td>${item}</td></tr>
    	</c:forEach>
    </tbody>
	</table>    
</div>

</body>
</html>