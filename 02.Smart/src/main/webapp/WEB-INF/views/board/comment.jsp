<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     

<div id="comment-regist" class="my-4 justify-content-center">
	<div class="w-pct80 justify-content-between d-flex mb-2">
		<span>댓글작성 [ <span class="writing">0</span> / 200 ]</span>
		<a class="btn btn-outline-primary btn-sm d-none btn-register">댓글등록</a>
	</div>
	<div class="comment w-pct80">
		<div class="form-control py-3 text-center guide">
		${empty loginInfo ? "댓글을 입력하려면 여기를 클릭후 로그인하세요" : "댓글을 입력하세요"}
		</div>
	</div>
</div>

<script>
$("#comment-regist .comment").click(function(){
	if( ${empty loginInfo} ){
		if( confirm("로그인 하시겠습니까?") ){
			$("form").attr("action", "<c:url value='/member/login'/>").submit();
		}
	}else{
		//클릭시마다 textarea가 추가되지 않도록 guide가 있을때만 추가
		if( $(this).children( ".guide" ).length == 1 ){
			$(this).append( "<textarea class='form-control'></textarea>" );
			$(this).children( "textarea" ).focus();
			$(this).children( ".guide" ).remove();
		}
	}
})

$(document)
.on("change keyup", "#comment-regist textarea", function(){
	var input = $(this).val();
	if( input.length > 200 ){
		alert("최대 200자까지 입력할 수 있습니다");
		input = input.substr(0,200);
		$(this).val( input );
	}
	
	$("#comment-regist .writing").text( input.length );
	if( input.length > 0 )	$(".btn-register").removeClass( "d-none" )
	else 					$(".btn-register").addClass( "d-none" )
})



</script>
<style>
.comment textarea { height: 90px }
</style>
















