<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 1~100 값의 총 합 출력
	int total = 0;
	for(int i = 0; i <= 100; i++){
		total += i;
	}
	
	pageContext.setAttribute("TOTAL", total);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	총합 : ${TOTAL }
</body>
</html>