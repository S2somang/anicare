<jsp:directive.page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AniCare</title>
<link rel="stylesheet" href="resources/css/main/main.css">

</head>
<body>
<div id="wrap">
	<jsp:include page ="views/common/header.jsp"/>
	<!-- title banner -->
        <div class="title">
            <ul class="banner">
                <li><a href="#"><img src="${pageContext.request.contextPath }/resources/images/main/banner01.png" alt="banner01"></a></li>
                <li><a href="#"><img src="${pageContext.request.contextPath }/resources/images/main/banner03.png" alt="banner03"></a></li>
            </ul>

            <!-- arrowSlider -->
            <div class="arrow">
                <span class="prev" id="aroPrev">&lt; </span> 
                <span class="next" id="aroNext">&gt; </span>   
            </div>
             <!-- //arrowSlider-->
         </div>
         <!-- //title banner -->
         <script>
             $('.banner').slick({
                infinite : true,
                arrows : true,
                prevArrow : $('#aroPrev'),		// 이전 화살표 모양 설정
				nextArrow : $('#aroNext'),
				dots : false,
                autoplay : true,
				autoplaySpeed : 4000,
                pauseOnHover:true
             });
         </script>
        


         <!-- contents 시작 -->
        <section class="contents">
           <!-- 첫번째 -->
            <article class="myHoo mt50">
                <h3 class="contH3">후원중인 아이</h3>
                <p>후원하고 있는 아이들의 오늘의 영상입니다.<br>오늘은 아이들이 무얼 하고 놀고 있는지 볼까요 ? </p> 
                <ul>
                    <li> <!-- 슬라이드 할거라서 li안에 또 만들었습니다.-->
                        <ul>
                            <li>
                                <iframe width="600" height="338" src="https://www.youtube.com/embed/zGwhWSa6U_k" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                <!-- <img src="" alt="동영상이 아닌경우 개 이미지"> -->
                            </li>
                            <li>
                                <span class="hoo_icon">후원중</span>
                                <p>홍길동</p>
                                <span class="hoo_con">오늘은 산책ㅇ웅응앵ㅇ ㅇㅇ오늘은 산책ㅇ웅응앵ㅇ ㅇㅇ오늘은 산책ㅇ웅응앵ㅇ ㅇㅇ오늘은 산책ㅇ웅응앵ㅇ ㅇㅇ</span>
                            </li>
                        </ul>
                    </li>
                </ul>


            </article>
            <!--// 첫번째 끝  -->
            
            <!-- 두번째 -->
            <article class="news mt50">
                <h3>애니케어 소식</h3>
                <p>후원하고 있는 아이들의 오늘의 영상입니다.<br>오늘은 아이들이 무얼 하고 놀고 있는지 볼까요 ? </p> 
                <ul>
                    <!-- 게시판 -->
                    <li class="notice1">
                        <div class="notice1-1">
                            <h5>Notice1</h5>
                            <ul>
                                <li><a href="#">굳세게 피는 따뜻한 인간은 예수는 하여도 교향악이다. 수 없으면, 간에 곳으로 보이는 그와 얼음과 아니한 붙잡아 것이다.</a></li>
                                <li><a href="#">굳세게 피는 따뜻한 인간은 예수는 하여도 교향악이다. 수 없으면, 간에 곳으로 보이는 그와 얼음과 아니한 붙잡아 것이다.</a></li>
                                <li><a href="#">굳세게 피는 따뜻한 인간은 예수는 하여도 교향악이다. 수 없으면, 간에 곳으로 보이는 그와 얼음과 아니한 붙잡아 것이다.</a></li>
                                <li><a href="#">굳세게 피는 따뜻한 인간은 예수는 하여도 교향악이다. 수 없으면, 간에 곳으로 보이는 그와 얼음과 아니한 붙잡아 것이다.</a></li>
                                <li><a href="#">굳세게 피는 따뜻한 인간은 예수는 하여도 교향악이다. 수 없으면, 간에 곳으로 보이는 그와 얼음과 아니한 붙잡아 것이다.</a></li>
                                <li><a href="#">굳세게 피는 따뜻한 인간은 예수는 하여도 교향악이다. 수 없으면, 간에 곳으로 보이는 그와 얼음과 아니한 붙잡아 것이다.</a></li>
                            </ul>
                            <a href="#" class="more" title="더 보기">More <i class="fa fa-plus-circle" aria-hidden="true"></i></a>   
                        </div>
                    </li>
                    <!--//게시판 -->
                    <li class="notice2"><a href="#"><img src="${pageContext.request.contextPath }/resources/images/main/event01.png" alt="event"></a></li>
                </ul>

            </article>
            <!--// 두번째 끝  -->
            
            <!-- 세번째 -->
            <article class="event mt70">
               <h3 class="supEvent"><b>애니케어</b>의 <b>후원자</b>가 되어주세요</h3>
            </article>
            <!--// 세번째 끝  -->
            
            <!-- 네번째 -->
            <article class="newAni mt70">
                <h3 class="contH3">새로운 아이들</h3>
                <p>애니케어에 새로운 아이들이 도착했습니다 .<br> 여러분들의 많은 관심이 필요합니다. </p> 
                <span class="h_icon"><a href="#">후원하러 가기</a></span>
                <ul class="mt60">
                    <li class="mLeftNone">
                        <div><img src="${pageContext.request.contextPath }/resources/images/common/dog/dog14.png" alt="강아지 이미지"></div>                             
                        <h5>홍길동</h5>
                        <span class="hoo_con">한번의 파양으로 시설에 오게된 웅앵이입니다. 놀라울정도로 사람을 좋아하고, 활발한 아이의 가족을 찾습니다.  </span>
                    </li>  
                    <li>
                        <div><img src="${pageContext.request.contextPath }/resources/images/common/dog/dog15.png" alt="강아지 이미지"></div>           
                        <h5>홍길동</h5>
                        <span class="hoo_con">한번의 파양으로 시설에 오게된 웅앵이입니다. 놀라울정도로 사람을 좋아하고, 활발한 아이의 가족을 찾습니다.  </span>
                    </li>
                    <li class="mRightNone">
                        <div><img src="${pageContext.request.contextPath }/resources/images/common/dog/dog16.png" alt="강아지 이미지"></div>         
                        <h5>홍길동</h5>
                        <span class="hoo_con">한번의 파양으로 시설에 오게된 웅앵이입니다. 놀라울정도로 사람을 좋아하고, 활발한 아이의 가족을 찾습니다.  </span>
                    </li>
                    <br>
                    <li class="mLeftNone">
                        <div><img src="${pageContext.request.contextPath }/resources/images/common/dog/dog17.png" alt="강아지 이미지"></div>          
                        <h5>홍길동</h5>
                        <span class="hoo_con">한번의 파양으로 시설에 오게된 웅앵이입니다. 놀라울정도로 사람을 좋아하고, 활발한 아이의 가족을 찾습니다.  </span>
                    </li>
                    <li>
                        <div><img src="${pageContext.request.contextPath }/resources/images/common/dog/dog18.png" alt="강아지 이미지"></div>          
                        <h5>홍길동</h5>
                        <span class="hoo_con">한번의 파양으로 시설에 오게된 웅앵이입니다. 놀라울정도로 사람을 좋아하고, 활발한 아이의 가족을 찾습니다.  </span>
                    </li>
                    <li class="mRightNone">
                        <div><img src="${pageContext.request.contextPath }/resources/images/common/dog/dog19.png" alt="강아지 이미지"></div>          
                        <h5>홍길동</h5>
                        <span class="hoo_con">한번의 파양으로 시설에 오게된 웅앵이입니다. 놀라울정도로 사람을 좋아하고, 활발한 아이의 가족을 찾습니다.  </span>
                    </li>
                     
                </ul>
            </article>
            <!--// 네번째 끝  -->

            <!-- 다섯번째 -->
            
            <article class="aniHos mt70">
                <!-- API 부분 -->
                <div>
                    <h3>우리동네 근처 병원찾기</h3>
                    <p>애니케어에서 믿고 추천해주는 우리동네 동물병원</p>
                    <input type ="search" value="가까운 병원 찾기" name ="search" class="search">
                    <button class="sButton">검색하기</button>
                </div>
            </article>
            <!--// 다섯번째 끝  -->
        </session>
        
        <jsp:include page ="views/common/footer.jsp"/>
        </div>
</body>
</html>