<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3 class="mb-4">공지글정보</h3>

<table class="table tb-row">
<colgroup>
	<col width="180px">
	<col>
	<col width="120px">
	<col width="120px">
	<col width="100px">
	<col width="100px">
</colgroup>
<tr><th>제목</th>
	<td colspan="5">${vo.title }</td>
</tr>
<tr><th>작성자</th><td>${vo.name }</td>
	<th>작성일자</th><td>${vo.writedate }</td>
	<th>조회수</th><td>${vo.readcnt }</td>
</tr>
<tr><th>내용</th>
	<td colspan="5">${vo.content }</td>
</tr>
</table>

<div class="btn-toolbar justify-content-center gap-2">
	<button class="btn btn-primary" id="btn-list">목록으로</button>
	<button class="btn btn-primary" id="btn-modify">정보수정</button>
	<button class="btn btn-primary" id="btn-delete">정보삭제</button>
</div>

<script>
$("#btn-list").click(function(){
	location = "list";
})
$("#btn-modify").click(function(){

})
$("#btn-delete").click(function(){

})
</script>


</body>
</html>