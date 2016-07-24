<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-1.7.js"></script>

<body>
<sec:authorize access="not authenticated">
<form  method="post" action="login_processing.do">
	<label>ID</label>
	<input type="text" name="loginId" />
	
	<label>PASSWORD</label>
	<input type="password" name="passwd" />
	<button type="submit" class="btn btn-primary">
		로그인
	</button>
</form>
</sec:authorize>
<c:if test="${param.error!=null }">
	<script>
		alert("아이디 및 비밀번호를 다시 확인해 주세요");
	</script>
</c:if>

<sec:authorize access="authenticated">
	
	<label>Id</label>
	<div><sec:authentication property="user.loginId"></sec:authentication></div>
	
	<label>이름</label>
	<div><sec:authentication property="user.name"></sec:authentication></div>
	<form method="POST" action="logout.do">
	<button type="submit" class="btn btn-primary">
		로그아웃
	</button>
	</form>
</sec:authorize>


</body>
</html>