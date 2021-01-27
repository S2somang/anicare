<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/admin/support/OneOnOneDetail.css">
<title>Insert title here</title>
</head>
<body>
	<%-- detail --%>
	<div id="wrap">
		<jsp:include page="../common/adminMenuBar.jsp" />
		<section class="contents">
			<div class="conWrap">
			<!-- 첫번째 -->
			<article class="AniInfo mt70">
				<h3 class="contH3">
					보호동물 정보 <span class="boderBot"></span>
				</h3>
				<span> <a
					href="${pageContext.request.contextPath }views/admin/support/adminSupportOneOnOne.jsp">1:1결연</a>
					
				</span>
				<p class="bar"></p>

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

			<!-- 세번째  -->
			<article class="comment mt70">
				
				<button class="sujong" onclick="location.href='${pageContext.request.contextPath }/reInsert.sp?num=<c:out value="${requestScope.suboard.stCode}"/>'">수정하기</button>
				
				<button class="sujong" onclick ="location.href='${pageContext.request.contextPath }/deleteOne.sp?num=<c:out value="${requestScope.suboard.stCode}"/>'">삭제하기</button>

			</article>

		</div>
		</section>
	</div>


	<script>
		$(function() {

			/* var str = "${requestScope.suboard.content}";
			console.log(str);
			console.log(typeof (str));
			var con = str.split("-$");
			console.log(con);

			var con1 = con[0];
			var con2 = con[1];
			var con3 = con[2];
			var con4 = con[3]; */

			/* $(".title1").append(con1);
			$(".title2").append(con2);
			$(".title3").append(con3);

			$(".title4").append(con4); */

		});
	</script>



</body>
</html>