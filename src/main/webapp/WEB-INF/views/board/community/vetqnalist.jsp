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
   <link rel="stylesheet" href="/animingle/asset/css/vetqnalist.css">
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
	         	<div class="content-title">수의사 QnA</div>
	            <div class="content-filter">
		           	<button>강아지</button>
		           	<button>고양이</button>
		           	<button>기타</button>
		           	<button>전체보기</button>
	            </div>
	            <form action="#">
		            <div class="search-box">
			           	<input class="content-search" type="text" placeholder="검색">
			           	<span class="material-symbols-outlined">
							search
						</span>
		            </div>
	            </form>
	         </div>
	         <div class="content-container">
	         	<c:forEach items="${ list }" var="dto" varStatus="status">
			         <div class="content-list-box">
			         	<div class="content-top-box">
				         	<div class="tag">
				         		<c:if test="${ dto.vq_prefix == 1 }">
				         			<img class="tag-img" src="/animingle/asset/commonimg/tag_01.png">
				         		</c:if>
				         		<c:if test="${ dto.vq_prefix == 2 }">
				         			<img class="tag-img" src="/animingle/asset/commonimg/tag_02.png">
				         		</c:if>
				         		<c:if test="${ dto.vq_prefix == 3 }">
				         			<img class="tag-img" src="/animingle/asset/commonimg/tag_03.png">
				         		</c:if>
				         		<c:if test="${ dto.vq_prefix == 1 }">
				         			<span>강아지</span>
				         		</c:if>
				         		<c:if test="${ dto.vq_prefix == 2 }">
				         			<span>고양이</span>
				         		</c:if>
				         		<c:if test="${ dto.vq_prefix == 3 }">
				         			<span>기타</span>
				         		</c:if>
				         	</div>
				         	<div class="view-subject-icon">
				         		<span class="material-symbols-outlined">visibility</span>${ dto.vq_readcount }
	      						<span class="material-symbols-outlined">chat</span>${ clist[status.index].answer_cnt }
				         	</div>
			         	</div>
			         	<div class="content-list-title">
			         		<a href="/animingle/board/vetqnaview.do?vq_seq=${ dto.vq_seq }">${ dto.vq_subject }</a>
			         		<div class="content-list-sub-title">
			         			${ dto.vq_content }
			         		</div>
			         	</div>
			         	<div class="sub-content">
			         		<div>
			         			${ dto.vq_writer }
			         		</div>
			         		<div>
			         			<fmt:formatDate value="${dto.vq_regdate}" pattern="yyyy-MM-dd" />
			         		</div>
			         	</div>
			         </div>
		         </c:forEach>
	         </div>
	         <div class="button-box">
	         	<c:if test="${ id != null }">
		         	<button>
		         		<span class="material-symbols-outlined">
							edit_note
						</span>
		         		<span class="button-name" onclick="location.href='/animingle/board/vetqnaadd.do'">작성하기</span>
		         	</button>
	         		</c:if>
	         </div>
	         <div class="paging">
	         	<c:if test="${ currentPage > 1 }">
			     	<span>&lt;</span>
		     	</c:if>
		        <ul>
		        	<c:forEach var="pageNumber" begin="${ startPage }" end="${ endPage }">
			        	<li class="page-item ${pageNumber eq currentPage ? 'active' : ''}"
			        		onclick="location.href='/animingle/board/vetqnalist.do?page=${pageNumber}'">${ pageNumber }</li>
		        	</c:forEach>
		        </ul>
		        <c:if test="${currentPage < totalPage }">
			        <span>&gt;</span>
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
<script src="/animingle/asset/js/vetqnalist.js"></script>
</body>
</html>