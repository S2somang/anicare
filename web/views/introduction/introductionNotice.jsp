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
html, body, #wrapper{
	height: 100%;
}
#title {
	/* background-color:magenta; */
	height: 36px;
	margin-top: 30px;
	margin-left: 17%;
	margin-right: 17%;
	border: solid #878787;
	border-width: 0px 0px 2px
}

#title>h2 {
	width: 89px;
	font-size: 24px;
	border: solid #3742fa;
	border-width: 0px 0px 2px
}

#contents {
	font-color: #453f3fl;
	/* background-color: gold; */
	height:90%;
	margin-top: 30px;
	margin-left: 17%;
	margin-right: 17%;
}

article, aside {
	float: left;
}

article>h3 {
	color: #453f3fl;
	font-weight: bold;
	font-size: 24px;
}

#greetings {
	color: #453f3fl;
	/* 	background-color:coral; */
	width: 80%;
	height: 65%;
	margin-bottom: 50px;
}

aside {
	/* background-color:khaki; */
	width: 16%;
	height: 400px;
	margin-left: 4%;
}

aside>ul>li {
	height: 40px;
	font-size: 20px;
	color: #878787;
}
aside>ul>li:nth-child(5) a{
	color: #3742fa;
	font-weight:bold;
	border: solid #3742fa;
	border-width: 0px 0px 2px;
}

.table-area {
	height: 60%;
}

#listArea {
	width: 100%;
	height: auto;
	border-collapse: collapse;
	border-left: 0px solid #FFFFFF;
	border-right: 0px solid #FFFFFF;
}

tr, td {
	color: #5E5E5E;
	font-size: 15px;
	border-top: 1px solid #C4C4C4;
	border-bottom: 1px solid #C4C4C4;
	border-right: 0px solid #FFFFFF;
	border-left: 0px solid #FFFFFF;
}

#listArea tr:first-child {
	height: 7%;
}

#listArea tr td:first-child {
	text-align: center;
	width: 10%;
}

#listArea tr td:nth-child(2) {
	text-align: center;
	width: 10%;
}

#listArea tr td:nth-child(3) {
	width: 45%;
	text-indent: 10px;
}

#listArea tr td:nth-child(4) {
	text-align: center;
	width: 10%;
}
#listArea tr td:nth-child(5) {
	text-align: center;
	width: 10%;
}

