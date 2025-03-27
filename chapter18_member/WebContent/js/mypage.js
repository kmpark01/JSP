let sendData;

/* ------------ Form 관련 요소들 ---------------*/
const f = document.forms[0];

/* ------------ 함수 ---------------*/

document.querySelectorAll("button").forEach(btn => {
	btn.addEventListener('click', () => {
		let type = btn.getAttribute("id");
		
		if(type === 'updateBtn'){
			location.href = 'MemberController?cmd=update'
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