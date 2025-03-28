<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/updatepage.css">
</head>
<body>
	<section class="bg-light">
		<div class="container-sm">
			<div class="row align-items-center justify-content-between">
				<a class="navbar-brand h1 text-center">회원 정보 변경</a>
			</div>
			<form class="needs-validation" novalidate>
				<div class="form-group">
					<label class="form-label mt-4" for="mId">아이디</label>
					<div class="input-group">
						<input type="text" class="form-control" id="mId" name="mId"
							placeholder="영어 소문자로 시작, 영어 + 숫자 조합 3~12 글자" value="${mvo.mId }" maxlength="12" readonly>
					</div>
				</div>
				<div class="form-group">
					<label class="form-label mt-4" for="mPw">비밀번호</label> <input
						type="password" class="form-control" id="mPw" name="mPw"
						placeholder="영어 소문자, 대문자, 숫자 8~16 글자">
					<div class="invalid-feedback" id="mPwValidState"></div>
				</div>
				<div class="form-group">
					<label class="form-label mt-4" for="mPwRe">비밀번호 재확인</label> <input
						type="password" class="form-control" id="mPwRe" name="mPwRe">
					<div class="invalid-feedback" id="mPwReValidState"></div>
				</div>
				<div class="form-group">
					<label class="form-label mt-4" for="mName">이름</label> <input
						type="text" class="form-control" id="mName" name="mName"
						maxlength="12" placeholder="한글, 영어 2~12 글자" value="${mvo.mName }" readonly>
				</div>
				<div class="form-group">
					<label class="form-label mt-4" for="mEmail">이메일</label> <input
						type="text" class="form-control" id="mEmail" name="mEmail"
						placeholder="@ 포함 전체 이메일" value="${mvo.mEmail }">
				</div>
				<div class="form-group mb-2 btn-div">
					<button type="button" class="btn btn-primary btn-lg" id="updateBtn">수정</button>
					<button type="button" class="btn btn-secondary btn-lg"
						id="resetBtn">다시작성</button>
					<button type="button" class="btn btn-secondary btn-lg" id="mainBtn">목록</button>
				</div>
				<input type="hidden" name="cmd" value="updateMember">
			</form>
		</div>
	</section>
</body>
<script type="text/javascript" src="js/updatepage.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</html>