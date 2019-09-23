
function deptChangeAx(thisObj)
{
	var value = thisObj.options[thisObj.selectedIndex].value;	
	fn_reloadByChangePerPageAx(value,thisObj);
}

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
	var popAx = document.getElementById("_page_div_pop_ax_" + formId);
	if(null != popAx )
	{
		document.getElementById("_page_div_pop_ax_" + formId).style.display = "none";
	}
}

var selectPage = $("#pageSelect").html();
function showPageBar(ajaxPage, formId) {
	closeErrorPageMsgAx(formId);
	var bgObj = document.getElementById("bgDiv1");
	var msgObj = document.getElementById("msgDiv1");
	if (null != bgObj && null != msgObj) {
		bgObj.style.display = msgObj.style.display = "none";
	}
	
	util.closeLoading();
	_GLO_FORM_PAGE_MAP[formId].currentPage = ajaxPage.currentPage;
	_GLO_FORM_PAGE_MAP[formId].pageRecord = ajaxPage.pageRecord;
	_GLO_FORM_PAGE_MAP[formId].totalPage = ajaxPage.totalPage;
	_GLO_FORM_PAGE_MAP[formId].totalPageStr = "a" + ajaxPage.totalPage;
	_GLO_FORM_PAGE_MAP[formId].totalRecord = ajaxPage.totalRecord;
	totalPage = ajaxPage.totalPage;
	var barTable = " <ul class=\"paging\"><input type=\"hidden\" name=\"formId\" value="+formId+"  />";
	
	if (_GLO_FORM_PAGE_MAP[formId].totalRecord === 0) {
		barTable += "<li>" + "<a class=\"it\" >&laquo;"+ _GLO_FP_PAGE_AX_LAB_1 +"</a>" + "</li>";
		barTable += "<li>" + "<a class=\"it\" >&lt;</a>" + "</li>";
		barTable += "<li>" + "<a class=\"it\" >0</a>" +	"</li>";
		barTable += "<li>" + "<a class=\"it\" >&gt;</a>" + "</li>";
		barTable += "<li>" + "<a class=\"it\" >" + _GLO_FP_PAGE_AX_LAB_2 + "&raquo;</a>" + "</li>";
		barTable += "<li>";
		/*barTable += "<select name=\"dept\" data-placeholder=\"" + _GLO_FP_PAGE_AX_LAB_3 + "10" + _GLO_FP_PAGE_AX_LAB_4 + "\"  class=\"dept_select\" >";
		barTable += "<option value=\"10\"></option>";
		barTable += "<option value=\"20\">" + _GLO_FP_PAGE_AX_LAB_3 + "20" + _GLO_FP_PAGE_AX_LAB_4 + "</option>";
		barTable += "<option value=\"15\">" + _GLO_FP_PAGE_AX_LAB_3 + "15" + _GLO_FP_PAGE_AX_LAB_4 + "</option>";
		barTable += "<option value=\"10\">" + _GLO_FP_PAGE_AX_LAB_3 + "10" + _GLO_FP_PAGE_AX_LAB_4 + "</option>";
		barTable += "</select>"*/
		barTable += selectPage;
		barTable +=  _GLO_FP_PAGE_AX_LAB_5 + "<span class=\"count\"></span> 0 " + _GLO_FP_PAGE_AX_LAB_4;
		barTable += "</li>";
	} else {
		if(1 == _GLO_FORM_PAGE_MAP[formId].currentPage )
		{
			barTable += "<li>" + "<a class=\"it\" >&laquo;" + _GLO_FP_PAGE_AX_LAB_1 + "</a>" + "</li>";
			barTable += "<li><a class=\"it\" >&lt;</a></li>";
		}
		else
		{
			barTable += "<li><a class=\"it\" href=\"javascript:fn_turnPageAx_" + formId + "('1');\">&laquo;" + _GLO_FP_PAGE_AX_LAB_1 + "</a></li>";
			barTable += "<li><a class=\"it\" href=\"javascript:fn_turnPageAx_" + formId + "('previous');\">&lt;</a></li>"
		}
		if(_GLO_FORM_PAGE_MAP[formId].totalPage <= 7)
		{
			for( var i = 1; i <= _GLO_FORM_PAGE_MAP[formId].totalPage; i ++)
			{
				if(i != _GLO_FORM_PAGE_MAP[formId].currentPage)
				{
					barTable += "<li><a class=\"it\" href=\"javascript:fn_turnPageAx_" + formId + "('" + i + "')\">" + i + "</a></li>";
				}
				else
				{
					barTable += "<li  class=\"active\"><a class=\"it\">" + i + "</a></li>";
				}
			}
		}
		else if((_GLO_FORM_PAGE_MAP[formId].totalPage - _GLO_FORM_PAGE_MAP[formId].currentPage) < (7 - 2))
		{
			barTable += "<li><a class=\"it\" >…</a></li>";
	        for(var i = _GLO_FORM_PAGE_MAP[formId].totalPage - (7 - 2); i <= _GLO_FORM_PAGE_MAP[formId].totalPage; i++)
			{
	        	if(i != _GLO_FORM_PAGE_MAP[formId].currentPage)
				{
					barTable += "<li><a class=\"it\" href=\"javascript:fn_turnPageAx_" + formId + "('" + i + "')\">" + i + "</a></li>";
				}
				else
				{
					barTable += "<li  class=\"active\"><a class=\"it\">" + i + "</a></li>";
				}
			}
		}
		else if (_GLO_FORM_PAGE_MAP[formId].currentPage <= 4)
		{
			for(var i = 1; i <= 6;i++)
			{
	        	if(i != _GLO_FORM_PAGE_MAP[formId].currentPage)
				{
					barTable += "<li><a class=\"it\" href=\"javascript:fn_turnPageAx_" + formId + "('" + i + "')\">" + i + "</a></li>";
				}
				else
				{
					barTable += "<li  class=\"active\"><a class=\"it\">" + i + "</a></li>";
				}
			}
			barTable += "<li><a class=\"it\" >…</a></li>";
		}
		else
		{
			barTable += "<li><a class=\"it\" >…</a></li>";
			for(var i = _GLO_FORM_PAGE_MAP[formId].currentPage - 2 ; i <= parseInt(_GLO_FORM_PAGE_MAP[formId].currentPage) + 2; i++)
			{
				if(i != _GLO_FORM_PAGE_MAP[formId].currentPage)
				{
					barTable += "<li><a class=\"it\" href=\"javascript:fn_turnPageAx_" + formId + "('" + i + "')\">"+ i +"</a></li>";
				}
				else
				{
					barTable += "<li  class=\"active\"><a class=\"it\">" + i + "</a></li>";
				}
			}
			barTable += "<li><a class=\"it\" >…</a></li>";
		}
		
		if (_GLO_FORM_PAGE_MAP[formId].currentPage == _GLO_FORM_PAGE_MAP[formId].totalPage)
		{
			barTable += "<li><a class=\"it\">&gt;</a></li>";
			barTable += "<li><a class=\"it\" >" + _GLO_FP_PAGE_AX_LAB_2 + "&raquo;</a></li>";
		}
		else
		{
			barTable += "<li><a class=\"it\" href=\"javascript:fn_turnPageAx_" + formId + "('next');\">&gt;</a></li>";
			barTable += "<li><a class=\"it\" href=\"javascript:fn_turnPageAx_" + formId + "('" + _GLO_FORM_PAGE_MAP[formId].totalPage + "');\">" + _GLO_FP_PAGE_AX_LAB_2 + "&raquo;</a></li>";
		}
		barTable += "<li>";
		/*barTable += "<select name=\"dept\"  class=\"dept_select\" onchange=\"deptChangeAx(this)\" data-placeholder=\"" + _GLO_FP_PAGE_AX_LAB_3 + _GLO_FORM_PAGE_MAP[formId].pageRecord + _GLO_FP_PAGE_AX_LAB_4 + "\">";
		barTable += "<option value=\"-1\"></option>";
		if (_GLO_FORM_PAGE_MAP[formId].pageRecord == 20)
		{
			barTable += "<option value=\"20\" selected=\"selected\">" + _GLO_FP_PAGE_AX_LAB_3 + "20" + _GLO_FP_PAGE_AX_LAB_4 +"</option>";
		}
		else
		{
			barTable += "<option value=\"20\">" + _GLO_FP_PAGE_AX_LAB_3 + "20" + _GLO_FP_PAGE_AX_LAB_4 +"</option>";
		}
		if (_GLO_FORM_PAGE_MAP[formId].pageRecord == 15)
		{
			barTable += "<option value=\"15\" selected=\"selected\">" + _GLO_FP_PAGE_AX_LAB_3 + "15" + _GLO_FP_PAGE_AX_LAB_4 +"</option>";
		}
		else
		{
			barTable += "<option value=\"15\">" + _GLO_FP_PAGE_AX_LAB_3 + "15" + _GLO_FP_PAGE_AX_LAB_4 +"</option>";
		}
		if (_GLO_FORM_PAGE_MAP[formId].pageRecord == 10)
		{
			barTable += "<option value=\"10\" selected=\"selected\">" + _GLO_FP_PAGE_AX_LAB_3 + "10" + _GLO_FP_PAGE_AX_LAB_4 +"</option>";
		}
		else
		{
			barTable += "<option value=\"10\">" + _GLO_FP_PAGE_AX_LAB_3 + "10" + _GLO_FP_PAGE_AX_LAB_4 +"</option>";
		}
		barTable += "</select>";*/
		barTable += selectPage;
		barTable += _GLO_FP_PAGE_AX_LAB_5 + "<span class=\"count\"></span> " + _GLO_FORM_PAGE_MAP[formId].totalRecord + _GLO_FP_PAGE_AX_LAB_4;
		barTable += "</li>";
	}

	barTable += "</ul>";
	$("#_page_bar_table_" + formId).html(barTable);
	$(".paging .dept_select").val(_GLO_FORM_PAGE_MAP[formId].pageRecord);
	$('.paging .dept_select').chosen({width:"110px"});
	 
}

function hidePageBar(formId) {
	$("#_page_bar_table_" + formId).html("");
}

