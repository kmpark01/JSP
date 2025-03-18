<%@page import="org.joonzis.db.DBConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="index.jsp"/>
	
	<br> <hr> <br>
	
	<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	try {
		conn = DBConnect.getConnection();
		String sql = "select * from member where id=? and pw=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, pw);
		rs = ps.executeQuery();
	%>
	
	<h1><%=id %> 회원의 데이터</h1>
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
				<% if(!rs.next()){ %>
				<tr>
					<td colspan="7">member데이터가 없습니다.</td>
				</tr>
				<%}else{ %>
					<tr>
						<td>
							<%=rs.getInt(1)%>
							<input type="hidden" name="idx" value="<%=rs.getInt(1)%>"> 
						</td>
						<td>
							<%=rs.getString(2) %>
						</td>
						<td>
							<input type="password" name="pw" value="<%=rs.getString(3)%>">
						</td>
						<td>
							<input type="text" name="name" value="<%=rs.getString(4)%>">
						</td>
						<td>
							<input type="number" name="age" value="<%=rs.getInt(5)%>">
						</td>
						<td>
							<input type="text" name="addr" value="<%=rs.getString(6)%>">
						</td>
						<td>
						<%=rs.getDate(7) %> 
						</td>
					</tr>
				<%} %>
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
	<%
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if(rs != null) {rs.close();}
			if(ps != null) {ps.close();}
			if(conn != null) {conn.close();}
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}
	%>
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






