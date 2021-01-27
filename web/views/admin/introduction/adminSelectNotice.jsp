<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지게시판</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/introduction/adminSelectNotice.css">
    
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
	            <form action="" method="">
	                <ul class="mt70 top">
	                    <li>
	                        
	                            <label></label>
	                            <input type="search" id="searchText" placeholder="제목 + 내용" >
	                            <div class="searchBtn">
	                                <img src ="${pageContext.request.contextPath }/resources/images/admin/search.png" alt="search">
	                            </div>
	                            
	                            
	                            <select name="category">
									<option value="" <c:if test="${ requestScope.category eq '' }">selected</c:if>>== 카테고리 ==</option>							
									<option value="행사" <c:if test="${ requestScope.category eq '행사' }">selected</c:if>>행사</option>							
									<option value="점검" <c:if test="${ requestScope.category eq '점검' }">selected</c:if>>점검</option>							
									<option value="공고" <c:if test="${ requestScope.category eq '공고' }">selected</c:if>>공고</option>							
									<option value="발표" <c:if test="${ requestScope.category eq '발표' }">selected</c:if>>발표</option>							
									<option value="안내" <c:if test="${ requestScope.category eq '안내' }">selected</c:if>>안내</option>
	                            </select>
	                        
	                    </li>
	                    <li>
	                        <div onclick="location.href='${pageContext.request.contextPath }/views/admin/introduction/adminInsertNotice.jsp'">글쓰기 &nbsp; ▼</div>
	                    </li>
	                </ul>
                </form>
                <table class="oneTable" >
                    <colgroup>
                        <col width="8%">
                        <col width="10%">
                        <col width="40%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                    </colgroup>
                    <thead>
                        <tr>
							<th>공지번호</th>
							<th>작성날짜</th>
							<th>공지제목</th>
							<th>작성자</th>
							<th>카테고리</th>
							<th>수정</th>
                        </tr>
                    </thead>
                    <tbody>
						<c:forEach var="n" items="${ requestScope.list }">
							<tr>
								<td><c:out value="${ n.ncode }" /></td>
								<td><c:out value="${ n.date }" /></td>
								<td><c:out value="${ n.title }" /></td>
								<td><c:out value="admin" /></td>
								<td><c:out value="${ n.category }" /></td>
								<td><button class="updateBtn">수정</button></td>
							</tr>
						</c:forEach>
                    </tbody>

                </table>


            </div>
            <div class="conWrap">
            	<div class="paging-area">
			
					<!-- "<<" button on/of condition -->
					<c:if test="${ requestScope.pi.currentPage <= 1 }">
						<button disabled>&lt&lt</button>
					</c:if>
					<c:if test="${ requestScope.pi.currentPage > 1 }">
						<button onclick="location.href='${pageContext.request.contextPath}/selectNoticeAdmin.in?category=<c:out value="${ requestScope.category }" />&searchingFor=<c:out value="${ requestScope.searchingFor }" />&currentPage=1'">&lt&lt</button>
					</c:if>
					
					<!-- "<" button on/of condition -->
					<c:if test="${ requestScope.pi.currentPage <= 1 }">
						<button disabled>&lt</button>
					</c:if>
					<c:if test="${ requestScope.pi.currentPage > 1 }">
						<button onclick="location.href='${ pageContext.request.contextPath }/selectNoticeAdmin.in?category=<c:out value="${ requestScope.category }" />&searchingFor=<c:out value="${ requestScope.searchingFor }" />&currentPage=<c:out value="${ requestScope.pi.currentPage - 1 }"/>'">&lt</button>
					</c:if>
					
					<!-- page number button appear condition -->
					<c:forEach var="p" begin="${ requestScope.pi.startPage }" end="${requestScope.pi.endPage }" step="1">
						<c:if test="${ requestScope.pi.currentPage eq p}">
							<button disabled><c:out value="${ (p - 1) * requestScope.pi.limit + 1 } ~ ${ p * requestScope.pi.limit }"/></button>
						</c:if>
						<c:if test="${ requestScope.pi.currentPage ne p }">
							<button onclick="location.href='${ pageContext.request.contextPath }/selectNoticeAdmin.in?category=<c:out value="${ requestScope.category }" />&searchingFor=<c:out value="${ requestScope.searchingFor }" />&currentPage=<c:out value="${ p }"/>'"><c:out value="${ (p - 1) * requestScope.pi.limit + 1 } ~ ${ p * requestScope.pi.limit }"/></button>
						</c:if>
					</c:forEach>
					
					<!-- ">" button on/off condition -->
					<c:if test="${ requestScope.pi.currentPage >= requestScope.pi.maxPage }">
						<button disabled>&gt</button>
						<button disabled>&gt&gt</button>
					</c:if>		
					<c:if test="${ requestScope.pi.currentPage < requestScope.pi.maxPage }">
						<button onclick="location.href='${ pageContext.request.contextPath }/selectNoticeAdmin.in?category=<c:out value="${ requestScope.category }" />&searchingFor=<c:out value="${ requestScope.searchingFor }" />&currentPage=<c:out value="${ requestScope.pi.currentPage + 1 }"/>'">&gt</button>
						<button onclick="location.href='${ pageContext.request.contextPath }/selectNoticeAdmin.in?category=<c:out value="${ requestScope.category }" />&searchingFor=<c:out value="${ requestScope.searchingFor }" />&currentPage=<c:out value="${ requestScope.pi.maxPage }"/>'">&gt&gt</button>
					</c:if>
					
										
			 	</div>
			 </div>
            
        </article>


    </section>
		
		<script>
		
		//side menu selection
		$(function(){		
			$(".sideMenu li.menu div>a").eq(5).addClass('borderB');
            $(".sideMenu li.menu div>a").eq(5).addClass('color');            
            $(".menu a").eq(0).removeClass('borderB');
            $(".sideMenu li.menu ul").eq(5).css("display","block");  
            $(".sideMenu li.menu ul li:nth-child(1) a").addClass('color');      
		});
		
		//categoty selection
		$("select[name=category]").change(function() {
			category = $("select[name=category]").val();
			location.href = "${ pageContext.request.contextPath }/selectNoticeAdmin.in?category=" + category
			});
		
		//search function
		$(".searchBtn").click(function() {
			searchingFor = $("#searchText").val();
			category = $("select[name=category]").val();
			location.href = "${ pageContext.request.contextPath }/selectNoticeAdmin.in?category=" + category + "&" + "searchingFor=" + searchingFor;
		});

		//modify button function
		$(".updateBtn").click(function(){
			var num = $(this).parent().parent().children().eq(0).text();
			location.href = "${ pageContext.request.contextPath }/selectOneForUpdateNoticeAdmin.in?num=" + num;
		});
		
		</script>
		
	</div>
</body>
</html>