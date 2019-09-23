
function deptChangeAx(thisObj)
{
	var value = thisObj.options[thisObj.selectedIndex].value;	
	fn_reloadByChangePerPageAx(value);
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
	document.getElementById("_page_div_pop_ax_" + formId).style.display = "none";
}

var selectPage = $("#pageSelect").html();
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
	var barTable = " <ul class=\"pagingPop\">";
	if (_GLO_FORM_PAGE_MAP[formId].totalRecord === 0) {
		barTable += "<li class='home-page'>" + "<a class=\"it\" ></a>" + "</li>";
		barTable += "<li class='pre'>" + "<a class=\"it\" ></a>" + "</li>";
		barTable += "<li class='center'><input type=\"text\" value=\"" + _GLO_FORM_PAGE_MAP[formId].currentPage + "\" id=\"pageNum"+formId+"\" class=\"text\" onkeypress=pageNumPress(\"" + formId + "\",this)><span> / 1 页 </span></li>";
		barTable += "<li class='next'>" + "<a class=\"it\" ></a>" + "</li>";
		barTable += "<li class='last-page'>" + "<a class=\"it\" ></a>" + "</li>";
		barTable += "<li class='select'>";
		/*barTable += "<select name=\"dept\" data-placeholder=\"" + _GLO_PAGE_AX_LAB_5 + "10" + _GLO_FP_PAGE_AX_LAB_4 + "\"  class=\"dept_select\" >";
		barTable += "<option value=\"10\"></option>";
		barTable += "<option value=\"20\">" + _GLO_PAGE_AX_LAB_5 + "20" + _GLO_FP_PAGE_AX_LAB_4 + "</option>";
		barTable += "<option value=\"15\">" + _GLO_PAGE_AX_LAB_5 + "15" + _GLO_FP_PAGE_AX_LAB_4 + "</option>";
		barTable += "<option value=\"10\">" + _GLO_PAGE_AX_LAB_5 + "10" + _GLO_FP_PAGE_AX_LAB_4 + "</option>";
		barTable += "</select>"*/
		barTable += selectPage;
		barTable += "<span>" + _GLO_FP_PAGE_AX_LAB_5 + "<span class=\"count\"> 0 </span>" + _GLO_FP_PAGE_AX_LAB_4;
		barTable += "</span></li>";
	} else {
		if(1 == _GLO_FORM_PAGE_MAP[formId].currentPage )
		{
			barTable += "<li class='home-page'>" + "<a class=\"it\" ></a>" + "</li>";
			barTable += "<li class='pre'><a class=\"it\" ></a></li>";
		}
		else
		{
			barTable += "<li class='home-page'><a class=\"it\" href=\"javascript:fn_turnPageAx_" + formId + "('1');\"></a></li>";
			barTable += "<li class='pre'><a class=\"it\" href=\"javascript:fn_turnPageAx_" + formId + "('previous');\"></a></li>"
		}
		
		barTable += "<li class='center'><input type=\"text\" value=\"" + _GLO_FORM_PAGE_MAP[formId].currentPage + "\" id=\"pageNum"+formId+"\" class=\"text\" onkeypress=pageNumPress(\"" + formId + "\",this) onfocus=\"this.select()\"><span> / " + _GLO_FORM_PAGE_MAP[formId].totalPage +" 页</span></li>";
		
		if (_GLO_FORM_PAGE_MAP[formId].currentPage == _GLO_FORM_PAGE_MAP[formId].totalPage)
		{
			barTable += "<li class='next'><a class=\"it\"></a></li>";
			barTable += "<li class='last-page'><a class=\"it\" ></a></li>";
		}
		else
		{
			barTable += "<li class='next'><a class=\"it\" href=\"javascript:fn_turnPageAx_" + formId + "('next');\"></a></li>";
			barTable += "<li class='last-page'><a class=\"it\" href=\"javascript:fn_turnPageAx_" + formId + "('" + _GLO_FORM_PAGE_MAP[formId].totalPage + "');\"></a></li>";
		}
		barTable += "<li class='select'>";
		/*barTable += "<select name=\"dept\"  class=\"dept_select\" onchange=\"deptChangeAx(this)\" data-placeholder=\"" + _GLO_PAGE_AX_LAB_5 + _GLO_FORM_PAGE_MAP[formId].pageRecord + _GLO_FP_PAGE_AX_LAB_4 + "\">";
		barTable += "<option value=\"-1\"></option>";
		if (_GLO_FORM_PAGE_MAP[formId].pageRecord == 20)
		{
			barTable += "<option value=\"20\" selected=\"selected\">" + _GLO_PAGE_AX_LAB_5 + "20" + _GLO_FP_PAGE_AX_LAB_4 +"</option>";
		}
		else
		{
			barTable += "<option value=\"20\">" + _GLO_PAGE_AX_LAB_5 + "20" + _GLO_FP_PAGE_AX_LAB_4 +"</option>";
		}
		if (_GLO_FORM_PAGE_MAP[formId].pageRecord == 15)
		{
			barTable += "<option value=\"15\" selected=\"selected\">" + _GLO_PAGE_AX_LAB_5 + "15" + _GLO_FP_PAGE_AX_LAB_4 +"</option>";
		}
		else
		{
			barTable += "<option value=\"15\">" + _GLO_PAGE_AX_LAB_5 + "15" + _GLO_FP_PAGE_AX_LAB_4 +"</option>";
		}
		if (_GLO_FORM_PAGE_MAP[formId].pageRecord == 10)
		{
			barTable += "<option value=\"10\" selected=\"selected\">" + _GLO_PAGE_AX_LAB_5 + "10" + _GLO_FP_PAGE_AX_LAB_4 +"</option>";
		}
		else
		{
			barTable += "<option value=\"10\">" + _GLO_PAGE_AX_LAB_5 + "10" + _GLO_FP_PAGE_AX_LAB_4 +"</option>";
		}
		barTable += "</select>";*/
		barTable += selectPage;
		barTable += "<span>" + _GLO_FP_PAGE_AX_LAB_5 + "<span class=\"count\">" + _GLO_FORM_PAGE_MAP[formId].totalRecord + "</span>"+ _GLO_FP_PAGE_AX_LAB_4;
		barTable += "</span></li>";
	}

	barTable += "</ul>";
	$("#_page_bar_table_" + formId).html(barTable);
	$(".pagingPop .dept_select").val(_GLO_FORM_PAGE_MAP[formId].pageRecord);
	$('.pagingPop .dept_select').chosen({width:"90px"});
	 
	var pageNum = document.getElementById("pageNum");
	if(_GLO_FORM_PAGE_MAP[formId].totalRecord!=0 && pageNum != null){
		if(pageNum.attachEvent)
		{
			pageNum.attachEvent("input",function()
			{
				$("#pageNum").attr("value",$("#pageNum").attr("value").replace(/\D+/g,""));
			});
		}
		else
		{
			pageNum.addEventListener("input",function()
			{
				$("#pageNum").attr("value",$("#pageNum").attr("value").replace(/\D+/g,""));
			});
		}
	}
}

function hidePageBar(formId) {
	$("#_page_bar_table_" + formId).html("");
}

function pageNumPress(formId,e)
{
	if(event.keyCode == 13)
	{
		if(false)
		{
			
		}
		else
		{
			var str = "javascript:fn_turnPageAx_" +formId + "('" + e.value + "')"; 
			location.href = str;					
		}
	}
}

