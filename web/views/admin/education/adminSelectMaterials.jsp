<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료게시판</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/education/adminSelectMaterials.css">
    
</head>
<body>

	<div id="wrap">
		<jsp:include page="../common/adminMenuBar.jsp" />
		<section class="contents">
        
        <!-- article -->
        <article>
            <!-- 내용작성을 이곳에서~ -->
            <div class="conWrap">
	            <form action="" method="">
	                <ul class="mt70 top">
	                    <li>
	                        	
			                    <select name="category">
									<option value="searchTitle" <c:if test="${ !empty requestScope.searchTitle }">selected</c:if>>제목</option>							
									<option value="searchContent" <c:if test="${ !empty requestScope.searchContent }">selected</c:if>>내용</option>							
			                    </select>
	                            <label></label>
	                            <input type="search" id="searchText" placeholder="" >
	                            <div class="searchBtn">
	                                <img src ="${pageContext.request.contextPath }/resources/images/admin/search.png" alt="search">
	                            </div>
	                            
	                            

	                        
	                    </li>
	                    <li>
	                        <div onclick="location.href='${pageContext.request.contextPath }/views/admin/education/adminInsertMaterials.jsp'">글쓰기 &nbsp; ▼</div>
	                    </li>
	                </ul>
                </form>
                <table class="oneTable" >
                    <colgroup>
                        <col width="8%">
                        <col width="10%">
                        <col width="30%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                    </colgroup>
                    <thead>
                        <tr>
							<th>게시물번호</th>
							<th>제목</th>
							<th>첨부파일</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정</th>
                        </tr>
                    </thead>
                    <tbody>
						<c:forEach var="hmap" items="${ requestScope.list }">
							<tr>
								<td><c:out value="${ hmap.bnum }" /></td>
								<td><c:out value="${ hmap.title }" /></td>
								<td><c:out value="${ hmap.originName }" /></td>
								<td><c:out value="${ hmap.userId }" /></td>
								<td><c:out value="${ hmap.bDate }" /></td>
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
						<button onclick="location.href='${pageContext.request.contextPath}/selectMaterialsAdmin.ed?searchTitle=<c:out value="${ requestScope.searchTitle }" />&searchContent=<c:out value="${ requestScope.searchContent }" />&currentPage=1'">&lt&lt</button>
					</c:if>
					
					<!-- "<" button on/of condition -->
					<c:if test="${ requestScope.pi.currentPage <= 1 }">
						<button disabled>&lt</button>
					</c:if>
					<c:if test="${ requestScope.pi.currentPage > 1 }">
						<button onclick="location.href='${ pageContext.request.contextPath }/selectMaterialsAdmin.ed?searchTitle=<c:out value="${ requestScope.searchTitle }" />&searchContent=<c:out value="${ requestScope.searchContent }" />&currentPage=<c:out value="${ requestScope.pi.currentPage - 1 }"/>'">&lt</button>
					</c:if>
					
					<!-- page number button appear condition -->
					<c:forEach var="p" begin="${ requestScope.pi.startPage }" end="${requestScope.pi.endPage }" step="1">
						<c:if test="${ requestScope.pi.currentPage eq p}">
							<button disabled><c:out value="${ (p - 1) * requestScope.pi.limit + 1 } ~ ${ p * requestScope.pi.limit }"/></button>
						</c:if>
						<c:if test="${ requestScope.pi.currentPage ne p }">
							<button onclick="location.href='${ pageContext.request.contextPath }/selectMaterialsAdmin.ed?searchTitle=<c:out value="${ requestScope.searchTitle }" />&searchContent=<c:out value="${ requestScope.searchContent }" />&currentPage=<c:out value="${ p }"/>'"><c:out value="${ (p - 1) * requestScope.pi.limit + 1 } ~ ${ p * requestScope.pi.limit }"/></button>
						</c:if>
					</c:forEach>
					
					<!-- ">" button on/off condition -->
					<c:if test="${ requestScope.pi.currentPage >= requestScope.pi.maxPage }">
						<button disabled>&gt</button>
						<button disabled>&gt&gt</button>
					</c:if>		
					<c:if test="${ requestScope.pi.currentPage < requestScope.pi.maxPage }">
						<button onclick="location.href='${ pageContext.request.contextPath }/selectMaterialsAdmin.ed?searchTitle=<c:out value="${ requestScope.searchTitle }" />&searchContent=<c:out value="${ requestScope.searchContent }" />&currentPage=<c:out value="${ requestScope.pi.currentPage + 1 }"/>'">&gt</button>
						<button onclick="location.href='${ pageContext.request.contextPath }/selectMaterialsAdmin.ed?searchTitle=<c:out value="${ requestScope.searchTitle }" />&searchContent=<c:out value="${ requestScope.searchContent }" />&currentPage=<c:out value="${ requestScope.pi.maxPage }"/>'">&gt&gt</button>
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
            $(".sideMenu li.menu ul li:nth-child(3) a").addClass('color');      
		});
		
		//search function
		$(".searchBtn").click(function() {
			searchingFor = $("#searchText").val();
			category = $("select[name=category]").val();
			var searchTitle = "";
			var searchContent = "";
			switch (category) {
			case "searchTitle" : searchTitle = searchingFor; break;
			case "searchContent" : searchContent = searchingFor; break;
			};
			
			location.href = "${ pageContext.request.contextPath }/selectMaterialsAdmin.ed?searchTitle=" + searchTitle + "&searchContent=" + searchContent; 
		});

		//modify button function
		$(".updateBtn").click(function(){
			var num = $(this).parent().parent().children().eq(0).text();
			location.href = "${ pageContext.request.contextPath }/selectOneMaterialsAdminForUpdate.ed?num=" + num;
		});
		
		</script>
		
	</div>
</body>
</html>