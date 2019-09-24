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
</style>
</head>
<body class="container">
	<h1 class="center">사원 수(성별 group by gender)</h1>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<a href="${pageContext.request.contextPath}/">home</a>
		</div>
		<div class="col-sm-2"></div>
	</div>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<table class="table table-hover">
				<thead>
					<tr>
						<td>성별</td>
						<td>사원 수</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="map" items="${list}">
						<tr>
							<td>${map.gender}</td>
							<td>${map.cnt}</td>
						</tr>	
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-sm-2"></div>
	</div>
	
</body>
</html>