<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	첫 번째 수 : ${param.num1  } <br>
	두 번째 수 : ${param.num2 }
	
	<hr>
	
	<h1>EL을 이용하여 큰 수 출력하기 ( 삼항 연산자 )</h1>
	${param.num1 > param.num2 ? param.num1 : param.num2}
	
	<h1>JSTL을 이용하여 큰 수 구하기</h1>
	<c:if test="${param.num1 > param.num2 }">
		${param.num1 }
	</c:if>
	<c:if test="${param.num1 < param.num2 }">
		${param.num2 }
	</c:if>
	
	<h1>JSTL을 이용하여 큰 수 구하기2</h1>
	<c:choose>
		<c:when test="${param.num1 > param.num2 }">
			${param.num1 }
		</c:when>
		<c:otherwise>
			${param.num2 }
		</c:otherwise>
	</c:choose>
	
	
	
	
</body>
</html>





