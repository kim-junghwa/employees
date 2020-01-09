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

#home{
	color: black;
	text-decoration: none;
}
</style>
</head>
<body>
	<h1 class="center"><a id="home" href="${pageContext.request.contextPath}/index">EMPLOYEES</a></h1>
	<br>
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
	<br><br>
	
	<div class="container">
		<div class="row">
			<div class="card">
				<div class="card-body">
					<h2 class="center">로그인</h2>
					<form method="post" action="${pageContext.request.contextPath }/login">
						<div>
							first_name <input type="text" name="firstName" class="form-control" value="Georgi">
						</div>
						<div>
							last_name <input type="text" name="lastName" class="form-control" value="Facello">
						</div>
						<div>
							emp_no <input type="text" name="empNo" class="form-control" value="10001"><br>
						</div>
						<div class="center">
							<button type="submit" class="btn btn-success">로그인</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<br><br>
	<div class="center footer">copyright</div>
</body>
</html>