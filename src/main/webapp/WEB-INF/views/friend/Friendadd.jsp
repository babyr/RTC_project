<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
$(function(){
	$("#p").click(function(){
		
		location.href="approve.do?id="+$(".p").attr("data-id");
	});
});
$(function(){
	$("#p_2").click(function(){
		
		location.href="approve.do?id="+$(".p").attr("data-id");
	});
});
function list_3(){
	$("#tab1").hide();
	$("#friend").show();
	$("#execute").show();
	$("#searchResult").show();
	
}
</script>
	<c:if test="${flist.size()>0}">
		<table class="add_table">
			<c:forEach var="user" items="${flist}">
				<tr >
					<c:if test="${user.id==present}">
					</c:if>
					<c:if test="${user.id!=present}">
					<td class="p" data-id="${ user.id }">${ user.loginId }<span>(${user.name})</span></td>
					<td style="padding-left: 70px!important;"><button id="p"type="button" class="btn_5" >수락</button><button id="p_2"type="button" class="btn_5">거절</button></td>
				
						
					
					</c:if>
					
					
				</tr>
			</c:forEach>
		</table>
		
	</c:if>
