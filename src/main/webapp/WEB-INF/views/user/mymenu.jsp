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
   <link rel="stylesheet" href="/animingle/asset/css/mymenu.css">
</head>
<body>

   <%@ include file="/WEB-INF/views/inc/header.jsp" %>
   <section class="content">
      <div class="mycontainer">
         <div class="leftbar">
            <!-- 왼쪽 사이드바 입니다. -->
            <div class="mymenu">
            
            	<ul>
            		<li>회원정보</li>
            		<li>수의사 프로필</li>
            		<li>펫시터 프로필</li>
            		<li class="selected"><span><img src="/animingle/asset/commonimg/stamp.png" class="stamp"></span>펫시터 모집내역</li>
            		<li>인증센터</li>
            		<li>내 문의사항</li>
            	</ul>
            
            </div>
            
         </div>
         <div class="maincontent">

                
                

         </div>
         <div class="rightbar">
            <!-- 오른쪽 사이드바 입니다. -->
         </div>
         </div>
   </section>
   <%@ include file="/WEB-INF/views/inc/footer.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

</script>
</body>
</html>