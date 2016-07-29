<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<c:if test="${flist.size()==0}">
		<span>죄회결과 없음</span>
	</c:if>
	<c:if test="${flist.size()>0}">
		<table class="table table-bordered">
			<c:forEach var="user" items="${flist}">
				<tr >
				<c:if test="${present==user.friend_id }">
					<td>${ user.user_id }</td>
				</c:if>
				<c:if test="${present!=user.friend_id }">
					<td>${ user.friend_id }</td>
				</c:if>
				</tr>
			</c:forEach>
		</table>
	</c:if>
