<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
.center {
	text-align: center;
}

.right {
	float: right;
	text-align: right;
}

.card {
	margin-left:auto;
	margin-right:auto;
	background-color: #E1E1E1;
}

.footer{
	height:140px;
	color:white;
	background-color: #353535;
	text-align: center;
	padding-top: 50px;
}

ul {
	margin-left: auto;
	margin-right: auto;
}

h1{
	margin-top: 50px;
	margin-bottom: 50px;
}

h2{
	margin-top: 50px;
	margin-bottom: 20px;
}

table{
	text-align: center;
}

#home{
	color: black;
	text-decoration: none;
}
#logout{
	color: black;
	text-decoration: none;
}
#logout{
	color: black;
	text-decoration: none;
}
</style>
</head>
<body>
	<h1 class="center"><a id="home" href="${pageContext.request.contextPath}/index">EMPLOYEES</a></h1>
	<br>
	<div class="row">
		<div class="col-sm-12 right">
			<a id="logout" href="${pageContext.request.contextPath}/logout">로그아웃</a>  <!-- LogoutServlet -->
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12 right">
			<a id="logout" href="${pageContext.request.contextPath}/logout">로그아웃</a>  <!-- LogoutServlet -->
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/deptEmp/getDeptEmpInnerJoinList">사원정보목록</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/departments/getDepartmentsList">부서목록</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/employees/getEmployeesListOrderBy?order=asc">오름차순(limit50)</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/employees/getEmployeesListOrderBy?order=desc">내림차순(limit50)</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/salaries/getSalariesStatistics">연봉통계</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/titles/getTitlesListDistinct">업무목록(Distinct)</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/employees/getEmployeesCountByGender">사원 수(성별 group by gender)</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/departments/getDepartmentsCountByDeptNo">부서별인원</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/employees/getEmployeesListByPage">사원목록</a>
					</li>
				</ul>
			</nav>
		</div>
	</div>
	<div class="container">
		<br><br>
		<h2>연봉 통계</h2>
		<div class="row">
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
		</div>
		<br><br>
	</div>
	<div class="footer">copyright</div>
</body>
</html>