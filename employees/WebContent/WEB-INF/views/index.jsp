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
	height:50px;
	color:white;
	background-color: #353535;
}
</style>
</head>
<body>
	<h1 class = "center">EMPLOYEES</h1>
		
	<div class="container">
		<div class="row">
			<div class="col-sm-12 right">
				<c:if test= "${sessionEmpNo == null}">
					<a href="${pageContext.request.contextPath}/login">로그인</a>  <!-- LoginServlet -->
				</c:if>
				
				<c:if test="${sessionEmpNo != null }">
					<a href="${pageContext.request.contextPath}/logout">로그아웃</a>  <!-- LogoutServlet -->
				</c:if>
			</div>
		</div>
		<div class="row">
			<div>
				<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/employees/getEmployeesList">사원 목록(limit 10)</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/departments/getDepartmentsList">부서 목록</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/employees/getEmployeesListOrderBy?order=asc">오름 차순(limit 50)</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/employees/getEmployeesListOrderBy?order=desc">내림 차순(limit 50)</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/salaries/getSalariesStatistics">연봉 통계</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/titles/getTitlesListDistinct">업무 목록(Distinct)</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/employees/getEmployeesCountByGender">사원 수(group by gender)</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/departments/getDepartmentsCountByDeptNo">부서별 인원</a>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/employees/getEmployeesListByPage">사원 목록(10paging)</a></li>
					</ul>
				</nav>
			</div>
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<br><br><br><br>
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
			<div class="col-sm-1"></div>
		</div>
		<div class="text-center">
		<br><br>
		<form method="post" action="${pageContext.request.contextPath}/employees/getEmployeesListBetween">
			<input type = "number" name="begin" placeholder="${minEmpNo}">~<input type="number" name="end"placeholder="${maxEmpNo}">
			<button type="submit">사원목록</button>
		</form>
			<%-- 
			표현식 :employees table total row Count : <%=request.getAttribute("employeesRowCount")%>
			el : employees table total row Count : ${employeesRowCount}
			 --%><br><br><br><br>
		</div>
		<div class="center footer">copyright</div>
	</div>
</body>
</html>