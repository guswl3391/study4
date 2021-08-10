<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<title>서울학교급식포털</title>
	<link href="/resources/css/base.css" rel="stylesheet" type="text/css" />
	<link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
</head>

<body>
	<ol>
		<c:forEach items="${list}" var="item">
			<li>
				<p>
					No.: ${item.rnum}
				</p>
				<p>
					제목: ${item.sur_title}
				</p>
				<p>
					시작일: ${item.sur_sat_date}
				</p>
				<p>
					마감일: ${item.sur_end_date}
				</p>
				<p>
					완료 여부: ${item.finish_yn} 
				</p>
				<p>
					참여 여부: ${item.answer_yn}
				</p>
				<p>
					결과 보기: ???
				</p>
			</li>
		</c:forEach>
		
		<div class="paging">
			<div class="paging-body">
				<div class="text-center mt-5 mb-5">
				 	<ul class="pagination">
	                  	<li><a href="researchList${pageMaker.makeTopPage()}">[처음]</a></li>
	                  	<li><a href="researchList${pageMaker.makePrevPage()}">[이전]</a></li>
					    
					    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx" >
					    	<li><a href="researchList${pageMaker.makeSearch(idx)}"> ${idx}</a></li>
					    </c:forEach>
					
				    	<li><a href="researchList${pageMaker.makeNextPage()}">[다음]</a></li>
				    	<li><a href="researchList${pageMaker.makeLastPage()}">[끝]</a></li>
	           		</ul>
           		</div>
			</div>
		</div>
	</ol>
</body>

</html>
