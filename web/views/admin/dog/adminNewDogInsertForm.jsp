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
	href="${pageContext.request.contextPath }/resources/css/admin/support/SupportAniInfoInsert.css">

</head>
<body>
	<div id="wrap">
		<jsp:include page="../common/adminMenuBar.jsp" />
		<section class="contents"> <!-- article --> <article>
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
							
							<label> 이름 </label> <input type="text" name="name" placeholder="EX> 춘식이" />
							<label> 성별 </label> <select name="gender">
													<option value="F">F</option>
													<option value="M" selected>M</option>
													</select>
							 <label>품종 </label> <input type="text" name="breed" placeholder="EX> MIX" />
							 <label>몸무게 </label> <input type="text" name="weight"
								placeholder="EX> 10"> 
								<label>중성화 </label> <select name="fixing">
								<option value="Y">Y</option>
								<option value="N" selected>N</option>
							</select>
							 <label> 나이 </label> <input type="text" name="age"
								placeholder="EX> 1~11 개월 이후는 +11한 숫자로 계산해주세요 EX> 3살 : 14">
							
								<label> 마이크로칩 </label>
								<input type="text" name="chip" placeholder="EX> 마이크로칩 번호를 입력해주세요 없으시면 비워두세요">
								
								 <label> 성격 </label> <select name="personality">
								<option value="quiet">얌전</option>
								<option value="friendly">보통</option>
								<option value="outgoing">활발</option>
								<option value="energetic">매우활발</option>
							</select> 
							
							<label> 배변 훈련</label> <select name="potty">
								<option value="Y">Y</option>
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