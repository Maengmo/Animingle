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
	<link rel="stylesheet" href="/animingle/asset/css/index.css">
	<link rel="stylesheet" href="/animingle/asset/css/myquest.css">
	
</head>
<style>
	
</style>
<body>

	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	<section class="content">
		<div class="mycontainer">
			<div class="leftbar">
				<!-- 왼쪽 사이드바 입니다. -->
			</div>
			<div class="maincontent">
				<h2 class="title"> 펫시터 모집 내역 </h2>
				    
				<div class="pr-content">
					<table class="content">
					  <tr>
					    <th>내 문의사항</th>
					  </tr>
					  <tr onclick="toggleAnswer('report1')">
					    <td>
					      [신고] 이상한 사진 올리는 놈이 있어요!
					      <div>
					        <div class="state-ing">확인중</div>
					        <small class="date">2023-05-12</small>
					      </div>
					    </td>
					  </tr>
					  <tr class="answer-row" id="report1" onclick="toggleAnswer('report1')">
					    <td>
					      <div class="answer">
					        <span class="material-symbols-outlined">subdirectory_arrow_right</span>
					        해당유저 탈퇴 처리 진행하겠습니다.
					      </div>
					    </td>
					  </tr>
					  <tr onclick="toggleAnswer('inquiry1')">
					    <td>
					      [문의] 펫시터 인증이 잘 안되네요..
					      <div>
					        <div class="state-complete">답변 완료</div>
					        <small class="date">2023-05-10</small>
					      </div>
					    </td>
					  </tr>
					  <tr class="answer-row" id="inquiry1" onclick="toggleAnswer('inquiry1')">
					    <td>
					      <div class="answer">
					        <span class="material-symbols-outlined">subdirectory_arrow_right</span>
					        불편을 끼쳐 드려 죄송합니다. 빠른 시일 내에 보완하겠습니다.
					      </div>
					    </td>
					  </tr>
					  <tr onclick="toggleAnswer('inquiry2')">
					    <td>
					      [신고] 맨날 요거트에 빵을 먹어요..
					      <div>
					        <div class="state-complete">답변 완료</div>
					        <small class="date">2023-05-10</small>
					      </div>
					    </td>
					  </tr>
					  <tr class="answer-row" id="inquiry2" onclick="toggleAnswer('inquiry2')">
					    <td>
					      <div class="answer">
					        <span class="material-symbols-outlined">subdirectory_arrow_right</span>
					        해당유저 요거트와 빵 압수하겠습니다.
					      </div>
					    </td>
					  </tr>
					  <tr onclick="toggleAnswer('inquiry3')">
					    <td>
					      [문의] 프로필 사진을 올리는데 에러가 발생해요..
					      <div>
					        <div class="state-complete">답변 완료</div>
					        <small class="date">2023-05-10</small>
					      </div>
					    </td>
					  </tr>
					  <tr class="answer-row" id="inquiry3" onclick="toggleAnswer('inquiry3')">
					    <td>
					      <div class="answer">
					        <span class="material-symbols-outlined">subdirectory_arrow_right</span>
					        불편을 끼쳐 드려 죄송합니다. 바로 수정 조치 하겠습니다.
					      </div>
					    </td>
					  </tr>
					  <tr onclick="toggleAnswer('report2')">
					    <td>
					      [신고] 사기꾼이 있는 것 같아요
					      <div>
					        <div class="state-complete">답변 완료</div>
					        <small class="date">2023-05-10</small>
					      </div>
					    </td>
					  </tr>
					  <tr class="answer-row" id="report2" onclick="toggleAnswer('report2')">
					    <td>
					      <div class="answer">
					        <span class="material-symbols-outlined">subdirectory_arrow_right</span>
					        사기꾼 유저 탈퇴 처리 진행하겠습니다.
					      </div>
					    </td>
					  </tr>
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