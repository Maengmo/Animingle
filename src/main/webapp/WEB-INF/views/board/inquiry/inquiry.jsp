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
         		<div class="main-content-title">고객센터 - 문의하기</div>
         		<div>
         			<div class="main-content-sel1">
         				<div>말머리</div>
         				<select id="inquiry_brackets">
         					<option value="1">건의하기</option>
         					<option value="2">신고하기</option>
         				</select>
         			</div>
         			<div class="main-content-sel2">
         				<div>제목</div>
         				<input type="text" id="title" placeholder="제목을 입력하세요">
         			</div>
         			<div class="main-content-sel3">
         				<div>본문</div>
         				<textarea name="text" id="editor" placeholder="내용을 입력하세요."></textarea>
         			</div>
         		</div>
         	</div>
         	<div class="btn-div">
	            <button type="button" id="del-btn" class="content-btn cancel-btn" onclick="history.back();">취 소</button>
				<button type="button" id="add-btn" class="content-btn add-btn">등 록</button>
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
	let editor;
	
	ClassicEditor.create( document.querySelector( '#editor' ), {
		removePlugins: [ 'Heading' ],
		language: "ko"
	}).then( newEditor => {
	    editor = newEditor;
	}).catch( error => {
	    console.error( error );
	});
	
	$('#add-btn').on('click', function() {
		
		const inquiryContent = editor.getData();
		
		
		 $.ajax({
	         type: 'POST',
	         url: '/animingle/board/inquiry.do',
	         data: {
	        	 prefix : $('#inquiry_brackets').val(),
	        	 title : $('#title').val(),
	        	 content : inquiryContent
	         },
	         dataType: 'json',
	         success: function (result) {
	        	 if (result.result == 1) {
	        		 alert("문의가 성공적으로 등록되었습니다.");
	        		 window.location = '/animingle/index.do';
	        	 } else {
	        		 alert("문의 등록에 실패하였습니다.")
	        	 }
	         },
	         
	         error: (a,b,c)=>console.log(a,b,c)
	      });
		
	
	
		
	});
	
</script>
</body>
</html>