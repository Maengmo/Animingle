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
   <link rel="stylesheet" href="/animingle/asset/css/mymenu.css">
   <link rel="stylesheet" href="/animingle/asset/css/petsitterprofile.css">
</head>
<body>

   <%@ include file="/WEB-INF/views/inc/header.jsp" %>
   <section class="content">
      <div class="mycontainer">
         <div class="leftbar">
            <!-- 왼쪽 사이드바 입니다. -->
            <div class="mymenu">
            
            	<ul>
            		<li>회원정보</li>
            		<li>수의사 프로필</li>
            		<li class="selected"><span><img src="/animingle/asset/commonimg/stamp.png" class="stamp"></span>펫시터 프로필</li>
            		<li>펫시터 모집내역</li>
            		<li>인증센터</li>
            		<li>내 문의사항</li>
            	</ul>
            
            </div>
         </div>
         <div class="maincontent">

                <h1>펫시터 프로필</h1>
                <div class="infobox">
	                <div class="picbox">
	                	<img src="/animingle/asset/commonimg/animingle.png">
	                </div>
                	<table class="tblinfo">
                		<tr>
                			<th>이름 </th><td>이민지</td>
                		</tr>
                		<tr>
                			<th>별점</th><td><img src="/animingle/asset/commonimg/stars.png" style="width: 180px;">
                			<span class="score">(5.0)</span>
                			</td>
                		</tr>
                		<tr>
                			<th colspan="2">매칭 횟수</th>
                		</tr>
                		<tr>
                			<td colspan="2">999회</td>
                		</tr>
                	</table>
                </div>
                <button type="button" class="btn btn-primary editpic">사진수정</button>
                <div class="selfintro">
                	<h3>자기소개</h3>
                	<textarea>저는 어렸을 때부터 고양이, 강아지, 햄스터 등 많은 반려동물을 키웠습니다.
누구보다 동물을 좋아해서 친구들 반려동물도 자주 돌봐주곤 합니다.
현재 기르고 있는 반려동물은 없어서 다른 친구들과 갈등이 생길 일도 없습니다.
믿고 맡겨주시면 아이들 특성 파악해서 잘 돌보겠습니다.^^</textarea>
				<button type="button" class="btn btn-primary editintro">수정완료</button>
                </div>
                <div class="applylist">
                	<h3>신청 내역</h3>
                	<table class="tblapply">
                		<tr><td>천사같은 고양이... 맡아주실 분...</td><td><div class="state" style="background-color:cornflowerblue;">모집중</div></td></tr>
                		<tr><td>악마 고양이 봐주실 분..</td><td><div class="state" style="background-color:lime;">수락</div></td></tr>
                		<tr><td>냐옹~</td><td><div class="state" style="background-color:tomato;">거절</div></td></tr>
                	</table>
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