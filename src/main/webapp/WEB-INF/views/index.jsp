<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Insert title here</title>
	<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
	<link rel="stylesheet" href="asset/css/index.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
</head>
<body>

	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	<section class="content">

		<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
			<div class="carousel-indicators">
			  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
				aria-current="true" aria-label="Slide 1"></button>
			  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
				aria-label="Slide 2"></button>
			  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
				aria-label="Slide 3"></button>
			  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3"
				aria-label="Slide 4"></button>
			  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4"
				aria-label="Slide 5"></button>
			</div>
			<div class="carousel-inner">
			  <div class="carousel-item active">
				<img src="asset/commonimg/banner_01.png" class="d-block w-100" alt="banner" style="width:100%;">
			  </div>
			  <div class="carousel-item">
				<img src="asset/commonimg/banner_02.png" class="d-block w-100" alt="banner" style="width:100%;">
			  </div>
			  <div class="carousel-item">
				<img src="asset/commonimg/banner_03.png" class="d-block w-100" alt="banner" style="width:100%;">
			  </div>
			  <div class="carousel-item">
				<img src="asset/commonimg/banner_04.png" class="d-block w-100" alt="banner" style="width:100%;">
			  </div>
			  <div class="carousel-item">
				<img src="asset/commonimg/banner_05.png" class="d-block w-100" alt="banner" style="width:100%;">
			  </div>
			</div>
		</div>
		<div class="mycontainer">
			<div class="leftbar">
				<!-- 왼쪽 사이드바 입니다. -->
			</div>
			<div class="maincontent">
				
			</div>
			<div class="rightbar">
				<!-- 오른쪽 사이드바 입니다. -->
			</div>
		</div>
			
	</section>
	<%@ include file="/WEB-INF/views/inc/footer.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>	
</body>
</html>