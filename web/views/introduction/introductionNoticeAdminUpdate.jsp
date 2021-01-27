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
	/* background-color:khaki; */
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
	height:95%;
	float:left;
	
}
.section h2 {
	/* background-color:mistyRose; */
	padding-left:20px;
}
.section .details {
	/* background-color:wheat; */
	height:70%;
	padding:20px 20px 20px 20px;
}
.section .details form {
	/* background-color:wheat; */
	height:100%;
}
.section .details form .table-area {
	/* background-color:wheat; */
	width:90%;
	height:90%;
	text-align:center;
}
.section .details form .table-area tr {
	height:10%;
}
.section .details form .table-area td:nth-child(1) {
	width:15%;
}
.section .details form .table-area td:nth-child(2) {
	width:50%;
}

.section .details form .table-area td input {

	width:70%;
}
.section .details form .table-area tr .input-area {
	/* background-color:thistle; */
	text-align:left;
	padding-left:10px;
}
.section .details form .table-area tr .label {
	/* background-color:tomato; */
	text-align:right;
}
.section .details form .table-area tr textarea {
	width:70%;
	height:90%;
	overflow:scroll;
}


.paging-area {
	/* background-color:seashell; */
	width: 87%;
	height: 10%;
	margin-left:20px;
	/* text-align: center;
	vertical-align: center; */
}

.paging-area button {
	width: 80px;
	height: 30px;
	color: #5E5E5E;
	background-color: #FFFFFF;
	font-size: 15px;
	margin-top: 10px;
	margin-left: 10px;
	margin-right: 10px;
}

.paging-area button:hover {
	background-color: #3C43F0;
	color: #FFFFFF;
	cursor: pointer;
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
			<a>게시판 관리 > 공지게시판 > 공지수정</a>
		</h2>
		
		<div class="details">
			<form id="writeForm" method="post">
				<table class="table-area">
					<tr>
						<td class="label">제목</td>
						<td class="input-area">
							<input type="text" size="50" name="title" value="<c:out value="${ requestScope.notice.title }"/>">
							<input type="hidden" name="ncode" value="<c:out value="${ requestScope.notice.ncode }"/>">
						</td>
					</tr>
					<tr>
						<td class="label">작성자</td>
						<td class="input-area"><input type="text" value="admin" name="writer" readonly></td>
					</tr>
					<tr>
						<td class="label">카테고리</td>
						<td class="input-area">
							<select name="category">
								<option value="행사" <c:if test="${ requestScope.notice.category eq '행사' }">selected</c:if>>행사</option>							
								<option value="점검" <c:if test="${ requestScope.notice.category eq '점검' }">selected</c:if>>점검</option>							
								<option value="공고" <c:if test="${ requestScope.notice.category eq '공고' }">selected</c:if>>공고</option>							
								<option value="발표" <c:if test="${ requestScope.notice.category eq '발표' }">selected</c:if>>발표</option>							
								<option value="안내" <c:if test="${ requestScope.notice.category eq '안내' }">selected</c:if>>안내</option>							
							</select>
						</td>
					</tr>
					<tr>
						<td class="label">내용</td>
						<td class="input-area" rowspan='10'>
							<textarea name="content">
								<c:out value="${ requestScope.notice.content }"/>
							</textarea>
						</td>
					</tr>
				</table>
			
				<div class="paging-area" align="center">
					
						<button id="resetBtn" onclick="return false;"><b>취소</b></button>
						<button id="writeBtn"><b>수정완료</b></button>
						<button id="deleteBtn"><b>삭제</b></button>
				</div>
			</form>
		</div>
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
			// Check title
			if($("input[name=title]").val() === '') {
				alert("제목을 입력해주세요");
				$("input[name=title]").focus();
				return;
			}
			// Check Content
			if($("textarea[name=content]").val() === '') {
				alert("내용을 입력해주세요");
				$("textarea[name=content]").focus();
				return;
			}
			else {
				$("#writeForm").attr("action", "${ pageContext.request.contextPath }/updateNoticeAdmin.in");
			}
		}).mouseenter(function() {
			$(this).css({"cursor":"pointer"});
		});
		
		$("#deleteBtn").click(function() {
			if(window.confirm("정말로 삭제하시겠습니까?")) {
				$("#writeForm").attr("action", "${pageContext.request.contextPath}/deleteNoticeAdmin.in");
			}
		}).mouseenter(function() {
			$(this).css({"cursor":"pointer"});
		});
	</script>
	
</body>
</html>