<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Animingle</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<link rel="stylesheet" href="/animingle/asset/css/index.css">
<link rel="stylesheet" href="/animingle/asset/css/walktogether.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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

			<c:if test="${id != null}">
            <div class="btn-div">
                <button type="button" class="write-btn" onclick="window.location='http://localhost:8090/animingle/board/walktogetheradd.do';">
                    <span class="material-symbols-outlined">
                        edit_note
                    </span>
                    작성하기
                </button>
            </div>
            </c:if>

            <!-- Modal -->
            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5">
							    <span id="staticBackdropLabel"></span>
							    <span class="status">모집 중</span>
							</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <h6>산책 루트</h6>
                            <div></div>
                            <div id="map2" style="width:100%;height:300px;"></div>
                            <ul class="walkInfo basicInfo">
                                <li>반려동물 종: <span class="petInfo" id="petInfo"></span></li>
                                <li>산책 가능 요일/시간: <span class="timeInfo" id="timeInfo"></span></li>
                            </ul>
                            <div class="walkInfo">
                                <div class="introInfo" id="introInfo"></div>
                                <div></div>
                            </div>
                            <div class="modal-footer">
                                <div class="btn-div btn-margin">
                                	<span id="editBtns"></span>
				            		<span id="chatBtn"></span>
                                </div>
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
</section>
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>
    
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	6d88daddca380ab9ff45e48fab144915"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
    integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
    crossorigin="anonymous"></script>
