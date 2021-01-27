<jsp:directive.page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d3fb31a84e2a606d38fe82e99105a85c"></script>
<style>
	html, body {
		height: 100%;
	}
	#form_wrapper {
		width: 70%;
		height: 115%;
		margin: 0 auto;
		margin-top: 20px;
	}
	#detailViewForm {
		width: 100%;
		height: 100%;
	}
	.content_wrapper {
		width: 90%;
		height: 90%;
		margin: 0 auto;
		margin-top: 15px;
		margin-bottom: -50px;
		/* background-color: red; */
	}
	hr {
		display: inline-block;
	}
	.color_hr {
		width: 110px;
	}
	.color_hr2 {
		width: 50px;
	}
	.color_hr3 {
		width: 100px;
	}
	
	
	.wrapper {
		width: 100%;
		height: 5%;
		/* background-color: skyblue; */
	}
	.div_in_wrapper {
		float: left;
	}
	label {
		vertical-align: middle;
	}
	.label_area {
		width: 35%;
		height: 100%;
		text-indent: 35px;
		font-size: 20px;
		color: #5E5E5E;
	}
	.input_area {
		width: 65%;
		height: 100%;
	}
	.input_area input:first-child {
		width: 95%;
		height: 60%;
		margin-top: 4px;
		font-size: 15px;
		border: 1px solid #C4C4C4;
		text-indent: 10px;
		outline: none;
	}
	textarea {
		width: 95%;
		height: 20em;
		cols: 15;
		border: 1px solid #C4C4C4;
		resize: none;
		text-indent: 10px;
		outline: none;
	}
	.btn_wrapper {
		width: 85%;
		height: 4%;
		margin: 0 auto;
	}
	#modifyBtn {
		width: 130px;
		height: 100%;
		font-size: 15px;
		outline: none;
		float: right;
		background-color: #3C43F0;
		margin-right: 20px;
		border: 0;
		border-radius: 8px;
		color: #FFFFFF;
	}
	#deleteBtn {
		width: 130px;
		height: 100%;
		font-size: 15px;
		outline: none;
		float: right;
		background-color: #FFFFFF;
		border: 2px solid #3C43F0;
		border-radius: 8px;
		
		color: #3C43F0;
	}
	#map_wrapper {
		width: 95%;
		height: 450%;
		border: 1px solid #C4C4C4;
	}
	#comment_write_wrapper{
		width: 70%;
		height: 5%;
		margin: 0 auto;
	}
	#comment_wrapper {
		width: 70%;
		margin: 0 auto;
	} 
	#comment_write_wrapper .wrapper {
		width: 90%;
		height: 100%;
		margin: 0 auto;
	}
	#commentWriteBtn {
		width: 15%;
		height: 80%;
		font-size: 15px;
		outline: none;
		background-color: #3C43F0;
		border: 0;
		border-radius: 8px;
		color: #FFFFFF;
		margin-left: 15px;
	}
	#cwb_wrapper input {
		width: 75%;
	}
	tr, td {
		color: #5E5E5E;
		height: 40px;
		font-size: 15px;
		border-top: 1px solid #C4C4C4;
		border-bottom: 1px solid #C4C4C4;
		border-right: 0px solid #FFFFFF;
		border-left: 0px solid #FFFFFF;
	}
	.reply_content {
		color: #5E5E5E;
		width: 80%;
		border-style: none;
		outline: none;
		font-size: 15px;
	}
	#reply_table {
		width: 95%;
		margin: 0 auto;
		border-collapse: collapse;
		border-left: 0px solid #FFFFFF;
		border-right: 0px solid #FFFFFF;
	}
	#reply_table tr:first-child {
		height: 20%;
	}
	#reply_table tr td:first-child{
		text-align: center;
		width: 15%;
	}
	#reply_table tr td:nth-child(2){
		width: 45%;
		text-indent: 10px;
	}
	#reply_table tr td:nth-child(3){
		text-align: center;
		width: 12%;
	}
	#reply_table tr td:last-child {
		text-align: center;
		width: 10%;
	}
	.reply_modifyBtn {
		width: 30px;
		height: 80%;
		font-size: 12px;
		outline: none;
		background-color: #3C43F0;
		border: 0;
		border-radius: 8px;
		color: #FFFFFF;
	}
	.reply_deleteBtn {
		width: 30px;
		height: 80%;
		font-size: 12px;
		outline: none;
		background-color: #FFFFFF;
		border: 2px solid #3C43F0;
		border-radius: 8px;
		color: #3C43F0;
	}
