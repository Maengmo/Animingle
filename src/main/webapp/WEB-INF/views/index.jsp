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
	<link rel="stylesheet" href="asset/css/index.css">
</head>
<body>

	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	<section class="content">
		<img class="banner-img" src="asset/commonimg/banner_01.png" style="width:100%;">
		<div class="mycontainer">
			<div class="leftbar">
				<!-- 왼쪽 사이드바 입니다. -->
			</div>
			<div class="maincontent">
				<div class="maincontent">
				    <div class="table-container">
				        <table class="walking-buddy-finder-table">
				            <tr>
				                <th>
				                    산책 친구 구하기
				                </th>
				            </tr>
				            <tr>
				                <td>
				                    친구 구합니다.
				                </td>
				            </tr>
				            <tr>
				                <td>
				                    친구 구합니다.
				                </td>
				            </tr>
				        </table>
				
				        <table class="chatterbox-table">
				            <tr>
				                <th>
				                    와글와글
				                </th>
				            </tr>
				            <tr>
				                <td>
				                    와글와글
				                </td>
				            </tr>
				            <tr>
				                <td>
				                    와글와글
				                </td>
				            </tr>
				        </table>
				
				        <table class="vet-qna-table">
				            <tr>
				                <th>
				                    수의사QnA
				                </th>
				            </tr>
				            <tr>
				                <td>
				                    강아지가 아파요
				                </td>
				            </tr>
				            <tr>
				                <td>
				                    고양이가 아파요
				                </td>
				            </tr>
				        </table>
				    </div>
				</div> 
			</div>
			<div class="rightbar">
				<!-- 오른쪽 사이드바 입니다. -->
			</div>
			
	</section>
	<%@ include file="/WEB-INF/views/inc/footer.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</body>
</html>