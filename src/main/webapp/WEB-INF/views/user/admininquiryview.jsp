<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>고객센터 문의현황</title>
   <%@ include file="/WEB-INF/views/inc/asset.jsp" %>
   <link rel="stylesheet" href="/animingle/asset/css/index.css">
   <link rel="stylesheet" href="/animingle/asset/css/admininquiryview.css">
   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>

   <%@ include file="/WEB-INF/views/inc/header.jsp" %>
   <section class="content">
      <div class="mycontainer">
         <div class="leftbar">
            <!-- 왼쪽 사이드바 입니다. -->
         </div>
         <div class="maincontent">   
         <div class="back-to-list"  onclick="history.back();">
       		<span class="material-symbols-outlined back-to-listbtn">
				arrow_back
			</span>
         	목록으로 돌아가기
        </div>    
	        <div class="content-box">
	        		
	            	<div class="detail-content">
		            		<div class="content-title">
		            			<c:if test="${indto.in_prefix == 1}">
		            				<div>[문의] &nbsp;${indto.in_subject }</div>
		            			</c:if>
		            			<c:if test="${indto.in_prefix == 2}">
		            				<div>[신고] &nbsp;${indto.in_subject }</div>
		            			</c:if>
		            			
		            			<div class="content-config">
			            		${indto.in_writer }(${indto.nickname }) | ${indto.in_regdate}
			            	
			            		</div>
			            	</div>
		            	<div class="content-text">
		            		${indto.in_content }
		            	</div>
		            	
	            	
			
	            	
		            <div class="answer-content">
		            	<div>
				            <span class="material-symbols-outlined">
								chat
							</span>
				            <span>답변</span>
			            </div>
			            
			            
			            <div class="answer-list">
				            <c:forEach items="${anlist}" var="dto">
				            	<div class="answer">
				            		<div class="answer-config">
				            			<span>${dto.a_id }(${dto.a_nickname })</span>	
				            		</div>
				            		<div>${dto.ina_content }</div>
				            		
				            		<div>${dto.ina_regdate }</div>
				            	</div>
				            
				            </c:forEach>
				         </div>
		            </div>
		            
		            <div class="main-content-sel3">
         				<textarea name="text" id="editor" placeholder="내용을 입력하세요."></textarea>
         			</div>
         			<div class="btn-div">
						<button type="button" id="add-btn" class="content-btn add-btn">등 록</button>
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


$('#add-btn').on('click', function () {
	
	const answerContent = editor.getData();
	
	
	 $.ajax({
         type: 'POST',
         url: '/animingle/user/admin/inquiryview.do',
         data: {
        	 in_seq : ${indto.in_seq},
        	 content : answerContent
         },
         dataType: 'json',
         success: function (result) {
        	 if (result.result == 1) {
        		 //alert("답변이 성공적으로 등록되었습니다.");
        		 //답변 바로 추가
        		 
        		 let div = `
	        			 <div class="answer">
		            		<div class="answer-config">
		            			<span>\${result.a_id}(\${result.a_nickname})</span>	
		            		</div>
		            		<div>\${result.content }</div>
		            		
		            		<div>\${result.regdate }</div>
		            	</div>
		            	
						`;

				$('.answer-list').append(div);
				
				editor.setData("");
				
				
				

 		 
        	 } else {
        		 alert("답변 등록에 실패하였습니다.")
        	 }
         },
         
         error: (a,b,c)=>console.log(a,b,c)
      });
	


	
});

</script>
</body>
</html>