<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// 쿠키 삭제는 기존 쿠키의 유효 시간을 0으로 바꾼다.
		// 1. 이름이 name인 쿠키 삭제
		Cookie[] cookieBox = request.getCookies();
	
		if(cookieBox != null && cookieBox.length > 0){
			for(int i = 0; i < cookieBox.length; i++){
				if(cookieBox[i].getName().equals("name")){
					cookieBox[i].setMaxAge(0);
					response.addCookie(cookieBox[i]);
					out.print("쿠키를 삭제했습니다.");
				}	
			}
		}else{
			out.print("쿠키가 존재하지 않습니다.");
		}
		
	%>
</body>
</html>