<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Animingle</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/animingle/asset/css/index.css">
<link rel="stylesheet" href="/animingle/asset/css/medicalview.css">
</head>

<body>

	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<section class="content">
		<div class="mycontainer">
			<div class="leftbar" id="left"
				style="overflow: scroll; overflow-x: hidden; width: 230px; height: 800px;">
				<!-- 왼쪽 사이드바 입니다. -->
				<table id="side">
					<thead>
					<tr class="tr" id="search">
						<th style="background-color: #F9F5F6;">
							<p style="color: #0256AA;">요기에서 검색 항목을 <br>선택하세요! ✧ʕ•ٹ•ʔ</p>
							<!--  <div id="search2">
								<input type="text" id="txt1" placeholder="입력하세요."> <span
									class="material-symbols-outlined">search</span>
							</div>-->
							<div id="kind-select">
								<label> <input type="radio" name="location"
									value="hospital"> 동물병원
								</label> <label> <input type="radio" name="location"
									value="pharmacy"> 동물약국
								</label>
							</div>
						</th>
					</tr>
					</thead>
					<tbody>
					<tr class="place-lis">
						<th>동물병원 or 동물약국 <small id="small">선택해주세요!</small> <br>
						<small id="small2">선택 후, 지도를 이동 시 <br>해당 항목이 나타납니다.</small></th>
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
						class="infoTxt" id="address">&nbsp;강남구 역삼동</span>
				</h3>
				<h3 class="middle">
					<span class="material-symbols-outlined">timer</span><span
						class="infoTxt" id="time">&nbsp;오픈 시간</span>
				</h3>
				<h3 class="middle">
					<span class="material-symbols-outlined">timer</span><span
						class="infoTxt" id="call">&nbsp;닫는 시간</span>
				</h3>
				<hr>

				<h3 class="middle">리뷰</h3>

				<div class="review">
					"친절해요"<small class="count" id="count1">5</small>
				</div>
				<div class="review">
					"복약지도를 잘해줘요" <small class="count" id="count2">4</small>
				</div>
				<div class="review">
					"세심하게 얘기를 들어줘요" <small class="count" id="count3">2</small>
				</div>
				<div class="review">
					"제품 종류가 다양해요" <small class="count" id="count4">4</small>
				</div>
				<div class="review">
					"상담이 자세해요" <small class="count" id="count5">8</small>
				</div>
				<hr>
				<div class="review-list">
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
				</div>
				
				<hr>

				<div id="review-box" style="cursor: pointer;">후기를 작성해 주세요! (●´ϖ`●) <small id="sm">Click Here!!</small></div>

				<form id="review-form">
				  <div id="review-add" style="display:none">
				    <div id="Hash-tag">
				      <div class="tag" data-tag="TAG1">친절해요</div>
				      <div class="tag" data-tag="TAG2">복약지도를 잘해줘요</div>
				      <div class="tag" data-tag="TAG3">세심하게 얘기를 들어줘요</div>
				      <div class="tag" data-tag="TAG4">가격이 합리적이에요</div>
				      <div class="tag" data-tag="TAG5">상담이 자세해요</div>
				    </div>
				
				    <textarea id="review-text" rows="4" cols="50"></textarea>
				
				    <div class="upload-file">
				      <input type="text" class="file-name" value="영수증 사진" placeholder="첨부파일" readonly>
				      <label for="pic">
				        <span class="material-symbols-outlined" id="upload">upload_file</span>
				      </label>
				      <input type="file" id="pic">
				    </div>
				
				    <div class="rating2">
				      <input type="radio" id="star5" name="rating2" value="5" />
				      <label for="star5" title="5 stars" class="starr">5점</label>
				      <input type="radio" id="star4" name="rating2" value="4" />
				      <label for="star4" title="4 stars" class="starr">4점</label>
				      <input type="radio" id="star3" name="rating2" value="3" />
				      <label for="star3" title="3 stars" class="starr">3점</label>
				      <input type="radio" id="star2" name="rating2" value="2" />
				      <label for="star2" title="2 stars" class="starr">2점</label>
				      <input type="radio" id="star1" name="rating2" value="1" />
				      <label for="star1" title="1 star" class="starr">1점</label>
				    </div>
				
				    <div class="btn-div">
				      <button type="submit" id="write-btn" class="write-btn">
				        <span class="material-symbols-outlined">edit_note</span> 리뷰쓰기
				      </button>
				    </div>
				  </div>
				</form>
			</div>
			<div class="maincontent">

				<div id="map">지도</div>

			</div>
			

		</div>
		<p style="text-align:center;">
		  <input type="checkbox" id="chkUseDistrict" /> 지적편집도 정보 보기
		  <input type="checkbox" id="chkTerrain" /> 지형정보 보기 
		  <input type="checkbox" id="chkTraffic" /> 교통정보 보기       
		  <input type="checkbox" id="chkBicycle" /> 자전거도로 정보 보기
		</p>
		
		
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

//라디오 버튼 이벤트 리스너 등록
const ratingInputs = document.querySelectorAll('.rating2 input');
let selectedRating = null;

ratingInputs.forEach(input => {
  input.addEventListener('click', () => {
    selectedRating = input.value;
    updateRating();
  });
});

function updateRating() {
  ratingInputs.forEach(input => {
	const label = input.nextElementSibling;
    if (input.value <= selectedRating) {
      input.checked = true;
      label.style.backgroundColor = 'yellow';
    } else {
      input.checked = false;
      label.style.backgroundColor = '';
    }
  });
}


// 현재 선택 요소 id
//if (typeof seq === 'number') {

/*
document.addEventListener('click', function(event) {
  var clickedElement = event.target;
  seq = clickedElement.id;
  
});
*/
//}

/* 전역 변수 선언 */
var globalVariable; // pseq
var globalVariable3; // hseq
var globalVariable2; // pseq



//if (selectedValue === "pharmacy"){
document.getElementById('review-form').addEventListener('submit', function(event) {
	  event.preventDefault(); // 페이지 새로고침 방지

	  const form = this;
	  
	  // 선택된 태그 가져오기
	  const selectedTags = Array.from(document.querySelectorAll('.tag.selected')).map(tag => tag.dataset.tag);

	  // 입력된 리뷰 텍스트 가져오기
	  const reviewText = document.getElementById('review-text').value;

	  // 첨부된 파일 정보 가져오기
	  const fileInput = document.getElementById('pic');
	  const file = fileInput.files[0];
	  const fileName = file ? file.name : '';

	  // 선택된 별점 가져오기
	  const rating = selectedRating;
	  
	  
	  
		 
if(selectedTags === null || reviewText === null || fileInput === null || fileName === null || rating === null){
		  
  	alert("입력이 올바르지 않습니다. 다시 확인해주세요.");
  
} else {
	  
	 
if (globalVariable2 === "pharmacy") {
	  //DB 작업
	  $.ajax({
		    type: 'POST',
		    url: '/animingle/board/medicalview.do',
		    data: {
		        seq: globalVariable,
		        fileName : fileName,
		        rating : rating,
		        selectedTags : selectedTags[0],
		        reviewText : reviewText
		    },
		    dataType: 'json',
		    success: function(result) {
		        
		    	$('#review-add').css("display", "none");
		    	
		    	// 응답 데이터 처리
		        alert("리뷰 등록이 완료 되었습니다. 소중한 리뷰 감사합니다.");
		    
		     	// 데이터 삽입 후 폼 초기화
		        form.reset();
		        
		     	// 선택된 태그 초기화
		        $('.tag.selected').removeClass('selected');
		        
		        // 별점 초기화
		        $('.starr').css("background", "white")

		    },
		    error: (a,b,c)=>console.log(a,b,c)
		});
} else if (globalVariable2 === "hospital") {
	
	 $.ajax({
		    type: 'POST',
		    url: '/animingle/board/medicalHReview.do',
		    data: {
		        seq: globalVariable3,
		        fileName : fileName,
		        rating : rating,
		        selectedTags : selectedTags[0],
		        reviewText : reviewText
		    },
		    dataType: 'json',
		    success: function(result) {
				
		    	$('#review-add').css("display", "none");
		    	
		    	// 응답 데이터 처리
		        alert("리뷰 등록이 완료 되었습니다. 소중한 리뷰 감사합니다.");
		    
		     	// 데이터 삽입 후 폼 초기화
		        form.reset();
		        
		     	// 선택된 태그 초기화
		        $('.tag.selected').removeClass('selected');
		        
		        // 별점 초기화
		        $('.starr').css("background", "white")

		    }
	});
	
}
}
	  
	  // 예시로 콘솔에 출력
	  console.log('선택된 태그:', selectedTags);
	  console.log('리뷰 텍스트:', reviewText);
	  console.log('첨부된 파일:', fileName);
	  console.log('별점:', rating);
	  console.log('현재 선택한 요소의 아이디:', globalVariable);
	  // 데이터 삽입 후 폼 초기화
	  this.reset();
});

function generateStars(rate) {
  const maxStars = 5;
  const roundedRate = Math.round(rate);
  let starsHTML = '';
  for (let i = 1; i <= maxStars; i++) {
    if (i <= roundedRate) {
      starsHTML += `<input type="radio" id="star${i}" name="rating" value="${i}" checked /> <label for="star${i}"></label>`;
    } else {
      
    }
  }
  return starsHTML;
}


function addside(seq, lat, lng) {
	  if ($('#addside').width() === 0) {
		  globalVariable3 = seq;
		$.ajax({
	      type: 'GET',
	      url: '/animingle/board/medicalHReview.do',
	      data: {
	        seq: seq
	      },
	      dataType: 'json',
	      success: function(result) {
	    	  
	    	  //result.arr1
	    	  //result.arr2
	    	  	$(".review-list").html("");
	    	  	console.log("result : " , result);
	    	  	console.log("seq : ", seq);
	    	  
	    	  	$('.title').text('장소');
	        	$('#address').text('주소');
	        	$('#time').text('오픈 시간');	        	
	        	$('#call').text('닫는 시간');
	        	
	        $(result.arr2).each(function(index, item) {
	          
	        	$('.title').text(item.h_name);
	        	$('#address').text(item.h_address);
	        	$('#time').text(item.h_open);	        	
	        	$('#call').text(item.h_close);
	        	
	        	$(".review-list").append(`
        			<div class="item-wrap">
					<div class="item-header">
						<div>
							<img src="/animingle/asset/pic/pic.jpg" alt="프로필이미지"
								class="profile-img" id="profile-img"> <span
								class="item-id">\${item.user_nickname}(\${item.hr_writer})</span>
						</div>
						<div class="rating">
							\${generateStars(item.hr_rate)}
						</div>
					</div>
					<div class="item-content">\${item.hr_content}</div>

					<div class="item-config">
						<span>[\${item.hr_regdate}]</span>
					</div>
					</div>
                `);
	        	
	        	
	        });
	        
	        $(result.arr1).each(function(index, item) {
	        	
	        	$('#count1').text(item.tag1c);
	        	$('#count2').text(item.tag2c);
	        	$('#count3').text(item.tag3c);
	        	$('#count4').text(item.tag4c);
	        	$('#count5').text(item.tag5c);
	        	
	        });
	        
	        
	        
	        $('#addside').css('width', '500px');
	        $('#addside').css('overflow', 'scroll');
	        $('#addside').css('overflow-x', 'hidden');
	        $('#addside').css('border-width', '1px');
	        $(`#\${seq}`).css('background-color', '#FFFCCB');
	        
	        
	        //$('#map').css('left', '300px');
	        	
	        
	        map.setCenter(new kakao.maps.LatLng(lat, lng));
	        map.setLevel(1);
	        
	        
	        
	        
	      },
	      error: function(xhr, status, error) {
	        console.error(error);
	      }
	    });
	  } else {
	    $('#addside').css('width', '0');
	    $('#addside').css('overflow', 'hidden');
	    $('#addside').css('border-width', '0px');
	    $(`#\${seq}`).css('background-color', '');
	    
	  }
	}
	
