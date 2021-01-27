<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입양 상세정보</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/adopt/adoptInformation.css">
</head>
<body>

	<div class="wrap">
		<jsp:include page="/views/common/header.jsp" />
		
		<!-- contents 시작 -->
		<section class="contents">
			
			<!-- 첫번째 -->
			<article class="AniInfo mt70">
				<h3 class="contH3">
					입양진행 정보 <span class="boderBot">
				</h3>
				<span>
					<a href="${pageContext.request.contextPath }/views/adopt/adoptApplication.jsp">입양</a> &gt; 
					<a href="${pageContext.request.contextPath }/views/adopt/adoptDetail.jsp">입양동물정보</a>&gt; 
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
						<button><a id="anchor" href="${pageContext.request.contextPath }/index.jsp">메인</a></button>
						<button><a id="anchor"
						href="${pageContext.request.contextPath }/views/adopt/dogDetail.jsp">강아지정보</a></button>
					</li>
				</ul>

				<p class="bar"></p>

			</article>
			<!--//첫번째-->

			<!-- 두번째 -->
			<article class="Check mt70">
				<h4 class="mt30">STEP 1</h4>
				<p class="mt30" id="scroll">
					입양 신청일 : 2020/09/21<br>
					입양자 : 국윤창<br>
					입양견 : 시바
					
				</p>
			  </article>
			<!--//두번째 -->

			<!-- 세번째 댓글 -->
         <article class ="dogList mt70">
            <ul class="dogListUl">
                <!--1번째 줄-->

                <li class="w25 dogListLi">
                <a href="${pageContext.request.contextPath }/views/adopt/adoptDetail.jsp">
                        <ul>   
                            <div id="head">STEP1.신청</div>
                            <li class="dListInfo">
                                
                                <p>날짜 글자가운데 정리</p>
                                <p>2020/01/01</p>
                                <p>진행중</p>
                            </li>
                            <p>자세히보기 GO > </p>
                        </ul>
                    </a>
                </li>
                <li class="w25 dogListLi">
                    <a href="${pageContext.request.contextPath }/views/adopt/adoptDetail.jsp">
                        <ul>   
                            <div id="head">STEP2.서류 심사</div>
                            <li class="dListInfo">
                                
                                <p>날짜</p>
                                <p>2020/01/01</p>
                                <p>진행중</p>
                            </li>
                            <p>자세히보기 GO > </p>
                        </ul>
                    </a>
                </li>
                <li class="w25 dogListLi">
                    <a href="${pageContext.request.contextPath }/views/adopt/adoptDetail.jsp">
                        <ul>   
                            <div id="head">STEP3.전화 상담</div>
                            <li class="dListInfo">
                                
                                <p>날짜</p>
                                <p>2020/01/01</p>
                                <p>진행중</p>
                            </li>
                            <p>자세히보기 GO > </p>
                        </ul>
                    </a>
                </li>
                <li class="w25 dogListLi mRight">
                    <a href="${pageContext.request.contextPath }/views/adopt/adoptDetail.jsp">
                        <ul>   
                            <div id="head">STEP4.보호소 방문</div>
                            <li class="dListInfo">
                                
                                <p>날짜</p>
                                <p>2020/01/01</p>
                                <p>진행중</p>
                            </li>
                            <p>자세히보기 GO > </p>
                        </ul>
                    </a>
                </li>
                <!-- 2번째줄-->

                <li class="w25 dogListLi">
                    <a href="${pageContext.request.contextPath }/views/adopt/adoptDetail.jsp">
                        <ul>   
                            <div id="head">STEP5.방문 봉사</div>
                            <li class="dListInfo">
                                
                                <p>날짜</p>
                                <p>2020/01/01</p>
                                <p>진행중</p>
                            </li>
                            <p>자세히보기 GO > </p>
                        </ul>
                    </a>
                </li>
                <li class="w25 dogListLi">
                    <a href="${pageContext.request.contextPath }/views/adopt/adoptDetail.jsp">
                        <ul>   
                            <div id="head">STEP6.방문 교육</div>
                            <li class="dListInfo">
                                
                                <p>날짜</p>
                                <p>2020/01/01</p>
                                <p>진행중</p>
                            </li>
                            <p>자세히보기 GO > </p>
                        </ul>
                    </a>
                </li>
                <li class="w25 dogListLi">
                    <a href="${pageContext.request.contextPath }/views/adopt/adoptDetail.jsp">
                        <ul>   
                            <div id="head">STEP7.방문 면담</div>
                            <li class="dListInfo">
                                
                                <p>날짜</p>
                                <p>2020/01/01</p>
                                <p>진행중</p>
                            </li>
                            <p>자세히보기 GO > </p>
                        </ul>
                    </a>
                </li>
                <li class="w25 dogListLi mRight">
                    <a href="${pageContext.request.contextPath }/views/adopt/adoptDetail.jsp">
                        <ul>   
                            <div id="head">STEP8.입양 완료</div>
                            <li class="dListInfo">
                                
                                <p>날짜</p>
                                <p>2020/01/01</p>
                                <p>진행중</p>
                            </li>
                            <p>자세히보기 GO > </p>
                        </ul>
                    </a>
                </li>
            </ul>
    </article>

	<!--//세번째-->
   <!-- // 네번째 시작-->
   <article class="Check mt70">
    <h4 class="mt30">진행 중 유의 사항</h4>
    <p class="mt30" id="scroll">
        본인(이하 '입양인'이라 합니다.)은 ANICARE (이하 '단체'라 합니다.)를 통하여 반려동물(이하 '입양동물'이라 합니다.)을 입양함에 있어 입양동물이 자연사하는 시점까지 책임 있는 보호자로서 입양동물에게 최적의 환경과 보살핌을 제공할 것이며 최선을 다하여 입양동물을 보호할 의무가 있습니다.
        입양인은 입양인이나 혹은 가족을 포함한 제 3자의 고의 또는 과실로 인하여 입양동물에 대한 학대행위가 발생하거나 입양동물이 양도, 매매, 유기, 유실된 경우에는 단체로부터의 어떠한 민, 형사상의 처벌에도 이의를 제기하지 않고 따르는데 동의합니다. 입양인은 입양동물이 양도, 매매, 유기, 유실된 경우에 그 즉시로 단체에 통지할 의무를 지니며 입양동물을 되찾기 위한 노력에 최선을 다하여 협조할 의무가 있습니다.
        입양인은 입양동물에게 양질의 사료와 깨끗한 물을 공급하고, 적합하고 적절한 운동, 질병에 대한 예방접종, 정기 건강검진을 시행하는 등, 꼭 필요한 복지를 제공할 의무가 있습니다.
        만일 입양동물이 질병에 걸렸을 때 입양인은 신속하게 필요한 수의학적 치료를 받게 하고 성실하게 그 치료에 임할 것이며 만일 입양동물의 완치가 불가능하고 그 고통이 극심한 경우에는 이를 단체에 통지하고 단체와의 협의 하에 대안을 강구하여야 하며 임의로 처리해서는 안 됩니다. 입양인은 입양동물이 자연사한 경우에도 즉시 이 사실을 단체에 통지할 의무가 있습니다.
        입양인은 상시 입양동물에게 입양인의 연락처가 기재된 이름표를 반드시 착용시켜야 하며 만일 입양인의 연락처가 변경되거나 주거지의 변동사항이 있을 시에는 즉시 단체에 이에 대한 정보를 통지할 의무가 있습니다.
        입양인은 입양 후 단체에서 시행하는 입양동물의 모니터링을 위한 전화 또는 방문에 응할 것이며 단체가 입양동물의 면회나 사진을 요구할 시 언제든지 이에 협조할 의무가 있습니다.
        입양인은 단체의 입양동물 중성화수술 방침에 동의하며, 입양 전에 미리 중성화수술이 시행될 수 없는 경우에는 입양동물의 건강상태가 양호하고 그 연령이 수술하기에 적합한 조건이 갖추어지는 즉시로 중성화수술을 시행하고 이에 대한 사실을 즉시 단체에 통지하며 중성화수술 전이라 할지라도 그 어떠한 경우에도 입양동물을 교배하지 않을 의무가 있습니다.
        입양인은 개인적인 사유로 파양을 하는 경우에는, 반드시 단체에게 통보해야 하며 임의대로 재입양할 수 없습니다. 또한, 단체에게 입양비 반환을 청구할 수 없습니다.
        입양인은 입양 후에도, 만일 단체에서 입양인이 입양동물을 돌볼 여건과 환경이 적합하지 않다고 판단하여 입양동물의 반환을 요구하는 경우에는 이에 이의를 제기하지 않고 적극 협조할 의무가 있습니다.
        
    </p>
  </article>


	<jsp:include page="/views/common/footer.jsp" />
	
	</div>

	<script>
		$(function() {
			$(".Animal_slider_pager").click(function() {

			})
			var imgSrc = $(".Animal_datail_silder").src();
			console.log(imgSrc);
		})
	</script>





</body>
</html>