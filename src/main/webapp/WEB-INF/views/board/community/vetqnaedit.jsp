<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>Insert title here</title>
   <%@ include file="/WEB-INF/views/inc/asset.jsp" %>
   <link rel="stylesheet" href="/animingle/asset/css/index.css">
   <link rel="stylesheet" href="/animingle/asset/css/vetqnaadd.css">
</head>
<body>

   <%@ include file="/WEB-INF/views/inc/header.jsp" %>
   <section class="content">
      <div class="mycontainer">
         <div class="leftbar">
            <!-- 왼쪽 사이드바 입니다. -->
         </div>
         <div class="maincontent">
         	<div class="main-content-box">
         		<div class="main-content-title">수의사QnA</div>
         		<form action="/animingle/board/vetqnaedit.do" method="POST">
	         		<div>
	         			<div class="main-content-sel1">
	         				<div>말머리</div>
	         				<select name="tag">
	         					<option ${vq_prefix == 1 ? 'selected' : ''}>강아지</option>
  								<option ${vq_prefix == 2 ? 'selected' : ''}>고양이</option>
  								<option ${vq_prefix == 3 ? 'selected' : ''}>기타</option>
	         				</select>
	         			</div>
	         			<div class="main-content-sel2">
	         				<div>제목</div>
	         				<input name="title" type="text" placeholder="제목을 입력하세요" value="${ vq_subject }">
	         			</div>
	         			<div class="main-content-sel3">
	         				<div>본문</div>
	         				<textarea name="content" id="editor" placeholder="내용을 입력하세요.">${ vq_content }</textarea>
	         			</div>
	         		</div>
	         		<div class="btn-div">
	            		<button type="button" id="del-btn" class="content-btn cancel-btn" onclick="history.back();">취 소</button>
						<button type="submit" id="add-btn" class="content-btn add-btn">수 정</button>
						<input name="vq_seq" type="hidden" value="${ vq_seq }">
	        		</div>
         		</form>
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
<script>
	ClassicEditor.create( document.querySelector( '#editor' ), {
		removePlugins: [ 'Heading' ],
		language: "ko"
	});
</script>
</body>
</html>