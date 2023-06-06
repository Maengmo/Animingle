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
								<input type="text" value="${dto.vet_name }" readonly style="outline: none;">
							</div>
							<div class="form-title">병원명</div>
							<div>
								<input type="text" value="${dto.vet_clinic }" name="vet_clinic">
							</div>
							<div class="form-title">병원주소</div>
							<div>
								<input type="text" value="${dto.vet_address }" id="sample6_address" readonly class="address" name="vet_address">
								<button type="button" onclick="sample6_execDaumPostcode();"
									class="search-btn">주소 검색</button>
							</div>
							<div class="form-title">경력</div>
							<div>
								<div class="careerlist">
								<c:forEach items="${vclist}" var="career" varStatus="status">
									<div>
										<input type="text" value="${career }" readonly name="vet_career" style="outline: none;">
										<button type="button" class="btn-del-career" onclick="delCareer();"> - </button>
									</div>
								</c:forEach>
								</div>
									<input type="text" value="" class="newcareer">
									<button type="button" class="btn-add-career" onclick="addCareer();"> + </button>
							</div>
							<div class="form-title">진료과목</div>
							<div>
								<input type="text" value="${dto.vet_major }" name="vet_major">
							</div>
							<div class="mypage-edit">
								<button type="submit">수정</button>
							</div>
						</div>
					</form>
				</div>
					<div class="mypage-reply">
						<h3>답변 내역</h3>
						<table id="tblReply">
							<c:forEach items="${vqlist }" var="dto">
							<tr onclick="location.href='/animingle/board/vetqnaview.do&seq=${dto.vq_seq}'">
								<td>${dto.vq_subject }</td>
								<td>${dto.vq_regdate }</td>
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

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	
	
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
	            $('#sample6_address').css('border', '2px solid #0256AA');
	        }
	    }).open();
	}
	
	
	$('#editpic').change(function() {
		
		editPic();
		
	});
	
	function editPic() {
		
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
				alert('사진 수정이 완료되었습니다.');
				
			},
			error: (a,b,c)=>console.log(a,b,c)
			
		});
		
		
	}
	
	function addCareer() {
		
		let newcareer = $('.newcareer').val();
		
		if (newcareer != '') {
			
			$('.careerlist').append(
				`	
					<div>
						<input type="text" value="\${newcareer}" readonly name="vet_career" style="border: 2px solid #0256AA; outline: none;">
						<button type="button" class="btn-del-career" onclick="delCareer();"> - </button>
					</div>
				`
			);
			
			$('.newcareer').val("");
			
		}
		
	}
	
	function delCareer() {
		
		$(event.target).parent().remove();
		
	}
	
	$('form input[type=text]').change(function() {
		
		$(this).css('border', '2px solid #0256AA');
		$('.newcareer').css('border', '2px solid #CCC');
		
	});
	
	</script>
</body>
</html>