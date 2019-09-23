<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>employeesList</title>
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
	<h1 class="center">사원 목록</h1>
	<div>
		<a href="${pageContext.request.contextPath}/">home</a>
	</div>
	<form method="get" action="${pageContext.request.contextPath}/employees/getEmployeesList">
		<div class="row">
			<div class="col-sm-9">
			</div>
			<div class="col-sm-3">
				<div class="row">
					<div class="col-sm-6">
						<select name="limit" class="custom-select">
							<option value="10">10</option>
							<option value="20">20</option>
							<option value="30">30</option>
							<option value="40">40</option>
						</select>
					</div>
					<div class="col-sm-4">
						<button type="submit" class="btn btn-success btn-sm right">확인</button>
					</div>
				</div>
			</div>
			
		</div>
	</form>
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