<%@page import="org.joonzis.ex.MemberVO"%>
<%@page import="org.joonzis.ex.MemberDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	MemberDao dao = MemberDao.getInstance();
	
	MemberVO vo = new MemberVO();
	
	vo.setId(id);
	vo.setPw(pw);
	
	int result = dao.remove(vo);
%>

	<c:choose>
		<c:when test="${result > 0 }">
			<script>
				alert("멤버 삭제에 실패했습니다.");
				location.href = 'view_all.jsp';
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("멤버 삭제에 성공했습니다.");
				location.href = 'view_all.jsp'
			</script>
		</c:otherwise>
	</c:choose>