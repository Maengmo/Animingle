<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>고객센터 문의현황</title>
   <%@ include file="/WEB-INF/views/inc/asset.jsp" %>
   <link rel="stylesheet" href="/animingle/asset/css/index.css">
   <link rel="stylesheet" href="/animingle/asset/css/admininquirylist.css">
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
	         	<div class="content-title">고객센터 문의현황</div>
	         <div class="content-container">
	         	<c:forEach items="${list}" var="dto">
		         <div class="content-list-box">
			         	<div class="content-list-title" onclick="location.href='/animingle/user/admin/inquiryview.do?seq=${dto.in_seq}'">
			         		<div class="list-item1">
			         			<div class="item-writer">${dto.in_writer }</div>
			         			<div> ${dto.in_regdate }</div>
			         		</div>
			         		<div>
			         			<c:if test="${dto.in_prefix == 1}">
			         				<span class="content-prefix">[문의]</span>
			         			</c:if>
			         			<c:if test="${dto.in_prefix == 2}">
			         				<span class="content-prefix">[신고]</span>
			         			</c:if>
				         		<span class="content-subject">${dto.in_subject}</span>
			         		</div>
			         		
			         		
			         	</div>
			      </div>
		         </c:forEach>
		      </div>
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