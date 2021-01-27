<jsp:directive.page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
	width:115px;
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
	height:auto
}
.coreValue {
	/* background-color:plum; */
	border:solid #3742fa;
	border-width:0px 0px 2px;
	margin-bottom:20px;
	padding-bottom:20px;
}
[id*='coreValue'] {
	/* border:2px solid black; */
	vertical-align:text-top;
	text-align:center;
	display:inline-block;
	width:47%;
	height:100%;
	color:#929292;
	font-size:10px;	
	margin:5px 5px 5px
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
aside>ul>li:nth-child(2) a{
	color: #3742fa;
	font-weight:bold;
	border: solid #3742fa;
	border-width: 0px 0px 2px;
}
img {
	width:inherit;
	max-width:70%;
	align:center;
}
.description {
	text-size:40px;
	margin-bottom:100px;
}
</style>

</head>
<body>
	
	<div id="wrapper">
	
		<!-- header -->
			<jsp:include page="/views/common/header.jsp"/>

		
		<!-- page title -->
			<div id="title">
				<h2>미션 / 비전</h2>
			</div>
		
		<!-- contents -->
		<section id="contents">
			<article id="greetings">
				<h3>핵심가치</h3>
				<br>
				
				<div class="coreValue">
					<div id="coreValue1">
						<img src="${ pageContext.request.contextPath }/resources/images/introduction/missionVision1.png">
						<h2>유기견을 생명체로 존중하는 마음</h2>
						<p>지각 능력이 있는 존재인 유기견을 존중하는 마음을 갖습니다.</p>
					</div>
					<div id="coreValue2">
						<img src="${ pageContext.request.contextPath }/resources/images/introduction/missionVision2.png">
						<h2>문화로 정착되는 유기견 입양</h2>
						<p>한국사회에 문화적 토양으로서 유기견 입양 의식이 정착되도록 최선을 다합니다</p>
					</div>
					<div id="coreValue3">
						<img src="${ pageContext.request.contextPath }/resources/images/introduction/missionVision3.png">
						<h2>일상화된 반려견 교육 .</h2>
						<p>반려견 교육이 우리나라 문화와 사회에 일반적으로 널리 알려지도록 합니다</p>
					</div>
					<div id="coreValue4">
						<img src="${ pageContext.request.contextPath }/resources/images/introduction/missionVision4.png">
						<h2>협력과 성실</h2>
						<p>구성원들과의 합의된 의견을 토대로 활동을 전개하고, 이해당사자들과의 협력관계를 바탕으로, 지속가능한 유기견 보호를 구현합니다</p>
					</div>
				</div>
				<div class="description">
					<p>ANICARE는 인간에 의해 관리되는 모든 유기견들이 인도적인 대우를 받게 하고자 하며, 더 나아가 인간에 의해 이용되거나, 삶의 터전을 잃어가는 유기견의 수(數)와 종(種)을 줄여나감으로써, 인간과 유기견이 생태적 · 윤리적 조화를 이루며 살아가는 것을 목표로 합니다.</p>
				</div>
			</article>
			
			<!-- side bar -->
			<aside>
				<ul>
					<li><a href="${pageContext.request.contextPath }/views/introduction/introductionMain.jsp">인사말</a></li>
					<li><a href="${pageContext.request.contextPath }/views/introduction/missonVision.jsp">미션 / 비전</a></li>
					<li><a href="${pageContext.request.contextPath }/views/introduction/history.jsp">연혁</a></li>
					<li><a href="${pageContext.request.contextPath }/views/introduction/organogram.jsp">조직도</a></li>
					<li><a href="${pageContext.request.contextPath }/selectNoticeList.in">공지사항</a></li>
				</ul>
			</aside>
			
		</section>
		
		<!-- fotter -->
		<footer>
			<jsp:include page="/views/common/footer.jsp"></jsp:include>
		</footer>

	</div>
	
	
	
	
	
	
</body>
</html>