<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
.center {
	text-align: center;
}
.right {
	float:right;
	text-align: right;
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
table{
	margin-top: 50px;
}
h1{
	margin-top: 50px;
	margin-bottom: 50px;
}

#home{
	color: black;
	text-decoration: none;
}

.logout{
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
			<c:if test= "${sessionEmpNo == null}">
				<a class="logout" href="${pageContext.request.contextPath}/login">로그인</a>  <!-- LoginServlet -->
			</c:if>
			
			<c:if test="${sessionEmpNo != null }">
				<a class="logout" href="${pageContext.request.contextPath}/logout">로그아웃</a>  <!-- LogoutServlet -->
			</c:if>
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
		<div class="row">
			<table class="table table-hover text-center">
				<thead>
					<tr>
						<th>테이블 이름</th>
						<th>전체 행의 수</th>
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
						<td>Dept_emp</td>
						<td>${deptEmpRowCount}</td>
					</tr>
					<tr>
						<td>Dept_manager</td>
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
		</div>
		<div class="text-center">
		<br><br>
		<form method="post" action="${pageContext.request.contextPath}/employees/getEmployeesListBetween">
			<input type = "number" name="begin" placeholder="${minEmpNo}" min="${minEmpNo}" max="${maxEmpNo}">~<input type="number" name="end"placeholder="${maxEmpNo}" min="${minEmpNo}" max="${maxEmpNo}">
			<button type="submit">사원목록</button>
		</form>
			<%-- 
			표현식 :employees table total row Count : <%=request.getAttribute("employeesRowCount")%>
			el : employees table total row Count : ${employeesRowCount}
			 --%><br><br><br><br>
		</div>
	</div>
	<div class="footer">copyright</div>
</body>
</html>