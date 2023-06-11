<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Animingle</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="asset/css/index.css">
<link rel="stylesheet" href="/animingle/asset/css/find.css">
	<style>
	.wrap {position: absolute;left: -24px;bottom: -33px;width: 200px;height: 132px;text-align:left;overflow: hidden;font-family: "SUITE-Regular";, sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 12px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative; overflow-y: auto; padding: 5px; width: 200px; height: 120px;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
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
				<div class="a-div">
					<a href="http://localhost:8090/animingle/board/findlist.do?page=1&prefix=${prefix}&word=${word}" class="a-back">
						<span id="arrow" class="material-symbols-outlined">arrow_back</span>
						<span class="back-to-list">목록으로 돌아가기</span>
					</a>
				</div>
				<div class="main-border">
					<div class="writer find-view-writer">
						<img src="/animingle/asset/commonimg/logo_01.png">
								${dto.nickname}(${dto.writer})
						<span class="time">${dto.regdate}</span>
					</div>
					<div class="find-view-subject">
						<c:if test="${dto.prefix == 1}">
						<span id="view-subjcet">[주인 찾아요] ${dto.subject }</span>
						</c:if>
						<c:if test="${dto.prefix == 2}">
						<span id="view-subjcet">[펫 찾아요] ${dto.subject }</span>
						</c:if>
						<span class="material-symbols-outlined">visibility</span>${dto.readcount}
						<span class="material-symbols-outlined">chat</span><div class="comment-cnt">${dto.ffc_cnt}</div>
					</div>
					<div class="find-view-content">
						${dto.content} 
					</div>
					<div class="find-view-map" id="map">
						
					</div>
					
					<c:if test="${not empty id && id == dto.writer}">
					<div class="view-button">
		            	<button type="button" class="content-btn1" onclick="location.href='/animingle/board/findedit.do?seq=${dto.seq}';">수정하기</button>
		            	<button type="button" class="content-btn2" onclick="location.href='/animingle/board/finddel.do?seq=${dto.seq}';">삭제하기</button>
		            </div>
		            </c:if>
					<div class="find-view-comment">
						<div class="comment-count">${dto.ffc_cnt}개의 댓글</div>
						<c:forEach items="${clist}" var="cdto">
						<div class="find-view-reply">
							<div class="writer">
								<img src="/animingle/asset/commonimg/logo_01.png">
								${cdto.nickname}(${cdto.writer})
								<span class="time">${cdto.regdate}</span>
							</div>
							<div class="content-list">
								${cdto.content}
							</div>
						</div>
						</c:forEach>
						<input type="hidden" name="writer" value="pecan567">
				</div>
				<c:if test="${not empty id}">
				<div class="comment-add-text-box">
					<div class="commet-add-text-area-box">
							<textarea class="comment-area" maxlength="1000" placeholder="댓글 내용을 입력하세요" name="content" id="comment-area"></textarea>
							<div class="character-count">0/160</div>
						</div>
					</div>
				
				<div class="find-view-comment-button">
					<button id="btnCommentAdd">댓글 쓰기</button>
				</div>
				</c:if>
				<input type="hidden" name="lat" id="lat-value" value="90">
			    <input type="hidden" name="lng" id="lng-value" value="90">
			</div>
			
		</div>
		<div class="rightbar">
			<!-- 오른쪽 사이드바 입니다. -->
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
		center: new kakao.maps.LatLng(${dto.lat}, ${dto.lng}), 
		level: 3 
	};
	
	var map = new kakao.maps.Map(container, options);
	
	
	
	var positions = [
		
		<c:forEach items="${cplist}" var="cpdto" varStatus="status">
			

			<c:if test = "${not empty cpdto.clat}">
			{
				title: 'cp${status.count}',
				latlng: new kakao.maps.LatLng(${cpdto.clat}, ${cpdto.clng}),
				content: '<div class="wrap">' + 
	            '    <div class="info">' + 
	            '        <div class="title">' + 
	            '            ${cpdto.writer} (${cpdto.regdate})' + 
	            '        </div>' + 
	            '        <div class="body">' + 
	           	' 			${cpdto.content}			  ' +		
	            '        </div>' + 
	            '    </div>' +    
	            '</div>'
			}
			<c:if test="${fn:length(cplist) != status.count}">
			,
			</c:if>
			</c:if>
			
		</c:forEach>
	];

	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	
	
	if (${fn:length(cplist)} != 0) {
		for (var i=0; i<${fn:length(cplist)}; i++) {
			
			var imageSize = new kakao.maps.Size(24, 35); 
			
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			
			var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커의 위치
		        image : markerImage
		    });

		    // 마커에 표시할 인포윈도우를 생성합니다 
		    var infowindow = new kakao.maps.InfoWindow({
		        content: positions[i].content // 인포윈도우에 표시할 내용
		    });

		    // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
		    // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    (function(marker, infowindow) {
		    	
		    	var clicked = false;
		        // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
		        kakao.maps.event.addListener(marker, 'click', function() {
		            if (clicked == false) {
			            infowindow.open(map, marker);
			            clicked = true;
		            } else {
			        	infowindow.close();
		        		clicked = false;	
		            }
		            

		        });

		        // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
