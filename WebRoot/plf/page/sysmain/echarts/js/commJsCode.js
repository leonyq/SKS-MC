function isBlank(){
	var validates = true;
	$(".isBlank").each(function(index,item){
		var vals = $(this).val();
		if(val.isBlank(vals)){
			_alertValMsg($(this),"<dict:lang value="不能为空" />");
			validates = false;
			return false;
		};
	});
	return validates;
}

function valIsNum(){
	var validates = true;
	$(".isNum").each(function(index,item){
		var vals = $(this).val();
		if(!val.isNumOrEmpty(vals)){
			var msg = vals == ""?"不能为空":"数据格式错误";
			_alertValMsg($(this),"<dict:lang value='"+msg+"' />");
			validates = false;
			return false;
		};
	});
	return validates;
}

function isNumComma(){
	var validates = true;
	$(".isNumComma").each(function(index,item){
		var vals = $(this).val();
		if(!val.isNumComma(vals)){
			var msg = vals == ""?"不能为空":"数据格式错误";
			_alertValMsg($(this),"<dict:lang value='"+msg+"' />");
			validates = false;
			return false;
		};
	});
	return validates;
}

function isNumCommaOrNull(){
	var validates = true;
	$(".isNumCommaOrNull").each(function(index,item){
		var vals = $(this).val();
		if(!val.isNumCommaOrNull(vals)){
			var msg = vals == ""?"不能为空":"数据格式错误";
			_alertValMsg($(this),"<dict:lang value='"+msg+"' />");
			validates = false;
			return false;
		};
	});
	return validates;
}