<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3 class="mb-4">사원목록</h3>

<div class="row mb-2 ">
	<div class="col-auto">
		<a  class="btn btn-primary" href="register">신규사원등록</a>
	</div>
</div>

<table class="table tb-list">
<colgroup>
	<col width='80px'>
	<col width='250px'>
	<col width='300px'>
	<col>
	<col width='140px'>
</colgroup>
<tr>
	<th>사번</th>
	<th>사원명</th>
	<th>부서</th>
	<th>업무</th>
	<th>입사일자</th>
</tr>
<c:forEach items="${list }" var="vo">
<tr>
	<td>${vo.employee_id }</td>
	<td><a class="text-link" href="info?id=${vo.employee_id}">${vo.name }</a></td>
<%-- 	<td>${vo.last_name } ${vo.first_name }</td> --%>
	<td>${vo.department_name }</td>
	<td>${vo.job_title }</td>
	<td>${vo.hire_date }</td>
</tr>
</c:forEach>

</table>
</body>
</html>