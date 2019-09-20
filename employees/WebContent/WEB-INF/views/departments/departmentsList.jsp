<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>departments</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
	.center{text-align: center;}
</style>
</head>
<body class="container">
	<h1>부서 목록</h1>
	<table class="table table-hover">
		<thead>
			<tr>
				<td width="10%" class="center">부서 번호</td>
				<td class="center">부서 명</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="departments" items="${list}">
				<tr>
					<td class="center">${departments.deptNo}</td>
					<td class="center">${departments.deptName}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>