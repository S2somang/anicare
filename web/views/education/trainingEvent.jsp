<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#title {
	/* background-color:magenta; */
	height:36px;
	margin-top:30px;
	margin-left:17%;
	margin-right:17%;
	border:solid #878787;
	border-width:0px 0px 2px

}
#title>h2 {
	width:135px;
	font-size:24px;
	border:solid #3742fa;
	border-width:0px 0px 2px
}

#contents {
	font-color:#453f3fl;
	background-color:gold;
	margin-top:30px;
	margin-left:17%;
	margin-right:17%;
	margin-bottom:30%;
}
article, aside {
	float:left;
}
article>h3 {
	color:#453f3fl;
	font-weight:bold;
	font-size:24px;		
}
#greetings {
	color:#453f3fl;	
/* 	background-color:coral; */
	width:80%;
	height:auto;
	margin-bottom:50px;
}
aside {
	/* background-color:khaki; */
	width:16%;
	height:400px;
	margin-left:4%;
}
aside>ul>li {
	height:40px;
	font-size:20px;
	color:#878787;
}
aside>ul>li:nth-child(1) a{
	color: #3742fa;
	font-weight:bold;
	border: solid #3742fa;
	border-width: 0px 0px 2px;
}
.thumb-list {
	background-color:wheat;
	margin:10px 15px;
	text-align:center;
	font-size:20px;
	font-weight:bold;
	color:#878787;
}
.thumb-list img {
	max-width:400px;
	max-height:250px;
}
.thumb-img {
	height:250px;
	width:60%;
	margin-top:10px;
	float:left;
}
.thumb-text {
	height:250px;
	width:40%;
	margin-top:10px;
	text-align:center;
	float:left;
}
.thumb-text p {
	margin:10px;
}

.contentTitle {
	padding-top:10px;
}
.detail {
	pading-top:20px;
	font-size:16px;
	font-weight:normal;
}
.paging-area {
	width: 100%;
	height: 10%;
	/* text-align: center;
	vertical-align: center; */
}

.paging-area button {
	width: 3%;
	color: #5E5E5E;
	background-color: #FFFFFF;
	font-size: 15px;
	margin-top: 15px;
	margin-left: 3px;
	margin-right: 3px;
}

.paging-area button:hover {
	background-color: #3C43F0;
	color: #FFFFFF;
	cursor: pointer;
}
.searching-area {
	background-color:mistyrose;
}

.searching-area select {

	width: 100px;
	height: 30px;
	margin: 10px 10px auto;
	float: right;
}

#searchText {
	
	width: 100px;
	height: 25px;
	text-indent:0.5em;
	margin-top: 10px;
	outline: none;
	float:right;
}

#searchBtn {
	width: 22px;
	height: 22px;
	margin-top: 14px;
	margin-right: -100px;
	outline: none;

}
button:disabled {
	background-color: gray;
}


</style>

</head>
<body>
	
	<div id="wrapper">
	
		<!-- header -->
			<jsp:include page="/views/common/header.jsp"/>

		
		<!-- page title -->
			<div id="title">
				<h2>반려동물교육</h2>
			</div>
		
		<!-- contents -->
		<section id="contents">
			<article id="greetings">
				
				<!-- thumbnail-photo-list -->
				<div class="thumbnail-area" align="center">
				
					<c:forEach var="hmap" items="${ requestScope.list }">
						<div class="thumb-list" align="center">
							<input type="hidden" value="${ hmap.bCode }">
							<div class="thumb-img">
								<p>
									<img src="${pageContext.request.contextPath }/resources/images/education/<c:out value="${ hmap.changeName }"/>">
								</p>
							</div>
							<div class="thumb-text">
								<p class="contentTitle"><c:out value="${ hmap.title }"/></p>
								<p class="detail"><c:out value="${ hmap.content }"/></p>
							</div>

						</div>						
					</c:forEach>
				
