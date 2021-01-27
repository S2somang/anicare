<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보호동물정보</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/support/AnimalInformation.css">
</head>
<body>

	<div class="wrap">
		<jsp:include page="/views/common/header.jsp" />
		
		<!-- contents 시작 -->
		<section class="contents">
			<!--  추후 여부 결정
			<div>
				<p>예방접종 완료</p>
				<p>배변훈련 YES</p>
			</div> 
			-->
			<!-- 첫번째 -->
			<article class="AniInfo mt70">
				<h3 class="contH3">
					보호동물 정보 <span class="boderBot">
				</h3>
				<span>
					<a href="${pageContext.request.contextPath }/views/support/supportMain.jsp">후원</a> &gt; 
					<a href="${pageContext.request.contextPath }/views/support/supportOneOnOne.jsp">1:1결연</a> &gt; 
					<a href="${pageContext.request.contextPath }/views/support/AnimalInformation.jsp">보호동물정보</a>&gt; 
					<a href="#"><c:out value ="${requestScope.SuDog.name}"/></a></span>
				<p class="bar">
					</span>
				</p>

				<ul class="AniPhoto">
					<li>
						<ul class="Animal_datail_silder">
							<!-- 사진 큰거 -->
							<li><a href="#"><img
									src="${pageContext.request.contextPath}/resources/uploadFiles/supportOneUploadFiles/<c:out value ='${requestScope.suattachment[0].changeName }'/>"
									alt="BigDog" /></a></li>
						</ul>
					</li>
					<li>
						<!--사진 작은 것-->
						<ul class="Animal_slider_pager">
							<li><a href="#"><img
									src="${pageContext.request.contextPath}/resources/uploadFiles/supportOneUploadFiles/<c:out value ='${requestScope.suattachment[1].changeName }'/>"
									alt="smallDog"></a></li>
							<li><a href="#"><img
									src="${pageContext.request.contextPath}/resources/uploadFiles/supportOneUploadFiles/<c:out value ='${requestScope.suattachment[2].changeName }'/>"
									alt="smallDog"></a></li>
							<li><a href="#"><img
									src="${pageContext.request.contextPath}/resources/uploadFiles/supportOneUploadFiles/<c:out value ='${requestScope.suattachment[3].changeName }'/>"
									alt="smallDog"></a></li>
							<li class="mRight"><a href="#"><img
									src="${pageContext.request.contextPath}/resources/uploadFiles/supportOneUploadFiles/<c:out value ='${requestScope.suattachment[4].changeName }'/>"
									alt="smallDog"></a></li>
						</ul>
					</li>
				</ul>

				<ul class="info">

					<li class="infoTop"><h4>${requestScope.sudog.name}</h4> <span>${requestScope.sudog.dcode}</span></li>
					<li class="infoTop">
						<p>품종</p> <span>${requestScope.sudog.breed}</span>
					</li>
					<li class="infoTop">
						<p>성별</p> <span> <c:if
								test="${requestScope.sudog.gender.equals('M')}">
							남자
						</c:if> <c:if test="${!requestScope.sudog.gender.equals('M')}">
							여자
						</c:if>
					</span>
					</li>
					<li class="infoTop">
						<p>추정나이</p> <span>${requestScope.sudog.age }</span>
					</li>
					<li class="infoTop">
						<p>몸무게</p> <span>${requestScope.sudog.weight } kg</span>
					</li>
					<li class="infoTop">
						<p>중성화</p> <span> <c:if
								test="${requestScope.sudog.fixing.equals('Y')}">
						 	완료
						</c:if> <c:if test="${!requestScope.sudog.fixing.equals('Y')}">
							미완료
						</c:if>
					</span>
					</li>
					<li class="infoTop">
						<p>배변훈련</p> <span> <c:if
								test="${requestScope.sudog.potty.equals('Y') }">
							완료
						</c:if> <c:if test="${!requestScope.sudog.potty.equals('Y') }">
							미완료
						</c:if>
					</span>
					</li>
					<li class="infoTop">
						<p>특이사항</p> <span> </span>
					</li>
					<!-- border -->

					<!-- 정보 변경
					 <li class="infoBottom infoBar">
						<h5>친화력</h5> 이미지로 ㄱ <span><img src="" /></span>
					</li>
					<li class="infoBottom">
						<h5>성격</h5> 이미지로 ㄱ <span>얌전/보통/활발/매우활발</span> <span><img
							src="" /></span>
					</li> 
					-->
					<li class="button">
						<button>입양하기</button>
						<button>1:1 결연</button>
					</li>
				</ul>

				<p class="bar"></p>

			</article>
			<!--//첫번째-->

			<!-- 두번째 -->
			<article class="AniCon mt70">
				<div>
					<img
						src="${pageContext.request.contextPath}/resources/uploadFiles/supportOneUploadFiles/<c:out value ='${requestScope.suattachment[5].changeName }'/>"alt="">
					<p>
						${requestScope.sudog.name}의<br>가족을<br>찾습니다.
					</p>
					<span> ${requestScope.sudog.name}의<br> 모습을 매일 확인하세요!
					</span>
				</div>

				<ul class="conDetaile">
					<li class="leftCDetaile">
						<!-- con1의 값이 있으면 전체가 보이게!내용이 없으면 h5도 보일필요없움!  -->
						<c:set var ="content" value ="${fn:split(requestScope.suboard.content,'-$') }"/>

						<%-- <c:if test="${!empty fn:split(value, 'separator')[0]>"/> --%>
							<c:if test ="${!empty content[0]}">
								<h5 id="meet">1.${requestScope.sudog.name}가 우리에게 오던날</h5>
								<p class="title1"><c:out value ="${content[0]}"/></p> 
								<br>
							</c:if>
							
						    <!-- con2의 값이 있으면 전체가 보이게!내용이 없으면 h5도 보일필요없움!  -->
						    <c:if test ="${!empty content[1]}">
								<h5 id="friend">2.${requestScope.sudog.name}와 친해지기</h5> <c:if
									test="${requestScope.suattachment[6] != null }">
									<img src="${pageContext.request.contextPath}/resources/uploadFiles/supportOneUploadFiles/
										<c:out value ='${requestScope.suattachment[6].changeName }'/>" alt="dog">
								</c:if> <c:if test="${requestScope.suattachment[7] != null }">
									<img
										src="${pageContext.request.contextPath}/resources/uploadFiles/supportOneUploadFiles/<c:out value ='${requestScope.suattachment[7].changeName }'/>"
										alt="dog">
								</c:if>
								
								<p class="title2"><c:out value ="${content[1]}"/></p>
								 <!--   -->
							 </c:if>
							 
							<c:if test ="${!empty content[2] }">
								<h5 id="">3.후원자님이 생겼어요!</h5>
								<p class="title3"><c:out value ="${content[2]}"/></p>
							</c:if>
							
							<c:if test ="${!empty content[3] }">
								<h5 id="">4.슬프지만 기쁜 이별</h5>
								<p class="title4"><c:out value ="${content[3]}"/></p>
							</c:if>

					</li>
					<li class="rightCDetaile">
						<ul>
							<li><a href="meet">1. 만나게된 날</a></li>
							<li><a href="friend">2. 친해지기</a></li>
							<li><a href="support">3. 후원자님이 생겼어요!</a></li>
							<li><a href="#">4. 슬프지만 기쁜 이별 </a></li>
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
		/* $(function() {
			$(".Animal_slider_pager").click(function() {

			})
			var imgSrc = $(".Animal_datail_silder").src();
			console.log(imgSrc);
		}); */
	</script>





</body>
</html>