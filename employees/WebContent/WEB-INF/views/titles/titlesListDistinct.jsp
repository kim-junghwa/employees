<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
	table{text-align: center;}
	.center{text-align: center;}
</style>
</head>
<body class="container">
	<h1 class="center">업무목록(중복 제거 distinct)</h1>
	<div>
		<a href="${pageContext.request.contextPath}/">home</a>
	</div>
	<div class="row">
		<div class="col-sm-3">
			<ol class="list-group list-group-flush">
				<c:forEach var="title" items="${list}">
					<li class="list-group-item">${title}</li>
				</c:forEach>
			</ol>
		</div>
	</div>
</body>
</html>