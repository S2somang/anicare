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
	width:95px;
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
aside>ul>li:nth-child(2) a{
	color: #3742fa;
	font-weight:bold;
	border: solid #3742fa;
	border-width: 0px 0px 2px;
.thumb-list {
	text-align:center;
	font-size:20px;
	font-weight:bold;
	color:#878787;
}
.contentTitle {
	padding-top:10px;
}
.detail {
	pading-top:20px;
	font-size:16px;
	font-weight:normal;
}

</style>

</head>
<body>
	
	<div id="wrapper">
	
		<!-- header -->
			<jsp:include page="/views/common/header.jsp"/>

		
		<!-- page title -->
			<div id="title">
				<h2>교육영상</h2>
			</div>
		
		<!-- contents -->
		<section id="contents">
			<article id="greetings">
				
				<!-- thumbnail-photo-list -->
				<div class="thumbnail-area" align="center">
				
					<div class="thumb-list">
								<p style="float:left;">
									<iframe width="560" height="315" src="https://www.youtube.com/embed/kDtSGxpekNc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
								</p>
	
								<p class="contentTitle">[강형욱과 함께하는 반려견 교육강좌]</p>
								<br>
								<p class="detail">1부｜초보 보호자를 위한 강아지의 첫 1년 세미나</p>
					</div>
					
					<div class="thumb-list" align="center" style="clear:left;">
							<p style="float:left;">
								<iframe width="560" height="315" src="https://www.youtube.com/embed/aFojR9xDl30" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
							</p>
								<p class="contentTitle">[ANICARE x 강형욱의 반려견 100초 강좌]</p>
								<br>
								<p class="detail">강아지 '기다려 교육' 기초 편｜강형욱의 10초 레시피</p>
						
						
					</div>
				
				
				</div>
				
				<div class="paging-area" align="center">

				</div>
				
				<div class="search-area" align="center">

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
	
	
	
	
	
	
</body>
</html>