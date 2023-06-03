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
			<div class="maincontent main-border">
				<div class="writer find-view-writer">
					<img src="/animingle/asset/commonimg/logo_01.png">
							밍글맹글(mingle77)
					<span class="time">16분전</span>
				</div>
				<div class="find-view-subject">
					<span id="view-subjcet">[펫 찾아요] 강남구 역삼동에서 아이를 잃어버렸어요...</span>
					<span class="material-symbols-outlined">visibility</span>50
					<span class="material-symbols-outlined">chat</span>2
				</div>
				<div class="find-view-content">
					역삼역 3번 출구 쪽 역삼 개나리공원에서 산책하다가 강아지를 잃어버렸습니다. <br>
					회색 푸들이고 나이는 3살입니다.<br>
					이름은 모찌입니다.
				</div>
				<div class="find-view-map" id="map">
					
				</div>
				<div class="view-button">
					<button id="btnEdit">수정하기</button>
					<button id="btnDel">삭제하기</button>
				</div>
				<div class="find-view-comment">
					<div>2개의 댓글</div>
					<div class="find-view-reply">
						<div class="writer">
							<img src="/animingle/asset/commonimg/logo_01.png">
							밍글맹글(mingle77)
							<span class="time">16분전</span>
						</div>
						<div class="content-list">
							어디 근처에서 봤어요. 꼭 찾길 바랄게요!!
						</div>
					</div>	
					<div class="find-view-write-comment">
						<img src="/animingle/asset/commonimg/logo_01.png">
						<textarea id="editor" placeholder="내용을 입력하세요."></textarea>
					</div>
				</div>
				<div class="find-view-comment-button">
					<button id="btnCommentAdd">댓글 쓰기</button>
				</div>
			</div>
			<div class="rightbar">
				<!-- 오른쪽 사이드바 입니다. -->
			</div>
		</div>
			
	</section>
	<%@ include file="/WEB-INF/views/inc/footer.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6b4f885d6bb97b2a4a23735b58ee2a8c"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script>
	var container = document.getElementById('map'); 
	var options = { 
		center: new kakao.maps.LatLng(37.4975, 127.0361), 
		level: 3 
	};
	
	var map = new kakao.maps.Map(container, options);
	
	var markerPosition  = new kakao.maps.LatLng(37.4975, 127.0361); 
	
	var marker = new kakao.maps.Marker({
		position: markerPosition
	});
	
	marker.setMap(map);
	
	ClassicEditor.create( document.querySelector( '#editor' ), {
	    removePlugins: [ 'Heading' ],
		language: "ko"
	});
</script>
</body>
</html>