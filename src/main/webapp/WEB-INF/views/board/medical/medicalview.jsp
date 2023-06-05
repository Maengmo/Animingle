<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원/약국 찾기</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/animingle/asset/css/index.css">
<link rel="stylesheet" href="/animingle/asset/css/medicalview.css">
</head>

<body>

	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<section class="content">
		<div class="mycontainer">
			<div class="leftbar" id="left"
				style="overflow: scroll; overflow-x: hidden; width: 240px; height: 800px;">
				<!-- 왼쪽 사이드바 입니다. -->
				<table id="side">
					<thead>
					<tr class="tr" id="search">
						<th>
							<p style="color: #0256AA;">요기에 검색하세요!</p>
							<div id="search2">
								<input type="text" id="txt1" placeholder="입력하세요."> <span
									class="material-symbols-outlined">search</span>
							</div>
							<div id="kind-select">
								<label> <input type="radio" name="location"
									value="hospital" checked> 동물병원
								</label> <label> <input type="radio" name="location"
									value="pharmacy"> 동물약국
								</label>
							</div>
						</th>
					</tr>
					</thead>
					<tbody>
					<tr class="place-list">
						<th>온누리 약국 <small id="small">영업중</small> <br>
						<small id="small2">서울시 강남구 역삼동</small></th>
					</tr>
					
					</tbody>
				</table>
			</div>
			<div id="addside">

				<br>
				<h2 class="title">온누리 약국</h2>
				<hr>

				<h3 class="middle">
					<span class="material-symbols-outlined">location_on</span><span
						class="infoTxt">&nbsp;강남구 역삼동</span>
				</h3>
				<h3 class="middle">
					<span class="material-symbols-outlined">timer</span><span
						class="infoTxt">&nbsp;영업 시간</span>
				</h3>
				<h3 class="middle">
					<span class="material-symbols-outlined">phone_in_talk</span><span
						class="infoTxt">&nbsp;전화번호</span>
				</h3>
				<hr>

				<h3 class="middle">리뷰</h3>

				<div class="review">
					"친절해요"<small class="count">30</small>
				</div>
				<div class="review">
					"복약지도를 잘해줘요" <small class="count">30</small>
				</div>
				<div class="review">
					"상담이 자세해요" <small class="count">30</small>
				</div>
				<div class="review">
					"제품 종류가 다양해요" <small class="count">30</small>
				</div>

				<hr>

				<div class="item-wrap">
					<div class="item-header">
						<div>
							<img src="/animingle/asset/pic/pic.jpg" alt="프로필이미지"
								class="profile-img" id="profile-img"> <span
								class="item-id">밍글밍글(mingle77)</span>
						</div>
						<div class="rating">
							<input type="radio" id="star5" name="rating" value="5" /> <label
								for="star5"></label> <input type="radio" id="star4"
								name="rating" value="4" /> <label for="star4"></label> <input
								type="radio" id="star3" name="rating" value="3" /> <label
								for="star3"></label> <input type="radio" id="star2"
								name="rating" value="2" /> <label for="star2"></label> <input
								type="radio" id="star1" name="rating" value="1" /> <label
								for="star1"></label>
						</div>
					</div>
					<div class="item-content">좋아여~!</div>

					<div class="item-config">
						<span>[2023.06.02 (금)]</span>
					</div>
				</div>

				<div class="item-wrap">
					<div class="item-header">
						<div>
							<img src="/animingle/asset/pic/pic.jpg" alt="프로필이미지"
								class="profile-img" id="profile-img"> <span
								class="item-id">밍글밍글(mingle77)</span>
						</div>
						<div class="rating">
							<input type="radio" id="star5" name="rating" value="5" /> <label
								for="star5"></label> <input type="radio" id="star4"
								name="rating" value="4" /> <label for="star4"></label> <input
								type="radio" id="star3" name="rating" value="3" /> <label
								for="star3"></label> <input type="radio" id="star2"
								name="rating" value="2" /> <label for="star2"></label> <input
								type="radio" id="star1" name="rating" value="1" /> <label
								for="star1"></label>
						</div>
					</div>
					<div class="item-content">좋아여~!</div>

					<div class="item-config">
						<span>[2023.06.02 (금)]</span>
					</div>
				</div>

				<div class="item-wrap">
					<div class="item-header">
						<div>
							<img src="/animingle/asset/pic/pic.jpg" alt="프로필이미지"
								class="profile-img" id="profile-img"> <span
								class="item-id">밍글밍글(mingle77)</span>
						</div>
						<div class="rating">
							<input type="radio" id="star5" name="rating" value="5" /> <label
								for="star5"></label> <input type="radio" id="star4"
								name="rating" value="4" /> <label for="star4"></label> <input
								type="radio" id="star3" name="rating" value="3" /> <label
								for="star3"></label>

						</div>
					</div>
					<div class="item-content">좋아여~!</div>

					<div class="item-config">
						<span>[2023.06.02 (금)]</span>
					</div>
				</div>

				<div class="item-wrap">
					<div class="item-header">
						<div>
							<img src="/animingle/asset/pic/pic.jpg" alt="프로필이미지"
								class="profile-img" id="profile-img"> <span
								class="item-id">밍글밍글(mingle77)</span>
						</div>
						<div class="rating">
							<input type="radio" id="star5" name="rating" value="5" /> <label
								for="star5"></label> <input type="radio" id="star4"
								name="rating" value="4" /> <label for="star4"></label> <input
								type="radio" id="star3" name="rating" value="3" /> <label
								for="star3"></label> <input type="radio" id="star2"
								name="rating" value="2" /> <label for="star2"></label>

						</div>
					</div>
					<div class="item-content">좋아여~!</div>

					<div class="item-config">
						<span>[2023.06.02 (금)]</span>
					</div>
				</div>

				<hr>

				<div id="review-box" style="cursor: pointer;">후기를 작성해 주세요.</div>

				<div id="review-add" style="display: none">
					<div id="Hash-tag">
						<div class="tag" data-tag="kind">친절해요</div>
						<div class="tag" data-tag="medication">복약지도를 잘해줘요</div>
						<div class="tag" data-tag="packaging">조제약 포장이 세심해요</div>
						<div class="tag" data-tag="price">가격이 합리적이에요</div>
						<div class="tag" data-tag="consultation">상담이 자세해요</div>
					</div>


					<textarea id="review-text" rows="4" cols="50"></textarea>



					<div class="upload-file">
						<input type="text" class="file-name" value="영수증 사진"
							placeholder="첨부파일" readonly> <label for="pic"><span
							class="material-symbols-outlined" id="upload">upload_file</span></label>
						<input type="file" id="pic">
					</div>

					<div class="btn-div">
						<button type="button" id="write-btn" class="write-btn"
							onclick="window.location='http://localhost:8090/animingle/board/petsitteradd.do';">
							<span class="material-symbols-outlined"> edit_note </span> 리뷰쓰기
						</button>
					</div>
				</div>
			</div>
			<div class="maincontent">

				<div id="map">지도</div>

			</div>

		</div>
	</section>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b34a8317f5befe832f9eefe047ae818&libraries=services"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script src="/animingle/asset/js/medical.js"></script>
