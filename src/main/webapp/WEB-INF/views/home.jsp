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
	
	
	<c:forEach items="${resultList}" var="map">
		<p>
			suri_seq: ${map.suri_seq}
		</p>
		<p>
			suri_title: ${map.suri_title}
		</p>
		
		<div style="display: flex;">
	        <div style="flex: 6; display: flex;">
	            
	            <c:forEach begin="1" end="5" var="key" >
		            <div style="
		                flex: 1;
		                background-color: ${(key % 2 == 1) ? "red" : "blue"};
		                height: ${
		                	(map.maxAnswer > 0)
			                	? map[Integer.toString(key)] / map.maxAnswer *  100
			                	: 0
	                	}%;
		                align-self: flex-end;
		            ">
		            </div>
	            </c:forEach>
	            
	        </div>
	        <div style="flex: 4;">
	            <p>1: ${map['1']}명</p>
	            <p>2: ${map['2']}명</p>
	            <p>3: ${map['3']}명</p>
	            <p>4: ${map['4']}명</p>
	            <p>5: ${map['5']}명</p>
	        </div>
	    </div>
	</c:forEach>
	
	



</body>
</html>
