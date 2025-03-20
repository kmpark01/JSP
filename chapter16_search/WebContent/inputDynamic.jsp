<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html>
<head>
<meta charset="UTF-8">
<title>검색 페이지</title>
<style type="text/css">
   div {
      width: 800px;
      text-align: center;
      margin: auto;
   }
   table {
      width: 100%;
      border-collapse: collapse;
   }
   th, td {
      border: 1px solid gray;
   }
   th {
      padding: 5px;
      background-color: darkslateblue;
      color: white;
   }
</style>
</head>
<body>
	<div>
		<form action="/chapter16_search/Controller" method="GET">
			<h1>무엇을 검색 하시겠습니까?</h1>
			<table>
				<tr>
					<th>검색 옵션</th>
				</tr>
				<tr>
					<td>
						<label for="searchType">선택 검색</label>
						<select name="searchType" id="searchType">
							<option value="name">성명</option>
							<option value="department">부서 번호</option>
							<option value="employee">사원 번호</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<label for="searchQuery">입력 검색</label>
						<input type="text" name="searchQuery" id="searchQuery">
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="검색">
						<input type="hidden" name="cmd" value="dynamiclist">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
