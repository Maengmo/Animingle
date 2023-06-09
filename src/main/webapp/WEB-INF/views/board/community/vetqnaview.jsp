<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/animingle/asset/css/index.css">
<link rel="stylesheet" href="/animingle/asset/css/vetqnaview.css">
</head>
<body>

	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<section class="content">
		<div class="mycontainer">
			<div class="leftbar">
				<!-- 왼쪽 사이드바 입니다. -->
			</div>
			<div class="maincontent main-border">
				<div class="writer find-view-writer">
					<img src="/animingle/asset/commonimg/${ dto.user_pic }"> ${ dto.user_nickname }(${ dto.user_id })
					<span class="time">${ dto.vq_regdate }</span>
				</div>
				<div class="find-view-subject">
					<span id="view-subject">${ dto.vq_subject }</span>
					<div class="view-subject-icon">
						<span class="material-symbols-outlined">visibility</span>${ dto.vq_readcount }
						<span class="material-symbols-outlined">chat</span>${ dto.vqr_cnt }
						<input type="hidden" value="${ dto.vq_prefix }">
					</div>
				</div>
				<div class="find-view-content">${ dto.vq_content }</div>
				<div class="view-button">
					<c:if test="${ dto.user_id == id }">
						<c:if test="${ dto.vqr_cnt < 1 }">
							<button id="btnDel" onclick="qnadel(${ vq_seq }, '${ dto.user_id }');">삭제하기</button>
						</c:if>
						<button id="btnEdit" onclick="qnaedit(${ vq_seq }, '${ dto.user_id }', '${ id }')">수정하기</button>
					</c:if>
				</div>	
				<div class="content-box">
					<div class="title">답 변</div>
					<c:forEach items="${ alist }" var="adto" varStatus="status">
						<div class="answer-box">
							<span class="time">${ adto.vqr_regdate }</span>
							<div class="comment">${ adto.vqr_content }</div>
							<div class="comment-profile-box">
								<img src="/animingle/asset/commonimg/${ adto.user_pic }">
								<div class="profile-content">
									<div>
										${ adto.user_nickname } <small>(${ adto.vet_seq })</small>
									</div>
									<div>${ adto.vet_clinic }</div>
									<div>답변 횟수: ${ adto.answer_cnt }</div>
									<input class="vqr_seq-${ status.index }" type="hidden" value="${ adto.vqr_seq }">
								</div>
							</div>

							<div class="comment-list-btn-box">
								<span class="material-symbols-outlined"> comment </span>
								<button class="comment-list-btn"
									data-target="#comment-box-${status.index}">
									<span class="comment-count-${status.index}">${ adto.comment_cnt }개의 댓글</span>
								</button>
							</div>
							<div class="comment-box" id="comment-box-${status.index}">
								<div class="comment-main-${ adto.vqr_seq }">
									<c:forEach items="${ clist }" var="cdto">
										<c:if test="${adto.vqr_seq eq cdto.vqr_seq}">
											<div class="comment-sub-box">
												<div class="comment-main-profile-box">
													<img class="comment-profile-img" src="/animingle/asset/commonimg/logo_01.png">
													<div>
														<div>${ cdto.vqrc_writer }</div>
														<span>${ cdto.vqrc_regdate }</span>
													</div>
												</div>
												<div class="comment">${ cdto.vqrc_content }</div>
											</div>
										</c:if>
									</c:forEach>
								</div>
								<button class="comment-add-btn"
									data-target="#comment-add-btn-${status.index}">댓글쓰기</button>
								<div class="comment-textarea-box" id="comment-add-btn-${status.index}">
									<c:if test="${ id != null }">
										<form id="comment-add" class="comment-add">
											<textarea class="comment-textarea-${ status.index }" name="text" id="editor-${status.index}"
												placeholder="내용을 입력하세요."></textarea>
											<div class="btn-box">
												<input class="comment-btn" type="button" value="댓글작성" onclick="commentadd(${status.index})">
											</div>
										</form>
									</c:if>
									<c:if test="${ id == null }">
										<form id="comment-add" class="comment-add">
											<textarea class="comment-textarea-${ status.index }" name="text" id="editor-${status.index}"
												placeholder="댓글은 로그인 후 입력 가능합니다."></textarea>
											<div class="btn-box">
											</div>
										</form>
									</c:if>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="comment-add-text-box">
					<form action="/animingle/board/vetqnaanswer.do" method="POST">
						<c:if test="${ isVet == 'Y' }">
							<div class="commet-add-text-area-box">
								<textarea name="vqr_content" class="comment-area"
									maxlength="1000" placeholder="답변을 입력하세요"></textarea>
								<div class="character-count">0/1000</div>
							</div>
							<div class="comment-add-btn-box">
								<input type="button" value="목록보기"
									onclick="location.href='/animingle/board/vetqnalist.do'">
								<input class="answer_add_btn" type="submit" value="답변쓰기">
							</div>
						</c:if>
						<c:if test="${ isVet != 'Y' }">
							<div class="commet-add-text-area-box">
								<textarea name="vqr_content" class="comment-area"
									maxlength="1000" readonly="readonly" placeholder="답변은 수의사만 가능합니다."></textarea>
								<div class="character-count">0/1000</div>
							</div>
							<div class="comment-add-btn-box">
								<input type="button" value="목록보기"
									onclick="location.href='/animingle/board/vetqnalist.do?page=${ page }'">
							</div>
						</c:if>
						<input name="vq_seq" type="hidden" value="${ vq_seq }">
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
	<script	src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
	<script	src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
	
