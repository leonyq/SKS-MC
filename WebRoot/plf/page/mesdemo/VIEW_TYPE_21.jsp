<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	 
  <style>
            .main{
                margin-top:10px;
            }            			
            
	    	.main table {
	    	    width:100%;
	    	    table-layout:fixed;
	    	}
	    	
	    	.main table tr{
	    	    height:30px;
	    	}
	    	
	    	.main table td{
	    	    border:1px solid #dbe1ef;
	    	    box-sizing:border-box;
	    	    text-align:center;
	    	}
	    	
	    	.main .scroll{
	    	    height:230px;
	    	    overflow:auto;
	    	}
	    	
	    	.main .scroll table tr:nth-of-type(1) td{
	    	    border-top:0;
	    	}
	    	
	    	.main .scroll table tr:nth-of-type(2n){
	    	    	background-color:#f0f4fd;
	    	}
	    	
	    	
	    	.main .scroll table select{
	    	    width:100%;
	    	    height:100%;
	    	    outline:none;
	    	    border:0;
	    	    background-color:transparent;
	    	}
	    	
	    	.foot{
	    	    margin-top:10px;
	    	}
	    	
	    	.foot span{
	    	    font-size:16px;
	    	    font-weight:bold;
	    	    color:#f00;
	    	}
	    	
	    	.button{
	    	    display:inline-block;
	    	    height:25px;
	    	    width:60px;
	    	    background-color:#74c3fe;
	    	    color:#fff;
	    	    text-align:center;
	    	    cursor:pointer;
	    	}
	    	
	    	.optn button.disabled:hover {
			    background-color: #fff;
			    color: #666;
			    border: 1px solid #dbdbdb;
			    cursor:not-allowed;
			    
			}
			
			.optn .disabled:hover .ico-lead{
				background-image: url(${path}plf/page/fp/img/ico-lead.png) ;
			}
  </style>
	<!-- head里面 -->
	
	<script type = "text/javascript" 
	src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
	<script type="text/javascript" >
	
var loadMode=0;
// 1 可以为空 0不能为空
$(function (){
	 // switchTag('tag1','content1','','');
	 // ajax
	// loadMode=1;
	  ImportStep01AtrrInfo();
	  getTableList();
	  loadExcelModel();
	  
 });// $(function (){
var dbAttrLst=null;// dbAttrLst数据库属性列表
var tdSelectHtml="<select name='selectZd'></select>";
var _selValObjArr = [];  // 数据库选择项
var _excelColSize = 0; // excel列数
var _tableName = null; 
var _selValArr = [] ; // 保存已选择的 选择框value
var _notNullItemArr = [] ; // 必填项
var _hasFile = false;
//var _isInit = false;

function initPara(){
	_excelColSize = 0;
	_selValArr = [];
}
function ImportStep01AtrrInfo(){ 
	var url = $("#step01").val();
	var trHtml="",html="";
	$.post(url,{"exeid":$("#exeid").val()},
	      function (data){
		     if(data!=null){
		       dbAttrLst=data;
		       $("#tbodyDataLst").html("");
		       
		       $("#divUpAttrList").html("");
		       html=$("#infoImportAttrList").val()+"【";
		       tdSelectHtml="<select class='select' name='dbKey' onchange='addSelVal(this)' >";
		       // tdSelectHtml="<select name='selectZd'
				// onchange='addSelVal(this)' onclick='clickSel(this)'>";
		       util.initLangMap("['请选择']");
		       tdSelectHtml += "<option value='-1'>--"+util.getLangShow("请选择")+"--</option>";
		       $(data.attrLst).each(
		    	  function(i,e){
		    		  _selValObjArr.push({colId: e.colId,colName : e.colName, canNull : e.valNull ,colType: e.colType});
		    		  tdSelectHtml+="<option value='"+e.colId+"'>"+e.colName+"</option>";  
		    		  html+=e.colName+":"+ (e.valNull == 1?"可以为空":"不能为空")+",列类型" +e.colType+"、";
		    		  if(e.valNull != 1) {
		    			  _notNullItemArr.push({colId: e.colId,colName : e.colName, canNull : e.valNull ,colType: e.colType});
		    		  }
		    	  }//
		       );// $(data.attrLst).each(
		       tdSelectHtml+="</select>";
		       html=html.substring(0,html.length-1)+"】";
		       $("#tableName").val(data.tableName);
		       $("#divUpAttrList").html(html);
		     }// if(data!=null){
	      }// function (data){
	);
}// function ImportStep01AtrrInfo(){

