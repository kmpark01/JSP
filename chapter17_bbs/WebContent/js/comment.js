function insert_comment(f){
	if(!f.writer.value){
		alert('작성자를 입력하세요.');
		return;
	}
	if(!f.pw.value){
		alert('비밀번호를 입력하세요.');
		return;
	}
	if(!f.content.value){
		alert('내용을 입력하세요.');
		return;
	}
	
	let formData = new FormData(f);
	
	// 직렬화
	let serializedData = 
		new URLSearchParams(formData).toString();
	
	fetch(`CommentController?${serializedData}`)
		.then(response => response.json())
		.then(json => {
			console.log(json)
		})
		.catch(err => console.log(err));
	
	
}


