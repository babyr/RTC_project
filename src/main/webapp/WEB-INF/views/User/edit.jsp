<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../res/main.css" >
<link rel="stylesheet" href="../res/my.css" >
<script src="http://code.jquery.com/jquery-1.7.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
</head>
<body style="padding-top:20px !important">
<div id="title_">정보 수정</div>
<div class="container" style="padding-top:20px !important;">
	
	
	<form:form  modelAttribute="user" method="post">
		<label id="label_">ID</label>
		<form:input class="input" path="loginId" readonly="true"/>
		
		<label id="label_">passwd</label>
		<form:input class="input" path="passwd" type="password"/>

		<label id="label_">이름</label>
		<form:input class="input" path="name" />
		
		<label id="label_">생년월일</label>
		<form:input class="input" path="birth"/>
		
		<label id="label_">전화번호</label>
		<form:input class="input" path="phoneNumber"/>
		
		<label id="label_">이메일</label>
		<form:input class="input" path="email"  type="email"/>
		
		<div>
			<button type="submit"  class="btn btn-primary" style="margin-left: 240px !important;">저장</button>
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