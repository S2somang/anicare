<jsp:directive.page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<section class="contents"> 
		<!-- article --> 
			<article>
			<!-- 내용작성을 이곳에서~ -->
				<div class="conWrap">
					<!-- height 값 임의로 주었습니다. 수정해서 사용하세요 -->
					<form action="${pageContext.request.contextPath }/insertStory.ma"
						method="post" encType="multipart/form-data">
						<div class="info-header">
							<h4>보호동물정보 > 글쓰기</h4>
						</div>
					
						<ul class="top">
					
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
						
							<li class="titleImgArea">
								<div class="row">
									<label>입소견대표사진</label> 
									<img id="titleImg" class="titleImg">
								</div>
							</li>
							<li class="subImgArea">
								<ul>
									<li><img id="subImg1" class="subImg"></li>
									<li><img id="subImg2" class="subImg"></li>
									<li><img id="subImg3" class="subImg"></li>
									<li><img id="subImg4" class="subImg"></li>
								</ul>
							</li>
		
						</ul>
						
						
						
						<!--contentArea-->
						<ul class="contArea bottom">
							<li><label>내용 대표 이미지</label> 
							<img id="conTitle"class="conTitle"></li>
							<li><label>1. name 만나게 된 날</label> <textarea name="meet" id="meet"
									cols="30" rows="10" style="resize: none;"></textarea></li>
							<li><label>2. 친해지기</label>
								<div class="addImgArea"></div> <span class="add">+</span> <span
								class="imgDelete"> - </span> <textarea name="friend" id="friend" cols="30"
									rows="10" style="resize: none;"></textarea></li>
							<li><label>3. 후원자님이 생겼어요! </label> <textarea name="support" id="support"
									cols="30" rows="10" style="resize: none;"></textarea></li>
							<li><label>4. 이별</label> <textarea name="sad" id="sad" cols="30"
									rows="10" style="resize: none;"></textarea></li>
		
						</ul>
		
						<div class="btnAra">
							<button type="reset">작성취소</button>
							<button type="submit">등록하기</button>
						</div>
		
		
						<div class="fileArea">
							<!-- Title  -->
							<input type="file" id="aniInfoImg1" name="aniInfoImg1"
								onchange="loadImg(this,1)">
							<!-- sub FileArea -->
							<input type="file" id="aniInfoImg2" name="aniInfoImg2"
								onchange="loadImg(this,2)"> <input type="file"
								id="aniInfoImg3" name="aniInfoImg3" onchange="loadImg(this,3)">
							<input type="file" id="aniInfoImg4" name="aniInfoImg4"
								onchange="loadImg(this,4)"> <input type="file"
								id="aniInfoImg5" name="aniInfoImg5" onchange="loadImg(this,5)">
		
							<!-- contentFileArea  -->
							<input type="file" id="aniInfoImg6" name="aniInfoImg6"
								onchange="loadImg(this,6)">
							<!-- 뭔가 이미지 추가 누르면 이거 추가되게 하고싶은데-->
						</div>
						<div class="fileArea2"></div>
						<!--//fileARea-->
		
		
		
		
					</form>
				</div>
				
			</article> 
			<!--//article--> 
		</section>
		<!--//section -->

		<%-- <c:if test="${ empty sessionScope.loginUser }">
      <c:set var="msg" value="잘못된 경로로 접근하셨습니다." scope="request"/>
      <jsp:forward page="../common/errorPage.jsp"/>
  	 </c:if> --%>
	</div>
	<script>
		function loadImg(value, num) {
			if (value.files && value.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					switch (num) {
					case 1:
						$("#titleImg").attr('src', e.target.result);
						break;
					case 2:
						$("#subImg1").attr("src", e.target.result);
						break;
					case 3:
						$("#subImg2").attr("src", e.target.result);
						break;
					case 4:
						$("#subImg3").attr("src", e.target.result);
						break;
					case 5:
						$("#subImg4").attr("src", e.target.result);
						break;
					case 6:
						$("#conTitle").attr("src", e.target.result);
						break;
					case 7:
						$("#conImg1").attr("src", e.target.result);
						break;
					case 8:
						$("#conImg2 ").attr("src", e.target.result);
						break;
					}
				}
				reader.readAsDataURL(value.files[0]);
			}
			;
		};
		/* 이미지 추가 깔깔  */
		var cnt = 6;
		var cnt2 = 0;
		var buttonMax = 1;
		$(function() {

			$(".add").click(
					function() {
						cnt++;
						cnt2++;
						console.log(this);
						var img = '<img id="conImg' + (cnt2)
								+ '" class="conImg"/>';
						var file = '<input type="file" id ="aniInfoImg' + (cnt)
								+ '" name="aniInfoImg' + (cnt)
								+ '" onchange="loadImg(this,' + (cnt) + ')">';
						var class1 = $(this).attr("class");
						console.log("클래스명" + class1);
						console.log("ㅇ뭐야이거" + $(this).siblings('div'));
						var addImg = $(this).siblings('div');

						if (buttonMax >= 3) {
							cnt2--;
							cnt--;
							return;
						}
						addImg.append("<div class='addImgArea2'>" + img
								+ "</div>");
						$(".fileArea").append(file);

						buttonMax++;

						$("#conImg1").click(function() {
							$("#aniInfoImg7").click();
						});
						$("#conImg2").click(function() {
							$("#aniInfoImg8").click();
						});
					});

			$(".fileArea").hide();
			$("#titleImg").click(function() {
				$("#aniInfoImg1").click();
			});
			$("#subImg1").click(function() {
				$("#aniInfoImg2").click();
			});
			$("#subImg2").click(function() {
				$("#aniInfoImg3").click();
			});
			$("#subImg3").click(function() {
				$("#aniInfoImg4").click();
			});
			$("#subImg4").click(function() {
				$("#aniInfoImg5").click();
			});
			$("#conTitle").click(function() {
				$("#aniInfoImg6").click();
			});

			/*메뉴바 */

			$(".sideMenu li.menu div>a").eq(4).addClass('borderB');
			$(".sideMenu li.menu div>a").eq(4).addClass('color');
			$(".menu a").eq(0).removeClass('borderB');
			$(".sideMenu li.menu ul").eq(4).css("display", "block");

			
		});
		/* 이미지 삭제 */
		$(".imgDelete").click(function() {

			console.log($(".addImgArea img:last-child"));
			console.log($(".addImgArea input:last-child"));
			console.log($(".addImgArea *"));
			var divChild = $(".addImgArea *");
			if (divChild.length) {
				$(".addImgArea2:last-child ").remove();
				
			}
			buttonMax--;
			cnt2--;
			cnt--;
		});
		
		/* select 선택 val */
	function selectedName(val){
			var val = $(val).find(":selected").val();
			console.log(val);
			$("#hidden").attr({"value" : val});
			console.log($("#hidden").attr("value"));
			//$(val).find(":selected").val();
		}
		
		
		
		
	</script>

</body>
</html>