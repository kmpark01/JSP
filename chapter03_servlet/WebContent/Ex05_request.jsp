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
		<div>이름<input type="text" name="name"></div>
		<div>국어<input type="text" name="kor"></div>
		<div>영어<input type="text" name="eng"></div>
		<div>수학<input type="text" name="mat"></div>
		<input type="button" value="전송" onclick="send(this.form)">
	</form>
</body>
<script type="text/javascript">
	function send(f){
		if(!f.name.value ||
				!f.kor.value ||
				!f.eng.value ||
				!f.mat.value){
			alert('값을 입력해주세요');
			return;
		}
		
		f.action="Ex05_servlet";
		f.submit();
	}
</script>
</html>