<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<style>
	tr{
		border:solid 1px;
	}
</style>
<c:if test="${flist.size()==0}">
	</c:if>
	<c:if test="${flist.size()>0}">
		<table class="friend_table">
			<c:forEach var="user" items="${flist}">
				<tr >
				<c:if test="${present==user.friend_id }">
					<td><span id="span_">${ user.user_id }<span>(${user.name })</span></span></td>
				</c:if>
				<c:if test="${present!=user.friend_id }">
					<td><span id="span_">${ user.friend_id }<span>(${user.name })</span></span></td>
				</c:if>
				</tr>
			</c:forEach>
		</table>
	</c:if>




