<jsp:directive.page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	html, body {
		height: 100%;
	}
	.main_content_area {
		width: 70%;
		height: 75%;
		margin: 0 auto;
		margin-top: 30px;
	}
	#searchText {
		width: 160px;
		height: 25px;
		margin-top: 5px;
		outline: none;
	}
	#searchBtn {
		width: 22px;
		height: 22px;
		margin-top: 9px;
		margin-right: -160px;
		outline: none;
	}
	#writeBtn {
		width: 80px;
		height: 30px;
		font-size: 15px;
		color: white;
		background-color: #3C43F0;
		margin-top: 5px;
		margin-left: 10px;
	}
	#writeBtn:hover {
		cursor: pointer;
	}
	hr {
		display: inline-block;
	}
	#color_hr {
		width: 110px;
	}
	.board_area {
		height: 90%;
	}
	.post_area {
		height: 90%;
	}
	#board_post {
		width: 100%;
		border-collapse: collapse;
		border-left: 0px solid #FFFFFF;
		border-right: 0px solid #FFFFFF;
	}
	tr, td {
		color: #5E5E5E;
		font-size: 15px;
		border-top: 1px solid #C4C4C4;
		border-bottom: 1px solid #C4C4C4;
		border-right: 0px solid #FFFFFF;
		border-left: 0px solid #FFFFFF;
	}
	#board_post tr:first-child {
		height: 5%;
	}
	#board_post tr td:first-child{
		text-align: center;
		width: 10%;
	}
	#board_post tr td:nth-child(2){
		width: 60%;
		text-indent: 10px;
	}
	#board_post tr td:nth-child(3){
		text-align: center;
		width: 12%;
	}
	#board_post tr td:nth-child(4), #board_post tr td:last-child {
		text-align: center;
		width: 8%;
	}
	#board_post th {
		color: #5E5E5E;
	}
	.pagenation_area {
		width: 100%;
		height: 10%;
		/* text-align: center;
		vertical-align: center; */
	}
	.pagenation_area button {
		width: 3%;
		color: #5E5E5E;
		background-color: #FFFFFF;
		font-size: 15px;
		margin-top: 15px;
		margin-left: 3px;
		margin-right: 3px;
	}
	
	.pagenation_area button:hover {
		background-color: #3C43F0;
		color: #FFFFFF;
		cursor: pointer;
	}
