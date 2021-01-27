<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
#container {
	width: 1500px; 
	height: 1000px;

	overflow: hidden;
	margin: 0 auto;
	
}

#left{
    width: 220px;
    /* background: pink; */
    box-shadow: 0 1px 7px rgb(0 0 0 / 20%);
    height: 800px;
    float: left;
    overflow: auto;
    padding: 50px 32px 0 20px;
}

#right{float: left;
	margin-left: 10px;
	height: 800px;
	width: 70%;
	overflow: hidden;
	padding-left: 60px;
	padding-top: 100px;
	
}
#top {
	text-align: left;
	font-size: 40px;
	height: 70px;
	padding: 100px 0 0 0;
	color : blue;
	font-weight: bold;
}

.icon > div{
 padding-top : 10px;
 height: 140px;
 width: 220px;
 float: left;
}
.icon > div:nth-child(1) {
 border-right: 1px solid #929292;

}

.icon > div:nth-child(2) {
 border-right: 1px solid #929292;

}
.icon > div:nth-child(3) {
 border-right: 1px solid #929292;

}


.icon :nth-child(1) div{
	height: 500px;
	width: 200px;
}
#menu {

	height: 150px;
	width: 890px;
	

}
#left ul > li> a:nth-child(n) {
	color: #929292;
	 padding: 2 0 0.8 3em;
	 font-size: 18px;
	
	 
	 
}
#left ul > li:first-child {
	color: #5E5E5E;
	 padding: 1em 0 0.5em 2em;
	 font-size: 20px;
}
#left ul:nth-child(9) > li:last-child >a  {
		 font-size: 20px;
	  padding: 5px 0 5px 0;
	 	color: #5E5E5E;
}
#left ul:nth-child(n) > li:last-child  :last-child :last-child  {
		 font-size: 20px;
		padding: 0 0 50px 30px;
	 	
}

#left > ul:first-child > li:first-child >a   {
	padding : 0 10px 0 0;
	font-size: 20px;
	
}




.icon :nth-child(n) img {
    	width: 50px;
    	height: 50px;
    	color: #929292;
    	
    	
    
}

.icon {
	
	padding: 90px 0 0 0;
	text-align: center;
}
.icon :nth-child(n) {
	padding:	30px 0 0 0;
}
#menu  img {
	

}
#menu div {
 	float: left;
}

#menu :nth-child(2) {
	width: 400px;
	height: 100px;

}

#menu div:nth-child(1)  {
	width: 300px;
	height: 150px;

}

#menu div:nth-child(1) :nth-child(1) {
		font-size: 30px;
		color: #5E5E5E;
		font-weight: bold;
		
}

#menu div:nth-child(1) :nth-child(1) >span {
		font-size: 30px;
		color: blue;
		
}

#menu div:nth-child(1) :nth-child(5) {
		font: 10px;
		color: #929292;
		
		
}
#footer {
	width: 1500px;
	height: 100px;

	margin: 0 auto;
	text-align: center;
	

}
#footer span {

	font-size: 15px;
	
}
#left > ul li > a:hover {
	color: blue;
}


</style>

</head>
<body>
	
	<jsp:include page="/views/common/header.jsp" />
	<hr>
	<div id="container">
	<div id="top">마이페이지</div>
	<hr  style = "border: solid 1px blue;">
		<div id="left">
		<ul>
			<li style ="color:blue">나의 후원</li>
		</ul>	
		<hr>
		<ul>
			<li>기본정보</li>
			<li><a
				href="${pageContext.request.contextPath }/views/member/myPageChangeInfo.jsp">기본정보 변경</a></li>
			<li><a
				href="${pageContext.request.contextPath }/views/member/changePassword.jsp">비밀번호 변경</a></li>
		</ul>
		<hr>	
		<ul>
			<li>후원정보</li>
			<li><a
				href="${ applicationScope.contextPath}/history.me">약정내역</a></li>
			<li><a
				href="${pageContext.request.contextPath }/views/member/supportMoney.jsp">납부정보 변경</a></li>
			<li><a
				href="${pageContext.request.contextPath }/views/member/myPageChangeInfo.jsp">후원금 납부 내역</a></li>
		</ul>
		<hr>	
		<ul>
			<li>출력서비스</li>
			<li><a
				href="${pageContext.request.contextPath }/views/member/myPageChangeInfo.jsp">기부금영수증</a></li>
		</ul>
		<hr>	
		<ul>
			<li><a
				href="${pageContext.request.contextPath }/views/member/myPageChangeInfo.jsp">탈퇴하기</a></li>
				
		</ul>
		<hr>	
		
		</div>
		<div id="right">
				<div id="menu">
					<div>
						<span><c:out value="${ sessionScope.loginUser.name }" />님의<span> 후원</span> </span><br><br><br>
						<span> <c:out value="${ sessionScope.loginUser.name }"/>님 반갑습니다.<br>
						<c:out value="${ sessionScope.loginUser.name }"/>님의 기부생일은 2020-08-09입니다.</span>
					</div>
					<div></div>
					<div><img  src="${pageContext.request.contextPath }/resources/images/member/myPageIconDog.png" ></div>
				</div>
				<hr>
			<div class="icon">
				<div>
					<img src="${pageContext.request.contextPath }/resources/images/member/myPageIcon1.png"><br><br>
					<span>후원 시작일 </span><br>
					<span>${requestScope.myPage.date}</span>
				</div>
				<div>
					<img src="${pageContext.request.contextPath }/resources/images/member/myPageIcon2.png"><br><br>
					<span>정기약정 </span><br>
					<c:set value = "${ requestScope.myPage.pMoney }" var = "pMoney" /> 
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${pMoney}" var="fmtPmoney"/>
					<span>${requestScope.myPage.pCount }건  ${fmtPmoney}원</span>
					
					
				</div>
				<div>
					<img src="${pageContext.request.contextPath }/resources/images/member/myPageIcon3.png"><br><br>
					<span>납부정보 </span><br>
					<span>--></span>
				</div>
				<div>
					<img src="${pageContext.request.contextPath }/resources/images/member/myPageIcon4.png"><br><br>
					<span>총 일시후원금액</span><br>
					<c:set value="${requestScope.myPage.tMoney }" var = "tMoney"/> 
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${tMoney }" var="fmtTmoney"/>
					<span> ${ fmtTmoney }원</span>
				</div>
			</div>
			
		
		</div>
		
		
		
	</div>
	<div id="footer">
		<hr style = "border: solid 1px blue;">
		<br>
		
		<span>후원에 대해 궁금한 사항은<b> 회원.모금팀 010-3231-5959 / 070-2993-1929 / info@anicare.org </b>로 문의해 주시기 바랍니다. </span>
	
		
	</div>
		<jsp:include page="/views/common/footer.jsp" />
	<script>
		$(function() {
			$(".side").hide(); //워여
			$(window).on("scroll", function() {
				var scroll = $(this).scrollTop();
				//console.log(scroll); 
				/* 스크롤 -> 471px */

				if ($(this).scrollTop() >= 80000) {
					$(".side").show();
				} else {
					$(".side").hide();
				}
			});
		});
		   
	</script>
		
</body>
</html>