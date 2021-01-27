<jsp:directive.page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
html, body {
	height:95%;
	width:95%
}
.nav {
	background-color:khaki;
	width:20%;
	height:100%;
	float:left;
	text-align:center;
}
.nav img {
	width:inherit;
	max-width:100%;
}
.nav ul {
	list-style:none;
	margin-left:10%;
}
.nav li {
	text-align:left;
	padding:7px 7px 7px
}
.nav li li {
	padding:3px
}
.header {
	/* background-color:coral; */
	width:80%;
	height:5%;
	float:left;
	text-align:right;
}
.loginInfo {
	height:100%;
}
.loginInfo a{
}
.header .loginInfo img {
	/* background-color:gold; */
	height:inherit;
	max-height:100%;
	
}
.section {
	/* background-color:darkSalmon; */
	width:80%;
	height:100%;
	float:left;
	
}
.section h2 {
	/* background-color:mistyRose; */
	padding-left:20px;
}
.section .details {
    /* background-color:wheat; */
	height:70%;
	overflow:scroll;
	padding:20px 20px 20px 20px;
}
.table-area {

	width: 100%;
	height: auto;
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

.table-area tr:first-child {
	height: 7%;
}

.table-area tr td:first-child {
	text-align: center;
	width: 10%;
}

.table-area tr td:nth-child(2) {
	text-align: center;
	width: 12%;
}

.table-area tr td:nth-child(3) {
	width: 50%;
	text-indent: 10px;
}

.table-area tr td:nth-child(4) {
	text-align: center;
	width: 5%;
}

.table-area tr td:nth-child(5), .table-area tr td:last-child {
	text-align: center;
	width: 12%;
}
.paging-area {
	width: 100%;
	height: 10%;
	/* text-align: center;
	vertical-align: center; */
}

.paging-area button {
	width: auto;
	height: 30px;
	color: #5E5E5E;
	background-color: #FFFFFF;
	font-size: 15px;
	margin-top: 10px;
	margin-left: 3px;
	margin-right: 3px;
}

.paging-area button:hover {
	background-color: #3C43F0;
	color: #FFFFFF;
	cursor: pointer;
}
#writeBtn {
	
}

#searchText {
	width: 80px;
	height: 25px;
	margin-top: 10px;
	margin-right:10px;
	outline: none;
	
}

#searchBtn {
	width: 22px;
	height: 22px;
	margin-top: 14px;
	margin-right: -80px;
	outline: none;
}

