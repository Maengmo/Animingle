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
						
						<c:if test="${isVet != null }">
							<li><a href="/animingle/user/veterinary.do" class="ea">수의사프로필</a></li>
						</c:if>

						
						<c:if test="${isPet != null }">
							<li class="selected"><span><img
									src="/animingle/asset/commonimg/stamp.png" class="stamp"></span><a
								href="/animingle/user/petsitterprofile.do" class="ea">펫시터 프로필</a></li>
						</c:if>		
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
							<input type="hidden" value="${dto.ps_pic }" name="oldpic" id="oldpic">
						</form>
					</div>
					<table class="tblinfo">
						<tr>
							<th>이름</th>
							<td>${dto.ps_name }</td>
						</tr>
						<tr>
							<th>별점</th>
							<td><div id="star-rate"><img src="/animingle/asset/commonimg/stars.png" style="width: 180px;"></div>
							<span class="score">(${dto.ps_rate })</span></td>
						</tr>
						<tr>
							<th>매칭 횟수</th>
							<td>${dto.ps_matchcount }회</td>
						</tr>
					</table>
				</div>
				<div class="selfintro">
					<h3>자기소개</h3>
					<form method="POST" action="/animingle/user/petsitterprofile.do">
						<textarea name="ps_intro" id="ps_intro" maxlength="1000">${dto.ps_intro }</textarea>
						<span style="padding-left: 20px;" id="wordcnt"></span>
						<button type="submit" class="btn btn-primary editintro" onclick="if(!confirm('수정하시겠습니까?')) event.preventDefault();">수정완료</button>
					</form>
				</div>
				<div class="applylist">
					<h3>신청 내역</h3>
					
					<table class="tblcontent">
						<thead>
						<tr>
							<th>내 펫시터 신청 내역</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${psalist }" var="psr">
						<tr onclick="location.href='/animingle/board/psrecruitmentview.do&seq=${psr.psr_seq}'">
							<td>
								<div class="subject-box">
								${psr.psr_subject }
								</div>
								<div style="width: 100px; text-align: center;">
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
								</div>
							</td>
						</tr>
						</c:forEach>
						<c:if test="${psalist.size() == 0 }">
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
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
	
	$('#star-rate').css('width', `\${${dto.ps_rate}*36}px`);

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
			contentType: false,
			
			data: formData,
	
			dataType: 'json',
			success: (result)=>{
				
				
				$('#petsitterpic').attr("src","/animingle/asset/pic/petsitterpic/" + result.petsitterpic);
				$('#oldpic').val(result.petsitterpic);
				alert('사진 수정이 완료되었습니다.');
				
			},
			error: (a,b,c)=>console.log(a,b,c)
			
		});
		
		
	}
	
	$('#wordcnt').text("${dto.ps_intro.length() }"+"/1000");
	
	$('#ps_intro').keyup(function() {
		//$('#wordcnt').text($('#wordcnt').text().length);
		console.log($('#wordcnt').text().length);
	});
	
        
    $("#ps_intro").on('input', function () {
        var maxLength = 1000;
          var currentLength = $(this).val().length;
        var remainingLength = maxLength - currentLength;
  
     $("#wordcnt").text(currentLength + "/" + maxLength);
  
        if (currentLength > maxLength) {
           $(this).val($(this).val().substring(0, maxLength));
          }
        
     });

</script>
</body>
</html>