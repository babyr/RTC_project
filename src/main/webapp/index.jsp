<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="res/main.css" >
<link rel="stylesheet" href="res/my.css">

<script src="http://code.jquery.com/jquery-1.7.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	

</head>
<script>
var ch=0;

$(function(){
    $(".slide").click(function(){
       $("#side__").css("visibility","visible");
    });
})	;
$(function(){

	 $("#main").click(function(){
	       $("#side__").css("visibility","hidden");

	});
});
		


$(function(){
    $(".slide").click(function(){
    	$("#searchResult").load("searchFriend.do");
    });  
 });
function list()
{  
$("#search_friend_").load("searchFriend.do",param); 
}
function logout(){
	location.href="logout.do";
}
 $(function(){
	$("#msg").click(function(){
		$("#tab1").load("searchFriend_adding.do");
		if(ch++ % 2 == 0){
			$("#tab1").show('fast',function(){
				$("#friend").hide();
				$("#searchResult").hide();
				$("#execute").hide();
			});
			}
		else{
			$("#tab1").hide('fast');
			$("#friend").show();
			$("#searchResult").show();
			$("#execute").show();
			
		
		}
	});
 });
</script>
<body>
	<div id="wrapper">
		<header id="header">
		<h1>RTC_project</h1>
		<nav class="links">
		<ul>
			<li><a href="#">Lorem</a></li>
			<li><a href="#">Ipsum</a></li>
			<li><a href="#">Feugiat</a></li>
			<li><a href="#">Tempus</a></li>
			<li><a href="#">Adipiscing</a></li>
			<li><span >메뉴</span></li>
		</ul>
		</nav> <nav class="main" >
		<li class="slide" > Login </li>
		</nav> </header>
		<div id="main">
			<article class="post"> <header>
			<div class="title">
				<h2>Lorem ipsum dolor amet nullam consequat etiam feugiat</h2>
				
			</div>
			</header> <a href="User/login.do">로그인</a> <a href="User/member.do">회원가입</a> <a
				href="Board/list.do">게시판 리스트</a> <a href="/RTC_project/views/User/qqq.html">임시</a><a href="/asd.do">임시1</a></article>
		</div>

	</div>

	<div id="side__">
		<sec:authorize access="not authenticated">
			<div class="fault">Login</div>

			<form method="post" action="login_processing.do">

				<input class="input" type="text" name="loginId" placeholder="ID" />
				<input class="input" type="password" name="passwd"
					placeholder="PASSWORD" />
					<c:if test="${param.error!=null}">
				<div style="color:red; margin-left:80px;">아이디,패스워드를 확인하세요</div>
			</c:if>
				<button type="submit" class="btn">login</button>
			</form>
			
			<form method="post">
				<button type="submit" id="member" class="btn_register">회원가입</button>
				<script>
						$(function(){
							$("#member").click(function(){
								window.open('/RTC_project/User/member.do','',"width=500, height=800, left=100, top=100,scrollbars=no")
							})
						})
						</script>
			</form>
		</sec:authorize>
		<sec:authorize access="authenticated">
			<div class="falut_">
				<div class="img">

					<div id="id">
						<sec:authentication property="user.loginId" />
						<div style="width: 100px;">
							<sec:authentication property="user.name" />
						</div>
						<div style="width: 180px;">
							<sec:authentication property="user.email" />
						</div>
						<div id="container">
						<button type="button" id="edit"class="btn_5">정보수정</button>
						<script>
						$(function(){
							$("#edit").click(function(){
								window.open('/RTC_project/User/edit.do','',"width=auto, height=auto, left=auto, top=auto")
							})
						})
						</script>
						<button type="button" id="msg" class="btn_5">쪽지</button>
						<button type="button" onclick="logout()"class="btn_5">로그아웃</button>
						 <div class="tab_container">
						  <div id="tab1" class="tab_content">
						  	
						  </div>
						  
						 </div>
		
					</div>
				</div>
			</div>
			</div>
			<div id="friend">
				Friend<span></span>
			</div>
			<div id="searchResult"></div>
			<button type="button" id="execute" class="btn_register" >Friend Add</button>
			<script>
			$('#execute').click(function(){
				var win;
				win = window.open('/RTC_project/friend_form.do','', "width=10, height=10, scrollbars=no, status=no,resizable=no");
				win.opener.self;
				
				function resizeWindow(win){
					var wid = win.document.body.offsetWidth+30;
					var hei = win.document.body.offsetHeight + 40;
					win.resizeTo(wid,hei);
				}

				
			});
			</script>
		</sec:authorize>

	</div>


</body>
</html>
