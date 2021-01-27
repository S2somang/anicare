<jsp:directive.page language="java"
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
	width: 60%;
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




.bt  > button{
	
	 background:#3C43F0;
  color:#fff;
  border:none;
  position:relative;
  height:50px;
  font-size:0.45em;
  padding:0 1em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
  border-radius: 20px;
  

  
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
    border-radius: 10px;

}
.bt > button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
    border-radius: 10px;

}
.bt > button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
    border-radius: 10px;

}


#left > ul:first-child > li:first-child >a   {
	padding : 0 10px 0 0;
	font-size: 20px;
	  border-radius: 10px;

	
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
				href="${pageContext.request.contextPath }/views/member/myPageChangeInfo.jsp" >기본정보 변경</a></li>
			<li><a
				href="${pageContext.request.contextPath }/views/member/changePassword.jsp">비밀번호 변경</a></li>
		</ul>
		<hr>	
		<ul>
			<li>후원정보</li>
			<li><a
				href="${pageContext.request.contextPath }/views/member/myPageChangeInfo.jsp" >약정내역</a></li>
			<li><a
				href="${pageContext.request.contextPath }/views/member/myPageChangeInfo.jsp" style ="color:blue">납부정보 변경</a></li>
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