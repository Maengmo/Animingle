<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/animingle/asset/css/mymenu.css">
<link rel="stylesheet" href="/animingle/asset/css/petsitterprofile.css">
</head>
<body>

	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<section class="content">
		<div class="mycontainer">
			<div class="leftbar">
				<!-- 왼쪽 사이드바 입니다. -->
				<div class="mymenu">
					<ul>
						<li><a href="/animingle/user/profile.do" class="ea">회원정보</a></li>
						<li><a href="/animingle/user/veterinary.do" class="ea">수의사
								프로필</a></li>
						<li class="selected"><span><img
								src="/animingle/asset/commonimg/stamp.png" class="stamp"></span><a
							href="/animingle/user/petsitterprofile.do" class="ea">펫시터 프로필</a></li>
						<li><a href="/animingle/user/mypetsitter.do" class="ea">펫시터
								모집내역</a></li>
						<li><a href="/animingle/user/myauth.do" class="ea">인증센터</a></li>
						<li><a href="/animingle/user/myquest.do" class="ea">내
								문의사항</a></li>
					</ul>
				</div>

			</div>
			<div class="maincontent">

				<div class="content-top">
					<div class="content-title">펫시터 프로필</div>
				</div>
				<div class="infobox">
					<div class="picbox">
						<form id="formpic">
							<img src="/animingle/asset/pic/petsitterpic/${dto.ps_pic }"
								id="petsitterpic">
							<!-- 회원이 저장한 이미지로 변경 -->
							<input type="file" name="editpic" id="editpic" accept=".gif, .jpg, .png, .jpeg"> <label
								for="editpic" id="btnlabel"> 사진 수정 </label>

						</form>
					</div>
					<table class="tblinfo">
						<tr>
							<th>이름</th>
							<td>이민지</td>
						</tr>
						<tr>
							<th>별점</th>
							<td><img src="/animingle/asset/commonimg/stars.png"
								style="width: 180px;"> <span class="score">(${dto.ps_rate })</span></td>
						</tr>
						<tr>
							<th colspan="2">매칭 횟수</th>
						</tr>
						<tr>
							<td colspan="2">${dto.ps_matchcount }회</td>
						</tr>
					</table>
				</div>
				<div class="selfintro">
					<h3>자기소개</h3>
					<form method="POST" action="/animingle/user/petsitterprofile.do">
						<textarea name="ps_intro">${dto.ps_intro }</textarea>
						<button type="submit" class="btn btn-primary editintro" onclick="if(!confirm('수정하시겠습니까?')) event.preventDefault();">수정완료</button>
					</form>
				</div>
				<div class="applylist">
					<h3>신청 내역</h3>
					<table class="tblapply">
						<c:forEach items="${psalist }" var="psr">
						<tr onclick="location.href='/animingle/board/psrecruitmentview.do&seq=${psr.psr_seq}'">
							<td>${psr.psr_subject }</td>
								<td>
									<c:if test="${psr.psa_state == '수락'}">
										<div class="state accept">
									</c:if>
									<c:if test="${psr.psa_state == '거절'}">
										<div class="state deny">
									</c:if>
									<c:if test="${psr.psa_state == '모집중'}">
										<div class="state ing">
									</c:if>
									<c:if test="${psr.psa_state == '모집취소'}">
										<div class="state deny">
									</c:if>
										${psr.psa_state }
									</div>
								</td>
						</tr>
						</c:forEach>
					</table>
				</div>

			</div>
			<div class="rightbar">
				<!-- 오른쪽 사이드바 입니다. -->
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

	$('.selfintro textarea').change(function() {
		
		$(this).css('border', '2px solid #0256AA');
		
	});
	
	

	$('#editpic').change(function() {
		
		editPic();
		
	});
	
	function editPic() {
		
		const formData = new FormData(document.getElementById('formpic'));
		
		$.ajax ({
			type: "POST",
			url: '/animingle/user/petsitterprofilepicedit.do',
			
			enctype: 'multipart/form-data',
			processData: false,
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			
			data: formData,
	
			dataType: 'json',
			success: (result)=>{
				
				
				$('#petsitterpic').attr("src","/animingle/asset/pic/petsitterpic/" + result.petsitterpic);
				alert('사진 수정이 완료되었습니다.');
				
			},
			error: (a,b,c)=>console.log(a,b,c)
			
		});
		
		
	}


</script>
</body>
</html>