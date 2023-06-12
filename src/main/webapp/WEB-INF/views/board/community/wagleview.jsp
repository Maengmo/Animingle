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
<link rel="stylesheet" href="/animingle/asset/css/wagleview.css">
<link
	href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
	rel="stylesheet">

</head>
<body>

	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<section class="content">

		<div class="mycontainer">
			<div class="leftbar">
				<!-- 왼쪽 사이드바 입니다. -->
			</div>
			<div class="maincontent">
				<c:if test="${page != null && page != ''}">
				<div class="a-div">
					<a href="/animingle/board/waglelist.do?page=${page}" class="a-back"> 
					<span id="arrow" class="material-symbols-outlined">arrow_back</span> 
					<span class="back-to-list">목록으로 돌아가기</span>
					</a>
				</div>
				</c:if>					
				<c:if test="${page == null || page == ''}">
				<div class="a-div">
					<a href="/animingle/board/waglelist.do" class="a-back"> 
					<span id="arrow" class="material-symbols-outlined">arrow_back</span> 
					<span class="back-to-list">목록으로 돌아가기</span>
					</a>
				</div>
				</c:if>					
				<div class="content-box">
					<div class="content-top">
						<div class="user-profile">
							<img src="/animingle/asset/pic/userpic/${dto.user_pic}"	class="profile-img" id="profile-img"> 
							<span class="item-id">${dto.wg_nickname}(${dto.wg_writer})</span>
						</div>
						<div class="content-top2">
							<div class="content-title">
								<span>[${dto.wg_prefix}]</span> <span>${dto.wg_subject}</span> <span
									class="content-time">${dto.wg_regdate}</span>
							</div>
							<div class="content-views">
								<span class="material-symbols-outlined">visibility</span> <span
									class="views-count">${dto.wg_readcount}</span> <span
									class="material-symbols-outlined">chat</span> <span
									class="views-count">${map.ccnt}</span>
							</div>
						</div>
					</div>
					<div class="content-main">
						<span> ${dto.wg_content} </span>
						<!-- <div class="content-image">
						<img src="/animingle/asset/pic/Wagledog.png">
					</div> -->
					</div>
					<c:if test="${not empty id && (id == dto.wg_writer)}">
						<div class="btn-div">
							<button type="button" class="content-btn1"
								onclick="location.href='/animingle/board/wagleedit.do?seq=${dto.wg_seq}';">수정하기</button>
							<button type="button" class="content-btn2"
								onclick="location.href='/animingle/board/wagledel.do?seq=${dto.wg_seq}';">삭제하기</button>
						</div>
					</c:if>
					<div class="content-bottom">
						<div class="comment-top">
							<span>${map.ccnt}개의 댓글</span>
						</div>
						<c:forEach items="${clist}" var="cdto">
							<div class="comment-view">
								<div class="comment-image">
									<img src="/animingle/asset/pic/userpic/${cdto.user_pic}">
								</div>
								<div class="comment">
									<div class="comment-info">
										<span>${cdto.wgc_nickname}(${cdto.wgc_writer})</span> <span>${cdto.wgc_regdate}</span>
									</div>
									<div class="comment-text">
										${cdto.wgc_content}
										<c:if test="${not empty id && (id == cdto.wgc_writer)}">
										<div class="comment-editdelbtn">
										<%-- <button type="button" class="comment-editbtn"
								onclick="location.href='/animingle/board/wagledelcomment.do?cseq=${cdto.wgc_seq}&seq=${dto.wg_seq}';">수정</button> --%>
										<button type="button" class="comment-delbtn"
								onclick="location.href='/animingle/board/wagledelcomment.do?cseq=${cdto.wgc_seq}&seq=${dto.wg_seq}';">삭제</button>
										</div>
										</c:if>
									</div>
								</div>
							</div>
						</c:forEach>
						<c:if test="${not empty id}">
							<form method="POST" action="/animingle/board/waglecommentadd.do">
								<div class="comment-add">
									<div class="comment-image">
										<img src="/animingle/asset/pic/userpic/${usermap.userpic}">
									</div>
									<div class="main-content-sel3">
										<textarea name="content" id="editor"
											placeholder="생각의 차이를 인정하고 공감을 나눠주세요."></textarea>
									</div>
								</div>
								<div class="comment-btn">

									<button type="submit" class="comment-btn1">댓글작성</button>

									<!-- 		            		<button type="button" class="comment-btn2" onclick="location.href='/animingle/board/waglelist.do';">목록보기</button> -->
								</div>
								<input type="hidden" name="wg_seq" value="${dto.wg_seq}">
							</form>
						</c:if>
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
	<script
		src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
	<script
		src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
	<script>
		
	</script>
</body>
</html>