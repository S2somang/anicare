<jsp:directive.page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	html, body {
		height: 100%;
	}
	#form_wrapper {
		width: 70%;
		height: 75%;
		margin: 0 auto;
		margin-top: 20px;
	}
	#writeForm {
		width: 100%;
		height: 100%;
	}
	.content_wrapper {
		width: 90%;
		height: 85%;
		margin: 0 auto;
		margin-top: 15px;
	}
	hr {
		display: inline-block;
	}
	#color_hr {
		width: 190px;
	}
	.wrapper {
		width: 100%;
		height: 8%;
	}
	.div_in_wrapper {
		float: left;
	}
	label {
		vertical-align: middle;
	}
	.label_area {
		width: 35%;
		height: 100%;
		text-indent: 35px;
		font-size: 20px;
		color: #5E5E5E;
	}
	.input_area {
		width: 65%;
		height: 100%;
	}
	.input_area input:first-child {
		width: 95%;
		height: 60%;
		margin-top: 4px;
		font-size: 15px;
		border: 1px solid #C4C4C4;
		text-indent: 10px;
		outline: none;
	}
	textarea {
		width: 95%;
		height: 20em;
		cols: 15;
		border: 1px solid #C4C4C4;
		resize: none;
		text-indent: 10px;
		outline: none;
	}
	.btn_wrapper {
		width: 85%;
		height: 6%;
		margin: 0 auto;
	}
	#writeBtn{
		width: 130px;
		height: 100%;
		font-size: 15px;
		outline: none;
		float: right;
		background-color: #3C43F0;
		margin-right: 20px;
		border: 0;
		border-radius: 8px;
		color: #FFFFFF;
	}
	#resetBtn {
		width: 130px;
		height: 100%;
		font-size: 15px;
		outline: none;
		float: right;
		background-color: #FFFFFF;
		border: 2px solid #3C43F0;
		border-radius: 8px;
		color: #3C43F0;
	}
</style>
</head>
<body>
	<jsp:include page="/views/common/header.jsp"/>
	<!-- form_wrapper area start -->
	<div id="form_wrapper">
		<form id="writeForm" action="${pageContext.request.contextPath }/insertFreeBoard.bo" method="post">
			<span style="font-size:25px;">자유게시판 글쓰기</span>
			<!-- hr area -->
			<div class="hr_area" style="float:clear;">
				<hr id="color_hr" color="#3C43F0"/><hr id="normal_hr" color="#C4C4C4"/>
			</div>
			
			<!-- content_wrapper area start -->
			<div class="content_wrapper">
				<!-- wrapper1 area start -->
				<div class="wrapper">
					<div class="label_area div_in_wrapper">
						<label>제목</label>
					</div>
					<div class="input_area div_in_wrapper">
						<input type="text" name="title">
					</div>
				</div>
				<!-- wrapper1 area end -->
				
				<!-- wrapper2 area start -->
				<div class="wrapper">
					<div class="label_area div_in_wrapper">
						<label>비밀번호</label>
					</div>
					<div class="input_area div_in_wrapper">
						<input type="password" name="password">
					</div>
				</div>
				<!-- wrapper2 area end -->
				
				<!-- wrapper3 area start -->
				<div class="wrapper">
					<div class="label_area div_in_wrapper">
						<label>비밀번호 확인</label>
					</div>
					<div class="input_area div_in_wrapper">
						<input type="password" name="password_check">
					</div>
				</div>
				<!-- wrapper3 area end -->
				
				<!-- wrapper4 area start -->
				<div class="wrapper">
					<div class="label_area div_in_wrapper">
						<label>작성자</label>
					</div>
					<div class="input_area div_in_wrapper">
						<input type="text" value="${sessionScope.loginUser.name }" name="name" readonly>
						<input type="hidden" value="${sessionScope.loginUser.userId }" name="userId"/>
					</div>
				</div>
				<!-- wrapper4 area end -->
				
				<!-- wrapper5 area start -->
				<div class="wrapper">
					<div class="label_area div_in_wrapper">
						<label>이메일</label>
					</div>
					<div class="input_area div_in_wrapper">
						<input type="email" name="email" value="${sessionScope.loginUser.email }" readonly>
					</div>
				</div>
				<!-- wrapper5 area end -->
				
				<!-- wrapper6 area start -->
				<div class="wrapper">
					<div class="label_area div_in_wrapper">
						<label>내용</label>
					</div>
					<div class="input_area div_in_wrapper">
						<textarea name="content" style="font-size: 15px; margin-top: 5px;"></textarea>
					</div>
				</div>
				<!-- wrapper6 area end -->
			</div>
			<!-- content_wrapper area end -->
			
			<!-- brn_wrapper area start -->
			<div class="btn_wrapper">
				<button id="resetBtn" onclick="return false;"><b>취소</b></button>
				<button id="writeBtn" onclick="return false;"><b>작성완료</b></button>
			</div>
		</form>
	</div><br/><br/><br/>
	<!-- form_wrapper area end-->
	<jsp:include page="/views/common/footer.jsp"/>
	<script>
		$(function() {
			var divWidth = $(".hr_area").width();
			var colorWidth = $("#color_hr").width();
			
			$("#normal_hr").css({"width":(divWidth-colorWidth-5)});
		});
		$(window).resize(function() {
			var divWidth = $(".hr_area").width();
			var colorWidth = $("#color_hr").width();
			
			$("#normal_hr").css({"width":(divWidth-colorWidth-5)});
		});
		$("#resetBtn").click(function() {
			$("#writeForm").trigger("reset");
			if(window.confirm("목록으로 이동하시겠습니까?")) {
				location.href="${pageContext.request.contextPath}/views/board/freeBoard.jsp";
			}
		}).mouseenter(function() {
			$(this).css({"cursor":"pointer"});
		});
		
		$("#writeBtn").click(function() {
			var flag = true;
			
			// Check All Input Data
			$("input:not(:hidden)").each(function() {
				if ($(this).val() === '') {
					flag = false;
				}
			});
			
			if (!flag) {
				alert("모든 값을 입력해주세요.");
				return;
			}
			
			// Check Content
			if($("textarea[name=content]").val() === '') {
				alert("내용을 입력해주세요");
				$("textarea[name=content]").focus();
				return;
			}
			
			var password = $("input[name=password]");
			var password_check = $("input[name=password_check]");
			
			/* If two password correspond & loginUser's password correspond */
			/* form submit() */
			var loginUserPw = '${sessionScope.loginUser.userPwd }';
			if ((password.val() === password_check.val()) 
					&& (loginUserPw === password.val()) 
					&& (loginUserPw === password_check.val())) {
				$("#writeForm").submit();
			}
			else {
				alert("비밀번호가 일치하지 않습니다.");
				password.val('');
				password_check.val('');
				password.focus();
			}
		}).mouseenter(function() {
			$(this).css({"cursor":"pointer"});
		});
	</script>
</body>
</html>