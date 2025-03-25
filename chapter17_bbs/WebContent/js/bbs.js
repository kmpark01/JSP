// 게시글 등록 화면 이동 함수
function moveInsertPage(){
	location.href='BBSController?cmd=insertBBSPage';
}

// 게시글 등록 함수
function insert(f){
	if(!f.writer.value){
		alert("작성자를 입력하세요.");
		return;
	}
	if(!f.title.value){
		alert("제목을 입력하세요.");
		return;
	}
	if(!f.pw.value){
		alert("비밀번호를 입력하세요.");
		return;
	}
	if(!f.content.value){
		alert("내용을 입력하세요.");
		return;
	}
	f.action = 'BBSController';
	f.submit();
}

// 목록으로 이동 함수
function view_all(event){
	event.preventDefault(); // 기본 링크 동작 방지

	let pageNum = event.currentTarget.getAttribute('href');
	console.log(pageNum);
	/*location.href = 'BBSController?cmd=allList';*/
}

// 수정 페이지 이동 함수
function updatePage(){
	location.href = 'BBSController?cmd=updatePage';
}
// 게시글 삭제 함수
function removeBBS(b_idx){
	alert("게시글이 삭제되었습니다.")
	location.href = `BBSController?cmd=remove&b_idx=${b_idx}`;
}
// 게시글 수정 함수
function update(f, pw){
	// 파라미터 pw == 세션에 저장된 실제 비밀번호
	if(f.pw.value != pw){
		alert("비밀번호가 일치하지 않습니다.");
		return;
	}
	if(!f.title.value){
		alert("제목을 입력해주세요.");
		return;
	}
	if(!f.content.value){
		alert("내용을 입력해주세요.");
		return;
	}
	f.action = "BBSController";
	f.submit();
}

// 페이지 버튼 클릭 이벤트
let aEles = document.querySelectorAll(".page-nation li a");
aEles.forEach( aEle => {
	aEle.addEventListener('click', function(e){
		e.preventDefault();
		
		let pageNum = this.getAttribute('href');
		
		let sendData = `cmd=allList&pageNum=${pageNum}&amount=5`;
		location.href = `BBSController?${sendData}`;
		
		console.log(pageNum);
	});
});








