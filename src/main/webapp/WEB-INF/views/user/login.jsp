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
<link rel="stylesheet" href="/animingle/asset/css/index.css">
<link rel="stylesheet" href="/animingle/asset/css/login.css">
</head>
<body>

	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<section class="content">

		<div class="mycontainer">
			<div class="leftbar">
				<!-- 왼쪽 사이드바 입니다. -->
			</div>
			<div class="maincontent">

				<img src="/animingle/asset/commonimg/logo_01.png">
				<div class="login-box">
					<h2>로그인</h2>
					<form method="POST" action="/animingle/user/login.do">
						<table class="login-form">
							<tr>
								<td><input type="text" name="id" id="id" class="id"
									placeholder="아이디"></td>
							</tr>
							<tr>
								<td><input type="password" name="pw" id="pw" class="pw"
									placeholder="비밀번호"></td>
							</tr>
						</table>

						<button type="submit" class="login-btn">로그인</button>
					</form>
					<div class="social-login">
						<img src="/animingle/asset/pic/KakaoTalk_logo.png" onclick=""
							class="social"> <img
							src="/animingle/asset/pic/Naver_logo.png" onclick=""
							class="social"> <img
							src="/animingle/asset/pic/Google_logo.png" onclick=""
							class="social">
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
</body>
</html>