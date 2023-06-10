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
   <link rel="stylesheet" href="/animingle/asset/css/vetqnalist.css">
   <link rel="stylesheet" href="/animingle/asset/css/communitylist.css">
</head>
<body>

   <%@ include file="/WEB-INF/views/inc/header.jsp" %>
   <section class="content">
      <div class="mycontainer">
         <div class="leftbar">
            <!-- 왼쪽 사이드바 입니다. -->
                       <div class="content-top">
	         	<div class="content-title" onclick="location.href='/animingle/board/walktogetherlist.do';">산책 친구 구해요
		         	<button type="button" class="btn">
		         		<span class="material-symbols-outlined gohover">send</span>
		         	</button>
	         	</div>
	         	<img src="/animingle/asset/commonimg/communitywalk.png" class="walkimg" onclick="location.href='/animingle/board/walktogetherlist.do';">
	         	</div>
		</div>
         <div class="maincontent">
           <div class="content-top">
	         	<div class="content-title" onclick="location.href='/animingle/board/waglelist.do';">와글와글
		         	<button type="button" class="btn">
		         		<span class="material-symbols-outlined gohover">send</span>
		         	</button>
	         	</div>
	         	</div>
	         	<c:forEach items="${waglelist}" var="dto">
                 <div class="content-list-box" onclick="location.href='/animingle/board/wagleview.do?seq=${dto.wg_seq}';">
		         	<div class="user-info">
		            	<img src="/animingle/asset/pic/${dto.user_pic}">
		            	<span>${dto.wg_nickname}(${dto.wg_writer})</span>
		            	<span>${dto.wg_regdate}</span>
		            </div>
		         	<div class="content-list-title wagletitle">
		            	<span>[${dto.wg_prefix}]</span>
		            	<span>${dto.wg_subject}</span>
		         	</div>
		         	<div class="content-views">
							<span class="material-symbols-outlined">visibility</span> 
							<span class="views-count">${dto.wg_readcount}</span>
							<span class="material-symbols-outlined">chat</span> 
							<span class="views-count">${dto.wg_ccnt}</span>
						</div>
		         </div>
		         </c:forEach>
		         

         </div>
         <div class="rightbar">
            <!-- 오른쪽 사이드바 입니다. -->
                    <div class="content-top">
	         	<div class="content-title" onclick="location.href='/animingle/board/vetqnalist.do';">수의사 Q&A
		         	<button type="button" class="btn">
		         		<span class="material-symbols-outlined gohover">send</span>
		         	</button>
	         	</div>
	         	</div>
	         	<c:forEach items="${qnalist}" var="dto">
            <div class="content-list-box vqnabox" onclick="location.href='/animingle/board/vetqnaview.do?vq_seq=${dto.vq_seq}';">
            	<div class="vqna-top">
		         	<div class="tag">
		         		<c:if test="${dto.vq_prefix == '강아지'}">
		         			<img class="tag-img" src="/animingle/asset/commonimg/tag_01.png">
		         		</c:if>
		         		<c:if test="${dto.vq_prefix == '고양이'}">
		         			<img class="tag-img" src="/animingle/asset/commonimg/tag_02.png">
		         		</c:if>
		         		<c:if test="${ dto.vq_prefix == '기타' }">
				         	<img class="tag-img" src="/animingle/asset/commonimg/tag_03.png">
				         </c:if>
		         		<span>${dto.vq_prefix}</span>
		         	</div>
		         		<div class="content-views">
							<span class="material-symbols-outlined">visibility</span> 
							<span class="views-count">${dto.vq_readcount}</span>
							<span class="material-symbols-outlined">chat</span> 
							<span class="views-count">${dto.answer_cnt}</span>
						</div>
					</div>
		         	<div class="content-list-title vqnatitle">
		         		<span>${dto.vq_subject}</span>
		         	</div>
		         	<div class="sub-content vqnasub">
		         		<div>
		         			${dto.vq_writer}
		         		</div>
		         		<div>
		         			${dto.vq_regdate}
		         		</div>
		         	</div>
		         </div>
		         </c:forEach>               
         </div>
         </div>
   </section>
   <%@ include file="/WEB-INF/views/inc/footer.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</body>
</html>