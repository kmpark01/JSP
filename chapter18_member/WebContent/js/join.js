let sendData;

/* ------------ Form 관련 요소들 ---------------*/
const f = document.forms[0];
const mIdValidState = document.querySelector("#mIdValidState");
const mPwValidState = document.querySelector("#mPwValidState");
const mPwReValidState = document.querySelector("#mPwReValidState");
let {idCk, pwCk, pwReCk, nameCk, emailCk} = false; // 검증

/* ------------ 정규식 ---------------*/
const regExpId = /^[a-z]+[0-9a-z]{3,12}$/;   // 아이디 검증 정규식
const regExpPw = /^[0-9a-zA-Z]{8,16}$/;      // 비밀번호 검증 정규식
const regExpName = /^[가-힣a-zA-Z]{2,12}$/;   // 이름 검증 정규식 
const regExpEmail = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;   // 이메일 검증 정규식

/* ------------ 함수 ---------------*/

document.querySelectorAll("button").forEach(btn => {
	btn.addEventListener('click', () => {
		let type = btn.getAttribute("id");
		
		if(type === 'duplicateCkBtn'){
			// id 중복 확인
			validateId();
		}else if(type === 'joinBtn'){
			// 회원가입
			join();
		}else if(type === 'resetBtn'){
			// 다시 작성
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

// Id 중복 검증 이벤트
function validateId(){
	let target = f.mId;
	
	if(target.value == ''){
		Initialization(target, mIdValidState);
		alert("아이디를 입력하세요.");
		idCk = false;
		return;
	}else if(!regExpId.exec(target.value)){
		invalidate(target, mIdValidState, "형식에 맞지 않은 아이디입니다.");
		idCk = false;
		return;
	}
	
	const params = {
		cmd : 'validateId',
		mId : target.value
	};
	
	const queryString = Object.keys(params).map(key => encodeURIComponent(key) + '=' +
														encodeURIComponent(params[key])).join('&');
														
	fetch(`MemberAsyncController?${queryString}`)
		.then(response => response.json())
		.then(data => {
			if(data.result == 0){
				validated(target, mIdValidState, '사용 가능한 아이디입니다.');
				idCk = true;
				// 데이터 검증 후 변경 불가
				target.setAttribute('readonly', true);
			}else{
				invalidate(target, mIdValidState, '중복된 아이디입니다.');
				idCk = false;
			}
		})
		.catch(err => console.log(err));
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

f.mName.addEventListener('keyup', e => {
	let target = e.currentTarget;
	
	if(target.value === ''){
		// 값이 비었을 때
		Initialization(target);
		nameCk = false;
	}else if(!regExpName.exec(target.value)){
		invalidate(target);
		nameCk = false;
	}else{
		validated(target);
		nameCk = true;
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

// 회원가입
function join(){
	
	if(!idCk || !pwCk || !nameCk || !emailCk){
		alert("모든 입력 내용을 입력해주세요");
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
			alert("회원가입이 실패했습니다.");
		}else{
			alert("회원가입 성공.");
			location.href = "MemberController?cmd=mainPage"
		}
	})
	.catch(err => console.log(err));
}