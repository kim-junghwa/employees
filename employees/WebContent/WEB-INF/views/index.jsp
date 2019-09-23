<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	
	<table>
		<thead>
			<tr>
				<td>테이블 명</td>
				<td>전체 행의 수</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>Employees</td>
				<td>${employeesRowCount}</td>
			</tr>
			<tr>
				<td>Departments</td>
				<td>${departmentsRowCount}</td>
			</tr>
			<tr>
				<td>DeptEmp</td>
				<td>${deptEmpRowCount}</td>
			</tr>
			<tr>
				<td>DeptManager</td>
				<td>${deptManagerRowCount}</td>
			</tr>
			<tr>
				<td>Salaries</td>
				<td>${salariesRowCount}</td>
			</tr>
			<tr>
				<td>Titles</td>
				<td>${titlesRowCount}</td>
			</tr>
		</tbody>
	</table>
	
	<div class="row">
		<ul class="list-group list-group-flush">
			<li class="list-group-item"><a href="${pageContext.request.contextPath}/departments/getDepartmentsList">부서 목록</a></li>
			<li class="list-group-item"><a href="${pageContext.request.contextPath}/employees/getEmployeesList">사원 목록</a></li>
			<li class="list-group-item">
				사원목록
				<a href="${pageContext.request.contextPath}/employees/employeesListOrderBy?order=asc">오름차순</a>
				<a href="${pageContext.request.contextPath}/employees/employeesListOrderBy?order=desc">내림차순</a>
			</li>
		</ul>
	</div>
</body>
</html>