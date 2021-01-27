<jsp:directive.page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/support/supportNews.css">
 
</head>
<body>
	
	<div id="wrap">
 	<jsp:include page="/views/common/header.jsp" />
    <!-- contents 시작 -->
    <section class="contents">
        <!-- 첫번째 -->
         <article class="SupportNews mt70">
             <h3 class="contH3">
                 후원소식보기
                 <span class="boderBot">
             </h3>
             <span>
	             <a href="${pageContext.request.contextPath }/views/support/supportMain.jsp">후원</a> &gt; 
	             <a href="${pageContext.request.contextPath }/views/support/supportNews.jsp">후원소식보기</a>
             </span>
             <p class="bar"></span></p>
             <p class="con">후원에 참여하신 다양한 분들의 이야기 중,  즐거움과 감동, 그리고 정성 가득한 내용을 소개합니다. 여러분들도 함께 공유해주세요!</p> 
           

             <!-- 후원 소식 보기 사진내용담기는 곳-->
             <ul>
                 <!-- 일단 ...두개 만들어서 붙여놔보고 -->
                 <li>
                     <a href="#">
                         <div>
                             <img src="${pageContext.request.contextPath }/resources/images/common/dog/dog4.jpg" alt="후원소식이미지">
                        </div>
                         <div>
                             <h4>입양 기념으로 길동님 엄마께서 후원해 주셨습니다.</h4>
                             <span class="spanCon">반려견 입양 기념으로 길동이 엄마께서 후원해주셨습니다.</span>
                             <p><span class="spanColor">작성자</span><span class="spanColor">2020-08-08</span><span>조회수</span><span class="spanColor">20</span></p>
                        </div>
                     </a>
                </li>

                <li class="mRightNone">
                    <a href="#">
                        <div>
                            <img src="${pageContext.request.contextPath }/resources/images/common/dog/dog5.jpg" alt="후원소식이미지">
                       </div>
                        <div>
                            <h4>입양 기념으로 길동님 엄마께서 후원해 주셨습니다.</h4>
                            <span class="spanCon">반려견 입양 기념으로 길동이 엄마께서 후원해주셨습니다. </span>
                            <p><span class="spanColor">작성자</span><span class="spanColor">2020-08-08</span><span>조회수</span><span class="spanColor">20</span></p>
                       </div>
                    </a>
               </li>
               <!--// 1  --> 

               <!-- 2-->
               <li>
                    <a href="#">
                        <div>
                            <img src="${pageContext.request.contextPath }/resources/images/common/dog/dog6.jpg" alt="후원소식이미지">
                    </div>
                        <div>
                            <h4>입양 기념으로 길동님 엄마께서 후원해 주셨습니다.</h4>
                            <span class="spanCon">반려견 입양 기념으로 길동이 엄마께서 후원해주셨습니다.</span>
                            <p><span class="spanColor">작성자</span><span class="spanColor">2020-08-08</span><span>조회수</span><span class="spanColor">20</span></p>
                    </div>
                    </a>
                 </li>

                <li class="mRightNone">
                    <a href="#">
                        <div>
                            <img src="${pageContext.request.contextPath }/resources/images/common/dog/dog13.png" alt="후원소식이미지">
                        </div>
                        <div>
                            <h4>입양 기념으로 길동님 엄마께서 후원해 주셨습니다.</h4>
                            <span class="spanCon">반려견 입양 기념으로 길동이 엄마께서 후원해주셨습니다. </span>
                            <p><span class="spanColor">작성자</span><span class="spanColor">2020-08-08</span><span>조회수</span><span class="spanColor">20</span></p>
                        </div>
                    </a>
                </li>
                <!--// 2 -->
                <!-- 3 -->
                <li>
                        <a href="#">
                            <div>
                                <img src="${pageContext.request.contextPath }/resources/images/common/dog/dog22.png" alt="후원소식이미지">
                        </div>
                            <div>
                                <h4>입양 기념으로 길동님 엄마께서 후원해 주셨습니다.</h4>
                                <span class="spanCon">반려견 입양 기념으로 길동이 엄마께서 후원해주셨습니다.</span>
                                <p><span class="spanColor">작성자</span><span class="spanColor">2020-08-08</span><span>조회수</span><span class="spanColor">20</span></p>
                        </div>
                        </a>
                </li>

                <li class="mRightNone">
                    <a href="#">
                        <div>
                            <img src="${pageContext.request.contextPath }/resources/images/common/dog/dog21.png" alt="후원소식이미지">
                        </div>
                        <div>
                            <h4>입양 기념으로 길동님 엄마께서 후원해 주셨습니다.</h4>
                            <span class="spanCon">반려견 입양 기념으로 길동이 엄마께서 후원해주셨습니다. </span>
                            <p><span class="spanColor">작성자</span><span class="spanColor">2020-08-08</span><span>조회수</span><span class="spanColor">20</span></p>
                        </div>
                    </a>
                </li>
                <!--// 3-->
                <!-- 4 -->
                <li>
                    <a href="#">
                        <div>
                            <img src="${pageContext.request.contextPath }/resources/images/common/dog/dog19.png" alt="후원소식이미지">
                    </div>
                        <div>
                            <h4>입양 기념으로 길동님 엄마께서 후원해 주셨습니다.</h4>
                            <span class="spanCon">반려견 입양 기념으로 길동이 엄마께서 후원해주셨습니다.</span>
                            <p><span class="spanColor">작성자</span><span class="spanColor">2020-08-08</span><span>조회수</span><span class="spanColor">20</span></p>
                    </div>
                    </a>
                </li>

                <li class="mRightNone">
                    <a href="#">
                        <div>
                            <img src="${pageContext.request.contextPath }/resources/images/common/dog/dog17.png" alt="후원소식이미지">
                        </div>
                        <div>
                            <h4>입양 기념으로 길동님 엄마께서 후원해 주셨습니다.</h4>
                            <span class="spanCon">반려견 입양 기념으로 길동이 엄마께서 후원해주셨습니다. </span>
                            <p><span class="spanColor">작성자</span><span class="spanColor">2020-08-08</span><span>조회수</span><span class="spanColor">20</span></p>
                        </div>
                    </a>
                </li>
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