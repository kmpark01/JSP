let aEle = document.querySelector("#download");
if(aEle != null){
	aEle.addEventListener("click", function(e){
		e.preventDefault();
	
		let filename = this.getAttribute('href');
		
		let sendData = `cmd=download&filename=${filename}`;
		location.href = `BBSController?${sendData}`;	
	});
}