<%@page import="org.joonzis.ex.MemberVO"%>
<%@page import="org.joonzis.ex.MemberDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");

    MemberDao dao = MemberDao.getInstance();
    
    MemberVO vo = new MemberVO();
    vo.setId(id);
    vo.setPw(pw);

    MemberVO member = dao.getUpdateView(vo);
    
    request.setAttribute("member", member);
%>

<!DOCTYPE html>
<html>
<head>
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
                            <td><input type="hidden" name="idx" value="${member.idx }"></td>
                            <td>${member.id }</td>
                            <td><input type="password" name="pw" value="${member.pw }"></td>
                            <td><input type="text" name="name" value="${member.name }"></td>
                            <td><input type="number" name="age" value="${member.age }"></td>
                            <td><input type="text" name="addr" value="${member.addr }"></td>
                            <td>${member.regdate }</td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th colspan="7">
                                <input type="button" value="수정" onclick="update(this.form)">
                                <input type="reset" value="다시 작성">
                            </th>
                        </tr>
                    </tfoot>
                </table>
            </form>
        </c:otherwise>
    </c:choose>

</body>
<script type="text/javascript">
	function update(f){
		if(!f.pw.value ||
			!f.age.value ||
			!f.name.value ||
			!f.addr.value){
			alert("수정할 내용을 모두 입력하세요.");
			return;
		}
		f.action = 'update.jsp';
		f.submit();
	}
</script>
</html>
