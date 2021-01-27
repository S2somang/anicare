<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
	height: 100%;
}

#listArea {
	width: 100%;
	height: 100%;
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
	width: 12%;
}

#listArea tr td:nth-child(3) {
	width: 50%;
	text-indent: 10px;
}

#listArea tr td:nth-child(4) {
	text-align: center;
	width: 12%;
}

#listArea tr td:nth-child(5), #listArea tr td:last-child {
	text-align: left;
	vertical-align: top;
	width: 12%;
}


.paging-buttons #backBtn{
    width: 50px;
    height: 20px;
    border-radius: 4px;
    font-size: 15px;
    color: #5e5e5e;
    box-shadow: 1px 1px 1px 1px;
    float:left;
    margin:7px 7px auto;
}
.paging-buttons #nextBtn {
    width: 50px;
    height: 20px;
    border-radius: 4px;
    font-size: 15px;
    color: #5e5e5e;
    box-shadow: 1px 1px 1px 1px;
    float:right;
    margin:7px 7px auto;
}
.paging-buttons #listBtn {
	width: 100px;
	height: 20px;
	border-radius: 4px;
    font-size: 15px;
    color: #5e5e5e;
    box-shadow: 1px 1px 1px 1px;
    float:center;
    margin:7px 7px auto;
}

.paging-buttons button:hover {
	background-color: #3C43F0;
	color: #FFFFFF;
	cursor: pointer;
}

#searchText {
	width: 80px;
	height: 25px;
	margin-top: 10px;
	outline: none;
}

#searchBtn {
	width: 22px;
	height: 22px;
	margin-top: 14px;
	margin-right: -80px;
	outline: none;
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
							<th width="100px"><c:out value="${ requestScope.notice.ncode }"/></th>
							<th width="100px"><c:out value="${ requestScope.notice.category }"/></th>
							<th width="300px"><c:out value="${ requestScope.notice.title }"/></th>
							<th width="100px">ANICARE</th>
							<th width="100px"><c:out value="${ requestScope.notice.count }"/></th>
							<th width="150px"><c:out value="${ requestScope.notice.date }"/></th>
						</tr>
						<tr>
							<td colspan='6' rowspan='9'>
								<c:out value="${ requestScope.notice.content }"/>
							</td>
						</tr>

					</table>
				</div>

				<div class="paging-buttons" align="center">
					<button id="backBtn">이전</button>
					<button id="listBtn">목록으로</button>
					<button id="nextBtn">다음</button>
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
		$("#backBtn").click(function() {
			console.log("searchBtn click test");
			location.href = "${ pageContext.request.contextPath }/selectOneNotice.in?num=" + (${ requestScope.notice.ncode } - 1); 
		});
		$("#listBtn").click(function() {
			location.href = "${ applicationScope.contextPath }/selectNoticeList.in";
		});
		$("#nextBtn").click(function() {
			location.href = "${ pageContext.request.contextPath }/selectOneNotice.in?num=" + (${ requestScope.notice.ncode } + 1);
		});

		$(".table-area td").mouseenter(function() {
			$(this).parent().children().each(function() {
				$(this).css({
				});
			})
		}).mouseout(function() {
			$(this).parent().children().each(function() {
				$(this).css({
					"color" : "#5E5E5E"
				});
			})
		})
	</script>

</body>
</html>