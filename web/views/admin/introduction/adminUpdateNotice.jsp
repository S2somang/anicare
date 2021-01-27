<jsp:directive.page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	href="${pageContext.request.contextPath }/resources/css/admin/introduction/adminUpdateNotice.css">

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
									<label> 제목 </label> 
									<input id="inputTitle" type="text" name="title" value="<c:out value="${ requestScope.notice.title }"/>">
									<input type="hidden" name="ncode" value="<c:out value="${ requestScope.notice.ncode }"/>">
								</div>
							</li>
							<li class="category">
								<div class="row">
									<label> 카테고리 </label>
									<select name="category">
										<option value="행사" <c:if test="${ requestScope.notice.category eq '행사' }">selected</c:if>>행사</option>							
										<option value="점검" <c:if test="${ requestScope.notice.category eq '점검' }">selected</c:if>>점검</option>							
										<option value="공고" <c:if test="${ requestScope.notice.category eq '공고' }">selected</c:if>>공고</option>							
										<option value="발표" <c:if test="${ requestScope.notice.category eq '발표' }">selected</c:if>>발표</option>							
										<option value="안내" <c:if test="${ requestScope.notice.category eq '안내' }">selected</c:if>>안내</option>							
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
							<li>
								<label>공지 내용</label> 
								<textarea id="inputContent" name="content" cols="50" rows="15" style="resize: none;"><c:out value="${ requestScope.notice.content }"/></textarea>
							</li>
						</ul>
		
						<div class="btnAra">
							<button type="reset" id="resetBtn">취소</button>
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
				$("#writeForm").attr("action", "${pageContext.request.contextPath }/updateNoticeAdmin.in");
			}
		}).mouseenter(function() {
			$(this).css({"cursor":"pointer"});
		});
		
		$("#deleteBtn").click(function() {
			var ncode = $(this).parent().parent().children().eq(0).text();
			if(window.confirm("정말 삭제하시겠습니까?")) {
				$("#writeForm").attr("action", "${pageContext.request.contextPath}/deleteNoticeAdmin.in");
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