var _tableHtml = null;
// 获取表名
function getTableList() {
	var url = util.getContextPath()+"/sys/excel/ExcelAction_getTableList.ms";
	$.ajax({
		url:url,
		type:"post",
		data:{},
		dataType:"json",
		async:false,
		success:function(data) {
			var ls= data.ajaxMap.dbTabList;
			if(ls) {
				var tableHtmlArr = [];
				tableHtmlArr.push("<select>");
				util.initLangMap("['请选择']");
				tableHtmlArr.push("<option value='-1'>--"+util.getLangShow("请选择")+"--</option>");
				for(var i=0; i<ls.length; i++) {
					tableHtmlArr.push("<option>" +ls[i].TABLE_NAME+ "</option>");
				}
				tableHtmlArr.push("</select>");
				_tableHtml = tableHtmlArr.join("");
			}
		}
	});
	
	
}



function fileExt(){
	var loc=$("#fileUp").val();
	if(loc==""){
		  utilsFp.alert($("#infoFileNotEmptt").val())  ;
		  $("#fileUp").val("");
		  return false; 
	}
	var point = loc.lastIndexOf(".");
	var ext=loc.substr(point);
	 
	if(ext!=".xlsx"&&ext!=".xls"){
		  utilsFp.alert($("#infoExtErr").val())  ;
		  $("#fileUp").val("");
		  return false;
	}
	return true;
}// function fileExt(){
function getUpFile(){
	
	//if(!_hasFile)return false;
	//alert(2);
	util.initLangMap('["正在上传Excel文件,检验合法性中..."]');
	showMsg(util.getLangShow("正在上传Excel文件,检验合法性中..."));
	//showMsg("正在上传Excel文件,检验合法性...");

	
	
	var htmlStr = "";
	$("input[name='excelColName']").each(function(i,e){
		htmlStr += "<input type='hidden' name='excelColName' value='"+ e.value +"'>";
	});
	var exeid = $("#exeid").val();
	htmlStr += "<input type='hidden' name='exeid' value='"+exeid+"'>";
	$("#tempDiv").html(htmlStr);
	window.frames.myfrm.submit();
	
	
}// function getUpFile(){

function callBack(data) {
	if(data) {
		if(data.step01Code == "0") {//utilsFp.alert(data.step01Msg)  ;			
			showMsg(data.step01Msg,2);
			setBtnDisabled(true);
			return;
		}else if(data.step01Code == "-1") {//			utilsFp.alert(data.step01Msg)  ;
			showMsg(data.step01Msg,2);
			setBtnDisabled(true);
			return;
		}else if(data.step01Code == "1" || data.step01Code=="3"){
			initPara();
			setBtnDisabled(false);
			util.initLangMap("['Excel文件上传成功!初始化Excel模板']");
			showMsg(util.getLangShow("Excel文件上传成功!初始化Excel模板"),1);
			var dataHtml = [];
			_excelColSize = data.excelTitleList.length;
			for(var i=0;i<data.excelTitleList.length;i++) {
				_hasFile = true;
				dataHtml.push("<tr>");
				dataHtml.push("<td style='overflow: hidden;text-overflow:ellipsis;white-space:nowrap;'><input name='excelColName' type='hidden' value='"+data.excelTitleList[i]+"'><span title='"+data.excelTitleList[i] +"'>" + data.excelTitleList[i] +"</span></td>");
				dataHtml.push("<td class='dataKey'>" + initDbKeySelectVal(data.excelTitleList[i], tdSelectHtml) +"</td>");
				dataHtml.push("<td style='width:60px'>" + "<input type='hidden' name='canNull' value=''/><input type='hidden' name='colType' value=''/>" +"</td>");
				dataHtml.push("<td style='width:40px'>" + "" +"</td>");
				dataHtml.push("<td>" + "" +"</td>");
				dataHtml.push("<td>" + "" +"</td>");
				dataHtml.push("<td>" + "" +"</td>");
				dataHtml.push("<td>" + "" +"</td>");
				dataHtml.push("<td>" + "" +"</td>");
				dataHtml.push("</tr>");
			}
			$("#tbodyDataLst").html(dataHtml.join(""));
			
			$("select[name='dbKey']").trigger("change");
			
		}else {
			util.initLangMap("['Excel文件上传成功!']");
			showMsg(util.getLangShow("Excel文件上传成功!"),1);
			setBtnDisabled(false);
			_hasFile = true;
		}
	}
}


function removeAlreadSel() {
	$(".dataKey").each(function(i,e){
		var val = $(this).find("select").val();
	});
}

// select改变时,存入已选择的值
function addSelVal(obj) {
	if(obj.value != "-1") {
		if(_selValArr.indexOf(obj.value) == -1 ) { // 判断是否存在
			var lastVal = $(obj).data("last");
			if(lastVal) {
				_selValArr.splice( _selValArr.indexOf(lastVal), 1); // 删
				_selValArr.push(obj.value); // 添
			}else {
				_selValArr.push(obj.value); // 添
			}
		}
	}else {
		var val = $(obj).data("last");
		del(val);
		$(obj).data("last","");
	}
		// 注意这里
		$("select[name='dbKey']").each(function(index,dom){
			this.name = "dbKey";
			$(this).children("option").each(function(index,e){ // 遍历每个option
				if(_selValArr.indexOf(this.value) != -1) { // 判断当前的值在 数组中否
					$(this).css("display","none");
				}else {
					$(this).css("display","block");
				}
			});
		});
		
	if(obj.value != -1) {
		$(obj).data("last",obj.value); // 保存最近值
	}
	
	relTd(obj); // 改变后触发后面的td
}


