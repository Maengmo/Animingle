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
<link rel="stylesheet" href="/animingle/asset/css/find.css">
	<style>
	
	.main-border {
		border: 1px solid black;
	}
		
	.find-view-writer {
		margin-left: 10px;
		margin-top: 10px;
		display: flex;
		align-items: center;
	}
	
	.find-view-writer span {
		padding-left: 20px;
	}
		
	.maincontent #view-subject {
		margin-left: 20px;
		font-family: "SUITE-Regular";
		border: 1px solid red;
	}
	
	.find-view-subject {
		display: flex;
		align-items: center;
		padding-left: 40px;
	}
	
	.view-subjcet {
		margin-right: 20px;
	} 
	
		
	</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	<section class="content">
		<div class="mycontainer">
			<div class="leftbar">
				<!-- 왼쪽 사이드바 입니다. -->
			</div>
			<div class="maincontent main-border">
				<div class="writer find-view-writer">
					<img src="/animingle/asset/commonimg/logo_01.png">
							밍글맹글(mingle77)
					<span class="time">16분전</span>
				</div>
				<div class="find-view-subject">
					<span id="view-subjcet">[펫 찾아요] 강남구 역삼동에서 아이를 잃어버렸어요...</span>
					<span class="material-symbols-outlined">visibility</span>50
					<span class="material-symbols-outlined">chat</span>2
				</div>
			</div>
			<div class="rightbar">
				<!-- 오른쪽 사이드바 입니다. -->
			</div>
		</div>
			
	</section>
	<%@ include file="/WEB-INF/views/inc/footer.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</body>
</html>