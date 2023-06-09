<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>펫시터</title>
   <%@ include file="/WEB-INF/views/inc/asset.jsp" %>
   <link rel="stylesheet" href="/animingle/asset/css/index.css">
   <link rel="stylesheet" href="/animingle/asset/css/petsitter.css">
   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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
            <c:forEach items="${ list }" var="dto">
            	<a href="/animingle/board/petsitterview.do?psr_seq=${ dto.psr_seq }&page=${ currentPage }" class="move-to-view">
		            <div class="item-wrap">
		            	<div class="item-header">
		            		<div>
			            		<img src="/animingle/asset/pic/${ dto.user_pic }" alt="프로필이미지" class="profile-img" id="profile-img"> 
			            		<span class="item-id">${ dto.user_nickname }(${ dto.psr_writer })</span>
			            		<span class="item-time">${ dto.psr_regdate }</span>
			            	</div>
		            		<c:if test="${ dto.psr_state == '모집중' }">
			            		<div class="recruit-state" style="background-color: tomato">
			            				${ dto.psr_state }
			            		</div>
		            		</c:if>
		            		<c:if test="${ dto.psr_state == '모집완료' }">
			            		<div class="recruit-state" style="background-color: green;">
			            				${ dto.psr_state }
			            		</div>
		            		</c:if>
		            	</div>
		            	<div class="item-content">
		            		${ dto.psr_subject }
		            	</div>
		            	
		            	<div class="item-config">
		            		<span>[<fmt:formatDate value="${dto.psr_fromdate}" pattern="yyyy-MM-dd HH:mm"/> ~ <fmt:formatDate value="${dto.psr_todate}" pattern="yyyy-MM-dd HH:mm"/>]</span>
		            		<span>${ dto.psr_region }</span>
		            	</div>
		            </div>
	            </a>
			</c:forEach>
	            
	         <div class="btn-div">
	         	<c:if test="${ id != null }">
	         	<button type="submit" id="write-btn" class="write-btn" onclick="location.href='/animingle/board/petsitteradd.do';">
		         	<span class="material-symbols-outlined">
						edit_note
					</span>
		         	작성하기
	         	</button>
	         	</c:if>
	         </div>
	         
	         <hr class="paging-hr">
	         
	         <div class="paging">
	         	<c:if test="${ currentPage > 1 }">
			     	<span onclick="location.href='/animingle/board/petsitter.do?page=${ currentPage - 1 }'">&lt;</span>
		     	</c:if>
		        <ul>
		        	<c:forEach var="pageNumber" begin="${ startPage }" end="${ endPage }">
			        	<li class="page-item ${pageNumber eq currentPage ? 'active' : ''}"
			        		onclick="location.href='/animingle/board/petsitter.do?page=${pageNumber}'">${ pageNumber }</li>
		        	</c:forEach>
		        </ul>
		        <c:if test="${currentPage < totalPage }">
			        <span onclick="location.href='/animingle/board/petsitter.do?page=${ currentPage + 1 }'">&gt;</span>
		        </c:if>
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