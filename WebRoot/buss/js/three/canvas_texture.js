/**
 * 获取画布材质
 * @param text：输入内容
 */
function gainCanvasTexture(text,width,height,font){
	canvasTexture = document.createElement('canvas');
	canvasTexture.style.border="0px";  
	canvasTexture.width=(width==undefined?500:width);
	canvasTexture.height=(height==undefined?200:height);
	var ctx = canvasTexture.getContext('2d');
	ctx.font=(font==undefined?"130px Arial":font);
	ctx.fillText(text,50,140); 
	return canvasTexture;
}