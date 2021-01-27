<jsp:directive.page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AniCare Admin</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/support/adminSupportOneOnOne.css">
    
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
	            <form action="${pageContext.request.contextPath }/searchName.sp" method="post">
	                <ul class="mt70 top">
	                    <li>
	                        
	                            <label></label>
	                            <input type="search" placeholder="이름검색" name ="search" class="search" >
	                            <div class="searchBtn" onclick ="searchClick();">
	                                <img src ="${pageContext.request.contextPath }/resources/images/admin/search.png" alt="search">
	                            </div>
	                            
	                            
	                            <select>
	                                <option value="Y">보호중</option>
	                                <option value="N">입양완료</option>
	                            </select>
	                        
	                    </li>
	                    <li>
	                        <div onclick="location.href='${pageContext.request.contextPath }/dogSelect.sp'">글쓰기 &nbsp; ▼</div>
	                    </li>
	                </ul>
                </form>
                
                <table class="oneTable" id ="oneTable">
                    <colgroup>
                        <col width="10%">
                        <col width="10%">
                        <col width="30%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                    </colgroup>
                    <thead>
                        <tr>
                            <th>인덱스</th>
                            <th>애견번호</th>
                            <th>개이름</th>
                            <th>진행단계</th>
                            <th>상태</th>
                            <th>조회수</th>
                            <th>글 종류</th>
                            <th>수정/출력</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                    
                    <c:forEach var ="b" items="${requestScope.list}">
                    	<tr>
                    		<input type="hidden" value ="<c:out value ="${b.stCode }"/>">
                    		<td><c:out value ="${b.stCode }"/></td>
                    		<td><c:out value ="${b.dcode }"/></td>
                    		<td><c:out value ="${b.name}"/></td>
                    		<td>
                    			<c:set var ="content" value ="${fn:split(b.content,'-$') }" />
	                    		<c:if test="${not empty content[0]}" >
	                    			<!--1  내용있고... -->
	                    			<c:if test ="${not empty content[1]}">
	                    	 	 		<!--2 내용있고 -->
	                    	 	 		<c:if test ="${not empty content[2]}">
	                    					<!-- 3 내용있고 -->
	                    					<c:if test ="${not empty content[3]}">
	                    						<!--4 내용 있으면  -->
	                    						4
	                    					</c:if>
	                    					<c:if test ="${empty content[3]}">
	                    						<!--4 내용 있으면  -->
	                    						3
	                    					</c:if>
	                    					
	                    				</c:if>
	                    				<c:if test = "${empty content[2]}">
	                    					2
	                    				</c:if>
	                    			</c:if>
	                    			
	                    			<c:if test = "${empty content[1]}">
	                    				1
	                    			</c:if>
	                    			
	                    		</c:if>
	                    		
                    		</td>
                    		<%-- <td><c:out value ="${b.content }"/></td> --%>
                    		<td><c:out value ="${b.status}"/></td>
                    		<td><c:out value ="${b.bCount }"/></td>
                    		<%-- <td><c:out value ="${b.reply }"/></td> --%>
                    		
                    		<td>
                    			<c:if test="${b.type eq 1}">
                    				support
                    			</c:if>
                    		<%-- <c:out value ="${b.type }"/> --%>
                    		</td>
                    		<%-- <td><c:out value ="${b.refStcode }"/></td> --%>
                    		
                    		<td>
                    			<ul>
                    			<p>...</p>
                    				<li>수정하기</li>
                    				<li>삭제하기</li>
                    			</ul>
                    		</td>

                    	</tr>
                    </c:forEach>
                        <!-- <tr>
                            <td>1</td>
                            <td>1</td>
                            <td><a href="#">1</a></td>
                            <td>1</td>
                            <td>1</td>
                            <td><div class="hideMenu">...</div></td>
                        </tr> -->
                    </tbody>

                </table>

                <ul class="pager mt40">
                    <li onclick="location.href='${pageContext.request.contextPath}/oneSelectList.sp?currentPage=1'"><<</li>
			        <!-- 현재 페이지가 1봗다 작으면 ㅈ더이상 갈수없잖앙 -->
			        <c:if test="${ requestScope.pi.currentPage <= 1 }">
			            <li disabled><</li>
			        </c:if>
			         <!-- 1이상이면 넘겨.. -->
			        <c:if test="${ requestScope.pi.currentPage > 1 }">
			            <li onclick="location.href='${pageContext.request.contextPath}/oneSelectList.sp?currentPage=<c:out value="${ requestScope.pi.currentPage - 1 }"/>'"><</li>
			        </c:if>
			        
			        
			        <!--                              1                                    5                    -->
			         <c:forEach var="p" begin="${ requestScope.pi.startPage }" end="${ requestScope.pi.endPage }" step="1">
			            <c:if test="${ requestScope.pi.currentPage eq p }"> <!--  현재페이지가 p와 같다면 현재페이지버튼을 다시 누를필요없으니까 -->
			               <li disabled><c:out value="${ p }"/></li>
			            </c:if>
			            <!--  ne => not equals , =! -->
			            <c:if test="${ requestScope.pi.currentPage ne p }">
			               <li onclick="location.href='${pageContext.request.contextPath}/oneSelectList.sp?currentPage=<c:out value="${ p }"/>'"><c:out value="${ p }"/></li>
			            </c:if>
			         </c:forEach>
			        
			         <c:if test="${ requestScope.pi.currentPage >= requestScope.pi.maxPage }">
		            
		            <li disabled>></li>
			         </c:if>
			         <c:if test="${ requestScope.pi.currentPage < requestScope.pi.maxPage }">
			            <li onclick="location.href='${pageContext.request.contextPath}/oneSelectList.sp?currentPage=<c:out value="${ requestScope.pi.currentPage + 1 }"/>'">></li>
			         </c:if>
			         
			         
			         <li onclick="location.href='${pageContext.request.contextPath}/oneSelectList.sp?currentPage=<c:out value="${ requestScope.pi.maxPage }"/>'">>></;o>
			     
				        
			        
                </ul>

            </div>
        </article>


    </section>
		
		<script>
		$(function(){
			
			
			$(".sideMenu li.menu div>a").eq(4).addClass('borderB');
            $(".sideMenu li.menu div>a").eq(4).addClass('color');             
            $(".menu a").eq(0).removeClass('borderB');
            $(".sideMenu li.menu ul").eq(4).css("display","block");  

		});
		
		$("#oneTable tr").click(function(){
			var num = $(this).find('input').val();
			
			console.log(num);
			
			location.href="${pageContext.request.contextPath}/selectOneInfo.sp?num="+num;
		});
		
		$(".search").click(function(){
			console.log($(this));
			console.log($(this).val());			
		
		});
		
	
		function searchClick(){
			console.log($(".search").val());
			var search =$(".search").val(); 
			$(".search").attr("name" , search);
			console.log('name : '+$(".search").attr("name"));
			//$(".searchBtn").val(search);
			/* console.log('val: ' +$(".searchBtn").val(search));
			$(".searchBtn").attr("name" , search)
			console.log($(".searchBtn").attr("name")); */
			
			//$("form").submit();
			
			//location.href="${pageContext.request.contextPath }/searchName.sp";
			
			
			 $.ajax({
				
				url : "${pageContext.request.contextPath}/searchName.sp",
				data:{search : search},
				type: "get",
				success:function(data){
					console.log("data : "+data);
					//안에 tr들 지우고! 새로 써야쥐~
					
					var $tBody = $("#oneTable tbody");
					$tBody.html("");
            		
            		$.each(data, function(index, slist){
            			console.log("list : "+slist);
            			
            			var type;
            			if(slist.type == 1){
            				type = "support";
            			}
            			var ul =$("<ul/>").append(
            				$("<p/>").text("..."),
            				$("<li/>").text("수정하기"),
            				$("<li/>").text("삭제하기")
            			) ;
            			
          
            			
            			
            			
            			var row =$("<tr/>").append(
            				$("<td/>").text(slist.stCode),
            				$("<td/>").text(slist.dcode),
            				$("<td/>").text(slist.name),
            				$("<td/>").text(""),
            				$("<td/>").text(slist.status),
            				$("<td/>").text(slist.bCount),
            				$("<td/>").text(type),
            				$("<td/>").text(ul)
            				
            			);
            			
            			
            			$tBody.append(row);
					 
            		});
				},
				error:function(err){
					console.log(err);
				}
				
			}); 
			
		}
		
		
		
		
		
		
		/* function trClick(value){
		
			//location.href='${pageContext.request.contextPath }/';
		}; */
		</script>
		
		
		<script>
		/* $(function(){
			
			$.ajax({
            	url:"oneSelectList.sp",
            	type:"post",
            	success:function(data){
            		
            		console.log(data);
            		
            		var $tbody = $("#oneTable tbody");
            		
            		$tbody.html("");
            		
            		$.each(data, function(index, list){
            			
            			var $tr = $("<tr>");
            			var $stTd = $("<td>").text(list.stCode);
            			var $dcoTd = $("<td>").text(list.dcode);
            			//var $dnamaTd = $("<td>").text(lsit.dname);
            			// var $conTd = $("<td>").text(list.content); *
            			var $staTd = $("<td>").text(list.staues);
            			var $alterTd = $("<td>").text("<div class='hideMenu'>...</div>");
            			
            			$tr.append($stTd);
            			$tr.append($dcoTd);
            			//$tr.append($dnamaTd); 
            			// $tr.append($conTd); 
            			$tr.append($staTd);
            			$tr.append($alterTd);
            			
            			$tbody.append($tr);
            		});
            		
            	},
            	error:function(err){
            		
            		console.log("실패!");
            	}
        
            
            }); 
		}); */
		
		</script>
	</div>
</body>
</html>