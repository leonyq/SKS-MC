//入参:callBackFun为回调方法(不能为空)，msg为提示信息,paramObj为回调方法的参数，如下格式
/*	var paramObj =new Object;
		paramObj.url = url;
		paramObj.uid = uid;
*/
	
function _confirm(callBackFun, msg,paramObj) {
	if (null == msg || "" == msg) {
		msg = _popmenu_js_msg;
	}
	var topMaskLayDiv = document.getElementById("_top_mask_lay_confirmDiv");
	if(null==topMaskLayDiv){
		var divStr = "<div id=\"_top_mask_lay_confirmDiv\" style=\"display:none;position: absolute;cursor: wait;filter:alpha(Opacity=20);-moz-opacity:0.2;opacity: 0.2;z-index:9998;background-color:#8298AC;border:none;margin:0;padding:0;width:100%;height:100%;top:0;left:0\"></div>\n"+
		"<div class=\"popmenu\" id=\"msgDiv1\" tabindex=\"0\" >\n" +
		"  <div style=\"z-index: 99998;height:60px; line-height:20px; margin-top:50px; font-size:14px;\">    <img src=\""+ util.getContextPath()+"/plf/style/css2/images/tb.gif\" /><span id='popmenu_msg'></span></div>\n" + 
		"    <div>  <input type=\"button\" value=\"&nbsp;"+_GLO_VALIDATE_OK+"&nbsp;\" class=\"botton_img_add\" id=\"msgShut1\">  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"button\" value=\"&nbsp;"+_GLO_VALIDATE_CANCEL+"&nbsp;\" class=\"botton_img_search\" id=\"msgShut2\">  </div>\n" + 
		"    </div><div id=\"bgDiv1\"></div>";

		var tmpDiv = document.createElement("div");
		tmpDiv.innerHTML = divStr;
		var body = document.getElementsByTagName("body")[0];
		body.appendChild(tmpDiv);
		topMaskLayDiv = document.getElementById("_top_mask_lay_confirmDiv");
	}
	
	msg+="?";
	document.getElementById("popmenu_msg").innerHTML = msg;
	var bgObj = document.getElementById("bgDiv1");
	bgObj.style.width = 0 + "px";
	bgObj.style.height = 0 + "px";
	topMaskLayDiv.style.display = "block";
	var msgObj = document.getElementById("msgDiv1");
	msgObj.style.display = bgObj.style.display = "block";
	msgObj.style.marginTop = -75 + document.documentElement.scrollTop + "px";
	var msgShut1 = document.getElementById("msgShut1");
	msgShut1.onclick = function () {
		bgObj.style.display = msgObj.style.display = "none";
		topMaskLayDiv.style.display = "none";
		callBackFun(paramObj);
	};
    //响应键盘事件
	$("#msgDiv1").keyup(function (event) {
        // 获取键值
		var keyEvent = event || window.event;
		var key = keyEvent.keyCode;
        //获得当前对象
		var input_blur = $(this);
		switch (key) {
		  case 27://按下esc键，取消
				bgObj.style.display = msgObj.style.display = "none";
				topMaskLayDiv.style.display = "none";
			break;
		}
	});
	
	msgObj.style.display = bgObj.style.display = "block";
	document.getElementById("msgShut2").onclick = function () {
		bgObj.style.display = msgObj.style.display = "none";
		topMaskLayDiv.style.display = "none";
	};
	document.getElementById("msgShut1").focus();//默认选中确定按钮
}

//增加layui 提示窗方法
function _confirm_(callBackFun, msg,paramObj){
	var index = layui.use(['layer'],function(){
		//console.log(top.global_layer);
		//return;
		var layer = layui.layer;
		//var layer = top.global_layer;
		
		top.layer.confirm(msg,{
			title: '摩尔提示',
			skin: 'layui-layer-molv',
			resize: false,
			btn:['确定','取消']
		}, function(index){
			if(callBackFun){
				callBackFun(paramObj);
			}
			top.layer.close(index);
			
		}, function(){
			//layer.msg('的确很重要',{icon:1})
			top.layer.close(index);
		});
	});
	
	
}

//增加layui 提示窗方法
function _confirm_all(callBackFun, msg,paramObj){
	var index = layui.use(['layer'],function(){
		var layer = layui.layer;
		top.layer.confirm(msg, {
			  title: '摩尔提示',
			  skin: 'layui-layer-molv',
			  resize: false,
			  btn: ['确定','取消']
			}, function(){
				if(callBackFun){
					callBackFun(paramObj);
				}
				parent.layer.closeAll();
			}, function(){
				parent.layer.closeAll();
			});
		/*
		top.layer.confirm(msg,{
			skin: 'layui-layer-molv',
			btn:['确定','取消'],
		}, function(){
			//callBackFun(paramObj);
			//var layerIndex = parent.layer.getFrameIndex(window.name);
			top.layer.close(index);
			
		}, function(){
			//layer.msg('的确很重要',{icon:1})
			top.layer.close(index);
		});
		*/
	});

}