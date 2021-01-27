<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인</title>
</head>
<body>
	<div id="wrap">
		<jsp:include page="common/adminMenuBar.jsp" />
		<h1>test</h1>

		<section class="contents">
			<article>
				<!-- 내용작성을 이곳에서~ -->

				<div class="conWrap">height 값 임의로 주었습니다. 수정해서 사용하세요. 스타일이
					적용되어있습니다. div외의 다른 것을 사용하고 싶다면 클래스이름만 가져가시고, hegiht값 수정해서 사용하시면
					됩니다.</div>

			</article>
		</section>
	</div>

</body>
</html>