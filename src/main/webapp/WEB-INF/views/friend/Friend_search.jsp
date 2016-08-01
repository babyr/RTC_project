<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<style>
	tr{
		border:solid 1px;
	}
</style>
<c:if test="${list.size()==0}">
		<span>죄회결과 없음</span>
	</c:if>
	<c:if test="${list.size()>0}">
		<table class="table table-bordered">
			<c:forEach var="user" items="${list}">
				<tr class="p" data-id="${user.loginId}">
					<td>${ user.loginId }<span>(${ user.name })</span>
					<span class="add">+</span></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<script>
	$(function(){
	      $(".add").click(function(){
	         
	         location.href="Friend_add.do?id="+$(".p").attr("data-id");
	      });
	   });
	</script>



