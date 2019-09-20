<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body class="container">
	<h1>Index</h1>
	<div class="row">
		<ul class="list-group list-group-flush">
			<li class="list-group-item"><a href="${pageContext.request.contextPath}/departments/getDepartmentsList">부서 목록</a></li>
			<li class="list-group-item"><a href="${pageContext.request.contextPath}/employees/getEmployeesList">사원 목록</a></li>
		</ul>
	</div>
</body>
</html>