// 删除数组元素
function del(val) {
	var index = _selValArr.indexOf(val);
	if(index != -1) {
		_selValArr.splice(index,1);
		del(val);
	}
}

// 判断是否是必填字段
function relTd(obj) {
	var val = obj.value;
	var $canNullTd    = $(obj).parent().next();
	var $mainKeyTd    = $(obj).parent().next().next();
	var $defaultValTd = $(obj).parent().next().next().next();
	var $valMapTd     = $(obj).parent().next().next().next().next();
	var $dzTabTd      = $(obj).parent().next().next().next().next().next();
	var $dzKeyTd      = $(obj).parent().next().next().next().next().next().next();
	var $dzValTd      = $(obj).parent().next().next().next().next().next().next().next();
	if(val != -1) {
		var selValArrObj = getSelValArrObj(obj);
		// 能为空
		$canNullTd.html("<input name='canNull' type='hidden' value='"+selValArrObj.canNull+"' /><input name='colType' type='hidden' value='"+selValArrObj.colType+"' /><input type='checkbox'  value='"+ (selValArrObj.colId) +"' disabled='disabled' "+ (selValArrObj.canNull == "1"? "":"checked='checked'") +"/>");
		// 主键
		$mainKeyTd.html("<input type='checkbox' name='primaryKey' onclick='checkClick(this)' value='"+(selValArrObj.colId)+"'/>");
		// 默认值
		$defaultValTd.html("<input type='text' maxlength='33' style='width:145px' class='defaultVal' name='defaultVal."+selValArrObj.colId+"' />");
		
		// 非varchar2数据不让填
		if(selValArrObj.colType == 2) {
			// 值映射
			$valMapTd.html("<input class='valMap' maxlength='100' type='text' style='width:145px' name='valMap."+selValArrObj.colId+"' />");
			// 对照表
			$dzTabTd.html(_tableHtml);
			$dzTabTd.children("select").attr("name","dzTab."+selValArrObj.colId).attr("onchange","getDbKey(this,'"+selValArrObj.colId+"')");
			// 对照字段
			$dzKeyTd.html("");
			// 取值字段
			$dzValTd.html("");
		}else {
			$valMapTd.html("");
			$dzTabTd.html("");
			$dzKeyTd.html("");
			$dzValTd.html("");
		}
	}else {
		$canNullTd.html("<input type='hidden' name='canNull' value=''/><input type='hidden' name='colType' value=''/>");
		$mainKeyTd.html("");
		$defaultValTd.html("");
		$valMapTd.html("");
		$dzTabTd.html("");
		$dzKeyTd.html("");
		$dzValTd.html("");
	}
}

// 根据value值去获取obj对象
function getSelValArrObj(selObj) {
	var val = selObj.value;
	for(var i=0;i<_selValObjArr.length ; i++) {
		if(val == _selValObjArr[i].colId) {
			return _selValObjArr[i];
		}
	}
	return null;
}

// 根据value值去获取obj对象
function getSelValArrObj2(val) {
   for(var i=0;i<_selValObjArr.length ; i++)  
	   if(val == _selValObjArr[i].colId) 
		 return _selValObjArr[i]; 
   return null;
}//function getSelValArrObj2(val) {

// 获取字段名
function getDbKey(obj,name) {
	var val = obj.value;
	var colType = $(obj).parent().prev().prev().prev().prev().children("input[name='colType']").val();
	var $dzKeyTd      = $(obj).parent().next();
	var $dzValTd      = $(obj).parent().next().next();
	if(val != "-1") {
		var url = util.getContextPath()+"/sys/excel/ExcelAction_getTableKeyList.ms";
		$.post(url,{tableName: val,colType2: colType},function(data) {
			if(data) {
				var dzKeyListHtmlArr = [];
				var dzValListHtmlArr = [];
				dzKeyListHtmlArr.push("<select>");
				util.initLangMap("['请选择']");
				dzKeyListHtmlArr.push("<option value='-1'>"+"--"+util.getLangShow("请选择")+"--"+"</option>");
				for(var i=0 ; i<data.ajaxMap.dzKeyList.length ; i++) 
					dzKeyListHtmlArr.push("<option >"+ data.ajaxMap.dzKeyList[i].COLUMN_NAME+"</option>");
				 
				dzKeyListHtmlArr.push("</select>");
				
				dzValListHtmlArr.push("<select>");
				util.initLangMap("['请选择']");
				dzValListHtmlArr.push("<option value='-1'>"+"--"+util.getLangShow("请选择")+"--"+"</option>");
				for(var j=0; j<data.ajaxMap.dzValList.length; j++)  
					dzValListHtmlArr.push("<option >"+ data.ajaxMap.dzValList[j].COLUMN_NAME+"</option>");
				 
				$dzKeyTd.html(dzKeyListHtmlArr.join("")); // 对照字段
				$dzValTd.html(dzValListHtmlArr.join("")); // 对照值
				if(name) {
					$dzKeyTd.children("select").attr("name","dzKey."+name);
					$dzValTd.children("select").attr("name","dzVal."+name);
				}

			}//if(data) {
		});
	} else {
		$dzKeyTd.html(""); // 对照字段
		$dzValTd.html(""); // 对照值
	}
}//function getDbKey(obj,name) {

