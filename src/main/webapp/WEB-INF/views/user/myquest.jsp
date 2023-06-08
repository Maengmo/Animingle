<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>내 문의 사항</title>
	<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
	<link rel="stylesheet" href="/animingle/asset/css/myquest.css">
	<link rel="stylesheet" href="/animingle/asset/css/mymenu.css">
	
</head>
<style>
	
</style>
<body>

	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	<section class="content">
		<div class="mycontainer">
			<div class="leftbar">
				<!-- 왼쪽 사이드바 입니다. -->
				<div class="mymenu">
	            	<ul>
	            		<li><a href="/animingle/user/profile.do" class="ea">회원정보</a></li>
            			<c:if test="${isVet != null }">
		            		<li><a href="/animingle/user/veterinary.do" class="ea">수의사 프로필</a></li>
	            		</c:if>
						<c:if test="${isPet != null }">
		            		<li><a href="/animingle/user/petsitterprofile.do" class="ea">펫시터 프로필</a></li>
						</c:if>	
	            		<li><a href="/animingle/user/mypetsitter.do" class="ea">펫시터 모집내역</a></li>
	            		<li><a href="/animingle/user/myauth.do" class="ea">인증센터</a></li>
	            		<li class="selected"><span><img src="/animingle/asset/commonimg/stamp.png" class="stamp"></span><a href="/animingle/user/myquest.do" class="ea">내 문의사항</a></li>
	            	</ul>
            	</div>
				
			</div>
			<div class="maincontent">
				<div class="content-top">
					<div class="content-title">내 문의사항</div>
				</div>
				    
				<div class="pr-content">
				
					<img src="/animingle/asset/commonimg/logo_01.png" class="logoimg">
				
					<table class="tblcontent">
					<thead>
					  <tr>
					    <th>내 문의사항</th>
					  </tr>
					 </thead>
					 
					 <tbody>
					 <c:forEach items="${mqlist }" var="mqdto" varStatus="status">
					  <c:if test="${mqdto.in_state == '답변완료' }">
					  <tr onclick="toggleAnswer('report${status.index}')" style="cursor: pointer;">
					  </c:if>
					  <c:if test="${mqdto.in_state == '확인중' }">
					  <tr>
					  </c:if>
					    <td>
					      ${mqdto.in_subject }
					      <div>
					      	<c:if test="${mqdto.in_state == '확인중' }">
						        <div class="state-ing">${mqdto.in_state }</div>
					        </c:if>
					      	<c:if test="${mqdto.in_state == '답변완료' }">
						        <div class="state-complete">${mqdto.in_state }</div>
					        </c:if>
					        <small class="date">${mqdto.in_regdate }</small>
					      </div>
					    </td>
					  </tr>
					  <c:if test="${mqdto.in_state == '확인중' }">
						  <tr class="answer-row">
					  </c:if>
					  <c:if test="${mqdto.in_state == '답변완료' }">
						  <tr class="answer-row" id="report${status.index}" style="display: none;">
					    <td>
					      <div class="answer" style="width: 100%;">
					        <span class="material-symbols-outlined">subdirectory_arrow_right</span>
					        ${mqdto.ina_content }
					        <div style="text-align: right;">${mqdto.a_nickname}(${mqdto.a_id})<small>[${mqdto.ina_regdate }]</small></div>
					      </div>
					    </td>
					  </tr>
					  </c:if>
					 </c:forEach>
							<c:if test="${mqlist.size() == 0 }">
							<tr style="cursor: default;">
								<td style="display: table-cell; text-align: center;">문의 내역이 없습니다.</td>
							</tr>
						</c:if>
					  </tbody>
					  
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
<script>
	function toggleAnswer(elementId) {
	  var answerRow = document.getElementById(elementId);
	  if (answerRow.style.display === "none") {
	    answerRow.style.display = "table-row";
	  } else {
	    answerRow.style.display = "none";
	  }
	}

</script>
</html>