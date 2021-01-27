<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
.from {
	margin-top: 50px;
	width: 100%;
	height: 700px;
	
	text-align: center;
}

#loginbtn {
	height: 78px;
	width: 472px;
	background-color: blue;
	color: white;
	border-radius: 12px;
	font-size: 28px;
	
	
	
}
.btn {
	width: 472px;
	 margin: 0 auto;
}

label {
	font-size: 26px;
}

table {
	width: 300px;
	height: 100px;
}

#userId , #userPwd{
	width: 475px;
	heigth: 30px;
	font-size: 30px;
	outline:none;
	
}


.area>div {
	float: left;
	display: inline;
	margin-left: auto;
	padding-left: 50px;
	padding-bottom: 50px;
}

.area {
	margin: 0 auto;
	width: 475px;
	height: 30px;
}

#buttom  {
	
	
	width: 100%;
	height: 200px;
	margin: 0 auto;
	padding-left: 20%;
	float: left;
	
}

#right > button {
	height: 50px;
	width: 100%;
	color: #5E5E5E;
	background-color:white; 
	border: 1px solid black;
	
	
}

#buttom > div {

	
	float: left;
	margin: 0 auto;
}
#left {
	padding-left: 5%;
	height: 150px;
	width:37%;
}

#right {
	padding-top: 60px;
	height: 150px;
	width: 10%;
}

#banner {
	padding-top: 30px;
	height: 100px;
	width: 100%;

	text-align: center;
}




</style>
	<script>
		function findId() {
			window.open("findById.jsp", "아이디로 화원 찾기", "width=400, height=200, left=420em, top=200em");
			
		}

	</script>



</head>
<body>
	<jsp:include page="/views/common/header.jsp" />

	<div class="from">
		<font size="50" align="center" color="#5E5E5E">Login</font> <br><br><br>
		<br><br><br><br>
		<form id="loginForm"
			action="${ applicationScope.contextPath }/login.me" method="post">
			<table style="margin-right: auto; margin-left: auto;">
				<tr>
					<td><label class="label"><font color="#5E5E5E">아이디
								: </font></label></td>
				</tr>
				<tr>
					<td><input type="text" id="userId" name="userId"></td>
				</tr>
			</table>
			<br>
			<table style="margin-right: auto; margin-left: auto;">
				<tr>
					<td><label class="label"><font color="#5E5E5E">비밀번호
								: </font></label></td>
				</tr>
				<tr>
					<td><input type="password" id="userPwd" name="userPwd"></td>
				</tr>
			</table>
			<br>
			<br>
  

			<div class="area">
				<div>
					<input type="checkbox" name="chk_autoLogin" value="ckAuto"
						id="auto">&nbsp;<label for="auto"><font size="4"
						color="#5E5E5E">로그인 유지 </font></label>
				</div>

				<div id="findId" onclick="findId();">
					<font size="4" color="#5E5E5E"> 아이디 찾기 </font>
				</div>
				<div id="findPwd" onclick="findPwd();">
					<font size="4" color="#5E5E5E">비밀번호 찾기</font>
				</div>
			</div>




			<div class="btn">
				<button id="loginbtn">로그인</button>
			</div>
			<br>
			<div id="findPwd" onclick="findPwd();">
				<font size="4">아직회원이 아니신가요? </font><font size="4" color="#5E5E5E">회원가입</font>
			</div>
		</form>
	</div>
	<hr align="center" style="width:70%">
	<div id="buttom">
		<div id="left">
		<br>
		<font size="5" color="blue">후원자인데 로그인 아이디가 없으신가요? </font>
			<br><br>
			<font size="2" color="#5E5E5E">후원신청시 작성하신 휴대폰 또는 이메일 정보로 인증을 받으신 후 로그인아이디를 생성하실 수 있습니다.</font><br>
			<font size="2" color="#5E5E5E">로그인 후에는 후원정보 수정, 납부내역 조회 등의 서비스를 이용하실수 있습니다.</font>
			
		</div>
		<div id="right"><button>아이디 만들기</button></div>
	</div>

	<hr align="center" style="width:70%; border: solid 1px blue;">
	
	<div id="banner"><font size="3" color="#5E5E5E">후원에 대해 궁금한 사항은 <font size="3" color="black">회원.모금팀 010-3231-5959 / 02-3424-2334 / info@anicare.org</font>로 문의해 주시기 바랍니다.</font></div>
	
	
	<jsp:include page="/views/common/footer.jsp" />
	

	
</body>
</html>


