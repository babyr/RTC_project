<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://netdna.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.7.js"></script>
<script src="/RTC_project/res/id_check.js" type="text/javascript"></script>
<style>
	label{
		margin-top:20px;
	}

</style>

</head>
<body>
<div class="container">
	<h1>회원가입</h1>
	
	<form:form method="POST" modelAttribute="user">
		<label>ID</label>
		<form:input path="loginId" id="id"/>
		<span id="idChk"></span>
		
		
		<label>passwd</label>
		<form:input path="passwd" showPasswd="true"/>
		
		<label>이름</label>
		<form:input path="name"/>
		
		<label>생년월일</label>
		<form:input path="birth"/>
		
		<label>전화번호</label>
		<form:input path="phoneNumber"/>
		
		<label>이메일</label>
		<form:input path="email"  type="email"/>
		
		<div>
			<button type="submit" class="btn btn-primary">회원가입</button>
			<a href="/RTC_project/index.jsp">처음으로</a>
		</div>
	</form:form>
	
	<c:if test="${not empty error }">
		<script>
			var error1 = "${error}";
			alert(error1);	
		</script>
	</c:if>
	<c:if test="${not empty success }">
		<script>
			var success = "${success}";
			alert(success);
		</script>
	</c:if>
	
</div>
</body>
</html>