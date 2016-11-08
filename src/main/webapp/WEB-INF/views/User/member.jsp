<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/RTC_project/res/main.css" >
<link rel="stylesheet" href="/RTC_project/res/my.css">
<script src="http://code.jquery.com/jquery-1.7.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="/RTC_project/res/id_check.js" type="text/javascript"></script>
<style>
	label{
		margin-top:20px;
	}
	#idChk{
		margin-left:50px;
	}
</style>

</head>
<body style="padding-top:20px !important">
<div id="title_">회원가입</div>
<div class="container" style="padding-top:20px !important">
	
	<form:form method="POST" modelAttribute="user">
		<label id="label_">ID</label>
		<form:input path="loginId" id="id" class="input"/>
		<span id="idChk"></span>
		
		
		<label id="label_">passwd</label>
		<form:input path="passwd" showPasswd="true" class="input"/>
		
		<label id="label_">이름</label>
		<form:input path="name" class="input"/>
		
		<label id="label_">생년월일</label>
		<form:input path="birth" class="input"/>
		
		<label id="label_">전화번호</label>
		<form:input path="phoneNumber" class="input"/>
		
		<label id="label_">이메일</label>
		<form:input path="email"  type="email" class="input"/>
		
		<div>
			<button type="submit" class="btn btn-primary" style="margin-left:240px !important;">회원가입</button>
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