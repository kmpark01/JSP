<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.joonzis.bean.PersonVO" %>
<%
	PersonVO vo = new PersonVO();
	
	vo.setName(request.getParameter("name"));
	vo.setAge(Integer.parseInt(request.getParameter("age")));
	vo.setHeight(Integer.parseInt(request.getParameter("height")));
	vo.setAddr(request.getParameter("addr"));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 
		액션 태그를 이용한 자바 빈 사용바업
		1. 특정 패키지에 자바 빈을 만든다.
		2. 자바 빈을 생성한다.
			<jsp:useBean id="별병" class="패키지.클래스명">
		3. 자바 빈에 값을 저장한다
			<jsp:setProperty property="파라미터명' name="별병">
		4. 자바 빈의 값을 사용한다
			<jsp:getProperty property="파라미터명' name="별병">
	  --%>
	  
	  <jsp:useBean id="mb" class="org.joonzis.bean.PersonVO"></jsp:useBean>
	  <jsp:setProperty property="*" name="mb"/>
	  
	  <h1>
	  	이름 : <%=vo.getName() %>
	  	나이 : <%=vo.getAge() %>
	  	키 : <%=vo.getHeight() %>
	  	주소 : <%=vo.getAddr() %>
	  </h1>
</body>
</html>