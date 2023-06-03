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
				<div class="content-top">
					<div class="user-profile">
						<img src="/animingle/asset/commonimg/animingle.png"> <span>밍글맹글(mingle77)</span>
					</div>
					<div class="content-top2">
						<div class="content-title">
							<span>[일상]</span> 
							<span>우리 애기 돌잔치 했어용</span> 
							<span>16분 전</span>
						</div>
						<div class="content-views">
							<span class="material-symbols-outlined">visibility</span> <span
								class="views-count">54</span> <span
								class="material-symbols-outlined">chat</span> <span
								class="views-count">3</span>
						</div>
					</div>
				</div>
				<div class="content-main">
					<span>
					귀엽죵~~<br>개껌 집었어용.<br>돌상은 제가 직접 차려줬답니다.😍
					</span>
					<div class="content-image">
						<img src="/animingle/asset/pic/Wagledog.png">
					</div>
				</div>
				<div class="submit-btn">
					<button type="button" onclick="">삭제하기</button>
					<button type="button"
						onclick="">수정하기</button>
				</div>
				<div class="content-bottom">
					<div class="comment-top">
						<span>2개의 댓글</span>
					</div>
					<div class="comment-view">
						<div class="comment-image">
							<img src="/animingle/asset/commonimg/animingle.png">
						</div>
						<div class="comment">
							<div class="comment-info">
								<span>하루하루(daily33)</span> 
								<span>16분 전</span>
							</div>
							<div class="comment-text">
								애기 넘 귀여워용 ㅠ.ㅠ 저희 애기 돌잔치 때 생각나네요~~
							</div>
						</div>
					</div>
					<div class="comment-add">
						<div class="comment-image">
							<img src="/animingle/asset/commonimg/animingle.png">
						</div>
						<div class="main-content-sel3">
                        	<textarea name="text" id="editor" placeholder="생각의 차이를 인정하고 공감을 나눠주세요."></textarea>
                		</div>
					</div>
					<div class="comment-btn">
					<button type="button" onclick="">댓글 작성</button>
					<button type="button"
						onclick="location.href='http://localhost:8090/animingle/board/waglelist.do'">목록 보기</button>
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