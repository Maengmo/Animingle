<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>펫시터 모집 내역</title>
	<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
	<link rel="stylesheet" href="/animingle/asset/css/mymenu.css">
	<link rel="stylesheet" href="/animingle/asset/css/mypetsitter.css">
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
	            		
	            		<li class="selected"><span><img src="/animingle/asset/commonimg/stamp.png" class="stamp"></span><a href="/animingle/user/mypetsitter.do" class="ea">펫시터 모집내역</a></li>
	            		<li><a href="/animingle/user/myauth.do" class="ea">인증센터</a></li>
	            		<li><a href="/animingle/user/myquest.do" class="ea">내 문의사항</a></li>
	            	</ul>
            	</div>
			</div>
			<div class="maincontent">
				<div class="content-top">
					<div class="content-title">펫시터 모집내역</div>
				</div>
				    
				<div class="pr-content">
				
					<img src="/animingle/asset/commonimg/logo_01.png" class="logoimg">
				
					<table class="tblcontent">
					<thead>
						<tr>
							<th>내 펫시터 모집내역</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${psrlist }" var="psrdto">
						<tr onclick="location.href='/animingle/board/psrecruitmentview.do&seq=${psrdto.psr_seq}'" style="cursor: pointer;">
							<td>
								<%-- <div class="date">[${psrdto.psr_regdate }]</div> --%>
								<div class="subject-box">${psrdto.psr_subject }</div>
								<div>
								<c:if test="${psrdto.psr_state == '모집완료'}">
									<div class="state-complete">${psrdto.psr_state }</div>
								</c:if>
								<c:if test="${psrdto.psr_state == '모집중'}">
									<div class="state-ing">${psrdto.psr_state }</div>
								</c:if>
									<small class="date">${psrdto.psr_regdate }</small>
								</div>
							</td>
						</tr>
						</c:forEach>
							<c:if test="${psrlist.size() == 0 }">
							<tr style="cursor: default;">
								<td style="display: table-cell; text-align: center;">신청 내역이 없습니다.</td>
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
</html>