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

#home{
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
		<h2>사원목록(페이징)</h2>
		<div>
			<form method="get" action="${pageContext.request.contextPath}/employees/getEmployeesListByPage">
				<div class="row">
					<div class="col-sm-9"></div>
					<div class="col-sm-3">
						<div class="row">
							<div class="col-sm-2"></div>
							<div class="col-sm-6">
								<select name="rowPerPage" class="custom-select">
									<option value="10">10</option>
									<option value="20">20</option>
									<option value="30">30</option>
									<option value="40">40</option>
									<option value="50">50</option>
								</select>
							</div>
							<div class="col-sm-2">
								<button type="submit" class="btn btn-success btn-sm right">개</button>
							</div>
						</div>
					</div>
				</div>
				<br>
			</form>
		</div>
		<div>
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
		</div>
		<div class="auto">
			<ul class="pagination justify-content-center">
				<c:if test="${currentPage > 0 }">
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/employees/getEmployeesListByPage?currentPage=${currentPage-1}&rowPerPage=${rowPerPage}">이전</a></li>
				</c:if>
			
				<c:forEach var="i" begin="${start}" end="${end}">
					<c:if test="${currentPage == i}">
						<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/employees/getEmployeesListByPage?currentPage=${i}&rowPerPage=${rowPerPage}">${i}</a></li>
					</c:if>
					<c:if test="${currentPage != i}">
						<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/employees/getEmployeesListByPage?currentPage=${i}&rowPerPage=${rowPerPage}">${i}</a></li>
					</c:if>
				</c:forEach>
			
				<c:if test="${currentPage < lastPage }">
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/employees/getEmployeesListByPage?currentPage=${currentPage+1}&rowPerPage=${rowPerPage}">다음</a></li>
				</c:if>
			</ul>
		</div>
		<br><br>
	</div>
	<div class="footer">copyright</div>
	
</body>
</html>