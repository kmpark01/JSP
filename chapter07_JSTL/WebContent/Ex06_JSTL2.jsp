<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 1. 최소, 최대 값 화면에 출력  --> 
	<c:choose>
		<c:when test="${param.num1+0 > param.num2+0 }">
			최소 값 : ${param.num2 }
			최대 값 : ${param.num1 }
			<c:set var="start" value="${param.num2 }"/>
			<c:set var="end" value="${param.num1 }"/>
		</c:when>
		<c:otherwise>
			최소 값 : ${param.num1 }
			최대 값 : ${param.num2 }
			<c:set var="start" value="${param.num1 }"/>
			<c:set var="end" value="${param.num2 }"/>
		</c:otherwise>
	</c:choose>
	<br>
	<!-- 2. 최소 값 부터 최대 값 까지 1씩 증가하는 값 출력 -->
	<c:forEach var="i" begin="${start }" end="${end }" step="1">
		${i }
	</c:forEach>
	
	<!-- 3. 향상 forEach를 이용하여 음식 종류 출력 -->
	<c:forEach var="food" items="${paramValues.foods }">
		${food } <br>
	</c:forEach>
</body>
</html>







