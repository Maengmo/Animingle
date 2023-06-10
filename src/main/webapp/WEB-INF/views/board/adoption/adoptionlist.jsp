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
         <div class="content-top">
         	<div class="content-title">당신을 기다려요</div>
         </div>
         	<div class="cardbox">

				
			<c:forEach items="${list}" var="dto" varStatus="status">
               <div 
               <c:if test="${dto.gender == '암컷'}"> class="card W"</c:if>
               <c:if test="${dto.gender == '수컷'}"> class="card M"</c:if>>
               		<a href="/animingle/board/adoptionview.do?num=${dto.num}">
               		<c:if test="${not empty dto.imgurl}">
                    	<img src="http://${dto.imgurl}" class="anipic">
                    </c:if>
                    <c:if test="${empty dto.imgurl}">
                    	<img src="/animingle/asset/commonimg/animingle.png" class="anipic">
                    </c:if>
                    </a>
               		<div class="info">
                        <ul>
                           <li style="font-size: 13px">이름(센터): ${dto.name}</li>
                           <li>종: ${dto.species}</li>
                           <li>품종: ${dto.breed}</li>
                           <li>성별: ${dto.gender}</li>
                        </ul>
               		</div>
               </div>
        
             </c:forEach>
             
 
               
         	</div>
         	
	         <hr class="paging-hr">
	         
	         <div class="paging">
               <div id="pagination" style="text-align: center; margin-bottom:10px;">${pagination}</div>
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