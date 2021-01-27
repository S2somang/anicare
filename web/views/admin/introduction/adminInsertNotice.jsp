<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <link rel="shortcut icon" href="#">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->

<!--  css style  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/admin/introduction/adminInsertNotice.css">

</head>
<body>
	<div id="wrap">
		<jsp:include page="../common/adminMenuBar.jsp" />
		<section class="contents"> 
		<!-- article --> 
			<article>
			<!-- 내용작성을 이곳에서~ -->
				<div class="conWrap">
					<!-- height 값 임의로 주었습니다. 수정해서 사용하세요 -->
					<form id="writeForm" method="post">
						<div class="info-header">
							<h4>공지게시판 > 글쓰기</h4>
						</div>
						<ul class="top">
							<li>
								<div class="row">
									<label> 제목 </label> <input id="inputTitle" type="text" name="title" placeholder="">
								</div>
							</li>
							<li class="category">
								<div class="row">
									<label> 카테고리 </label>
									<select name="category">
										<option value="행사">행사</option>							
										<option value="점검">점검</option>							
										<option value="공고">공고</option>							
										<option value="발표">발표</option>							
										<option value="안내">안내</option>							
									</select>
								</div>
							</li>
							<li>
								<div class="writer">
									<label> 작성자 </label>
									<input type="text" value="admin" name="writer" readonly>
								</div>
							</li>
						</ul>
						<!--contentArea-->
						<ul class="contArea bottom">
							<li><label>공지 내용</label> <textarea id="inputContent" name="content" 
									cols="50" rows="15" style="resize: none;"></textarea></li>
						</ul>
		
						<div class="btnAra">
							<button type="reset" id="resetBtn">작성취소</button>
							<button type="submit" id="writeBtn">등록하기</button>
						</div>
		
					</form>
				</div>
				
			</article> 
			<!--//article--> 
		</section>
		<!--//section -->
	</div>
	<script>
		$("#resetBtn").click(function() {
			$("#writeForm").trigger("reset");
			if(window.confirm("목록으로 이동하시겠습니까?")) {
				location.href="${pageContext.request.contextPath}/selectNoticeAdmin.in";
			}
		}).mouseenter(function() {
			$(this).css({"cursor":"pointer"});
		});
		
		$("#writeBtn").click(function() {

			if($("#inputTitle").val() === '') {
				alert("제목을 입력해주세요");
				$("#inputTitle").focus();
				return;
			}
			if($("#inputContent").val() === '') {
				alert("내용을 입력해주세요");
				$("#inputContent").focus();
				return;				
			}
			else {
				$("#writeForm").attr("action", "${pageContext.request.contextPath }/insertNotice.in");
			}

		}).mouseenter(function() {
			$(this).css({"cursor":"pointer"});
		});
		
		
		$(function() {
			$(".sideMenu li.menu div>a").eq(5).addClass('borderB');
			$(".sideMenu li.menu div>a").eq(5).addClass('color');
			$(".menu a").eq(0).removeClass('borderB');
			$(".sideMenu li.menu ul").eq(5).css("display", "block");
			$(".sideMenu li.menu ul li:nth-child(1) a").addClass('color');  
		});
	</script>

</body>
</html>