</style>
</head>
<body>
	<!-- Header area -->
	<div class="header_area">
		<jsp:include page="/views/common/header.jsp"/>
	</div>
		
	<!-- Main Content area -->
	<div class="main_content_area">
		<%-- ${requestScope.missingBoardList } --%>
		<div class="board_area">
			<c:if test="${requestScope.condition == 'general' }">
				<span style="font-size:25px;"><a>실종게시판</a></span>
			</c:if>
			<c:if test="${requestScope.condition == 'search' }">
				<span style="font-size:25px;"><a id="search_text">'${requestScope.searchText }'검색 결과</a></span>
			</c:if>
			<c:if test="${!empty sessionScope.loginUser }">
				<button id="writeBtn" style="float:right;">글쓰기</button>
				<input id="searchText" type="text" style="float:right;">
				<input id="searchBtn" type="image" style="float:right;" 
					   src="${pageContext.request.contextPath }/resources/images/board/magnifier.png">
		   </c:if>
			<!-- <button id="searchBtn" style="float:right;">검색</button> -->
			<!-- hr area -->
			<div class="hr_area" style="float:clear;">
				<hr id="color_hr" color="#3C43F0"/><hr id="normal_hr" color="#C4C4C4"/>
			</div>
			
			<!-- Post Area -->
			<div class="post_area">
				<!-- MODIFY POINT 1 -->
				<!-- test -> static element -->
				<!-- DB Access -> Dynamic element -->
				<table id="board_post" border="1" align="center">
					<!-- MODIFY POINT 2 -->
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
					<c:forEach var="post" items="${requestScope.missingBoardList['boardList'] }" varStatus="num">
						<c:set var="cp" value="${requestScope.missingBoardpageInfo['cp'] }"/>
						<c:set var="limit" value="${requestScope.missingBoardpageInfo['limit'] }"/>
						<c:set var="numbering" value="${(cp-1) * limit }"/>
						<tr>
							<td>${requestScope.missingBoardpageInfo['missingBoardListCount']-(numbering + num.index)}</td>
							<td>${post.title } [${missingBoardCommentList[num.index]}]</td>
							<fmt:parseNumber var="pos" integerOnly="true" value="${fn:length(post.name)/2 }"/>
							<td>${fn:replace(post.name, post.name.charAt(pos), '*') }</td>
							<td>${post.bDate }</td>
							<td>${post.count }</td>
						</tr>
						<input type="hidden" value="${post.bCode }"/>
						<input type="hidden" value="${missingBoardCommentList[num.index]}"/>
					</c:forEach>
				</table>
			</div>
		</div>
		<!-- MODIFY POINT3 -->
		<!-- DB Access Post Count - DYNAMIC -->
		<div class="pagenation_area" align="center">
			<c:if test="${requestScope.condition == 'general' }">
				<button onclick="location.href='${pageContext.request.contextPath }/selectMissingBoardList.bo?cp=1'">&lt&lt</button>
			</c:if>
			<c:if test="${requestScope.condition == 'search' }">
				<button onclick="location.href='${pageContext.request.contextPath }/searchMissingBoardList.bo?searchText=${requestScope.searchText }&cp=1'">&lt&lt</button>
			</c:if>
			<c:if test="${requestScope.missingBoardpageInfo['cp'] <= 1 }">
				<button disabled>&lt</button>
			</c:if>
			<c:if test="${requestScope.missingBoardpageInfo['cp'] > 1 }">
				<c:if test="${requestScope.condition == 'general' }">
					<button onclick="location.href='${pageContext.request.contextPath }/selectMissingBoardList.bo?cp=${requestScope.missingBoardpageInfo['cp'] - 1 }'">&lt</button>
				</c:if>
				<c:if test="${requestScope.condition == 'search' }">
					<button onclick="location.href='${pageContext.request.contextPath }/searchMissingBoardList.bo?searchText=${requestScope.searchText }&cp=${requestScope.missingBoardpageInfo['cp'] - 1 }'">&lt</button>
				</c:if>
			</c:if>
			<!-- MODIFY POINT4 -->
			<!-- Current Page.. disabled and Style -->
			<c:forEach var="b_idx" begin="${requestScope.missingBoardpageInfo['sp'] }" end="${requestScope.missingBoardpageInfo['ep'] }" step="1">
				<c:if test="${requestScope.missingBoardpageInfo['cp'] eq b_idx }">
					<button disabled style="color: white; background-color:#3C43F0;">${b_idx }</button>
				</c:if>
				
				<c:if test="${requestScope.missingBoardpageInfo['cp'] ne b_idx }">
					<c:if test="${requestScope.condition == 'general' }">
						<button onclick="location.href='${pageContext.request.contextPath}/selectMissingBoardList.bo?cp=${b_idx }'">${b_idx }</button>
					</c:if>
					<c:if test="${requestScope.condition == 'search' }">
						<button onclick="location.href='${pageContext.request.contextPath}/searchMissingBoardList.bo?searchText=${requestScope.searchText }&cp=${b_idx }'">${b_idx }</button>
					</c:if>
				</c:if>
			</c:forEach>
			
			<c:if test="${requestScope.missingBoardpageInfo['cp'] >= requestScope.missingBoardpageInfo['mp'] }">
				<button disabled>&gt</button>
			</c:if>
			<c:if test="${requestScope.missingBoardpageInfo['cp'] < requestScope.missingBoardpageInfo['mp'] }">
				<c:if test="${requestScope.condition == 'general' }">
					<button onclick="location.href='${pageContext.request.contextPath }/selectMissingBoardList.bo?cp=${requestScope.missingBoardpageInfo['cp'] + 1 }'">&gt</button>
				</c:if>
				<c:if test="${requestScope.condition == 'search' }">
					<button onclick="location.href='${pageContext.request.contextPath }/searchMissingBoardList.bo?searchText=${requestScope.searchText }&cp=${requestScope.missingBoardpageInfo['cp'] + 1 }'">&gt</button>
				</c:if>
			</c:if>
			<c:if test="${requestScope.condition == 'general' }">
				<button onclick="location.href='${pageContext.request.contextPath }/selectMissingBoardList.bo?cp=${requestScope.missingBoardpageInfo['mp']}'">&gt&gt</button>
			</c:if>
			<c:if test="${requestScope.condition == 'search' }">
				<button onclick="location.href='${pageContext.request.contextPath }/searchMissingBoardList.bo?searchText=${requestScope.searchText }&cp=${requestScope.missingBoardpageInfo['mp']}'">&gt&gt</button>
			</c:if>
		</div>
	</div>
	<!-- Footer area -->
	<div class="footer_area">
		<jsp:include page="/views/common/footer.jsp"/>
	</div>
	
	<script>
		function sizeSetting() {
			var limit = ${requestScope.missingBoardpageInfo['limit']};
			var tableAreaHeight = $("#board_post").parent().height() - $("th").height();
			/* console.log(tableAreaHeight / 10); */
			$("td").each(function() {
				$(this).height(tableAreaHeight / limit);
			});
			
			var divWidth = $(".hr_area").width();
			var colorWidth = $("#color_hr").width();
			$("#normal_hr").css({"width":(divWidth-colorWidth-5)});
		}
		$(function() {
			sizeSetting();
			
		});
		$(window).resize(function() {
			sizeSetting();
		});
		$("#writeBtn").click(function() {
			location.href = "${pageContext.request.contextPath }/views/board/missingBoardWriteForm.jsp";
		});
		$("#searchBtn").click(function() {
			var searchTitle = $("#searchText").val();
			var path = "${pageContext.request.contextPath }/searchMissingBoardList.bo?";
			path += "searchText=" + $("#searchText").val();
			location.href = path;
		});
		
		$(".post_area td").mouseenter(function() {
			$(this).parent().children().each(function() {
				$(this).css({"color":"#3C43F0", "cursor":"pointer"});
			})
		}).mouseout(function() {
			$(this).parent().children().each(function() {
				$(this).css({"color":"#5E5E5E"});
			})
		}).click(function() {
			var bCode = $(this).parent().next().val();
			var commentCount = $(this).parent().next().next().val();
			console.log("bCode : " + bCode);
			console.log("commentCount : " + commentCount);
			location.href="${pageContext.request.contextPath }/selectOneMissingBoard.bo?bCode=" + bCode + "&cc=" + commentCount;
		});
		$("a").mouseenter(function() {
			$(this).css({"cursor":"pointer"});
		}).click(function() {
			location.href="${pageContext.request.contextPath }/selectMissingBoardList.bo";
		});
	</script>
</body>
</html>