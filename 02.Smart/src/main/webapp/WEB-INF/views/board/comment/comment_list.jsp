<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>     

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
		<div class="d-flex justify-content-between">
			<div class="d-flex align-items-center mb-2">
				<span class="me-2">
					<c:if test="${empty vo.profile}">
						<i class="font-profile fa-regular fa-user"></i>
					</c:if>
					<c:if test="${not empty vo.profile}">
						<img class="profile" src="${vo.profile}">
					</c:if>
				</span>
				<span>${vo.name} [ ${vo.writedate} ]</span>
			</div>
			
			<c:if test="${vo.writer eq loginInfo.user_id}">
			<div>
				<span class="me-4">댓글수정 [ <span class="writing">0</span> / 200 ]</span>
				<a class="btn btn-outline-info btn-sm btn-modify-save">수정</a>
				<a class="btn btn-outline-danger btn-sm btn-delete-cancel">삭제</a>
			</div>
			</c:if>
		</div>
		
		<div class="content">${fn: replace( fn: replace(vo.content, lf, "<br>"), crlf, "<br>") }</div>
	</div>
</c:forEach>

<script>
$(".btn-modify-save").click(function(){
	//수정
	var _comment = $(this).closest(".comment");
	modifyStatus( _comment );
})

//수정상태
function modifyStatus( _comment ){
	//버튼은 저장/취소
	_comment.find(".btn-modify-save").text("저장").removeClass("btn-outline-info").addClass("btn-primary");	
	_comment.find(".btn-delete-cancel").text("취소").removeClass("btn-outline-danger").addClass("btn-secondary");
}

</script>







	
	













