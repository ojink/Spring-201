<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     

<nav aria-label="Page navigation">
  <ul class="pagination mt-4 justify-content-center">
    <li class="page-item"><a class="page-link" href="#">Previous</a></li>

	<c:forEach var="no" begin="${page.beginPage}" end="${page.endPage}" step="1">
	<c:if test="${no eq page.curPage}">
	    <li class="page-item"><a class="page-link active" >${no}</a></li>
    </c:if>
	<c:if test="${no ne page.curPage}"> 
    	<li class="page-item"><a class="page-link" onclick="go_page(${no})">${no}</a></li>
    </c:if>
    
	</c:forEach>    
    
    <li class="page-item"><a class="page-link" href="#">Next</a></li>
  </ul>
</nav>

<script>
function go_page( no ){
	
}
</script>