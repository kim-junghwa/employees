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
	<h1 class="center">사원 목록 between...and...</h1>
	<div>
		<a href="${pageContext.request.contextPath}/">home</a>
	</div>
	<table class="table table-hover">
		<thead>
			<tr>
				<td>empNo</td>
				<td>birthDate</td>
				<td>firstName</td>
				<td>lastName</td>
				<td>gender</td>
				<td>hireDate</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="employees" items="${list}">
				<tr>
					<td>${employees.empNo}</td>
					<td>${employees.birthDate}</td>
					<td>${employees.firstName}</td>
					<td>${employees.lastName}</td>
					<td>${employees.gender}</td>
					<td>${employees.hireDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>