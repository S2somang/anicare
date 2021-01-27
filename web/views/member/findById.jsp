<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디로 회원 찾기</title>
<style>
	#frame {
		height: 250px;
		width:800px;

		position: absolute;
		top: 8%;
		left: 14%;
		text-align: center;
		
	}
	.f1 {
		float:left ;
		padding-bottom:10px;
		
		
		
	}
	.in {
		clear:both;	
		
		width: 600px;
		margin: 0 auto;
		

	}
	#d1 {
		padding-left: 200px;
	}
	#d2 {
		padding-left: 100px;
	
	}
	
	#phone{
		height: 30px;
	
		width: 120px;
	}
#t1{
	height: 30px;
	
		width: 320px;

	text-align: left;
	
}
button {
	width: 150px;
	height: 50px;
	background-color: blue;
	color:white;
	border-radius: 12px;
	border: 0;
	
}

.co {
	color: #5E5E5E;
}
	
</style>


</head>
<body onload="window.resizeTo(1000,600)">
		<div id="frame" align="center">
				
				<div class="f1" id="d1"><font size="5" color="#5E5E5E">아이디 찾기</font></div>
				 <div class="f1"  id="d2"><font size="5" color="#5E5E5E">비밀번호 찾기</font></div>
				<hr align="center" style="width:100%;">
				<br><br><br>	
				<div class="in">
				
					<div><input type="radio"><lable class="co">휴대폰 번호로 찾기 </lable> &nbsp;&nbsp;
						 <input type="radio"><label class="co">이메일로 찾기</label>	
					</div>
					<hr>	
					<div>
						<table>
							<tr>
								<td width="140px" height="70px"><b>이름 : </b></td>
								<td align="left">&nbsp;&nbsp;<input id="t1" type="text"></td>
							</tr>
							<tr>
								<td width="140px" height="70px"><b>휴대폰번호 : </b></td>
								<td>&nbsp;&nbsp;<input type="text" id="phone">&nbsp;-&nbsp;<input type="text" id="phone">&nbsp;-&nbsp;<input type="text" id="phone"></td>
							</tr>
							
						</table>
					</div>
					<hr>
				</div>
				<br>
				<div>	<button><b>아이디 확인</b></button> </div>
				<br>
					<font color="#5E5E5E" size="2">후원신청시 작성하신 휴대폰 또는 이메일 또는 정보를 입력하시면 아이디를 확인하실 수 있습니다. </font><br>
					<font color="#5E5E5E" size="2">아이디 찾기에 어려움이 있으실 경우 010-3231-5959 / 010-3442-4423 </font><br>
						<font color="#5E5E5E"  size="2" >ani@anicare.org로 문의해주시기 바랍니다.</font>
	
				  	
				
		</div>
		
</body>
</html>