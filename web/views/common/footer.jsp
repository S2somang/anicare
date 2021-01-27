<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/footer.css">
</head>
<body>
	<footer>
		<div>
			<h1 class="logo">
				<a href="#"><img
					src="${pageContext.request.contextPath }/resources/images/common/header/logo-w01.png" alt="logo"><span
					class="ir_su">anicare_logo</span></a>
			</h1>
			<div class="footerMenu">
				<ul>
					<li><a href="#">이용약관</a></li>
					<li><a href="#">개인정보보호정책</a></li>
					<li><a href="#">오시는길</a></li>
					<li><a href="#">문의처 바로가기</a></li>
					<li><a href="#">동물보호관리</a></li>
				</ul>
				<p>주소 | 서울특별시 강남구 테헤란로 14길 6 / anicare@anicare.or.kr
					02-6254-9970 / 212-38-7829 소형 / 제2 근린 생활시설</p>
				<p>
					<b>copyright</b>ⓒ 2020 aniCare, all rights reserved
				</p>
			</div>
			<ul class="footer_sns">
				<li><a href="#"><img
						src="${pageContext.request.contextPath }/resources/images/common/header/misc_instagram_w.png" /></a></li>
				<li><a href="#"><img
						src="${pageContext.request.contextPath }/resources/images/common/header/misc_facebook_w.png" /></a></li>
				<li><a href="#"><img
						src="${pageContext.request.contextPath }/resources/images/common/header/misc_twitter_w.png" /></a></li>
				<li><a href="#"><img
						src="${pageContext.request.contextPath }/resources/images/common/header/misc_youtube_w.png" /></a></li>
			</ul>

		</div>
	</footer>
</body>
</html>