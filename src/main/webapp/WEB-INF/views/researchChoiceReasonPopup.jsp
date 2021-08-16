<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>서울학교급식포털</title>
<link href="/resources/css/base.css" rel="stylesheet" type="text/css" />
<link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!-- w100% h450px -->
<div class="pop">
  <div class="pop_box">
    <h1>사유전체보기</h1>
    <div class="pop_list">
      <div class="research_box">
      	<c:forEach items="${itemList}" var="surveyItemVO">
      		<h2>${surveyItemVO.suri_title}</h2>
      		
      		<ul class="research_list">
      			<c:choose>
                	<c:when test="${surveyItemVO.answerList.size() == 0}">
                		<li>* 없습니다.</li>
                	</c:when>
                	<c:otherwise>
	                	<c:forEach items="${surveyItemVO.answerList}" var="surveyAnswerVO">
			      			<li>${surveyAnswerVO.choice_reason}</li>
			      		</c:forEach>
					</c:otherwise>
                </c:choose>
      		</ul>
      	</c:forEach>
      </div>
    </div>
    <p class="pt20"></p>
    <div class="pop_btn"> <span class="blue_l"><a href="#" class="blue_r">확인</a></span> <span class="gray_l"><a href="#" class="gray_r">취소</a></span> </div>
  </div>
</div>
</body>
</html>
