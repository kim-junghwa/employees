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

.copyright{
	height:50px;
	color:white;
	background-color: #353535;
}
</style>
</head>
<body>
	<h1 class="center">EMPLOYEES</h1>

	<div class="container">
		<div>
			<div>
				<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/employees/getEmployeesList">사원
								목록(limit 10)</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/departments/getDepartmentsList">부서
								목록</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/employees/getEmployeesListOrderBy?order=asc">오름차순(limit50)</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/employees/getEmployeesListOrderBy?order=desc">내림차순(limit50)</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/salaries/getSalariesStatistics">연봉통계</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/titles/getTitlesListDistinct">업무목록(Distinct)</a></li>
						<li class="nav-item">
							<a class="nav-link" href="${pageContext.request.contextPath}/employees/getEmployeesCountByGender">사원 수(성별 group by gender)</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="${pageContext.request.contextPath}/departments/getDepartmentsCountByDeptNo">부서별인원</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="${pageContext.request.contextPath}/employees/getEmployeesListByPage">사원목록(10paging)</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>
		<br><br>
		<h2>사원목록</h2>
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
		<br><br>
		<div class="center copyright">copyright</div>
	</div>
</body>
</html>