/* 		        kakao.maps.event.addListener(marker, 'click', function() {

		            
		        }); */
		    })(marker, infowindow);
			/* var marker = new kakao.maps.Marker({
				map: map,
				position: positions[i].latlng,
				title: positions[i].title,
				image : markerImage
			});
			
			var overlay = new kakao.maps.CustomOverlay({
				content: positions[i].content,
			    map: map,
			    position: marker.getPosition()     
		    });
			
			kakao.maps.event.addListener(marker, 'click', function() {
			    overlay.setMap(map);
			}); */
		}
	}
	
	

	
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
		
		addMarker(mouseEvent.latLng);
		
	});
	
	var markers = [];
	
	var add = 0;
		
	var clat = 37.4993;
	var clng = 127.0331;
	
	addMarker(new kakao.maps.LatLng(${dto.lat}, ${dto.lng}));
	
	function addMarker(position) {
			
		if (add <= 1) {
						
			var marker = new kakao.maps.Marker({
				position: position
			});
			
			marker.setMap(map);
			
			markers.push(marker);
			
			add += 1;
			
			//infowindow.open();
			
			$('#lat-value').val(position.getLat());
			$('#lng-value').val(position.getLng());
			
			clat = $('#lat-value').val();
			clng = $('#lng-value').val();
			
						
		} else {
		
			markers[1].setPosition(position);
			
			$('#lat-value').val(position.getLat());
			$('#lng-value').val(position.getLng());
			
			clat = $('#lat-value').val();
			clng = $('#lng-value').val();
			
		}
	}
	
	function setMarkers(map) {
	    for (var i = 0; i < markers.length; i++) {
	        markers[i].setMap(map);
	    }            
	}
	
	
	$('#btnCommentAdd').click(function(){
		
		let content = $('.comment-area').val();
		$.ajax({
			type: 'POST',
			url: '/animingle/board/findcommentadd.do',
			dataType: "json",
			data: {
				seq: ${dto.seq},
				content: content,
				writer: '${id}',
				lat: clat,
				lng: clng
			},
			success: (result) => {
				
				$('.find-view-comment').append(
				`
				<div class="find-view-reply">
					<div class="writer">
					<img src="/animingle/asset/commonimg/logo_01.png">
					\${result.nickname}(\${result.writer})
					<span class="time">\${result.regdate}</span>
					</div>
					<div class="content-list">
						\${result.content}
					</div>
				 </div>
				`		
				);
				
				document.getElementById("comment-area").value = '';
				$('.comment-count').text(result.ffc_cnt + '개의 댓글');
				$('.comment-cnt').text(result.ffc_cnt);
			},
			error: (a,b,c)=>console.log(a,b,c)
		});
		
	});
	
	$(".comment-area").on('input', function () {
		var maxLength = 160;
		var currentLength = $(this).val().length;
		var remainingLength = maxLength - currentLength;
 
		$(".character-count").text(currentLength + "/" + maxLength);
 
		if (currentLength > maxLength) {
			$(this).val($(this).val().substring(0, maxLength));
		}
       
	});
	
	
	
</script>
</body>
</html>