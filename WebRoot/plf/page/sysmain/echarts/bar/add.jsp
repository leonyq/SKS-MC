<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<head>
<title><dict:lang value="柱图新增配置" />
</title>
<%@ include file="/plf/common/pub_meta.jsp"%>
<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="popDivWinFp" value="1" />
	<jsp:param name="chosen" value="1" />
	<jsp:param name="spectrum" value="1" />
	<jsp:param name="popDivWin" value="1" />
	<jsp:param name="serializeForm" value="1" />
</jsp:include>
<title></title>

<style type="text/css">
        .mCSB_outside + .mCS-minimal-dark.mCSB_scrollTools_vertical {
		    right: 2px;
		}
</style>

<script type="text/javascript" src="${path}/plf/page/sysmain/echarts/js/cache.js?_mc_res_version=<%=PlfStaticRes.CACHE_JS %>"></script>
<script type="text/javascript">

$(function(){
	$('.all').height($(window).height() - 80);
	
	$('.all').mCustomScrollbar({
	    axis:"yx",
		snapAmount:40,
		theme:"minimal-dark",
		keyboard:{scrollAmount:40},
		mouseWheel:{deltaFactor:40,preventDefault:true},
		scrollInertia:80,
		autoHideScrollbar:true,
	});
	// 数据源切换
    $("#CHARTS_DATA_SOURCES").change(function(){
    	var chartsDataSources = $(this).val();
    	var isLine = $("#isLine").val();
		if(chartsDataSources=="1"){// sql查询
			$(".sql").show();
			$(".javaClass,.jsonStr").hide();
			if(isLine=="1"){
				$(".lineSql").show();
				$(".lineJavaClass,.lineJsonStr").hide();
			}
		}else if(chartsDataSources=="2"){// java类
			$(".javaClass").show();
			$(".sql,.jsonStr").hide();
			if(isLine=="1"){
				$(".lineJavaClass").show();
				$(".lineSql,.lineJsonStr").hide();
			}
		}else{//json串
			$(".jsonStr").show();
			$(".sql,.javaClass").hide();
			if(isLine=="1"){
				$(".lineJsonStr").show();
				$(".lineSql,.lineJavaClass").hide();
			}
		}
	});	
var db_dialect="<s:property value="@com.more.fw.core.common.method.CommMethodMc@getCUR_DB_DIALECT()"/>";
function getBarSql(sql){
	var db_sql2 = document.getElementById(db_dialect+"_sql");
	var val2 = db_sql2.value;
	var db_sql3 = document.getElementById("comm_sql");
	var val3 = db_sql3.value;
	if(val.isBlank(val2)&&val.isBlank(val3)){
		var lineCodeType = $("input[name='bar.barCodeType']:checked").val();
		var elementId;
		switch(lineCodeType)
		{
			case "commql":elementId = document.getElementById("comm_sql");
			  break;
			case "oracle":elementId = document.getElementById("oracle_sql");
			  break;
			case "sqlserver":elementId = document.getElementById("sqlserver_sql");
			  break;
			case "pgsql":elementId = document.getElementById("pg_sql");
			  break;
			default:elementId = document.getElementById("mysql_sql");	  
		}
	   	_alertValMsg(elementId,"<dict:lang value="通用和当前数据库SQL" /> -- <dict:lang value="不能同时为空" />");
	   	return false;
	}
	sql[db_dialect] = val.isBlank(val2)?val3.replace("?","%3F"):val2.replace("?","%3F");
	return true;
}

function getLineSql(sql){
	var db_sql2 = document.getElementById("line_"+db_dialect+"_sql");
	var val2 = db_sql2.value;
	var db_sql3 = document.getElementById("line_comm_sql");
	var val3 = db_sql3.value;
	if(val.isBlank(val2)&&val.isBlank(val3)){
		var lineCodeType = $("input[name='bar.lineCodeType']:checked").val();
		var elementId;
		switch(lineCodeType)
		{
			case "commql":elementId = document.getElementById("line_comm_sql");
			  break;
			case "oracle":elementId = document.getElementById("line_oracle_sql");
			  break;
			case "sqlserver":elementId = document.getElementById("line_sqlserver_sql");
			  break;
			case "pgsql":elementId = document.getElementById("line_pg_sql");
			  break;
			default:elementId = document.getElementById("line_mysql_sql");	  
		}
	   	_alertValMsg(elementId,"<dict:lang value="通用和当前数据库SQL" /> -- <dict:lang value="不能同时为空" />");
	   	return false;
	}
	sql[db_dialect] = val.isBlank(val2)?val3.replace("?","%3F"):val2.replace("?","%3F");
	return true;
}

function getFieldBySql(configTr,colTitle){
	var url = "${path}charts/barAction_getFields.ms";
	util.showLoading("处理中...");
	var sql = {};
	var status = configTr=="dataConfigTr"?getBarSql(sql):getLineSql(sql);
	if(!status){
		util.closeLoading();
		return;
	}
	$.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: sql,
		success: function(data){
				util.closeLoading();
				if(null == data){return ;}
				if(null != data.ajaxList){
					var aList = eval(data.ajaxList);
					setFieldData(aList,configTr,colTitle);
				};
			},
		error: function(msg){
				util.closeLoading();
				//utilsFp.confirmIcon(1,"","","", "<dict:lang value='获取字段失败！' />","","255","155");
				utilsFp.confirmIcon(1,"","","", msg.responseText,"","255","155");//封装提供一个公用SQL解析方法  by liuth
				//util.alert("error:"+msg.responseText);
		  }
		});
	return false;
}

function getFieldByJava(configTr,colTitle){
	var barClsCodeId = $("#barClsCodeId").val();
	if(barClsCodeId ==""){
		_alertValMsg($("#barJavaClass"),"<dict:lang value="JAVA类不能为空" />");
		return;
	}
	var url = "${path}charts/barAction_getJavaDataFields.ms";
	util.showLoading("处理中...");
	$.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: "paraMap.barClsCodeId="+barClsCodeId,
		success: function(data){
				util.closeLoading();
				if(null == data){return ;}
				if(data){
					var aList =data;
					setFieldData(aList,configTr,colTitle);
				};
			},
		error: function(msg){
				util.closeLoading();
				utilsFp.confirmIcon(1,"","","", "<dict:lang value='获取字段失败！' />","","255","155");
				//util.alert("error:"+msg.responseText);
		  }
		});
	return false;
	
}

