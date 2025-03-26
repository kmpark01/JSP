let sendData;

/* ------------ Form 관련 요소들 ---------------*/
const f = document.forms[0];
const LOGIN_FAIL_MSG = '아이디 또는 비밀번호가 일치하지 않습니다.';
let {idCk, pwCk} = false;

/* ------------ 함수 ---------------*/
document.querySelectorAll("button").forEach(btn => {
	btn.addEventListener('click', () => {
		let type = btn.getAttribute("id");
		
		if(type === 'loginBtn'){
			login();
		}else{
			// 목록으로 이동
			location.href = 'MemberController?cmd=mainPage';
		}
	});
});

// login() 함수 - 아이디, 비밀번호 빈 값 검증 후 데이터 전송 - json 형식으로 id,pw전송
// 프로퍼티 명 : (mId, mPw, cmd) * cmd = login
// DB내에 id와 pw가 일치하면 vo 반환 받고 화면으로 'success' 리턴
// success 시 메인 화면으로 이동
// 'fail'시 오류 문구 출력(LOGIN_FAIL_MSG)
f.mId.addEventListener('keyup', e => {
	let target = e.currentTarget;
	if(target.value === ''){
		Initialization(target);
		idCk = false;
	}else{
		idCk = true;
	}
});

f.mPw.addEventListener('keyup', e => {
	let target = e.currentTarget;
	
	if(target.value === ''){
		Initialization(target);
		pwCk = false;
	}else{
		pwCk = true;
	}
});

function login(){
	
	if(!idCk || !pwCk){
		alert(LOGIN_FAIL_MSG);
		return;	
	}
	
	// post 방식 - json 전달
	// FormData 객체 생성
	let formData = new FormData(f);
	
	// formdata to json
	let jsonData = JSON.stringify(Object.fromEntries(formData.entries()));
		
	fetch(`MemberAsyncController`, {
		method : 'post',
		body : jsonData,
		headers : {
			'Content-type' : 'application/json; charset=utf-8'
		}
	})
	.then(response => response.json())
	.then(data => {
		console.log(data.result);
		console.log(typeof data.result);
		if(data.result === '1'){
			alert("로그인 성공.");
			location.href = "MemberController?cmd=mainPage"
		}else{
			alert(LOGIN_FAIL_MSG);
		}
	})
	.catch(err => console.log(err));
}