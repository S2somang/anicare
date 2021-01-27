<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/adopt/adopt.css">

</head>
<body>
 <article class="SupportOneOnOne mt70">
             <h3 class="contH3">
                 입양
                 
             </h3>
             <span>
             	<a href="${pageContext.request.contextPath }/views/adopt/adoptMain.jsp">입양</a> &gt; 
             	
             </span>
             <p class="bar"><span class="boderBot"></span></p>
             <p class="con">입양을 통해 아이들의 동반자가 되어주세요.<br>
                슬픔으로 가득찬 얼굴에 미소가 가득하게 만들어주세요.
            </p> 
           
            <div class="conHead">
                <h4>입양 안내</h4>
                <p> 아이의 특징을 선택해 주세요! </p>
            </div>
            <form method="" action="">
            <ul class="selectMenu"  >
                <li>
                    <ul>
                        <li>
                            <lable>
                                <span>중성화</span>
                                <span>Y/N</span>
                            </lable>
                            
                            <select name="fixing">
                                <option value="none" selected>ALL</option>
                                <option value="y">Y</option>
                                <option value="n">N</option>
                            </select>
                        </li>
                        <li>
                            <lable>
                                <span>성별</span>
                                <span>암컷/수컷</span>
                            </lable>
                            
                            <select name="gender">
                                <option value="none" selected>ALL</option>
                                <option value="f">암컷</option>
                                <option value="m">수컷</option>
                            </select>
                        </li>
                        <li>
                            <lable>
                                <span>크기</span>
                                <span>최대/대/중/소/최소</span>
                            </lable>
                            
                            <select name="size">
                                <option value="none" selected>ALL</option>
								<option value="max">최소</option>
								<option value="big">대</option>
                                <option value="midle">중</option>
								<option value="small">소</option>
								<option value="min">최소</option>
                            </select>
                        </li>
                        <li>
                            <lable>
                                <span>연령</span>
                                <span>puppy/junior/adult/senior</span>
                            </lable>
                            
                            <select name="age">
                                <option value="none" selected>ALL</option>
                                <option value="puppy">puppy</option>
                                <option value="junior">junior</option>
                                <option value="auilt">adult</option>
                                <option value="senior">senior</option>
                            </select>
                        </li>
                        <li>
                            <lable>
                                <span>성격</span>
                                <span>얌전/보통/활발/매우활발</span>
                            </lable>
                            
                            <select name="personality">
                                <option value="none" selected>ALL</option>
                                <option value="quiet">얌전</option>
                                <option value="friendly">보통</option>
                                <option value="outgoing">활발</option>
                                <option value="energetic">매우활발</option>
                            </select>
                        </li>
                    </ul>
                </li>
                <li class="button">
                    <button class="search" type="submit">검색</button>
                    <button class="reset" >초기화</button>
                </li>
            </ul> 
</form>
         </article>
</body>
</html>