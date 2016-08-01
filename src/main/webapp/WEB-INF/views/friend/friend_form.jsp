<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="res/main.css" >
<link rel="stylesheet" href="res/my.css" >
<script src="http://code.jquery.com/jquery-1.7.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="friend_form">
	<input type="text" class="input"name="loginId" placeholder="사용자 이름 입력"/>
</form>
	<input type="button" class="btn_4" id="search_" value="검색" />
	<script>
	$('#search_').click(function(){
		
		$.ajax({
			url:'searchFriend.do',
			type:'post',
			data:$('#friend_form').serialize(),
			success:function(data){
				$("#ff").append(data);
			}
		});
	});
	</script>
<div id="ff">
</div>
<c:if test="${error eq false }">
					<script>
						alert("친구 신청중 이거나 이미 존재하는 친구 입니다.")
					</script>
				</c:if>
				<c:if test="${error eq true }">
					<script>
						alert("친구신청이 완료되었습니다.")
					</script>
				</c:if>

				
</body>
</html>