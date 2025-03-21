function insert(f){
	if(!f.writer.value){
		alert('작성자를 입력해주세요');
		return;
	}
	
	if(!f.title.value){
		alert('제목을 입력해주세요');
		return;
	}
	
	if(!f.pw.value){
		alert('비밀번호를 입력해주세요');
		return;
	}
	
	if(!f.content.value){
		alert('내용을 입력해주세요');
		return;
	}
	
	f.action = '/chapter17_bbs/BBSController';
	f.submit();
}

//게시글 이동 함수
function view_all(){
	location.href = 'BBSController?cmd=allList'
}