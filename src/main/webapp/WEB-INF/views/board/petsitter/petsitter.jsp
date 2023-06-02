<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>Insert title here</title>
   <%@ include file="/WEB-INF/views/inc/asset.jsp" %>
   <link rel="stylesheet" href="/animingle/asset/css/index.css">
   <link rel="stylesheet" href="/animingle/asset/css/petsitter.css">
   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
   <style>
   .profile-img {
   		width : 30px;
   		height : 30px;
   		padding : 5px;
   		border : 2px solid #F0F0F0;
   		border-radius : 10px;
   }
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
            <div class="content-top">
               <div class="content-title">나의 동물친구 펫시터를 구해요</div>
               <div class="content-filter">
                  <form action="#">
                       <button>모집중</button>
                       <button>모집완료</button>
                       <button>전체보기</button>
                  </form>
               </div>
               <form action="#">
                  <div class="search-box">
                  		<select name="" class="search-filter">
                  			<option selected>지역</option>
                  			<option>제목</option>
                  		</select>
                       <input class="content-search" type="text" placeholder="검색">
                       <span class="material-symbols-outlined">
	                     search
	                  </span>
                  </div>
               </form>
            </div>
            
            
            <!-- 게시글 목록 -->
            <div class="board">
	            <div class="item-wrap">
	            	<div>
	            		<img src="/animingle/asset/pic/pic.jpg" alt="프로필이미지" class="profile-img" id="profile-img"> 
	            		밍글밍글(mingle77)
	            		<div>16분전</div>
	            		<div class="recruit-state">
	            			모집중
	            		</div>
	            	</div>
	            	<div>골든 리트리버 3살 3일간 맡아주실 분~!</div>
	            	<div>
	            		<span>[2023.05.03 08:00 ~ 20:00]</span>
	            		<span>서울시 강남구 역삼동</span>
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