// 获取字段名2


//valiImpAndSave 检验excel导入 和 保存模板
function valiImpAndSave() {// 数据列名勾选判断 
	if(!_hasFile) {//utilsFp.alert("请上传excel表格"); 
		util.initLangMap("['请上传Excel表格']");
		utilsFp.confirmIcon(1,"","","", util.getLangShow("请上传Excel表格"),"0","260","");
		showMsg(util.getLangShow("请上传Excel表格"),2);
		return false;
	} 
	/*if($("select[name='dbKey']").length != _excelColSize  ) {//utilsFp.alert("请选择对应的数据库字段名");
		util.initLangMap('["请选择对应的数据库字段名"]');
		utilsFp.confirmIcon(1,"","","", util.getLangShow("请选择对应的数据库字段名"),"0","260","");
		showMsg(util.getLangShow("请选择对应的数据库字段名"),2);
		return false;
	}*/  
	var tmp  = 0;
	$("select[name='dbKey']").each(function(i,e){
		if(this.value != -1) {
			tmp++;
		}
	});
	if(tmp < 1) {
//		utilsFp.alert("请选择对应的数据库字段名");
		util.initLangMap('["至少要选择一个Excel列对应的数据库字段名"]');
		utilsFp.confirmIcon(1,"","","", util.getLangShow("至少要选择一个Excel列对应的数据库字段名"),"0","260","");
		showMsg(util.getLangShow("至少要选择一个Excel列对应的数据库字段名"),2);
		return false;
	}
	
	
	var tmp2 = 0;
	var msgArr = [];
	for(var i=0; i<_notNullItemArr.length; i++) {
		var noSel = true;
		$("select[name='dbKey']").each(function(index,e){
			if(this.value == _notNullItemArr[i].colId) {
				noSel = false;
			}
		});
		if(noSel) {
			util.initLangMap('[\"'+_notNullItemArr[i].colName+'\"]');
			msgArr.push("["+util.getLangShow(_notNullItemArr[i].colName)+"]");
			tmp2 ++;
		}
		
	}
	
	if(tmp2 > 0 ) {
		//utilsFp.alert("数据库表字段：" + msgArr.join("") +"为必填项，请勾选");
		util.initLangMap('["数据库表字段："]');
		util.initLangMap('["为必填项，请勾选"]');
		utilsFp.confirmIcon(1,"","","",util.getLangShow("数据库表字段：") + msgArr.join("") +util.getLangShow("为必填项，请勾选") ,"0","300","");
		showMsg(util.getLangShow("数据库表字段：") + msgArr.join("") +util.getLangShow("为必填项，请勾选"),2);
		return false;
	}
	
	
	// 主键
	/*if($("input[type='radio'][name='primaryKey']:checked").length ==0) {
		util.initLangMap('["请勾选主键"]');
		utilsFp.confirmIcon(1,"","","",util.getLangShow("请勾选主键"),"0","300","");
		return false;
	}*/
	
	return true;
}


	
	


