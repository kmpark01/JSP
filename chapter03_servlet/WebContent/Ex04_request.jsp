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
		<p>아이디<input type="text" name="id"></p>
		<p>비밀번호<input type="password" name="password"></p>
		<p>이름<input type="text" name="name"></p>
		<p>이메일<input type="email" name="email"></p>
		<p>성별<input type="radio" name="gender" value="남">남
			  <input type="radio" name="gender" value="여">여
		</p>
		<p>
			취미 :
				<input type="checkbox" name="hobbies" value="게임">게임	
				<input type="checkbox" name="hobbies" value="영화">영화		
				<input type="checkbox" name="hobbies" value="수면">수면	
				<input type="checkbox" name="hobbies" value="운동">운동		
		</p>
		<input type="button" value="전송" onclick="send(this.form)">
	</form>
</body>
<script type="text/javascript">
	function send(f){
		if(f.id.value == ''){
			alert("아이디을 입력하세요");
			return;
		}
		
		if(f.password.value == ''){
			alert("비밀번호를 입력하세요");
			return;
		}
		
		if(f.name.value == ''){
			alert("이름을 입력하세요");
			return;
		}
		
		if(f.email.value == ''){
			alert("이메일을 입력하세요");
			return;
		}
		
		if(f.gender.value == ''){
			alert("성별을 체크하세요");
			return;
		}
		
		let cnt = 0;
		for(let i = 0; i < f.hobbies.length; i++){
			if(f.hobbies[i].checked){
				cnt++;
			}
		}
		
		if(cnt == 0){
			alert('취미를 한 개 이상 입력하세요');
			return;
		}
		
		f.action="Ex04_servlet";
		f.submit();
	}
</script>
</html>