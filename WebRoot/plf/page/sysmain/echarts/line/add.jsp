<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<head>
<title><dict:lang value="折线图新增配置" />
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
			$(".lineSql").show();
			$(".lineJavaClass,.lineJsonStr").hide();
		}else if(chartsDataSources=="2"){// java类
			$(".lineJavaClass").show();
			$(".lineSql,.lineJsonStr").hide();
		}else{//json串
			$(".lineJsonStr").show();
			$(".lineSql,.lineJavaClass").hide();
		}
	});	
	
  
var db_dialect="<s:property value="@com.more.fw.core.common.method.CommMethodMc@getCUR_DB_DIALECT()"/>";
function getFieldBySql(configTr,colTitle){
	var db_sql2 = document.getElementById("line_"+db_dialect+"_sql");
	var val2 = db_sql2.value;
	var db_sql3 = document.getElementById("line_comm_sql");
	var val3 = db_sql3.value;
	if(val.isBlank(val2)&&val.isBlank(val3)){
		var lineCodeType = $("input[name='line.lineCodeType']:checked").val();
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
	var url = "${path}charts/lineAction_getFields.ms";
	var sql = {};
	sql[db_dialect] = val.isBlank(val2)?val3.replace("?","%3F"):val2.replace("?","%3F");
	//sql[db_dialect] = val2.replace("?","%3F");
	util.showLoading("处理中...");
	
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
	var lineClsCodeId = $("#lineClsCodeId").val();
	if(lineClsCodeId ==""){
		_alertValMsg($("#lineJavaClass"),"<dict:lang value="JAVA类不能为空" />");
		return;
	}
	var url = "${path}charts/lineAction_getJavaDataFields.ms";
	util.showLoading("处理中...");
	$.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: "paraMap.lineClsCodeId="+lineClsCodeId,
		success: function(data){
				util.closeLoading();
				if(null == data){return ;}
				if(data){
					var aList =data;
					setFieldData(aList,configTr,colTitle);
				};
			},
		error: function(msg){
			    utilsFp.confirmIcon(1,"","","", "<dict:lang value='获取字段失败！' />","","255","155");
				util.closeLoading();
				//util.alert("error:"+msg.responseText);
		  }
		});
	return false;
	
}

function setFieldData(aList,configTr,colTitle){
	var arr = [];
	var lastTr = $("#"+colTitle);
	var arrColorCount = [];
	var lineXcoordinate = [];
	for(var i = 0;i < aList.length; i++){
		arr.push("<tr class="+configTr+">");
		arr.push("<td><input type='text' readonly='readonly' class='isBlank isName' name='line.lineDatas["+i+"].name' value="+aList[i].filedName+"></td>");
		arr.push("<td><input type='text' class='isBlank' name='line.lineDatas["+i+"].asName' value="+aList[i].filedName+"></td>");
		arr.push("<td><input type='text' class='setColorSelect' value='#000000' name='line.lineDatas["+i+"].color'></td>");
		arr.push("<td><input type='text' class='isNum' name='line.lineDatas["+i+"].lineWidth' ></td>");
		//arr.push("<td><select name='line.lineDatas["+i+"].pointDatas["+i+"].markPointImageShow' ><option value='2'>否</option><option value='1'>是</option></select></td>");
		//arr.push("<td><input type='text' name='line.lineDatas["+i+"].pointDatas["+i+"].isMarkPointImageShow' ></td>");
		//arr.push("<td><input type='text'  name='line.lineDatas["+i+"].pointDatas["+i+"].markPointImageUrl'/></td>");
		arr.push("<td><select class='isLineDataCol' name='line.lineDatas["+i+"].isLineDataCol' ><option value='2'>否</option><option value='1'>是</option></select></td>");
		arr.push("</tr>");
		lineXcoordinate.push("<option value="+aList[i].filedName+">"+aList[i].filedName+"</option>");
		arrColorCount[i] = i;
	}
	$("."+configTr).remove();
	lastTr.html(arr.join(""));
	setColor($(".setColorSelect"));
	if(lineXcoordinate.length>0){
		$("#lineXcoordinate").html(lineXcoordinate.join(""));
	};
}



