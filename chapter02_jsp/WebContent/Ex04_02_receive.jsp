<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String tel = request.getParameter("tel");
	String gender = request.getParameter("gender");
	String[] hobbies = request.getParameterValues("hobbies");
	String addr = request.getParameter("addr");
	String[] foods = request.getParameterValues("foods");
	String nickname = request.getParameter("nickname");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li>이름 : <%=name %></li>
		<li>나이 : <%=age %></li>
		<li>전화번호 : <%=tel %></li>
		<li>성별 : <%=gender %></li>
		<li>주소 : <%=addr %></li>
		<li>취미 : 
			<%if(hobbies == null){%>
				없음
			<%}else{
				for(int i = 0; i < hobbies.length; i++){%>
					<%=hobbies[i] %>
				<%}
			}%>
		</li>
		<li>좋아하는 음식 : 
		<%if(foods == null){%>
				없음
			<%}else{
				for(int i = 0; i < foods.length; i++){%>
					<%=foods[i] %>
				<%}
			}%>
		</li>
		<li>닉네임 : <%=nickname %></li>
	</ul>
</body>
</html>