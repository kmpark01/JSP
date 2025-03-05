<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		<p>이름 : <input type="text" name="name"></p>
		<p>나이 : <input type="number" name="age"></p>
		<p>전화번호 : <input type="tel" name="tel"></p>
		<p>성별 : <input type="radio" name="gender" value="남">남
				 <input type="radio" name="gender" value="여">여
		</p>
		<p>
			취미 :
				<input type="checkbox" name="hobbies" value="영화">영화		
				<input type="checkbox" name="hobbies" value="게임">게임		
				<input type="checkbox" name="hobbies" value="독서">독서		
				<input type="checkbox" name="hobbies" value="여행">여행		
				<input type="checkbox" name="hobbies" value="기타">기타		
			
		</p>
		<p>주소 : 
			<select name="addr">
				<option value="서울">서울</option> 
				<option value="경기">경기</option> 
				<option value="인천">인천</option> 
			</select>
		</p>
		<p>
			좋아하는 음식 :
			<select name="foods" size="4" multiple>
				<option value="피자">피자</option>
				<option value="피자">만두</option>
				<option value="피자">라면</option>
				<option value="피자">초밥</option>
			</select>
		</p>
		<input type="button" value="전송" onclick="send(this.form);">
		<button type="reset">초기화</button>
		<input type="hidden" name="nickname" value="joonzis">
	</form>
</body>
<script type="text/javascript">
	function send(f){
		f.action ="Ex04_02_receive.jsp";
		f.submit();
	}
</script>
</html>