function setFieldData(aList,configTr,colTitle){
	var arr = [];
	var lastTr = $("#"+colTitle);
	var arrColorCount = [];
	var barXcoordinate = [];
	for(var i = 0;i < aList.length; i++){
		arr.push("<tr class="+configTr+">");
		if(configTr=="dataConfigTr"){
			arr.push("<td><input type='text' readonly='readonly' name='bar.barDatas["+i+"].name' value="+aList[i].filedName+"></td>");
			arr.push("<td><input type='text' name='bar.barDatas["+i+"].asName' value="+aList[i].filedName+"></td>");
			arr.push("<td><input type='text' name='bar.barDatas["+i+"].stackCategory' ></td>");
			arr.push("<input type='hidden'  value="+(i+1)+" name='bar.barDatas["+i+"].id'/>");
			arr.push("<input type='hidden'  value="+(i+1)+" name='bar.barPointDatas["+i+"].id'/>");
			arr.push("<td><input type='text' id='color1_"+i+"' value='#000000' name='bar.barPointDatas["+i+"].color1'/></td>");
			arr.push("<td><input type='text' id='color2_"+i+"' value='#000000' name='bar.barPointDatas["+i+"].color2'/></td>");
			arr.push("<td><select class='isBarDataCol' name='bar.barDatas["+i+"].isBarDataCol' ><option value='2'>否</option><option value='1'>是</option></select></td>");
			barXcoordinate.push("<option value="+aList[i].filedName+">"+aList[i].filedName+"</option>");
		}else{
			arr.push("<td><input type='text' readonly='readonly' name='bar.lineDatas["+i+"].name' value="+aList[i].filedName+"></td>");
			arr.push("<td><input type='text' name='bar.lineDatas["+i+"].asName' value="+aList[i].filedName+"></td>");
			
			arr.push("<td><input type='text' class='setColorSelect' value='#000000' name='bar.lineDatas["+i+"].color'></td>");
			arr.push("<td><input type='text' class='isNum' name='bar.lineDatas["+i+"].lineWidth' ></td>");
			
			//arr.push("<td><select name='bar.lineDatas["+i+"].pointDatas["+i+"].isMarkPointImageShow' ><option value='2'>否</option><option value='1'>是</option></select></td>");
			//arr.push("<td><input type='text'  name='bar.lineDatas["+i+"].pointDatas["+i+"].markPointImageUrl'/></td>");
			//arr.push("<td><input type='text'  name='bar.lineDatas["+i+"].pointDatas["+i+"].markPointSize'/></td>");
			arr.push("<td><select class='isLineDataCol' name='bar.lineDatas["+i+"].isLineDataCol' ><option value='2'>否</option><option value='1'>是</option></select></td>");
		}
		arr.push("</tr>"); 
		arrColorCount[i] = i;
	}
	$("."+configTr).remove();
	lastTr.html(arr.join(""));
	
	if(configTr!="dataConfigTr"){
		setColor($(".setColorSelect"));
	}
	
	if(arrColorCount.length>0){
		for(var atr in arrColorCount){
			setColor($("#color1_"+atr));
			setColor($("#color2_"+atr));
		};
	};
	
	if(barXcoordinate.length>0){
		$("#barXcoordinate").html(barXcoordinate.join(""));
	};
}

$("input[name='bar.xAxisValue']").change(function(){
	var xAxisValue = $(this).val();
	if(xAxisValue=="true"){
		$("#xInterval").show();
		$("#yInterval").hide();
	}else{
		$("#xInterval").hide();
		$("#yInterval").show();
	}
});

var trMarkPointDatasCount = 1;
$("#addMarkPointDatas").click(function(){
	var trMarkPointDatas = "<tr>"
						 + "<td><input type=\"text\" class=\"xAxisValue isNum\"  name=\"bar.markPointDatas["+trMarkPointDatasCount+"].xAxisValue\" value=\"\"></td>"
						 + "<td><input type=\"text\" class=\"yAxisValue isNum\"  name=\"bar.markPointDatas["+trMarkPointDatasCount+"].yAxisValue\" value=\"\"></td>"
						 + "<td style='text-align:center;'><input type=\"button\" class=\"delMarkPointDatas\" value=\"删除\" /></td>"
						 + "</tr>";
	$("#markPointDatas").append(trMarkPointDatas);
	trMarkPointDatasCount++;
});

$(".delMarkPointDatas").live("click",function(){
	$(this).parent().parent().remove();
	$("#markPointDatas tr").each(function(index,item){
		$(this).find(".xAxisValue").attr("name","bar.markPointDatas["+index+"].yAxisValue");
		$(this).find(".yAxisValue").attr("name","bar.markPointDatas["+index+"].yAxisValue");
	});
	trMarkPointDatasCount--;
});

$("#getFieldBtn").click(function(){
	$("#markLineColor_0").spectrum("get");
	var chartsDataSources = $("#CHARTS_DATA_SOURCES").val();
	if(chartsDataSources == "1"){
		getFieldBySql("dataConfigTr","colTitle");
	}else if(chartsDataSources == "2"){
		getFieldByJava("dataConfigTr","colTitle");
	}else{
		var jsonSourceFun = $("#jsonSourceFun").val();
		if(jsonSourceFun!=""){
			var url = "${path}charts/barAction_getJsonData.ms";
			eval(jsonSourceFun);
		}else{
			_alertValMsg($("#jsonSourceFun"),"<dict:lang value="函数体不能为空" /> -- <dict:lang value="不能为空" />");
			return false;
		}
	};
});

function getJsonDataFields(data,flag){
	if(data){
		var JsonData = data[0];
		var aList = [];
		for(var key in JsonData){
			var colObj = new Object();
			colObj["filedName"] = key;
			aList.push(colObj);
		};
		flag == "bar" ? setFieldData(aList,"dataConfigTr","colTitle"):
			setFieldData(aList,"lineDataConfigTr","lineColTitle");
	};
}


$("#getLineFieldBtn").click(function(){
	var chartsDataSources = $("#CHARTS_DATA_SOURCES").val();
	if(chartsDataSources == "1"){
		getFieldBySql("lineDataConfigTr","lineColTitle");
	}else if(chartsDataSources == "2"){
		getFieldByJava("lineDataConfigTr","lineColTitle");
	}else{
		var jsonSourceFun = $("#jsonSourceFun").val();
		if(jsonSourceFun!=""){
			var url = "${path}charts/barAction_getJsonData.ms";
			eval(jsonSourceFun);
		};
	}
});


$("input[name='bar.barCodeType']").change(function(){
	var barCodeType = $(this).val();
	if(barCodeType == "commql"){
		$("#comm_sql").show();
		$("#oracle_sql,#sqlserver_sql,#mysql_sql,#pg_sql").hide();
	}else if(barCodeType == "oracle"){
		$("#oracle_sql").show();
		$("#comm_sql,#sqlserver_sql,#mysql_sql,#pg_sql").hide();
	}else if(barCodeType == "sqlserver"){
		$("#sqlserver_sql").show();
		$("#comm_sql,#oracle_sql,#mysql_sql,#pg_sql").hide();
	}else if(barCodeType == "pgsql"){
		$("#pg_sql").show();
		$("#comm_sql,#oracle_sql,#mysql_sql,#sqlserver_sql").hide();
	}else{
		$("#mysql_sql").show();
		$("#comm_sql,#oracle_sql,#sqlserver_sql,#pg_sql").hide();
	};
});

