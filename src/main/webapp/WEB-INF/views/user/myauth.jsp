<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>인증 센터</title>
	<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
	<link rel="stylesheet" href="/animingle/asset/css/mymenu.css">
	<link rel="stylesheet" href="/animingle/asset/css/myauth.css">
</head>
<style>
	
	
</style>
<body>

	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	<section class="content">
		<div class="mycontainer">
			<div class="leftbar">
				<!-- 왼쪽 사이드바 입니다. -->
				<div class="mymenu">
	            	<ul>
	            		<li><a href="/animingle/user/profile.do" class="ea">회원정보</a></li>
	            		<li><a href="/animingle/user/veterinary.do" class="ea">수의사 프로필</a></li>
	            		<li><a href="/animingle/user/petsitterprofile.do" class="ea">펫시터 프로필</a></li>
	            		<li><a href="/animingle/user/mypetsitter.do" class="ea">펫시터 모집내역</a></li>
	            		<li class="selected"><span><img src="/animingle/asset/commonimg/stamp.png" class="stamp"></span><a href="/animingle/user/myauth.do" class="ea">인증센터</a></li>
	            		<li><a href="/animingle/user/myquest.do" class="ea">내 문의사항</a></li>
	            	</ul>
            	</div>
			</div>
			<div class="maincontent">
				<div class="content-top">
					<div class="content-title">인증 센터</div>
				</div>
				    
				<div class="pr-content">
					<table class="tblcontent">
						<tr>
							<th>동물등록 칩</th>
							<td id="auth-animal">인증하기</td>
						</tr>
						<tr>
							<th>펫시터</th>
							<td id="auth-petsitter">인증하기</td>
						</tr>
						<tr>
							<th>수의사</th>
							<td id="auth-doctor">인증하기</td>
						</tr>
					</table>
				</div>   

				<div id="myModal" class="modal">
				  <div class="modal-content">
				    <span class="close" onclick="closeModal()">&times;</span>
				    <h2 id="modal-title"></h2>
				    <p id="modal-description"></p>
				    <input type="text" id="registration-input" placeholder="등록 정보를 입력하세요">
				    <button onclick="register()">등록</button>
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
<script>
	
	/* 동물 등록 클릭 시 */
	$(document).ready(function() {
	  $('#auth-animal').click(function() {
	    openModal('동물 등록', '동물 등록 정보를 입력하세요:');
      });
	
	/* 펫시터 등록 클릭 시 */
	  $('#auth-petsitter').click(function() {
		    openModal('펫시터 등록', '펫시터 등록 정보를 입력하세요:');
	  });
	
	  $('#auth-doctor').click(function() {
		    openModal('수의사 등록', '수의사 등록 정보를 입력하세요:');
	  });
	  
	});
	
	
	function openModal(title, description) {
		  $('#modal-title').text(title);
		  $('#modal-description').text(description);
		  $('#myModal').css('display', 'block');
		}

	function closeModal() {
	  $('#myModal').css('display', 'none');
	  $('#registration-input').val('');
	}

	function register() {
	  var registrationInfo = $('#registration-input').val();
	  // 등록 정보를 추가
	  console.log("등록 정보:", registrationInfo);
	  // 등록 처리 후 닫기
	  closeModal();
	}
</script>
</body>
</html>