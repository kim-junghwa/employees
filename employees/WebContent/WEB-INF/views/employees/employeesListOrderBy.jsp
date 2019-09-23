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
	.center{text-align: center;}
	.right{text-align: right;}
</style>
</head>
<body class="container">
	<h1>사원 목록</h1>
	<div>
		<a href="${pageContext.request.contextPath}/">home</a>
	</div>
	<table class="table table-hover">
		<thead>
			<tr>
				<td class="center">empNo</td>
				<td class="center">birthDate</td>
				<td class="center">firstName</td>
				<td class="center">lastName</td>
				<td class="center">gender</td>
				<td class="center">hireDate</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="employees" items="${list}">
				<tr>
					<td class="center">${employees.empNo}</td>
					<td class="center">${employees.birthDate}</td>
					<td class="center">${employees.firstName}</td>
					<td class="center">${employees.lastName}</td>
					<td class="center">${employees.gender}</td>
					<td class="center">${employees.hireDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>