<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" scope="application" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ANICARE</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- CSS style-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/header.css">

<!-- 웹 폰트 -->
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

<!-- 슬릭 -->
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

</head>
<body>

	<ul class="login">
		<c:choose>
				<c:when test="${ !empty sessionScope.loginUser and sessionScope.loginUser.userId.equals('admin') }">
			<li><a
			href="${pageContext.request.contextPath }/views/admin/adminMain.jsp"
			>관리자페이지</a></li>	
		<li><a onclick="logOut();">로그아웃</a></li>
		</c:when>
		<c:when test="${  sessionScope.loginUser !=null }">
			<label><c:out value="${ sessionScope.loginUser.name }" />님의
				방문을 환영합니다.</label>
			<li><a
				href="${ applicationScope.contextPath }/MyPageResource">마이페이지</a></li>
			<li><a onclick="logOut();">로그아웃</a></li>
		</c:when>
		<c:when test="${ sesstionScope.loginUser ==null }">
			<li><a
				href="${pageContext.request.contextPath }/views/member/memberLoginForm.jsp">로그인</a></li>
			<li><a
				href="${pageContext.request.contextPath }/views/member/memberJoinForm.jsp">회원가입</a></li>
		</c:when>

		</c:choose>
	</ul>

	<header>
		<h1 class="logo">
			<a href="${pageContext.request.contextPath }"><img
				src="${pageContext.request.contextPath }/resources/images/common/header/logo-02.png"
				alt="logo"><span class="ir_su">anicare_logo</span></a>
		</h1>
		<nav>
			<ul>
				<li><a
					href="${pageContext.request.contextPath }/views/introduction/introductionMain.jsp">소개</a></li>
				<li><a
					href="${pageContext.request.contextPath }/views/board/participationList.jsp">참여</a></li>
				<li><a href="#">TV</a></li>
				<li><a href="${pageContext.request.contextPath }/views/support/supportMain.jsp">후원</a></li>
				<li><a href="${pageContext.request.contextPath }/views/adopt/adoptMain.jsp">입양</a></li>
				<li><a
					href="${pageContext.request.contextPath }/selectEvent.ed">교육</a></li>
			</ul>
		</nav>
	</header>
	<div class="side">
		<ul class="side_menu">
			<li><a href="#">후원</a></li>
			<li><a href="#">TV</a></li>
			<li><a href="javascript:void(0);" onclick="adopt();">입양</a></li>
			<li><a
				href="${pageContext.request.contextPath }/selectEvent.ed">교육</a></li>
		</ul>
	</div>

	<!-- 추가 0907 -->
	<script>
		$(function() {
			$(".side").hide(); //워여
			$(window).on("scroll", function() {
				var scroll = $(this).scrollTop();
				//console.log(scroll); 
				/* 스크롤 -> 471px */
				if ($(this).scrollTop() >= 200) {
					$(".side").show();
				} else {
					$(".side").hide();
				}
			});
		});
		   
		function logOut() {
			location.href = "${ applicationScope.contextPath }/logOut.me"
			
		}
		
		function adopt() {
			location.href = "${ pageContext.request.contextPath }/selectAdopt.ad";
		}
		
	</script>
	<!--// 추가 0907 -->
</body>