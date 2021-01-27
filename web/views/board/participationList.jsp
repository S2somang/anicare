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
	.content_area {
		width: 70%;
		height: 80%;
		margin: 0 auto;
		margin-top: 30px;
		margin-bottom: -35px;
	}
	hr {
		display: inline-block;
	}
	
	#color_hr {
		width: 110px;
	}
	.board_list_area {
		width: 80%;
		height: 80%;
		margin: 0 auto;
	}
	.board_list {
		width: 50%;
		height: 100%;
		float: left;
	}
	
	.board_element1, .board_element2 {
		width: 60%;
		height: 30%;
		margin: 0 auto;
		margin-bottom: 60px;
		border: 1px solid #C4C4C4;
	}
	.board_element2 {
		margin-top: 120px;
	}
	img {
		width: 100%;
		height: 100%;
	}
	.btn_wrapper {
		width: 50%;
		height: 25%;
		margin: 0 auto;
		margin-top: 5px;
	}
	button {
		width: 100%;
		height: 100%;
		outline: none;
		background-color: #3C43F0;
	}
</style>
</head>
<body>
	<jsp:include page="/views/common/header.jsp"/>
	<div class="content_area">
		<!-- hr area -->
		<span style="font-size:25px;">참여하기</span>
		<div class="hr_area" style="float:clear;">
			<hr id="color_hr" color="#3C43F0"/><hr id="normal_hr" color="#C4C4C4"/>
		</div><br/>
		<!-- board_list_area start -->
		<div class="board_list_area">
			<!-- board_list1_area start  -->
			<div class="board_list">
				<div class="board_element1">
					<img src="${pageContext.request.contextPath }/resources/images/board/boardFree.png" alt="자유게시판"/>
					<div class="btn_wrapper">
						<button>
							<span style="font-size: 15px; color: #FFF;">자유게시판</span>
						</button>
					</div>
				</div>
				<div class="board_element2">
					<img src="${pageContext.request.contextPath }/resources/images/board/boardMissing.png" alt="실종게시판"/>
					<div class="btn_wrapper">
						<button><span style="font-size: 15px; color: #FFF;">실종게시판</span></button>
					</div>
				</div>
			</div>
			<div class="board_list">
				<div class="board_element1">
					<img src="${pageContext.request.contextPath }/resources/images/board/boardAdoption.png" alt="입양후기"/>
					<div class="btn_wrapper">
						<button><span style="font-size: 15px; color: #FFF;">입양후기</span></button>
					</div>
				</div>
				<div class="board_element2">
					<img src="${pageContext.request.contextPath }/resources/images/board/boardVolunteer.png" alt="봉사하기"/>
					<div class="btn_wrapper">
						<button><span style="font-size: 15px; color: #FFF;">봉사하기</span></button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
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
		
		$("button").mouseenter(function() {
			$(this).css({"cursor":"pointer"});
		}).click(function() {
			var text = $(this).children().text();
			var path = "";
			switch(text) {
			case '자유게시판':
				path = "/selectFreeBoardList.bo";
				break;
			case '입양후기':
				path = "/selectAdoptionBoardList.bo";
				break;
			case '실종게시판':
				path = "/selectMissingBoardList.bo";
				break;
			case '봉사하기':
				path = "volunteerBoard.jsp";
				break;
			}
			location.href="${pageContext.request.contextPath}" + path;
		});
		
		$(".board_element1, .board_element2").click(function(e) {
			var src = e.target.src;
			var path = "";
			if(src.includes("Free")) {
				path = "/selectFreeBoardList.bo";
			}
			else if(src.includes("Missing")) {
				path = "/selectMissingBoardList.bo";
			}
			else if(src.includes("Adoption")) {
				path = "/selectAdoptionBoardList.bo";
			}
			else if(src.includes("Volunteer")) {
				path = "volunteerBoard.jsp";
			}
			location.href="${pageContext.request.contextPath}" + path;
		}).mouseenter(function() {
			$(this).css({"cursor":"pointer"});
		});
	</script>
</body>
</html>