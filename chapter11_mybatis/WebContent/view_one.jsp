<%@page import="org.joonzis.ex.MemberVO"%>
<%@page import="org.joonzis.ex.MemberDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("id");

    MemberDao dao = MemberDao.getInstance();
    
    MemberVO vo = new MemberVO();
    vo.setId(id);

    MemberVO member = dao.search(vo);
    
    request.setAttribute("member", member);
%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	h1{
		text-align: center;
	}	
</style>
    <meta charset="UTF-8">
    <title>회원 정보 조회</title>
</head>
<body>
    <jsp:include page="index.jsp"/>

    <br> <hr> <br>

    <h1>${member.id} 회원 정보</h1>

    <c:choose>
        <c:when test="${empty member}">
            <p>회원 데이터가 없습니다.</p>
        </c:when>
        <c:otherwise>
            <form method="post">
                <table>
                    <thead>
                        <tr>
                            <th>회원번호</th>
                            <th>아이디</th>
                            <th>비밀번호</th>
                            <th>이름</th>
                            <th>나이</th>
                            <th>주소</th>
                            <th>가입일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${member.idx }</td>
                            <td>${member.id }</td>
                            <td>${member.pw }</td>
                            <td>${member.name }</td>
                            <td>${member.age }</td>
                            <td>${member.addr }</td>
                            <td>${member.regdate }</td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </c:otherwise>
    </c:choose>

</body>
</html>
