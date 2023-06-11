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
	<link rel="stylesheet" href="/animingle/asset/css/subindex.css">
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
			<div class="mycontainer-sub-box">
				<div>
					<div class="sub-box">
						<div class="sub-box-list-tile">
							와글와글
						</div>
						<div class="sub-box-list-content">
							<c:forEach items="${ wlist }" var="wdto">
								<div class="sub-content-box" onclick="location.href='/animingle/board/wagleview.do?&seq=${wdto.wg_seq}'">
									<div class="sub-content-info">
										<div class="sub-user-info">
											<img src="/animingle/asset/pic/animingle.png">
											<div>
												${ wdto.wg_nickname } <small>(${ wdto.wg_writer })</small>
											</div>
										</div>
										<div class="date">${ wdto.wg_regdate }</div>
									</div>
									<div class="sub-content-subject">
										<div class="title">[${ wdto.wg_prefix }]${ wdto.wg_subject }</div>
										<div class="content-views">
											<span class="material-symbols-outlined">visibility</span> 
											<span class="views-count">${ wdto.wg_readcount }</span>
											<span class="material-symbols-outlined">chat</span> 
											<span class="views-count">${ wdto.wg_ccnt }</span>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="sub-box">
						<div class="sub-box-list-tile">
							수의사QnA
						</div>
						<div class="sub-box-list-content">
							123
						</div>
					</div>
				</div>
			</div>
			<div class="mycontainer-sub-box">
				<div>
					<div class="sub-box">
						<div class="sub-box-list-tile">
							우리 가족을 찾아주세요
						</div>
						<c:forEach items="${ flist }" var="fdto">
							<div class="sub-content-box" onclick="location.href='/animingle/board/findview.do?&seq=${fdto.seq}&page=1'">
								<div class="sub-content-info">
									<div class="sub-user-info">
										<img src="/animingle/asset/pic/animingle.png">
										<div>
											${ fdto.nickname } <small>(${ fdto.writer })</small>
										</div>
									</div>
									<div class="date">${ fdto.regdate }</div>
								</div>
								<div class="sub-content-subject">
									<c:if test="${ fdto.prefix == 1 }">
										<div class="title">[주인 찾아요]${ fdto.subject }</div>
									</c:if>
									<c:if test="${ fdto.prefix == 2 }">
										<div class="title">[펫 찾아요]${ fdto.subject }</div>
									</c:if>
									<div class="content-views">
										<span class="material-symbols-outlined">visibility</span> 
										<span class="views-count">${ fdto.readcount }</span>
										<span class="material-symbols-outlined">chat</span> 
										<span class="views-count">${ fdto.ffc_cnt }</span>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="sub-box">
						<div class="sub-box-list-tile">
							펫시터
						</div>
						<div class="sub-box-list-content">
							123
						</div>
					</div>
				</div>
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