// 导入excel
function importExcel() {
	if(!valiImpAndSave())  
		return ;
	
	
	
	// 默认值检验
	var valiDefaultVal = []; // 默认值消息提示
	var rexDate = /(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)\s(20|21|22|23|[0-1]\d):[0-5]\d:[0]\d$-5/;
	var rexDateTime = /(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)/;
	var rexNum = /^\d*$/;
	$(".defaultVal").each(function(i,e){
		if(this.value != '') {
			var strArr = this.name.split(".");
			var obj = getSelValArrObj2(strArr[1]);
			if(obj.colType == 1) {
				if(!rexNum.test(this.value))  {
					util.initLangMap('["表单第"]');
					util.initLangMap('["行默认值选项应为数字类型"]');
					valiDefaultVal.push(util.getLangShow("表单第")+(i+1)+util.getLangShow("行默认值选项应为数字类型"));
				}
			}else if(obj.colType==3) {
				if(!rexDate.test(this.value)){
					util.initLangMap('["表单第"]');
					util.initLangMap('["行默认值选项应为日期类型,格式为:yyyy-MM-dd"]');
					valiDefaultVal.push(util.getLangShow("表单第")+(i+1)+util.getLangShow("行默认值选项应为日期类型,格式为:yyyy-MM-dd"));
				}
			}else if(obj.colType==4) {
				if(!rexDateTime.test(this.value)) {
					util.initLangMap('["表单第"]');
					valiDefaultVal.push(util.getLangShow("表单第")+(i+1)+util.getLangShow("行默认值选项应为日期时间类型,格式为:yyyy-MM-dd HH:mm:ss"));
				}
			}
		}
	});
	
	var rexValMap = /(\w*:{1}\w*,?)+/;
	$(".valMap").each(function(i,e){
		//var str = e.value;
		if(e.value != '') {
			if(!rexValMap.test(e.value)) {
				util.initLangMap('["表单第"]');
				util.initLangMap('["行值映射非法，格式为key:val,key:val..."]');
				valiDefaultVal.push(util.getLangShow("表单第")+(i+1)+util.getLangShow("行值映射非法，格式为key:val,key:val..."));
			}
		}
	});
	if(valiDefaultVal.length >0) {
		showMsg(valiDefaultVal,2);
		return false;
	}
	var url = $("#valiEFinalUrl").val();
	var updata = $("#dataForm").serialize()+"&className="+$("#className").val();
	// var updata ={};
	util.initLangMap("['服务器正在检验Excel导入数据合法性中...']");
	showMsg(util.getLangShow("服务器正在检验Excel导入数据合法性中..."));
	util.showTopLoading();
	$.post(url,updata,function(data) {
		setBtnDisabled(true);
		if(data.ajaxMap.msgList) {
			if(data.ajaxMap.msgList.length >0) {
				util.closeTopLoading();
				 util.closeLoading();
				showMsg(data.ajaxMap.msgList,2);
			}else {
				util.initLangMap("['服务器正在检验Excel导入数据合法性通过']");
				showMsg(util.getLangShow("服务器检验Excel导入数据合法性通过"),1);
				var impUrl = $("#importUrl").val();
				$.post(impUrl,updata,function(data){
					util.initLangMap("['服务器正在检验表中主键数据是否重复...']");
					showMsg(util.getLangShow("服务器正在检验表中主键数据是否重复..."));
					if(data.ajaxMap && data.ajaxMap.res ) {
						if(data.ajaxMap.res == "0") { // res 0 导入临时表出现问题 res 1
													// 导入临时表成功,2插入正式表 出现问题
														// 主键重复等 3插入正式表ok
														// 4出现未知错误
							var msgStr = "";
							showMsg(data.ajaxMap.msgList,2);
						}else if(data.ajaxMap.res== "1"){
							showMsg(data.ajaxMap.msg,2);
						}else if(data.ajaxMap.res== "2") {
							showMsg(data.ajaxMap.msg,2);
						}else if(data.ajaxMap.res== "3") {
							showMsg(data.ajaxMap.msg,1);
							pLoad();
						}else if(data.ajaxMap.res =="4") {
							showMsg(data.ajaxMap.msg,2);
						}else if(data.ajaxMap.res == true) {
							showMsg(data.ajaxMap.msg,1);
						}else if(data.ajaxMap.res == false){
							showMsg(data.ajaxMap.msg,2);
						}else if(data.ajaxMap.res == "9999") {
							showMsg($("#className").val() + "类未返回导入信息",2);
						}
						
					}
					util.closeTopLoading();
					 util.closeLoading();
				});
			}
		}
		
	});
}
// 保存excel 模板
function saveExcelModel() {
	if(!valiImpAndSave()) {
		return ;
	}
	util.showTopLoading();
	util.initLangMap("['正在保存Excel模板中...']");
	showMsg(util.getLangShow("正在保存Excel模板中..."), 0);
	var updata = $("#dataForm").serialize();
	var url = $("#dataForm").attr("action");
	$.post(url,updata,function(data){
		util.closeTopLoading();
		 util.closeLoading();
		if(data.ajaxMap.res == "1") {
			showMsg(data.ajaxMap.msg,1);
		}else {
			showMsg(data.ajaxMap.msg,2);
		}
		
	});
}

