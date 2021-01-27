<jsp:directive.page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	            <form action="" method="get">
	                <ul class="mt70 top">
	                    <li>
	                        
	                            <label></label>
	                            <input type="search" placeholder="이름검색" >
	                            <div class="searchBtn">
	                                <img src ="${pageContext.request.contextPath }/resources/images/admin/search.png" alt="search">
	                            </div>
	                            
	                            
	                            <select>
	                                <option value="Y">보호중</option>
	                                <option value="N">입양완료</option>
	                            </select>
	                        
	                    </li>
	                </ul>
                </form>
                
                <table class="oneTable" >
                    <colgroup>
                        <col width="10%">
                        <col width="10%">
                        <col width="40%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                        
                    </colgroup>
                    <thead>
                        <tr>
                            <th>인덱스</th>
                            <th>t</th>
                            <th>이름</th>
                            <th>성별</th>
                            <th>품종</th>
                            <th>입소일</th>
                            <th>수정/출력</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>1</td>
                            <td><a href="#">1</a></td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td><div class="hideMenu">...</div></td>
                        </tr>
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
		$(function(){		
			$(".sideMenu li.menu div>a").eq(4).addClass('borderB');
            $(".sideMenu li.menu div>a").eq(4).addClass('color');             
            $(".menu a").eq(0).removeClass('borderB');
            $(".sideMenu li.menu ul").eq(4).css("display","block");  
		});
		
		
	});
		</script>
		
	</div>
</body>
</html>