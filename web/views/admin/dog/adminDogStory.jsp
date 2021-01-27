<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/admin/support/adminSupportOneOnOne.css">

</head>
<body>
	<!-- 수정 수정 -->

	<div id="wrap">
		<jsp:include page="../common/adminMenuBar.jsp" />
		<section class="contents">

			<!-- article -->
			<article>
				<!-- 내용작성을 이곳에서~ -->
				<div class="conWrap">
					<!-- height 값 임의로 주었습니다. 수정해서 사용하세요 -->
					<form action="SelectDogStoryServlet" method="get">
						<ul class="mt70 top">
							<li><label></label> <input type="search" placeholder="이름검색">
								<div class="searchBtn">
									<img
										src="${pageContext.request.contextPath }/resources/images/admin/search.png"
										alt="search">
								</div> <select>
									<option value="Y">보호중</option>
									<option value="N">입양완료</option>
							</select></li>
							<li>

								<div
									onclick="location.href='${pageContext.request.contextPath }/selectDog.ma'">>글쓰기
									&nbsp; ▼</div>
							</li>
						</ul>
					</form>

					<table class="oneTable" id="oneTable">
						<colgroup>
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="20%">
							<col width="30%">
							<col width="10%">
							<col width="10%">

						</colgroup>
						<thead>
							<tr>

								<th>강아지코드</th>
								<th>이름</th>
								<th>나이</th>
								<th>품종</th>
								<th>마이크로칩</th>
								<th>조회수</th>
								<th>수정/출력</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="d" items="${requestScope.list}">
								<tr>

									<input type="hidden" vlaue="<c:out value="${d.dcode }"/>">
									<td><c:out value="${d.dcode }" /></td>
									<td><c:out value="${d.name }" /></td>
									<td><c:out value="${d.age }" /></td>
									<td><c:out value="${d.breed }" /></td>
									<td><c:out value="${d.chip }" /></td>
									<td><c:out value="${d.bcount }" /></td>
									<td><div class="hideMenu">...</div></td>
								</tr>
							</c:forEach>
						</tbody>

					</table>

					<ul class="pager mt40">
						<li><<</li>
						<li>1</li>
						<li>2</li>
						<li>3</li>
						<li>4</li>
						<li>5</li>
						<li>>></li>
					</ul>

				</div>
			</article>


		</section>

		<script>
			$(function() {
				$(".sideMenu li.menu div>a").eq(4).addClass('borderB');
				$(".sideMenu li.menu div>a").eq(4).addClass('color');
				$(".menu a").eq(0).removeClass('borderB');
				$(".sideMenu li.menu ul").eq(4).css("display", "block");
			});

			$("#oneTable tr")
					.click(
							function() {
								var num = $(this).find('input').val();

								console.log(num);

								location.href = "${pageContext.request.contextPath}/selectDetail.ma?num="
										+ num;
							});
		</script>

	</div>
</body>
</html>