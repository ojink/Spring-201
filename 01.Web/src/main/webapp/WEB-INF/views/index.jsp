<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="<c:url value='/'/>">홈으로</a>
	<hr>
	<h3>테스트 결과(${type }객체사용)</h3>
	<div>오늘날짜: ${today }</div>
	<div>현재시각: ${now }</div>
</body>
</html>