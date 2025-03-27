let sendData;

/* ------------ Form 관련 요소들 ---------------*/
const f = document.forms[0];
const mPwValidState = document.querySelector("#mPwValidState");
const mPwReValidState = document.querySelector("#mPwReValidState");
let {pwCk, pwReCk, emailCk} = false;
/* ------------ 정규식 ---------------*/
const regExpPw = /^[0-9a-zA-Z]{8,16}$/;      // 비밀번호 검증 정규식
const regExpEmail = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;   // 이메일 검증 정규식

/* ------------ 함수 ---------------*/
document.querySelectorAll("button").forEach(btn => {
	btn.addEventListener('click', () => {
		let type = btn.getAttribute("id");
		
		if(type === 'updateBtn'){
			update();
		}else if(type === 'resetBtn'){
			f.reset();
		}else{
			// 목록으로 이동
			location.href = 'MemberController?cmd=mainPage';
		}
	});
});

// 데이터 검증 완료 함수
function validated(inputTarget, resultState, comment){
   inputTarget.classList.add("is-valid");
   inputTarget.classList.remove("is-invalid");
   if(resultState){
      resultState.classList.add("valid-feedback");
      resultState.classList.remove("invalid-feedback");
      comment ? 
         resultState.innerHTML = comment : 
            resultState.innerHTML = '' ;
   }
}

// 데이터 검증 미완료 함수
function invalidate(inputTarget, resultState, comment){
   inputTarget.classList.remove("is-valid");
   inputTarget.classList.add("is-invalid");
   if(resultState){
      resultState.classList.remove("valid-feedback");
      resultState.classList.add("invalid-feedback");
      comment ? 
         resultState.innerHTML = comment : 
            resultState.innerHTML = '' ;
   }
}

// 검증 스타일 초기화 함수
function Initialization(inputTarget, resultState){
   inputTarget.classList.remove("is-valid");
   inputTarget.classList.remove("is-invalid");
   if(resultState){
      resultState.classList.remove("valid-feedback");
      resultState.classList.remove("invalid-feedback");
      resultState.innerHTML = '';
   }
}

// 비밀번호 입력 이벤트
f.mPw.addEventListener('keyup', e => {
	let target = e.currentTarget;
	
	if(target.value === ''){
		// 값이 비었을 때
		Initialization(target, mPwValidState);
		pwCk = false;
	}else if(!regExpPw.exec(target.value)){
		// 데이터 검증 미완료
		invalidate(target, mPwValidState, '올바른 형식이 아닙니다');
		pwCk = false;
	}else{
		// 데이터 검증 완료
		validated(target, mPwValidState);
		pwCk = true;
	}
});

// 비밀번호 확인 입력 이벤트
f.mPwRe.addEventListener('keyup', e => {
	let target = e.currentTarget;
	// 값이 비었을 때
	if(target.value === ''){
		Initialization(target, mPwReValidState);
		pwReCk = false;
	}else if(target.value === f.mPw.value){
		validated(target, mPwReValidState);
		pwReCk = true;
	}else{
		invalidate(target, mPwReValidState, '비밀번호가 일치하지 않습니다');
		pwReCk = false;
	}
});

f.mEmail.addEventListener('keyup', e => {
	let target = e.currentTarget;
	
	if(target.value === ''){
		Initialization(target);
		emailCk = false;
	}else if(!regExpEmail.exec(target.value)){
		invalidate(target);
		emailCk = false;
	}else{
		validated(target);
		emailCk = true;
	}
})

function update(){
	if(!pwCk || !emailCk){
		alert("형식을 맞춰서 입력해주세요");
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
		if(data.result === 0){
			alert("회원 정보 수정에 실패했습니다.");
		}else{
			alert("푀원 정보 수정 성공.");
			location.href = "MemberController?cmd=myPage"
		}
	})
	.catch(err => console.log(err));
}