</style>
</head>
<body>

	<div class="nav">
		<div class="logo">
			<a><img src="${pageContext.request.contextPath }/resources/images/common/header/logo-02.png"></a>
			<br>
			<p>관리자</p>
		</div>
		<hr>
		<ul>
			<li>
				<a><img src="${pageContext.request.contextPath }/resources/images/introduction/adminMenuMain.png"></a>
				<a>메인화면</a>
			</li>
			<li>
				<a><img src="${pageContext.request.contextPath }/resources/images/introduction/adminMenuMember.png"></a>
				<a>회원관리</a>
			</li>
			<li>
				<a><img src="${pageContext.request.contextPath }/resources/images/introduction/adminMenuDog.png"></a>
				<a>아이관리</a>
			</li>
			<li>
				<a><img src="${pageContext.request.contextPath }/resources/images/introduction/adminMenuAdopt.png"></a>
				<a>입양관리</a>
			</li>
			<li>
				<a><img src="${pageContext.request.contextPath }/resources/images/introduction/adminMenuTv.png"></a>
				<a>영상관리</a>
			</li>
			<li>
				<a><img src="${pageContext.request.contextPath }/resources/images/introduction/adminMenuSupport.png"></a>
				<a>후원관리</a>
			</li>
			<li>
				<a><img src="${pageContext.request.contextPath }/resources/images/introduction/adminMenuBoard.png"></a>
				<a>게시판관리</a>
				<ul>
					<li>- 자유게시판</li>
					<li>- 제보게시판</li>
					<li>- 목격게시판</li>
					<li>- 입양후기 게시판</li>
					<li>- 공지게시판</li>
				</ul>
			</li>
		</ul>
	</div>
	
	<div class="header">
		<div class="loginInfo">
			<a><img src="${pageContext.request.contextPath }/resources/images/common/header/misc_instagram_w.png"></a>
			<a>아무개 관리자님 안녕하세요▼</a>
		</div>
	</div>
	
	

	
	
	<div class="section">
		<h2>
			<a><img src="${ pageContext.request.contextPath }/resources/images/introduction/adminMenuDog.png"></a>
			<a>게시판 관리 > 공지게시판</a>
		</h2>
		
		<div class="details">
			<table class="table-area">
				<tr>
					<th>공지번호</th>
					<th>작성날짜</th>
					<th>공지제목</th>
					<th>작성자</th>
					<th>카테고리</th>
					<th>수정</th>
				</tr>
				<c:forEach var="n" items="${ requestScope.list }">
					<tr>
						<td><c:out value="${ n.ncode }" /></td>
						<td><c:out value="${ n.date }" /></td>
						<td><c:out value="${ n.title }" /></td>
						<td><c:out value="admin" /></td>
						<td><c:out value="${ n.category }" /></td>
						<td><button>수정</button></td>
					</tr>
				</c:forEach>
			</table>
		</div>
			<div class="paging-area" align="center">
			
									<button onclick="location.href='${pageContext.request.contextPath}/selectNoticeAdmin.in?currentPage=1'">&lt&lt</button>
					<c:if test="${ requestScope.pi.currentPage <= 1 }">
						<button disabled>&lt</button>
					</c:if>
					<c:if test="${ requestScope.pi.currentPage > 1 }">
						<button onclick="location.href='${ pageContext.request.contextPath }/selectNoticeAdmin.in?currentPage=<c:out value="${ requestScope.pi.currentPage - 1 }"/>'">&lt</button>
					</c:if>
					
					<c:forEach var="p" begin="${ requestScope.pi.startPage }" end="${requestScope.pi.endPage }" step="1">
						<c:if test="${ requestScope.pi.currentPage eq p}">
							<button disabled><c:out value="${ (p - 1) * requestScope.pi.limit + 1 } ~ ${ p * requestScope.pi.limit }"/></button>
						</c:if>
						<c:if test="${ requestScope.pi.currentPage ne p }">
							<button onclick="location.href='${ pageContext.request.contextPath }/selectNoticeAdmin.in?currentPage=<c:out value="${ p }"/>'"><c:out value="${ (p - 1) * requestScope.pi.limit + 1 } ~ ${ p * requestScope.pi.limit }"/></button>
						</c:if>
					</c:forEach>
					
					<c:if test="${ requestScope.pi.currentPage < requestScope.pi.maxPage }">
						<button onclick="location.href='${ pageContext.request.contextPath }/selectNoticeAdmin.in?currentPage=<c:out value="${ requestScope.pi.currentPage + 1 }"/>'">&gt</button>
					</c:if>
					
					<button onclick="location.href='${ pageContext.request.contextPath }/selectNoticeAdmin.in?currentPage=<c:out value="${ requestScope.pi.maxPage }"/>'">&gt&gt</button>					
				
				<input id="searchText" type="text" style="float: right;"> 
				<input id="searchBtn" type="image" style="float: right;"
				src="${pageContext.request.contextPath }/resources/images/board/magnifier.png">
				
				<button id="writeBtn" style="float:right;">글쓰기</button>
			</div>

	</div>
	<script>
		$("#searchBtn").click(function() {
			console.log("searchBtn click test");
		});
		$("#writeBtn").click(function() {
			console.log("writeBtn click test");
			location.href = "${ pageContext.request.contextPath }/views/introduction/introductionNoticeAdminInsert.jsp"
		});
		
		$(".table-area button").mouseenter(function() {
			$(this).parent().children().each(function() {
				$(this).css({"color":"#3C43F0", "cursor":"pointer"});
			})
		}).mouseout(function() {
			$(this).parent().children().each(function() {
				$(this).css({"color":"#5E5E5E"});
			})
		}).click(function() {
			var num = $(this).parent().parent().children().eq(0).text();
			
			console.log(num);
			
			location.href = "${ pageContext.request.contextPath }/selectOneForUpdateNoticeAdmin.in?num=" + num;
		});
	</script>
	
</body>
</html>