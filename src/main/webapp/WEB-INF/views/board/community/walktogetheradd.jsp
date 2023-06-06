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
    <link rel="stylesheet" href="/animingle/asset/css/index.css">
    <link rel="stylesheet" href="/animingle/asset/css/walktogether.css">
    <link rel="icon" type="image/png" href="https://c.cksource.com/a/1/logos/ckeditor5.png">
	<link rel="stylesheet" type="text/css" href="/animingle/asset/ckeditor/sample/styles.css">
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
				
				<form method="post" action="/animingle/board/walktogetheradd.do">
					<div>
						<div class="menu-title">제목</div>
						<input type="text" name="subject" placeholder="제목을 입력해주세요.">
					</div>
					<div>
						<div class="menu-title">산책 루트</div>
						<div id="map3" style="width:100%;height:400px;"></div>
					</div>
					<div id="aboutInfo">
						<span>
							<span class="menu-title">반려동물 종</span>
							<input type="text" name="petKind" placeholder="예) 강아지">
						</span>
						<span>
							<span class="menu-title">산책 가능 요일/시간</span>
							<input type="text" name="walkTime" placeholder="예) 월수금 18시 이후">
						</span>
					</div>
					<div>
						<div class="main-content-sel3">
							<div class="menu-title">본문</div>
							<div class="centered">
								<div class="row row-editor">
									<div class="editor-container">
										<textarea class="editor" name="text" id="editor" placeholder="내용을 입력하세요.">
										</textarea>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="btns">
		            	<button type="button" id="del-btn" class="content-btn cancel-btn" onclick="history.back();">취 소</button>
						<button type="submit" id="add-btn" class="content-btn add-btn">등 록</button>
		            </div>
		            <div id="pathInfo">
		            </div>		                       
				</form>
			</div>
			<div class="rightbar">
				<!-- 오른쪽 사이드바 입니다. -->
			</div>
		</div>
    </section>
    <%@ include file="/WEB-INF/views/inc/footer.jsp" %>

