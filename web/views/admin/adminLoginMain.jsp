<jsp:directive.page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인 메인</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminLoginMain.css">
</head>
<body>
<div id="wrap">
        <div class="bgfront" >
                <h1>
                    <img src ="${pageContext.request.contextPath }/resources/images/common/header/logo-04.png" alt="simbol"/>
                    <img src ="${pageContext.request.contextPath }/resources/images/common/header/logo-02.png" alt="logo"/>
                </h1>

                <h2>관리자 페이지</h2>

                <ul>
                    <li> 
                        <label>ID</label>
                        <input type="text">
                        
                    </li>
                    <li>
                        <label>PW</label>
                        <input type="password">
                    </li>
                    <li>
                    <%-- 임시로 넘어가게 해둠 --%>
                        <button class="loginBtn" onclick="location.href='${pageContext.request.contextPath }/views/admin/adminMain.jsp'">로그인</button>
                    </li>
    
                </ul>

                <ul class="joinLink">
                    <li><a href="#" class="join sub">회원가입</a></li>
                    <li><a href="#" class="login sub">아이디찾기</a></li>
                    <li><a href="#">비밀번호찾기</a></li>
                </ul>
        </div>


		<%-- back --%>
        <div class="back">
            <!--Content before waves-->
            <div class="inner-back flex">
            </div>
        
            <!--Waves Container-->
            <div>
                <svg class="waves" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                viewBox="0 24 150 28" preserveAspectRatio="none" shape-rendering="auto">
                    <defs>
                    <path id="gentle-wave" d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z" />
                    </defs>
                    <g class="parallax">
	                    <use xlink:href="#gentle-wave" x="48" y="0" fill="rgba(83,89,233,0.7" />
	                    <use xlink:href="#gentle-wave" x="48" y="3" fill="rgba(137,170,255,0.5)" />
	                    <use xlink:href="#gentle-wave" x="48" y="5" fill="rgba(255,234,255,0.3)" />
	                    <use xlink:href="#gentle-wave" x="48" y="7" fill="rgba(241,245,255,0.2)" />
	                    <use xlink:href="#gentle-wave" x="48" y="7" fill="#fff" />
                    </g>
                </svg>
            </div>
        </div>
    </div>


</body>
</html>