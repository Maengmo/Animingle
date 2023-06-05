<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>회원 가입</title>
   <%@ include file="/WEB-INF/views/inc/asset.jsp" %>
   <link rel="stylesheet" href="/animingle/asset/css/index.css">
   <link rel="stylesheet" href="/animingle/asset/css/join.css">

</head>
<body>

   <%@ include file="/WEB-INF/views/inc/header.jsp" %>
   <section class="content">
      <div class="mycontainer">
         <div class="leftbar">
            <!-- 왼쪽 사이드바 입니다. -->
         </div>
         <div class="maincontent">
            <img class="banner-img" src="/animingle/asset/commonimg/logo_01.png" style="width:35%;">

            <!-- 회원가입 폼 -->
            <form action="" method="post">
              <fieldset class="join-form">
                  <h2 class="join-title">회원 가입</h2>
                  <span class="join-label">아이디</span>
                  <div class="div-wrap" id="login-div">
                      <input type="text" name="id" class="id" placeholder="6~12자 이내로 입력해주세요" required>
                      <input type="button" name="dupliBtn" id="dupli-Btn" class="dupli-Btn" value="중복 확인">
                  </div>
                  <div>
                  	<span class="join-label">비밀번호</span>
                      <input type="password" class="pw" id="pw1" placeholder="최소 6~20자 이상(알파벳, 숫자 필수)" required>
                  </div>
                  <div>  
                  	<span class="join-label">비밀번호 확인</span>
                      <input type="password" class="pw" id="pw2" placeholder="비밀번호 확인" required>
                  </div>
                  <div id ="nickname-div">
                  	<span class="join-label">닉네임</span>
                      <input type="text" class="nickname" id="nickname" placeholder="2~10 글자 이내로 입력해주세요." required>
                  </div>
                  <div id="name-div">
                  	<span class="join-label">이름</span>
                      <input type="text" class="name" id="name" placeholder="한글 2~8 글자 이내로 입력해주세요." required>
                  </div>
                  <span class="join-label">생년월일</span>
                  <div>
                     <input type="date" id="birthday" class="birthday" name="birthday" required>
                  </div>
                  
                  <span class="join-label">전화번호</span>
                  <div>
                      <input type="text" class="tel" id="tel1" required maxlength="3"> - 
                      <input type="text" class="tel" id="tel2" required maxlength="4"> - 
                      <input type="text" class="tel" id="tel3" required maxlength="4"> 
                  </div>
                  
                  <span class="join-label">이메일</span>
                  <div>
                      <input type="text" class="email" id="email1" placeholder="email" required> @
                      <select class="email" id="email2" required>
                          <option checked>gmail.com</option>
                          <option>naver.com</option>
                          <option>nate.com</option>
                          <option>yahoo.com</option>
                          <option>hanmail.com</option>
                      </select>
                  </div>
                  
                  <span class="join-label">주소</span>
                  <div>
                      <input type="text" id="sample6_postcode" class="post-num" placeholder="우편번호">
                      <input type="text" id="sample6_address" class="address" placeholder="주소">
                      <input type="button" class="search-btn" value="주소 검색" onclick="sample6_execDaumPostcode()">
                  </div>
                  <div>
                      <input type="text" id="sample6_detailAddress" class="detail-address" placeholder="상세 주소">
                  </div>
                  
                  <span class="join-label">반려동물 여부</span>
                  <div class="select">
                      <input type="radio" id="select" name="pet"><label for="select">반려동물 O</label>
                      <input type="radio" id="select2" name="pet"><label for="select2">반려동물 X</label>
                 </div>
                  <div class="upload-file">
                      <span class="join-label">프로필 이미지</span>
                      <input type="text" class="file-name" value="첨부파일" placeholder="첨부파일" readonly required>
                      <label for="pic">파일 업로드</label> 
                      <input type="file" id="pic">
                  </div>

                  <div>
                      <input type="submit" class="create-accouont-btn" value="Create Account">
                  </div>

                  <div class="move-to-login">
                      Already have an account? <a href="http://localhost:8090/animingle/user/login.do" id="logIn">Log in</a>
                  </div>
              </fieldset>
          </form>

         </div>
         <div class="rightbar">
            <!-- 오른쪽 사이드바 입니다. -->
         </div>
      </div>

   </section>
   <%@ include file="/WEB-INF/views/inc/footer.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/animingle/asset/js/join.js"></script>
