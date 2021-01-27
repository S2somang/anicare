<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/adopt/adopt.css">
</head>
<body>
  <article class ="dogList mt70">
         <form action="SelectAdoptMain" method="get">
            <ul class="dogListUl">
				<li class="w25 dogListLi">
        			  <c:forEach var="hmap" items="${requestScope.list }">
                    <a href="${pageContext.request.contextPath }/views/adopt/AnimalInfomation.jsp">
                        <ul> 
                            <li>
                                <img id="titleImg" src="${ applicationScope.contextPath }/resources/images/common/dog/<c:out value="${ requestScope.fileList[0].changeName }"/>">
                            </li>
                             <li class="dListInfo">
                                <h4>이름 <c:out value="${requestScope.dog.name }"/></h4>
                                <p>성별 : <c:out value="${requestScope.dog.gender }"/></p>
                                <p>품종 : <c:out value="${requestScope.dog.gender }"/> / 중성화 : <c:out value="${requestScope.information.fixing }"/></p>
                                <p>나이 : <c:out value="${requestScope.information.age }"/> / 무게 : <c:out value="${requestScope.information.weight }"/></p>
                            </li>
                            <p>입양하러가기 GO > </p>
                        </ul>
                    </a>
                            </c:forEach>
                </li>
			<li class="w25 dogListLi mRight">
                      <c:forEach var="hmap" items="${requestScope.list }">
                    <a href="${pageContext.request.contextPath }/views/adopt/AnimalInfomation.jsp">
                        <ul> 
                            <li>
                                <img id="titleImg" src="${ applicationScope.contextPath }/resources/images/common/dog/<c:out value="${ requestScope.fileList[0].changeName }"/>">
                            </li>
                             <li class="dListInfo">
                                <h4>이름 <c:out value="${requestScope.dog.name }"/></h4>
                                <p>성별 : <c:out value="${requestScope.dog.gender }"/></p>
                                <p>품종 : <c:out value="${requestScope.dog.gender }"/> / 중성화 : <c:out value="${requestScope.information.fixing }"/></p>
                                <p>나이 : <c:out value="${requestScope.information.age }"/> / 무게 : <c:out value="${requestScope.information.weight }"/></p>
                            </li>
                            <p>입양하러가기 GO > </p>
                        </ul>
                    </a>
                            </c:forEach>
                </li>
                <li class="w25 dogListLi">
        			<a href="${pageContext.request.contextPath }/views/adopt/AnimalInformation.jsp">
                        <ul>   
                            <li>
                                <img id="titleImg" src="${ applicationScope.contextPath }/resources/images/common/dog/<c:out value="${ requestScope.fileList[0].changeName }"/>">
                            </li>
                              <li class="dListInfo">
                                <h4><c:out value="${requestScope.dog.breed }"/></h4>
                                <p><c:out value="${requestScope.dog.gender }"/></p>
                                <p><c:out value="${requestScope.information.fixing }"/></p>
                                <p><c:out value="${requestScope.information.age }"/>/<c:out value="${requestScope.information.weight }"/></p>
                            </li>
                            <p>입양하러가기 GO > </p>
                        </ul>
                    </a>
                </li>
                <li class="w25 dogListLi mRight">
                    <a href="${pageContext.request.contextPath }/views/adopt/AnimalInfomation.jsp">
                        <ul>   
                            <li>
                                <img id="titleImg" src="${ applicationScope.contextPath }/resources/images/common/dog/<c:out value="${ requestScope.fileList[0].changeName }"/>">
                            </li>
                             <li class="dListInfo">
                                <h4><c:out value="${requestScope.dog.breed }"/></h4>
                                <p><c:out value="${requestScope.dog.gender }"/></p>
                                <p><c:out value="${requestScope.information.fixing }"/></p>
                                <p><c:out value="${requestScope.information.age }"/>/<c:out value="${requestScope.information.weight }"/></p>
                            </li>
                            <p>입양하러가기 GO > </p>
                        </ul>
                    </a>
                </li>
                <!--1번째 줄-->

                <li class="w25 dogListLi">
                <a href="${pageContext.request.contextPath }/views/adopt/AnimalInformation.jsp">
                        <ul>   
                            <li>
                                <img id="titleImg" src="${ applicationScope.contextPath }/resources/images/common/dog/<c:out value="${ requestScope.fileList[0].changeName }"/>">
                            </li>
                              <li class="dListInfo">
                                <h4><c:out value="${requestScope.dog.breed }"/></h4>
                                <p><c:out value="${requestScope.dog.gender }"/></p>
                                <p><c:out value="${requestScope.information.fixing }"/></p>
                                <p><c:out value="${requestScope.information.age }"/>/<c:out value="${requestScope.information.weight }"/></p>
                            </li>
                            <p>입양하러가기 GO > </p>
                        </ul>
                    </a>
                </li>
                <li class="w25 dogListLi">
                <a href="${pageContext.request.contextPath }/views/adopt/AnimalInformation.jsp">
                        <ul>   
                            <li>
                                <img id="titleImg" src="${ applicationScope.contextPath }/resources/images/common/dog/<c:out value="${ requestScope.fileList[0].changeName }"/>">
                            </li>
                              <li class="dListInfo">
                                <h4><c:out value="${requestScope.dog.breed }"/></h4>
                                <p><c:out value="${requestScope.dog.gender }"/></p>
                                <p><c:out value="${requestScope.information.fixing }"/></p>
                                <p><c:out value="${requestScope.information.age }"/>/<c:out value="${requestScope.information.weight }"/></p>
                            </li>
                            <p>입양하러가기 GO > </p>
                        </ul>
                    </a>
                </li>
                <li class="w25 dogListLi">
                    <a href="${pageContext.request.contextPath }/views/adopt/AnimalInformation.jsp">
                        <ul>   
                            <li>
                                <img id="titleImg" src="${ applicationScope.contextPath }/resources/images/common/dog/<c:out value="${ requestScope.fileList[0].changeName }"/>">
                            </li>
                            <li class="dListInfo">
                                <h4><c:out value="${requestScope.dog.breed }"/></h4>
                                <p><c:out value="${requestScope.dog.gender }"/></p>
                                <p><c:out value="${requestScope.information.fixing }"/></p>
                                <p><c:out value="${requestScope.information.age }"/>/<c:out value="${requestScope.information.weight }"/></p>
                            </li>
                            <p>입양하러가기 GO > </p>
                        </ul>
                    </a>
                </li>
                <li class="w25 dogListLi mRight">
                   <a href="${pageContext.request.contextPath }/views/adopt/AnimalInformation.jsp">
                        <ul>   
                            <li>
                                <img id="titleImg" src="${ applicationScope.contextPath }/resources/images/common/dog/<c:out value="${ requestScope.fileList[0].changeName }"/>">
                            </li>
                             <li class="dListInfo">
                                <h4><c:out value="${requestScope.dog.breed }"/></h4>
                                <p><c:out value="${requestScope.dog.gender }"/></p>
                                <p><c:out value="${requestScope.information.fixing }"/></p>
                                <p><c:out value="${requestScope.information.age }"/>/<c:out value="${requestScope.information.weight }"/></p>
                            </li>
                            <p>입양하러가기 GO > </p>
                        </ul>
                    </a>
                </li>
                <!-- 2번째줄-->

                <li class="w25 dogListLi">
                    <a href="${pageContext.request.contextPath }/views/adopt/AnimalInformation.jsp">
                        <ul>   
                            <li>
                                <img id="titleImg" src="${ applicationScope.contextPath }/resources/images/common/dog/<c:out value="${ requestScope.fileList[0].changeName }"/>">
                            </li>
                              <li class="dListInfo">
                                <h4><c:out value="${requestScope.dog.breed }"/></h4>
                                <p><c:out value="${requestScope.dog.gender }"/></p>
                                <p><c:out value="${requestScope.information.fixing }"/></p>
                                <p><c:out value="${requestScope.information.age }"/>/<c:out value="${requestScope.information.weight }"/></p>
                            </li>
                            <p>입양하러가기 GO > </p>
                        </ul>
                    </a>
                </li>
                <li class="w25 dogListLi">
                    <a href="${pageContext.request.contextPath }/views/adopt/AnimalInformation.jsp">
                        <ul>   
                            <li>
                                <img id="titleImg" src="${ applicationScope.contextPath }/resources/images/common/dog/<c:out value="${ requestScope.fileList[0].changeName }"/>">
                            </li>
                             <li class="dListInfo">
                                <h4><c:out value="${requestScope.dog.breed }"/></h4>
                                <p><c:out value="${requestScope.dog.gender }"/></p>
                                <p><c:out value="${requestScope.information.fixing }"/></p>
                                <p><c:out value="${requestScope.information.age }"/>/<c:out value="${requestScope.information.weight }"/></p>
                            </li>
                            <p>입양하러가기 GO > </p>
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

            </ul>
</form>
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
         <script>
         $(function() {
 			$(".thumb-list").click(function() {
 				/* var num = $(this).children().children().eq(0).val(); */
 				var num = $(this).find("input").val();
 				/* console.log(num); */
 				
 				location.href = "${applicationScope.contextPath}/selectOne.tn?num=" + num;
 			})
 		})
         
         </script>
</body>
</html>