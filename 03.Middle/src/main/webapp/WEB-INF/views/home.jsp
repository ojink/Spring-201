<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	스마트 IoT 미들웨어 서버프로그램  
</h1>


<h3>고객관리</h3>
<!-- 요청 url 은 customer/list,   customer/info  두 가지 하기 -->
<div><a target="_blank" href="<c:url value='/customer/list'/>">전체목록조회</a></div>
<div><input type="text" id="query">
	<a target="_blank" href="" id="search">검색목록조회</a>
</div>
<hr>

<div><input type="text" id="id"><a target="_blank" id="info">고객조회</a></div>
<div><a target="_blank" id="delete">고객정보삭제</a></div>
<hr>


<div>안드로이드에서 데이터객체에 담아 json 문자열로 만들어 vo라는 파라미터로 보냄</div>
<div>고객번호: <input type="text" id="customer_id" value="44"> </div>
<div>고객명: <input type="text" id="name" value="새이름"> </div>
<div>성별: <input type="text" id="gender" value="남"> </div>
<div>이메일: <input type="text" id="email" value="new@naver.com"> </div>
<div>전화번호: <input type="text" id="phone" value="062-9874-9999"> </div>
<div><button id="change">정보변경</button></div>
<div><button id="register">신규등록</button></div>

<hr>
<h3>회원관리</h3>
<div>
아이디: <input type="text" id="user_id">
비번: <input type="password" id="user_pw">
<a href="" target="_blank" id="login">로그인 </a>
</div>

<script type="text/javascript" 
        		src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
$("#login").click(function(){
	$(this).attr("href"
			, "<c:url value='/member/login'/>?user_id=" + $("#user_id").val()
									+ "&user_pw=" + $("#user_pw").val())
})

$("#register").click(function(){
	var Customer = new Object();
	Customer.name = $("#name").val();
	Customer.gender = $("#gender").val();
	Customer.email = $("#email").val();
	Customer.phone = $("#phone").val();
	
	$.ajax({
		url: "<c:url value='/customer/insert'/>",
		data: { vo: JSON.stringify(Customer) }
	})
	
})

$("#change").click(function(){
	// Json 형태의 문자열 만들기 : { key: value }
	var Customer = {}; // new Object();
	Customer.customer_id = $("#customer_id").val();
	Customer.name = $("#name").val();
	Customer.gender = $("#gender").val();
	Customer.email = $("#email").val();
	Customer.phone = $("#phone").val();
	console.log( Customer )
	
	$.ajax({
		url: "<c:url value='/customer/update'/>",
		data: { vo: JSON.stringify(Customer) }
	}).done(function(){
	})
})

$("#delete").click(function(){
	$(this).attr("href"
				, "<c:url value='/customer/delete'/>?id=" + $("#id").val())
	
})

$("#info").on('click', function(){
	$(this).attr("href"
				, "<c:url value='/customer/info'/>?id=" + $("#id").val() )
})

$("#search").click(function(){
	$(this).attr("href"
			, "<c:url value='/customer/list'/>?query=" + $("#query").val() )
})

</script>
</body>
</html>














