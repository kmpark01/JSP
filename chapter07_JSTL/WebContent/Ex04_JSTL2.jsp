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
	<!-- 
	 	Ex04_JSTL2.jsp에서 할 일
	 	1. 변수 생성 - avg, grade, pass
	 	* 90점 이상 A, 80점 이상 B...
	 	2. 합/불합 출력 
	 	* 평균이 60이상이면 합격
	 	3. 데이터 출력
	 	* 국,영,수,평균,학점,합격 여부
	  -->
	<c:set var="avg" value="${(param.kor+param.eng+param.mat ) / 3}"/>
	
	<c:choose>
		<c:when test="${avg >= 90 }">
			<c:set var="grade" value="A"/>
		</c:when>
		<c:when test="${avg >= 80 }">
			<c:set var="grade" value="B"/>
		</c:when>
		<c:when test="${avg >= 70 }">
			<c:set var="grade" value="C"/>
		</c:when>
		<c:when test="${avg >= 60 }">
			<c:set var="grade" value="D"/>
		</c:when>
		<c:otherwise>
			<c:set var="grade" value="F"/>
		</c:otherwise>
	</c:choose>
	
	<c:if test="${avg ge 60 }">
		<c:set var="pass" value="합격"/>
	</c:if>
	<c:if test="${avg < 60 }">
		<c:set var="pass" value="불합격"/>
	</c:if>
	
	<h1>성적 결과</h1>
	<ul>
		<li>국어 : ${param.kor } </li>
		<li>영어 : ${param.eng } </li>
		<li>수학 : ${param.mat } </li>
		<li>평균 : ${avg } </li>
		<li>학점 : ${grade } </li>
		<li>합격여부 : ${pass } </li>
	</ul>
	
	
	
	  
	  
	  
</body>
</html>