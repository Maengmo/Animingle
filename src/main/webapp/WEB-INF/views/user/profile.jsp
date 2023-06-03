<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Animingle</title>
	<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
	<link rel="stylesheet" href="asset/css/index.css">
	<link rel="stylesheet" href="/animingle/asset/css/profile.css">
	<style>
	
	</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	<section class="content">
		<div class="mycontainer">
			<div class="leftbar">
				<!-- 왼쪽 사이드바 입니다. -->
			</div>
			<div class="maincontent">

				<h1>회원 정보</h1>
				<div class="mypage-profile">
					<div class="mypage-profile-img">
						<img src="/animingle/asset/commonimg/logo_01.png">
						<button>사진수정</button>
					</div>
					<form>
					<div class="mypage-profile-main">
						<div class="form-title">이름</div>
						<div>
							<input type="text" value="홍길동">
						</div>
						<div class="form-title">닉네임</div>
						<div>
							<input type="text" value="밍글맹글">
						</div>
						<div class="form-title">주소</div>
						<div>
							<input type="text" value="서울시 강남구 역삼동">
							<button>주소 입력</button>
							<div class="address-detail">
								<input type="text" value="한독빌딩 8층">
							</div>
						</div>
						<div class="form-title">연락처</div>
						<div><input type="text" value="010-1234-5678"></div>
						<div class="mypage-edit">
							<button type="submit">수정</button>
						</div>
					</div>
					</form>

					<div>
						<form>
						<div class="mypage-profile-pw">
							<div class="form-title">현재 비밀번호</div>
							<div><input type="text" placeholder="현재 비밀번호 입력"></div>
							<div class="form-title">새 비밀번호</div>
							<div><input type="text" placeholder="새 비밀번호 입력"></div>
							<div class="form-title">새 비밀번호 확인</div>
							<div><input type="text" placeholder="새 비밀번호 입력"></div>
							<div class="mypage-edit">
								<button type="submit">비밀번호 변경하기</button>
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
	<%@ include file="/WEB-INF/views/inc/footer.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

</script>
</body>
</html>