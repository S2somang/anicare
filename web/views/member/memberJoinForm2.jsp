<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
	#fram {
		width: 100%;
		height: 1300px;
		margin: 0 auto;
	

	}
	table {
	border: 1px solid black;
	margin-left: auto;
	width: 700px;
	margin: auto;  

	border: 1px solid black;
	}
  td {
  		border: 1px solid black;
		text-align: center;
		height: 80px;
	}  
	
	#joinBtn, #goMain {
		display:inline-block;
		padding-right: 10px;
		height: 30px;
		width: 100px;
		size: 100px;
		font-size: 25px;
		
	}
	.radio {
		width: 15px;
		height: 15px;
		
	}
	
	#input {
		width:700px ;
		margin: 0 auto;
	}
	
	.selectedstyle {
		background-color: #F1F2FC;
		font-size: 17px;
	}
	
	.selectedsecond {
		
	}
	
	.tel {
		width: 100px;
		height: 37px;
	}
	
	input {
		width: 300px;
		height: 50px;
		font-size: 50px;
	}
	
</style>
<script>
	$(function(){
		$('td:first-child').css('text-align','center');
		$('td:first-child').addClass('selectedstyle');
		$('td:nth-child(2)').addClass('selectedsecond');
	});
	function changeView(value){
		 if(value=="0"){
			 location.href = "memberJoinForm.jsp";
		 }else if (value== "1"){
			 location.href = "memberJoinForm2.jsp";
		 }
		
	}
	
</script>
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<div >
		<br><br>
		<center><font size="5">기업 회원가입 양식</font></center>
		<form name="form1" method="post" >
			<div id="input">
<input type = "radio" name="ex" class="radio" value="1" id="gen" ><label for="gen" onclick="changeView(0)">일반화원</label>
		<input type = "radio" name="ex" value="2" class="radio"  onclick="changeView(1)" checked id="int"><label for="int">기업회원</label>
		
		
		<!-- &nbsp;&nbsp; <a href = "javascript:check()">확인</a> -->
			</div>
		</form>
		<br><br>
			<form id="joinForm" action="${applicationScope.contextPath }/insertMember2.me">
				<table align="center" style="text-align:center; margin:auto">
					<tr>
						<td>* 이름</td>
						<td><input type="text" maxlength="5" name="name"></td>
						<td></td>
					</tr>
					<tr>
						<td width="200px">* 아이디</td>
						<td><input type="text" maxlength="13" name="userId" id="userId"></td>
						<td width="100px"><div id="idCheck">중복확인</div></td>
					</tr>
					<tr>
						<td>* 비밀번호</td>
						<td><input type="password" maxlength="13" name="userPwd"></td>
						<td></td>
					</tr>
					<tr>
						<td>* 비밀번호 확인</td>
						<td><input type="password" maxlength="13" name="userPwd2"></td>
						<td><label id="pwdResult"></label></td>
					</tr>
					<tr>
						<td>* 사업자 등록 번호</td>
						<td><input type="text" name="bn"></td>
						<td><label id="nnResult"></label></td>
					
					</tr>
					<tr>
						<td>연락처</td>
						<td>
							<input type="text" maxlength="3" name="tel1" class="tel" size="2">-
							<input type="text" maxlength="4" name="tel2" class="tel" size="2">-
							<input type="text" maxlength="4" name="tel3" class="tel" size="2">
						
						</td>
						<td><label id="nnResult"></label>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="email" name="email"></td>
						<td></td>
					</tr>
					
					<tr>
						<td>주소</td>
						<td><input type="text" name="address1"></td>
						<td></td>
					</tr>
					<tr>
						<td>상세주소</td>
						<td><input type="text" name="address2"></td>
						<td></td>
					</tr>
					
				</table>
				<br><br>
				<div class="btns" align="center">
					<div id="goMain" onclick="goMain()">메인으로</div>
					<div id="joinBtn" onclick="insertMember();">가입하기</div>
				</div>
			
			</form>
			<br><br><br>
	
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
			function insertMember() {
				
				$("#joinForm").submit();
			
		}
		
		$("#idCheck").click(function(){
			var userId = $("#userId").val();
			console.log(userId);
			
			$.ajax({
				url: "${applicationScope.contextPath}/idCheck.me",
				type: "post",
				data: {userId: userId},
				success: function(data) {
					console.log(data);
					if(data == "possible"){
						alert("사용 가능한 아이디 입니다.");
					} else {
						alert("사용 불가능한 아이디 입니다.");
					}
				},
				error : function(err){
					console.log("실패!!");
				}
				
			});
			
		});
	</script>
</body>
</html>