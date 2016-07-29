<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<style>
	div.board-header span.title{
		font-size:14pt; font-weight:bold;
	}
	div.board-header span.lbl{
		color:#999;
	}
	div.board-header span.tet{
		margin-right:40px;
	}
	div.body{
		min-height:400px;
	}
</style>
</head>
<body>
<div class="pull-right">
	<c:if test="${canEdit }">
		<a href="edit.do?id=${board.id }&${pagination.queryString}" class="btn">
			<i class="icon-pencil"></i>수정
		</a>
	</c:if>
	<c:if test="${canDelete }">
		<a href="delete.do?id=${board.id }&${pagination.queryString}" class="btn" data-confirm="삭제하시겠습니까?">
			<i class="icon-remove"></i>삭제
		</a>
	</c:if>
	<a href="list.do?${pagination.queryString }" class="btn">
		<i class="icon-list">목록으로</i>
	</a>
</div>

<h2>게시판</h2>
<hr/>

<div class="board-header">
	<span class="lbl">제목:</span><span class="title">${ board.title }</span>
	<hr/>
	<span class="lbl">글번호:</span><span class="txt">${ board.no }</span>
	<span class="lbl">작성자:</span><span class="txt">${ board.name }</span>
	<span class="lbl">작성일:</span><span class="txt">
		<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${ board.writeTime }"/></span>
	<span class="lbl">조회수:</span><span class="txt">${ board.readCount }</span>
	<span class="lbl">첨부파일:</span>
	<c:forEach var="file" items="${files }">
		<a class="btn btn-small" href="/RTC_project/Board/download.do?id=${file.id }"><i class="icon icon-file"></i>${file.fileName }</a>
	</c:forEach>
</div>
<div class="body">${ board.body }</div>
</body>
</html>