$("input[name='bar.lineCodeType']").change(function(){
	var lineCodeType = $(this).val();
	if(lineCodeType == "commql"){
		$("#line_comm_sql").show();
		$("#line_oracle_sql,#line_sqlserver_sql,#line_mysql_sql,#line_pg_sql").hide();
	}else if(lineCodeType == "oracle"){
		$("#line_oracle_sql").show();
		$("#line_comm_sql,#line_sqlserver_sql,#line_mysql_sql,#line_pg_sql").hide();
	}else if(lineCodeType == "sqlserver"){
		$("#line_sqlserver_sql").show();
		$("#line_comm_sql,#line_oracle_sql,#line_mysql_sql,#line_pg_sql").hide();
	}else if(lineCodeType == "pgsql"){
		$("#line_pg_sql").show();
		$("#line_comm_sql,#line_oracle_sql,#line_mysql_sql,#line_sqlserver_sql").hide();
	}else{
		$("#line_mysql_sql").show();
		$("#line_comm_sql,#line_oracle_sql,#line_sqlserver_sql,#line_pg_sql").hide();
	};
});


var markLineDatasCount = 0;
$("#addMarkLineDatas").click(function(){
	//<td><input type="text" name="bar.markLineDatas[0].name" value=""></td>
	var markLineDatas = "<tr>"
					  + "<td style=\"text-align: center;\"><input type=\"checkbox\" name=\"markLineDatasCheckbox\" ></td>"
					  + "<td><input type=\"text\" class=\"markLineName\"  name=\"bar.markLineDatas["+markLineDatasCount+"].name\" value=\"\"></td>"
					  + "<td><input type=\"text\" class=\"markLineyAxis\" class=\"isNum\" name=\"bar.markLineDatas["+markLineDatasCount+"].yAxis\" value=\"\"></td>"
					  + "<td><input type=\"text\" class=\"markLineColor\" id=\"markLineColor_"+markLineDatasCount+"\" name=\"bar.markLineDatas["+markLineDatasCount+"].color\" value=\"#000000\"></td>"
					  + "</tr>";
	$("#markLineDatasTbody").append(markLineDatas);
	setColor($("#markLineColor_"+markLineDatasCount));
	markLineDatasCount++;
});

$("#delMarkLineDatas").click(function(){
	var curCount = 0;
	var markLineDatasCheckboxLength = $("input[name='markLineDatasCheckbox']").length;
	$("input[name='markLineDatasCheckbox']").each(function(index,item){
		var curCheck = $(this).prop("checked");
		if(curCheck){
			curCount++;
		};
	});
	if(curCount == 0){
		 utilsFp.confirmIcon(1,"","","", "请选择一条数据！","","260","145");
		 return;
	}
	if(markLineDatasCheckboxLength > 0){
		$("input[name='markLineDatasCheckbox']:checked").parent().parent().remove();
		$("#markLineDatasTbody tr").each(function(index,item){
			$(this).find(".markLineName").attr("name","bar.markLineDatas["+index+"].name");
			$(this).find(".markLineyAxis").attr("name","bar.markLineDatas["+index+"].yAxis");
			$(this).find(".markLineColor").attr("name","bar.markLineDatas["+index+"].color");
			$(this).find(".markLineColor").attr("id","markLineColor_"+index);
		});
		markLineDatasCount = markLineDatasCheckboxLength-1;
	}else{
		markLineDatasCount = 0;
	};
});

// 辅助线选中
$("#selectAll").click(function(){
	var curCheck = $(this).prop("checked");
    $("input[name='markLineDatasCheckbox']").prop("checked",curCheck);
});

$("#isLine").change(function(){
	var isLine = $(this).val();
	var chartsDataSources = $("#CHARTS_DATA_SOURCES").val();
	if(isLine == "1"){
		$(".line").show();
		//$("#lineYdatasStr").addClass("isNumComma");
		if(chartsDataSources=="1"){
			$(".lineSql").show();
			$(".lineJavaClass,.lineJsonStr").hide();
		}else if(chartsDataSources=="2"){
			$(".lineJavaClass").show();
			$(".lineSql,.lineJsonStr").hide();
		}else{
			$(".lineJsonStr").show();
			$(".lineSql,.lineJavaClass").hide();
		};
	}else{
		//$("#lineYdatasStr").removeClass("isNumComma");
		$(".line,.lineSql,.lineJavaClass,.lineJsonStr").hide();
	};
});
setColor($("#lineDatasColor"));
});
setColor($(".setColorSelect"));
function addBarAttr(thisObj){
	var chartsType = $("#CHARTS_TYPE").val();
	$("#chartsType").val(chartsType);
	var chartsDataSources = $("#CHARTS_DATA_SOURCES").val();
	$("#chartsDataSources").val(chartsDataSources);
	var isLine = $("#isLine").val();
	if(chartsDataSources == "1"){
		var barCodeType = $("input[name='bar.barCodeType']:checked").val();
		var barTxt = $("."+barCodeType).val();
		if(barTxt == ""){
			_alertValMsg($("."+barCodeType),"<dict:lang value="数据源不能为空" />");
			return;
		};
		if(isLine=="1"){
			var lineCodeType = $("input[name='bar.lineCodeType']:checked").val();
			var lineTxt = $(".line"+lineCodeType).val();
			if(lineTxt == ""){
				_alertValMsg($(".line"+lineCodeType),"<dict:lang value="数据源不能为空" />");
				return;
			};
		}
	}else if(chartsDataSources == "2"){
		var barJavaClass = $("#barJavaClass").val();
		if(barJavaClass == ""){
			_alertValMsg($("#barJavaClass"),"<dict:lang value="数据源不能为空" />");
			return;
		};
		if(isLine=="1"){
			var lineJavaClass = $("#lineJavaClass").val();
			if(lineJavaClass == ""){
				_alertValMsg($("#lineJavaClass"),"<dict:lang value="数据源不能为空" />");
				return;
			};
		};
	}else{
		var jsonSourceFun = $("#jsonSourceFun").val();
		if(jsonSourceFun == ""){
			_alertValMsg($("#jsonSourceFun"),"<dict:lang value="数据源不能为空" />");
			return;
		};
		if(isLine=="1"){
			var lineJsonSourceFun = $("#lineJsonSourceFun").val();
			if(lineJsonSourceFun == ""){
				_alertValMsg($("#lineJsonSourceFun"),"<dict:lang value="数据源不能为空" />");
				return;
			};
		};
	}
	
	if(!colDataIsNull("isBarDataCol")){
		_alertValMsg($(".isBarDataCol"),"<dict:lang value="请选择数据列" />");
		return;
	}
	 
	if(isLine=="1" && !colDataIsNull("isLineDataCol")){
		_alertValMsg($(".isLineDataCol"),"<dict:lang value="请选择数据列" />");
		return;
	}
	
	if(!isBlank()){
		return ;
	};
	
	if(!valIsNum()){
		return ;
	}
	if(!isNumComma()){
		return ;
	};
	
	if(!isNumCommaOrNull()){
		return ;
	};
	
	if(!isNumOrNull()){
		return ;
	}
	if(!valIsPercentOrNum()){
		return ;
	}
	
	var isCache = $("#isCache").val();
	if(isCache == "1"){
		var chartsConfigCache =  msChartsData("addBarCharts");
		var iframeId = $("#iframeId").val();
		var chartsCacheId = $("#chartsCacheId").val();
		var buttonId = $("#buttonId").val();
		var showTypeId = $("#showTypeId").val();
		var parentFrame = top.document.getElementById(iframeId);//获取到父iframe对象
		$.ajax({
            type: "POST",
            dataType: "json",
            url: "${path}charts/barAction_cacheAdd.ms",
            data:chartsConfigCache,
            success: function(data){
             if(data.success){
            	 $("#"+buttonId,parentFrame.contentWindow.document).text("已配置");
            	 $("#"+showTypeId,parentFrame.contentWindow.document).val(chartsType);
            	 $("#"+chartsCacheId,parentFrame.contentWindow.document).val(data.info);
            	 parent.closePopWinFp('setKeyDataIframepop');
             }else{
            	 utilsFp.confirmIcon(3,"","","", "缓存失败","","260","145");
             };
            },
            error: function(msg){
            	util.closeLoading();
            	utilsFp.confirmIcon(3,"","","", "缓存失败","","260","145");
            }
        });
	}else{
		document.forms.addBarCharts.submit();
	}
	
	
}

