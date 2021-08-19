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
    <h1>사유전체보기: ${surveyItemVO.suri_title}</h1>
    <div class="pop_list">
      <div class="research_box">
		<h2>${surveyItemVO.question1}</h2>
		<ul class="research_list">
			<c:choose>
               	<c:when test="${nestedList.get(0).size() == 0}">
               		<li>==사유가 없습니다.==</li>
               	</c:when>
               	<c:otherwise>
                	<c:forEach items="${nestedList.get(0)}" var="surveyAnswerVO">
		      			<li>${surveyAnswerVO.choice_reason}</li>
		      		</c:forEach>
				</c:otherwise>
             </c:choose>
		</ul>
		
		<h2>${surveyItemVO.question2}</h2>
		<ul class="research_list">
			<c:choose>
               	<c:when test="${nestedList.get(1).size() == 0}">
               		<li>==사유가 없습니다.==</li>
               	</c:when>
               	<c:otherwise>
                	<c:forEach items="${nestedList.get(1)}" var="surveyAnswerVO">
		      			<li>${surveyAnswerVO.choice_reason}</li>
		      		</c:forEach>
				</c:otherwise>
             </c:choose>
		</ul>
		
		<h2>${surveyItemVO.question3}</h2>
		<ul class="research_list">
			<c:choose>
               	<c:when test="${nestedList.get(2).size() == 0}">
               		<li>==사유가 없습니다.==</li>
               	</c:when>
               	<c:otherwise>
                	<c:forEach items="${nestedList.get(2)}" var="surveyAnswerVO">
		      			<li>${surveyAnswerVO.choice_reason}</li>
		      		</c:forEach>
				</c:otherwise>
             </c:choose>
		</ul>
		
		<h2>${surveyItemVO.question4}</h2>
		<ul class="research_list">
			<c:choose>
               	<c:when test="${nestedList.get(3).size() == 0}">
               		<li>==사유가 없습니다.==</li>
               	</c:when>
               	<c:otherwise>
                	<c:forEach items="${nestedList.get(3)}" var="surveyAnswerVO">
		      			<li>${surveyAnswerVO.choice_reason}</li>
		      		</c:forEach>
				</c:otherwise>
             </c:choose>
		</ul>
		
		<h2>${surveyItemVO.question5}</h2>
		<ul class="research_list">
			<c:choose>
               	<c:when test="${nestedList.get(4).size() == 0}">
               		<li>==사유가 없습니다.==</li>
               	</c:when>
               	<c:otherwise>
                	<c:forEach items="${nestedList.get(4)}" var="surveyAnswerVO">
		      			<li>${surveyAnswerVO.choice_reason}</li>
		      		</c:forEach>
				</c:otherwise>
             </c:choose>
		</ul>
		
<%--    		<c:forEach begin="1" end="5" var="number" > --%>
<%-- 			<h2>${surveyItemVO["question" + number]}</h2> --%>
<!-- 			java.lang.NumberFormatException: For input string: "question" -->
<!-- 			<ul class="research_list"> -->
<%-- 				<c:choose> --%>
<%-- 	               	<c:when test="${nestedList.get(number - 1).size() == 0}"> --%>
<!-- 	               		<li>==사유가 없습니다.==</li> -->
<%-- 	               	</c:when> --%>
<%-- 	               	<c:otherwise> --%>
<%-- 	                	<c:forEach items="${nestedList.get(number - 1)}" var="surveyAnswerVO"> --%>
<%-- 			      			<li>${surveyAnswerVO.choice_reason}</li> --%>
<%-- 			      		</c:forEach> --%>
<%-- 					</c:otherwise> --%>
<%-- 	             </c:choose> --%>
<!-- 			</ul> -->
<%--    		</c:forEach> --%>
      </div>
    </div>
    <p class="pt20"></p>
    <div class="pop_btn"> <span class="blue_l"><a href="#" class="blue_r">확인</a></span> <span class="gray_l"><a href="#" class="gray_r">취소</a></span> </div>
  </div>
</div>
</body>
</html>
