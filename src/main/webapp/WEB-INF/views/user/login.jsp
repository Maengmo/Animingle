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
						<a href="javascript:kakaoLogin()">
							<img src="/animingle/asset/pic/kakao_login.png" alt="카카오 로그인" class="social">
						</a>
					</div>
				</div>
			</div>


			<div class="rightbar">
				<!-- 오른쪽 사이드바 입니다. -->
			</div>
		</div>

	</section>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
//https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=7ddecf747d80ea67d580be8a8a51542d&redirect_uri=http://localhost:8090/animingle/user/kakaoOauth.do?cmd=callback&response_type=code

//카카오 로그인
Kakao.init('aee326e29bebd9e80119e009577e3832');
function kakaoLogin() {
    Kakao.Auth.login({
        success: function (response) {
            Kakao.API.request({
                url: '/v2/user/me',
                success: function (response) {
                	
                	//정보 받아오기
                	var data = {           			
               			id : response.id,
                       	email : response.kakao_account.email,
       		            nickname : response.kakao_account.profile.nickname,
       		            profile_image : response.kakao_account.profile.thumbnail_image_url,
                	};
                	
                	$.ajax({
                		type : 'POST',
                		url : '/animingle/user/sociallogin.do',
                		data : data,
                		dataType : 'json',
                		success : result => {
                			
                			if (result.result == "success") {
                				alert("로그인에 성공하였습니다.");
                				location.replace("/animingle/user/profile.do");
                				
                			} else if (result.result == "failed") {
                				alert("로그인에 실패하였습니다. 다시 로그인 해주세요.")
                			}
                			
                		},
                		error : (a,b,c) => console.log(a,b,c)	
                	})
                	
              

                    
                },
                fail: function (error) {
                    alert(JSON.stringify(error));
                },
            })
        },
        fail: function (error) {
            alert(JSON.stringify(error));
        },
    })
}



</script>
</body>
</html>