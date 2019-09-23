
function dispErrorPageMsgAx(thisObj, info, formId) {
	var positionTop = thisObj.offsetTop;
	var positionLeft = thisObj.offsetLeft;
	var w = thisObj.offsetWidth;
	var h = thisObj.offsetHeight;
	while (thisObj = thisObj.offsetParent) {//ldg test 需优化
		positionTop += thisObj.offsetTop;
		positionLeft += thisObj.offsetLeft;
	}
	var divPop = document.getElementById("_page_div_pop_ax_"+formId);
	divPop.style.display = "";
	divPop.style.left = positionLeft + "px";
	divPop.style.top = (positionTop + h) + "px";
	divPop.innerHTML = info;
}

function closeErrorPageMsgAx(formId) {
	document.getElementById("_page_div_pop_ax_" + formId).style.display = "none";
}

function showPageBar(ajaxPage, formId) {
	closeErrorPageMsgAx(formId);
	var bgObj = document.getElementById("bgDiv1");
	var msgObj = document.getElementById("msgDiv1");
	if (null != bgObj) {
		bgObj.style.display = msgObj.style.display = "none";
	}
	util.closeLoading();
	_GLO_FORM_PAGE_MAP[formId].currentPage = ajaxPage.currentPage;
	_GLO_FORM_PAGE_MAP[formId].pageRecord = ajaxPage.pageRecord;
	_GLO_FORM_PAGE_MAP[formId].totalPage = ajaxPage.totalPage;
	_GLO_FORM_PAGE_MAP[formId].totalPageStr = "a" + ajaxPage.totalPage;
	_GLO_FORM_PAGE_MAP[formId].totalRecord = ajaxPage.totalRecord;
	totalPage = ajaxPage.totalPage;
	var barTable = "<tr><td align=\"right\" valign=\"middle\"  class=\"pageImg1\">";
	if (_GLO_FORM_PAGE_MAP[formId].totalRecord === 0) {
		barTable += _GLO_PAGE_AX_LAB_1 + "<font color=\"blue\">0</font>" + _GLO_PAGE_AX_LAB_2 + " <font color=\"blue\">0</font>" + _GLO_PAGE_AX_LAB_3 + " , " + _GLO_PAGE_AX_LAB_4 + "<font color=\"blue\">0-0</font> &nbsp;&nbsp;&nbsp;&nbsp; ";
		barTable += " <label><img src=\"" + pageImagePath + "icon_first_n.gif\" /></label>&nbsp;&nbsp;";
		barTable += " <label><img src=\"" + pageImagePath + "icon_before_n.gif\" /></label>&nbsp;&nbsp;";
		barTable += " <label><img src=\"" + pageImagePath + "icon_next_n.gif\" /></label>&nbsp;&nbsp;";
		barTable += " <label><img src=\"" + pageImagePath + "icon_last_n.gif\" /></label>&nbsp;&nbsp;";
	} else {
		barTable += _GLO_PAGE_AX_LAB_1 + "<font color=\"blue\">" + _GLO_FORM_PAGE_MAP[formId].totalRecord + "</font>" + _GLO_PAGE_AX_LAB_2 + " ";
		barTable += "<font color=\"blue\">" + _GLO_FORM_PAGE_MAP[formId].totalPage + "</font>" + _GLO_PAGE_AX_LAB_3;
		barTable += " , "+_GLO_PAGE_AX_LAB_4 + "<font color=\"blue\">";
		barTable += "<input id=\"turnPageText_" + formId + "\" type=\"text\" style=\"color:blue;height:16px;font-size: 11px;\" value=\"" + _GLO_FORM_PAGE_MAP[formId].currentPage + "\"";
		barTable += "size=\"" + (_GLO_FORM_PAGE_MAP[formId].totalPageStr).length + "\" maxLength=\"" + (_GLO_FORM_PAGE_MAP[formId].totalPageStr).length + "\"";
		barTable += "onkeydown=\"if(event.keyCode==13){return fn_goPageAx_" + formId + "(this.value);}\" ";
		barTable += "onblur=\"fn_goPageAx_" + formId + "(this.value);\" maxlength=\"9\" /> " + "</font>"+ _GLO_PAGE_AX_LAB_3 + "&nbsp;&nbsp;&nbsp;&nbsp";
		if (ajaxPage.first) {
			barTable += "<label><img src=\"" + pageImagePath + "icon_first_n.gif\" /></label>&nbsp;&nbsp;&nbsp;&nbsp;";
			barTable += "<label><img src=\"" + pageImagePath + "icon_before_n.gif\" /></label>&nbsp;&nbsp;&nbsp;&nbsp;";
		} else {
			barTable += "<a href=\"javascript:fn_turnPageAx_" + formId + "('1');\" title=\"" + _GLO_PAGE_AX_LAB_6 + "\" ><img src=\"" + pageImagePath + "icon_first.gif\" /></a>&nbsp;&nbsp;&nbsp;&nbsp;";
			barTable += "<a href=\"javascript:fn_turnPageAx_" + formId + "('previous');\" title=\"" + _GLO_PAGE_AX_LAB_7 + "\" ><img src=\"" + pageImagePath + "icon_before.gif\" /></a>&nbsp;&nbsp;&nbsp;&nbsp;";
		}
		if (ajaxPage.last) {
			barTable += "<label><img src=\"" + pageImagePath + "icon_next_n.gif\" /></label>&nbsp;&nbsp;&nbsp;&nbsp;";
			barTable += "<label><img src=\"" + pageImagePath + "icon_last_n.gif\" /></label>&nbsp;&nbsp;&nbsp;&nbsp;";
		} else {
			barTable += "<a href=\"javascript:fn_turnPageAx_" + formId + "('next');\" title=\"" + _GLO_PAGE_AX_LAB_8 + "\" ><img src=\"" + pageImagePath + "icon_next.gif\" /></a>&nbsp;&nbsp;";
			barTable += "<a href=\"javascript:fn_turnPageAx_" + formId + "('" + _GLO_FORM_PAGE_MAP[formId].totalPage + "');\" title=\"" + _GLO_PAGE_AX_LAB_9 + "\" ><img src=\"" + pageImagePath + "icon_last.gif\" /></a>&nbsp;&nbsp;";
		}	
	}

	barTable += "</td></tr>";
	$("#_page_bar_table_" + formId).html(barTable);
}

function hidePageBar(formId) {
	$("#_page_bar_table_" + formId).html("");
}

