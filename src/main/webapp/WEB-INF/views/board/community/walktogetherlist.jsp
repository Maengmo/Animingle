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
    <link rel="stylesheet" href="/animingle/asset/css/walktogether.css">
</head>
<body>

    <%@ include file="/WEB-INF/views/inc/header.jsp" %>
    <section class="content">
        <div class="mycontainer">
            <div class="leftbar">
                <!-- 왼쪽 사이드바 입니다. -->
            </div>
            <div class="maincontent">
                <div class="content-top">
                    <div class="content-title">산책 친구 구하기</div>
                </div>

            	<div id="map" style="width:100%;height:150%;">
            	</div>
            </div>
            <div class="rightbar">
               <!-- 오른쪽 사이드바 입니다. -->
            </div>
        </div>
         
    </section>
    <%@ include file="/WEB-INF/views/inc/footer.jsp" %>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	6d88daddca380ab9ff45e48fab144915"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
	var container = document.getElementById('map');
	var options = { 
		center: new kakao.maps.LatLng(33.450701, 126.570667), 
		level: 3 
	};
	
	var map = new kakao.maps.Map(container, options); 
</script>
</body>
</html>