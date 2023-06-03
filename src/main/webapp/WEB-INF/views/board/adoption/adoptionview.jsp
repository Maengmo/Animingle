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
                	<tr><th>동물번호</th><td>경남-진주-2023-00234</td> <td rowspan="4" class="tdimg"><img src="/animingle/asset/commonimg/animingle.png" class="anipic aniview"></td></tr>
                	<tr><th>종</th><td>개</td></tr>
                	<tr><th>품종</th><td>믹스견</td></tr>
                	<tr><th>나이</th><td>2(세)4(개월)</td></tr>
                	<tr><th>성별</th><td colspan="2">암컷</td></tr>
                	<tr><th>체중</th><td colspan="2">2.0kg</td></tr>
                	<tr><th>임시보호내용</th><td colspan="2">호스피스 임시보호 가능합니다.</td></tr>
                	<tr><th>소개영상URL</th><td colspan="2"><a href="https://www.youtube.com/watch?v=LS_Br6c64YU" target="_blank" class="introurl">https://www.youtube.com/watch?v=LS_Br6c64YU</a></td></tr>
                	<tr><th>입소날짜</th><td colspan="2">2023-05-02</td></tr>
                	<tr><th>소개내용</th><td colspan="2">사람을 좋아하는 애교쟁이 모찌입니다. 만져주는 것을 좋아하고 다가가면 뒹굴거리거나 배를 보이며 친근감을 표현합니다.</td></tr>
                </table>
                
                <p>**유기동물 문의는 보호센터에 연락하시기 바랍니다.</p>
                
                <table class="tbladopt tblcenter">
                	<tr><th colspan="4">동물 보호센터 안내</th></tr>
                	<tr><th>관할 보호센터명</th><td>진주시 유기동물 보호소</td><th>대표자</th><td>농업기술센터 소장</td></tr>
                	<tr><th>주소</th><td colspan="3">경상남도 진주시 집현면 신당길207번길 22(집현면, 지역농업개발시설)</td></tr>
                	<tr><th>전화번호</th><td colspan="3">055-749-6134</td></tr>
                	<tr><th>관할기관</th><td colspan="3">경상남도 진주시</td></tr>
                	<tr><th>담당자</th><td>진주시청</td><th>연락처</th><td>005-749-6204</td></tr>
                	<tr><th>특이사항</th><td colspan="3">2.0kg</td></tr>
                </table>
                
                <div class="btn-div">
	         	<button type="button" id="write-btn" class="write-btn" onclick="window.location='http://localhost:8090/animingle/board/petsitteradd.do';">
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