<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="/RTC_project/res/se2/js/HuskyEZCreator.js" type="text/javascript"></script>
<script src="/RTC_project/res/se2/init.js" type="text/javascript"></script>
<style>
	input[name=title]{
		width:700px;
		border-style:groove;
		margin:4px;
	}
	textarea{
		width:95%;
		height:600px;
	}
</style>
<script>
$(function(){
	$("button#addFile").click(function(){
		var tag="<span>파일:</span><input type='file' name='file' mutiple/><br/>";
		$(tag).appendTo("div#files");
	});
});
</script>
</head>
<body>
<h2>게시판</h2>
<hr/>

<form method="post" enctype="multipart/form-data">
	<div>
		<span>제목:</span>
		<input type="text" name="title"/>
	</div>
	<textarea id="body" name="body" class="smarteditor2"></textarea>
	<div id="files">
		<span>파일:</span>
		<input type="file" name="file"/>
	</div>
	<div>
		<button type="submit" class="btn btn-primary">
			<i class="icon-ol icon-white"></i>저장하기
		</button>
		<a href="list.do?${pagination.queryString }" class="btn">
			<i  class="icon-ban-circle"></i>취소
		</a>
		<button type="button" class="btn" id="addFile">
			<i class="icon-plus"></i>파일추가
		</button>
	</div>
</form>
</body>
</html>