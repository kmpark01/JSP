<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.joonzis.bean.MemberDTO" %>
<%
	// 클래스 파일(bean)을 이용하여 데이터 저장, 사용
	MemberDTO m = new MemberDTO();
	
	m.setId("admin");
	m.setPw("1234");
	m.setName("박경민");
	m.setAge(26);
	m.setAddr("구리");
	m.setGender("남");
	
	String hobbies[] = {"게임", "야구"};
	m.setHobbies(hobbies);
	String likeFoods[] = {"초밥"};
	m.setLikeFoods(likeFoods);
	String dislikeFoods[] = {"고수"};
	
	m.setDislikeFoods(dislikeFoods);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li><%=m.getId() %></li>
		<li><%=m.getPw() %></li>
		<li><%=m.getName() %></li>
		<li><%=m.getAge() %></li>
		<li><%=m.getAddr() %></li>
		<li><%=m.getGender() %></li>
		<li><%
				for(String hobby : m.getHobbies()){
					out.print(hobby + "");
				}
			%>
		</li>
		<li><%
				for(String food : m.getLikeFoods()){
					out.print(food + "");
				}
			%>
		</li>
		<li><%
				for(String food : m.getDislikeFoods()){
					out.print(food + "");
				}
			%>
		</li>
	</ul>
</body>
</html>