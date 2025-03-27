<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/mypage.css">
</head>
<body>
	<section class="bg-light">
        <div class="container-sm">
            <div class="row align-items-center justify-content-between">
                <a class="navbar-brand h1 text-center" href="MemberController?cmd=loginPage">마이페이지</a>
            </div>
            <form class="needs-validation" novalidate>
                <div class="form-group">
               		<label class="form-label mt-4" for="mId">아이디</label>
					${mvo.mId }
                </div>
				<div class="form-group">
					<label class="form-label mt-4" for="mPw">비밀번호</label>
					${mvo.mPw }
				</div>
				<div class="form-group">
					<label class="form-label mt-4" for="mName">이름</label>
					${mvo.mName }
				</div>
				<div class="form-group">
					<label class="form-label mt-4" for="mPw">이메일</label>
					${mvo.mEmail }
				</div>
				<div class="form-group mb-2 btn-div">
					<button type="button" class="btn btn-primary btn-lg" id="updateBtn">수정</button>
					<button type="button" class="btn btn-secondary btn-lg" id="mainBtn">메인</button>
                </div>
                <input type="hidden" name="cmd" value="${mvo.m_idx }">
            </form>
        </div>
    </section>
</body>
<script type="text/javascript" src="js/mypage.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</body>
</html>