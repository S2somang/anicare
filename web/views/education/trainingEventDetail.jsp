<jsp:directive.page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
html, body {
	width:100%;
	height:100%;
}
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
	width:70%;
	heidht:100%;
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
.table-area {
	width: 100%;
	height: 100%;
}
.contentImg {
	width:auto;
	height:auto;
	max-width:100%;
	max-height:100%;
	
	
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
	width: 50%;
	text-indent: 10px;
}

#listArea tr td:nth-child(3) {
	text-align: center;
	width: 12%;
}
#listArea tr td:nth-child(4) {
	text-align: center;
	width: 12%;
}

#listArea tr td:nth-child(5), #listArea tr td:last-child {
	text-align: left;
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
				
				<!-- table here -->
				<div class="table-area" align="center">
					<table id="listArea">
						<tr>
							<th width="100px"><c:out value="${ requestScope.post.bCode }"/></th>
							<th width="300px"><c:out value="${ requestScope.post.title }"/></th>
							<th width="100px"><c:out value="${ requestScope.post.userId }"/></th>
							<th width="100px"><c:out value="${ requestScope.post.count }"/></th>
							<th width="150px"><c:out value="${ requestScope.post.bDate }"/> </th>
						</tr>
						<tr>
							<td colspan='6' rowspan='50'>
								<br>
								<img class="contentImg" src="${ pageContext.request.contextPath }/resources/images/education/<c:out value="${ requestScope.fileList[1].changeName }"/>">
								<br>
								<c:out value="${ requestScope.post.content }"/>
							</td>
						</tr>

					</table>
<%-- 					<table id="listArea">
						<tr>
							<th width="100px"><c:out value="${ requestScope.post.bCode }"/></th>
							<th width="300px">[서울시와 함께하는 2020 반려견 교육센터]</th>
							<th width="100px">ANICARE</th>
							<th width="100px">99,999</th>
							<th width="150px">2020.09.21</th>
						</tr>
						<tr>
							<td colspan='6' rowspan='50'>
								<br>
								[교육모집]서울시와 ANIICARE가 함께하는 서울반려동물교육센터 교육 2020
								<br>
								<img class="contentImg">
								<br>
								'슬기로운 반려생활을 원하시나요?'<br>
								 서울시와 ANICARE가 함께하는 서울반려동물교육센터 교육은 현대사회에서 우리와 함께 살아가는 반려동물과 반려동물을 기르고 있거나, 향후 기르고자 하는 일반시민을 위한 교육입니다. 반려동물과 안전하게 살아가기 위해 가장 필요한 교육 중 1)반려동물 행동교정, 2)반려동물 사회화 및 예절교육, 3)반려견 시민학교, 4)반려묘 시민학교까지 4가지 주제로 이루어져있습니다. 교육은 총 4~5회에 걸쳐 진행되며 각 분야 전문가에게 체계적인 돌봄교육 또는 정보교육을 무료로 받으실 수 있습니다.
								<br>
							</td>
						</tr>

					</table> --%>
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
	$("#backBtn").click(function() {
		console.log("searchBtn click test");
		location.href = "${ pageContext.request.contextPath }/selectDetailEvent.ed?num=" + (${ requestScope.post.bCode } - 1); 
	});
	
	$("#listBtn").click(function() {
		location.href = "${ pageContext.request.contextPath }/selectEvent.ed";
	});
	
	$("#nextBtn").click(function() {
		location.href = "${ pageContext.request.contextPath }/selectDetailEvent.ed?num=" + (${ requestScope.post.bCode } + 1);
	});
	</script>
	
	
	
	
	
</body>
</html>