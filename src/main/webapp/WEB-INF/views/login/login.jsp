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
<body>
<sec:authorize access="not authenticated">
<form method="post" action="login_processing.do">
	<label>ID</label>
	<input type="text" name="loginId" />
	
	<label>PASSWORD</label>
	<input type="text" name="passwd" />
	<button type="submit" class="btn btn-primary">
		로그인
	</button>
</form>
<c:if test="${param.error !=null}">
	<div>실패</div>
</c:if>
</sec:authorize>
<sec:authorize access="authenticatited">
	<label>Id</label>
	<div><sec:authentication property="user.loginId"></sec:authentication></div>
	
	<laber>이름</laber>
	<div><sec:authentication property="user.name"></sec:authentication></div>
</sec:authorize>


</body>
</html>