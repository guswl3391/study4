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
	<script>
		function onchangeRadio(radioObject) {
			const { value } = radioObject;
			const parent = radioObject.parentElement;
			const input = parent.querySelector('input[name="answer[]"]');
			input.value = value;
		}
	</script>
</head>

<body>


	<form action="/researchSend" method="POST">
		<input type="hidden" name="pno" value="1"> <!-- 아직 처리해야 함 -->
		<input type="hidden" name="sur_seq" value="${surveyVO.sur_seq }">
		
			<p>제목: ${surveyVO.sur_title }</p>
		
			<c:forEach items="${list}" var="item">
				<input type="hidden" name="suri_seq[]" value="${item.suri_seq }">
				<p>제목: ${item.suri_title }</p>
				<p>
					<input type="hidden" name="answer[]" value="">
					
				  <input type="radio" id="radio1${item.suri_seq}" name="radio${item.suri_seq}" value="1" onchange="onchangeRadio(this);">
				  <label for="radio1${item.suri_seq}">1점</label><br>
				
				  <input type="radio" id="radio2${item.suri_seq}" name="radio${item.suri_seq}" value="2" onchange="onchangeRadio(this);">
				  <label for="radio2${item.suri_seq}">2점</label><br>
				
				  <input type="radio" id="radio3${item.suri_seq}" name="radio${item.suri_seq}" value="3" onchange="onchangeRadio(this);">
				  <label for="radio3${item.suri_seq}">3점</label><br>
				
				  <input type="radio" id="radio4${item.suri_seq}" name="radio${item.suri_seq}" value="4" onchange="onchangeRadio(this);">
				  <label for="radio4${item.suri_seq}">4점</label><br>
				
				  <input type="radio" id="radio5${item.suri_seq}" name="radio${item.suri_seq}" value="5" onchange="onchangeRadio(this);">
				  <label for="radio5${item.suri_seq}">5점</label><br>
				</p>
				선택 사유: <input type="text" name="choice_reason[]" value="">
			</c:forEach>
		
		<input type="submit" value="등록">
	</form>
	
	
	
</body>
</html>
