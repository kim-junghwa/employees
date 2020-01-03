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
	<br>
	<div class="container">
		<div class="row">
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/employees/getEmployeesList">사원목록(limit 10)</a>
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
						<a class="nav-link" href="${pageContext.request.contextPath}/employees/getEmployeesListByPage">사원목록(10paging)</a>
					</li>
				</ul>
			</nav>
		</div>
		<br><br>
		<div class="row">
		<h2>뭐지?</h2>
			<div>
				<form method="get" action="${pageContext.request.contextPath}/deptEmp/getDeptEmpInnerJoinList">
					<select name="rowPerPage">
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="30">30</option>
						<option value="40">40</option>
						<option value="50">50</option>
					</select>
					<button type="submit">개씩 보기</button>
				</form>
			</div>
			<table border="1">
				<thead>
					<tr>
						<td>dept_no</td>
						<td>dept_name</td>
						<td>emp_no</td>
						<td>name</td>
						<td>to_date</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="deptEmp" items="${list}">
						<tr>
							<td>${deptEmp.departments.deptNo}</td>
							<td>${deptEmp.departments.deptName}</td>
							<td>${deptEmp.employees.empNo}</td>
							<td>${deptEmp.employees.firstName}</td>
							<td>${deptEmp.toDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${currentPage > 1}">
				<a href="${pageContext.request.contextPath}/deptEmp/getDeptEmpInnerJoinList?currentPage=${currentPage-1}&rowPerPage=${rowPerPage}">이전</a>
			</c:if>
			
			<c:forEach var="i" begin="${currentPage}" end="${currentPage + 10}">
				<a href="${pageContext.request.contextPath}/deptEmp/getDeptEmpInnerJoinList?currentPage=${i}&rowPerPage=${rowPerPage}">${i}</a>
			</c:forEach>
			
			<c:if test="${currentPage < lastPage}">
				<a href="${pageContext.request.contextPath}/deptEmp/getDeptEmpInnerJoinList?currentPage=${currentPage+1}&rowPerPage=${rowPerPage}">다음</a>
			</c:if>
		</div>
		<br><br>
		<div class="center copyright">copyright</div>
	</div>
</body>
</html>