// 加载excelmodel
function loadExcelModel() {
	var url = $("#loadExcelUrl").val();
	var dataHtml = [];
	$.post(url,{exeid: $("#exeid").val()},function(data){
		if(data.ajaxMap.res == 1) {
			var dataLs = data.ajaxMap.modelList;
			
			
			for(var i=0; i<dataLs.length ; i++) {
				var $tdSelectHtml = $(tdSelectHtml); // 数据库表字段
				var $_tableHtml = $(_tableHtml); // 数据库表 对照用
				$_tableHtml.attr("name","dzTab." + dataLs[i].TABLE_COL_ID);
				$_tableHtml.attr("onchange","getDbKey(this)");
				$($_tableHtml).find("option").each(function(index,e) {
					if(dataLs[i].TABLE_ID == e.value) {
						$(this).attr("selected",true);
					}
				});
				
				dataHtml.push("<tr>");
				dataHtml.push("<td style='overflow: hidden;text-overflow:ellipsis;white-space:nowrap;'><input name='excelColName' type='hidden' value='"+dataLs[i].EXCEL_COL_NAME+"'><span title='"+dataLs[i].EXCEL_COL_NAME +"'>" + dataLs[i].EXCEL_COL_NAME +"</span></td>");
				$($tdSelectHtml).find("option").each(function(index,e){
					if(dataLs[i].TABLE_COL_ID == e.value) {
						$(this).attr("selected",true);
					}
				});
// dataHtml.push("<td class='dataKey'>" + dataLs[i].TABLE_COL_ID +"</td>");
// //数据库表字段
				dataHtml.push("<td class='dataKey'>" + $($tdSelectHtml).prop("outerHTML") +"</td>"); // 数据库表字段
				
				if(dataLs[i].TABLE_COL_ID == -1) {
					dataHtml.push("<td style='width:60px;'><input type='hidden' name='canNull' value=''/><input type='hidden' name='colType' value=''/></td>");
					dataHtml.push("<td style='width:40px;'></td>");
					dataHtml.push("<td></td>");
					dataHtml.push("<td></td>");
					dataHtml.push("<td></td>");
					dataHtml.push("<td></td>");
					dataHtml.push("<td></td>");
					continue;
				}
				dataHtml.push("<td style='width:60px'>" + "<input name='canNull' type='hidden' value='"+dataLs[i].REQ_MARK+"' /><input name='colType' type='hidden' value='"+dataLs[i].COL_TYPE+"' /><input type='checkbox'  value='"+ (dataLs[i].TABLE_COL_ID) +"' disabled='disabled' "+ (dataLs[i].REQ_MARK == "0"? "checked='checked'":"") +"/>" +"</td>"); // 是否为空
																																																																																								// 0打钩
																																																																																								// 1不打勾
				
				dataHtml.push("<td style='width:40px'>" +"<input type='checkbox' name='primaryKey' onclick='checkClick(this)' value='"+dataLs[i].TABLE_COL_ID+"' "+ (dataLs[i].PK_MARK==1?'checked':'') +" />" +"</td>"); // 是否主键
// dataHtml.push("<td style='width:40px'>" +dataLs[i].PK_MARK +"</td>"); //是否主键
				dataHtml.push("<td>" + "<input type='text' maxlength='33' style='width:145px' class='defaultVal' name='defaultVal."+dataLs[i].TABLE_COL_ID+"' />" +"</td>"); // 默认值
// dataHtml.push("<td>" + dataLs[i].DEF_VAL +"</td>"); //默认值
				
				if(dataLs[i].COL_TYPE == 2) {
					dataHtml.push("<td>"+ "<input type='text' maxlength='100' class='valMap' style='width:145px' name='valMap."+dataLs[i].TABLE_COL_ID+"' value='"+ (dataLs[i].VAL_MAP == null?"":dataLs[i].VAL_MAP) +"' />" +"</td>");
					$_tableHtml.find("option").each(function(index,e){
						if(e.value == dataLs[i].TABLE_ID)  
							$(this).attr("selected",true); 
					});
					dataHtml.push("<td>"+$_tableHtml.prop("outerHTML")+"</td>"); // 对照表
					// alert($_tableHtml.prop("outerHTML"));
					if(dataLs[i].TABLE_ID != "-1") { // 动态获取表字段
						var url = util.getContextPath()+"/sys/excel/ExcelAction_getTableKeyList.ms";
						var tableName = dataLs[i].TABLE_ID;
						var colType = dataLs[i].COL_TYPE;
						var tableColId = dataLs[i].TABLE_COL_ID;
						var colName = dataLs[i].COL_NAME;
						
						$.ajax({
							url:url, type:"post", async:false,dataType:"json",
							data:{tableName: tableName,colType2: colType}, 
							success:function(data) {
								if(data) {
									var dzKeyListHtmlArr = [];//-->"<select name='dzKey.'
									var dzValListHtmlArr = [];//-->"<select name='dzVal.'
									dzKeyListHtmlArr.push("<select name='dzKey.'" +tableColId +" >");
									util.initLangMap("['请选择']");
									dzKeyListHtmlArr.push("<option value='-1'>"+"--"+util.getLangShow("请选择")+"--"+"</option>");
									for(var k=0 ; k<data.ajaxMap.dzKeyList.length ; k++) {
										dzKeyListHtmlArr.push("<option "+(colName==data.ajaxMap.dzValList[k].COLUMN_NAME?"selected":"" )+">"+ data.ajaxMap.dzKeyList[k].COLUMN_NAME+"</option>");
									}
									dzKeyListHtmlArr.push("</select>");  
									dzValListHtmlArr.push("<select name='dzVal.' "+tableColId +" >");
									util.initLangMap("['请选择']");
									dzValListHtmlArr.push("<option value='-1'>"+"--"+util.getLangShow("请选择")+"--"+"</option>");
									for(var j=0; j<data.ajaxMap.dzValList.length; j++) {
										dzValListHtmlArr.push("<option "+(colName==data.ajaxMap.dzValList[j].COLUMN_NAME?"selected":"" )+">"+ data.ajaxMap.dzValList[j].COLUMN_NAME+"</option>");
									}
									dataHtml.push("<td>" + dzKeyListHtmlArr.join("") +"</td>"); // 对照字段
									dataHtml.push("<td>" + dzValListHtmlArr.join("") +"</td>"); // 对照值
									// alert(dzValListHtmlArr.join(""));
								}
							}
						});
					}else {
						dataHtml.push("<td></td>"); // 对照字段
						dataHtml.push("<td></td>"); // 对照值
					}
					
					
				}else {
					dataHtml.push("<td></td>"); // 值映射
					dataHtml.push("<td></td>"); // 对照表
					dataHtml.push("<td></td>"); // 对照字段
					dataHtml.push("<td></td>"); // 对照值
				}
				
				
				dataHtml.push("</tr>");
			} // for循环结束
			$("#tbodyDataLst").html(dataHtml.join(""));
			
			
			// 遍历tr 还原 原本画面
			$("#tbodyDataLst tr").each(function (index,e){
				
				
			});
			_excelColSize = $("select[name='dbKey']").length;
			// 遍历数据库字段
			$("select[name='dbKey']").each(function(index,e){
				if(e.value != "-1") {
					_selValArr.push(e.value);
					$(this).data("last",e.value);
				}
				
			});
			
			for(var i=0;i<_selValArr.length ; i++) {
				$("select[name='dbKey']").find("option").each(function(index,e){
					if(e.value==_selValArr[i]) {
						$(this).css("display","none");
					}
				});
			}
		}else { // 没有模板不处理
		}
	});
}// loadExcelModel


