<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     


<!-- 댓글이 없는 경우 -->
<c:if test="${empty list}">
	<div class="py-3 text-center">
		<div class="fs-5">등록된 댓글이 없습니다</div>
		<div>첫번째 댓글을 남겨주세요</div>
	</div>
</c:if>	
<!-- 댓글이 있는 경우 -->
<c:forEach items="${list}" var="vo">
	<div class="comment w-pct80 py-3 border-bottom">
		<div class="d-flex align-items-center mb-2">
			<span class="me-2">
				<i class="font-profile fa-regular fa-user"></i>
			</span>
			<span>${vo.name} [ ${vo.writedate} ]</span>
		</div>
		<div class="content">${vo.content}</div>
	</div>
</c:forEach>

	
