<%@page import="org.joonzis.ex.MemberVO"%>
<%@page import="org.joonzis.ex.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
	request.setCharacterEncoding("utf-8");
	String idx = request.getParameter("idx");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String addr = request.getParameter("addr");
	
	MemberDao dao = MemberDao.getInstance();
	
	MemberVO vo = new MemberVO();
	
	vo.setPw(pw);
	vo.setName(name);
	vo.setAge(Integer.parseInt(age));
	vo.setAddr(addr);
	vo.setIdx(Integer.parseInt(idx));
	
	int result = dao.update(vo);
%>
	<c:choose>
		<c:when test="${result > 0 }">
			<script>
				alert("멤버 수정에 실패했습니다.");
				location.href = 'view_all.jsp';
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("멤버 수정에 성공했습니다.");
				location.href = 'view_all.jsp'
			</script>
		</c:otherwise>
	</c:choose>