<%-- 					<div class="thumb-list" align="center">
						<!-- c:forEach expected here -->
						<p style="float:left;">
							<img src="${pageContext.request.contextPath }/resources/images/education/trainingEvent1.png">
						</p>
						<p class="contentTitle">[서울시와 함께하는 2020 반려견 교육센터]</p>
						<p class="detail">반려동물이 우리와 함께 안전하고 행복하게 살아가길 바라나요?<br> 
								서울시와 ANICARE가 준비한 교육을 신청하세요!
						</p>
					</div>
					
					<div class="thumb-list" align="center" style="clear:left;">
						<p style="float:left;">
							<img src="${pageContext.request.contextPath }/resources/images/education/trainingEvent2.png">
						</p>
						<p class="contentTitle">모집마감★[ANICARE 더배움 2020] </p>
						<p class="detail"> 집중강좌 프로그램이 열립니다! 참가자분들의 뜨거운 응원과 관심에 힘입어
								 다시 돌아온 2020년의 &ltANIEDU&gt 집중강좌는 더욱 단단하고 섬세한 주제들로 여러분들을 기다리고 있습니다.
						</p>
						
					</div> --%>
				
				
				</div>
				
				<div class="paging-area" align="center">
					<!-- "<<" button on/of condition -->
					<c:if test="${ requestScope.pi.currentPage <= 1 }">
						<button disabled>&lt&lt</button>
					</c:if>
					<c:if test="${ requestScope.pi.currentPage > 1 }">
						<button onclick="location.href='${pageContext.request.contextPath}/selectEvent.ed?searchTitle=<c:out value="${ requestScope.searchTitle }" />&searchContent=<c:out value="${ requestScope.searchContent }" />&currentPage=1'">&lt&lt</button>
					</c:if>
					
					<!-- "<" button on/of condition -->
					<c:if test="${ requestScope.pi.currentPage <= 1 }">
						<button disabled>&lt</button>
					</c:if>
					<c:if test="${ requestScope.pi.currentPage > 1 }">
						<button onclick="location.href='${ pageContext.request.contextPath }/selectEvent.ed?searchTitle=<c:out value="${ requestScope.searchTitle }" />&searchContent=<c:out value="${ requestScope.searchContent }" />&currentPage=<c:out value="${ requestScope.pi.currentPage - 1 }"/>'">&lt</button>
					</c:if>
					
					<!-- page number button appear condition -->
					<c:forEach var="p" begin="${ requestScope.pi.startPage }" end="${requestScope.pi.endPage }" step="1">
						<c:if test="${ requestScope.pi.currentPage eq p}">
							<button disabled><c:out value="${ p }"/></button>
						</c:if>
						<c:if test="${ requestScope.pi.currentPage ne p }">
							<button onclick="location.href='${ pageContext.request.contextPath }/selectEvent.ed?searchTitle=<c:out value="${ requestScope.searchTitle }" />&searchContent=<c:out value="${ requestScope.searchContent }" />&currentPage=<c:out value="${ p }"/>'"><c:out value="${ p }"/></button>
						</c:if>
					</c:forEach>
					
					<!-- ">" button on/off condition -->
					<c:if test="${ requestScope.pi.currentPage >= requestScope.pi.maxPage }">
						<button disabled>&gt</button>
						<button disabled>&gt&gt</button>
					</c:if>		
					<c:if test="${ requestScope.pi.currentPage < requestScope.pi.maxPage }">
						<button onclick="location.href='${ pageContext.request.contextPath }/selectEvent.ed?searchTitle=<c:out value="${ requestScope.searchTitle }" />&searchContent=<c:out value="${ requestScope.searchContent }" />&currentPage=<c:out value="${ requestScope.pi.currentPage + 1 }"/>'">&gt</button>
						<button onclick="location.href='${ pageContext.request.contextPath }/selectEvent.ed?searchTitle=<c:out value="${ requestScope.searchTitle }" />&searchContent=<c:out value="${ requestScope.searchContent }" />&currentPage=<c:out value="${ requestScope.pi.maxPage }"/>'">&gt&gt</button>
					</c:if>
				</div>
				
				<div class="searching-area">
					
                    <select name="category">
						<option value="searchTitle" <c:if test="${ !empty requestScope.searchTitle }">selected</c:if>>제목</option>							
						<option value="searchContent" <c:if test="${ !empty requestScope.searchContent }">selected</c:if>>내용</option>							
                    </select>
		
					<input id="searchText" type="text" placeholder="" style="float: right;"> <input
					id="searchBtn" type="image" style="float: right;"
					src="${pageContext.request.contextPath }/resources/images/board/magnifier.png">
				</div>
				
			</article>
			
			<!-- side bar -->
			<aside>
				<ul>
					<li><a href="${pageContext.request.contextPath }/selectEvent.ed">반려동물교육</a></li>
					<li><a href="${pageContext.request.contextPath }/views/education/trainingClip.jsp">교육영상</a></li>
					<li><a href="${pageContext.request.contextPath }/selectMaterials.ed">자료</a></li>
				</ul>
			</aside>
			
		</section>
		
		<!-- fotter -->
		<footer>
			<jsp:include page="/views/common/footer.jsp"></jsp:include>
		</footer>

	</div>
	<script>
	$(".thumb-list").mouseenter(function() {
		$(this).children().each(function() {
			$(this).css({
				"color" : "#3C43F0",
				"cursor" : "pointer"
			});
		})
	}).mouseout(function() {
		$(this).children().each(function() {
			$(this).css({
				"color" : "#5E5E5E"
			});
		})
	}).click(function() {
		var num = $(this).find("input").val();
		location.href = "${ pageContext.request.contextPath }/selectDetailEvent.ed?num=" + num;
	});
	
	//search function
	$("#searchBtn").click(function() {
		searchingFor = $("#searchText").val();
		category = $("select[name=category]").val();
		var searchTitle = "";
		var searchContent = "";
		switch (category) {
		case "searchTitle" : searchTitle = searchingFor; break;
		case "searchContent" : searchContent = searchingFor; break;
		};
		
		location.href = "${ pageContext.request.contextPath }/selectEvent.ed?searchTitle=" + searchTitle + "&searchContent=" + searchContent; 
	});
	</script>
	
	
	
	
	
</body>
</html>