<script>

	$('#dupli-Btn').on('click', function() {
		
		$.ajax({
			type : 'POST',
			url : '/animingle/user/checkid.do',
			data : {
				id : $('.id').val()
			},
			dataType : 'json',
			success : result => {
				if (result.result == 1) {
					alert("중복된 아이디가 존재합니다.");
					$('.id').val('');
					$('.id').focus();
				} else {
					alert("사용 가능한 아이디입니다.");
					$('#pw1').focus();
				}
			},
			error : (a,b,c) => console.log(a,b,c)
		});
		
	});
	
	//유효성 검사 - 1. 아이디
	//아이디 정규식 (첫번째 글자 소문자로 시작, 영어 대소문자 사용 가능, 6자-12자 이내)
	var idRegExp = /^[a-z][a-zA-z0-9]{5,11}$/; 
	//유효성 검사 결과 나타낼 div 생성
	var idresultDiv = document.createElement("div");
	idresultDiv.style.color = "#FC5230";
	idresultDiv.style.marginTop = "-20px";
	idresultDiv.style.marginBottom = "20px";
	
	var parentDiv = document.getElementById("login-div").parentNode;
	parentDiv.insertBefore(idresultDiv, document.getElementById("login-div").nextSibling);
	
	
	$('.id').on('keyup', function() {
		
		var id = $('.id').val();

		if (!idRegExp.test(id)) {
			
			idresultDiv.textContent = "아이디는 영문 대소문자와 숫자 포함 6~12자리로 입력해주세요.";
			$('.id').css('outline', '1px solid #FC5230');
			
			return false;
		} else {
			
			$('.id').css('outline', '1px solid #ADB5BD');
			idresultDiv.textContent = "";
			
			
		}

	});
	
	
	//유효성 검사 - 2. 비밀번호
	var pwRegExp = /^[a-zA-z0-9]{6,12}$/; 
	//유효성 검사 결과 나타낼 div 생성
	var pwresultDiv = document.createElement("div");
	pwresultDiv.style.color = "#FC5230";
	pwresultDiv.style.marginTop = "-20px";
	pwresultDiv.style.marginBottom = "20px";
	
	var parentDiv = document.getElementById("pw1").parentNode;
	parentDiv.insertBefore(pwresultDiv, document.getElementById("pw1").nextSibling);
	
	
	$('#pw1').on('keyup', function() {
		
		var pw = $('#pw1').val();

		if (!pwRegExp.test(pw)) {
			
			pwresultDiv.textContent = "비밀번호는 영문 대소문자와 숫자 포함 6~12자리로 입력해주세요.";
			$('#pw1').css('outline', '1px solid #FC5230');
			
			return false;
		} else {
			
			$('#pw1').css('outline', '1px solid #ADB5BD');
			pwresultDiv.textContent = "";
			
			
		}

	});
	
	
	//유효성 검사 - 3. 비밀번호 확인
	var pw2resultDiv = document.createElement("div");
	pw2resultDiv.style.color = "#FC5230";
	pw2resultDiv.style.marginTop = "-20px";
	pw2resultDiv.style.marginBottom = "20px";
	
	var parentDiv = document.getElementById("pw2").parentNode;
	parentDiv.insertBefore(pw2resultDiv, document.getElementById("pw2").nextSibling);
	
	$('#pw2').on('keyup', function() {
		if ($('#pw1').val() != $('#pw2').val()) {
			
			$('#pw2').css('outline', '1px solid #FC5230');
			pw2resultDiv.textContent = "입력하신 비밀번호와 불일치합니다.";
			
		} else {
			
			$('#pw2').css('outline', '1px solid #0256AA');
			pw2resultDiv.textContent = "입력하신 비밀번호와 일치합니다.";
			pw2resultDiv.style.color = "#0256AA";
		}
	
	});
	
	
	//유효성 검사 - 4. 닉네임
	var nicknameRegExp = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,10}$/;
	//유효성 검사 결과 나타낼 div 생성
	var nickresultDiv = document.createElement("div");
	nickresultDiv.style.color = "#FC5230";
	nickresultDiv.style.marginTop = "-20px";
	nickresultDiv.style.marginBottom = "20px";
	
	var parentDiv = document.getElementById("nickname-div").parentNode;
	parentDiv.insertBefore(nickresultDiv, document.getElementById("nickname-div").nextSibling);
	
	$('#nickname').on('keyup', function() {
		
		pw2resultDiv.textContent = "";
		$('#pw2').css('outline', '1px solid #ADB5BD');
		
		
		var nickname = $('#nickname').val();

		if (!nicknameRegExp.test(nickname)) {
			
			nickresultDiv.textContent = "닉네임은 2~10 글자 이내로 입력해주세요.";
			$('#nickname').css('outline', '1px solid #FC5230');
			
			return false;
		} else {
			
			$('#nickname').css('outline', '1px solid #ADB5BD');
			nickresultDiv.textContent = "";
			
			
		}
	
	});
	
	
	//유효성 검사 - 5. 이름
	var nameRegExp = /^[가-힣]{2,8}$/;
	
	//유효성 검사 결과 나타낼 div 생성
	var nameresultDiv = document.createElement("div");
	nameresultDiv.style.color = "#FC5230";
	nameresultDiv.style.marginTop = "-20px";
	nameresultDiv.style.marginBottom = "20px";
	
	var parentDiv = document.getElementById("name-div").parentNode;
	parentDiv.insertBefore(nameresultDiv, document.getElementById("name-div").nextSibling);
	
	$('#name').on('keyup', function() {
		
		var name = $('#name').val();

		if (!nameRegExp.test(name)) {
			
			nameresultDiv.textContent = "이름은 한글 2~8 글자 이내로 입력해주세요.";
			$('#name').css('outline', '1px solid #FC5230');
			
			return false;
		} else {
			
			$('#name').css('outline', '1px solid #ADB5BD');
			nameresultDiv.textContent = "";
			
			
		}
	
	});
	
	
	//유효성 검사 - 5. 전화번호
	var telRegExp = /^[0-9]{3}$/;
	var tel2RegExp = /^[0-9]{3,4}$/;
	$('#tel1').on('keyup', function() {
		
		var tel1 = $('#tel1').val();

		if (!telRegExp.test(tel1)) {
			
			$('#tel1').css('outline', '1px solid #FC5230');
			
		} else {
			
			$('#tel1').css('outline', '1px solid #ADB5BD');
			
			
		}		
	});
	
	$('#tel2').on('keyup', function() {
		
		var tel2 = $('#tel2').val();

		if (!tel2RegExp.test(tel2)) {
			
			$('#tel2').css('outline', '1px solid #FC5230');
			
		} else {
			
			$('#tel2').css('outline', '1px solid #ADB5BD');
			
			
		}

	});
	
	$('#tel3').on('keyup', function() {
			
		var tel3 = $('#tel3').val();
	
		if (!tel2RegExp.test(tel3)) {
			
			$('#tel3').css('outline', '1px solid #FC5230');
			
		} else {
			
			$('#tel3').css('outline', '1px solid #ADB5BD');
			
				
			}

	});


</script>
</body>
</html>
