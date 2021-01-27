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
	width:68px;
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
aside>ul>li:nth-child(4) a{
	color: #3742fa;
	font-weight:bold;
	border: solid #3742fa;
	border-width: 0px 0px 2px;
}
img {
	width:inherit;
	max-width:100%;
}
</style>

</head>
<body>
	
	<div id="wrapper">
	
		<!-- header -->
			<jsp:include page="/views/common/header.jsp"/>

		
		<!-- page title -->
			<div id="title">
				<h2>조직도</h2>
			</div>
		
		<!-- contents -->
		<section id="contents">
			<article id="greetings">
				<img src="${pageContext.request.contextPath }/resources/images/introduction/organogram.png">
			
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