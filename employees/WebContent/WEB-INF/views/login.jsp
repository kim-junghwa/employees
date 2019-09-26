<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인</h1>
	<form method="post" action="${pageContext.request.contextPath}/login">
		<div>
			사원 번호 : 
			<input type="text" name="empNo">
		</div>
		<div>
			사원 성 : 
			<input type="text" name="firstName">
		</div>
		<div>
			사원 이름 : 
			<input type="text" name="lastName">
		</div>
		<button type="submit">로그인</button>
	</form>
</body>
</html>