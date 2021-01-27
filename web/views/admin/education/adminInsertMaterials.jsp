<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
<!-- <link rel="shortcut icon" href="#">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->

<!--  css style  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/admin/education/adminInsertMaterials.css">

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
					<form id="writeForm" method="post" encType="multipart/form-data">
						<div class="info-header">
							<h4>자료게시판관리 > 글쓰기</h4>
						</div>
						<ul class="top">
							<li>
								<div class="row">
									<label> 제목 </label> <input id="inputTitle" type="text" name="title" placeholder="">
								</div>
							</li>
							<li >
								<div class="file-area">
									<input type="file" id="file" name="file" ">
								</div>
							</li>
						</ul>
						<!--contentArea-->
						<ul class="contArea bottom">
							<li><label>내용</label> 
									<textarea id="inputContent" name="content" style="resize:none;"></textarea>
							</li>
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
		$(function() {
			$(".sideMenu li.menu div>a").eq(5).addClass('borderB');
			$(".sideMenu li.menu div>a").eq(5).addClass('color');
			$(".menu a").eq(0).removeClass('borderB');
			$(".sideMenu li.menu ul").eq(5).css("display", "block");
			$(".sideMenu li.menu ul li:nth-child(2) a").addClass('color');  
		});
		
		$("#resetBtn").click(function() {
			$("#writeForm").trigger("reset");
			if(window.confirm("목록으로 이동하시겠습니까?")) {
				location.href="${pageContext.request.contextPath}/selectMaterialsAdmin.ed";
			}
		}).mouseenter(function() {
			$(this).css({"cursor":"pointer"});
		});
		
		$("#writeBtn").click(function() {
			
			$("#writeForm").attr("action", "${pageContext.request.contextPath }/insertMaterialsAdmin.ed");
/* 			if($("#inputTitle").val() === '') {
				alert("제목을 입력해주세요");
				$("#inputTitle").focus();
				return;
			}
			if($("#inputContent").innerHTML() === '') {
				alert("내용을 입력해주세요");
				$("#inputContent").focus();
				return;				
			}
			else {
				$("#writeForm").attr("action", "${pageContext.request.contextPath }/insertEventAdmin.ed");
			} */

		}).mouseenter(function() {
			$(this).css({"cursor":"pointer"});
		});
		
		

	</script>

</body>
</html>