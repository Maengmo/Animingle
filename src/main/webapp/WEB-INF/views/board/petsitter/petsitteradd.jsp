<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>펫시터 글쓰기</title>
	<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
	<link rel="stylesheet" href="/animingle/asset/css/index.css">
	<link rel="stylesheet" href="/animingle/asset/css/petsitteradd.css">
</head>
<body>

	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	<section class="content">
		<div class="mycontainer">
			<div class="leftbar">
				<!-- 왼쪽 사이드바 입니다. -->
			</div>
			<div class="maincontent">
				<h2 class="main-title">나의 동물친구 펫시터를 구해요</h2>
				<hr>
				
				<div class="main-form">
					<div class="form-title">
						<div>제목</div>
						<div><input type="text" class="title" id="title" placeholder="제목을 입력해주세요." autofocus></div>
					</div>
					<div class="form-date">
						<div>
							<div class="date-title">부터</div>
							<div><input type="date" class="petsitter-date" id="start-date" ></div>
						</div>
						<span> ~ </span>
						<div>
							<div class="date-title">까지</div>
							<div><input type="date" class="petsitter-date" id="end-date" onchange="checkDate();"></div>
						</div>
					</div>
					<div class="form-address">
						<div>지역(동)</div>
						<div>
							<div><input type="text" class="address" id="address" placeholder="지역(동)을 입력해주세요."></div>
							<div>
								<button type="button" class="find-address" id="find-address" onclick="sample6_execDaumPostcode();">주소 찾기</button>
							</div>
						</div>
					</div>
					
					
					<div class="main-content-sel3">
                        <div>본문</div>
                        <textarea name="text" id="editor" placeholder="내용을 입력하세요."></textarea>
                     </div>
					
					<div class="btn-div">
						<button type="button" id="add-btn" class="content-btn add-btn">등록</button>
						
	            		<button type="button" id="del-btn" class="content-btn cancel-btn" onclick="history.back();">취소</button>
	            		
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
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/animingle/asset/js/petsitteradd.js"></script>
<script>
</script>
</body>
</html>