function colDataIsNull(isDataCol){
	var validates = false;
	$("."+isDataCol).each(function(index,item){
		var isBarDataCol = $(this).val();
		if(isBarDataCol == "1"){
			validates = true;
			return false;
		}
	});
	return validates;
};

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
			if(vals==""){
				_alertValMsg($(this),"<dict:lang value="不能为空" />");
			}else{
				_alertValMsg($(this),"<dict:lang value="数据格式错误" />");
			}
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
			if(vals==""){
				_alertValMsg($(this),"<dict:lang value="不能为空" />");
			}else{
				_alertValMsg($(this),"<dict:lang value="数据格式错误" />");
			}
			validates = false;
			return false;
		};
	});
	return validates;
}

function isNumOrNull(){
	var validates = true;
	$(".isNumOrNull").each(function(index,item){
		var vals = $(this).val();
		if(!val.isNumOrNull(vals)){
			_alertValMsg($(this),"<dict:lang value='请输入整数！' />");
			validates = false;
			return false;
		};
	});
	return validates;
}

//
function isNumCommaOrNull(){
	var validates = true;
	$(".isNumCommaOrNull").each(function(index,item){
		var vals = $(this).val();
		if(!val.isNumCommaOrNull(vals)){
			if(vals==""){
				_alertValMsg($(this),"<dict:lang value="不能为空" />");
			}else{
				_alertValMsg($(this),"<dict:lang value="数据格式错误" />");
			}
			validates = false;
			return false;
		};
	});
	return validates;
}

function valIsPercentOrNum(){
	var validates = true;
	$(".isPercentOrNum").each(function(index,item){
		var vals = $(this).val();
		if(vals==""){
			return true;
		}
		
		if(!val.isPercentOrNum(vals)){
			_alertValMsg($(this),"<dict:lang value='请输入整数或者百分比' />");
			validates = false;
			return false;
		};
	});
	return validates;
}

