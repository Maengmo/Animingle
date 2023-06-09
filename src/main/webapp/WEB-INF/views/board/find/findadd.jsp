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
				<h2 class="main-title">우리 가족을 찾아주세요</h2>
				<hr>
				<form id="form-content" action="/animingle/board/findadd.do" method="POST">
					<div class="form-prefix">
						<div>말머리</div>
						<select name="prefix">
							<option value="1" class="ff_prefix">주인 찾아요</option>
							<option value="2" class="ff_prefix">펫 찾아요</option>
						</select>
					</div>
					<div class="form-subject">
						<div>제목</div>
						<div><input type="text" name="subject" id="ff_subject" placeholder="제목을 입력해주세요."></div>
					</div>
					<div class="form-locate">
						<div>위치</div>
						<div class="map" id="map"></div>
					</div>
					<div class="form-content">
                        <div>본문</div>
                        <div id="toolbar-container"></div>
                       	<div id="editor">
                       	</div>
                        <textarea style="display:none;" name="content" id="editor1"></textarea>
                    </div>
					<div class="btn-div">
						<button type="submit" id="add-btn" class="content-btn add-btn">등 록</button>
	            		<button type="button" id="del-btn" class="content-btn cancel-btn" onclick="history.back();">취 소</button>
				    </div>
				    <input type="hidden" name="writer" value="pecan789">
				    <input type="hidden" name="lat" id="lat-value" value="37.4993">
				    <input type="hidden" name="lng" id="lng-value" value="127.0331">
				</form>
				
			</div>
			<div class="rightbar">
				<!-- 오른쪽 사이드바 입니다. -->
			</div>
		</div>
			
	</section>
	<%@ include file="/WEB-INF/views/inc/footer.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6b4f885d6bb97b2a4a23735b58ee2a8c"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/decoupled-document/ckeditor.js"></script>
<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script src="/animingle/asset/js/ckedit.js"></script>
<script>
	var container = document.getElementById('map'); 
	var options = { 
		center: new kakao.maps.LatLng(37.4993, 127.0331), 
		level: 3 
	};
	
	var map = new kakao.maps.Map(container, options);
	
	 
	var marker = new kakao.maps.Marker({
		position: map.getCenter()
	});
	
	
	marker.setMap(map);
	
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
		
		var latlng = mouseEvent.latLng;
		
		marker.setPosition(latlng);
		
		$('#lat-value').val(latlng.getLat());
		$('#lng-value').val(latlng.getLng());
		
	});
	
</script>
</body>
</html>