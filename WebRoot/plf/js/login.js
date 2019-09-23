
function encrypt(key,pw){
	var keyLen = key.length;
	var k=0;
	var newPw ="";
	for(var i=0,j=pw.length;i<j;i++,k++){
		if(k== keyLen){k=0}
		if(k<keyLen){
			newPw+= String.fromCharCode(pw.charCodeAt(i) ^ key.charAt(k));
		}
	}
	return newPw;
}