var trMarkPointDatasCount = 1;
$("#addMarkPointDatas").click(function(){
	var trMarkPointDatas = "<tr>"
						 + "<td><input type=\"text\" class=\"xAxisValue\" class=\"isNum\" name=\"line.markPointDatas["+trMarkPointDatasCount+"].xAxisValue\" value=\"\"></td>"
						 + "<td><input type=\"text\" class=\"yAxisValue\" class=\"isNum\" name=\"line.markPointDatas["+trMarkPointDatasCount+"].yAxisValue\" value=\"\"></td>"
						 + "<td><input type=\"button\" class=\"delMarkPointDatas\" value=\"删除\" /></td>"
						 + "</tr>";
	$("#markPointDatas").append(trMarkPointDatas);
	trMarkPointDatasCount++;
});

$(".delMarkPointDatas").live("click",function(){
	$(this).parent().parent().remove();
	$("#markPointDatas tr").each(function(index,item){
		$(this).find(".xAxisValue").attr("name","line.markPointDatas["+index+"].yAxisValue");
		$(this).find(".yAxisValue").attr("name","line.markPointDatas["+index+"].yAxisValue");
	});
	trMarkPointDatasCount--;
});


function getJsonDataFields(data){
	if(data){
		var JsonData = data[0];
		var aList = [];
		for(var key in JsonData){
			var colObj = new Object();
			colObj["filedName"] = key;
			aList.push(colObj);
		};
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
		var jsonLineSourceFun = $("#jsonLineSourceFun").val();
		if(jsonLineSourceFun!=""){
			var url = "${path}charts/lineAction_getJsonData.ms";
			eval(jsonLineSourceFun);
		}else{
			_alertValMsg($("#jsonLineSourceFun"),"<dict:lang value="函数体不能为空" /> -- <dict:lang value="不能为空" />");
			return false;
		}
	}
});

$("input[name='line.lineCodeType']").change(function(){
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
	}
	else{
		$("#line_mysql_sql").show();
		$("#line_comm_sql,#line_oracle_sql,#line_sqlserver_sql,#line_pg_sql").hide();
	};
});


$("input[name='line.seriesAreaStyle']").change(function(){
	var seriesAreaStyle = $(this).val();
	if(seriesAreaStyle == "true"){
		var isFlag = false;
		var nameArr = [];
		$(".isLineDataCol").each(function(index,item){
			var isLineDataCol = $(this).val();
			if(isLineDataCol=="1"){
				isFlag = true;
				var name = $(this).parents(".lineDataConfigTr").find(".isName").val();
				var obj = new Object();
				obj["name"]= name;
				obj["index"]= index;
				nameArr.push(obj);
			};
		});
		if(isFlag){
			var html = "";
			$.each(nameArr,function(index,item){
				html += "<tr class='thisTrSeriesAreaStyleColor'>"
					  + "<td width='30%'>"+item["name"]+"叠加图颜色</td>"															 
					  + "<td><input type=\"text\" class=\"seriesAreaStyleColor\" id=\"seriesAreaStyleColor_"+item["index"]+"\" name=\"line.lineDatas["+item["index"]+"].seriesAreaStyleColor\" value=\"#000000\"></td>"
					  + "</tr>";
			});
			$("#isSeriesAreaStyleTr").after(html);
			setColor($(".seriesAreaStyleColor"));
		}else{
			alert("请先选择线体数据列");
			$(this).attr("checked",false).prev().attr("checked",true);
		}
	}else{
		$(".thisTrSeriesAreaStyleColor").remove();
	};
});