<script>
	
	var myEditor = [];
	
	$(document).ready(function () {
	
		$(".comment-box").hide();
	    $(".comment-textarea-box").hide();
	
	    $(".comment-list-btn").click(function () {
	    	var target = $(this).data('target');
	        $(target).toggle();
	    });
	
		$(".comment-add-btn").click(function () {
	    	var target = $(this).data('target');
	        $(target).toggle();
		});
	
	    $(".comment-area").on('input', function () {
			var maxLength = 1000;
	        var currentLength = $(this).val().length;
			var remainingLength = maxLength - currentLength;
	
			$(".character-count").text(currentLength + "/" + maxLength);
		
				if (currentLength > maxLength) {
					$(this).val($(this).val().substring(0, maxLength));
		        }
			
		});
	    
		<c:forEach items="${alist}" var="adto" varStatus="status">
	    	ClassicEditor.create(document.querySelector('#editor-${status.index}'), {
	    		removePlugins: ['Heading'],
	    		language: 'ko'
	    	}).then( editor => {
	    		myEditor.push(editor);
	    	});
		</c:forEach>

	});
	
    function commentadd(count) {
		
		var vqr_seq = $(`.vqr_seq-\${count}`).val();
		var vqrc_content = myEditor[count].getData(); 
		
		$.ajax({
			url: "/animingle/board/vetqnacomment.do",
			type: "POST",
			dataType: "json",
			data: {
				vqr_seq: vqr_seq,
				vqrc_writer: 'leehan0608',
				vqrc_content: vqrc_content
			},
			success: function(result) {
				$(`.comment-main-\${ result.vqr_seq }`).append(
						`
							<div class="comment-sub-box">
								<div class="comment-main-profile-box">
									<img class="comment-profile-img" src="/animingle/asset/commonimg/logo_01.png">
									<div>
										<div>\${ result.vqrc_writer }</div>
										<span>\${ result.vqrc_regdate }</span>
									</div>
								</div>
								<div class="comment">\${ result.vqrc_content }</div>
							</div>
						`
				);
				
				myEditor[count].setData("");
				$(`.comment-count-\${count}`).text(result.comment_cnt + "개의 댓글");
			},
			error: function(a, b, c) {
				console.log(a, b, c);
			}			
		});
		
	};
	
	function qnadel(vq_seq, user_id) {
		
		if (!confirm("정말 게시물을 삭제 할까요??")) {
			alert("삭제를 취소합니다.");
			
		} else {
			location.href = "/animingle/board/vetqnadel.do?vq_seq=" + vq_seq + "&user_id=" + user_id;
		}
		
	}
	
	function qnaedit(vq_seq, user_id, id) {
		
		let subject = $("#view-subject").text();
		let content = $(".find-view-content").html();
		let prefix = $("input[type='hidden']").val();
		
		if (user_id == id) {
			
			let url = "/animingle/board/vetqnaedit.do" +
		      "?vq_seq=" + vq_seq +
		      "&vq_subject=" + encodeURIComponent(subject) +
		      "&vq_content=" + encodeURIComponent(content) +
		      "&vq_prefix=" + encodeURIComponent(prefix);
			
			location.href = url;
			
		} else {
			alert("게시글 작성자가 아닙니다.");
			location.href = "/animingle/index.do";
		}
		
	}
</script>
</body>
</html>