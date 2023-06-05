<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Animingle</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<link rel="stylesheet" href="/animingle/asset/css/index.css">
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
                <div class="content-top">
                    <div class="content-title">산책 친구 구하기</div>
                </div>
    
                <div id="map" style="width:100%;height:800px;">
                </div>
                
                <div class="btn-div">
	                <button type="button" class="write-btn" onclick="window.location='http://localhost:8090/animingle/board/walktogetheradd.do';">
			         	<span class="material-symbols-outlined">
							edit_note
						</span>
			         	작성하기
		         	</button>
	         	</div>
    
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop"
                    id="modalBtn">
                    상세보기(마커로 버튼 변경 필요)
                </button>
    
                <!-- Modal -->
                <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                    aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="staticBackdropLabel">
                                    산책친구 구해요
                                    <span class="status">모집 중</span>
                                </h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <h6>산책 루트</h6>
                                <div id="map2" style="width:100%;height:300px;"></div>
                                <div class="walkInfo">
                                	<div class="petInfo">반려동물 종: 강아지</div>
                                	<div class="timeInfo">산책 가능 요일/시간: 5월 30일 19시 이후</div>
                                </div>
                                <div class="walkInfo">
                                	<div class="introInfo">우리 강아지 착해요</div>
                                	<div></div>
                                </div>
                                <div class="modal-footer">
                                	<div class="btn-div btn-margin">
						                <button type="button" class="write-btn">
								         	<span class="material-symbols-outlined">sms</span>
								         	채팅하기
							         	</button>
						         	</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="rightbar">
                    <!-- 오른쪽 사이드바 입니다. -->
                </div>
            </div>
        </div>
    </section>
    <%@ include file="/WEB-INF/views/inc/footer.jsp" %>
    
        <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	6d88daddca380ab9ff45e48fab144915"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
            integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
            crossorigin="anonymous"></script>
        <script>

        var lat = 37.4993;
        var lng = 127.0331;

        var container = document.getElementById('map');
        var options = {
            level: 3
        };

        var map; 
        var message;

        
        //TODO 메세지 받아오기 ('<div style="padding:5px;">여기에 계신가요?!</div>')
        if (navigator.geolocation) {        

            // GeoLocation을 이용해서 접속 위치를 얻어온다.
            navigator.geolocation.getCurrentPosition(function(position) {
                lat = position.coords.latitude, // 위도
                lng = position.coords.longitude; // 경도

                // 현재 위치를 받아온 후에 지도를 생성한다.
                options.center = new kakao.maps.LatLng(lat, lng);
                map = new kakao.maps.Map(container, options);

                displayMarker(options.center, message); // Call the function inside the callback
                
            }, function(error) {     

                // 사용자가 위치 정보를 허용하지 않았을 경우, 기본 위치를 사용한다.
                options.center = new kakao.maps.LatLng(lat, lng);
                map = new kakao.maps.Map(container, options);

                displayMarker(options.center, message); // Call the function inside the callback
                
            });

        } else { 

            // 브라우저가 Geolocation을 지원하지 않는 경우, 기본 위치를 사용한다.
            options.center = new kakao.maps.LatLng(lat, lng);
            map = new kakao.maps.Map(container, options);

            displayMarker(options.center, message); // Call the function inside the callback
        }

        // 지도에 마커와 인포윈도우를 표시하는 함수입니다
        function displayMarker(locPosition, message) {

            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({  
                map: map, 
                position: locPosition
            }); 

            var iwContent = message, // 인포윈도우에 표시할 내용
                iwRemoveable = true;

            // 인포윈도우를 생성합니다
            var infowindow = new kakao.maps.InfoWindow({
                content : iwContent,
                removable : iwRemoveable
            });

            // 인포윈도우를 마커위에 표시합니다 
            infowindow.open(map, marker);

            // 지도 중심좌표를 접속위치로 변경합니다
            map.setCenter(locPosition);      
        }

        </script>
</body>

</html>