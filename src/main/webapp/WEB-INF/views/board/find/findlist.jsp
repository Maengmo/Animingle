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
   <link rel="stylesheet" href="asset/css/index.css">
   <link rel="stylesheet" href="/animingle/asset/css/find.css">
   
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
               <div class="content-title">우리 가족을 찾아주세요</div>
	            <div class="content-filter">
	                	<button onclick="location.href='/animingle/board/findlist.do?nowpage=&prefix=1&word=';" <c:if test="${map.prefix ==  1}">class="prefix-select"</c:if>>주인 찾아요</button>
	                    <button onclick="location.href='/animingle/board/findlist.do?nowpage=&prefix=2&word=';" <c:if test="${map.prefix ==  2}">class="prefix-select"</c:if>>펫 찾아요</button>
	                    <button onclick="location.href='/animingle/board/findlist.do?nowpage=&prefix=0&word=';">전체보기</button>
	            </div>
	            
	            	<div class="search-box">
	            	    <input class="content-search" type="text" placeholder="검색" name="word">
	                    <span class="material-symbols-outlined search-bar" >search</span>
	                </div>
	           
            </div>

            <c:forEach items="${list}" var="dto">
            <a href="/animingle/board/findview.do?seq=${dto.seq}&prefix=${map.prefix}&word=${map.word}" class="move-to-view">
            <div class="find-content">
               <div class="writer view-writer">
                  <img src="/animingle/asset/commonimg/logo_01.png">
                  ${dto.nickname}(${dto.writer})
                  <span class="time">${dto.regdate}</span>
               </div>
               <div class="content-list">
               	  <c:if test="${dto.prefix == 1}">
                  	<span class="content-prefix">[주인 찾아요]</span>
                  </c:if>
                  <c:if test="${dto.prefix == 2}">
                  	<span class="content-prefix">[펫 찾아요]</span>
                  </c:if>
                  ${dto.subject}
               </div>
               <div class="count">
                  <span class="material-symbols-outlined">visibility</span>${dto.readcount}
                  <span class="material-symbols-outlined">chat</span>${dto.ffc_cnt}
               </div>
            </div>
            </a>
            </c:forEach>
            
            <c:if test="${not empty id}">
            <div class="btn-div">
	        	<button type="submit" id="write-btn" class="write-btn" onclick='location.href="/animingle/board/findadd.do";'>
		        	<span class="material-symbols-outlined">
						edit_note
					</span>
		         	작성하기
	        	</button>
	        </div>
	        </c:if>
	        
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
<script>
   	
   	$('.search-bar').click(function() {
   		
   		location.href='/animingle/board/findlist.do?nowpage=${nowpage}&prefix=${map.prefix}&word=' + $('.content-search').val();
   	});
   	
</script>
</body>
</html>