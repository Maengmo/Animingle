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
						<li class="selected"><span><img
								src="/animingle/asset/commonimg/stamp.png" class="stamp"></span><a
							href="/animingle/user/profile.do" class="ea">회원정보</a></li>
						<li><a href="/animingle/user/veterinary.do" class="ea">수의사
								프로필</a></li>
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
					<div class="content-title">회원 정보</div>
				</div>

				<div class="mypage-profile">
					<div class="mypage-profile-img">
						<form id="formpic">
							<img src="/animingle/asset/pic/userpic/${dto.user_pic }" id="userpic">
							<!-- 회원이 저장한 이미지로 변경 -->
							<input type="file" name="editpic" id="editpic">

							<label for="editpic" id="btnlabel">
								사진 수정
							</label>
	
						</form>
					</div>
					<form action="/animingle/user/profile.do" method="POST">
						<div class="mypage-profile-main">
							<div class="form-title">이름</div>
							<div>
								<input type="text" value="${dto.user_name }" readonly>
							</div>
							<div class="form-title">닉네임</div>
							<div>
								<input type="text" value="${dto.user_nickname }">
							</div>
							<div class="form-title">주소</div>
							<div>
								<input type="text" value="${dto.user_address }"
									id="sample6_address" readonly class="address">
								<button type="button" onclick="sample6_execDaumPostcode();"
									class="search-btn">주소 검색</button>
								<div class="address-detail">
									<input type="text" value="${dto.user_addressdetail }"
										id="sample6_detailAddress" class="detail-address">
								</div>
							</div>
							<div class="form-title">연락처</div>
							<div>
								<input type="text" class="tel" id="tel1"> - <input
									type="text" class="tel" id="tel2"> - <input type="text"
									class="tel" id="tel3">
							</div>
							<div class="mypage-edit">
								<button type="submit">수정</button>
							</div>
						</div>
					</form>

					<div>
						<form>
							<div class="mypage-profile-pw">
								<div class="form-title">현재 비밀번호</div>
								<div>
									<input type="text" placeholder="현재 비밀번호 입력">
								</div>
								<div class="form-title">새 비밀번호</div>
								<div>
									<input type="text" placeholder="새 비밀번호 입력">
								</div>
								<div class="form-title">새 비밀번호 확인</div>
								<div>
									<input type="text" placeholder="새 비밀번호 입력">
								</div>
								<div class="mypage-edit">
									<button type="submit" id="btn-edit-pw">비밀번호 변경하기</button>
								</div>
							</div>
						</form>
					</div>
					<div class="mypage-profile-count">
						<table id="tblCount">
							<tr>
								<td>내 게시글</td>
								<td>100건</td>
							</tr>
							<tr>
								<td>내 댓글</td>
								<td>30건</td>
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
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	
	//전화번호 넣어주는 코드
	let tel = '${dto.user_tel}';
	let telarr = tel.split('-');
	$('#tel1').val(telarr[0]);
	$('#tel2').val(telarr[1]);
	$('#tel3').val(telarr[2]);

	//주소 검색하는 api
	function sample6_execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수
	
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            /* document.getElementById('sample6_postcode').value = data.zonecode; */
	            document.getElementById("sample6_address").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("sample6_detailAddress").focus();
	        }
	    }).open();
	}
	
	$('#editpic').change(function() {
		
		editPic('${dto.user_id}');
		
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