function addside2(seq, lat, lng) {
	
	globalVariable = seq;
	
	  if ($('#addside').width() === 0) {
	    $.ajax({
	      type: 'GET',
	      url: '/animingle/board/medicalPReview.do',
	      data: {
	        seq: seq
	      },
	      dataType: 'json',
	      success: function(result) {
	    	  
	    	  //result.arr1
	    	  //result.arr2
	    	  	$(".review-list").html("");
	    	  	console.log("rsult : " , result);
	    	  	console.log("seq : ", seq);
	    	  
	    	  	$('.title').text('장소');
	        	$('#address').text('주소');
	        	$('#time').text('오픈 시간');	        	
	        	$('#call').text('닫는 시간');
	        	
	        $(result.arr2).each(function(index, item) {
	          
	        	$('.title').text(item.p_name);
	        	$('#address').text(item.p_address);
	        	$('#time').text(item.p_open);	        	
	        	$('#call').text(item.p_close);
	        	
	        	$(".review-list").append(`
      			<div class="item-wrap">
					<div class="item-header">
						<div>
							<img src="/animingle/asset/pic/pic.jpg" alt="프로필이미지"
								class="profile-img" id="profile-img"> <span
								class="item-id">\${item.user_nickname}(\${item.pr_writer})</span>
						</div>
						<div class="rating">
							\${generateStars(item.pr_rate)}
						</div>
					</div>
					<div class="item-content">\${item.pr_content}</div>

					<div class="item-config">
						<span>[\${item.pr_regdate}]</span>
					</div>
					</div>
              `);
	        	
	        	
	        });
	        
	        $(result.arr1).each(function(index, item) {
	        	
	        	$('#count1').text(item.tag1c);
	        	$('#count2').text(item.tag2c);
	        	$('#count3').text(item.tag3c);
	        	$('#count4').text(item.tag4c);
	        	$('#count5').text(item.tag5c);
	        	
	        });
	        
	        
	        
	        $('#addside').css('width', '500px');
	        $('#addside').css('overflow', 'scroll');
	        $('#addside').css('overflow-x', 'hidden');
	        $('#addside').css('border-width', '1px');
	        $(`#\${seq}`).css('background-color', '#FFFCCB');
	        
	        //$('#map').width($('#map').width() - 600);
	        
	        
	        
	        map.setCenter(new kakao.maps.LatLng(lat, lng));
	        map.setLevel(1);
	        
	        
	        
	        
	      },
	      error: function(xhr, status, error) {
	        console.error(error);
	      }
	    });
	  } else {
	    $('#addside').css('width', '0');
	    $('#addside').css('overflow', 'hidden');
	    $('#addside').css('border-width', '0px');
	    $(`#\${seq}`).css('background-color', '');
	  }
	}


