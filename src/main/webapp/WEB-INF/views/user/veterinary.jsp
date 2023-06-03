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
			
				<h1>수의사 프로필</h1>
				<div class="mypage-profile">
					<div class="mypage-vet-img">
						<img src="/animingle/asset/commonimg/logo_01.png">
						<button>사진수정</button>
					</div>
					<form>
					<div class="mypage-profile-main">
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
						<div><input type="text" value="고양이"></div>
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
	<%@ include file="/WEB-INF/views/inc/footer.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	
</script>
</body>
</html>