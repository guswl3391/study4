<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("utf-8"); %>    

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript">
		function onclickAddQuestion() {
			const divItem = document.getElementById('divItem');
			const p = document.createElement('p');
			p.innerHTML = `질문: <input type="text" name="question[]" />`;
			divItem.append(p);
		}
	</script>
</head>

<body>

	<h3>writeView.jsp</h3>
	
	<form action="/write" method="post">
		<p>
			제목: <input type="text" name="title" />
		</p>
		<p>
			<h4>설문조사 문항들</h4>
		</p>
		<p>
			<input type="button" value="문항 추가" onclick="onclickAddQuestion();" />
		</p>
		<div id="divItem">
<!-- 			<p> -->
<!-- 				질문: <input type="text" name="question[]" /> -->
<!-- 			</p> -->
		</div>
		<p>
			<input type="submit" value="전송" />
		</p>
	</form>

</body>
</html>