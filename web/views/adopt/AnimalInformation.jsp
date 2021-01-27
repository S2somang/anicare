<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보호동물정보</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/adopt/AnimalInformation.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>

	<div class="wrap">
		<jsp:include page="/views/common/header.jsp" />
		
		<!-- contents 시작 -->
		<section class="contents">
			<!-- 첫번째 -->
			<article class="AniInfo mt70">
				<h3 class="contH3">
					보호동물 정보 <span class="boderBot">
				</h3>
				<span>
					<a href="${pageContext.request.contextPath }/views/adopt/adoptApplication.jsp">입양</a> &gt;  
					<a href="${pageContext.request.contextPath }/views/adopt/AnimalInformation.jsp">보호동물정보</a>&gt; 
					<a href="#">봉봉이</a></span>
				<p class="bar">
					</span>
				</p>

				<ul class="AniPhoto">
					<li>
						<ul class="Animal_datail_silder">
							<!-- 사진 큰거 -->
							<li><a href="#"><img src="${pageContext.request.contextPath }/resources/images/common/dog/siba1.jpg" alt="BigDog" /></a></li>
						</ul>
					</li>
					<li>
						<!--사진 작은 것-->
						<ul class="Animal_slider_pager">
							<li><a href="#"><img src="${pageContext.request.contextPath }/resources/images/common/dog/siba2.jpg" alt="smallDog"></a></li>
							<li><a href="#"><img src="${pageContext.request.contextPath }/resources/images/common/dog/siba3.jpg" alt="smallDog"></a></li>
							<li><a href="#"><img src="${pageContext.request.contextPath }/resources/images/common/dog/siba4.jpg" alt="smallDog"></a></li>
							<li class="mRight"><a href="#"><img
									src="${pageContext.request.contextPath }/resources/images/common/dog/siba5.jpg" alt="smallDog"></a></li>
						</ul>
					</li>
				</ul>

				<ul class="info">

					<li class="infoTop"><h4>시바</h4>
						<span>D24</span></li>
					<li class="infoTop">
						<p>품종</p> <span>시바견</span>
					</li>
					<li class="infoTop">
						<p>성별</p> <span>수컷</span>
					</li>
					<li class="infoTop">
						<p>추정나이</p> <span>3살</span>
					</li>
					<li class="infoTop">
						<p>몸무게</p> <span>10kg</span>
					</li>
					<li class="infoTop">
						<p>중성화</p> <span>O</span>
					</li>
					<li class="infoTop">
						<p>배변훈련</p> <span>O</span>
					</li>
					<li class="infoTop">
						<p>특이사항</p> <span>온순함</span>
					</li>
					<li class="button">
						<button><a  href="${pageContext.request.contextPath }/views/adopt/adoptApplication.jsp"> 입양하기</a></button>
						<button><a  href="${pageContext.request.contextPath }/views/support/supportOneOnOne.jsp">1:1 결연</a></button>
					</li>
				</ul>

				<p class="bar"></p>

			</article>
			<!--//첫번째-->

			<!-- 두번째 -->
			<article class="AniCon mt70">
				<div>
					<img src="${pageContext.request.contextPath }/resources/images/common/dog/siba5.jpg" alt="">
					<p>
						시바의<br>가족을<br>찾습니다.
					</p>
					<span> 달리기를 좋아하는 시바의<br> 모습을 매일 확인하세요!
					</span>
				</div>

				<ul class="conDetaile">
					<li class="leftCDetaile">
						<h5 id="meet">1.시바가 우리에게 오던날</h5> <img src="${pageContext.request.contextPath }/resources/images/common/dog/siba6.jpg"
						alt="">
						<p>어느 동물 보호소에서 보호 받고 있던 봉봉이는 며칠 째 굶어 있는 모습이었습니다. 보호소에서는 재정 상황이
							악화로 인해 점점 많은 아이들이 굶기 시작했습니다. 그리고 보호소에서는 많은 아이들을 안락사 하기 시작했습니다.

							봉봉이와 친구들이 보호소에서 안락사되기 3일 전, 저희는 이 아이들을 구하기 위해 큰 결단을 하였습니다. 보호소에
							안락사 직전인 아이들을 보호소에 입양을 하고 데려오기로 했습니다. 그 슬픈 봉봉이의 눈에서눈물을 보았을 때 저희는
							정말 잘한 일이라 생각했습니다.</p> <br>
						<h5 id="friend">2. 봉봉이와 친해지기</h5>
						<p>어느 동물 보호소에서 보호 받고 있던 봉봉이는 며칠 째 굶어 있는 모습이었습니다. 보호소에서는 재정 상황이
							악화로 인해 점점 많은 아이들이 굶기 시작했습니다. 그리고 보호소에서는 많은 아이들을 안락사 하기 시작했습니다.

							봉봉이와 친구들이 보호소에서 안락사되기 3일 전, 저희는 이 아이들을 구하기 위해 큰 결단을 하였습니다. 보호소에
							안락사 직전인 아이들을 보호소에 입양을 하고 데려오기로 했습니다. 그 슬픈 봉봉이의 눈에서눈물을 보았을 때 저희는
							정말 잘한 일이라 생각했습니다.</p> <br>
							<h5 id="stay">3. 봉봉이와 친해지기</h5>
							<p>어느 동물 보호소에서 보호 받고 있던 봉봉이는 며칠 째 굶어 있는 모습이었습니다. 보호소에서는 재정 상황이
								악화로 인해 점점 많은 아이들이 굶기 시작했습니다. 그리고 보호소에서는 많은 아이들을 안락사 하기 시작했습니다.
	
								봉봉이와 친구들이 보호소에서 안락사되기 3일 전, 저희는 이 아이들을 구하기 위해 큰 결단을 하였습니다. 보호소에
								안락사 직전인 아이들을 보호소에 입양을 하고 데려오기로 했습니다. 그 슬픈 봉봉이의 눈에서눈물을 보았을 때 저희는
								정말 잘한 일이라 생각했습니다.</p> <br>
								<h5 id="adopt">4. 봉봉이와 친해지기</h5>
						<p>어느 동물 보호소에서 보호 받고 있던 봉봉이는 며칠 째 굶어 있는 모습이었습니다. 보호소에서는 재정 상황이
							악화로 인해 점점 많은 아이들이 굶기 시작했습니다. 그리고 보호소에서는 많은 아이들을 안락사 하기 시작했습니다.

							봉봉이와 친구들이 보호소에서 안락사되기 3일 전, 저희는 이 아이들을 구하기 위해 큰 결단을 하였습니다. 보호소에
							안락사 직전인 아이들을 보호소에 입양을 하고 데려오기로 했습니다. 그 슬픈 봉봉이의 눈에서눈물을 보았을 때 저희는
							정말 잘한 일이라 생각했습니다.</p> <br>
					</li>
					<li class="rightCDetaile">
						<ul>
							<li ><a href="#meet" class="meet">1. 만나게된 날</a></li>
							<li><a href="#friend" class="friend">2. 친해지기</a></li>
							<li><a href="#stay" class="stay">3. 입양자님이 생겼어요!</a></li>
							<li><a href="#adopt" class="adopt">4. 슬프지만 기쁜 이별 </a></li>
						</ul>
					</li>
				</ul>
			</article>
			<!--//두번째 -->

			<!-- 세번째 댓글 -->
			<article class="comment mt70">
				<h4>댓글목록</h4>
				<p class="bar"></p>
				<ul>
					<li class="commentCon"><span>작성자</span><span>작성일</span>
						<p>댓글 어케하냐~어케들하겠지~~~몰라~~~</p></li>

				</ul>
				<div class="comWrite">
					<h4>댓글쓰기</h4>
					<p class="bar"></p>
					<h4 class="textArea">내용</h4>
					<textarea cols="3" rows="80" id=""></textarea>
					<p class="bar"></p>
					<button class="commentButton">댓글등록
		</section>
	</div>
	</article>
	<!--//세번째-->

	<jsp:include page="/views/common/footer.jsp" />
	
	</div>

	<script>
		$(function() {
			$(".Animal_slider_pager").click(function() {

			})
			var imgSrc = $(".Animal_datail_silder").src();
			console.log(imgSrc);
		});

		jQuery(document).ready(function($) {

$(".meet").click(function(event){            
		event.preventDefault();
		$('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
});
});
jQuery(document).ready(function($) {

$(".friend").click(function(event){            
		event.preventDefault();
		$('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
});
});
jQuery(document).ready(function($) {

$(".stay").click(function(event){            
		event.preventDefault();
		$('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
});
});
jQuery(document).ready(function($) {

$(".adopt").click(function(event){            
		event.preventDefault();
		$('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
});
});
	</script>





</body>
</html>