<script>

	

    var lat = 37.4993;
    var lng = 127.0331;

    var container = document.getElementById('map');
    var options = {
        level: 4
    };

    var map;
    
    
    
    

    /* 현재 위치 받아서 기본 지도 화면 출력하기 */
    if (navigator.geolocation) {

        // GeoLocation을 이용해서 접속 위치를 얻어온다.
        navigator.geolocation.getCurrentPosition(function (position) {
            
            lat = position.coords.latitude, // 위도
            lng = position.coords.longitude; // 경도

            // 현재 위치를 받아온 후에 지도를 생성한다.
            options.center = new kakao.maps.LatLng(lat, lng);
            map = new kakao.maps.Map(container, options);
            
            boundInfo(map);
            kakao.maps.event.addListener(map, 'bounds_changed', function() {
                boundInfo(map);
            });
            
        }, function (error) {

            // 사용자가 위치 정보를 허용하지 않았을 경우, 기본 위치를 사용한다.
            options.center = new kakao.maps.LatLng(lat, lng);
            map = new kakao.maps.Map(container, options);

            boundInfo(map);
            kakao.maps.event.addListener(map, 'bounds_changed', function() {
                boundInfo(map);
            });      

        });

    } else {

        // 브라우저가 Geolocation을 지원하지 않는 경우, 기본 위치를 사용한다.
        options.center = new kakao.maps.LatLng(lat, lng);
        map = new kakao.maps.Map(container, options);

        boundInfo(map);
        kakao.maps.event.addListener(map, 'bounds_changed', function() {
            boundInfo(map);
        });       
    }    
    
    /* 지도가 이동, 확대, 축소로 인해 지도영역이 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다 */
    function boundInfo(map) {  
        
	    // 지도 영역정보를 얻어옵니다 
	    var bounds = map.getBounds();
	    
	    // 영역정보의 남서쪽 정보를 얻어옵니다 
	    var sw = bounds.getSouthWest();
	    
	    // 영역정보의 북동쪽 정보를 얻어옵니다 
	    var ne = bounds.getNorthEast();
	    
	    $.ajax({
	        type: 'POST',
	        url: '/animingle/board/walktogetherlist.do',
	        data: {
	            swLat: sw.getLat(),
	            swLng: sw.getLng(),
	            neLat: ne.getLat(),
	            neLng: ne.getLng()
	        },
	        dataType: 'json',
	        success: (result)=>{
	            
	            var positions = [];
	         	
	        	/* 모달창에 전달해야 하는 정보 
	        		- 반려동물종(wt_petKind)
	        		- 산책가능요일/시간(wt_time)
	        		- 본문(wt_content)
	        		- 글쓴이 아이디(wt_id)
	        		- 글 번호(wt_seq)
	        		- 경로 정보(pathlist)
	        	*/	        	   
	        	
	            $(result).each((index, item)=>{
	                
	                var filteredPlist = item.plist.filter(subList => subList[0] === item.wt_seq);
	                
	                //시작 위경도
	                var filteredBeginPath = item.plist.filter(subList => subList[0] === item.wt_seq && subList[1] == '1');	           
	                var beginLat = filteredBeginPath.map(subList => subList[2]);
	                var beginLng = filteredBeginPath.map(subList => subList[3]);	                
	                
	                //두 번째 위경도
	                var filteredCenterPath = item.plist.filter(subList => subList[0] === item.wt_seq && subList[1] == '2');       
	                var centerLat = filteredBeginPath.map(subList => subList[2]);
	                var centerLng = filteredBeginPath.map(subList => subList[3]);
	                
	                //마지막 위경도
	                var filteredEndPath = item.plist.filter(subList => subList[0] === item.wt_seq);
					var maxOrder = Math.max(...filteredEndPath.map(subList => parseInt(subList[1])));
					var lastPath = filteredEndPath.filter(subList => subList[1] === maxOrder.toString());				
	                var endLat = lastPath.map(subList => subList[2]);
	                var endLng = lastPath.map(subList => subList[3]);
	                
	                positions.push({
	                    petkind: item.wt_petkind,
	                    time: item.wt_time,
	                    beginlatlng: new kakao.maps.LatLng(beginLat, beginLng),
	                    centerlatlng: new kakao.maps.LatLng(centerLat, centerLng),
	                    endlatlng: new kakao.maps.LatLng(endLat, endLng),
	                    subject: item.wt_subject,
	                	content: item.wt_content,
	                	seq: item.wt_seq,
	                	pathlist: filteredPlist,
	                	writerid: item.wt_writer,
	                	sessionid: item.session_id
	                });

	            });		            	            
	            
	            showMarkernInfo(positions, bounds);	            
	            
	        },
	        error: (a, b, c) => console.log(a, b, c)
	    });
  
    }
     
    function showMarkernInfo(positions, bounds) {         

        var sessionID = '${session_id}';
        
        for (var i = 0; i < positions.length; i ++) {     
            
            var imageSrc;

            if (positions[i].writerid === sessionID) { // 세션 id와 마커 id가 일치하는 경우
                imageSrc = '/animingle/asset/commonimg/marker_id.png'; // 다른 마커 이미지 경로
            } else {
                imageSrc = '/animingle/asset/commonimg/marker.png'; // 기본 마커 이미지 경로
            }
            
            imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
            imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

	        // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
	            markerPosition = new kakao.maps.LatLng(positions[i].beginlatlng.Ma, positions[i].beginlatlng.La); // 마커가 표시될 위치입니다
	
	        // 마커를 생성합니다
	        var marker = new kakao.maps.Marker({
	          position: markerPosition,
	          image: markerImage // 마커이미지 설정 
	        });
	
	        // 커스텀 오버레이가 표시될 위치입니다 
	        var position = new kakao.maps.LatLng(positions[i].beginlatlng.Ma, positions[i].beginlatlng.La);  
	
	        // 커스텀 오버레이를 생성합니다
	        var customOverlay = new kakao.maps.CustomOverlay({
	            map: map,
	            position: position,
	            content: `<div class="info"><ul><div><li>\${positions[i].petkind}</li><li>\${positions[i].time}</li></div></ul></div>`,
	            yAnchor: 2.1
	        });		   
	    	
	        // 마커가 지도 위에 표시되도록 설정합니다
	        marker.setMap(map);  
	        marker.customOverlay = customOverlay; // 마커에 커스텀 오버레이 참조를 저장합니다
	        marker.data = positions[i];
	        
	        customOverlay.setMap(null); //처음에는 커스텀 오버레이를 다 숨겨놓는다.
	        
	        kakao.maps.event.addListener(marker, 'mouseover', function() {
	            this.customOverlay.setMap(map); // 마커에 마우스를 올렸을 때, 커스텀 오버레이를 표시합니다.
	        });

	        kakao.maps.event.addListener(marker, 'mouseout', function() {
	            this.customOverlay.setMap(null); // 마커에서 마우스를 뗐을 때, 커스텀 오버레이를 숨깁니다.
	        });
	        
	     	//마커를 클릭하면 해당 모달창이 뜨도록 합니다. 
	        kakao.maps.event.addListener(marker, 'click', function() {
	            
	            // 클릭된 마커의 데이터를 가져옵니다.
	            var data = this.data;
	            
	            // 가져온 데이터를 이용하여 모달을 업데이트하고 표시합니다.
	            updateModal(data);
	            $('#staticBackdrop').modal('show');
	            $('#staticBackdrop').on('shown.bs.modal', function () {
	                
	                var container2 = document.getElementById('map2');
	                var options2 = {
	                    center: new kakao.maps.LatLng(data.centerlatlng.Ma, data.centerlatlng.La),
	                    level: 5
	                };
	                var map2 = new kakao.maps.Map(container2, options2);
	                
	             	// 경로 위도와 경도 정보를 담은 배열을 생성합니다.
	                var pathList = data.pathlist.map((item) => new kakao.maps.LatLng(item[2], item[3]));

	                // 폴리라인을 생성하고 지도에 표시합니다.
	                var polyline = new kakao.maps.Polyline({
	                    path: pathList, // 선을 구성하는 좌표 배열입니다
	                    strokeWeight: 2, // 선의 두께입니다
	                    strokeColor: 'blue', // 선의 색깔입니다
	                    strokeOpacity: 1, // 선의 불투명도입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	                    strokeStyle: 'solid' // 선의 스타일입니다
	                });	                

	                polyline.setMap(map2);
	                
	                //산책 경로 시작 지점과 끝 지점에 마커를 생성합니다.
	                //console.log(data.beginlatlng);
	                //console.log(data.endlatlng);	                
	                var imageSrc2 = '/animingle/asset/commonimg/marker2.png', 
		                imageSize2 = new kakao.maps.Size(44, 49), 
		                imageOption2 = {offset: new kakao.maps.Point(15, 45)}; 
	
		            var markerImage2 = new kakao.maps.MarkerImage(imageSrc2, imageSize2, imageOption2),
		                markerPosition2 = new kakao.maps.LatLng(data.beginlatlng.Ma, data.beginlatlng.La); 
	
		            var marker2 = new kakao.maps.Marker({
		                position: markerPosition2,
		                image: markerImage2 
		            });  
	
		            marker2.setMap(map2); 
	
	
		            var imageSrc3 = '/animingle/asset/commonimg/marker3.png', 
		                imageSize3 = new kakao.maps.Size(44, 49), 
		                imageOption3 = {offset: new kakao.maps.Point(15, 45)}; 
	
		            var markerImage3 = new kakao.maps.MarkerImage(imageSrc3, imageSize3, imageOption3),
		                markerPosition3 = new kakao.maps.LatLng(data.endlatlng.Ma, data.endlatlng.La); 
	
		            var marker3 = new kakao.maps.Marker({
		                position: markerPosition3,
		                image: markerImage3 
		            });  
	
		            marker3.setMap(map2);

	    	        
	                
	              })
	        });
        }		
        
    }
    
    function updateModal(data) {
        
        $('#staticBackdropLabel').text(data.subject);
        $('#petInfo').text(data.petkind);
        $('#timeInfo').text(data.time);
        $('#introInfo').html(data.content);
        
        if(data.sessionid !== null) {
            $('#chatBtn').html(
                    
            	`
            	<button type="button" class="write-btn">
                	<span class="material-symbols-outlined">sms</span>
                     채팅하기
                </button>
                ` 
            
            );
        }

        if(data.sessionid === data.writerid) {
            $('#editBtns').html(
            	`
            	<form method="POST" action="/animingle/board/walktogetheredit.do" id="editForm">
            	<input type="hidden" name="seq" value="\${data.seq}">
            	<input type="hidden" name="subject" value="\${data.subject}">
            	<input type="hidden" name="petkind" value="\${data.petkind}">
            	<input type="hidden" name="time" value="\${data.time}">
            	<input type="hidden" name="pathlist" value="\${data.pathlist}">
            	<button type="submit" class="content-btn2">수정</button>
            	</form>
            	<form method="POST" action="/animingle/board/walktogetherfin.do" id="delForm">
            	<input type="hidden" name="seq" value="\${data.seq}">
            	<button type="submit" class="content-btn2">삭제</button>
            	</form>
            	<button type="button" class="content-btn1" onclick="complete(\${data.seq})">완료</button>
            	`
            );
        }
        
    }    
    
    function complete(seq) {
        if(confirm('산책 친구 구하기를 완료하시겠습니까?')) {
            location.href= `/animingle/board/walktogetherfin.do?seq=\${seq}`;            
        }
    }
    
    

</script>
</body>

</html>