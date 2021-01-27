<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보호동물정보</title>
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
					보호동물 정보 <span class="boderBot">
				</h3>
				<span>
					<a href="${pageContext.request.contextPath }/views/adopt/adoptApplication.jsp">입양</a> &gt; 
					<a href="${pageContext.request.contextPath }/views/adopt/adoptSearchjsp">입양검색</a> &gt; 
					<a href="${pageContext.request.contextPath }/views/adopt/adoptDetail..jsp">입양동물정보</a>&gt; 
					<a href="#">시바</a></span>
				<p class="bar">
					</span>
				</p>

				<<ul class="AniPhoto">
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
						<button><a id="anchor" href="${pageContext.request.contextPath }/views/adopt/dogDetail.jsp">강아지정보</a></button>
					</li>
				</ul>

				<p class="bar"></p>

			</article>
			<!--//첫번째-->

			<!-- 두번째 -->
			
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
                            
                        </ul>
                    </a>
                </li>
                <li class="w25 dogListLi">
                    <a href="${pageContext.request.contextPath }/views/adopt/adoptDetail.jsp">
                        <ul>   
                            <div id="head">STEP2.서류 심사</div>
                            <li class="dListInfo">
                                
                                <p id="text">날짜</p>
                                <p>2020/01/01</p>
                                <p>진행중</p>
                            </li>
                            
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
                            
                        </ul>
                    </a>
                </li>
            </ul>
    </article>

	<!--//세번째-->
   <!-- // 네번째 시작-->
  


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