var markLineDatasCount = 0;
$("#addMarkLineDatas").click(function(){
	//<td><input type="text" name="line.markLineDatas[0].name" value=""></td>
	var markLineDatas = "<tr>"
					  + "<td style=\"text-align: center;\"><input type=\"checkbox\" name=\"markLineDatasCheckbox\" ></td>"
					  + "<td><input type=\"text\" class=\"markLineName\"  name=\"line.markLineDatas["+markLineDatasCount+"].name\" value=\"\"></td>"
					  + "<td><input type=\"text\" class=\"markLineyAxis\" class=\"isNum\" name=\"line.markLineDatas["+markLineDatasCount+"].yAxis\" value=\"\"></td>"
					  + "<td><input type=\"text\" class=\"markLineColor\" id=\"markLineColor_"+markLineDatasCount+"\" name=\"line.markLineDatas["+markLineDatasCount+"].color\" value=\"#000000\"></td>"
					  + "</tr>";
	$("#markLineDatasTbody").append(markLineDatas);
	
	markLineDatasCount++;
});
setColor($(".setColorSelect"));

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
		 utilsFp.confirmIcon(3,"","","", "请选择一条数据！","","260","145");
		 return;
	}
	if(markLineDatasCheckboxLength > 0){
		$("input[name='markLineDatasCheckbox']:checked").parent().parent().remove();
		$("#markLineDatasTbody tr").each(function(index,item){
			$(this).find(".markLineName").attr("name","line.markLineDatas["+index+"].name");
			$(this).find(".markLineyAxis").attr("name","line.markLineDatas["+index+"].yAxis");
			$(this).find(".markLineColor").attr("name","line.markLineDatas["+index+"].color");
			$(this).find(".markLineColor").attr("id","markLineColor_"+index);
		});
		markLineDatasCount = markLineDatasCheckboxLength-1;
	}else{
		markLineDatasCount = 0;
	};
});


setColor($("#lineDatasColor"));
});

