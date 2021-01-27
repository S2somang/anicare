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
aside>ul>li:nth-child(3) a{
	color: #3742fa;
	font-weight:bold;
	border: solid #3742fa;
	border-width: 0px 0px 2px;
}
table {
	/* border:1px solid black; */
}
td {
	/* border:1px solid black; */
}
.month {
	vertical-align:top;
	color:#878787;
}
#longCol {
	/* background-color:peru; */
	width:20px;
}
</style>

</head>
<body>
	
	<div id="wrapper">
	
		<!-- header -->
			<jsp:include page="/views/common/header.jsp"/>

		
		<!-- page title -->
			<div id="title">
				<h2>연혁</h2>
			</div>
		
		<!-- contents -->
		<section id="contents">
			<article id="greetings">
				<table>
					<tr>
						<td rowspan='5' class='month'>2020년 8월</td>
						<td rowspan='21' id="longCol"></td>
						<td>2020년 ANICARE 봉사대 [소망이네 보호소] 시작</td>
					</tr>
					<tr>
						<td>2020년 시민구조치료지원 신청 시작</td>
					</tr>
					<tr>
						<td>유기견 안락사 성명</td>
					</tr>
					<tr>
						<td>ANICARE 새 로고(CI) 공개</td>
					</tr>
					<tr>
						<td>유기견을 위해 연동형 비례대표제 도입요구 공동 성명</td>
					</tr>
					<tr>
						<td rowspan='5' class='month'>2020년 7월</td>
						<td>2020년 상반기 시민 크리에이터 모집    </td>
					</tr>
					<tr>
						<td>20120년 상반기 ANICARE 반려견 교육 신청 시작</td>
					</tr>
					<tr>
						<td>올무에 목 졸려 죽게 한 행위, 유기견학대죄 고발장 제출</td>
					</tr>
					<tr>
						<td>ANICARE 아카이브 오픈</td>
					</tr>
					<tr>
						<td>2020년 ANICARE 정기총회</td>
					</tr>
					<tr>
						<td rowspan='11' class='month'>2020년 6월</td>
						<td>2020 전국 대학 유기견 심포지엄</td>
					</tr>
					<tr>
						<td>불법 개농장 폐쇄 및 개식용 종식 발의법안 통과 촉구 기자회견</td>
					</tr>
					<tr>
						<td>벌교 폐업 개농장 구조 프로젝트 [뜬장에서 가정으로] 시작</td>
					</tr>
					<tr>
						<td>[묻다] 출판 기념 전시회</td>
					</tr>
					<tr>
						<td>[내 손으로 들어내자, 불법 개농장!] 미신고된 개농장 고발 액션</td>
					</tr>
					<tr>
						<td>고돌북스 생명토크 [사랑할까, 먹을까]</td>
					</tr>
					<tr>
						<td>유기견 친구들과 함께 하는 ANICARE의 착한여행</td>
					</tr>
					<tr>
						<td>먹는개 귀동이 상영회</td>
					</tr>
					<tr>
						<td>유기견 척추 골절 동물학대 사건 엄정 수사 및 엄벌 촉구 서명 운동</td>
					</tr>
					<tr>
						<td>대학 유기견 돌봄 사업 종료</td>
					</tr>
					<tr>
						<td>1:1 결연 만남의 날 [보고 싶었어, 널 보러갈게!]</td>
					</tr>
					
				</table>
				
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