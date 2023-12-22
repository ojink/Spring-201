<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
		<!-- category:cu -> 고객관리
		              hr -> 사원관리    
		-->
		<c:choose>
			<c:when test="${category eq 'cu'}"><c:set var="title" value="고객관리: "/></c:when>
			<c:when test="${category eq 'hr'}"><c:set var="title" value="사원관리: "/></c:when>
			<c:when test="${category eq 'no'}"><c:set var="title" value="공지사항: "/></c:when>
			<c:when test="${category eq 'bo'}"><c:set var="title" value="방명록: "/></c:when>
			<c:when test="${category eq 'da'}"><c:set var="title" value="공공데이터: "/></c:when>
			<c:when test="${category eq 'vi'}"><c:set var="title" value="시각화: "/></c:when>
		</c:choose>
        <title>${title}스마트 IoT 융합</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="<c:url value='/img/hanul.ico' />" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="<c:url value='/css/styles.css' />" rel="stylesheet" />
        <link href="<c:url value='/css/common.css' />" rel="stylesheet" />
    </head>
    <body>
        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light">
                	<a href="<c:url value='/'/>">
	                	<img src="<c:url value='/'/>img/hanul.logo.png" style="width:20%">
	                	<span>스마트 IoT 융합</span>
                	</a>
				</div>
                <div class="list-group list-group-flush">
                    <a class="${category eq 'cu' ? 'active' : ''} list-group-item list-group-item-action list-group-item-light p-3" 
                    		href="<c:url value='/list.cu'/>">고객관리</a>
                    <a class="<c:if test='${category == "hr"}'>active</c:if> list-group-item list-group-item-action list-group-item-light p-3" 
                    		href="<c:url value='/hr/list'/>">사원관리</a>
                    <a class="${category eq 'no' ? 'active' : ''} list-group-item list-group-item-action list-group-item-light p-3" 
                    		href="<c:url value='/notice/list'/>">공지사항</a>
                    <a class="${category eq 'bo' ? 'active' : ''} list-group-item list-group-item-action list-group-item-light p-3" 
                    		href="<c:url value='/board/list'/>">방명록</a>
                    <a class="${category eq 'da' ? 'active' : ''} list-group-item list-group-item-action list-group-item-light p-3" 
                    		href="<c:url value='/data/list'/>">공공데이터</a>
                    <a class="${category eq 'vi' ? 'active' : ''} list-group-item list-group-item-action list-group-item-light p-3" 
                    		href="<c:url value='/visual/list'/>">시각화</a>
                </div>
            </div>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Top navigation-->
                <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <div class="container-fluid">
                        <button class="btn btn-primary" id="sidebarToggle">Toggle Menu</button>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                                <li class="nav-item active"><a class="nav-link" href="#!">Home</a></li>
                                <li class="nav-item"><a class="nav-link" href="#!">Link</a></li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="#!">Action</a>
                                        <a class="dropdown-item" href="#!">Another action</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#!">Something else here</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!-- Page content-->
                <div class="container-fluid my-5">
                    <tiles:insertAttribute name="container"/>
                </div>
                
                <footer class="border-top py-4 text-center">
                	<div>Copyright &copy; My Website 2023</div>
                </footer>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="<c:url value='/'/>js/scripts.js"></script>
</body>
</html>