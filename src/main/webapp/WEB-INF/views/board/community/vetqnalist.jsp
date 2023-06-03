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
	            	<form action="#">
		           		<button>강아지</button>
		           		<button>고양이</button>
		           		<button>기타</button>
		           		<button>전체보기</button>
	            	</form>
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
		         <div class="content-list-box">
		         	<div class="tag">
		         		<img class="tag-img" src="/animingle/asset/commonimg/tag_01.png">
		         		<span>강아지</span>
		         	</div>
		         	<div class="content-list-title">
		         		강아지가 먹으면 안돼는 음식
		         		<div class="content-list-sub-title">
		         			강아지가 먹으면 안돼는 음식 알려주세용
		         		</div>
		         	</div>
		         	<div class="sub-content">
		         		<div>
		         			답변: 0
		         		</div>
		         		<div>
		         			과일구미
		         		</div>
		         		<div>
		         			7시간 전
		         		</div>
		         	</div>
		         </div>
		         <div class="content-list-box">
		         	<div class="tag">
		         		<img class="tag-img" src="/animingle/asset/commonimg/tag_02.png">
		         		<span>고양이</span>
		         	</div>
		         	<div class="content-list-title">
		         		강아지가 먹으면 안돼는 음식
		         		<div class="content-list-sub-title">
		         			강아지가 먹으면 안돼는 음식 알려주세용
		         		</div>
		         	</div>
		         	<div class="sub-content">
		         		<div>
		         			답변: 0
		         		</div>
		         		<div>
		         			과일구미
		         		</div>
		         		<div>
		         			7시간 전
		         		</div>
		         	</div>
		         </div>
	         </div>
	         <div class="button-box">
	         	<button>
	         		<span class="button-name">작성하기</span>
	         		<span class="material-symbols-outlined">
						edit_note
					</span>
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