#listArea tr td:nth-child(6), #listArea tr td:last-child {
	text-align: center;
	width: 15%;
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
		<jsp:include page="/views/common/header.jsp" />


		<!-- page title -->
		<div id="title">
			<h2>공지사항</h2>
		</div>

		<!-- contents -->
		<section id="contents">
			<article id="greetings">
				<div class="table-area" align="center">
					<table id="listArea">
						<tr>
							<th width="100px">글번호</th>
							<th width="100px">카테고리</th>
							<th width="300px">제목</th>
							<th width="100px">작성자</th>
							<th width="100px">조회수</th>
							<th width="150px">작성일</th>
						</tr>
						<c:forEach var="n" items="${ requestScope.list }">
							<tr>
								<td><c:out value="${ n.ncode }"/></td>
								<td><c:out value="${ n.category }"/></td>
								<td><c:out value="${ n.title }"/></td>
								<td><c:out value="admin"/></td>
								<td><c:out value="${ n.count }"/></td>
								<td><c:out value="${ n.date }"/></td>
							</tr>
						</c:forEach>

					</table>
				</div>

				<div class="paging-area" align="center">
			
					<!-- "<<" button on/of condition -->
					<c:if test="${ requestScope.pi.currentPage <= 1 }">
						<button disabled>&lt&lt</button>
					</c:if>
					<c:if test="${ requestScope.pi.currentPage > 1 }">
						<button onclick="location.href='${pageContext.request.contextPath}/selectNoticeList.in?category=<c:out value="${ requestScope.category }" />&searchingFor=<c:out value="${ requestScope.searchingFor }" />&currentPage=1'">&lt&lt</button>
					</c:if>
					
					<!-- "<" button on/of condition -->
					<c:if test="${ requestScope.pi.currentPage <= 1 }">
						<button disabled>&lt</button>
					</c:if>
					<c:if test="${ requestScope.pi.currentPage > 1 }">
						<button onclick="location.href='${ pageContext.request.contextPath }/selectNoticeList.in?category=<c:out value="${ requestScope.category }" />&searchingFor=<c:out value="${ requestScope.searchingFor }" />&currentPage=<c:out value="${ requestScope.pi.currentPage - 1 }"/>'">&lt</button>
					</c:if>
					
					<!-- page number button appear condition -->
					<c:forEach var="p" begin="${ requestScope.pi.startPage }" end="${requestScope.pi.endPage }" step="1">
						<c:if test="${ requestScope.pi.currentPage eq p}">
							<button disabled><c:out value="${ p }"/></button>
						</c:if>
						<c:if test="${ requestScope.pi.currentPage ne p }">
							<button onclick="location.href='${ pageContext.request.contextPath }/selectNoticeList.in?category=<c:out value="${ requestScope.category }" />&searchingFor=<c:out value="${ requestScope.searchingFor }" />&currentPage=<c:out value="${ p }"/>'"><c:out value="${ p }"/></button>
						</c:if>
					</c:forEach>
					
					<!-- ">" button on/off condition -->
					<c:if test="${ requestScope.pi.currentPage >= requestScope.pi.maxPage }">
						<button disabled>&gt</button>
						<button disabled>&gt&gt</button>
					</c:if>		
					<c:if test="${ requestScope.pi.currentPage < requestScope.pi.maxPage }">
						<button onclick="location.href='${ pageContext.request.contextPath }/selectNoticeList.in?category=<c:out value="${ requestScope.category }" />&searchingFor=<c:out value="${ requestScope.searchingFor }" />&currentPage=<c:out value="${ requestScope.pi.currentPage + 1 }"/>'">&gt</button>
						<button onclick="location.href='${ pageContext.request.contextPath }/selectNoticeList.in?category=<c:out value="${ requestScope.category }" />&searchingFor=<c:out value="${ requestScope.searchingFor }" />&currentPage=<c:out value="${ requestScope.pi.maxPage }"/>'">&gt&gt</button>
					</c:if>
				</div>
				<div class="searching-area">
					
                    <select name="category">
						<option value="" <c:if test="${ requestScope.category eq '' }">selected</c:if>>== 카테고리 ==</option>							
						<option value="행사" <c:if test="${ requestScope.category eq '행사' }">selected</c:if>>행사</option>							
						<option value="점검" <c:if test="${ requestScope.category eq '점검' }">selected</c:if>>점검</option>							
						<option value="공고" <c:if test="${ requestScope.category eq '공고' }">selected</c:if>>공고</option>							
						<option value="발표" <c:if test="${ requestScope.category eq '발표' }">selected</c:if>>발표</option>							
						<option value="안내" <c:if test="${ requestScope.category eq '안내' }">selected</c:if>>안내</option>
                    </select>
		
					<input id="searchText" type="text" placeholder="제목 + 내용" style="float: right;"> <input
					id="searchBtn" type="image" style="float: right;"
					src="${pageContext.request.contextPath }/resources/images/board/magnifier.png">
				</div>


			</article>

			<!-- side bar -->
			<aside>
				<ul>
					<li><a
						href="${pageContext.request.contextPath }/views/introduction/introductionMain.jsp">인사말</a></li>
					<li><a
						href="${pageContext.request.contextPath }/views/introduction/missonVision.jsp">미션
							/ 비전</a></li>
					<li><a
						href="${pageContext.request.contextPath }/views/introduction/history.jsp">연혁</a></li>
					<li><a
						href="${pageContext.request.contextPath }/views/introduction/organogram.jsp">조직도</a></li>
					<li><a
						href="${pageContext.request.contextPath }/selectNoticeList.in">공지사항</a></li>
				</ul>
			</aside>

		</section>

		<!-- fotter -->
		<footer>
			<jsp:include page="/views/common/footer.jsp"></jsp:include>
		</footer>

	</div>

	<script>
		//categoty selection
		$("select[name=category]").change(function() {
			category = $("select[name=category]").val();
			location.href = "${ pageContext.request.contextPath }/selectNoticeList.in?category=" + category
			});
	
		//search function
		$("#searchBtn").click(function() {
			searchingFor = $("#searchText").val();
			category = $("select[name=category]").val();
			location.href = "${ pageContext.request.contextPath }/selectNoticeList.in?category=" + category + "&" + "searchingFor=" + searchingFor;
		});

		$(".table-area td").mouseenter(function() {
			$(this).parent().children().each(function() {
				$(this).css({
					"color" : "#3C43F0",
					"cursor" : "pointer"
				});
			})
		}).mouseout(function() {
			$(this).parent().children().each(function() {
				$(this).css({
					"color" : "#5E5E5E"
				});
			})
		}).click(function() {
			var num = $(this).parent().children().eq(0).text();
			
			console.log(num);
			
			location.href = "${ pageContext.request.contextPath }/selectOneNotice.in?num=" + num;
			
		});
		
		
	</script>






</body>
</html>