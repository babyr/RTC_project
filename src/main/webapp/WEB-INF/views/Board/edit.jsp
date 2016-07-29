<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">
<script src="/RTC_project/res/se2/js/HuskyEZCreator.js" type="text/javascript"></script>
<script src="/RTC_project/res/se2/init.js" type="text/javascript"></script>
<style>
  input[name=title] { width: 700px; border-style: groove; margin: 4px;}
  textarea { width: 95%; height: 600px; }
</style>
<script>
$(function(){
	$("button#addFile").click(function(){
		var tag="<span>파일:</span><input type='file' name='file' multiple/><br/>";
		$(tag).appendTo("div#files");
	});
	$("button[data-id]").click(function(){
		$("input#fileId").val($(this).attr("data-id"));
	});
});
</script>
</head>
<body>
<h2>게시판</h2>
<hr/>

<form:form method="post" modelAttribute="board" enctype="multipart/form-data">
	<div>
		<span>제목:</span>
		<form:input path="title"/>
	</div>
	<form:textarea path="body" class="smarteditor2"/>
	<div>
		<span class="lbl">첨부파일:</span>
		<c:forEach var="file" items="${files }">
			<button type="submit" class="btn btn-small" name="cmd" value="deleteFile" data-id="${file.id }">
				<i class="icon icon-remove"></i>${file.fileName } 파일삭제
			</button>
		</c:forEach>
		<input type="hidden" id="fileId" name="fileId" value="0"/>
	</div>
	<div id="files">
		<span>파일:</span>
		<input type="file" name="file" multiple/><br/>
	</div>
	<div>
		<button type="submit" class="btn btn-primary" name="cmd" value="save">
			<i class="icon-ok icon-white"></i>저장하기
		</button>
		<a href="board.do?id=${board.id }&${pagination.queryString}" class="btn">
			<i class="icon-ban-circle"></i>취소
		</a>
		<button type="button" class="btn" id="addFile">
			<i class="icon-plus"></i>파일추가
		</button>
	</div>
</form:form>
</body>
</html>