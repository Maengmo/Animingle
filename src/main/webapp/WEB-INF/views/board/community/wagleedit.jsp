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
<link rel="stylesheet" href="/animingle/asset/css/wagleadd.css">
</head>
<body>

	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<section class="content">

		<div class="mycontainer">
			<div class="leftbar">
				<!-- 왼쪽 사이드바 입니다. -->
			</div>
			<div class="maincontent">
				<div class="top-title">
					<div class="addtitle">와글와글</div>
				</div>
				<div class="wagleform">
					<form method="POST" action="/animingle/board/wagleedit.do">
						<div>말머리</div>
						<select name="wg_prefix">
							<option value=1>일상</option>
							<option value=2>정보 공유</option>
							<option value=3>나눔</option>
						</select>
						<div>제목</div>
						<input class="title-box" name="wg_subject" type="text" value="${dto.wg_subject}">
	         			<div class="main-content-sel3">
	                        <div>본문</div>
	                        <div id="toolbar-container"></div>
	                       	<div id="editor">
	                       		${ dto.wg_content }
	                       	</div>
	                        <textarea style="display:none;" name="wg_content" id="editor1"></textarea>
	                    </div>


						<div class="waglesubmit">
							<button type="button" onclick="history.back();">취 	소</button>
							<button type="submit">수 정</button>
						</div>
						<input type="hidden" name="wg_seq" value="${dto.wg_seq}">
					</form>
				</div>
			</div>
			<div class="rightbar">
				<!-- 오른쪽 사이드바 입니다. -->
			</div>
		</div>

	</section>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/decoupled-document/ckeditor.js"></script>
<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script src="/animingle/asset/js/ckedit.js"></script>
</script>
</body>
</html>