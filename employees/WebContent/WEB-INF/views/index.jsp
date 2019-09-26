<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
	.black {
		color : black
	}
	ul.a {
	  list-style-type: circle;
	}
	td {
		text-align : center;
	}
	.center {
		text-align : center;
	}
	.right {
		text-align : right
	}
</style>
</head>
<body class="container">
	<h1 class="center">Index</h1>
	<div>
		<a class="black" href="${pageContext.request.contextPath}/logout">로그아웃</a>
	</div>
	<div class="row">
		<div class="col-sm-3 input-group-prepend">
			<ul class="a">
				<li>
					<a class="black" href="${pageContext.request.contextPath}/departments/getDepartmentsList">부서 목록</a>
				</li>
				<li>
					<a class="black" href="${pageContext.request.contextPath}/employees/getEmployeesList">사원 목록</a>
				</li>
				<li>
					<div class="dropdown dropright">
						<a class="dropdown" data-toggle="dropdown">
	      					사원 목록 정렬
	    				</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="${pageContext.request.contextPath}/employees/employeesListOrderBy?order=asc">오름차순</a>
	      					<a class="dropdown-item" href="${pageContext.request.contextPath}/employees/employeesListOrderBy?order=desc">내림차순</a>
						</div>
					</div>
				</li>
				<li>
					<a class="black" href="${pageContext.request.contextPath}/titles/getTitlesListDistinct">업무목록</a>
				</li>
				<li>
					<a class="black" href="${pageContext.request.contextPath}/salaries/getSalariesStatistics">연봉 통계값</a>
				</li>
				<li>
					<a class="black" href="${pageContext.request.contextPath}/employees/getEmployeesCountByGender">사원 수</a>
				</li>
				<li>
					<a class="black" href="${pageContext.request.contextPath}/departments/getDepartmentsCountByDeptNo">현재 부서별 사원 수</a>
				</li>
				<li>
					<a class="black" href="${pageContext.request.contextPath}/employees/getEmployeesListByPage">사원 목록(페이징)</a>
				</li>
				<li>
					<form method="post" action="${pageContext.request.contextPath}/employees/getEmployeesListBetween">
						<input type="number" name="begin" value="${min}" class="form-control form-control">
						<input type="number" name="end" value="${max}" class="form-control form-control">
						<button type="submit" class="btn btn-sm btn-link black">사원목록</button>
					</form>
				</li>
			</ul>
		</div>
		<div class="col-sm-9">
			<table class="table">
				<thead style="background-color:Orange;">
					<tr>
						<td>테이블 명</td>
						<td>전체 행의 수</td>
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
						<td>DeptEmp</td>
						<td>${deptEmpRowCount}</td>
					</tr>
					<tr>
						<td>DeptManager</td>
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
	</div>
</body>
</html>