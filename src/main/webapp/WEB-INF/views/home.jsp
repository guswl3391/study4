<%@ page session="false" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<P>  The time on the DB is ${sysdate}. </P>
<P>  count: ${count} </P>
<%-- <P>  surveyPeopleVO: ${surveyPeopleVO} </P> --%>
<P>  surveyPeopleVO2: ${surveyPeopleVO2} </P>


	<c:forEach items="${list}" var = "list">
		<c:out value="${list.sur_title}" />
	
	
	</c:forEach>




</body>
</html>