function addLineAttr(thisObj){
	var chartsType = $("#CHARTS_TYPE").val();
	$("#chartsType").val(chartsType);
	var chartsDataSources = $("#CHARTS_DATA_SOURCES").val();
	$("#chartsDataSources").val(chartsDataSources);
	if(chartsDataSources == "1"){
		var lineCodeType = $("input[name='line.lineCodeType']:checked").val();
		var lineTxt = $(".line"+lineCodeType).val();
		if(lineTxt == ""){
			_alertValMsg($(".line"+lineCodeType),"<dict:lang value="数据源不能为空" />");
			return;
	   }
	}else if(chartsDataSources == "2"){
		var lineJavaClass = $("#lineJavaClass").val();
		if(lineJavaClass == ""){
			_alertValMsg($("#lineJavaClass"),"<dict:lang value="数据源不能为空" />");
			return;
		};
	}else{
		var lineJsonSourceFun = $("#lineJsonSourceFun").val();
		if(lineJsonSourceFun == ""){
			_alertValMsg($("#lineJsonSourceFun"),"<dict:lang value="数据源不能为空" />");
			return;
		};
	}
	if(!colDataIsNull("isLineDataCol")){
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

	if(!valIsPercentOrNum()){
		return ;
	}
	
	var isCache = $("#isCache").val();
	if(isCache == "1"){
		var chartsConfigCache =  msChartsData("addForm");
		var iframeId = $("#iframeId").val();
		var chartsCacheId = $("#chartsCacheId").val();
		var buttonId = $("#buttonId").val();
		var showTypeId = $("#showTypeId").val();
		var parentFrame = top.document.getElementById(iframeId);//获取到父iframe对象
		$.ajax({
            type: "POST",
            dataType: "json",
            url: "${path}charts/lineAction_cacheAdd.ms",
            data:chartsConfigCache,
            success: function(data){
             if(data.success){
            	 $("#"+buttonId,parentFrame.contentWindow.document).text("已配置");
            	 $("#"+showTypeId,parentFrame.contentWindow.document).val(chartsType);
            	 $("#"+chartsCacheId,parentFrame.contentWindow.document).val(data.info);
            	 parent.closePopWinFp('setKeyDataIframepop');
             }else{
            	 utilsFp.confirmIcon(3,"","","", "缓存失败！","","260","145");
             };
            },
            error: function(msg){
            	util.closeLoading();
            	utilsFp.confirmIcon(3,"","","", "缓存失败！","","260","145");
            }
        });
	}else{
		document.forms.addForm.submit();
	}
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

function showEditCode(){
	var lineJavaClass = $("#lineJavaClass").val();
	var lineJavaCodeType = $("#lineCodeType").val();
	var lineJavaClsCode = $("#lineClsCode").val();
	var lineJavaClsCodeId = $("#lineClsCodeId").val();
	var popWinframeId = window.frameElement.id+"PopWin";
    var url = "${path}charts/lineAction_cfgClsCode.ms?paraMap.CLASS_NAME="+lineJavaClass+"&paraMap.codeType="+lineJavaCodeType
			/* +"&paraMap.clsCode="+lineJavaClsCode */+"&paraMap.CODE_ID="+lineJavaClsCodeId+"&paraMap.piframeName="+window.frameElement.id
			+"&paraMap.piframeId="+window.frameElement.id+"&paraMap.popWinframeId="+popWinframeId;
	showPopWinFp(url, $(top.document).width()*0.90, $(top.document).height()*0.90,null,"<dict:lang value="修改类源码"/>",popWinframeId);
}
</script>
</head>
<body>
<button type="button" onclick="addLineAttr(this);" class="_save"><i class="ico"></i><dict:lang value="保存" /></button> 
<form id="addForm" name="addForm" action="${path}charts/lineAction_doAdd.ms" method="post" >
	<div class="all">
		  <input type="hidden" id ="chartsDataSources"  name="chartsConfig.chartsDataSources"  />
             <input type="hidden" id ="chartsType"  name="chartsConfig.chartsType"  />
           <div class="dataSource">
            <h3>数据源</h3>
            <table border='1' style="margin-bottom:5px;">
                <tr class="lineSql">
                    <td>SQL语句</td>
                    <td colspan="5" style="padding:5px;">数据库适配：
                        <label><input type="radio" name="line.lineCodeType" value="commql" id="line_codeType_comm" checked="checked">通用语句</label>
                        <label><input type="radio" name="line.lineCodeType" value="oracle" id="line_codeType_oracle" >ORACLE</label>
                        <label><input type="radio" name="line.lineCodeType" value="sqlserver" id="line_codeType_sqlserver" >SQLSERVER</label>
                        <label><input type="radio" name="line.lineCodeType" value="mysql" id="line_codeType_mysql" >MYSQL</label>
                         <label><input type="radio" name="line.lineCodeType" value="pgsql" id="line_codeType_pgsql" >PGSQL</label>
                        <textarea id="line_comm_sql" class="linecommql" name="line.lineComm" rows="6" style="margin-top:5px;height:200px;"></textarea>
						<textarea id="line_oracle_sql" class="lineoracle" name="line.lineOracle" rows="6" style="display: none;margin-top:5px;height:200px;"></textarea>
						<textarea id="line_sqlserver_sql" class="linesqlserver" name="line.lineSqlserver" rows="6" style="display: none;margin-top:5px;height:200px;"></textarea>
						<textarea id="line_mysql_sql" class="linemysql" name="line.lineMysql" rows="6" style="display: none;margin-top:5px;height:200px;"></textarea>
						<textarea id="line_pg_sql" class="linepgsql" name="line.linePgsql" rows="6" style="display: none;margin-top:5px;height:200px;"></textarea>
                    </td>
                </tr> 
               
                <tr class="lineJavaClass">
                    <td>JAVA类</td>
                    
                      <td colspan="4">
                    <input type="text" name="line.lineJavaClass" id="lineJavaClass">
                    <input type="hidden" name="line.lineJavaCodeType" id="lineCodeType">
                    <input type="hidden"  id="lineClsCode">
                     <input type="hidden" name="line.lineJavaClsCodeId" id="lineClsCodeId">
                    </td>
                    <td>
							<a href="javascript:void(0);" id="lineJavaClassText" onclick="showEditCode();">
								<dict:lang value="新增" />
							</a>
                    </td>
                </tr>
               <tr class="lineJsonStr">
                    <td>JSON字符串</td>
                    <td colspan="5">
                     <textarea name="line.jsonLineSourceFun" id ="jsonLineSourceFun"></textarea>
                    </td>
                </tr>
                
                	<tr >
						<td >
							<dict:lang value="字段显示别名" />
						</td>
						<td colspan="5">
							<input type="button" id="getLineFieldBtn" class="botton_img_search _get" value="<dict:lang value="获取字段" />"
							  title="<dict:lang value="只能获取当前类型数据库语句"/>"  />
							
							<table border="1" class="table_list" id="fieldAlias" style="margin-top:5px;margin-bottom:5px;margin-right:5px;">
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
								<tbody id="lineColTitle">
								   
								</tbody>
							</table>
						</td>
					</tr>
				
				  <tr>
						<td >
							<dict:lang value="折线图X坐标字段" />
						</td>
						<td colspan="5">
							<table border="1" class="table_list"  style="margin-top:5px;margin-bottom:5px;margin-right:5px;">
								<thead>
									<tr id="colTitle">
										<th width="40%"><dict:lang value="刻度值(每个数据项之间用,分隔)" /></th>
										<th width="40%"><dict:lang value="步长" /></th>
									</tr>
								</thead>
								<tbody id="markPointDatas">
								<tr>
								    <td><input type="text" class=""  name="line.xDatas.xDataStr" style="width:100%;box-sizing: border-box;border: 0;"  value=""></td>
  									<td><input type="text" name="line.xDatas.xInterval" class="isNum" style="width:100%;box-sizing: border-box;border: 0;"  value=""></td>
								</tr>
								</tbody>
							</table>
						</td>
					</tr>	
				<tr>
                    <td>线图X坐标标识</td>
                    <td colspan="5">
                     <select  name="line.lineXcoordinate" style="width:200px;" class="isBlank" id = "lineXcoordinate">
                     <option value="">===请选择===</option>
                    </select>
                    <%--<input type="text" name="line.lineXcoordinate" class="isBlank" style="width:200px;">
                    
                    --%></td>
                </tr>
				 <tr  >
				    <td>图形</td>
                    <td colspan="2" style="text-align:center;">刻度值(用,分隔)</td>
                    <td style="text-align:center;">最大值</td>
                    <td style="text-align:center;">最小值</td>
                    <td style="text-align:center;">步长</td>
                </tr>
                <tr  >
                    <td>线图Y坐标</td>

                    <td colspan="2"><input type="text"  id="lineYdatasStr" style="width: 100%;box-sizing: border-box;border: 0;" name="line.yDatas.yDatasStr"></td>
                    <td><input type="text" name="line.yDatas.yMax" style="width: 100%;box-sizing: border-box;border: 0;"></td>
                    <td><input type="text" name="line.yDatas.yMin" style="width: 100%;box-sizing: border-box;border: 0;"></td>
                    <td><input type="text" name="line.yDatas.yInterval" style="width: 100%;box-sizing: border-box;border: 0;"></td>

                </tr><%--
                
                <tr>
				    <td>标题</td>
                    <td colspan="3" style="text-align:center;">线体颜色</td>
                    <td colspan="2" style="text-align:center;">线体宽度</td>
                </tr>
                <tr>
                    <td>线图线体配置</td>
                    <td colspan="3"><input type="text" id="lineDatasColor" value="#000000" name="line.lineDatas[0].color"></td>
                    <td colspan="2"><input type="text" class="isNum" name="line.lineDatas[0].lineWidth" style="width: 100%;box-sizing: border-box;border: 0;"></td>
                </tr>
                
                  --%><tr>
                  <td></td>
                    <td colspan="3" style="text-align: center;"><a href='javascript:void(0);' id="addMarkLineDatas"> 添加辅助线</a></td>
                    <td colspan="2" style="text-align: center;"><a href='javascript:void(0);' id="delMarkLineDatas">删除辅助线</a></td>
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
						</td>
					</tr>
             </table>
               </div>
             <div  class="attribute dataSource">
            <h3>图标属性</h3>
             <div  id ="chartsAttr">
	    	<table id="listTable" width="100%" border="1" class="table_list" >
				<tr>
					<td width="30%">标题</td>
					<td><input type="text" name="chartsConfig.titleText"  /></td>
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
					<td><input type="text" name="chartsConfig.titleSubtext" /></td>
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
					<td><input type="text" name="chartsConfig.titleSubtextColor" class="setColorSelect" value="#000000" /></td>
				</tr>
				<tr>
					<td width="30%">副标题字号</td>
					<td><input type="text" name="chartsConfig.titleSubtextFontSize" class="isNum"   value="12" /></td>
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
					<td><input type="text" name="chartsConfig.canvasWidth" class="isNum"  value="600" /></td>
				</tr>
				<tr>
					<td width="30%">画布高度(像素绝对值)</td>
					<td><input type="text" name="chartsConfig.canvasHeight" class="isNum"  value="600" /></td>
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
					<%--<input type="text" name="chartsConfig.eventClick" />
					--%></td>
				</tr>
				<tr>
					<td width="30%">背景图url</td>
					<td><input type="text" name="chartsConfig.backgroundUrl"  /></td>
				</tr>
				<tr>
					<td width="30%">背景图透明度(100为完全不透明,0为完全透明)</td>
					<td><input type="text" name="chartsConfig.backgroundAlpha" class="isNum"   value="100" /></td>
				</tr>
				<%-- *************************************************************************************************** --%>
				<%-- ************************************以上为公共属性配置********************************************** --%>
				<%-- *************************************************************************************************** --%>
				<tr>
					<td colspan="2" bgcolor="#eeeeee">&nbsp;</td>
				</tr>
				<tr>
					<td width="30%">线条外观</td>
					<td>
						<input type="radio" name="line.seriesSmooth" checked value="false">折线
						<input type="radio" name="line.seriesSmooth" value="true">曲线				
					</td>
				</tr>
				<tr>
					<td width="30%">坐标系内部是否有边界</td>
					<td>
						<input type="radio" name="line.xAxisBoundaryGap" checked value="false">无边界
						<input type="radio" name="line.xAxisBoundaryGap" value="true">有边界					
					</td>
				</tr>
				<tr>
					<td width="30%">图例说明的排列方式</td>
					<td>
						<input type="radio" name="line.legendOrient" checked value="vertical">竖向排列
						<input type="radio" name="line.legendOrient" value="horizontal">横向排列						
					</td>
				</tr>
				<tr>
					<td width="30%">图例说明的最大文字长度</td>
					<td><input type="text" name="line.legendLength" /></td>
				</tr>
				<tr>
					<td width="30%">图例说明的水平位置</td>
					<td>
						<input type="radio" name="line.legendX" checked value="left">居左
						<input type="radio" name="line.legendX" value="center">居中			
						<input type="radio" name="line.legendX" value="right">居右							
					</td>
				</tr>
				<tr>
					<td width="30%">图例说明的垂直位置</td>
					<td>
						<input type="radio" name="line.legendY" checked value="top">顶部
						<input type="radio" name="line.legendY" value="middle">居中			
						<input type="radio" name="line.legendY" value="bottom">底部							
					</td>
				</tr>
				<tr>
					<td width="30%">鼠标指上时是否显示提示信息</td>
					<td>
						<input type="radio" name="line.tooltipTrigger" checked value="axis">显示
						<input type="radio" name="line.tooltipTrigger" value="none">不显示
					</td>
				</tr>
				<tr>
					<td width="30%">线上每个点是否显示数值</td>
					<td>
						<input type="radio" name="line.seriesLabelShow" checked value="true">显示
						<input type="radio" name="line.seriesLabelShow" value="false">不显示				
					</td>
				</tr>
				<tr>
					<td width="30%">线上每个点显示数值的位置</td>
					<td>
						<input type="radio" name="line.seriesLabelPosition" checked value="top">上
						<input type="radio" name="line.seriesLabelPosition" value="bottom">下
						<input type="radio" name="line.seriesLabelPosition" value="left">左
						<input type="radio" name="line.seriesLabelPosition" value="right">右
					</td>
				</tr>
				<tr id="isSeriesAreaStyleTr">
					<td width="30%">是否叠加图</td>
					<td id="isSeriesAreaStyle">
						<input type="radio" name="line.seriesAreaStyle" checked value="false">否
						&nbsp;
						<input type="radio" name="line.seriesAreaStyle" value="true">是
					</td>
					
				</tr>
				
				
				
				<tr>
					<td width="30%">指示线样式</td>
					<td>
						<input type="radio" name="line.tooltipAxisPointer" checked value="line">线式
						<input type="radio" name="line.tooltipAxisPointer" value="cross">交叉式
					</td>
				</tr>
				<tr>
					<td width="30%">是否显示x轴分隔线</td>
					<td>
						<input type="radio" name="line.xAxisSplitLine" value="false">否
						&nbsp;
						<input type="radio" name="line.xAxisSplitLine" checked value="true">是
					</td>
				</tr>
				<tr>
					<td width="30%">x轴分隔线颜色</td>
					<td><input type="text" name="line.xAxisSplitLineColor" class="setColorSelect" value="#000000" /></td>
				</tr>
				<tr>
					<td width="30%">是否显示y轴分隔线</td>
					<td>
						<input type="radio" name="line.yAxisSplitLine" value="false">否
						&nbsp;
						<input type="radio" name="line.yAxisSplitLine" checked value="true">是
					</td>
				</tr>
				<tr>
					<td width="30%">y轴分隔线颜色</td>
					<td><input type="text" name="line.yAxisSplitLineColor" class="setColorSelect" value="" /></td>
				</tr>
				<tr>
					<td width="30%">y轴显示文本后追加的文字</td>
					<td><input type="text" name="line.yAxisAxisLabelFormatter"  /></td>
				</tr> 
				<tr>
					<td width="30%">是否显示最小值标线</td>
					<td>
						<input type="radio" name="line.markLineMin" checked value="0">否
						&nbsp;
						<input type="radio" name="line.markLineMin" value="1">是
					</td>
				</tr>		
				<tr>
					<td width="30%">最小值标线颜色</td>
					<td><input type="text" name="line.markLineMinColor" class="setColorSelect" /></td>
				</tr> 
				<tr>
					<td width="30%">是否显示最大值标线</td>
					<td>
						<input type="radio" name="line.markLineMax" checked value="0">否
						&nbsp;
						<input type="radio" name="line.markLineMax" value="1">是
					</td>
				</tr>		
				<tr>
					<td width="30%">最大值标线颜色</td>
					<td><input type="text" name="line.markLineMaxColor" class="setColorSelect" /></td>
				</tr> 
				<tr>
					<td width="30%">是否显示平均值标线</td>
					<td>
						<input type="radio" name="line.markLineAverage" checked value="0">否
						&nbsp;
						<input type="radio" name="line.markLineAverage" value="1">是
					</td>
				</tr>		
				<tr>
					<td width="30%">平均值标线颜色</td>
					<td><input type="text" name="line.markLineAverageColor" class="setColorSelect"  /></td>
				</tr> 
				<tr>
					<td width="30%">坐标系与画布顶部边距(可填百分比或绝对值)</td>
					<td><input type="text" name="line.gridTop" class="isPercentOrNum" value="20" /></td>
				</tr>
				<tr>
					<td width="30%">坐标系与画布底部边距(可填百分比或绝对值)</td>
					<td><input type="text" name="line.gridBottom" class="isPercentOrNum"  value="20" /></td>
				</tr>
				<tr>
					<td width="30%">坐标系与画布左边距(可填百分比或绝对值)</td>
					<td><input type="text" name="line.gridLeft" class="isPercentOrNum" value="20" /></td>
				</tr>
				<tr>
					<td width="30%">坐标系与画布右边距(可填百分比或绝对值)</td>
					<td><input type="text" name="line.gridRight" class="isPercentOrNum" value="20" /></td>
				</tr>
			</table>
		</div>
			</div>	</div>
			
</form>
</body>