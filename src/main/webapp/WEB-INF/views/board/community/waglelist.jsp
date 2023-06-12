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
               <div class="content-title" onclick="location.href='/animingle/board/waglelist.do';">와글와글</div>
               <div class="content-filter">
                       <button onclick="location.href='/animingle/board/waglelist.do?prefix=1&searchtext=${searchtext}';">일상</button>
                       <button onclick="location.href='/animingle/board/waglelist.do?prefix=2&searchtext=${searchtext}';">정보 공유</button>
                       <button onclick="location.href='/animingle/board/waglelist.do?prefix=3&searchtext=${searchtext}';">나눔</button>
                       <button onclick="location.href='/animingle/board/waglelist.do';">전체보기</button>
               </div>
               <form id="searchform" action="/animingle/board/waglelist.do" method="GET">
					<div class="search-box">
						<input class="content-search" type="text" placeholder="검색" name="searchtext">
						<c:if test="${ prefix != null }">
							<input type="hidden" name="prefix" value="${prefix}">
						</c:if>
						<c:if test="${ prefix == null }">
							<input type="hidden" name="page" value="1">
						</c:if>
						<span class="material-symbols-outlined">
							search
						</span>
					</div>
               </form>
            </div>
            <c:forEach items="${list}" var="dto">
            <div class="content-bottom" onclick="location.href='/animingle/board/wagleview.do?seq=${dto.wg_seq}&page=${page}';">
	            <div class="content-info">
		            <div class="user-info">
		            	<img src="/animingle/asset/pic/userpic/${dto.user_pic}">
		            	<span>${dto.wg_nickname}(${dto.wg_writer})</span>
		            	<span>${dto.wg_regdate}</span>
		            </div>
		            <div class="content-text">
		            	<div class="content-title2">
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
	            </div>
            </div>
            </c:forEach>
         <div class="paging">
               <c:if test="${ currentPage > 1 }">
                 <span onclick="location.href='/animingle/board/waglelist.do?page=${ currentPage - 1 }'">&lt;</span>
              </c:if>
               <c:if test="${ currentPage == 1 }">
                 <span onclick="location.href='/animingle/board/waglelist.do?page=${ currentPage }'">&lt;</span>
              </c:if>
              <ul>
                 <c:forEach var="pageNumber" begin="${ startPage }" end="${ endPage }">
                 	<c:if test="${ searchtext != null && prefix != null }">
                    <li class="page-item ${pageNumber eq currentPage ? 'active' : ''}"
                       onclick="location.href='/animingle/board/waglelist.do?page=${pageNumber}&searchtext=${searchtext}&prefix=${prefix}'">${ pageNumber }</li>
                    </c:if>
                 	<c:if test="${ searchtext == null && prefix != null }">
                    <li class="page-item ${pageNumber eq currentPage ? 'active' : ''}"
                       onclick="location.href='/animingle/board/waglelist.do?page=${pageNumber}&prefix=${prefix}'">${ pageNumber }</li>
                    </c:if>
                 	<c:if test="${ searchtext == null && prefix == null }">
                    <li class="page-item ${pageNumber eq currentPage ? 'active' : ''}"
                       onclick="location.href='/animingle/board/waglelist.do?page=${pageNumber}'">${ pageNumber }</li>
                    </c:if>
                    <c:if test="${ searchtext != null && prefix == null }">
                    	<li class="page-item ${pageNumber eq currentPage ? 'active' : ''}"
                       		onclick="location.href='/animingle/board/waglelist.do?page=${pageNumber}&searchtext=${searchtext}'">${ pageNumber }</li>
                    </c:if>
                 </c:forEach>
              </ul>
              <c:if test="${currentPage < totalPage }">
                 <span onclick="location.href='/animingle/board/waglelist.do?page=${ currentPage + 1 }'">&gt;</span>
              </c:if>
              <c:if test="${currentPage == totalPage }">
                 <span onclick="location.href='/animingle/board/waglelist.do?page=${ currentPage }'">&gt;</span>
              </c:if>
            </div>
            <c:if test="${not empty id}">
            <div class="submit-btn">
				<button class="submit-btn2" type="button" onclick="location.href='/animingle/board/wagleadd.do'">
					<span class="material-symbols-outlined">
							edit_note
					</span>
					작성하기
				</button>
			</div>
			</c:if>
		 </div>
         <div class="rightbar">
            <!-- 오른쪽 사이드바 입니다. -->
         </div>
        </div>
         
   </section>
   
   <%@ include file="/WEB-INF/views/inc/footer.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>


	<c:if test="${search == 'y'}">
	$('input[name=searchtext]').val('${searchtext}');
	</c:if>


</script>
</body>
</html>