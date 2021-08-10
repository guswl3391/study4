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


	<form action="/researchSend" method="POST">
		<input type="hidden" name="pno" value="1"> <!-- 아직 처리해야 함 -->
		<input type="hidden" name="sur_seq" value="${surveyVO.sur_seq }">
		
			<p>제목: ${surveyVO.sur_title }</p>
		
			<c:forEach items="${list}" var="item" >
				<input type="hidden" name="suri_seq[]" value="${item.suri_seq }">
				<p>제목: ${item.suri_title }</p>
				응답 1~5: <input type="text" name="answer[]" value="">
				선택 사유: <input type="text" name="choice_reason[]" value="">
			</c:forEach>
		
		<input type="submit" value="등록">
	</form>
	
	
	
</body>
</html>
