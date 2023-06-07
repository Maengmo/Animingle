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
            <form method="POST"  action="/animingle/user/join.do" enctype="multipart/form-data" onsubmit="return checkForm();">
              <fieldset class="join-form">
                  <h2 class="join-title">회원 가입</h2>
                  <span class="join-label">아이디</span>
                  <div class="div-wrap" id="login-div">
                      <input type="text" name="id" class="id" placeholder="6~12자 이내로 입력해주세요" required>
                      <input type="button" name="dupliBtn" id="dupli-Btn" class="dupli-Btn" value="중복 확인">
                  </div>
                  <div>
                  	<span class="join-label">비밀번호</span>
                      <input type="password" name="pw" class="pw" id="pw1" placeholder="최소 6~20자 이상(알파벳, 숫자 필수)" required>
                  </div>
                  <div>  
                  	<span class="join-label">비밀번호 확인</span>
                      <input type="password" class="pw" id="pw2" placeholder="비밀번호 확인" required>
                  </div>
                  <div id ="nickname-div">
                  	<span class="join-label">닉네임</span>
                      <input type="text" name="nickname" class="nickname" id="nickname" placeholder="2~10 글자 이내로 입력해주세요." required>
                  </div>
                  <div id="name-div">
                  	<span class="join-label">이름</span>
                      <input type="text" name="name" class="name" id="name" placeholder="한글 2~8 글자 이내로 입력해주세요." required>
                  </div>
                  <span class="join-label">생년월일</span>
                  <div>
                     <input type="date" name="birthday" id="birthday" class="birthday" name="birthday" required>
                  </div>
                  
                  <span class="join-label">전화번호</span>
                  <div>
                      <input type="text" name="tel1" class="tel" id="tel1" required maxlength="3"> - 
                      <input type="text" name="tel2" class="tel" id="tel2" required maxlength="4"> - 
                      <input type="text" name="tel3" class="tel" id="tel3" required maxlength="4"> 
                  </div>
                  
                  <span class="join-label">이메일</span>
                  <div>
                      <input type="text" name="email1" class="email" id="email1" placeholder="email" required> @
                      <select class="email" name="email2" id="email2" required>
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
                      <input type="text" name="address" id="sample6_address" class="address" placeholder="주소" required>
                      <input type="button" class="search-btn" value="주소 검색" onclick="sample6_execDaumPostcode()">
                  </div>
                  <div>
                      <input type="text" name="addressdetail" id="sample6_detailAddress" class="detail-address" placeholder="상세 주소" required>
                  </div>
                  
                  <span class="join-label">반려동물 여부</span>
                  <div class="select">
                      <input type="radio" id="select" class="pets" name="pets" value="o" checked><label for="select">반려동물 O</label>
                      <input type="radio" id="select2" class="pets" name="pets" value="x"><label for="select2">반려동물 X</label>
                 </div>
                  <div class="upload-file">
                      <span class="join-label">프로필 이미지</span>
                      <input type="text" class="file-name" value="첨부파일" placeholder="첨부파일" readonly>
                      <label for="pic">파일 업로드</label> 
                      <input type="file" name="profile" id="pic">
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
</script>
</body>
</html>
