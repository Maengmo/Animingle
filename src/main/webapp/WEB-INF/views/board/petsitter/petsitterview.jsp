<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>펫시터 상세보기</title>
	<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
	<link rel="stylesheet" href="/animingle/asset/css/index.css">
	<link rel="stylesheet" href="/animingle/asset/css/petsitterview.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	<style>
	.material-symbols-outlined {
		font-size : 10px;
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
			<div class="maincontent">
				<div class="a-div">
					<a href="/animingle/board/petsitter.do?page=${ page }" class="a-back">
						<span class="material-symbols-outlined">arrow_back</span>
						<span class="back-to-list">목록으로 돌아가기</span>
					</a>
				</div>
				<div class="content-box">
					<div>
	            		<img src="/animingle/asset/pic/${ dto.user_pic }" alt="프로필이미지" class="profile-img" id="profile-img"> 
	            		<span class="item-id">${ dto.user_nickname }(${ dto.psr_writer })</span>
	            	</div>
	            	
	            	<div class="detail-content">
	            		<div>
		            		<div class="content-title">${ dto.psr_subject }</div>
		            		<span class="content-time">${ dto.psr_regdate }</span>
		            	</div>
		            	<div class="detail-config">
		            		<span>[<fmt:formatDate value="${dto.psr_fromdate}" pattern="yyyy-MM-dd HH:mm"/> ~ <fmt:formatDate value="${dto.psr_todate}" pattern="yyyy-MM-dd HH:mm"/>]</span>
		            		<span>${ dto.psr_region }</span>
		            	</div>
		            	
		            	<div class="content-text">
			            	${ dto.psr_content }
		            	</div>
		            	
		            	<div class="btn-div">
		            		<c:if test="${ dto.psr_writer == id }">
			            		<button type="button" class="content-btn1" onclick="location.href='/animingle/board/petsitteredit.do?psr_seq=${ psr_seq }&page=${ page }'">수정하기</button>
			            		<c:if test="${ plist.size() == 0}">
			            			<button type="button" class="content-btn2" onclick="location.href='/animingle/board/petsitterdel.do?psr_seq=${ psr_seq }&psr_writer=${dto.psr_writer}&page=${ page }'">삭제하기</button>
			            		</c:if>
		            		</c:if>
		            	</div>
		            	<div class="writebtn-div">
		            		<c:if test="${ isPet == 'Y' && dto.psr_state == '모집중'}">
					         	<button type="submit" id="write-btn" class="write-btn" onclick="location.href='/animingle/board/petsitterapply.do?psr_seq=${ psr_seq }&page=${ page }'">
						         	신청하기
					         	</button>
				         	</c:if>
			        	 </div>
	            	</div>
	            		
		            <div class="applicant-list">
		            	<span class="applicant-list-title">신청자 목록</span>
		            	<c:forEach items="${ plist }" var="pdto">
			            	<div class="list-item">
			            		<div class="list-item-div">
			            			<div class="item-div1">
			            				<img src="/animingle/asset/pic/${ pdto.user_pic }" alt="프로필이미지" class="applicant-profile-img" id="profile-img"> 
			            			</div>
			            			
			            			<div class="item-div2">
			            				<div class="applicant-id">${ pdto.user_nickname }(${ pdto.ps_id })</div>
			            				<div>돌봄 횟수 : ${ pdto.ps_cnt }회</div>
			            				<div>별점 : ${ pdto.rate }</div>
			            			</div>
			            			
		            				<c:if test='${ id.equals(pdto.psr_writer) or pdto.ps_id.equals(id) }'>
				            			<div class="item-div3">
				            				<c:if test="${ pdto.psa_adoptdate != null }">
				            					<button type="button" class="applicant-btn" data-bs-toggle="modal" data-bs-target="#staticBackdrop">채팅하기</button>
				            				</c:if>
				            				<c:if test='${dto.psr_state.equals("모집중") }'>
				            					<button type="button" class="applicant-btn" onclick="location.href='/animingle/board/selectpetsitter.do?psr_seq=${ psr_seq }&page=${ page }&psa_seq=${ pdto.psa_seq }&psr_writer=${ pdto.psr_writer }'">맡기기</button>
				            				</c:if>
				            			</div>
				            			<!-- 채팅모달 -->
										<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
										  <div class="modal-dialog">
										    <div class="modal-content">
										      <div class="modal-header">
										        <h5 class="modal-title" id="staticBackdropLabel">채팅</h5>
										        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										      </div>
										      <div id="messageWindow" >
										      </div>
										      <div class="modal-footer">
										      	<input id="inputMessage" class="cht-msg-box" type="text" onkeyup="enterkey()" autocomplete="off">
										        <button type="button" class="btn btn-primary" onclick="send()">전 송</button>
										      </div>
										    </div>
										  </div>
										</div>
										<c:if test="${(sessionScope.nickname ne '') and !(empty sessionScope.nickname)}">
									        <input type="hidden" value='${sessionScope.nickname}' id='chat_id' />
									    </c:if>
									    <c:if test="${(sessionScope.nickname eq '') or (empty sessionScope.nickname)}">
									        <input type="hidden" value="${ sessionScope.nickname.substring(0, 6) }"
									            id='chat_id' />
									    </c:if>
		            				</c:if>
			            		</div> 	
			            		<div class="info">
			            			${ pdto.ps_intro }           			
			            		</div>
			            	</div>
		            	</c:forEach>
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
<script>
		
		var textarea = document.getElementById("messageWindow");
		var webSocket = new WebSocket('ws://localhost:8090/animingle/petsitterview.do');
		var inputMessage = document.getElementById('inputMessage');
		
		webSocket.onerror = function(event) {
	        onError(event)
	    };
	    
	    webSocket.onopen = function(event) {
	        onOpen(event)
	    };
	    
	    webSocket.onmessage = function(event) {
	        onMessage(event)
	    };
	    
	    function onMessage(event) {
	        var message = event.data.split("|");
	        var sender = message[0];
	        var content = message[1];
	        if (content == "") {
	            
	        } else {
	            if (content.match("/")) {
	                if (content.match(("/" + $("#chat_id").val()))) {
	                    var temp = content.replace("/" + $("#chat_id").val(), "(귓속말) :").split(":");
	                    if (temp[1].trim() == "") {
	                    } else {
	                        $("#messageWindow").html($("#messageWindow").html() + "<p class='whisper'>"
	                            + sender + content.replace("/" + $("#chat_id").val(), "(귓속말) :") + "</p>");
	                    }
	                } else {
	                }
	            } else {
	                if (content.match("!")) {
	                    $("#messageWindow").html($("#messageWindow").html()
	                        + "<p class='chat_content'><b class='impress'>" + sender + " : " + content + "</b></p>");
	                } else {
	                    $("#messageWindow").html($("#messageWindow").html()
	                        + "<p class='chat_content'>" + sender + " : " + content + "</p>");
	                }
	            }
	        }
	    }
	    
	    function onOpen(event) {
	        $("#messageWindow").html("<p class='chat_content'>채팅에 참여하였습니다.</p>");
	        /* alert($("#messageWindow")); */
	    }
	    
	    function onError(event) {
	        alert(event.data + '채팅서버 에러');
	    }
	    
	    function send() {
	        if (inputMessage.value == "") {
	        } else {
	            $("#messageWindow").html($("#messageWindow").html()
	                + "<p class='chat_content'>나 : " + inputMessage.value + "</p>");
	        }
	        webSocket.send($("#chat_id").val() + "|" + inputMessage.value);
	        inputMessage.value = "";
	    }
	    
	    //     엔터키를 통해 send함
	    function enterkey() {
	        if (window.event.keyCode == 13) {
	            send();
	        }
	    }
	    
</script>
</body>
</html>