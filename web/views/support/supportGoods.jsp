<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/support/supportGoods.css">
</head>
<body>

	<div id="wrap">
		<jsp:include page="/views/common/header.jsp" />

		<!-- contents 시작 -->
		<section class="contents">
			<!-- 첫번째 -->
			<article class="SupportGood mt70">
				<h3 class="contH3">
					물품후원 <span class="boderBot">
				</h3>
				<span> <a
					href="${pageContext.request.contextPath }/views/support/supportMain.jsp">후원</a>
					&gt; <a
					href="${pageContext.request.contextPath }/views/support/supportGoods.jsp">물품후원</a>
				</span>
				<p class="bar">
					</span>
				</p>
				<p class="con">
					보호소의 아이들을 위한 물품후원은 아이들에게 큰 힘이 됩니다. <br> 물품후원이 필요한 보호소를 확인하시고
					보내주신 소중한 물품 발송내역을 확인 하실 수 있습니다.<br> 자세한 내용은 하단 게시글의 내용을 보시고
					참여해주세요!
				</p>

				<!-- 후원 소식 보기 사진내용담기는 곳-->
				<ul>
					<!-- 일단 ...두개 만들어서 붙여놔보고 -->
					<li><a href="#">
							<div>
								<img src="${pageContext.request.contextPath }/resources/images/support/goodsSup01.png" alt="후원소식이미지">
							</div>
							<div>
								<h4>[9월 후원물품]길동님 엄마께서 후원해 주셨습니다.</h4>
								<span class="spanCon">반려견 입양 기념으로 길동이 엄마께서 후원해주셨습니다.</span>
								<p>
									<span class="spanColor">작성자</span><span class="spanColor">2020-08-08</span><span>조회수</span><span
										class="spanColor">20</span>
								</p>
							</div>
					</a></li>

					<li class="mRightNone"><a href="#">
							<div>
								<img src="${pageContext.request.contextPath }/resources/images/support/goodsSup02.png" alt="후원소식이미지">
							</div>
							<div>
								<h4>[8월 후원물품]익명의 후원자분께서 후원해 주셨습니다.</h4>
								<span class="spanCon">반려견 입양 기념으로 길동이 엄마께서 후원해주셨습니다. </span>
								<p>
									<span class="spanColor">작성자</span><span class="spanColor">2020-08-08</span><span>조회수</span><span
										class="spanColor">20</span>
								</p>
							</div>
					</a></li>
					<!--// 1  -->

					<!-- 2-->
					<li><a href="#">
							<div>
								<img src="${pageContext.request.contextPath }/resources/images/support/goodsSup03.png" alt="후원소식이미지">
							</div>
							<div>
								<h4>[7월 후원물품]댕댕이 엄마께서 후원해 주셨습니다.</h4>
								<span class="spanCon">반려견 입양 기념으로 길동이 엄마께서 후원해주셨습니다.</span>
								<p>
									<span class="spanColor">작성자</span><span class="spanColor">2020-08-08</span><span>조회수</span><span
										class="spanColor">20</span>
								</p>
							</div>
					</a></li>

					<li class="mRightNone"><a href="#">
							<div>
								<img src="${pageContext.request.contextPath }/resources/images/support/goodsSup03.png" alt="후원소식이미지">
							</div>
							<div>
								<h4>[7월 후원물품]소망이 엄마께서 후원해 주셨습니다.</h4>
								<span class="spanCon">반려견 입양 기념으로 길동이 엄마께서 후원해주셨습니다. </span>
								<p>
									<span class="spanColor">작성자</span><span class="spanColor">2020-08-08</span><span>조회수</span><span
										class="spanColor">20</span>
								</p>
							</div>
					</a></li>
					<!--// 2 -->
					<!-- 3 -->
					<li><a href="#">
							<div>
								<img src="${pageContext.request.contextPath }/resources/images/support/goodsSup04.png" alt="후원소식이미지">
							</div>
							<div>
								<h4>[7월 후원물품]소망이 엄마께서 후원해 주셨습니다.</h4>
								<span class="spanCon">반려견 입양 기념으로 길동이 엄마께서 후원해주셨습니다.</span>
								<p>
									<span class="spanColor">작성자</span><span class="spanColor">2020-08-08</span><span>조회수</span><span
										class="spanColor">20</span>
								</p>
							</div>
					</a></li>

					<li class="mRightNone"><a href="#">
							<div>
								<img src="${pageContext.request.contextPath }/resources/images/support/dog4.jpg" alt="후원소식이미지">
							</div>
							<div>
								<h4>[7월 후원물품]소망이 엄마께서 후원해 주셨습니다.</h4>
								<span class="spanCon">반려견 입양 기념으로 길동이 엄마께서 후원해주셨습니다. </span>
								<p>
									<span class="spanColor">작성자</span><span class="spanColor">2020-08-08</span><span>조회수</span><span
										class="spanColor">20</span>
								</p>
							</div>
					</a></li>
					<!--// 3-->
					<!-- 4 -->
					<li><a href="#">
							<div>
								<img src="${pageContext.request.contextPath }/resources/images/support/dog3.jpg" alt="후원소식이미지">
							</div>
							<div>
								<h4>[7월 후원물품]소망이 엄마께서 후원해 주셨습니다.</h4>
								<span class="spanCon">반려견 입양 기념으로 길동이 엄마께서 후원해주셨습니다.</span>
								<p>
									<span class="spanColor">작성자</span><span class="spanColor">2020-08-08</span><span>조회수</span><span
										class="spanColor">20</span>
								</p>
							</div>
					</a></li>

					<li class="mRightNone"><a href="#">
							<div>
								<img src="${pageContext.request.contextPath }/resources/images/support/dog4.jpg" alt="후원소식이미지" width="100px">
							</div>
							<div>
								<h4>[7월 후원물품]소망이 엄마께서 후원해 주셨습니다.</h4>
								<span class="spanCon">반려견 입양 기념으로 길동이 엄마께서 후원해주셨습니다. </span>
								<p>
									<span class="spanColor">작성자</span><span class="spanColor">2020-08-08</span><span>조회수</span><span
										class="spanColor">20</span>
								</p>
							</div>
					</a></li>
					<!--// 4-->
				</ul>

				<ul class="pager">
					<li><<</li>
					<li>1</li>
					<li>2</li>
					<li>3</li>
					<li>4</li>
					<li>5</li>
					<li>>></li>
				</ul>

			</article>


		</section>


		<jsp:include page="/views/common/footer.jsp" />
	</div>

</body>
</html>