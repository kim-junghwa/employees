<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>업무목록(중복 제거 distinct)</h1>
	<div>
		<a href="${pageContext.request.contextPath}/">home</a>
	</div>
	<ol>
		<c:forEach var="title" items="${list}">
			<li>${title}</li>
		</c:forEach>
	</ol>
</body>
</html>