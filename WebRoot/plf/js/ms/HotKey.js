// <font style='color:blue; background-color:yellow;'>快捷键</font>响应
// targetObj: 目标对象，如果满足<font style='color:blue; background-color:yellow;'>快捷键</font>条件，触发目标对象的click事件
// ctrlKey: 是否按住了Ctrl组合键
// shiftKey: 是否按住了Shift组合键
// altKey: 是否按住了Alt组合键
// keycode: 按键对应的数值
function Hotkey(event, targetObj, ctrlKey, shiftKey, altKey, keycode) {
	if (targetObj && event.ctrlKey == ctrlKey && event.shiftKey == shiftKey && event.altKey == altKey && event.keyCode == keycode) {
		targetObj.click();
	}
}
var _hotKey = 83;
var _act_button;
function setHotKey(hotKey) {
	_hotKey = hotKey;
}
function setHotKeyAct(act_button) {
	_act_button = act_button;
}
function fnKeyup(event) {
	Hotkey(event, _act_button, true, false, false, _hotKey);
}

// 捕获系统的Keyup事件
// 如果是Mozilla系列浏览器
if (document.addEventListener) {
	document.addEventListener("keyup", fnKeyup, true);
} else {
	document.attachEvent("onkeyup", fnKeyup);
}

