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
   <link rel="stylesheet" href="/animingle/asset/css/index.css">
   <link rel="stylesheet" href="/animingle/asset/css/waglelist.css">
   <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">
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
               <div class="content-title">와글와글</div>
               <div class="content-filter">
                  <form action="#">
                       <button>일상</button>
                       <button>정보 공유</button>
                       <button>나눔</button>
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
            <div class="content-bottom">
	            <div class="content-info">
		            <div class="user-info">
		            	<img src="/animingle/asset/commonimg/animingle.png">
		            	<span>밍글맹글(mingle77)</span>
		            	<span>16분 전</span>
		            </div>
		            <div class="content-text">
		            	<div class="content-title2">
		            	<span>[일상]</span>
		            	<span>우리 애기 돌잔치 했어용</span>
		            	</div>
		            	<div class="content-views">
							<span class="material-symbols-outlined">visibility</span> 
							<span class="views-count">54</span>
							<span class="material-symbols-outlined">chat</span> 
							<span class="views-count">3</span>
						</div>
		            </div>
	            </div>
            </div>
            <div class="content-bottom">
	            <div class="content-info">
		            <div class="user-info">
		            	<img src="/animingle/asset/commonimg/animingle.png">
		            	<span>밍글맹글(mingle77)</span>
		            	<span>16분 전</span>
		            </div>
		            <div class="content-text">
		            	<div class="content-title2">
		            		<span>[일상]</span>
		            		<span>우리 애기 돌잔치 했어용</span>
		            	</div>
		            	<div class="content-views">
							<span class="material-symbols-outlined icon">visibility</span> 
							<span class="views-count">54</span>
							<span class="material-symbols-outlined icon">chat</span> 
							<span class="views-count">3</span>
						</div>
		            </div>
	            </div>
            </div>
            <div class="submit-btn">
				<button class="submit-btn2" type="button" onclick="">
					<span class="material-symbols-outlined">
							edit_note
					</span>
					작성하기
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