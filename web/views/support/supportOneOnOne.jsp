<jsp:directive.page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/support/supportOneOnOne.css">
</head>
<body>

	<div id="wrap">
		<jsp:include page="/views/common/header.jsp" />
    <!-- contents 시작 -->
    <section class="contents">
        <!-- 첫번째 -->
         <article class="SupportOneOnOne mt70">
             <h3 class="contH3">
                 1:1결연
                 
             </h3>
             <span>
             	<a href="${pageContext.request.contextPath }/views/support/supportMain.jsp">후원</a> &gt; 
             	<a href="${pageContext.request.contextPath }/views/support/supportOneOnOne.jsp">1:1결연</a>
             </span>
             <p class="bar"><span class="boderBot"></span></p>
             <p class="con">1:1결연을 통해 아이들의 부모가 되어주세요.<br>
                아이들의 매일매일 모습을 확인 할 수 있습니다. 아이의 성격을 파악하고 입양을 고려해 볼 수도 있겠죠! :)
            </p> 
           
            <div class="conHead">
                <h4>1:1결연 안내</h4>
                <p> 아이의 특징을 선택해 주세요! </p>
            </div>
            <ul class="selectMenu">
                <li>
                    <ul>
                        <li>
                            <lable>
                                <span>중성화</span>
                                <span>Y/N</span>
                            </lable>
                            
                            <select>
                                <option value="none" selected>ALL</option>
                                <option>Y</option>
                                <option>N</option>
                            </select>
                        </li>
                        <li>
                            <lable>
                                <span>성별</span>
                                <span>암컷/수컷</span>
                            </lable>
                            
                            <select>
                                <option value="none" selected>ALL</option>
                                <option>암컷</option>
                                <option>수컷</option>
                            </select>
                        </li>
                        <li>
                            <lable>
                                <span>크기</span>
                                <span>최대/대/중/소/최소</span>
                            </lable>
                            
                            <select>
                                <option value="none" selected>ALL</option>
                                <option>최대</option>
                                <option>대</option>
                                <option>중</option>
                                <option>소</option>
                                <option>최소</option>
                            </select>
                        </li>
                        <li>
                            <lable>
                                <span>연령</span>
                                <span>puppy/junior/adult/senior</span>
                            </lable>
                            
                            <select>
                                <option value="none" selected>ALL</option>
                                <option>puppy</option>
                                <option>junior</option>
                                <option>adult</option>
                                <option>senior</option>
                            </select>
                        </li>
                        <li>
                            <lable>
                                <span>성격</span>
                                <span>얌전/보통/활발/매우활발</span>
                            </lable>
                            
                            <select>
                                <option value="none" selected>ALL</option>
                                <option>얌전</option>
                                <option>보통</option>
                                <option>활발</option>
                                <option>매우활발</option>
                            </select>
                        </li>
                    </ul>
                </li>
                <li class="button">
                    <button class="search">검색</button>
                    <button class="reset" >초기화</button>
                </li>
            </ul> 

         </article>

         <!-- article second photo list -->
         <article class ="dogList mt70">
            <ul class="dogListUl">
            <%-- <li class="w50 dogListLi">
                    <a href="${pageContext.request.contextPath }/OneInfoViews.sp">
                        <ul>   
                            <li>
                                <img src="${pageContext.request.contextPath }/resources/images/common/dog/dog01.png" alt="dog1">
                            </li>
                            <li class="dListInfo">
                                <h4>콜리</h4>
                                <p>개(믹스)</p>
                                <p>암컷(중성화O)</p>
                                <p>3살/17.0kg</p>
                            </li>
                            <p>입양성공</p>
                        </ul>
                    </a>
                </li> --%>
             <c:set var ="dog" value ="${requestScope.boardList}"/>
             <c:set var ="su" value ="${requestScope.suattachment}"/>
             
             <c:forEach var ="b" items="${requestScope.dog}" varStatus="bb" >
             	
               <%--  
                <c:set var ="" value =""/> --%>
                <li class="w25 dogListLi">
                	<c:out value ="${bb.begin}"/>
                    <a href="#" class="clickA">
                        <ul>
                        	
                        	
                            <li>
                          		 <c:forEach var ="D" items="${requestScope.suattachment}" varStatus="dd" begin="0" end="0">
                           	 	<%-- <c:set var ="su" value ="${requestScope.suattachment}"/> --%>
                                <img src="${pageContext.request.contextPath}/resources/uploadFiles/supportOneUploadFiles/<c:out value ='${requestScope.suattachment[bb.index].changeName}'/>"alt="${dd.current }">
                            	<input type ="hidden" value ="${requestScope.boardList[bb.index].stCode}">
                            	</c:forEach>
                            </li>
                        	
                            <li class="dListInfo">
                            	
                                <h4>${bb.current.name }</h4>
                                <p>${bb.current.breed}</p>
                                <p>
                                <c:if test="${bb.current.gender.equals('M')}">
									남자
								</c:if> 
								<c:if test="${!bb.current.gender.equals('M')}">
									여자
								</c:if> 
								</p>
                                <p>${bb.current.age } / ${bb.current.weight } kg </p>
                                
                            </li>
                            <p>후원하러가기 GO > </p>
                        </ul>
                    </a>
                </li><%-- 
                <li class="w25 dogListLi mRight">
                    <a href="${pageContext.request.contextPath }/views/support/AnimalInfomation.jsp">
                        <ul>   
                            <li>
                                <img src="${pageContext.request.contextPath }/resources/images/common/dog/dog13.png" alt="dog1">
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
                </li> --%>
                <!-- 3번째줄-->
			</c:forEach>
            </ul>

			
                <ul class="pager mt40">
                    <li onclick="location.href='${pageContext.request.contextPath}/ViewsSupportList.sp?currentPage=1'"><<</li>
			        <!-- 현재 페이지가 1봗다 작으면 ㅈ더이상 갈수없잖앙 -->
			        <c:if test="${ requestScope.pi.currentPage <= 1 }">
			            <li disabled><</li>
			        </c:if>
			         <!-- 1이상이면 넘겨.. -->
			        <c:if test="${ requestScope.pi.currentPage > 1 }">
			            <li onclick="location.href='${pageContext.request.contextPath}/ViewsSupportList.sp?currentPage=<c:out value="${ requestScope.pi.currentPage - 1 }"/>'"><</li>
			        </c:if>
			        
			        
			        <!--                              1                                    5                    -->
			         <c:forEach var="p" begin="${ requestScope.pi.startPage }" end="${ requestScope.pi.endPage }" step="1">
			            <c:if test="${ requestScope.pi.currentPage eq p }"> <!--  현재페이지가 p와 같다면 현재페이지버튼을 다시 누를필요없으니까 -->
			               <li disabled><c:out value="${ p }"/></li>
			            </c:if>
			            <!--  ne => not equals , =! -->
			            <c:if test="${ requestScope.pi.currentPage ne p }">
			               <li onclick="location.href='${pageContext.request.contextPath}/ViewsSupportList.sp?currentPage=<c:out value="${ p }"/>'"><c:out value="${ p }"/></li>
			            </c:if>
			         </c:forEach>
			        
			         <c:if test="${ requestScope.pi.currentPage >= requestScope.pi.maxPage }">
		            
		            <li disabled>></li>
			         </c:if>
			         <c:if test="${ requestScope.pi.currentPage < requestScope.pi.maxPage }">
			            <li onclick="location.href='${pageContext.request.contextPath}/ViewsSupportList.sp?currentPage=<c:out value="${ requestScope.pi.currentPage + 1 }"/>'">></li>
			         </c:if>
			         
			         
			         <li onclick="location.href='${pageContext.request.contextPath}/ViewsSupportList.sp?currentPage=<c:out value="${ requestScope.pi.maxPage }"/>'">>></;o>
			     
				        
			        
                </ul>

            <br>
         </article>

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
       
       
       $("#dogListLi").click(function(){
			var num = $(this).find('input').val();
			
			console.log(num);
			
			location.href="${pageContext.request.contextPath}/selectOneInfo.sp?num="+num;
		});
       
       $(".clickA").click(function(){
    	   var num = $(this).find("input").val();
    	   
    	   console.log(num);
    	   
    	   location.href="${pageContext.request.contextPath}/OneInfoViews.sp?num="+num;
       })
       
       
    });

    </script>

</body>
</html>