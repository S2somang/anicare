<jsp:directive.page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ANICRE</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/adopt/adopt.css">
</head>
<body>
	
	<div id="wrap">
		<jsp:include page="/views/common/header.jsp" />
    <!-- contents 시작 -->
    <section class="contents">
        <!-- 첫번째 -->
            <form method="SelectAdoptMain" action="get">
         <article class="SupportOneOnOne mt70">
             <h3 class="contH3">
                 입양
                 
             </h3>
             <span>
             	<a href="${pageContext.request.contextPath }/views/adopt/adoptMain.jsp">입양</a> &gt; 
             	
             </span>
             <p class="bar"><span class="boderBot"></span></p>
             <p class="con">입양을 통해 아이들의 동반자가 되어주세요.<br>
                슬픔으로 가득찬 얼굴에 미소가 가득하게 만들어주세요.
            </p> 
           
            <div class="conHead">
                <h4>입양 안내</h4>
                <p> 아이의 특징을 선택해 주세요! </p>
            </div>
            <ul class="selectMenu"  >
                <li>
                    <ul>
                        <li>
                            <lable>
                                <span>중성화</span>
                                <span>Y/N</span>
                            </lable>
                            
                            <select name="fixing">
                                <option value="none" selected>ALL</option>
                                <option value="y">Y</option>
                                <option value="n">N</option>
                            </select>
                        </li>
                        <li>
                            <lable>
                                <span>성별</span>
                                <span>암컷/수컷</span>
                            </lable>
                            
                            <select name="gender">
                                <option value="none" selected>ALL</option>
                                <option value="f">암컷</option>
                                <option value="m">수컷</option>
                            </select>
                        </li>
                        <li>
                            <lable>
                                <span>크기</span>
                                <span>최대/대/중/소/최소</span>
                            </lable>
                            
                            <select name="size">
                                <option value="none" selected>ALL</option>
								<option value="max">최소</option>
								<option value="big">대</option>
                                <option value="midle">중</option>
								<option value="small">소</option>
								<option value="min">최소</option>
                            </select>
                        </li>
                        <li>
                            <lable>
                                <span>연령</span>
                                <span>puppy/junior/adult/senior</span>
                            </lable>
                            
                            <select name="age">
                                <option value="none" selected>ALL</option>
                                <option value="puppy">puppy</option>
                                <option value="junior">junior</option>
                                <option value="auilt">adult</option>
                                <option value="senior">senior</option>
                            </select>
                        </li>
                        <li>
                            <lable>
                                <span>성격</span>
                                <span>얌전/보통/활발/매우활발</span>
                            </lable>
                            
                            <select name="personality">
                                <option value="none" selected>ALL</option>
                                <option value="quiet">얌전</option>
                                <option value="friendly">보통</option>
                                <option value="outgoing">활발</option>
                                <option value="energetic">매우활발</option>
                            </select>
                        </li>
                    </ul>
                </li>
                <li class="button">
                    <button class="search" type="submit">검색</button>
                    <button class="reset" >초기화</button>
                </li>
            </ul> 

         </article>

         <!-- article second photo list -->
         <article class ="dogList mt70">
         
            <ul class="dogListUl">
				   <li class="w25 dogListLi">
                    <a href="${pageContext.request.contextPath }/views/adopt/AnimalInformation.jsp">
                        <ul>   
                            <li>
                                <img src="${pageContext.request.contextPath }/resources/images/common/dog/siba1.jpg" alt="dog1">
                            </li>
                            <li class="dListInfo">
                                <h4>시바</h4>
                                <p>시바</p>
                                <p>수컷 / 중성화 : Y</p>
                                <p> 3살 / 10.0kg</p>
                            </li>
                            <p>후원하러가기 GO > </p>
                        </ul>
                    </a>
                </li>
                <li class="w25 dogListLi">
                    <a href="${pageContext.request.contextPath }/views/support/AnimalInformation.jsp">
                        <ul>   
                            <li>
                                <img src="${pageContext.request.contextPath }/resources/images/common/dog/dog15.png" alt="dog1">
                            </li>
                            <li class="dListInfo">
                                <h4>콜리</h4>
                                <p>개(믹스)</p>
                                <p>암컷(중성화O)</p>
                                <p>3살/17.0kg</p>
                            </li>
                            <p>후원하러가기 GO > </p>
                        </ul>
                    </a>
                </li>
                <li class="w25 dogListLi">
                    <a href="#">
                        <ul>   
                            <li>
                                <img src="${pageContext.request.contextPath }/resources/images/common/dog/dog16.png" alt="dog1">
                            </li>
                            <li class="dListInfo">
                                <h4>시바</h4>
                                <p>시바</p>
                                <p>수컷 / 중성화 : Y</p>
                                <p> 3살 / 10.0kg</p>
                            </li>
                            <p>후원하러가기 GO > </p>
                        </ul>
                    </a>
                </li>
                <li class="w25 dogListLi mRight">
                    <a href="#">
                        <ul>   
                            <li>
                                <img src="${pageContext.request.contextPath }/resources/images/common/dog/dog17.png" alt="dog1">
                            </li>
                            <li class="dListInfo">
                                <h4>콜리</h4>
                                <p>개(믹스)</p>
                                <p>암컷(중성화O)</p>
                                <p>3살/17.0kg</p>
                            </li>
                            <p>후원하러가기 GO > </p>
                        </ul>
                    </a>
                </li>
                <!-- 2번째줄-->
                <!--1번째 줄-->

                <li class="w25 dogListLi">
                    <a href="${pageContext.request.contextPath }/views/support/AnimalInformation.jsp">
                        <ul>   
                            <li>
                                <img src="${pageContext.request.contextPath }/resources/images/common/dog/dog14.png" alt="dog1">
                            </li>
                            <li class="dListInfo">
                                <h4>콜리</h4>
                                <p>개(믹스)</p>
                                <p>암컷(중성화O)</p>
                                <p>3살/17.0kg</p>
                            </li>
                            <p>후원하러가기 GO > </p>
                        </ul>
                    </a>
                </li>
                <li class="w25 dogListLi">
                    <a href="${pageContext.request.contextPath }/views/support/AnimalInformation.jsp">
                        <ul>   
                            <li>
                                <img src="${pageContext.request.contextPath }/resources/images/common/dog/dog15.png" alt="dog1">
                            </li>
                            <li class="dListInfo">
                                <h4>콜리</h4>
                                <p>개(믹스)</p>
                                <p>암컷(중성화O)</p>
                                <p>3살/17.0kg</p>
                            </li>
                            <p>후원하러가기 GO > </p>
                        </ul>
                    </a>
                </li>
                <li class="w25 dogListLi">
                    <a href="#">
                        <ul>   
                            <li>
                                <img src="${pageContext.request.contextPath }/resources/images/common/dog/dog16.png" alt="dog1">
                            </li>
                            <li class="dListInfo">
                                <h4>콜리</h4>
                                <p>개(믹스)</p>
                                <p>암컷(중성화O)</p>
                                <p>3살/17.0kg</p>
                            </li>
                            <p>후원하러가기 GO > </p>
                        </ul>
                    </a>
                </li>
                <li class="w25 dogListLi mRight">
                    <a href="#">
                        <ul>   
                            <li>
                                <img src="${pageContext.request.contextPath }/resources/images/common/dog/dog17.png" alt="dog1">
                            </li>
                            <li class="dListInfo">
                                <h4>콜리</h4>
                                <p>개(믹스)</p>
                                <p>암컷(중성화O)</p>
                                <p>3살/17.0kg</p>
                            </li>
                            <p>후원하러가기 GO > </p>
                        </ul>
                    </a>
                </li>
                <!-- 2번째줄-->
  <li class="w25 dogListLi">
                    <a href="${pageContext.request.contextPath }/views/support/AnimalInformation.jsp">
                        <ul>   
                            <li>
                                <img src="${pageContext.request.contextPath }/resources/images/common/dog/dog14.png" alt="dog1">
                            </li>
                            <li class="dListInfo">
                                <h4>콜리</h4>
                                <p>개(믹스)</p>
                                <p>암컷(중성화O)</p>
                                <p>3살/17.0kg</p>
                            </li>
                            <p>후원하러가기 GO > </p>
                        </ul>
                    </a>
                </li>
                <li class="w25 dogListLi">
                    <a href="${pageContext.request.contextPath }/views/support/AnimalInformation.jsp">
                        <ul>   
                            <li>
                                <img src="${pageContext.request.contextPath }/resources/images/common/dog/dog15.png" alt="dog1">
                            </li>
                            <li class="dListInfo">
                                <h4>콜리</h4>
                                <p>개(믹스)</p>
                                <p>암컷(중성화O)</p>
                                <p>3살/17.0kg</p>
                            </li>
                            <p>후원하러가기 GO > </p>
                        </ul>
                    </a>
                </li>
                <li class="w25 dogListLi">
                    <a href="#">
                        <ul>   
                            <li>
                                <img src="${pageContext.request.contextPath }/resources/images/common/dog/dog16.png" alt="dog1">
                            </li>
                            <li class="dListInfo">
                                <h4>콜리</h4>
                                <p>개(믹스)</p>
                                <p>암컷(중성화O)</p>
                                <p>3살/17.0kg</p>
                            </li>
                            <p>후원하러가기 GO > </p>
                        </ul>
                    </a>
                </li>
                <li class="w25 dogListLi mRight">
                    <a href="#">
                        <ul>   
                            <li>
                                <img src="${pageContext.request.contextPath }/resources/images/common/dog/dog17.png" alt="dog1">
                            </li>
                            <li class="dListInfo">
                                <h4>콜리</h4>
                                <p>개(믹스)</p>
                                <p>암컷(중성화O)</p>
                                <p>3살/17.0kg</p>
                            </li>
                            <p>후원하러가기 GO > </p>
                        </ul>
                    </a>
                </li>
                <!-- 2번째줄-->

                <li class="w25 dogListLi">
                    <a href="#">
                        <ul>   
                            <li>
                                <img src="${pageContext.request.contextPath }/resources/images/common/dog/dog18.png" alt="dog1">
                            </li>
                            <li class="dListInfo">
                                <h4>콜리</h4>
                                <p>개(믹스)</p>
                                <p>암컷(중성화O)</p>
                                <p>3살/17.0kg</p>
                            </li>
                            <p>후원하러가기 GO > </p>
                        </ul>
                    </a>
                </li>
                <li class="w25 dogListLi">
                    <a href="#">
                        <ul>   
                            <li>
                                <img src="${pageContext.request.contextPath }/resources/images/common/dog/dog19.png" alt="dog1">
                            </li>
                            <li class="dListInfo">
                                <h4>콜리</h4>
                                <p>개(믹스)</p>
                                <p>암컷(중성화O)</p>
                                <p>3살/17.0kg</p>
                            </li>
                            <p>후원하러가기 GO > </p>
                        </ul>
                    </a>
                </li>
                <li class="w25 dogListLi">
                    <a href="#">
                        <ul>   
                            <li>
                                <img src="${pageContext.request.contextPath }/resources/images/common/dog/dog20.png" alt="dog1">
                            </li>
                            <li class="dListInfo">
                                <h4>콜리</h4>
                                <p>개(믹스)</p>
                                <p>암컷(중성화O)</p>
                                <p>3살/17.0kg</p>
                            </li>
                            <p>후원하러가기 GO > </p>
                        </ul>
                    </a>
                </li>
                <li class="w25 dogListLi mRight">
                    <a href="#">
                        <ul>   
                            <li>
                                <img src="${pageContext.request.contextPath }/resources/images/common/dog/dog21.png" alt="dog1">
                            </li>
                            <li class="dListInfo">
                                <h4>콜리</h4>
                                <p>개(믹스)</p>
                                <p>암컷(중성화O)</p>
                                <p>3살/17.0kg</p>
                            </li>
                            <p>후원하러가기 GO > </p>
                        </ul>
                    </a>
                </li>
                <!-- 3번째줄-->

                <!-- 3번째줄-->

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

            <br>
         </article>
</form>
    </section> 
    
		<jsp:include page="/views/common/footer.jsp" />
	</div>
	<script>
    $(function(){
       $(".pager li").mouseenter(function(){
           /*console.log($(this));*/
           $(this).addClass('active');
       }).mouseleave(function(){
            $(this).removeClass('active');
       }) ;
    });

    </script>

</body>
</html>