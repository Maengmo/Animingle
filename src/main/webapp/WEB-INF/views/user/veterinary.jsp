<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Animingle</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/animingle/asset/css/profile.css">
<link rel="stylesheet" href="/animingle/asset/css/mymenu.css">
<style>
</style>
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
						<li class="selected"><span><img
								src="/animingle/asset/commonimg/stamp.png" class="stamp"></span><a
							href="/animingle/user/veterinary.do" class="ea">수의사 프로필</a></li>
						<li><a href="/animingle/user/petsitterprofile.do" class="ea">펫시터
								프로필</a></li>
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
					<div class="content-title">수의사 프로필</div>
				</div>

				<div class="mypage-profile">
					<div class="mypage-vet-img">
						<form id="formpic">
							<img src="/animingle/asset/pic/userpic/${dto.vet_pic }"
								id="userpic">
							<!-- 회원이 저장한 이미지로 변경 -->
							<input type="file" name="editpic" id="editpic"> <label
								for="editpic" id="btnlabel"> 사진 수정 </label>
						</form>
					</div>
					<form>
						<div class="mypage-profile-main veterinary-main">
							<div class="form-title">이름</div>
							<div>
								<input type="text" value="홍길동">
							</div>
							<div class="form-title">병원명</div>
							<div>
								<input type="text" value="밍글맹글">
							</div>
							<div class="form-title">병원주소</div>
							<div>
								<input type="text" value="서울시 강남구 역삼동 한독빌딩">
							</div>
							<div class="form-title">경력</div>
							<div>
								<textarea>서울대학교 수의학과 학부 졸업</textarea>
							</div>
							<div class="form-title">진료과목</div>
							<div>
								<input type="text" value="고양이">
							</div>
							<div class="mypage-edit">
								<button type="submit">수정</button>
							</div>
						</div>
					</form>
					<div class="mypage-profile-count mypage-reply">
						<div>답변 내역</div>
						<table id="tblReply">
							<tr>
								<td>천사같은 고양이..맡아주실분...</td>
								<td>2023-03-14</td>
							</tr>
							<tr>
								<td>악마 고양이 봐주실분..</td>
								<td>2023-02-14</td>
							</tr>
						</table>
					</div>
				</div>
			</div>

			<div class="rightbar">
				<!-- 오른쪽 사이드바 입니다. -->
			</div>
		</div>

	</section>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

	<script>
	
	
	$('#editpic').change(function() {
		
		editPic('${dto.vet_seq}');
		
	});
	
	function editPic(id) {
		
		const formData = new FormData(document.getElementById('formpic'));
		
		$.ajax ({
			type: "POST",
			url: '/animingle/user/profilepicedit.do',
			
			enctype: 'multipart/form-data',
			processData: false,
			contentType: false,
			
			data: formData,

			dataType: 'json',
			success: (result)=>{
				
				$('#userpic').attr("src","/animingle/asset/pic/userpic/" + result.userpic);	
				
			},
			error: (a,b,c)=>console.log(a,b,c)
			
		});
		
		
	}

	</script>
</body>
</html>