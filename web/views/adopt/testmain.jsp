<jsp:directive.page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ANICRE</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/adopt/adopt.css">
</head>
<body>
	
	<div id="wrap">
		<jsp:include page="/views/common/header.jsp" />
    <!-- contents 시작 -->
    <section class="contents">
        <!-- 첫번째 -->
        

         <!-- article second photo list -->
       

    </section> 
    
		<jsp:include page="/views/common/footer.jsp" />
	</div>
	<script>
    $(function(){
       $(".pager li").mouseenter(function(){
           /*console.log($(this));*/
           $(this).addClass('active');
       }).mouseleave(function(){
            $(this).removeClass('active');
       }) ;
    });

    </script>

</body>
</html>