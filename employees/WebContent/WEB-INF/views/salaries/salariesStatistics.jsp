<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<h1 class="center">연봉 통계값(count, sum, avg, max, min, std)</h1>
	<div>
		<a href="${pageContext.request.contextPath}/">home</a>
	</div>
	<table class="table table-hover">
		<thead>
			<tr>
				<td>count</td>
				<td>sum</td>
				<td>avg</td>
				<td>max</td>
				<td>min</td>
				<td>std</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${map.count}</td>
				<td>${map.sum}</td>
				<td>${map.avg}</td>
				<td>${map.max}</td>
				<td>${map.min}</td>
				<td>${map.std}</td>
			</tr>
		</tbody>
	</table>
</body>
</html>