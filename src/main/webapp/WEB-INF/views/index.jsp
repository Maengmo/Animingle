<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
	<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
	<link rel="stylesheet" href="/animingle/asset/css/index.css">
</head>
<body>

	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	<section class="content">
		<div id="carouselExampleIndicators" class="carousel slide carousel-fade" data-bs-ride="true" data-bs-interval="2500">
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
					<img src="asset/commonimg/banner_01.png" class="d-block w-100" alt="banner">
				</div>
				<div class="carousel-item">
					<img src="asset/commonimg/banner_02.png" class="d-block w-100" alt="banner">
				</div>
				<div class="carousel-item">
					<img src="asset/commonimg/banner_03.png" class="d-block w-100" alt="banner">
				</div>
				<div class="carousel-item">
					<img src="asset/commonimg/banner_04.png" class="d-block w-100" alt="banner">
				</div>
				<div class="carousel-item">
					<img src="asset/commonimg/banner_05.png" class="d-block w-100" alt="banner">
				</div>
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide="prev">
				<span class="material-symbols-outlined" aria-hidden="true">navigate_before</span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide="next">
				<span class="material-symbols-outlined" aria-hidden="true">navigate_next</span>
				<span class="visually-hidden">Next</span>
			</button>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script> -->
</body>
<script>
  document.addEventListener('DOMContentLoaded', function () {
    var myCarousel = document.querySelector('#carouselExampleIndicators')
    var carousel = new bootstrap.Carousel(myCarousel, {
      interval: 3000,
      ride: 'carousel'
    })
  });
</script>
</html>