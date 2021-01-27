a<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	padding-top: 50px;
	
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

#right > div:first-child {
	font-size: 32px;
	color: #5E5E5E;
	padding: 0 0  20px 0;

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

#info {
	float: left;
	
	width: 90%;
	height: 500px;

}


#ileft {
	
	height: 400px;
	width: 300px;
	border-right: 1px solid black;
	font-size: 21px;
	
}
 #iright{
	
	height: 400px;
	width: 500px;

	font-size: 20px;
	
}


.info {
	float: left;
}



#left > ul:first-child > li:first-child >a   {
	padding : 0 10px 0 0;
	font-size: 20px;
	
}

#ileft >ul > li:nth-child(n){
	
	padding: 7px 5px 5px 20px;
	color: #5E5E5E
}
#iright >ul > li:nth-child(n){
	color: #929292;
	padding: 8px 5px 5px 45px;
}

#ileft ul > li:nth-child(7) {
	padding: 52px 7px 5px 20px ;
		
}
.bt {clear: both;}

.bt  > button{
	
	 background:#3C43F0;
  color:#fff;
  border:none;
  position:relative;
  height:50px;
  font-size:1.3em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}

.bt > button:hover {
	 background:#fff;
  color:#3C43F0;
}

.bt > button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #3C43F0;
  transition:400ms ease all;
}
.bt > button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.bt > button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}


#iright > ul > li> input {
	height: 25px;
	width: 200px;
	font-size: 17px;
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
			<li><a
				href="${ applicationScope.contextPath }/MyPageResource">나의 후원</a></li>
		</ul>	
		<hr>
		<ul>
			<li>기본정보</li>
			<li><a
				href="${pageContext.request.contextPath }/views/member/myPageChangeInfo.jsp"  style ="color:blue">기본정보 변경</a></li>
			<li><a
				href="${pageContext.request.contextPath }/views/member/changePassword.jsp">비밀번호 변경</a></li>
		</ul>
		<hr>	
		<ul>
			<li>후원정보</li>
			<li><a
				href="${pageContext.request.contextPath }/views/member/supportHistory.jsp">약정내역</a></li>
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
		<c:set var="date" value="${sessionScope.ssn }"/>
		</div>
		<div id="right">
			<div>기본정보</div>
			<hr>
			<div id="info">
				<div id="ileft" class="info">
					<ul>
						<li>회원유형</li>
						<li>성명</li>
						<li>생년월일</li>
						<li>휴대전화번호</li>
						<li>이메일</li>
						<li>주소</li>
						
						<li>수신동의</li>
						<li>기부금영수증 신청</li>
					</ul>
				</div>
			<form action="${ applicationScope.contextPath }/modifyMyPage.me" method="post">
				<div id="iright" class="info">
					<ul>
						
					<c:choose>
						<c:when test = "${  sessionScope.loginUser.uType eq 'NOMAL' }">
							<li>개인</li>
						</c:when>
						<c:otherwise>
							<li>사업자</li>
						</c:otherwise>
					</c:choose>	
						<li> <c:out value="${ sessionScope.loginUser.name }" /></li>
						<c:set var="text" value="${ sessionScope.loginUser.ssn}"/>
								<c:set var="date" value="${fn:substring(text,0,2)}"/>
							<fmt:parseNumber var="year" type="number" value="${date }"/>
						
							<c:choose>	
							<c:when test="${year >20 }">
								<li>19${fn:substring(text,0,2)}년  ${fn:substring(text, 2, 4)}월 ${fn:substring(text,4,6) }일 </li>
							</c:when>
							<c:otherwise>
								<li>20${fn:substring(text,0,2)}년${fn:substring(text, 2, 4)}월 ${fn:substring(text,4,6) }일</li>
							</c:otherwise>
						</c:choose>
						<li> <input type="text" size="14" name="phone" value="${sessionScope.loginUser.phone }"/></li>
						<li><input type="text" size="30" name="email" value="${sessionScope.loginUser.email}"/></li>
						<li>[자택]</li>
						<li><input type="text" size="50" name="address"
                            value="${sessionScope.loginUser.address } "/></li>
						<li>수신 (자택)</li>
						<li>아니오</li>
					</ul>
				</div>
			</div>
			<div class="bt"><button>회원 수정 완료 </button></div>
		</form>
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