//div显示工具
/**
 * msg:消息
 * status:状态 0默认 1通过  2失败 
 */
function showMsg(msg,status) { 
	
	var styleStr = "";
	if(status == 0)  
		styleStr = "";
	if(status== 1) 
		styleStr = "style='color:#7ccd7c'";
	if (status == 2) 
		styleStr = "style='color:#EE2C2C'"; 
	var $msgDiv = $("#mCSB_2_container");//#divMcb_2_container
	if(typeof msg == "string")  
		$msgDiv.append("<p "+styleStr+">"+msg+"</p>");
     if(msg instanceof Array)  
		for(var i=0 ; i<msg.length ; i++)  
			$msgDiv.append("<p "+styleStr+">"+msg[i]+"</p>");  
	$("#msgDiv").mCustomScrollbar("scrollTo",9999999,null); 
}

function checkClick(obj) {
	var status = !obj.checked;
	$("#tbodyDataLst input[name='primaryKey']").prop("checked",false);
	obj.checked = !status;
}


function pLoad(){
    var iframeId=$("#iframeId").val();
    var pifrWin=$(window.parent.document).contents().find("#"+iframeId)[0].contentWindow;
    pifrWin.query();
}//function pLoad(){

function initDbKeySelectVal(excelTitileCell,selDom) {
	var $selDom = $(selDom);
	var dbKeySelVal = null;
	$selDom.find("option").each(function(i,e){
		if($(e).text() == excelTitileCell) {
			dbKeySelVal = e.value;
			if(!containVal(dbKeySelVal)) {
				_selValArr.push(dbKeySelVal);
				$(this).attr("selected",true);
				relTd($selDom[0]);
			}
			return false;
		}
	});
	
	return $selDom.prop("outerHTML");
}

//判断数据库selec数组值是否包含 
function containVal(dbKeySelVal) {
	for(var i = 0; i<_selValArr.length; i++) {
		if(_selValArr[i]==dbKeySelVal) {
			return true;
		}
	}
	return false;
}

function setBtnDisabled(flag) {
	if(flag == true) {
		$("#importBtn").addClass("disabled");
		$("#importBtn").attr("disabled",true);
	}else {
		$("#importBtn").removeClass("disabled");
		$("#importBtn").removeAttr("disabled");
	}
	
}
	
	
	
	</script>

</head>
<body>
	<div class="edit">
		<%-- <form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
					target="submitFrame"> --%>
					
            <div class="hd">
            	
                 <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <%--<div style="margin-left:10px;">
                <div class="save-close" <dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
                <s:if test="${isDataAuth == '1'}">
                		<span class="dot">*</span><dict:lang value="组织机构" />
                		<s:if test="${fn:length(deptLs)==1}">
                   			<s:select list="deptLs" listKey="id" listValue="name"  name="_DATA_AUTH"
								id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
                   		</s:if>
                   		<s:else>
                			<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
								listKey="id" listValue="name"  name="_DATA_AUTH"
								id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
		   				</s:else>
                	</s:if>	
                </div> 
               
  --%><iframe id="ifrExcel" name="ifrExcel"  style="display: none;"></iframe>
  <input type="hidden" id="infoFileNotEmptt" value='<dict:lang value="文件上传不能为空!" />'/>
  <input type="hidden" id="infoExtErr" value='<dict:lang value="目前只支持xlsx、xls文件上传!" />'/>
  		
  
  <input type="hidden" id="infoImportAttrList" value='<dict:lang value="导入所需要的字段" />'/>
 

