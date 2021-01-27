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
	width:50px;
	font-size:24px;
	border:solid #3742fa;
	border-width:0px 0px 2px
}

#contents {
	font-color:#453f3fl;
	/* background-color:gold; */
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
aside>ul>li:nth-child(1) a{
	color: #3742fa;
	font-weight:bold;
	border: solid #3742fa;
	border-width: 0px 0px 2px;
}
#greetings {
	color:#453f3fl;	
	/* background-color:coral; */
	width:80%;
	height:auto
}
#content {
	color:#453f3fl;
	font-size:18px;		
}
	#bossSign {
	text-align:right;
	font-size:30px;
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
				<h2>소개</h2>
			</div>
		
		<!-- contents -->
		<section id="contents">
			<article id="greetings">
				<h3>인사말</h3>
				
				<div>
					<img src="${pageContext.request.contextPath }/resources/images/introduction/greetings.png" alt="greetingDog">
				</div>
				<div id="content">
				<p>인간과 동물의 관계를 떠나, 자연의 법칙에 의해 탄생된 모든 생명은 생명자체로서 보호받고 존중받을 권리가있습니다.
				 한 생명의 태어남과 죽음에는 숭고함과 엄숙함이 존재합니다.<br><br>
				 ANICARE는 유기견 보호운동에 대한 사회 인식과 기반이 전혀 마련되어 있지 않던 2020년에 자원봉사를 구성해
				 활동을 해 나가던 중, 그 한계를 넘어서기를 바라는 회원들의 마음을모아 2020년에 유기견 보호운동단체로서는처음
				 서울에 사무실을 마련하였고 상근활동가를 구성하는 등 유기견 보호운동의 체계화를 구축하기 시작했습니다.<br><br>
				 
				 ANICARE는 우리 사회에 ‘유기견 입양 문화’를 선도해 나갔고, 유기견보호 관련법 개정 및 제정,
				  유기견복지 활동 등 다양한 영역에서 활발한 활동을 하고 있습니다. 이 모든 것은 유기견들이 
				  보다 더 나은 삶을 살기를 바라는 따뜻한 마음들이 모여져 가능할 수 있었습니다. 
				  오늘날 전세계적으로 70억여 마리의 유기견들이 인간에 의해 태어나고 죽음에이르고 있습니다. <br><br>
				  
				  그 과정에서 유기견이 고통과 감성을 느끼는 존재라는 것은 고려되지 않아, 유기견들은 태어나는
				   순간부터 본연의 습성이 차단된 채 비좁은 우리에서 갇혀 살다가 고통스러운 과정을 거쳐 생을
				    마감하게 됩니다. 우리 미래 세대에게 진정한 가치 사회를 이어주고 동물들이 웃을 수 있는 사회가
				     되기 위해 동물자유연대가 최선의 노력을 하겠습니다. ANICARE에 지속적인 관심과 격려로 함께 해주세요. 
				     
				 <br><br><br>
				 <p2 id="bossSign">대표 애니케어</p2>
				 <br><br><br><br>
				 
				 
				 </p>
				</div>
			</article>
			
			<!-- side bar -->
			<aside>
				<ul>
					<li><a href="${pageContext.request.contextPath }/views/introduction/introductionMain.jsp">인사말</a></li>
					<li><a href="${pageContext.request.contextPath }/views/introduction/missonVision.jsp">미션 / 비전</a></li>
					<li><a href="${pageContext.request.contextPath }/views/introduction/history.jsp">연혁</a></li>
					<li><a href="${pageContext.request.contextPath }/views/introduction/organogram.jsp">조직도</a></li>
					<li><a href="${applicationScope.contextPath }/selectNoticeList.in">공지사항</a></li>
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