var map = null;

kakao.maps.load(function() {
	  var container = document.getElementById('map'); // 지도를 담을 영역의 DOM 레퍼런스
	  
	  var options = {
	    center: new kakao.maps.LatLng(37.4993, 127.0331), // 지도의 중심 좌표
	    level: 3 // 지도의 레벨(확대, 축소 정도)
	  };

	  map = new kakao.maps.Map(container, options); // 지도 생성 및 객체 리턴

	  var mapTypeControl = new kakao.maps.MapTypeControl();
	  
	  var mapTypes = {
			    terrain : kakao.maps.MapTypeId.TERRAIN,    
			    traffic :  kakao.maps.MapTypeId.TRAFFIC,
			    bicycle : kakao.maps.MapTypeId.BICYCLE,
			    useDistrict : kakao.maps.MapTypeId.USE_DISTRICT
			};

	  // 체크박스 요소 가져오기
	  const chkUseDistrict = document.getElementById('chkUseDistrict');
	  const chkTerrain = document.getElementById('chkTerrain');
	  const chkTraffic = document.getElementById('chkTraffic');
	  const chkBicycle = document.getElementById('chkBicycle');

	  // 이벤트 핸들러 등록
	  chkUseDistrict.addEventListener('click', setOverlayMapTypeId);
	  chkTerrain.addEventListener('click', setOverlayMapTypeId);
	  chkTraffic.addEventListener('click', setOverlayMapTypeId);
	  chkBicycle.addEventListener('click', setOverlayMapTypeId);
	  
	  //체크 박스를 선택하면 호출되는 함수입니다
	  function setOverlayMapTypeId() {
	      var chkTerrain = document.getElementById('chkTerrain'),  
	          chkTraffic = document.getElementById('chkTraffic'),
	          chkBicycle = document.getElementById('chkBicycle'),
	          chkUseDistrict = document.getElementById('chkUseDistrict');
	      
	      // 지도 타입을 제거합니다
	      for (var type in mapTypes) {
	          map.removeOverlayMapTypeId(mapTypes[type]);    
	      }

	      // 지적편집도정보 체크박스가 체크되어있으면 지도에 지적편집도정보 지도타입을 추가합니다
	      if (chkUseDistrict.checked) {
	          map.addOverlayMapTypeId(mapTypes.useDistrict);    
	      }
	      
	      // 지형정보 체크박스가 체크되어있으면 지도에 지형정보 지도타입을 추가합니다
	      if (chkTerrain.checked) {
	          map.addOverlayMapTypeId(mapTypes.terrain);    
	      }
	      
	      // 교통정보 체크박스가 체크되어있으면 지도에 교통정보 지도타입을 추가합니다
	      if (chkTraffic.checked) {
	          map.addOverlayMapTypeId(mapTypes.traffic);    
	      }
	      
	      // 자전거도로정보 체크박스가 체크되어있으면 지도에 자전거도로정보 지도타입을 추가합니다
	      if (chkBicycle.checked) {
	          map.addOverlayMapTypeId(mapTypes.bicycle);    
	      }
	      
	  }  	
	  

	  // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	  // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	  map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	  
	  
	  
	  
	  function handleRadioButtonChange() {
	    kakao.maps.event.addListener(map, 'dragend', function() {
	      var bounds = map.getBounds(); // 현재 지도의 영역을 가져옵니다
	      var sw = bounds.getSouthWest(); // 남서쪽
	      var ne = bounds.getNorthEast(); // 북동쪽

	      removeAllMarkers(); // 기존의 마커들을 모두 제거합니다

	      var selectedValue = document.querySelector('input[name="location"]:checked').value;
	      console.log("선택된 값:", selectedValue);
		 
	      globalVariable2 = selectedValue;
	      if (selectedValue === "hospital") {
	        console.log("동물병원 선택됨");
	        // 동물병원에 대한 처리를 수행합니다
			
	        $.ajax({
	          type: 'GET',
	          url: '/animingle/board/medicalHospital.do',
	          data: {
	            neLat: ne.getLat(),
	            neLng: ne.getLng(),
	            swLat: sw.getLat(),
	            swLng: sw.getLng(),
	            select: "hospital"
	          },
	          dataType: 'json',
	          success: function(result) {
	            $("#side tbody").html("");
	            createMarkersInBounds(result, bounds);
	            console.log(result);
	              if(result.length == 0){
	            	  $("#side tbody").append(`
	            			  <tr class="place-list">
	    	                  <th>현재 이곳에는 병원이 <br>존재하지 않아요<br><small id="small">&nbsp;&nbsp;٩(๑•̀o•́๑)و</small><br>
	    	                  <small id="small2">다른 곳으로 이동해주세요!!</small>
	    	                  </th>
	    	                  </tr>
	    	                `);
	              }
	            $(result).each((index, item) => {
	            //coords = new kakao.maps.LatLng(item.h_lat, item.h_lng);

	            console.log('item', item.h_seq);
	              $("#side tbody").append(`
           		  	<tr class="place-list" id="\${item.h_seq}" onclick="addside(\${item.h_seq}, \${item.h_lat}, \${item.h_lng})">
	                  <th>\${item.h_name}<small id="small">&nbsp;&nbsp;영업중</small><br>
	                  <small id="small2">\${item.h_address}</small>
	                </th>
	                </tr>
	              `);
	            });
	          },
	            error: function(a,b,c) {
	            	console.log(a,b,c);
	            }
	        });

	      } else if (selectedValue === "pharmacy") {
	        console.log("동물약국 선택됨");
	        // 동물약국에 대한 처리를 수행합니다
	        
	        $.ajax({
	          type: 'GET',
	          url: '/animingle/board/medicalPharmacy.do',
	          data: {
	            neLat: ne.getLat(),
	            neLng: ne.getLng(),
	            swLat: sw.getLat(),
	            swLng: sw.getLng(),
	            select: "pharmacy"
	          },
	          dataType: 'json',
	          success: function(result) {
	            $("#side tbody").html("");
	            createMarkersInBounds(result, bounds);
	            
	            if(result.length == 0){
            	  $("#side tbody").append(`
            			  <tr class="place-list">
    	                  <th>현재 이곳에는 약국이 <br>존재하지 않아요<br><small id="small">&nbsp;&nbsp;٩(๑•̀o•́๑)و</small><br>
    	                  <small id="small2">다른 곳으로 이동해주세요!!</small>
    	                  </th>
    	                  </tr>
    	                `);
              	}
	            
	            $(result).each((index, item) => {
	            console.log(result);
	            //coords = new kakao.maps.LatLng(item.p_lat, item.p_lng);
	              $("#side tbody").append(`
	                <tr class="place-list" id="\${item.p_seq}" onclick="addside2('\${item.p_seq}', \${item.p_lat}, \${item.p_lng})">
	                  <th>\${item.p_name}<small id="small">&nbsp;&nbsp;영업중</small><br>
	                  <small id="small2">\${item.p_address}</small>
	                </th>
	                </tr>
	              `);
	            });
	          }
	        });
	      }
	    });

	  }
	  
	  var markers = [];
	  
	  var radioButtons = document.querySelectorAll('input[name="location"]');
	  for (var i = 0; i < radioButtons.length; i++) {
	    radioButtons[i].addEventListener('change', handleRadioButtonChange);
	  }
	  
	  var markerImage1 = new kakao.maps.MarkerImage(
		'/animingle/asset/pic/hospital.png',  
	    new kakao.maps.Size(50, 50)
	  );
	  
	  var markerImage2 = new kakao.maps.MarkerImage(
		'/animingle/asset/pic/pharmacy.png',
	    new kakao.maps.Size(50, 50)
	  );
  

	  function removeAllMarkers() {
		  // 기존의 마커들을 모두 제거하는 로직을 구현합니다
		  for (var i = 0; i < markers.length; i++) {
		    markers[i].setMap(null);
		  }
		  markers = []; // 배열 초기화
		  console.log(markers);
		}
	  

	  function createMarkersInBounds(data, bounds) {
	    data.forEach(item => {
	      
	     if(item.h_lat != null) {
	      var coords = new kakao.maps.LatLng(item.h_lat, item.h_lng);
	      var markerImage3 = markerImage1;
	     } else {
	      var coords = new kakao.maps.LatLng(item.p_lat, item.p_lng);	
	      var markerImage3 = markerImage2;
	     }
	    	
	      if (bounds.getSouthWest().getLat() <= coords.getLat() && coords.getLat() <= bounds.getNorthEast().getLat() &&
	          bounds.getSouthWest().getLng() <= coords.getLng() && coords.getLng() <= bounds.getNorthEast().getLng()) {
	    	  
	        var marker = new kakao.maps.Marker({
	          map: map,
	          position: coords,
	          image: markerImage3,
	        });
	              
	        markers.push(marker);
	        marker.setMap(map);
	      }
	    });
	  }
	  
	});
	



</script>
</html>