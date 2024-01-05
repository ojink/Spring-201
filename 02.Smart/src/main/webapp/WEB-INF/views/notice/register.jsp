<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3 class="mb-4">공지글등록</h3>

<form method="post" action="insert">
<table class="table tb-row">
<colgroup>
	<col width="180px">
	<col>
</colgroup>
<tr><th>제목</th>
	<td><input type="text" autofocus class="form-control"  name="title"></td>
</tr>
<tr><th>내용</th>
	<td><textarea name="content" class="form-control" ></textarea></td>
</tr>
</table>
</form>

<div class="btn-toolbar justify-content-center gap-2">
	<button class="btn btn-primary px-4" id="btn-save">저장</button>
	<button class="btn btn-outline-primary px-4" id="btn-cancel">취소</button>
</div>

<script>
$("#btn-save").click(function(){
	$("form").submit()
})
$("#btn-cancel").click(function(){
	location = "list"
})
</script>


</body>
</html>