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
	href="${pageContext.request.contextPath }/resources/css/admin/education/adminUpdateEvent.css">

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
							<h4>교육행사관리 > 수정</h4>
						</div>
						<ul class="top">
							<li>
								<div class="row">
									<label> 제목 </label> <input id="inputTitle" type="text" name="title" placeholder="" value="<c:out value="${ requestScope.post.title }"/>">
									<input type="hidden" id="bCode" name="bCode" value="<c:out value="${ requestScope.post.bCode }"/>">
								</div>
							</li>
							<li >
								<div class="thumbnail-area">
									<label> 미리보기</label>
									<img id="thumbnail" width="145" height="100" src="${ pageContext.request.contextPath }/resources/images/education/<c:out value="${ requestScope.fileList[1].changeName }"/>">
								</div>
								<div class="file-area">
									<input type="file" id="thumbnailFile" name="thumnailFile" onchange="loadImg(this, 1)">
								</div>
							</li>
						</ul>
						<!--contentArea-->
						<ul class="contArea bottom">
							<li><label>내용</label> 
								<div class="file-area">
									<input type="file" id="contentImg" name="contentImg" onchange="loadImg(this, 2)">
								</div>
								<div contentEditable="true" id="inputContent" style="resize: none:;"><c:if test="${ !empty requestScope.fileList[1] }"><img src="${ pageContext.request.contextPath }/resources/images/education/<c:out value="${ requestScope.fileList[0].changeName }"/>"></c:if><c:if test="${ !empty requestScope.post.content }"><c:out value="${ requestScope.post.content }"/></c:if></div>
								<textarea id="inputText" name="content" style="display:none;"></textarea>
							</li>
						</ul>
		
						<div class="btnAra">
							<button type="reset" id="resetBtn">작성취소</button>
							<button type="submit" id="writeBtn">수정하기</button>
							<button type="submit" id="deleteBtn">삭제하기</button>
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
		
		function loadImg(value, num) {
			
			
			
			if(value.files && value.files[0]) {
				var reader = new FileReader();
				var img=document.createElement("img");
				reader.onload = function(e) {
					switch(num) {
					case 1 : $("#thumbnail").attr("src", e.target.result); break;
					case 2 : $("#inputContent img").remove();
							  img.src=reader.result; 
							  $("#inputContent").append(img);break;
					}
				}
				reader.readAsDataURL(value.files[0]);
			}
		}
	
		$("#resetBtn").click(function() {
			$("#writeForm").trigger("reset");
			if(window.confirm("목록으로 이동하시겠습니까?")) {
				location.href="${pageContext.request.contextPath}/selectEventAdmin.ed";
			}
		}).mouseenter(function() {
			$(this).css({"cursor":"pointer"});
		});
		
		$("#writeBtn").click(function() {
			
			$("#inputContent img").remove();

			var rawContent = $("#inputContent").text();
			$("#inputText").val(rawContent);
			
			
			console.log($("#inputText").val());
			$("#writeForm").attr("action", "${pageContext.request.contextPath }/updateEventAdmin.ed");
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
		
		$("#deleteBtn").click(function() {
			var bCode = $("#bCode").val();
			
		    if(window.confirm("선택된 게시물을 삭제하시겠습니까?")) {
				$("#writeForm").attr("action", "${pageContext.request.contextPath}/deleteEventAdmin.ed");
			}
		}).mouseenter(function() {
			$(this).css({"cursor":"pointer"});
		});
		
		

	</script>

</body>
</html>