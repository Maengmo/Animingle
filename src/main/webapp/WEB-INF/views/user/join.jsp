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
                  <div class="div-wrap">
                      <input type="text" name="id" class="id" placeholder="아이디(6~12자, alphabet, number)">
                      <input type="button" name="dupliBtn" id="dupli-Btn" class="dupli-Btn" value="중복 확인">
                  </div>
                  <div>
                      <input type="password" class="pw" id="pw1" placeholder="비밀번호(alpabet, number 6~20, Case)">
                  </div>
                  <div>  
                      <input type="password" class="pw" id="pw2" placeholder="비밀번호 확인">
                  </div>
                  <div>
                      <input type="text" class="nickname" id="nickname" placeholder="닉네임(2~10글자)">
                  </div>
                  <div>
                      <input type="text" class="name" id="name" placeholder="이름(한글 2~8글자)">
                  </div>
                  <div>
                      생년월일 <input type="date" id="birthday" class="birthday" name="birthday">
                  </div>
                  <div>
                      <input type="number" class="tel" id="tel1" value="010" readonly> - 
                      <input type="number" class="tel" id="tel2" min="0"> - 
                      <input type="number" class="tel" id="tel3" min="0"> 
                  </div>
                  <div>
                      <input type="text" class="email" id="email1" placeholder="email"> @
                      <select class="email" id="email2">
                          <option checked>gmail.com</option>
                          <option>naver.com</option>
                          <option>nate.com</option>
                          <option>yahoo.com</option>
                          <option>hanmail.com</option>
                      </select>
                  </div>
                  <div>
                      <input type="text" id="sample6_postcode" class="post-num" placeholder="우편번호">
                      <input type="text" id="sample6_address" class="address" placeholder="주소">
                      <input type="button" class="search-btn" value="주소 검색" onclick="sample6_execDaumPostcode()">
                  </div>
                  <div>
                      <input type="text" id="sample6_detailAddress" class="detail-address" placeholder="상세 주소">
                  </div>
                  <div class="select">
                      <input type="radio" id="select" name="pet"><label for="select">반려동물 O</label>
                      <input type="radio" id="select2" name="pet"><label for="select2">반려동물 X</label>
                 </div>
                  <div class="upload-file">
                      프로필 이미지
                      <input type="text" class="file-name" value="첨부파일" placeholder="첨부파일" readonly>
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
</body>
</html>




</body>
</html>