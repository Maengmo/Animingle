<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>펫시터 모집 내역</title>
	<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
	<link rel="stylesheet" href="/animingle/asset/css/index.css">
	<link rel="stylesheet" href="/animingle/asset/css/mypetsitter.css">
</head>
<style>
	
</style>
<body>

	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	<section class="content">
		<div class="mycontainer">
			<div class="leftbar">
				<!-- 왼쪽 사이드바 입니다. -->
			</div>
			<div class="maincontent">
				<h2 class="title"> 펫시터 모집 내역 </h2>
				    
				<div class="pr-content">
					<table class="content">
						<tr>
							<th>내 펫시터 모집 내역</th>
						</tr>
						<tr>
							<td>
								골든 리트리버 3살 3일간 맡아주실 분~ 
								<div>
								<div class="state-ing">모집중</div>
								<small class="date">2023-05-12</small>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								천사 같은 고양이... 맡아 주실 분...
								<div>
								<div class="state-complete">완료</div>
								<small class="date">2023-05-10</small>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								밥만 챙겨주실 분 구해요 ㅜㅜ
								<div>
								<div class="state-complete">완료</div>
								<small class="date">2023-05-10</small>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								악마 고양이 봐주실 분..
								<div>
								<div class="state-complete">완료</div>
								<small class="date">2023-05-10</small>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								우리집 강아지 진짜 착해요 맡아주세요
								<div>
								<div class="state-complete">완료</div>
								<small class="date">2023-05-10</small>
								</div>
							</td>
						</tr>
					</table>
				</div>
				
			</div>
			<div class="rightbar">
				<!-- 오른쪽 사이드바 입니다. -->
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/views/inc/footer.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</body>
</html>