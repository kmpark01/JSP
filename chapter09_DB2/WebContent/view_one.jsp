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
	
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try{
			conn = DBConnect.getConnection();
			String sql = "select * from member where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();	// 쿼리 실행 영역
		%>
	
	<h1><%=id %>회원 데이터</h1>
	
	<form action="update.jsp">
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
		<%
			if(!rs.next()){%>
				<tr>
					<td colspan="7">member 데이터가 없습니다. </td>
				</tr>
			<%}else{
				%>
				<tr>
					<td><%=rs.getInt(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><input type="password" value='<%=rs.getString(3) %>' name="newPw"></td>
					<td><input type="text" value='<%=rs.getString(4) %>' name="newName"></td>
					<td><input type="number" value='<%=rs.getInt(5) %>' name="newAge"></td>
					<td><input type="text" value='<%=rs.getString(6) %>' name="newAddr"></td>
					<td><%=rs.getDate(7) %></td>
				</tr>
			<%
			}
		 %>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="7">
				<input type="button" value="수정" onclick="update_page()">
				<input type="reset" value="다시 작성">
				<input type="hidden" name="id" value="<%= id %>">
			</tr>
		</tfoot>
		
	</table>	
	</form>
	
	<%
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(conn != null) conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				
			}
		}
		
	%>
</body>
<script type="text/javascript">
	function update_page(f){
		if(!f.id.value || !f.pw.value){
			alert('아이디 및 비밀번호를 입력하세요.');
			return;
		}
		f.action = 'update.jsp'
	}
</script>
</html>







