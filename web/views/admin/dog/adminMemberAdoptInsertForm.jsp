<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="shortcut icon" href="#">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->

<!--  css style  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/admin/support/SupportAniInfoInsert.css">

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
					<form action="${ pageContext.request.contextPath }/insertNewDog.ma"
						method="post">
						<div class="info-header">
							<h4>보호동물정보 > 글쓰기</h4>
						</div>
						<ul class="top">
							<li>

								<div class="row">

									<label> 유저 아이디 </label> <input type="hidden" id="hidden"
										name="user_id">
									<c:if test="${!empty requestScope.list}">
										<select name="selectId" id="selectId"
											onchange="selectedId(this);">
											<option value="none" selected>유저 아이디</option>
											<c:forEach var="list" items="${requestScope.list}"
												varStatus="a">
												<option value="${a.user_id}">${a.user_id}</option>
											</c:forEach>

										</select>
									</c:if>
									<label> 완료 여부 </label> <select name="fin">
										<option value="Y">Y</option>
										<option value="N" selected>N</option>
									</select> 

								</div>
							</li>


							<div class="btnAra">
								<button type="reset">작성취소</button>
								<button type="submit">등록하기</button>
							</div>
					</form>
				</div>

			</article>
			<!--//article-->
		</section>
		<!--//section -->

	</div>
	<script>
		/* select 선택 val */
		function selectedName(val) {
			var val = $(val).find(":selected").val();
			console.log(val);
			$("#hidden").attr({
				"value" : val
			});
			console.log($("#hidden").attr("value"));
			//$(val).find(":selected").val();
		}
		function selectedId(val) {
			var val = $(val).find(":selected").val();
			console.log(val);
			$("#hidden").attr({
				"value" : val
			});
			console.log($("#hidden").attr("value"));
			//$(val).find(":selected").val();
		}
	</script>

</body>

</html>