function showEditCode(source){
	var url;
	if(source=='bar'){
		var barJavaClass = $("#barJavaClass").val();
		var barCodeType = $("#barCodeType").val();
		var barClsCode = $("#barClsCode").val();
		var barClsCodeId = $("#barClsCodeId").val();
		var popWinframeId = window.frameElement.id+"PopWin";
	    url = "${path}charts/barAction_cfgClsCode.ms?paraMap.CLASS_NAME="+barJavaClass+"&paraMap.codeType="+barCodeType
				/* +"&paraMap.clsCode="+barClsCode */+"&paraMap.barClsCodeId="+barClsCodeId+"&paraMap.source="+source+"&paraMap.piframeName="+window.frameElement.id
				+"&paraMap.piframeId="+window.frameElement.id+"&paraMap.popWinframeId="+popWinframeId;
	}else{
		var lineJavaClass = $("#lineJavaClass").val();
		var lineJavaCodeType = $("#lineCodeType").val();
		var lineJavaClsCode = $("#lineClsCode").val();
		var lineJavaClsCodeId = $("#lineClsCodeId").val();
		var popWinframeId = window.frameElement.id+"PopWin";
	    url = "${path}charts/barAction_cfgClsCode.ms?paraMap.CLASS_NAME="+lineJavaClass+"&paraMap.codeType="+lineJavaCodeType
				/* +"&paraMap.clsCode="+lineJavaClsCode */+"&paraMap.CODE_ID="+lineJavaClsCodeId+"&paraMap.source="+source+"&paraMap.piframeName="+window.frameElement.id
				+"&paraMap.piframeId="+window.frameElement.id+"&paraMap.popWinframeId="+popWinframeId;
	}
	showPopWinFp(url, $(top.document).width()*0.90, $(top.document).height()*0.90,null,"<dict:lang value="修改类源码"/>",popWinframeId);
}
</script>
</head>
<body>
	<button type="button" class="_save" onclick="addBarAttr(this);"><i class="ico"></i><dict:lang value="保存" /></button>
    <form id="addBarCharts" name="addBarCharts" action="${path}charts/barAction_doAdd.ms" method="post" >
     <input type="hidden" id ="chartsDataSources"  name="chartsConfig.chartsDataSources"  />
        <input type="hidden" id ="chartsType"  name="chartsConfig.chartsType"  />
      <div class="all">
        <div class="dataSource">
            <h3>数据源</h3>
            <table border='1'>
                <tr class="sql">
                    <td>SQL语句<span class="Eng">*</span></td>
                    <td colspan="5" style="padding:5px;">数据库适配：
                        <label><input type="radio" name="bar.barCodeType" value="commql" id="codeType_comm" checked="checked">通用语句</label>
                        <label><input type="radio" name="bar.barCodeType" value="oracle" id="codeType_oracle" >ORACLE</label>
                        <label><input type="radio" name="bar.barCodeType" value="sqlserver" id="codeType_sqlserver" >SQLSERVER</label>
                        <label><input type="radio" name="bar.barCodeType" value="mysql" id="codeType_mysql" >MYSQL</label>
                        <label><input type="radio" name="bar.barCodeType" value="pgsql" id="codeType_pgsql" >PGSQL</label>
                    	<textarea id="comm_sql" class="commql" name="bar.comm"  rows="6" style="margin-top:5px;height:200px;"></textarea>
						<textarea id="oracle_sql" class="oracle" name="bar.oracle" rows="6" style="display: none;margin-top:5px;height:200px;"></textarea>
						<textarea id="sqlserver_sql" class="sqlserver" name="bar.sqlserver" rows="6" style="display: none;margin-top:5px;height:200px;"></textarea>
						<textarea id="mysql_sql" class="mysql" name="bar.mysql" rows="6" style="display: none;margin-top:5px;height:200px;"></textarea>
						<textarea id="pg_sql" class="pgsql" name="bar.pgsql" rows="6" style="display: none;margin-top:5px;height:200px;"></textarea>
                    </td>
                </tr>
                <tr class="javaClass">
                    <td>JAVA类<span class="Eng">*</span></td>
                    <td colspan="4">
                    <input type="text" name="bar.javaClass" class="_VAL_NULL" id="barJavaClass">
                    <input type="hidden" name="bar.javaCodeType" id="barCodeType">
                    <input type="hidden"  id="barClsCode">
                     <input type="hidden" name="bar.javaClsCodeId" id="barClsCodeId">
                    </td>
                    <td>
						<a href="javascript:void(0);" id="barJavaClassText" onclick="showEditCode('bar');">
							<dict:lang value="新增" />
						</a>
                    </td>
                </tr>
               <tr class="jsonStr">
                    <td>JSON字符串<span class="Eng">*</span></td>
                    <td colspan="5">
                    <textarea name="bar.jsonSourceFun" class="_VAL_NULL" id="jsonSourceFun"></textarea></td>
                    <%--<input type='text' name="bar.JsonStr" >--%>
                </tr>
                
                	<tr >
						<td >
							<dict:lang value="字段显示别名" />
						</td>
						<td colspan="5">
							<input type="button" id="getFieldBtn" class="botton_img_search _get" value="<dict:lang value="获取字段" />"
							 title="<dict:lang value="只能获取当前类型数据库语句"/>"  />
							
							<table border="1" class="table_list"  style="margin-top:5px;margin-bottom:5px;margin-right:5px;">
								<thead>
									<tr >
										<th><dict:lang value="字段名" /></th>
										<th><dict:lang value="别名" /></th>
										<th><dict:lang value="柱体堆叠字段" /></th>
										<th><dict:lang value="柱体起始色" /></th>
										<th><dict:lang value="柱体结束色" /></th>
										<th><dict:lang value="柱体数据列" /></th>
										<!-- <th width="10%"><img id="addRowImg" src="${path}images/add.png" style="width:20px;height:20px;cursor:pointer;" title="<dict:lang value="添加行" />"/></th>-->
									</tr>
									
								</thead>
								<tbody id="colTitle">
								   
								</tbody>
							</table>
						</td>
					</tr>
					<%--<tr >
						<td >
							<dict:lang value="标记点数据" />
						</td>
						<td colspan="5">
							<table  border="1" class="table_list"  style="margin-top:5px;margin-bottom:5px;margin-right:5px;">
								<thead>
									<tr id="colTitle">
										<th width="40%"><dict:lang value="x轴坐标" /></th>
										<th width="40%"><dict:lang value="数值" /></th>
										<th width="20%"></th>
										<!-- <th width="10%"><img id="addRowImg" src="${path}images/add.png" style="width:20px;height:20px;cursor:pointer;" title="<dict:lang value="添加行" />"/></th>-->
									</tr>
								</thead>
								<tbody id="markPointDatas">
								<tr>
								    <td><input type="text"  name="bar.markPointDatas[0].xAxisValue" class="isNum" value=""></td>
  									<td><input type="text" name="bar.markPointDatas[0].yAxisValue" class="isNum" value=""></td>
  									<td style="text-align:center;"><input type="button" id="addMarkPointDatas" value="添加" /></td>
								</tr>
								</tbody>
							</table>
						</td>
					</tr>
				--%><tr>
                    <td>柱图X坐标标识</td>
                    <td colspan="5">
                     <select  name="bar.barXcoordinate"  class="isBlank" id = "barXcoordinate">
                     <option  value="">===请选择===</option>
                    </select><%--
                    <input type="text" name="bar.barXcoordinate" class="isBlank" style="width:200px;">
                    --%></td>
                </tr>
					
                <tr >
						<td >
							<dict:lang value="柱图X坐标字段" />
						</td>
						<td colspan="5">
							<table border="1" class="table_list"  style="margin-top:5px;margin-bottom:5px;margin-right:5px;">
								<thead>
									<tr >
										<th width="40%"><dict:lang value="刻度值(每个数据项之间用,分隔)" /></th>
										</tr>
								</thead>
								<tbody id="markPointDatas">
								<tr>
								    <td><input type="text"  name="bar.xDatas.xDataStr"  value=""></td>
  									<%--<td><input type="text" name="bar.xDatas.xInterval" class="isNum"  value=""></td>
								--%></tr>
								</tbody>
							</table>
						</td>
					</tr>
			      <tr>
                    <td>图形</td>
                    <td colspan="3" style="text-align:center;">刻度值(用,分隔)</td>
                    <td style="text-align:center;">最大值</td>
                    <td style="text-align:center;">最小值</td>
                    </tr>
                <tr>
                    <td>柱图Y坐标</td>
                    <td colspan="3"><input type="text"  name="bar.yDatas.yDatasStr" style="border: 0;width: 100%;box-sizing: border-box;"></td>
                    <td><input type="text" name="bar.yDatas.yMax" class="isNum" style="border: 0;width: 100%;box-sizing: border-box;"></td>
                    <td><input type="text" name="bar.yDatas.xMax" class="isNum" style="border: 0;width: 100%;box-sizing: border-box;"></td>
                   </tr> 
                   <tr>
                    <td></td>
                    <td colspan="2">    
                    </td>
                    <td colspan="2" style="text-align: center;"><a href='javascript:void(0);' id="addMarkLineDatas"> 添加辅助线</a></td>
                    <td style="text-align: center;"><a href='javascript:void(0);' id="delMarkLineDatas">删除辅助线</a></td>
                </tr>
                  <tr >
						<td >
							<dict:lang value="柱图X坐标字段" />
						</td>
						<td colspan="5">
							<table border="1" class="table_list"  style="margin-top:5px;margin-bottom:5px;margin-right:5px;">
								<thead>
									<tr>
										<th width="10%" style="text-align: center;"><input id="selectAll" type="checkbox"></th>
										<th width="30%"><dict:lang value="辅助线名称 " /></th>
										<th width="30%"><dict:lang value="辅助线值" /></th>
										<th width="30%"><dict:lang value="辅助线颜色" /></th>
									</tr>
								</thead>
								<tbody id="markLineDatasTbody"></tbody>
							</table>
				
                <tr id="isLineTr" >
                    <td>是否叠加折线图</td>
                    <td colspan="5"> 
                    	<select name="bar.isLine" style="width:100px" id="isLine">
                    	    <option value="2">否</option>
                            <option value="1">是</option>
                        </select>   
                    </td>
                </tr><%--
               柱状图+折线图
               --%>
             <tr class="lineSql line">
                    <td>SQL语句</td>
                    <td colspan="5" style="padding:5px;">数据库适配：
                        <label><input type="radio" name="bar.lineCodeType" value="commql" id="line_codeType_comm" checked="checked">通用语句</label>
                        <label><input type="radio" name="bar.lineCodeType" value="oracle" id="line_codeType_oracle" >ORACLE</label>
                        <label><input type="radio" name="bar.lineCodeType" value="sqlserver" id="line_codeType_sqlserver" >SQLSERVER</label>
                        <label><input type="radio" name="bar.lineCodeType" value="mysql" id="line_codeType_mysql" >MYSQL</label>
                        <label><input type="radio" name="bar.lineCodeType" value="pgsql" id="line_codeType_pgsql" >PGSQL</label>
                        <textarea id="line_comm_sql" class="linecommql" name="bar.lineComm" rows="6" style="margin-top:5px;height:200px;"></textarea>
						<textarea id="line_oracle_sql" class="lineoracle" name="bar.lineOracle" rows="6" style="display: none;margin-top:5px;height:200px;"></textarea>
						<textarea id="line_sqlserver_sql" class="linesqlserver" name="bar.lineSqlserver" rows="6" style="display: none;margin-top:5px;height:200px;"></textarea>
						<textarea id="line_mysql_sql" class="linemysql" name="bar.lineMysql" rows="6" style="display: none;margin-top:5px;height:200px;"></textarea>
						<textarea id="line_pg_sql" class="linepgsql" name="bar.linePgsql" rows="6" style="display: none;margin-top:5px;height:200px;"></textarea>
                    </td>
                </tr> 
               
                <tr class="lineJavaClass">
                    <td>JAVA类</td>
                    
                      <td colspan="4">
                    <input type="text" name="bar.lineJavaClass" id="lineJavaClass">
                    <input type="hidden" name="bar.lineJavaCodeType" id="lineCodeType">
                    <input type="hidden" name="bar.lineJavaClsCode" id="lineClsCode">
                     <input type="hidden" name="bar.lineJavaClsCodeId" id="lineClsCodeId">
                    </td>
                    <td>
							<a href="javascript:void(0);" id="lineJavaClassText" onclick="showEditCode('line');">
								<dict:lang value="新增" />
							</a>
                    </td>
                </tr>
               <tr class="lineJsonStr">
                    <td>JSON字符串</td>
                    <td>
                     <textarea name="bar.jsonLineSourceFun" id ="jsonLineSourceFun"></textarea>
                    </td>
                </tr>
                
                	<tr class="line">
						<td >
							<dict:lang value="字段显示别名" />
						</td>
						<td colspan="5">
							<input type="button" id="getLineFieldBtn" class="botton_img_search _get" value="<dict:lang value="获取字段" />"
							  title="<dict:lang value="只能获取当前类型数据库语句"/>"  />
							
							<table border="1" class="table_list"  style="margin-top:5px;margin-bottom:5px;margin-right:5px;">
								<thead>
									<tr >
										<th width="20%"><dict:lang value="字段名" /></th>
										<th width="20%"><dict:lang value="别名" /></th>
										<th width="20%"><dict:lang value="线体颜色" /></th>
										<th width="20%"><dict:lang value="线体宽度" /></th>
										<th width="20%"><dict:lang value="线体数据列" /></th>
										<!-- <th width="10%"><img id="addRowImg" src="${path}images/add.png" style="width:20px;height:20px;cursor:pointer;" title="<dict:lang value="添加行" />"/></th>-->
									</tr>
									
								</thead>
								<tbody  id="lineColTitle">
								   
								</tbody>
							</table>
						</td>
					</tr>
					
				 <tr  class="line">
				    <td>图形</td>
                    <td colspan="2">刻度值(用,分隔)</td>
                    <td>最大值</td>
                    <td>最小值</td>
                    <td>步长</td>
                </tr>
                <tr  class="line">
                    <td>线图Y坐标</td>
                    <td colspan="2"><input type="text" id="lineYdatasStr"  name="bar.lineYDatas.yDatasStr" style="border: 0;width: 100%;0box-sizing: border-box;"></td>
                    <td><input type="text" name="bar.lineYDatas.yMax" style="border: 0;width: 100%;0box-sizing: border-box;"></td>
                    <td><input type="text" name="bar.lineYDatas.yMin" style="border: 0;width: 100%;0box-sizing: border-box;"></td>
                    <td><input type="text" name="bar.lineYDatas.yInterval" style="border: 0;width: 100%;0box-sizing: border-box;"></td>
                </tr><%--
                
                <tr  class="line" >
				    <td>标题</td>
                    <td colspan="3">线体颜色</td>
                    <td colspan="2">线体宽度</td>
                </tr>
                 <tr  class="line">
                    <td>线图线体配置</td>
                    <td colspan="3"><input type="text" id="lineDatasColor" value="#000000" name="bar.lineDatas[0].color"></td>
                    <td colspan="2"><input type="text" name="bar.lineDatas[0].lineWidth"  style="border: 0;width: 100%;0box-sizing: border-box;"></td>
                </tr>
                --%></table>
        </div>
        <div  class="attribute dataSource">
            <h3>图标属性</h3>
             <div  id ="chartsAttr">
             <table id="listTable" width="100%" border="1" class="table_list" >
	    		<tr>
					<td width="30%">标题</td>
					<td><input type="text" name="chartsConfig.titleText" /></td>
				</tr>
				<tr>
					<td width="30%">标题字体</td>
					<td>
						<input type="radio" name="chartsConfig.titleTextFontFamily" checked value="sans-serif">sans-serif
						<input type="radio" name="chartsConfig.titleTextFontFamily" value="宋体">宋体
						<input type="radio" name="chartsConfig.titleTextFontFamily" value="黑体">黑体
					</td>
				</tr>
				<tr>
					<td width="30%">标题颜色</td>
					<td><input type="text" class="setColorSelect" name="chartsConfig.titleTextColor" value="#000000" /></td>
				</tr>
				<tr>
					<td width="30%">标题字号</td>
					<td><input type="text" name="chartsConfig.titleTextFontSize" class="isNum"  value="15" /></td>
				</tr>
				<tr>
					<td width="30%">标题文字样式</td>
					<td>
						<input type="radio" name="chartsConfig.titleTextFontWeight" checked value="normal">正常
						<input type="radio" name="chartsConfig.titleTextFontWeight" value="bold">粗体
					</td>
				</tr>
				<tr>
					<td width="30%">副标题</td>
					<td><input type="text"  name="chartsConfig.titleSubtext" /></td>
				</tr>
				<tr>
					<td width="30%">副标题字体</td>
					<td>
						<input type="radio" name="chartsConfig.titleSubtextFontFamily" checked value="sans-serif">sans-serif
						<input type="radio" name="chartsConfig.titleSubtextFontFamily" value="宋体">宋体
						<input type="radio" name="chartsConfig.titleSubtextFontFamily" value="黑体">黑体
					</td>
				</tr>
				<tr>
					<td width="30%">副标题颜色</td>
					<td><input type="text" class="setColorSelect" name="chartsConfig.titleSubtextColor" value="#cccccc" /></td>
				</tr>
				<tr>
					<td width="30%">副标题字号</td>
					<td><input type="text" name="chartsConfig.titleSubtextFontSize"  class="isNum"  value="12" /></td>
				</tr>
				<tr>
					<td width="30%">副标题文字样式</td>
					<td>
						<input type="radio" name="chartsConfig.titleSubtextFontWeight" checked value="normal">正常
						<input type="radio" name="chartsConfig.titleSubtextFontWeight" value="bold">粗体
					</td>
				</tr>
				<tr>
					<td width="30%">画布宽度(像素绝对值)</td>
					<td><input type="text" name="chartsConfig.canvasWidth"  class="isNum" value="600" /></td>
				</tr>
				<tr>
					<td width="30%">画布高度(像素绝对值)</td>
					<td><input type="text" name="chartsConfig.canvasHeight" class="isNum" value="600" /></td>
				</tr>
				<tr>
					<td width="30%">是否显示加载动画</td>
					<td>
						<input type="radio" name="chartsConfig.animation" checked value="1">显示
						<input type="radio" name="chartsConfig.animation" value="2">不显示
					</td>
				</tr>
				
				<tr>
					<td width="30%">是否显示图例</td>
					<td>
						<input type="radio" name="chartsConfig.isShowLegend" checked value="1">显示
						<input type="radio" name="chartsConfig.isShowLegend" value="2">不显示
					</td>
				</tr>	
					
				<tr>
					<td width="30%">点击事件</td>
					<td>
					<select name="chartsConfig.eventClick">
						<option value="false">不触发</option>
						<option value="true">触发</option>
					</select>
					</td>
				</tr>
				<tr>
					<td width="30%">背景图url</td>
					<td><input type="text" name="chartsConfig.backgroundUrl" /></td>
				</tr>
				<tr>
					<td width="30%">背景图透明度(100为完全不透明,0为完全透明)</td>
					<td><input type="text" name="chartsConfig.backgroundAlpha" class="isNum" value="100" /></td>
				</tr>
				<%-- *************************************************************************************************** --%>
				<%-- ************************************以上为公共属性配置********************************************** --%>
				<%-- *************************************************************************************************** --%>
				<tr>
					<td colspan="2" bgcolor="#eeeeee">&nbsp;</td>
				</tr>
				<tr>
					<td width="30%">数据轴</td>
					<td>
						<input type="radio" name="bar.xAxisValue" value="true">x轴
						<input type="radio" name="bar.xAxisValue" checked value="false">y轴(注意:只有数据轴为y轴时,才能出现柱图和折线图并存)		
					</td>
				</tr><%--
					<tr id="colTitle">
										<th width="40%"><dict:lang value="刻度值(每个数据项之间用,分隔)" /></th>
										<th width="40%"><dict:lang value="步长" /></th>
									</tr>
								</thead>
								<tbody id="markPointDatas">
								<tr>
								    <td><input type="text"  name="bar.xDatas.xDataStr"  value=""></td>
  									<td><input type="text" name="bar.xDatas.xInterval" class="isNum"  value=""></td>
								</tr>
				--%>
				
				<tr>
					<td width="30%">柱体宽度(设置百分数)</td>
					<td><input type="text" name="bar.barWidth" class="isPercent" value="30%" /></td>
				</tr>
				
				<tr id="yInterval">
					<td width="30%">y轴坐标步长</td>
					<td><input type="text" name="bar.yDatas.yInterval" class="isNum"  /></td>
				</tr>
				
				<tr id = "xInterval" style="display: none;">
					<td width="30%">x轴坐标步长</td>
					<td><input type="text" name="bar.xDatas.xInterval" class="isNum"  /></td>
				</tr>
				
				
				<tr>
					<td width="30%">x轴坐标刻度间隔</td>
					<td><input type="text" name="bar.xAxisInterval" class="isNum" value="0" /></td>
				</tr>
				<tr>
					<td width="30%">x轴坐标刻度文字角度(注意:只针对分类轴有效)</td>
					<td><input type="text" name="bar.xAxisRotate" class="isNum" value="0" /></td>
				</tr>
				<tr>
					<td width="30%">y轴坐标刻度间隔</td>
					<td><input type="text" name="bar.yAxisInterval" class="isNum" value="0"  /></td>
				</tr>
				<tr>
					<td width="30%">y轴坐标刻度文字角度(注意:只针对分类轴有效)</td>
					<td><input type="text" name="bar.yAxisRotate" class="isNum" value="0" /></td>
				</tr>
				<tr>
					<td width="30%">图例说明的排列方式</td>
					<td>
						<input type="radio" name="bar.legendOrient" checked value="vertical">竖向排列
						<input type="radio" name="bar.legendOrient" value="horizontal">横向排列						
					</td>
				</tr>
				<tr>
					<td width="30%">图例说明的最大文字长度</td>
					<td><input type="text" name="bar.legendLength" class="isNum"  /></td>
				</tr>
				<tr>
					<td width="30%">图例说明的水平位置</td>
					<td>
						<input type="radio" name="bar.legendX" checked value="left">居左
						<input type="radio" name="bar.legendX" value="center">居中			
						<input type="radio" name="bar.legendX" value="right">居右							
					</td>
				</tr>
				<tr>
					<td width="30%">图例说明的垂直位置</td>
					<td>
						<input type="radio" name="bar.legendY" checked value="top">顶部
						<input type="radio" name="bar.legendY" value="middle">居中			
						<input type="radio" name="bar.legendY" value="bottom">底部							
					</td>
				</tr>
				<tr>
					<td width="30%">鼠标指上时是否显示提示信息</td>
					<td>
						<input type="radio" name="bar.tooltipTrigger" checked value="axis">显示
						<input type="radio" name="bar.tooltipTrigger" value="none">不显示
					</td>
				</tr>
				<tr>
					<td width="30%">每个柱体是否显示数值</td>
					<td>
						<input type="radio" name="bar.seriesLabelShow" checked value="true">显示
						<input type="radio" name="bar.seriesLabelShow" value="false">不显示				
					</td>
				</tr>
				<tr>
					<td width="30%">柱体显示数值的位置</td>
					<td>
						<input type="radio" name="bar.seriesLabelPosition" checked value="outside">柱体外
						<input type="radio" name="bar.seriesLabelPosition" value="insideTop">柱体内顶部
						<input type="radio" name="bar.seriesLabelPosition" value="inside">柱体内居中
						<input type="radio" name="bar.seriesLabelPosition" value="insideBottom">柱体内底部
					</td>
				</tr>
				<tr>
					<td width="30%">每个柱体之间的间隔距离</td>
					<td><input type="text" name="bar.seriesBarGap" value="10" class="isNum" /></td>
				</tr>
				<tr>
					<td width="30%">每个分类之间的间隔距离</td>
					<td><input type="text" name="bar.seriesBarCategoryGap" value="10" class="isNum" /></td>
				</tr>
				<tr>
					<td width="30%">指示线样式</td>
					<td>
						<input type="radio" name="bar.tooltipAxisPointer" checked value="shadow">整体式
						<input type="radio" name="bar.tooltipAxisPointer" value="line">线式
					</td>
				</tr>
				<tr>
					<td width="30%">是否显示x轴分隔线</td>
					<td>
						<input type="radio" name="bar.xAxisSplitLine" value="false">否
						&nbsp;
						<input type="radio" name="bar.xAxisSplitLine" checked value="true">是
					</td>
				</tr>
				<tr>
					<td width="30%">x轴分隔线颜色</td>
					<td><input type="text" class="setColorSelect" name="bar.xAxisSplitLineColor"  value="" /></td>
				</tr>
				<tr>
					<td width="30%">是否显示y轴分隔线</td>
					<td>
						<input type="radio" name="bar.yAxisSplitLine" value="false">否
						&nbsp;
						<input type="radio" name="bar.yAxisSplitLine" checked value="true">是
					</td>
				</tr>
				<tr>
					<td width="30%">y轴分隔线颜色</td>
					<td><input type="text" name="bar.yAxisSplitLineColor" value="" /></td>
				</tr>
				<tr>
					<td width="30%">y轴显示文本后追加的文字</td>
					<td><input type="text" name="bar.yAxisAxisLabelFormatter" /></td>
				</tr> 
				<tr>
					<td width="30%">是否显示最小值标线</td>
					<td>
						<input type="radio" name="bar.markLineMin" checked value="0">否
						&nbsp;
						<input type="radio" name="bar.markLineMin" value="1">是
					</td>
				</tr>		
				<tr>
					<td width="30%">最小值标线颜色</td>
					<td><input type="text" class="setColorSelect" name="bar.markLineMinColor" /></td>
				</tr> 
				<tr>
					<td width="30%">是否显示最大值标线</td>
					<td>
						<input type="radio" name="bar.markLineMax"  checked value="0">否
						&nbsp;
						<input type="radio" name="bar.markLineMax" value="1">是
					</td>
				</tr>		
				<tr>
					<td width="30%">最大值标线颜色</td>
					<td><input type="text" class="setColorSelect" name="bar.markLineMaxColor" /></td>
				</tr> 
				<tr>
					<td width="30%">是否显示平均值标线</td>
					<td>
						<input type="radio" name="bar.markLineAverage" checked value="0">否
						&nbsp;
						<input type="radio" name="bar.markLineAverage" value="1">是
					</td>
				</tr>		
				<tr>
					<td width="30%">平均值标线颜色</td>
					<td><input type="text" class="setColorSelect" name="bar.markLineAverageColor" /></td>
				</tr> 
				<tr>
					<td width="30%">线条外观(如果存在折线)</td>
					<td>
						<input type="radio" name="bar.seriesSmooth" checked value="false">折线
						<input type="radio" name="bar.seriesSmooth" value="true">曲线				
					</td>
				</tr>
				<tr>
					<td width="30%">坐标系与画布顶部边距(可填百分比或绝对值)</td>
					<td><input type="text" name="bar.gridTop" class="isPercentOrNum"  value="20" /></td>
				</tr>
				<tr>
					<td width="30%">坐标系与画布底部边距(可填百分比或绝对值)</td>
					<td><input type="text" name="bar.gridBottom" class="isPercentOrNum"  value="20" /></td>
				</tr>
				<tr>
					<td width="30%">坐标系与画布左边距(可填百分比或绝对值)</td>
					<td><input type="text" name="bar.gridLeft" class="isPercentOrNum"  value="20" /></td>
				</tr>
				<tr>
					<td width="30%">坐标系与画布右边距(可填百分比或绝对值)</td>
					<td><input type="text" name="bar.gridRight" class="isPercentOrNum"  value="20" /></td>
				</tr>
				<tr>
					<td width="30%">是否显示数据位置标记条</td>
					<td>
						<input type="radio" name="bar.dataZoomShow" checked value="false">否
						&nbsp;
						<input type="radio" name="bar.dataZoomShow" value="true">是
					</td>
				</tr>
				<tr>
					<td width="30%">数据标记条默认数据起始位置</td>
					<td><input type="text" name="bar.dataZoomStart"  class="isNumOrNull" value="20" /></td>
				</tr>
				<tr>
					<td width="30%">数据标记条默认数据结束位置</td>
					<td><input type="text" name="bar.dataZoomEnd"  class="isNumOrNull" value="20" /></td>
				</tr>
				<tr>
					<td width="30%">数据标记条高度</td>
					<td><input type="text" name="bar.dataZoomHeight"  class="isNumOrNull" value="20" /></td>
				</tr>
				<tr>
					<td width="30%">数据标记条与画布底部边距(可填百分比或绝对值)</td>
					<td><input type="text" name="bar.dataZoomBottom" class="isPercentOrNum"  value="20" /></td>
				</tr>
				<tr>
					<td width="30%">图片导出的画布宽度(像素绝对值，不填写则与显示画布相同)</td>
					<td><input type="text" name="bar.canvasWidth2"  class="isNumOrNull"  value="600" /></td>
				</tr>
				<tr>
					<td width="30%">图片导出的画布高度(像素绝对值，不填写则与显示画布相同)</td>
					<td><input type="text" name="bar.canvasHeight2"  class="isNumOrNull" value="600" /></td>
				</tr>
			</table>
             <input type="hidden" name="chartsConfig.type" value="3"/>
             </div>
        </div>
    </div>
   
    </form>
</body>