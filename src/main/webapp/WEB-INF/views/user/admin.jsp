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
   <link rel="stylesheet" href="/animingle/asset/css/admin.css">
</head>
<body>

   <%@ include file="/WEB-INF/views/inc/header.jsp" %>
   <section class="content">
      <div class="mycontainer">
         <div class="leftbar">
            <!-- 왼쪽 사이드바 입니다. -->
         </div>
         <div class="maincontent">
			<div class="admin-content-box">
				<div class="status-box">
					<div class="title">처리현황</div>
					<div class="ul-box">
						<ul>
							<li>
								<a href="/animingle/user/admin/inquirylist.do?prefix=1">문의현황 :</a>
								<span>${cnt1}</span>
							</li>
							<li>
								문의완료 :
								<span>${cnt3}</span>
							</li>
							<li>
								<a href="/animingle/user/admin/inquirylist.do?prefix=2">신고현황 :</a>
								<span>${cnt2}</span>
							</li>
							<li>
								신고완료 :
								<span>${cnt4}</span>
							</li>
						</ul>
					</div>
				</div>
				<div class="main-content-box">
					<div class="sub-content-box">
						<div class="title">신규 가입자 현황</div>
						<div class="graph-box">
							<canvas id="myChart"></canvas>
						</div>
					</div>
				</div>
				<div class="main-content-box">
					<div class="sub-content-box">
						<div class="title">일자별 요약</div>
						<div class="table-box">
							<table>
								<tr>
									<th>일자</th>
									<th>방문자</th>
									<th>가입</th>
									<th>문의</th>
									<th>신고</th>
								</tr>
								<tr>
									<td>2023-06-04</td>
									<td>10</td>
									<td>3</td>
									<td>5</td>
									<td>2</td>
								</tr>
								<tr>
									<td>2023-06-05</td>
									<td>10</td>
									<td>3</td>
									<td>5</td>
									<td>2</td>
								</tr>
								<tr>
									<td>2023-06-06</td>
									<td>10</td>
									<td>3</td>
									<td>5</td>
									<td>2</td>
								</tr>
								<tr>
									<td>2023-06-07</td>
									<td>10</td>
									<td>3</td>
									<td>5</td>
									<td>2</td>
								</tr>
								<tr>
									<td>2023-06-08</td>
									<td>10</td>
									<td>3</td>
									<td>5</td>
									<td>2</td>
								</tr>
								<tr>
									<td>2023-06-09</td>
									<td>10</td>
									<td>3</td>
									<td>5</td>
									<td>2</td>
								</tr>
								<tr>
									<td>2023-06-10</td>
									<td>10</td>
									<td>3</td>
									<td>5</td>
									<td>2</td>
								</tr>
							</table>
						</div>
					</div>				
				</div>
				<div class="main-content-box">
					<div class="sub-content-box">
						<div class="title">문의 현황</div>
						<div class="table-box">
							<table>
								<tr>
									<th>제목</th>
									<th>글쓴이</th>
									<th>날짜</th>
									<th>답변여부</th>
								</tr>
								<c:forEach items="${list1}" var="dto">
									<tr>
										<td>${dto.in_subject}</td>
										<td>${dto.in_writer }</td>
										<td>${dto.in_regdate}</td>
										<td>${dto.answerCnt}</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>	
				<div class="main-content-box">
					<div class="sub-content-box">
						<div class="title">신고 현황</div>
						<div class="table-box">
							<table>
								<tr>
									<th>제목</th>
									<th>글쓴이</th>
									<th>날짜</th>
									<th>답변여부</th>
								</tr>
								<c:forEach items="${list2}" var="dto">
									<tr>
										<td>${dto.in_subject}</td>
										<td>${dto.in_writer }</td>
										<td>${dto.in_regdate}</td>
										<td>${dto.answerCnt}</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
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
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
	$(document).ready(function() {
	    var ctx = document.getElementById('myChart').getContext('2d');
	    var myChart = new Chart(ctx, {
	       type: 'line',
	       data: {
	          labels: [
	        	  '06-04'
	        	  , '06-05'
	        	  , '06-06'
	        	  , '06-07'
	        	  , '06-08'
	        	  , '06-09'
	        	  , '06-10'],
	          datasets: [{
	             label: '신규 가입자',
	             data: [10, 15, 8, 12, 20, 10, 12], 
				 backgroundColor: [
					'rgba(255, 99, 132, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 206, 86, 0.2)',
					'rgba(75, 192, 192, 0.2)',
					'rgba(153, 102, 255, 0.2)',
					'rgba(255, 159, 64, 0.2)'
	  			 ],
	  			 borderColor: [
					'rgba(255, 99, 132, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(153, 102, 255, 1)',
					'rgba(255, 159, 64, 1)'
				 ],
	             borderWidth: 1 
	          }]
	       },
	       options: {
	          scales: {
	             y: {
	                beginAtZero: true
	             }
	          },
	          maintainAspectRatio: false
	       }
	    });
	 });
</script>
</body>
</html>