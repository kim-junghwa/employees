<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>employeesList</title>
</head>
<body>
	<h1>사원 목록</h1>
	<form method="get" action="${pageContext.request.contextPath}/employees/getEmployeesList">
		<select name="limit">
			<option value="10">10</option>
			<option value="20">20</option>
			<option value="30">30</option>
			<option value="40">40</option>
			<option value="50">50</option>
		</select>개 출력
		<button type="submit">출력</button>
	</form>
	<table>
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