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

<script type="text/javascript" >
</script>

</head>

<body>
	<form action="/edit" method="POST">
		<input type="hidden" name="sur_seq" value="${surveyVO.sur_seq }" /> <!-- 컨트롤러 가서 가져와야 함 --> 
			
		
		<p>
			제목: <input type="text" name="sur_title" value="${surveyVO.sur_title }"/>	
		</p>
		
		<c:forEach items="${list}" var="item">
			<p>
				문항: <input type="text" name="suri_title[]" value="${item.suri_title }"/>
				<input type="hidden" name="suri_seq[]" value="${item.suri_seq }" />
			</p>
		</c:forEach>
		
		<input type="submit" value="등록"/>
	
	</form>
</body>

</html>