<script src="/animingle/asset/ckeditor/build/ckeditor.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	6d88daddca380ab9ff45e48fab144915"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script>

    /*CKEditor5*/
    ClassicEditor.create( document.querySelector( '.editor' ), {
					licenseKey: '',
				} )
				.then( editor => {
					window.editor = editor;
				} )
				.catch( error => {
					console.error( 'Oops, something went wrong!' );
					console.error( 'Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:' );
					console.warn( 'Build id: wxum3antebby-dqjd5cbz4wpc' );
					console.error( error );
				} );
    
    
    /* 지도 생성 */
    
    var lat = 37.4993;
    var lng = 127.0331;

    var container = document.getElementById('map3');
    var options = {
        level: 4
    };

    var map;
    
    if (navigator.geolocation) {

        // GeoLocation을 이용해서 접속 위치를 얻어온다.
        navigator.geolocation.getCurrentPosition(function (position) {
            
            lat = position.coords.latitude, // 위도
            lng = position.coords.longitude; // 경도

            // 현재 위치를 받아온 후에 지도를 생성한다.
            options.center = new kakao.maps.LatLng(lat, lng);
            map = new kakao.maps.Map(container, options);      
            
            kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
                drawLine(mouseEvent);
            });
            kakao.maps.event.addListener(map, 'mousemove', function(mouseEvent) {
                mouseMoveEvent(mouseEvent);
            });
            kakao.maps.event.addListener(map, 'rightclick', function(mouseEvent) {
                mouseRightClick(mouseEvent);
            });

        }, function (error) {

            // 사용자가 위치 정보를 허용하지 않았을 경우, 기본 위치를 사용한다.
            options.center = new kakao.maps.LatLng(lat, lng);
            map = new kakao.maps.Map(container, options);     

            kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
                drawLine(mouseEvent);
            });
            kakao.maps.event.addListener(map, 'mousemove', function(mouseEvent) {
                mouseMoveEvent(mouseEvent);
            });
            kakao.maps.event.addListener(map, 'rightclick', function(mouseEvent) {
                mouseRightClick(mouseEvent);
            });
            
        });

    } else {

        // 브라우저가 Geolocation을 지원하지 않는 경우, 기본 위치를 사용한다.
        options.center = new kakao.maps.LatLng(lat, lng);
        map = new kakao.maps.Map(container, options);
   
        kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
            drawLine(mouseEvent);
        });
        kakao.maps.event.addListener(map, 'mousemove', function(mouseEvent) {
            mouseMoveEvent(mouseEvent);
        });
        kakao.maps.event.addListener(map, 'rightclick', function(mouseEvent) {
            mouseRightClick(mouseEvent);
        });
    }    
    
    
    /* 지도 경로 설정 */    
    var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
    var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체입니다
    var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
    var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
    var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.

    // 지도에 클릭 이벤트를 등록합니다
    // 지도를 클릭하면 선 그리기가 시작됩니다 그려진 선이 있으면 지우고 다시 그립니다    
    function drawLine(mouseEvent) {
        
        // 마우스로 클릭한 위치입니다 
        var clickPosition = mouseEvent.latLng;

        // 지도 클릭이벤트가 발생했는데 선을 그리고있는 상태가 아니면
        if (!drawingFlag) {

            // 상태를 true로, 선이 그리고있는 상태로 변경합니다
            drawingFlag = true;
            
            // 지도 위에 선이 표시되고 있다면 지도에서 제거합니다
            deleteClickLine();
            
            // 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
            deleteDistnce();

            // 지도 위에 선을 그리기 위해 클릭한 지점과 해당 지점의 거리정보가 표시되고 있다면 지도에서 제거합니다
            deleteCircleDot();
        
            // 클릭한 위치를 기준으로 선을 생성하고 지도위에 표시합니다
            clickLine = new kakao.maps.Polyline({
                map: map, // 선을 표시할 지도입니다 
                path: [clickPosition], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
                strokeWeight: 3, // 선의 두께입니다 
                strokeColor: '#0256AA', // 선의 색깔입니다
                strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
                strokeStyle: 'solid' // 선의 스타일입니다
            });
            
            // 선이 그려지고 있을 때 마우스 움직임에 따라 선이 그려질 위치를 표시할 선을 생성합니다
            moveLine = new kakao.maps.Polyline({
                strokeWeight: 3, // 선의 두께입니다 
                strokeColor: '#db4040', // 선의 색깔입니다
                strokeOpacity: 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
                strokeStyle: 'solid' // 선의 스타일입니다    
            });
        

                
        } else { // 선이 그려지고 있는 상태이면

            // 그려지고 있는 선의 좌표 배열을 얻어옵니다
            var path = clickLine.getPath();

            // 좌표 배열에 클릭한 위치를 추가합니다
            path.push(clickPosition);
            
            // 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다 
            clickLine.setPath(path);

            var distance = Math.round(clickLine.getLength());
            displayCircleDot(clickPosition, distance);
        }
    }
        
    // 지도에 마우스무브 이벤트를 등록합니다
    // 선을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 선의 위치를 동적으로 보여주도록 합니다
    function mouseMoveEvent(mouseEvent) {

        // 지도 마우스무브 이벤트가 발생했는데 선을 그리고있는 상태이면
        if (drawingFlag){
            
            // 마우스 커서의 현재 위치를 얻어옵니다 
            var mousePosition = mouseEvent.latLng; 

            // 마우스 클릭으로 그려진 선의 좌표 배열을 얻어옵니다
            var path = clickLine.getPath();
            
            // 마우스 클릭으로 그려진 마지막 좌표와 마우스 커서 위치의 좌표로 선을 표시합니다
            var movepath = [path[path.length-1], mousePosition];
            moveLine.setPath(movepath);    
            moveLine.setMap(map);
            
            var distance = Math.round(clickLine.getLength() + moveLine.getLength()), // 선의 총 거리를 계산합니다
                content = '<div class="dotOverlay distanceInfo">총거리 <span class="number">' + distance + '</span>m</div>'; // 커스텀오버레이에 추가될 내용입니다

        }             
    }              

    // 지도에 마우스 오른쪽 클릭 이벤트를 등록합니다
    // 선을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면 선 그리기를 종료합니다
    function mouseRightClick(mouseEvent) {

        // 지도 오른쪽 클릭 이벤트가 발생했는데 선을 그리고있는 상태이면
        if (drawingFlag) {
            
            // 마우스무브로 그려진 선은 지도에서 제거합니다
            moveLine.setMap(null);
            moveLine = null;  
            
            // 마우스 클릭으로 그린 선의 좌표 배열을 얻어옵니다
            var path = clickLine.getPath();
        
            // 선을 구성하는 좌표의 개수가 2개 이상이면
            if (path.length > 1) {

                // 마지막 클릭 지점에 대한 거리 정보 커스텀 오버레이를 지웁니다
                if (dots[dots.length-1].distance) {
                    dots[dots.length-1].distance.setMap(null);
                    dots[dots.length-1].distance = null;    
                }
                    
            } else {

                // 선을 구성하는 좌표의 개수가 1개 이하이면 
                // 지도에 표시되고 있는 선과 정보들을 지도에서 제거합니다.
                deleteClickLine();
                deleteCircleDot(); 
                deleteDistnce();

            }
            
            // 상태를 false로, 그리지 않고 있는 상태로 변경합니다
            drawingFlag = false;         
            

            //경로 정보 배열
    		let mas = path.map(item => item.Ma); //위도
            let las = path.map(item => item.La); //경도
    		
            for (let i=0; i<las.length; i++) {
                
        		$('#pathInfo').append(
            		    `<input type="hidden" name="pathLat" value="\${mas[i]}">
            		    <input type="hidden" name="pathLng" value="\${las[i]}">`	
            	);           
        		
            }
    		
        }  
    }    

    // 클릭으로 그려진 선을 지도에서 제거하는 함수입니다
    function deleteClickLine() {
        if (clickLine) {
            clickLine.setMap(null);    
            clickLine = null;        
        }
    }

    // 그려지고 있는 선의 총거리 정보와 
    // 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 삭제하는 함수입니다
    function deleteDistnce () {
        if (distanceOverlay) {
            distanceOverlay.setMap(null);
            distanceOverlay = null;
        }
    }

    // 선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여 
    // 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
    function displayCircleDot(position, distance) {

        // 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
        var circleOverlay = new kakao.maps.CustomOverlay({
            content: '<span class="dot"></span>',
            position: position,
            zIndex: 1
        });

        // 지도에 표시합니다
        circleOverlay.setMap(map);

        // 배열에 추가합니다
        dots.push({circle:circleOverlay, distance: distanceOverlay});
    }

    // 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거하는 함수입니다
    function deleteCircleDot() {
        var i;

        for ( i = 0; i < dots.length; i++ ){
            if (dots[i].circle) { 
                dots[i].circle.setMap(null);
            }

            if (dots[i].distance) {
                dots[i].distance.setMap(null);
            }
        }

        dots = [];
    }
    
</script>
</body>
</html>