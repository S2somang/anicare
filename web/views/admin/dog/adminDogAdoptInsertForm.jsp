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
		<form action="${ pageContext.request.contextPath }/insertStory.ma" method="post">
			<div class="info-header">
					<h4>보호동물정보 > 글쓰기</h4>
				</div>
				<ul class="top">
					<li>
						<div class="row">
							
							
							<li>
								<div class="row">
									<!-- <label> select </label> <input type="text" placeholder="입소견 이름"> -->
									<label>강아지 이름</label>
									
										
											<input type="hidden" id="hidden" name ="dcode" >
											<c:if test = "${!empty requestScope.list}">
										<select name ="selectName" id ="selectName" onchange="selectedName(this);">
											<option value="none" selected>동물이름</option>
											<c:forEach var ="list" items="${requestScope.list}" varStatus="i">
												<option value ="${list.dcode}">${list.name}</option>
											</c:forEach>
										
										</select>
									</c:if>
										
									
								</div>
							</li>
							
							<li>
								<div class="row">
									<!-- <label> select </label> <input type="text" placeholder="입소견 이름"> -->
									<label>USER ID</label>
									
										
											<input type="hidden" id="hidden" name ="user_id" >
											<c:if test = "${!empty requestScope.list}">
										<select name ="selectId" id ="selectId" onchange="selectedId(this);">
											<option value="none" selected>USER ID</option>
											<c:forEach var ="list" items="${requestScope.list}" varStatus="i">
												<option value ="${list.user_id}">${list.user_id}</option>
											</c:forEach>
										
										</select>
									</c:if>
										
									
								</div>
							</li>
								
								 <label> 서류제출 </label> <select name="fin">
							<option value="Y">제출</option>
								<option value="N">미제출</option>
								<option value="E">서류보충</option>
							</select> 
							
							<label> STEP</label> <select name="step">
								<option value="STEP1">STEP1</option>
								<option value="STEP2">STEP2</option>
								<option value="STEP3">STEP3</option>
								<option value="STEP4">STEP4</option>
								<option value="STEP5">STEP5</option>
								<option value="STEP6">STEP6</option>
								<option value="STEP7">STEP7</option>
								<option value="STEP8">STEP8</option>
								<option value="N" selected>N</option>
							</select>
						</div>
					</li>
					

				<div class="btnAra">
					<button type="reset">작성취소</button>
					<button type="submit" >등록하기</button>
				</div>

			</form>
		</div>

		</article>
		 <!--//article-->
		 </section>
		<!--//section -->

	</div>
	<script>
	

			/*메뉴바 */

			$(".sideMenu li.menu div>a").eq(4).addClass('borderB');
			$(".sideMenu li.menu div>a").eq(4).addClass('color');
			$(".menu a").eq(0).removeClass('borderB');
			$(".sideMenu li.menu ul").eq(4).css("display", "block");

			
		
		
	</script>

</body>
</html>
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