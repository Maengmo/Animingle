	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Animingle</title>
	<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
	<link rel="stylesheet" href="asset/css/index.css">
	<link rel="stylesheet" href="/animingle/asset/css/find.css">
	
	<style>
	

	
	</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	<section class="content">
		<div class="mycontainer">
			<div class="leftbar">
				<!-- 왼쪽 사이드바 입니다. -->
			</div>
			<div class="maincontent">
				<div class="find">
					우리 가족을 찾아주세요
				</div>
				<div id="search-click">
					<div class="prefix">주인 찾아요</div>
					<div class="prefix">펫 찾아요</div>
					<div class="prefix">전체보기</div>
				</div>
				<div id="search-bar">
					<input type="text" class="search">
					<button><span class="material-symbols-outlined">search</span></button>
				</div>
				<div class="find-content">
						<div class="writer">
							<img src="/animingle/asset/commonimg/logo_01.png">
							밍글맹글(mingle77)
							<span class="time">16분전</span>
						</div>
						<div class="content-list">
							<span class="content-prefix">[펫 찾아요]</span>
							강남구 역삼동에서 아이를 잃어버렸어요...
						</div>
						<div class="count">
							<span class="material-symbols-outlined">visibility</span>50
							<span class="material-symbols-outlined">chat</span>2
						</div>
				</div>
				<div class="find-content">
						<div class="writer view-writer">
							<img src="/animingle/asset/commonimg/logo_01.png">
							밍글맹글(mingle77)
							<span class="time">16분전</span>
						</div>
						<div class="content-list">
							<span class="content-prefix">[펫 찾아요]</span>
							강남구 역삼동에서 아이를 잃어버렸어요...
						</div>
						<div class="count">
							<span class="material-symbols-outlined">visibility</span>50
							<span class="material-symbols-outlined">chat</span>2
						</div>
				</div>	
				<div class="find-content">
						<div class="writer">
							<img src="/animingle/asset/commonimg/logo_01.png">
							밍글맹글(mingle77)
							<span class="time">16분전</span>
						</div>
						<div class="content-list">
							<span class="content-prefix">[펫 찾아요]</span>
							강남구 역삼동에서 아이를 잃어버렸어요...
						</div>
						<div class="count">
							<span class="material-symbols-outlined">visibility</span>50
							<span class="material-symbols-outlined">chat</span>2
						</div>
				</div>		
				<div>
					<button>작성하기</button>
				</div>
			<div class="rightbar">
				<!-- 오른쪽 사이드바 입니다. -->
			</div> 
		</div>
	</section>
	<%@ include file="/WEB-INF/views/inc/footer.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
	
</script>
</body>
</html>