</style>
</head>
<body>
	<jsp:include page="/views/common/header.jsp"/>
	<!-- form_wrapper area start -->
	<div id="form_wrapper">
		<form id="detailViewForm" method="post">
			<span style="font-size:25px;"><a>실종게시판</a></span>
			<!-- hr area -->
			<div class="hr_area" style="float:clear;">
				<hr class="color_hr" color="#3C43F0"/><hr class="normal_hr" color="#C4C4C4"/>
			</div>
			
			<!-- content_wrapper area start -->
			<div class="content_wrapper">
				<!-- wrapper1 area start -->
				<div class="wrapper">
					<div class="label_area div_in_wrapper">
						<label>제목</label>
					</div>
					<div class="input_area div_in_wrapper">
						<input type="text" name="title" value="${requestScope.selectMissingBoardPost['BOARD'].title }" readonly>
					</div>
				</div>
				<!-- wrapper1 area end -->
				
				<!-- wrapper2 area start -->
				<div class="wrapper">
					<div class="label_area div_in_wrapper">
						<label>작성자</label>
					</div>
					<div class="input_area div_in_wrapper">
						<c:set var="post" value="${requestScope.selectMissingBoardPost['BOARD']}"/>
						<fmt:parseNumber var="pos" integerOnly="true" value="${fn:length(post.name)/2 }"/>
						<input type="text" value="${fn:replace(post.name, post.name.charAt(pos), '*') }" name="userId" readonly>
					</div>
				</div>
				<!-- wrapper2 area end -->
				
				<!-- wrapper3 area start -->
				<div class="wrapper">
					<div class="label_area div_in_wrapper">
						<label>이메일</label>
					</div>
					<div class="input_area div_in_wrapper">
						<input type="email" name="email" value="${requestScope.selectMissingBoardPost['BOARD'].email }" readonly>
					</div>
				</div>
				<!-- wrapper3 area end -->
				
				<!-- wrapper4 area start -->
				<div class="wrapper">
					<div class="label_area div_in_wrapper">
						<label>내용</label>
					</div>
					<div class="input_area div_in_wrapper">
						<textarea name="content" style="font-size: 15px; margin-top: 5px;" readonly>${requestScope.selectMissingBoardPost['BOARD'].content }</textarea>
					</div>
				</div>
				<br/><br/><br/><br/><br/><br/><br/>
				<br/><br/><br/><br/><br/><br/><br/>
				<!-- wrapper4 area end -->
				
				<!-- wrapper5 area start -->
				<div class="wrapper">
					<div class="label_area div_in_wrapper">
						<label>실종 일자</label>
					</div>
					<div class="input_area div_in_wrapper">
						<input type="date" name="mDate" value="${requestScope.selectMissingBoardPost['MISSING'].mDate }" readonly>
					</div>
				</div>
				<!-- wrapper5 area end -->
				
				<!-- wrapper6 area start -->
				<div class="wrapper">
					<div class="label_area div_in_wrapper">
						<label>실종 시간</label>
					</div>
					<div class="input_area div_in_wrapper">
						<input type="time" name="mTime" value="${requestScope.selectMissingBoardPost['MISSING'].mTime }" readonly>
					</div>
				</div>
				<!-- wrapper6 area end -->
				
				<!-- wrapper7 area start -->
				<div class="wrapper">
					<div class="label_area div_in_wrapper">
						<label>특징</label>
					</div>
					<div class="input_area div_in_wrapper">
						<input type="text" name="info" value="${requestScope.selectMissingBoardPost['MISSING'].info }" readonly>
					</div>
					<input type="hidden" id="mapInfo" value="${requestScope.selectMissingBoardPost['MISSING'].map }" />
				</div>
				<!-- wrapper8 area end -->
				
				<!-- wrapper9 area start -->
				<div class="wrapper">
					<div class="label_area div_in_wrapper">
						<label>위치</label>
					</div>
					<div class="input_area div_in_wrapper">
						<div id="map_wrapper"></div>
						<input id="lat" type="hidden" name="lat">
						<input id="lng" type="hidden" name="lng">
					</div>
				</div>
				<!-- wrapper9 area end -->
			</div>
			<!-- content_wrapper area end -->
			<input type="hidden" name="bCode" value="${requestScope.selectMissingBoardPost['BOARD'].bCode }"/>
			<input type="hidden" name="cc" value="${requestScope.replyInfoMissingBoard['commentCountMissingBoard']}"/>
			<!-- brn_wrapper area start -->
			<c:if test="${requestScope.selectMissingBoardPost['BOARD'].userId == sessionScope.loginUser.userId }">
					<div class="btn_wrapper">
						<button id="deleteBtn" onclick="return false;"><b>삭제하기</b></button>
						<button id="modifyBtn" onclick="return false;"><b>수정하기</b></button>
					</div><br/>
				</c:if>
		</form>
	</div>
	<div id="comment_wrapper">
		<span style="font-size:25px;">댓글</span>
		<div class="hr_area" style="float:clear;">
			<hr class="color_hr2" color="#3C43F0"/><hr class="normal_hr2" color="#C4C4C4"/>
		</div>
		<c:if test="${requestScope.replyInfoMissingBoard['commentCountMissingBoard'] > 0}">
			<table border="1" id="reply_table">
				<tr>
					<th>작성자</th>
					<th>내용</th>
					<th>작성일</th>
					<th>기타</th>
				</tr>
				<c:forEach var="reply" items="${requestScope.replyInfoMissingBoard['replyListMissingBoard'] }">
					<tr>
						<fmt:parseNumber var="pos" integerOnly="true" value="${fn:length(reply.name)/2 }"/>
						<td>${fn:replace(reply.name, reply.name.charAt(pos), '*') }</td>
						<td><input class="reply_content" type="text" value="${reply.content }" readonly></td>
						<td>${reply.bDate }</td>
						<td>
							<button class="reply_modifyBtn" style="visibility:hidden;">수정</button>
							<button class="reply_deleteBtn" style="visibility:hidden;">삭제</button>
						</td>
					</tr>
					<input type="hidden" value="${reply.userId }"/>
					<input type="hidden" value="${reply.bCode }"/>
					<input type="hidden" value="${reply.refBcode }" id="refBcode"/>
				</c:forEach>
			</table>
		</c:if>
		<c:if test="${requestScope.replyInfoMissingBoard['commentCountMissingBoard'] <= 0 }">
			<p style="font-size: 18px; text-align:center; color:#5E5E5E">댓글이 없습니다.</p>
		</c:if>
	</div><br/>
	<div id="comment_write_wrapper">
		<span style="font-size:25px;">댓글작성</span>
		<div class="hr_area" style="float:clear;">
			<hr class="color_hr3" color="#3C43F0"/><hr class="normal_hr3" color="#C4C4C4"/>
		</div>
		<div class="wrapper">
			<c:if test="${empty sessionScope.loginUser }">
				<p style="font-size: 18px; text-align:center; color:#5E5E5E">로그인 후 작성가능합니다.</p>
			</c:if>
			<div class="label_area div_in_wrapper">
				<c:if test="${!empty sessionScope.loginUser }">
					<label>댓글내용</label>
				</c:if>
			</div>
			<div id="cwb_wrapper"class="input_area div_in_wrapper">
				<c:if test="${!empty sessionScope.loginUser }">
					<input type="text" id="content">
					<button id="commentWriteBtn"><b>작성하기</b></button>
				</c:if>
			</div>
		</div>
		<input type="hidden" id="backupTitle"/>
		<input type="hidden" id="backupContent"/>
		<input type="hidden" id="backupReplyContent"/>
		<input type="hidden" id="backupDate"/>
		<input type="hidden" id="backupTime"/>
		<input type="hidden" id="backupInfo"/>
		<input type="hidden" id="backupMap"/>
	</div><br/><br/><br/><br/>
	<!-- form_wrapper area end-->
	<jsp:include page="/views/common/footer.jsp"/>
	<script>
		/* Map Global Variable */
		var map;
		var marker;
		var markerEvent = function(event) {
			var latlng = event.latLng;
			marker.setPosition(latlng);
		}
		function sizeSetting() {
			var divWidth = $(".hr_area").width();
			var colorWidth = $(".color_hr").width();
			$(".normal_hr").css({"width":(divWidth-colorWidth-5)});
			
			var colorWidth2 = $(".color_hr2").width();
			$(".normal_hr2").css({"width":(divWidth-colorWidth2-5)});
			
			var colorWidth3 = $(".color_hr3").width();
			$(".normal_hr3").css({"width":(divWidth-colorWidth3-5)});
		}
		$(function() {
			sizeSetting();
			var mapInfo = $("#mapInfo").val();
			
			var latlng = mapInfo.split('%');
			var mapWrapper = document.getElementById('map_wrapper'),
				mapOption = {
					center: new kakao.maps.LatLng(latlng[0], latlng[1]),
					/* draggable: false, */
					level: 5
				};
			
			map = new kakao.maps.Map(mapWrapper, mapOption);
			marker = new kakao.maps.Marker({
				position: map.getCenter()
			});
			marker.setMap(map);
			map.setZoomable(true);
		});
		
		$(window).resize(function() {
			sizeSetting();
		});
		$("#deleteBtn").click(function() {
			var $flag = $(this).children();
			switch($flag.text()) {
			case '삭제하기':
				if(window.confirm('삭제하시겠습니까?')) {
					$("#detailViewForm").attr('action', '${pageContext.request.contextPath }/deleteMissingBoard.bo');
					$("#detailViewForm").submit();
				}
				break;
			case '수정완료':
				$("#lat").val(marker.getPosition().getLat());
				$("#lng").val(marker.getPosition().getLng());
				//date validation
				var flag = true;
				var today = new Date();
				today = formatDate(today);
				
				if (today < $("input[name=mDate]").val()) {
					flag = false;
				}
				
				if (!flag) {
					alert("올바른 날짜를 입력해주세요.");
					$("input[name=mDate]").focus();
					return;
				}
				
				if (window.confirm('수정하시겠습니까?')) {
					$("#detailViewForm").attr('action', '${pageContext.request.contextPath }/updateMissingBoard.bo');
					$("#detailViewForm").submit();
				}
				break;
			}
		}).mouseenter(function() {
			$(this).css({"cursor":"pointer"});
		});
		
		$("#modifyBtn").click(function() {
			var $flag = $(this).children();
			
			switch($flag.text()) {
			case '수정하기':
				$("#backupTitle").val($("input:first").val());
				$("#backupContent").val($("textarea[name=content]").text());
				$("#backupDate").val($("input[name=mDate]").val());
				$("#backupTime").val($("input[name=mTime]").val());
				$("#backupInfo").val($("input[name=info]").val());
				$("#backupMap").val($("#mapInfo").val());
				
				$("input").each(function(id) {
					if (id === 0 || id === 3 || id === 4 || id === 5) {
						$(this).attr('readonly', false);
						$(this).css({"border":"1px solid red"});
					}
				});
				$("textarea[name=content]").prop('readonly', false);
				$("textarea[name=content]").css({"border":"1px solid red"});
				
				/* marker.setMap(null); */
				kakao.maps.event.addListener(map, 'click', markerEvent);
				
				$("#deleteBtn").children().text('수정완료');
				$flag.text('취소하기');
				break;
			case '취소하기':
				$("input[name=title]").val($("#backupTitle").val());
				$("textarea[name=content]").val($("#backupContent").val());
				$("input[name=mDate]").val($("#backupDate").val());
				$("input[name=mTime]").val($("#backupTime").val());
				$("input[name=info]").val($("#backupInfo").val());
				
				//map process
				var backupLatLng = $("#backupMap").val().split('%');
				var BaseLatLng = new kakao.maps.LatLng(backupLatLng[0], backupLatLng[1]);
				
				marker.setPosition(BaseLatLng);
				
				kakao.maps.event.removeListener(map, 'click', markerEvent);
				$("input").each(function(id) {
					if (id === 0 || id === 3 || id === 4 || id === 5) {
						$(this).attr('readonly', true);
						$(this).css({"border": "1px solid #C4C4C4"});
					}
				});
				
				$("textarea[name=content]").prop('readonly', true);
				$("textarea[name=content]").css({"border":"1px solid #C4C4C4"});
				
				$("#deleteBtn").children().text('삭제하기');
				$flag.text('수정하기');				
				break;
			}
		}).mouseenter(function() {
			$(this).css({"cursor":"pointer"});
		});
 		$("#commentWriteBtn").click(function() {
 			if($("#content").val() === '') {
				alert("댓글 내용을 입력하세요");
				return;
			}
			var path = "${pageContext.request.contextPath }/insertReplyForMissingBoard.bo?";
			// MODIFY POINT -> dynamic : to loginUserId
			path += "userId=" + '${sessionScope.loginUser.userId}';
			path += "&content=" + $("#content").val();
			path += "&bCode=" + ${requestScope.selectMissingBoardPost['BOARD'].bCode };
			path += "&cc=" + ${requestScope.replyInfoMissingBoard['commentCountMissingBoard'] + 1};
			
			location.href=path;
		}).mouseenter(function() {
			$(this).css({"cursor":"pointer"});
		});
 		$("a").mouseenter(function() {
			$(this).css({"cursor":"pointer"});
		}).click(function() {
			location.href="${pageContext.request.contextPath }/selectMissingBoardList.bo";
		});
 		$("#reply_table tr td").mouseenter(function() {
			var writerId = $(this).parent().next().val();
			var userId = '${sessionScope.loginUser.userId}';
			if(writerId === userId) {
				$(this).parent().find("button").each(function() {
					$(this).attr('style', 'visibility:visible');
				});
			}
		});
		
		$(".reply_modifyBtn").mouseenter(function() {
			$(this).css({'cursor':'pointer'});
		}).click(function() {
			var flag = $(this).text();
			var $reply_content = $(this).parent().parent().find(".reply_content");
			switch (flag) {
			case '수정':
				$("#backupReplyContent").val($reply_content.val());
				$reply_content.attr('readonly', false);
				$reply_content.css({'border':'1px solid red'});
				$(this).text('취소');
				$(this).next().text('완료');
				break;
			case '취소':
				$reply_content.val($("#backupReplyContent").val());
				$reply_content.attr('readonly', true);
				$reply_content.css({'border-style': 'none'})
				$(this).text('수정');
				$(this).next().text('삭제');
				break;
			}
		});
		$(".reply_deleteBtn").mouseenter(function() {
			$(this).css({'cursor':'pointer'});
		}).click(function() {
			var flag = $(this).text();
			var bCode = $(this).parent().parent().next().next().val();
			var cc = "${requestScope.replyInfoMissingBoard['commentCountMissingBoard']}";
			var refBcode = $("#refBcode").val();
			switch(flag) {
			case '삭제':
				if(window.confirm('삭제하시겠습니까?')) {
					var path = "${pageContext.request.contextPath}/deleteReplyMissingBoard.bo?"
					path += "bCode=" + bCode;
					path += "&refBcode=" + refBcode;
					path += "&cc=" + cc;
					location.href = path;
				}
				break;
			case '완료':
				var content = $(this).parent().parent().find("input").val();
				var path = "${pageContext.request.contextPath}/updateReplyMissingBoard.bo?";
				path += "bCode=" + bCode;
				path += "&content=" + content;
				path += "&refBcode=" + refBcode;
				path += "&cc=" + cc;
				console.log(path);
				location.href = path;
				break;
			}
		});
		
		$("#reply_table tr").mouseleave(function() {
			var $reply_content = $(this).find(".reply_content");
			$(this).find("button").each(function() {
				if($(this).text() === '취소') {
					$reply_content.val($("#backupReplyContent").val());
					$reply_content.attr('readonly', true);
					$reply_content.css({'border-style': 'none'});
					$(this).text('수정');
					$(this).next().text('삭제');
				}
				$(this).attr('style', 'visibility:hidden');
			})
		});
		
		$(".reply_deleteBtn").mouseenter(function() {
			$(this).css({'cursor':'pointer'});
		});
 		function formatDate(date) {
			var year = date.getFullYear();
			var month = (1 + date.getMonth());
			month = month >= 10 ? month : '0' + month;
			var day = date.getDate();
			day = day >= 10 ? day : '0' + day;
			
			return year + '-' + month + '-' + day;
		}
	</script>
</body>
</html>