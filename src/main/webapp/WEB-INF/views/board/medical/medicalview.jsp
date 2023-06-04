<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>병원/약국 찾기</title>
	<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
	<link rel="stylesheet" href="/animingle/asset/css/index.css">
	<link rel="stylesheet" href="/animingle/asset/css/medicalview.css">
</head>

<body>

	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	<section class="content">
		<div class="mycontainer">
			<div class="leftbar" id="left">
				<!-- 왼쪽 사이드바 입니다. -->
				<table id="side">
					<tr class="tr" id="search">
						<th>
							<p style="color:#0256AA;"> 요기에 검색하세요! </p>
							<div id="search2">
								<input type="text" id="txt1" placeholder="입력하세요.">
								<span class="material-symbols-outlined">search</span>
						 	</div>
						 </th>
					</tr>
					<tr class="place-list">
						<th>온누리 약국 <small id="small">영업중</small>
						<br><small id="small2">서울시 강남구 역삼동</small></th>
					</tr>
					<tr class="place-list">
						<th>온누리 약국 <small id="small">영업중</small>
						<br><small id="small2">서울시 강남구 역삼동</small></th>
					</tr>
					<tr class="place-list">
						<th>온누리 약국 <small id="small">영업중</small>
						<br><small id="small2">서울시 강남구 역삼동</small></th>
					</tr>
					<tr class="place-list">
						<th>온누리 약국 <small id="small">영업중</small>
						<br><small id="small2">서울시 강남구 역삼동</small></th>
					</tr>
					<tr class="place-list">
						<th>온누리 약국 <small id="small">영업중</small>
						<br><small id="small2">서울시 강남구 역삼동</small></th>
					</tr>
					<tr class="place-list">
						<th>온누리 약국 <small id="small">영업중</small>
						<br><small id="small2">서울시 강남구 역삼동</small></th>
					</tr>
					<tr class="place-list">
						<th>온누리 약국 <small id="small">영업중</small>
						<br><small id="small2">서울시 강남구 역삼동</small></th>
					</tr>
				</table>
			</div>
			<div id="addside">
				
				<br>
				<h2 class="title">온누리 약국</h2>
				<hr>
				
				<h3 class="middle"><span class="material-symbols-outlined">location_on</span><span class="infoTxt">&nbsp;강남구 역삼동</span></h3>
				<h3 class="middle"><span class="material-symbols-outlined">timer</span><span class="infoTxt">&nbsp;영업 시간</span></h3>
				<h3 class="middle"><span class="material-symbols-outlined">phone_in_talk</span><span class="infoTxt">&nbsp;전화번호</span></h3>
				<hr>
				
				<h3 class="middle">리뷰</h3>
				
				<div class="review">"친절해요"<small class="count">30</small></div>
				<div class="review">"복약지도를 잘해줘요" <small class="count">30</small></div>
				<div class="review">"상담이 자세해요" <small class="count">30</small></div>
				<div class="review">"제품 종류가 다양해요" <small class="count">30</small></div>
				
				<hr>
				
				<div class="item-wrap">
                  <div class="item-header">
                     <div>
                        <img src="/animingle/asset/pic/pic.jpg" alt="프로필이미지" class="profile-img" id="profile-img"> 
                        <span class="item-id">밍글밍글(mingle77)</span>
                     </div>
                     <div class="recruit-state">
                        레이팅바
                     </div>
                  </div>
                  <div class="item-content">
                     좋아여~!
                  </div>
                  
                  <div class="item-config">
                     <span>[2023.06.02 (금)]</span>
                  </div>
               </div>
               
               <div class="item-wrap">
                  <div class="item-header">
                     <div>
                        <img src="/animingle/asset/pic/pic.jpg" alt="프로필이미지" class="profile-img" id="profile-img"> 
                        <span class="item-id">밍글밍글(mingle77)</span>
                     </div>
                     <div class="recruit-state">
                        레이팅바
                     </div>
                  </div>
                  <div class="item-content">
                     좋아여~!
                  </div>
                  
                  <div class="item-config">
                     <span>[2023.06.02 (금)]</span>
                  </div>
               </div>
               
               <div class="item-wrap">
                  <div class="item-header">
                     <div>
                        <img src="/animingle/asset/pic/pic.jpg" alt="프로필이미지" class="profile-img" id="profile-img"> 
                        <span class="item-id">밍글밍글(mingle77)</span>
                     </div>
                     <div class="recruit-state">
                        레이팅바
                     </div>
                  </div>
                  <div class="item-content">
                     좋아여~!
                  </div>
                  
                  <div class="item-config">
                     <span>[2023.06.02 (금)]</span>
                  </div>
               </div>
               
               <div class="item-wrap">
                  <div class="item-header">
                     <div>
                        <img src="/animingle/asset/pic/pic.jpg" alt="프로필이미지" class="profile-img" id="profile-img"> 
                        <span class="item-id">밍글밍글(mingle77)</span>
                     </div>
                     <div class="recruit-state">
                        레이팅바
                     </div>
                  </div>
                  <div class="item-content">
                     좋아여~!
                  </div>
                  
                  <div class="item-config">
                     <span>[2023.06.02 (금)]</span>
                  </div>
               </div>
               
               <hr>
               
               <div id="review-box"> 후기를 작성해 주세요.</div>
				
			   <div class="upload-file">
                    <input type="text" class="file-name" value="영수증 사진" placeholder="첨부파일" readonly>
                    <label for="pic"><span class="material-symbols-outlined" id="upload">upload_file</span></label> 
                    <input type="file" id="pic">
               </div>
               
               <div class="btn-div">
	         	<button type="button" id="write-btn" class="write-btn" onclick="window.location='http://localhost:8090/animingle/board/petsitteradd.do';">
		         	<span class="material-symbols-outlined">
						edit_note
					</span>
		         	리뷰쓰기
	         	</button>
	         </div>
			</div>
			<div class="maincontent">
				
	     	<div id="map">지도</div>
	    	
	    	</div>
			<div class="rightbar">
				<!-- 오른쪽 사이드바 입니다. -->
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/views/inc/footer.jsp" %>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b34a8317f5befe832f9eefe047ae818"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</body>
<script>
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스

	var options = { //지도를 생성할 때 필요한 기본 옵션
	   center: new kakao.maps.LatLng(37.4993, 127.0331), //지도의 중심좌표.
	   level: 3 //지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	$("#pic").on('change',function(){
        var fileName = $("#pic").val();
        $(".file-name").val(fileName);
    });
	
	$('.place-list').on('click', function(){
	    if ($('#addside').width() === 0) {
	        $('#addside').css('width', '500px');
	        $('#addside').css('overflow', 'scroll');
	        $('#addside').css('border-width', '1px');
	    } else {
	        $('#addside').css('width', '0');
	        $('#addside').css('overflow', 'hidden');
	        $('#addside').css('border-width', '0px');
	    }
	});
	
	$('#close').on('click', function(){
	    $('#addside').css('display', 'none');
	});
	
</script>
</html>