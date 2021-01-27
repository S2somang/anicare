<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/support/support.css">
</head>
<body>
	<div id="wrap">
		<jsp:include page="/views/common/header.jsp" />
		<!-- 온라인 후원 title-->
		<div class="title">
			<ul class="banner">
				<li><a href="#"> <img src="${pageContext.request.contextPath }/resources/images/support/supportBanner01.png"
						alt="sopport">
				</a></li>
			</ul>

			<ul class="titlePager">
				<li class="borderLeft"><a href="#">정기후원</a></li>
				<li><a href="${pageContext.request.contextPath }/views/support/supportGoods.jsp">일시후원</a></li>
				<li><a href="${pageContext.request.contextPath }/ViewsSupportList.sp">1:1후원</a></li>
				<li><a href="${pageContext.request.contextPath }/views/support/supportGoods.jsp">물품후원</a></li>
				<li><a href="${pageContext.request.contextPath }/views/support/supportNews.jsp">후원소식</a></li>
			</ul>
		</div>
		<!--// 온라인 후원 title -->

		<!-- contents 시작 -->
		<section class="contents">
			<!-- 첫번째 -->
			<article class="mySupport mt70">
				<h3 class="contH3">후원중인 아이들</h3>
				<p>
					후원하고 있는 아이들의 오늘의 영상입니다.<br>오늘은 아이들이 무얼 하고 놀고 있는지 볼까요 ?
				</p>
				<ul class="conUl mt40">
					<li><iframe width="416" height="234"
							src="https://www.youtube.com/embed/zGwhWSa6U_k" frameborder="0"
							allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe> <!-- <img src="" alt="동영상이 아닌경우 개 이미지"> -->
						<span class="hoo_icon">후원중</span>
						<p>홍길동</p> <span class="hoo_con">오늘은 산책ㅇ웅응앵ㅇ ㅇㅇ오늘은 산책ㅇ웅응앵ㅇ
							ㅇㅇ오늘은 산책ㅇ웅응앵ㅇ ㅇㅇ오늘은 산책ㅇ웅응앵ㅇ ㅇㅇ</span></li>
					<li><iframe width="416" height="234"
							src="https://www.youtube.com/embed/kXSz8ZMNkkQ" frameborder="0"
							allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe> <span class="hoo_icon">후원중</span>
						<p>홍길동</p> <span class="hoo_con">오늘은 산책ㅇ웅응앵ㅇ ㅇㅇ오늘은 산책ㅇ웅응앵ㅇ
							ㅇㅇ오늘은 산책ㅇ웅응앵ㅇ ㅇㅇ오늘은 산책ㅇ웅응앵ㅇ ㅇㅇ</span></li>
					<li><iframe width="416" height="234"
							src="https://www.youtube.com/embed/xVz_9UGB8ro" frameborder="0"
							allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe> <span class="hoo_icon">후원중</span>
						<p>홍길동</p> <span class="hoo_con">오늘은 산책ㅇ웅응앵ㅇ ㅇㅇ오늘은 산책ㅇ웅응앵ㅇ
							ㅇㅇ오늘은 산책ㅇ웅응앵ㅇ ㅇㅇ오늘은 산책ㅇ웅응앵ㅇ ㅇㅇ</span></li>

				</ul>


			</article>
			<!--// 첫번째 끝  -->

			<!-- 두번째 -->
			<article class="needSupport mt70">
				<h3 class="contH3">후원이 필요한 아이들</h3>
				<p>오늘도 후원자님 덕분에 밝게 뛰어놀 수 있는 아이들...</p>
				<ul class="conUl mt40">
					<li class="w65"><iframe width="100%" height="515"
							src="https://www.youtube.com/embed/zGwhWSa6U_k" frameborder="0"
							allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe> <!-- <img src="" alt="동영상이 아닌경우 개 이미지"> -->
						<span class="today_icon">TODAY</span></li>
					<li class="w35"><img
						src="${pageContext.request.contextPath }/resources/images/common/dog/dog17.png"
						alt="dog"></li>
					<li class="w35"><img
						src="${pageContext.request.contextPath }/resources/images/common/dog/dog19.png"
						alt="dog"></li>

				</ul>


			</article>
			<!--// 두번째 끝  -->

			<!-- 세번째 -->
			<article class="supportGuide mt70">
				<h3 class="contH3">후원안내</h3>

				<ul class="spGuideUl mt40">
					<li class="w30">
						<p>정기후원</p> <span class="hoo_con">애니케어가 안정적으로 활동할 수 있도록<br>
							매달 보내주시는 정기 후원입니다.
					</span> <a href="#">정기후원 신청 > </a>
					</li>
					<li class="w30">
						<p>일시후원</p> <span class="hoo_con">신용카드, 핸드폰, 계좌이체를 통하여<br>
							후원금을 납부하시는 일시후원 방법입니다.
					</span> <a href="#">일시후원 신청 > </a>
					</li>
					<li class="w30 bRight">
						<p>후원금 증액</p> <span class="hoo_con">조금더 여유를 내어주실 수 있다면,<br>
							지금 회원님의 후원금을 증액해 주세요.
					</span> <a href="#">후원금 증액 > </a>
					</li>
					<li class="w50 sgLeft">
						<p>1:1 후원</p> <span class="hoo_con">1:1 결연을 통해 내 자시거럼 후원할 수
							있는 방법입니다. </span> <a href="#">1:1후원 신청 > </a>
					</li>
					<li class="w50 sgLeft bRight">
						<p>물품후원</p> <span class="hoo_con">물품을 통해 후원하는 방법입니다. </span> <a
						href="#">물품후원 신청 > </a>
					</li>

				</ul>
			</article>
			<!--// 세번째 끝  -->

			<!-- 네번째 -->
			<article class="Account mt70">
				<h3 class="contH3">후원계좌</h3>
				<h4 class="mt30">국민은행 888888-01-000000( 예금주 : 애니케어 )</h4>
				<p class="mt30">
					· 개인은 연급여의 30% 이내에 해당하는 기부금액은 전액 소득공제를 받으실 수 있습니다.<br> ·
					법인(기업)의 기부금은 법인세금 제 24조 규정에 의해 손금을 인정 받을 수 있습니다.<br> · 후원금 사용
					내역은 매달 초 후원금내역 게시판에 공직됩니다.
				</p>
			</article>
			<!--// 네번째 끝  -->

		</section>
		<!-- // contents  -->

		<jsp:include page="/views/common/footer.jsp" />
	</div>

</body>
</html>