</body>
<script>


/* const hlist = [];
<c:forEach items="${hlist}" var="dto" varStatus="status">
	hlist.push(
			{
				h_seq: ${dto.h_seq}, 
				h_address: "${dto.h_address}",
				h_lat: ${dto.h_lat},
				h_lng: ${dto.h_lng}
			});
</c:forEach> */


function addside() {
  if ($('#addside').width() === 0) {
    $('#addside').css('width', '600px');
    $('#addside').css('overflow', 'scroll');
    $('#addside').css('overflow-x', 'hidden');
    $('#addside').css('border-width', '1px');
    $(event.target).css('background-color', 'yellow');
  } else {
    $('#addside').css('width', '0');
    $('#addside').css('overflow', 'hidden');
    $('#addside').css('border-width', '0px');
    $(event.target).css('background-color', '');
  }
}



kakao.maps.load(function() {
	  // 지도 생성 및 표시할 div 요소
	  var container = document.getElementById('map'); // 지도를 담을 영역의 DOM 레퍼런스

	  // 지도 중심 좌표 설정
	  var options = {
	    center: new kakao.maps.LatLng(37.4993, 127.0331), // 지도의 중심 좌표
	    level: 3 // 지도의 레벨(확대, 축소 정도)
	  };

	  // 지도 생성
	  var map = new kakao.maps.Map(container, options); // 지도 생성 및 객체 리턴

	  kakao.maps.event.addListener(map, 'dragend', function() {
	    // 현재 지도의 영역을 가져옵니다
	    var bounds = map.getBounds();

	    // 남서쪽
	    var sw = bounds.getSouthWest();
	    // 북동쪽
	    var ne = bounds.getNorthEast();

	    // 기존의 마커들을 모두 제거합니다
	    removeAllMarkers();
	    
	    
	    // 새로운 영역에 속하는 마커들을 생성합니다
	    // Ajax 요청
	    $.ajax({
	      type: 'GET',
	      url: '/animingle/board/medicalview.do',
	      data: {
	        neLat: ne.getLat(),
	        neLng: ne.getLng(),
	        swLat: sw.getLat(),
	        swLng: sw.getLng()
	      },
	      dataType: 'json',
	      success: function(result) {
	    	  
	    	$("#side tbody").html("");
	    	  
	        createMarkersInBounds(result, bounds);
	        
	        $(result).each((index, item) =>{
				$("#side tbody").append(
						

				        `
					        <tr class="place-list" onclick="addside()">
							<th> \${item.h_name} <small id="small"> \${item.h_ing} </small> <br>
							<small id="small2"> \${item.h_address} </small></th>
							</tr>
				        `
						
				);
	        });
	        
	      }
	    });
	  });

	  // 기존의 마커들을 모두 제거하는 함수
	  function removeAllMarkers() {
	    // 마커를 제거하는 로직을 구현합니다
	  }
	  
	  var markerImage = new kakao.maps.MarkerImage(
  		  '/animingle/asset/pic/hospital.png',
  		  new kakao.maps.Size(50, 50) // 마커 이미지의 크기를 지정합니다.
  		);

	  // 영역 내에 속하는 마커들을 생성하는 함수
	  function createMarkersInBounds(data, bounds) {
	    data.forEach(item => {
	      var coords = new kakao.maps.LatLng(item.h_lat, item.h_lng);
	      if (bounds.getSouthWest().getLat() <= coords.getLat() && coords.getLat() <= bounds.getNorthEast().getLat() &&
	          bounds.getSouthWest().getLng() <= coords.getLng() && coords.getLng() <= bounds.getNorthEast().getLng()) {
	          
	    	// 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	          map: map,
	          position: coords,
	          image: markerImage
	        });
	        marker.setMap(map);
	      }
	    });
	  }
	  
	  //
	  
	  
	});
	
/* 라디오 버튼에 따라 다르게 */
//라디오 버튼 선택 시 동작할 함수
function handleRadioButtonChange() {
var selectedValue = document.querySelector('input[name="location"]:checked').value;
console.log("선택된 값:", selectedValue);

if (selectedValue === "hospital") {
// 동물병원에 대한 처리
console.log("동물병원 선택됨");
// 원하는 동물병원 동작 수행
} else if (selectedValue === "pharmacy") {
// 동물약국에 대한 처리
console.log("동물약국 선택됨");
// 원하는 동물약국 동작 수행
} else {
// 기타 경우에 대한 처리
console.log("기타 선택됨");
// 원하는 기타 동작 수행
}
}

// 라디오 버튼 이벤트 리스너 등록
var radioButtons = document.querySelectorAll('input[name="location"]');
for (var i = 0; i < radioButtons.length; i++) {
  radioButtons[i].addEventListener('change', handleRadioButtonChange);
}
</script>
</html>