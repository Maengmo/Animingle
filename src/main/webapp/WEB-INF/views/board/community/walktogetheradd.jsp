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
   <link rel="stylesheet" href="/animingle/asset/css/walktogether.css">
</head>
<body>
    <%@ include file="/WEB-INF/views/inc/header.jsp" %>
    <section class="content">
        <div class="mycontainer">
            <div class="leftbar">
                <!-- 왼쪽 사이드바 입니다. -->
            </div>
            <div class="maincontent">
            	<h2 class="content-header">산책 친구 구하기</h2>
				<hr>
				
				<div>
					<div class="menu-title">제목</div>
					<input type="text" placeholder="제목을 입력해주세요.">
				</div>
				<div>
					<div class="menu-title">산책 루트</div>
					<div id="map3" style="width:100%;height:400px;"></div>
				</div>
				<div id="aboutInfo">
					<span>
						<span class="menu-title">반려동물 종</span>
						<input type="text" placeholder="예) 강아지">
					</span>
					<span>
						<span class="menu-title">산책 가능 요일/시간</span>
						<input type="text" placeholder="예) 월수금 18시 이후">
					</span>
				</div>
				<div>
					<div class="main-content-sel3">
						<div class="menu-title">본문</div>
						<textarea name="text" id="editor" placeholder="내용을 입력하세요."></textarea>
					</div>
				</div>
				<div id="btns">
	            	<button type="button" id="del-btn" class="content-btn cancel-btn" onclick="history.back();">취 소</button>
					<button type="button" id="add-btn" class="content-btn add-btn">등 록</button>
	            </div>
			</div>
			<div class="rightbar">
				<!-- 오른쪽 사이드바 입니다. -->
			</div>
		</div>
    </section>
    <%@ include file="/WEB-INF/views/inc/footer.jsp" %>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	6d88daddca380ab9ff45e48fab144915"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script>

   ClassicEditor.create( document.querySelector( '#editor' ), {
      removePlugins: [ 'Heading' ],
      language: "ko"
   });
   
   var container = document.getElementById('map3');
   var options = {
       center: new kakao.maps.LatLng(37.4993, 127.0331),
       level: 3
   };

   var map = new kakao.maps.Map(container, options);
   
</script>
</body>
</html>