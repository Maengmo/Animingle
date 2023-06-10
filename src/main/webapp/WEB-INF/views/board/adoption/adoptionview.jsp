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
   <link rel="stylesheet" href="/animingle/asset/css/adoption.css">
   
   <style>

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
         	<h2 class="content-title">당신을 기다려요</h2>
            <hr>
                <table class="tbladopt tblinfo">
                	<tr><th colspan="3">동물의 정보</th></tr>
                	<tr><th>동물번호</th><td>${dto.num}</td> <td rowspan="4" class="tdimg"><img src="http://${imgurl}" class="anipic aniview"></td></tr>
                	<tr><th>종</th><td>${dto.species}</td></tr>
     	           	<tr><th>품종</th><td>${dto.breed}</td></tr>
                	<tr><th>나이</th><td>${dto.age}</td></tr>
                	<tr><th>성별</th><td colspan="2">${dto.gender}</td></tr>
                	<tr><th>체중</th><td colspan="2">${dto.weight}kg</td></tr>
                	<tr><th>임시보호내용</th><td colspan="2" class="protectcontent">${dto.protectcontent}</td></tr>
                	<tr><th>소개영상URL</th><td colspan="2"><a href="${dto.videourl}" target="_blank" class="introurl">${dto.videourl}</a></td></tr>
                	<tr><th>입소날짜</th><td colspan="2">${dto.admissiondate}</td></tr>
                	<tr><th>소개내용</th><td colspan="2" class="main-content">${dto.intro}</td></tr>
                </table>
                
                <p>**유기동물 문의는 보호센터에 연락하시기 바랍니다.</p>
                
                <table class="tbladopt tblcenter">
                	<tr><th colspan="4">동물 보호센터 안내</th></tr>
                	<tr><th>관할 보호센터명</th><td>${adto.name}</td><th>대표자</th><td>${adto.representative}</td></tr>
                	<tr><th>주소</th><td colspan="3">${adto.address}</td></tr>
                	<tr><th>전화번호</th><td colspan="3">${adto.tel}</td></tr>
                	<tr><th>관할기관</th><td colspan="3">${adto.gu}</td></tr>
                	<tr><th>담당자</th><td>${adto.department}</td><th>연락처</th><td>${adto.departmenttel}</td></tr>
                	<tr><th>특이사항</th><td colspan="3">${adto.significant}</td></tr>
                </table>
                
                <div class="btn-div">
	         	<button type="button" id="write-btn" class="write-btn" onclick="window.location='http://localhost:8090/animingle/board/adoptionlist.do';">
		         	<span class="material-symbols-outlined">
						reorder
					</span>
		         	목록보기
	         	</button>
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