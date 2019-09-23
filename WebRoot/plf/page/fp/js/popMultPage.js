
function deptChangeAx(thisObj,formId)
{
	var value = thisObj.options[thisObj.selectedIndex].value;	
	fn_reloadByChangePerPageAx(value,formId);
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


var selectPage ;//= $("#pageSelect").html();
function showPageBar(ajaxPage, formId) {
	//selectPage = $("#select_"+formId).html();
	//console.log(selectPage);
	selectPage = "<select class=\"dept_select\" onchange=\"deptChangeAx(this,'"+formId+"')\" name=\"dept\">"+$("#select_"+formId).html()+"</select>";
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
		barTable += "<li class='center'><input type=\"text\" value=\"" + _GLO_FORM_PAGE_MAP[formId].currentPage + "\" id=\"pageNum"+formId+"\" class=\"text\" onkeypress=pageNumPress(\"" + formId + "\",this)><span> / 1 页</span></li>";
		barTable += "<li class='next'>" + "<a class=\"it\" ></a>" + "</li>";
		barTable += "<li class='last-page'>" + "<a class=\"it\" ></a>" + "</li>";
		barTable += "<li class='select'>";
		barTable += selectPage;
		barTable += "<span>" + _GLO_FP_PAGE_AX_LAB_5 + "<span class=\"count\"> 0 </span>  " + _GLO_FP_PAGE_AX_LAB_4;
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
		barTable += selectPage;
		barTable += "<span>" + _GLO_FP_PAGE_AX_LAB_5 + "<span class=\"count\">" + _GLO_FORM_PAGE_MAP[formId].totalRecord + "</span> " + _GLO_FP_PAGE_AX_LAB_4;
		barTable += "</span></li>";
	}

	barTable += "</ul>";
	$("#_page_bar_table_" + formId).html(barTable);
	$(".pagingPop .dept_select").val(_GLO_FORM_PAGE_MAP[formId].pageRecord);
	//$("#pageSelect_"+formId).chosen("destroy");
	//$("#pageSelect_"+formId).chosen("destroy");
	$(".pagingPop .dept_select").chosen({width:"90px"});
	
	var pageNum = document.getElementById("pageNum"+formId);
	if(_GLO_FORM_PAGE_MAP[formId].totalRecord!=0){
		if(pageNum.attachEvent)
		{
			pageNum.attachEvent("input",function()
			{
				$("#pageNum"+formId).attr("value",$("#pageNum"+formId).attr("value").replace(/\D+/g,""));
			});
		}
		else
		{
			pageNum.addEventListener("input",function()
			{
				$("#pageNum"+formId).attr("value",$("#pageNum"+formId).attr("value").replace(/\D+/g,""));
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


//分页方法
function pageFun(ajaxPage,formId){
	var ajaxPage1 = new Object();
	var firstTemp1 = ajaxPage.first;
	var lastTemp1 = ajaxPage.last;
		ajaxPage1.currentPage = parseInt(ajaxPage.currentPage);
		ajaxPage1.pageRecord = parseInt(ajaxPage.pageRecord);
		ajaxPage1.totalPage = parseInt(ajaxPage.totalPage);
		ajaxPage1.totalRecord = parseInt(ajaxPage.totalRecord);
		ajaxPage1.first = firstTemp1 == "true" ? true : false;
		ajaxPage1.last = lastTemp1 == "true" ? true : false;
		showPageBar(ajaxPage1,formId);
}



function fn_reloadByChangePerPageAx(icount,formId){
		if(icount == _GLO_FORM_PAGE_MAP[formId].pageRecord){
			return false;
		}

		_GLO_FORM_PAGE_MAP[formId].pageRecord = icount;
	//fn_turnPageAx_${param.formId}(1);
		new methodCall("fn_turnPageAx_"+formId).func();
		
}

//把变量名转为实体方法
function methodCall(methodName){
	this.func = new Function(methodName+"(1);");
}
