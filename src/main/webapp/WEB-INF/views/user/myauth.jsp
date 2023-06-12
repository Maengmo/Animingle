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
            			<c:if test="${isVet != null }">
		            		<li><a href="/animingle/user/veterinary.do" class="ea">수의사 프로필</a></li>
	            		</c:if>
						<c:if test="${isPet != null }">
		            		<li><a href="/animingle/user/petsitterprofile.do" class="ea">펫시터 프로필</a></li>
						</c:if>	
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
					
					<img src="/animingle/asset/commonimg/logo_01.png" class="logoimg">
				
					<table class="tblcontent">
						<tr>
							<th>동물등록 칩</th>
							<c:if test="${animalnum == null }">
								<td id="auth-animal" class="authing">인증하기</td>
							</c:if>
							<c:if test="${animalnum != null }">
								<td id="authed-animal" class="authed">인증완료 (등록번호 : ${animalnum})</td>
							</c:if>
						</tr>
						<tr>
							<th>펫시터</th>
							<c:if test="${authdate == null }">
								<td id="auth-petsitter" class="authing">인증하기</td>
							</c:if>
							<c:if test="${authdate != null }">
								<td id="authed-petsitter" class="authed">인증완료 (인증날짜 : ${authdate})</td>
							</c:if>
						</tr>
						<tr>
							<th>수의사</th>
							<c:if test="${licensenum == null}">
								<td id="auth-doctor" class="authing">인증하기</td>
							</c:if>
							<c:if test="${licensenum != null}">
								<td id="authed-doctor" class="authed">인증완료 (면허번호 : ${licensenum })</td>
							</c:if>
							
						</tr>
					</table>
				</div>   

				<div id="myModal" class="modal">
				  <div class="modal-content">
				    <span class="close" onclick="closeModal()">&times;</span>
				    <h2 id="modal-title"></h2>
				    <p id="modal-description"></p>
				    <input type="text" id="registration-input" placeholder="등록 정보를 입력하세요">
				    <input type="hidden" id="registration-type" name="registration-type">
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
	    openModal('동물 등록', '동물 등록 번호를 입력하세요:');
      });
	
	/* 펫시터 등록 클릭 시 */
	  $('#auth-petsitter').click(function() {
		    openModal('펫시터 등록', '주민등록번호를 입력하세요:');
	  });
	
	  $('#auth-doctor').click(function() {
		    openModal('수의사 등록', '수의사 등록 번호를 입력하세요:');
	  });
	  
	});
	
	
	function openModal(title, description) {
		  $('#modal-title').text(title);
		  $('#modal-description').text(description);
		  $('#myModal').css('display', 'block');
		  
		  if (title == '동물 등록') {
			  $('#registration-type').val('pet');
		  } else if (title == '펫시터 등록') {
			  $('#registration-type').val('petsitter');
		  } else if (title == '수의사 등록') {
			  $('#registration-type').val('vet');
		  }
		  
		  
		}

	function closeModal() {
	  $('#myModal').css('display', 'none');
	  $('#registration-input').val('');
	  $('#registration-type').val('');
	}

	function register() {
	  var registrationInfo = $('#registration-input').val();
	  var registrationType = $('#registration-type').val();
	  var title = $('#modal-title').text();
	  // 등록 정보를 추가

	  $.ajax({
		  type: 'POST',
		  url: '/animingle/user/myauth.do',
		  data: {
			  regType: registrationType,
			  regInfo: registrationInfo,
		  },
		  success: (result) =>{
			  
			  if (result == 1) {
				  
				  alert('인증이 완료되었습니다!');
				  
				  if (registrationType == 'pet') {
				  	location.href = "/animingle/user/profile.do";					  
				  } else if (registrationType == 'petsitter') {
				  	location.href = "/animingle/user/petsitterprofile.do";					  
				  } else if (registrationType == 'vet') {
				  	location.href = "/animingle/user/veterinary.do";					  
				  }
				  
			  } else {
				  alert('인증이 실패했습니다.');
				  history.back();
			  }
			  
		  },
		  error: (a,b,c)=>console.log(a,b,c)
	  });
	  
	  // 등록 처리 후 닫기
	  closeModal();
	}
	
</script>
</body>
</html>