<!--  <input type="file" id="fileUp" name="upFile" accept=".xlsx,.xls" /> -->
		<!--  <input type="button" value="上传" onclick="getUpFile()"/> -->
		<!--  <input type="button" value="导入" onclick="importExcel()"/> -->

 <!-- </form> -->
                

			    <div class="optn">
			        <button type="button" id="importBtn" class="disabled" disabled="disabled" onclick="importExcel()"><i class="ico ico-lead"></i><dict:lang value="开始导入" /></button>
			        <button type="button" onclick="saveExcelModel()"><i class="ico ico-save"></i><dict:lang value="保存模板" /></button>
			        <button type="button" onclick="window.location.href='${path}sys/excel/ExcelAction_downloadExcelModel.ms?exeid=<c:out value='${exeid}'/>'"><i class="ico ico-save"></i><dict:lang value="下载模板" /></button>
			    </div>
			   
			</div>
			
			<div class="bd"	style="height:500px;">
			 <form id="myfrm" name="myfrm" target="ifrExcel" enctype="multipart/form-data" method="post" action="${path}sys/excel/ExcelAction_ImportSaveFile.ms">
			    <div style="height:30px;">
			        <!-- <p style="float:left;">默认值：<span>男</span>&#x3000;值映射：<span>男：0；女：1</span></p>	 -->	
			        <!--  
			        <span title="当类全路径不为空时，开始导入执行该类中的指定方法">类全路径名:</span>
			        <input class="input" type="text" style="width: 200px" id="className" title="当类全路径不为空时，开始导入执行该类中的指定方法">.customImport
                    -->
                    
                    <label style="float:right;">
                        <span><dict:lang value="请选择文件"/>...</span>
                        <span class="button" ><dict:lang value="上传"/></span>
                        <input type="file"  style="display:none;" id="fileUp" name="upFile" accept=".xlsx,.xls" >
                    </label>
                    <div id="tempDiv">
                    	
                    </div>
			    </div>
	    	</form>
				<div class="main">
				    <table style="background-color:#e6eaf4;">
				        <tr>
				            <td><dict:lang value="电子表格字段" /> </td>
						        <td><dict:lang value="数据库表字段" /> </td>
						        <td style="width:60px"><dict:lang value="必填项" /> </td>
						        <td style="width:40px"><dict:lang value="主键" /></td>
						        <td><dict:lang value="默认值" /></td>
						        <td><dict:lang value="值映射" /></td>
						        <td><dict:lang value="对照表" /></td>
						        <td><dict:lang value="对照字段" /></td>
						        <td><dict:lang value="取值字段" /></td>
				        </tr>
				    </table>
				    <div class="scroll">
				    <form id="dataForm" action="${path }sys/excel/ExcelAction_saveExcelModel.ms" method="post">
						<input type="hidden" value="${path }sys/excel/ExcelAction_valiExcelFinal.ms" id="valiEFinalUrl" />
						<input type="hidden" value="${path }sys/excel/ExcelAction_importExcel.ms" id="importUrl" />
						<input type="hidden" value="${path }buss/bussModel_ImportStep01AtrrInfo.ms" id="step01" />
						<input type="hidden" value="" name='tableName' id="tableName" />
						<input type="hidden" value="<c:out value='${iframeId}' />" id="iframeId" name="iframeId" />
						<input type="hidden" id="exeid" value="<c:out value='${exeid}' />" name="exeid"/>
						<input type="hidden" id="formId" value="<c:out value='${formId}' />" name="formId"/>
						<input type="hidden" value="${path }sys/excel/ExcelAction_loadExcelModel.ms" id="loadExcelUrl">
						<table id="tbodyDataLst">
			        	    	
						</table>
				        	</form>
				    </div>
				    <div class='msg_sctoll' style="width:100%;height:200px;overflow: auto;"  id="msgDiv">
				   		
				    
				    </div>
				</div>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	   <script>
	        		$("#fileUp").change(function(){
	        			if($(this).val()) {
	        				var fileName = $(this)[0].files[0].name;
	        				$(this).prev().prev().html(fileName);
			            	$(this).prev().prev().attr("title", fileName);
			            	getUpFile(); //上传文件
			            	$(this).val("");
	        			}else {
	        				$(this).prev().prev().html("请选择文件...");
	        			}
	        		   // var fileName = $(this)[0].files[0].name;
	        		   // alert($(this).val());
			          
			            
	        		});
	   </script>
	    
    	<script>(function($){
            $(window).on('load',function(){
                setPopScroll('.scroll');
                setPopScroll("#msgDiv");
               //setPopScroll(".msg_sctoll");
              //  $("#msgDiv").mCustomScrollbar();
            });
        })(jQuery);											
        </script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
