<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
$(function(){
	$("#p").click(function(){
		
		location.href="approve.do?id="+$(".p").attr("data-id");
	});
});
</script>
	<c:if test="${flist.size()==0}">
		<span>죄회결과 없음</span>
	</c:if>
	<c:if test="${flist.size()>0}">
		<table class="table table-bordered">
			<c:forEach var="user" items="${flist}">
				<tr >
					<c:if test="${user.id==present}">
					<span>죄회결과 없음</span>
					</c:if>
					<c:if test="${user.id!=present}">
					<td class="p" data-id="${ user.id }">${ user.loginId }<span>${user.name}</span></td>
					<td><button id="p"type="button">수락</button></td>
					</c:if>
					
					
				</tr>
			</c:forEach>
		</table>
	</c:if>
	</form>
