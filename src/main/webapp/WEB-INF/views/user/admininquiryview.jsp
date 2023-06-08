<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>고객센터 문의현황</title>
   <%@ include file="/WEB-INF/views/inc/asset.jsp" %>
   <link rel="stylesheet" href="/animingle/asset/css/index.css">
   <link rel="stylesheet" href="/animingle/asset/css/admininquiryview.css">
</head>
<body>

   <%@ include file="/WEB-INF/views/inc/header.jsp" %>
   <section class="content">
      <div class="mycontainer">
         <div class="leftbar">
            <!-- 왼쪽 사이드바 입니다. -->
         </div>
         <div class="maincontent">       
	        <div class="content-box">
	            	<div class="detail-content">
	            		<div>
		            		<div class="content-title">
		            			<c:if test="${indto.in_prefix} == 1">
		            				<div>[문의]</div>
		            			</c:if>
		            		${indto.in_subject }</div>
		            		<span class="content-time">16분전</span>
		            	</div>
		            	<div class="detail-config">
		            		<span>[2023.05.03 08:00 ~ 20:00]</span>
		            		<span>서울시 강남구 역삼동</span>
		            	</div>
		            	
		            	<div class="content-text">
			            	3살 된 골든 리트리버입니다. 3개월 아닙니다. <br>
							순하고 착해요.. 산책만 하루에 2번 시켜 주시고 사료는 소분해서 잘 보이는 곳에 뒀습니다.<br>
							산책 꼭 시켜주셔야 됩니다 ㅠㅠ 아이가 밖에서만 배변을 해서...<br>
							부탁 드리겠습니다. <br><br>
							사례비: 15만원 <br>
							olo-48s3-7q23 연락 부탁드립니다ㅠ
		            		
		            		<img src="/animingle/asset/pic/dog.jpg" alt="반려동물 이미지" width="100%">
		            	</div>
	            	
			
	            		
		            <div class="applicant-list">
		            	<span class="applicant-list-title">신청자 목록</span>
		            	<div class="list-item">
		            		<div class="list-item-div">
		            			<div>
		            			<img src="/animingle/asset/pic/pic.jpg" alt="프로필이미지" class="applicant-profile-img" id="profile-img"> 
		            			</div>
		            			
		            			<div class="item-div2">
		            				<div class="applicant-id">펫시터1(ilovedog22)</div>
		            				<div>돌봄 횟수 : 15회</div>
		            				<div>별점 : 4.5</div>
		            			</div>
		            			
		            			<div>
		            				<button type="button" class="applicant-btn">채팅하기</button>
		            				<button type="button" class="applicant-btn">맡기기</button>
		            			</div>
		            			
		            		</div>
		            		<div class="info">
		            			강아지 사랑<br>
		            			나라 사랑<br>
		            			나라에서 허락한 유일한 마약 = 강아지!	            			
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</body>
</html>