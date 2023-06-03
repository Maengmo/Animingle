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
					<img src="/animingle/asset/commonimg/logo_01.png">
					밍글맹글(mingle77) <span class="time">16분전</span>
				</div>
				<div class="find-view-subject">
					<span id="view-subject">[강아지] 낯선 사람이 오면 짖어요</span>
					<div class="view-subject-icon">
						<span class="material-symbols-outlined">visibility</span>50 
						<span class="material-symbols-outlined">chat</span>2
					</div>
				</div>
				<div class="find-view-content">
					문 밖에 사람 인기척만 나도 하루종일 짖어요...<br>
					너무 짖어서 목이 다 쉬었어요... 하지 말라고 간식을 줘도 오히려 더 짖는 것 같네요ㅠㅠ
				</div>
				<div class="view-button">
					<button id="btnEdit">수정하기</button>
					<button id="btnDel">삭제하기</button>
				</div>
				<div class="content-box">
					<div class="title">답 변</div>
					<div class="answer-box">
						<span class="time">10분전</span>
						<div class="comment">
							청각이 특히 예민한 아이가 있습니다.<br>
							사람 인기척에 익숙해 질 수 있도록 꾸준한 훈련을 해주면 좋을 것 같습니다.<br>
							인기척이 날 때 긍정적 보상을 주는 방법이 있어요~~~<br>
							심각해지면 저희 병원에 데려오세요
						</div>
						<div class="comment-profile-box">
							<img src="/animingle/asset/commonimg/logo_01.png">
							<div class="profile-content">
								<div>수의사1 <small>(docter77)</small></div>
								<div>참조아동물병원</div>
								<div>답변 횟수: 90회</div>
							</div>
						</div>
						<div class="comment-list-btn-box">
							<span class="material-symbols-outlined">
								comment
							</span>
							<button class="comment-list-btn">2개의 댓글</button>
						</div>
						<div class="comment-box">
							<div class="comment-main">
								<div class="comment-main-profile-box">
									<img src="/animingle/asset/commonimg/logo_01.png">
									<div>
										<div>작성자</div>
										<span>10분전</span>
									</div>
								</div>						
								<div class="comment">
									댓글댓글
								</div>
								<div class="comment-btn-box">
									<div class="comment-list-btn-box">
										<span class="material-symbols-outlined">
											expand_less
										</span>
										<button class="comment-box-btn">댓글 모두 숨기기</button>
									</div>
									<button class="comment-add-btn">댓글 쓰기</button>
									<div class="main-content-sel3">
                        				<textarea name="text" id="editor" placeholder="내용을 입력하세요."></textarea>
                     				</div>
								</div>
								<div class="comment-sub-box">
									<div class="comment-sub-profile">
										<img src="/animingle/asset/commonimg/logo_01.png">
										<div>
											<div>작성자</div>
											<span>10분전</span>
										</div>
									</div>	
									<div class="comment">
										댓글댓글
									</div>		
								</div>		
							</div>
						</div>
					</div>
				</div>
				<div class="comment-add-text-box">
					<div class="commet-add-text-area-box">
						<textarea class="comment-area" maxlength="1000" placeholder="댓글 내용을 입력하세요"></textarea>
						<div class="character-count">0/1000</div>
					</div>
					<div class="comment-add-btn-box">
						<input type="button" value="목록보기">
						<input type="button" value="댓글쓰기">
					</div>
				</div>
			</div>
			<div class="rightbar">
				<!-- 오른쪽 사이드바 입니다. -->
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script>
	$(document).ready(function() {
		
		/* $(".comment-box").hide(); */
		$(".main-content-sel3").toggle();
		
		$(".comment-list-btn").click(function() {
			$(".comment-box").toggle();
		});
		
		$(".comment-box-btn").click(function() {
			$(".comment-sub-box").toggle();
		});
		
		$(".comment-add-btn").click(function () {
			$(".main-content-sel3").toggle();
		});
		
		$(".comment-area").on('input', function() {
			var maxLength = 1000;
		    var currentLength = $(this).val().length;
		    var remainingLength = maxLength - currentLength;
		    
		    $(".character-count").text(currentLength + "/" + maxLength);
		    
		    if (currentLength > maxLength) {
		      $(this).val($(this).val().substring(0, maxLength));
		    }
		});
		
	});
	
	ClassicEditor.create( document.querySelector( '#editor' ), {
		removePlugins: [ 'Heading' ],
		language: "ko"
	});
</script>
</body>
</html>