<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
 	<nav class="navbar navbar-expand-lg navbar-dark bg-white">
      <div class="container" style="margin: 0 auto;">
        <a class="navbar-brand text-dark" href="/animingle/index.do"
          ><img class="main-logo" src="/animingle/asset/commonimg/logo_03.png" alt=""
        /></a>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="material-symbols-outlined"> pets </span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
            <li class="nav-item">
            <c:if test="${empty id}">
              <a class="nav-link text-dark" aria-current="page" href="/animingle/user/login.do"
                >로그인</a>
            </c:if>
            <c:if test="${not empty id}">
              <a class="nav-link text-dark" aria-current="page" href="/animingle/user/logout.do"
                >로그아웃</a>
            </c:if>
            </li>
			
			
            <li class="nav-item">
            <c:if test="${empty id}">
              <a class="nav-link text-dark" aria-current="page" href="/animingle/user/join.do"
                >회원가입</a>
            </c:if>
            <c:if test="${not empty id && isAdmin != 'Y'}">
              <a class="nav-link text-dark" aria-current="page" href="/animingle/user/profile.do"
                >마이페이지</a>
            </li>
            <li class="nav-item">
              <a class="nav-link text-dark" aria-current="page" href="/animingle/board/inquiry.do"
                >고객센터</a
              >
            </li>
            </c:if>
            <c:if test="${not empty id && isAdmin == 'Y'}">
              <a class="nav-link text-dark" aria-current="page" href="/animingle/user/admin.do">
                관리 센터</a>
            </li>
           
            </c:if>
          </ul>
        </div>
      </div>
    </nav>
    <nav class="sub-navbar text-center">
      <div>
        <ul>
          <li>
            <a href="/animingle/board/petsitter.do">펫시터</a>
          </li>
          <li>
          	<a href="/animingle/board/adoptionlist.do">당신을 기다려요</a>
          </li>
          <li>
          	<a href="/animingle/board/findlist.do">우리 가족을 찾아주세요</a>
          </li>
          <li>
          	<div class="comunity-wrapper">
			  <a class="comunity" href="/animingle/board/communitylist.do">커뮤니티</a>
			  <div class="comunity-submenu">
			    <div><a href="/animingle/board/walktogetherlist.do">산책 친구 구해요</a></div>
			    <div><a href="/animingle/board/waglelist.do">와글와글</a></div>
			    <div><a href="/animingle/board/vetqnalist.do">수의사 QnA</a></div>
			  </div>
			</div>
          </li>
          <li>
          	<a href="/animingle/board/medicalview.do">병원/약국찾기</a>
          </li>
        </ul>
      </div>
    </nav>