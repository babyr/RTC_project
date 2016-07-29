<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://netdna.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<title>Insert title here</title>
<style>
	td:nth-child(5){
		width:40px;
		text-align:right;
	}
</style>
<script>
	$(function(){
		$("tr[data-url]").click(function(){
			location.href=$(this).attr("data-url");
		});
	});
</script>
</head>
<body>
<h2>게시판</h2>
<hr/>

<form:form method="get" modelAttribute="pagination" class="pagination">
	<input type="hidden" name="pg" value="1"/>
	
	<div class="pull-right">
		<sec:authorize access="authenticated">
    		<a href="create.do?${ pagination.queryString }" class="btn btn-info">
        		<i class="icon-pencil icon-white"></i> 글쓰기
    		</a>
		</sec:authorize>

	</div>
	<div class="form-inline">
		<form:select path="ss">
			<form:option value="0" label="검색조건"/>
			<form:option value="1" label="작성자"/>
			<form:option value="2" label="제목"/>
			<form:option value="3" label="제목+내용"/>
		</form:select>
		<form:input path="st"/>
		<button type="submit" class="btn btn-small">검색</button>
		<c:if test="${pagination.ss!=0 }">
			<a href="list.do" class="btn btn-small">취소</a>
		</c:if>
	</div>
	
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>no</th>
				<th>제목</th>
				<th>작성자</th>
				<th>시각</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="board"  items="${list }">
				<tr data-url="board.do?id=${board.id}&${pagination.queryString }">
					<td>${board.no }</td>
					<td>${board.title }</td>
					<td>${board.name }</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${board.writeTime}"/></td>
					<td>${board.readCount }</td>
				</tr>	
			</c:forEach>
		</tbody>
	</table>
	
	<form:select path="sz" data-auto-submit="true">
		<form:option value="10"/>
		<form:option value="15"/>
		<form:option value="30"/>
		<form:option value="100"/>
	</form:select>
	
	<div class="pagination pagination-small pagination-centered">
		<ul>
			<c:forEach var="page" items="${pagination.pageList }">
				<li class="${page.cssClass }"><a data-page="${page.number }">${page.label }</a>
			</c:forEach>
		</ul>
	</div>
</form:form>
</body>
</html>