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
<link rel="stylesheet" href="/animingle/asset/css/profile.css">
<link rel="stylesheet" href="/animingle/asset/css/mymenu.css">
<style>
</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<section class="content">
		<div class="mycontainer">
			<div class="leftbar">
				<!-- 왼쪽 사이드바 입니다. -->
				<div class="mymenu">
					<ul>
						<li class="selected"><span><img
								src="/animingle/asset/commonimg/stamp.png" class="stamp"></span><a
							href="/animingle/user/profile.do" class="ea">회원정보</a></li>
						<c:if test="${isVet != null }">
							<li><a href="/animingle/user/veterinary.do" class="ea">수의사프로필</a></li>
						</c:if>
						<c:if test="${isPet != null }">
							<li><a href="/animingle/user/petsitterprofile.do" class="ea">펫시터프로필</a></li>
						</c:if>
						
						<li><a href="/animingle/user/mypetsitter.do" class="ea">펫시터
								모집내역</a></li>
						<li><a href="/animingle/user/myauth.do" class="ea">인증센터</a></li>
						<li><a href="/animingle/user/myquest.do" class="ea">내
								문의사항</a></li>
					</ul>
				</div>
			</div>

			<div class="maincontent">
				<div class="content-top">
					<div class="content-title">회원 정보</div>
				</div>

				<div class="mypage-profile">
					<div class="mypage-profile-img">
						<form id="formpic" enctype="multipart/form-data">
							<c:if test="${socialLogin != null}">
								<img src="${dto.user_pic }" id="userpic">
							</c:if>
							<c:if test="${socialLogin == null }">
								<img src="/animingle/asset/pic/userpic/${dto.user_pic }" id="userpic" alt="${dto.user_pic }">
								
								<!-- 회원이 저장한 이미지로 변경 -->
								<input type="file" name="editpic" id="editpic" accept=".gif, .jpg, .png, .jpeg">
	
								<label for="editpic" id="btnlabel">
									사진 수정
								</label>
								<input type="hidden" value="${dto.user_pic }" name="oldpic" id="oldpic">
							</c:if>
	
						</form>
						<div class="mypage-profile-count">
						<table id="tblCount">
							<tr>
								<td>내 게시글</td>
								<td>${boardcnt }건</td>
							</tr>
							<tr>
								<td>내 댓글</td>
								<td>${commentcnt }건</td>
							</tr>
						</table>
					</div>
					</div>
					<form action="/animingle/user/profile.do" method="POST">
						<div class="mypage-profile-main">
							<div class="form-title">이름</div>
							<div>
								<input type="text" value="${dto.user_name }" readonly>
							</div>
							<div class="form-title">닉네임</div>
							<div>
								<input type="text" value="${dto.user_nickname }" name="user_nickname" id="nickname" maxlength="10">
							</div>
							<div class="form-title">주소</div>
							<div>
								<input type="text" value="${dto.user_address }"
									id="sample6_address" readonly class="address" name="user_address">
								<button type="button" onclick="sample6_execDaumPostcode();"
									class="search-btn">주소 검색</button>
								<div class="address-detail">
									<input type="text" value="${dto.user_addressdetail }"
										id="sample6_detailAddress" class="detail-address" name="user_addressdetail">
								</div>
							</div>
							<div class="form-title">연락처</div>
							<div>
								<input type="text" class="tel" id="tel1" name="tel1" maxlength="3"> - <input
									type="text" class="tel" id="tel2" name="tel2" maxlength="4"> - <input type="text"
									class="tel" id="tel3" name="tel3" maxlength="4">
							</div>
							<div class="mypage-edit">
								<button type="submit" onclick="check1()">수정</button>
							</div>
						</div>
					</form>

					<c:if test="${socialLogin == null }">
					<div>
						<form method="POST" action="/animingle/user/profilepwedit.do">
							<div class="mypage-profile-pw">
								<div class="form-title">현재 비밀번호</div>
								<div>
									<input type="password" placeholder="현재 비밀번호 입력" id="oldpw" maxlength="12">
								</div>
								<div class="form-title">새 비밀번호</div>
								<div>
									<input type="password" placeholder="새 비밀번호 입력" name="user_pw" id="pw1" maxlength="12">
								</div>
								<div class="form-title">새 비밀번호 확인</div>
								<div>
									<input type="password" placeholder="새 비밀번호 확인" name="user_pw" id="pw2" maxlength="12">
								</div>
								<div class="mypage-edit">
									<button type="submit" id="btn-edit-pw" onclick="check2();">비밀번호 변경하기</button>
								</div>
							</div>
						</form>
					</div>
					</c:if>
					
					
					
				</div>
			</div>
			<div class="rightbar">
				<!-- 오른쪽 사이드바 입니다. -->
			</div>
		</div>

	</section>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	
	//전화번호 넣어주는 코드
	let tel = '${dto.user_tel}';
	let telarr = tel.split('-');
	$('#tel1').val(telarr[0]);
	$('#tel2').val(telarr[1]);
	$('#tel3').val(telarr[2]);

	//주소 검색하는 api
	function sample6_execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수
	
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            /* document.getElementById('sample6_postcode').value = data.zonecode; */
	            document.getElementById("sample6_address").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("sample6_detailAddress").focus();
	        }
	    }).open();
	}
	
	$('#editpic').change(function() {
		
		editPic();
		
	});
	
	function editPic() {
		
			let formData = new FormData(document.getElementById('formpic'));
			
			$.ajax ({
				type: "POST",
				url: '/animingle/user/profilepicedit.do',
				
				enctype: 'multipart/form-data',
				processData: false,
				contentType: false,
				
				data: formData,
	
				dataType: 'json',
				success: (result)=>{
					
					$('#userpic').attr("src","/animingle/asset/pic/userpic/" + result.userpic);
					$('#oldpic').val(result.userpic);
					alert('변경이 완료되었습니다.');
					
				},
				error: (a,b,c)=>console.log(a,b,c)
				
			});

	}
	
	var oldpwok = false;
	var pw1ok = false;
	var pw2ok = false;
	var nickok = true;
	
	var tel1ok = true;
	var tel2ok = true;
	var tel3ok = true;
	
	<c:if test="${socailLogin != null}">
		tel1ok = false;
		tel2ok = false;
		tel3ok = false;
	</c:if>
	
	
	<c:if test="${socailLogin == null }">
	//유효성 검사 - 1. 현재 비밀번호 확인
	var oldpwresultDiv = document.createElement("div");
	oldpwresultDiv.style.color = "#FC5230";
	oldpwresultDiv.style.marginBottom = "15px";
	oldpwresultDiv.style.height = '15px';

	var parentDiv = document.getElementById("oldpw").parentNode;
	parentDiv.insertBefore(oldpwresultDiv, document.getElementById("oldpw").nextSibling);

	$('#oldpw').on('keyup', function() {
	   if ($('#oldpw').val() != '${dto.user_pw}') {
	      
	      $('#oldpw').css('outline', '1px solid #FC5230');
	      oldpwresultDiv.textContent = "현재 비밀번호와 불일치합니다.";
	      oldpwresultDiv.style.color = "#FC5230";
	      oldpwok = false;
	      
	   } else {
	      
	      $('#oldpw').css('outline', '1px solid #0256AA');
	      oldpwresultDiv.textContent = "현재 비밀번호와 일치합니다.";
	      oldpwresultDiv.style.color = "#0256AA";
	      oldpwok = true;
	   }

	});

	//유효성 검사 - 2. 비밀번호
	var pwRegExp = /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,12}$/;
	//유효성 검사 결과 나타낼 div 생성
	var pwresultDiv = document.createElement("div");
	pwresultDiv.style.color = "#FC5230";
	pwresultDiv.style.marginBottom = "15px";
	pwresultDiv.style.height = '15px';

	var parentDiv = document.getElementById("pw1").parentNode;
	parentDiv.insertBefore(pwresultDiv, document.getElementById("pw1").nextSibling);


	$('#pw1').on('keyup', function() {
	   
	   var pw = $('#pw1').val();

	   if (!pwRegExp.test(pw)) {
	      
	      pwresultDiv.textContent = "비밀번호는 영문 대소문자와 숫자 포함 6~12자리로 입력해주세요.";
	      $('#pw1').css('outline', '1px solid #FC5230');
	  	  pwresultDiv.style.color = "#FC5230";
	      pw1ok = false;
	      
	   } else {
	      
	      $('#pw1').css('outline', '1px solid #0256AA');
	      pwresultDiv.textContent = "올바른 비밀번호 입니다.";
	      pwresultDiv.style.color = "#0256AA";
	      pw2ok = true;
	      
	   }

	});
	   
	   
	//유효성 검사 - 3. 비밀번호 확인
	var pw2resultDiv = document.createElement("div");
	pw2resultDiv.style.color = "#FC5230";
	pw2resultDiv.style.marginBottom = "15px";
	pw2resultDiv.style.height = '15px';

	var parentDiv = document.getElementById("pw2").parentNode;
	parentDiv.insertBefore(pw2resultDiv, document.getElementById("pw2").nextSibling);

	$('#pw2').on('keyup', function() {
	   if ($('#pw1').val() != $('#pw2').val()) {
	      
	      $('#pw2').css('outline', '1px solid #FC5230');
	      pw2resultDiv.textContent = "입력하신 비밀번호와 불일치합니다.";
	      pw2resultDiv.style.color = "#FC5230";
	      pw1ok = false;
	      
	   } else {
	      
	      $('#pw2').css('outline', '1px solid #0256AA');
	      pw2resultDiv.textContent = "입력하신 비밀번호와 일치합니다.";
	      pw2resultDiv.style.color = "#0256AA";
	      pw1ok = true;
	   }

	});
	
	
	function check2() {
		if (oldpwok && pw1ok && pw2ok) {
			if(!confirm('정말로 변경하시겠습니까?')) event.preventDefault();
		} else {
			alert('비밀번호를 다시 확인해 주세요.');
			event.preventDefault();
		}
	}

	</c:if>
	
	//유효성 검사 - 4. 닉네임
	var nicknameRegExp = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,10}$/;
	//유효성 검사 결과 나타낼 div 생성
	var nickresultDiv = document.createElement("div");
	nickresultDiv.style.color = "#FC5230";
	nickresultDiv.style.marginBottom = "15px";
	nickresultDiv.style.height = '15px';

	var parentDiv = document.getElementById("nickname").parentNode;
	parentDiv.insertBefore(nickresultDiv, document.getElementById("nickname").nextSibling);

	$('#nickname').on('keyup', function() {
	   
	   var nickname = $('#nickname').val();

	   if (!nicknameRegExp.test(nickname)) {
	      
	      nickresultDiv.textContent = "닉네임은 2~10 글자 이내로 입력해주세요.";
	      $('#nickname').css('outline', '1px solid #FC5230');
	  	  nickresultDiv.style.color = "#FC5230";
	  	  nickok = false;
	      
	   } else {
	      
	      $('#nickname').css('outline', '1px solid #0256AA');
	      nickresultDiv.textContent = "올바른 닉네임입니다.";
	      nickresultDiv.style.color = "#0256AA";
	      nickok = true;
	      
	   }

	});
	
	   
	//유효성 검사 - 7. 전화번호
	var telRegExp = /^[0-9]{3}$/;
	var tel2RegExp = /^[0-9]{3,4}$/;
	$('#tel1').on('keyup', function() {
	   
	   var tel1 = $('#tel1').val();

	   if (!telRegExp.test(tel1)) {
	      
	      $('#tel1').css('outline', '1px solid #FC5230');
	      tel1ok = false;
	      
	   } else {
	      
	      $('#tel1').css('outline', '1px solid #ADB5BD');
	      tel1ok = true;
	      
	   }      
	});

	$('#tel2').on('keyup', function() {
	   
	   var tel2 = $('#tel2').val();

	   if (!tel2RegExp.test(tel2)) {
	      
	      $('#tel2').css('outline', '1px solid #FC5230');
	      tel2ok = false;
	      
	   } else {
	      
	      $('#tel2').css('outline', '1px solid #ADB5BD');
	      tel2ok = true;
	      
	   }

	});

	$('#tel3').on('keyup', function() {
	      
	   var tel3 = $('#tel3').val();

	   if (!tel2RegExp.test(tel3)) {
	      
	      $('#tel3').css('outline', '1px solid #FC5230');
	      tel3ok = false;
	      
	   } else {
	      
	      $('#tel3').css('outline', '1px solid #ADB5BD');
	      tel3ok = true;
	         
	   }

	});
	
	
	function check1() {
		if (nickok && tel1ok && tel2ok && tel3ok) {
			if(!confirm('정말로 변경하시겠습니까?')) event.preventDefault();
		} else {
			alert('내용이 올바르지 않습니다.');
			event.preventDefault();
		}
	}
	

	

</script>
</body>
</html>