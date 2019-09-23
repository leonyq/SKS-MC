<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>

<head>
<title><dict:lang value="柱图修改配置" />
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
<style>
		body{
	   	 	font-size:12px;
		}
		
		.head{
			background-color: #f6f5f7;
    		padding-top: 5px;
    		padding-bottom: 10px;
    		margin-bottom: 10px;
    		height:30px;
		}
		
		.all{
			padding:0 10px;
			box-sizing:border-box;
		}
		
		.dataSource{
    		overflow-y: auto;
		}
        .dataSource,.attribute{
            /* 左右两块宽度，中间间隔10px */
            width: calc((100% - 10px)/2);
            float: left;
        }
        .attribute{
            margin-left: 10px; 
        } 

        /* 图表属性滚动区域 */
        .attribute .contents{
            overflow: auto;
            height: 408px;
        }

        .dataSource table{
            border-collapse: collapse;
	    border: 1px solid #a8c7ce;		
            width: 100%;
        }
        .attribute table{
            width: 100%;
        }
			.attribute table td{
            border: 1px solid #a8c7ce;	
        }
        textarea{
            width: 100%;
            height: 80px;
            box-sizing: border-box;
        }
        
        td input[type='text']{
            width: 100%;
            height:100%;
            box-sizing: border-box;
        }
		
		input[type='radio']{
			vertical-align: middle;
		}
		
        /* 数据源第一列样式 */
        .dataSource table tr td:nth-of-type(1){
            width: 110px;
            background-color: #f5f7f9;
    	    text-align: right;  
        }


        /* 标题样式 */
        .main h3{
	    	margin:0;
	    	padding:0;
            font-size: 14px;
            font-weight: normal;
        }
        .javaClass,.jsonStr,.line,.lineJavaClass,.lineJsonStr{
        	display: none;
        }
        
        ._save{
        	    border: 1px solid #aace36;
			    border-radius: 2px;
			    background-color: #fff;
			    color: #666;
			    height: 28px;
			    line-height: 26px;
			    padding: 0 10px;
			    margin-right: 10px;
			    cursor: pointer;
			    float:right;
        }
        
        ._save:hover{
        	background-color: #aace36;
    		color: #fff;
        }
        
        ._save .ico{
        	width: 15px;
    		height: 15px;
    		margin-right: 5px;
    		margin-bottom: 3px;
    		background: url(${path}plf/page/fp/img/ico-save.png?_mc_res_version=<%=PlfStaticRes.ICO_SAVE_PNG%>) no-repeat;
        }
        
        ._save:hover .ico{
    		background: url(${path}plf/page/fp/img/ico-save-h.png?_mc_res_version=<%=PlfStaticRes.ICO_SAVE_H_PNG%>) no-repeat;
        }
        
        ._get{
        	width:70px;
        	height:20px;
        	background-color:#6EABEE;
        	border:0;
        	outline:none;
        	color:#fff;
        	margin-left:5px;
        	margin-top:5px;
        	cursor: pointer;
        }
        
        ._get:focus{
        	background-color:#6EABEE;
        	border:0;
        	color:#fff;
        }
        
       
		.sp-replacer{
        	margin-top:0;
        }
        
        .table_list td input[type='text'] {
    		height:100%;
    		width:100%;
    		border:none;
    		box-sizing:border-box;
		}
        
        .attribute td input[type='text']{
            box-sizing: content-box;
            height:100%;
            width:calc(100% - 5px);	
            padding-left:5px;
        }
        
        .attribute td input[type='text']:focus{
        	border:1px solid #6Eabee;
        	width:calc(100% - 7px);	
        }
        
        .dataSource table tr,.dataSource table th{
        	height:30px;
        }
        
        .attribute table tr td:nth-of-type(1){
            width: 166px;  
            padding-right:5px;
        }
        
        .dataSource>table>tbody>tr>td:nth-of-type(1){
        	padding-right:5px;
        }
        
        .mCSB_outside + .mCS-minimal-dark.mCSB_scrollTools_vertical {
		    right: 2px;
		}
    </style>
<style type="text/css">
table td{
	word-break:break-all;
} 

.all{
	overflow-y:auto;
}

.content{
  height: 565px;
  overflow-y:auto;
}

a{
 color: blue;
}
</style>
 <jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
</jsp:include>
<script type="text/javascript" src="${path}/plf/page/sysmain/echarts/js/cache.js?_mc_res_version=<%=PlfStaticRes.CACHE_JS %>"></script>
<script type="text/javascript" src="${path}/plf/page/sysmain/echarts/js/chartsComm.js?_mc_res_version=<%=PlfStaticRes.CHARTSCOMM_JS %>"></script>
<script type="text/javascript">

$(function(){
	$('.all').height($(window).height() - 60);
	// 数据源切换
	$('.all').mCustomScrollbar({
	    axis:"yx",
		snapAmount:40,
		theme:"minimal-dark",
		keyboard:{scrollAmount:40},
		mouseWheel:{deltaFactor:40,preventDefault:true},
		scrollInertia:80,
		autoHideScrollbar:true,
	});
	
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
	var sql = {};
	var status = configTr=="dataConfigTr"?getBarSql(sql):getLineSql(sql);
	if(!status){
		util.closeLoading();
		return;
	}
	util.showLoading("处理中...");
	$.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: sql,
		success: function(data){
				//alert(JSON.stringify(data));
				//util.alert(data.ajaxMap.nextselectId);
				util.closeLoading();
				if(null == data){return ;}
				//if(null == data.ajaxMap){return ;}
				if(null != data.ajaxList){
					var aList = eval(data.ajaxList);
					setFieldData(aList,configTr,colTitle);
				};
			},
		error: function(msg){
				util.closeLoading();
				//utilsFp.confirmIcon(1,"","","", "<dict:lang value='获取字段失败！' />","","255","155");
				utilsFp.confirmIcon(1,"","","", msg.responseText,"","255","155");//封装提供一个公用SQL解析方法  by liuth
				//util.alert("error:"+msg);
		  }
		});
	return false;
}

var trMarkPointDatasCount = 1;
$("#addMarkPointDatas").click(function(){
	var trMarkPointDatas = "<tr>"
						 + "<td><input type=\"text\" class=\"xAxisValue\" name=\"bar.markPointDatas["+trMarkPointDatasCount+"].xAxisValue\" value=\"\"></td>"
						 + "<td><input type=\"text\" class=\"yAxisValue\" name=\"bar.markPointDatas["+trMarkPointDatasCount+"].yAxisValue\" value=\"\"></td>"
						 + "<td><input type=\"button\" class=\"delMarkPointDatas\" value=\"删除\" /></td>"
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
		getFieldByJson("dataConfigTr","colTitle");
	}
});
//getLineFieldBtn
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
			arr.push("<td><input type='text' class='setColorSelect' value='#000000' name='line.lineDatas["+i+"].color'></td>");
			arr.push("<td><input type='text' class='isNum' name='line.lineDatas["+i+"].lineWidth' ></td>");
			
			//arr.push("<td><select name='bar.lineDatas["+i+"].pointDatas["+i+"].isMarkPointImageShow' ><option value='2'>否</option><option value='1'>是</option></select></td>");
			//arr.push("<td><input type='text' name='bar.lineDatas["+i+"].pointDatas["+i+"].isMarkPointImageShow' ></td>");
			//arr.push("<td><input type='text'  name='bar.lineDatas["+i+"].pointDatas["+i+"].markPointImageUrl'/></td>");
			//arr.push("<td><input type='text'  name='bar.lineDatas["+i+"].pointDatas["+i+"].markPointSize'/></td>");
			arr.push("<td><select class='isLineDataCol' name='bar.lineDatas["+i+"].isLineDataCol' ><option value='2'>否</option><option value='1'>是</option></select></td>");
		}
		arr.push("</tr>");
		arrColorCount[i] = i;
	}
	$("."+configTr).remove();
	lastTr.after(arr.join(""));
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
$("#getLineFieldBtn").click(function(){
	var chartsDataSources = $("#CHARTS_DATA_SOURCES").val();
	if(chartsDataSources == "1"){
		getFieldBySql("lineDataConfigTr","lineColTitle");
	}else if(chartsDataSources == "2"){
		getFieldByJava("lineDataConfigTr","lineColTitle");
	}else{
		getFieldByJson("lineDataConfigTr","lineColTitle");
	}
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

$("input[name='bar.lineCodeType']:checked").trigger("change");
$("input[name='bar.barCodeType']:checked").trigger("change");
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
setBarDatasColor(".setColorSelect");
var markLineDatasCount =  $("#markLineDatasTbody").children("tr").length;
$("#addMarkLineDatas").click(function(){
	//<td><input type="text" name="bar.markLineDatas[0].name" value=""></td>
	markLineDatasCount = $("#markLineDatasTbody tr").length;
	var markLineDatas = "<tr>"
					  + "<td style=\"text-align: center;\"><input type=\"checkbox\" name=\"markLineDatasCheckbox\" ></td>"
					  + "<td><input type=\"text\" class=\"markLineName\"  name=\"bar.markLineDatas["+markLineDatasCount+"].name\" value=\"\"></td>"
					  + "<td><input type=\"text\" class=\"markLineyAxis\" name=\"bar.markLineDatas["+markLineDatasCount+"].yAxis\" value=\"\"></td>"
					  + "<td><input type=\"text\" class=\"markLineColor\" id=\"markLineColor_"+markLineDatasCount+"\" name=\"bar.markLineDatas["+markLineDatasCount+"].color\" value=\"\"></td>"
					  + "</tr>";
	$("#markLineDatasTbody").append(markLineDatas);
	//markLineColor_1
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
		markLineDatasCount = $("#markLineDatasTbody").children("tr").length;
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
	if(isLine == "1"){
		$(".line").show();
	}else{
		$(".line").hide();
	};
});

if("<c:out value='${bar.isLine}' />"=="1"){
	$(".line").show();
	//$("#lineYdatasStr").addClass("isNumComma");
}

setBarDatasColor("#lineDatasColor");
setBarDatasColor(".markLineColor");
setBarDatasColor(".barDatasColor");
});

function updateBarAttr(thisObj){
	var isLine = $("#isLine").val();
	var chartsDataSources = $("#CHARTS_DATA_SOURCES").val();
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
	 
	if(isLine =="1" && !colDataIsNull("isLineDataCol")){
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
	
	var isCache = "<c:out value='${paraMap.isCache}' />";
	if(isCache == "1"){
		var chartsConfigCache =  msChartsData("addBarCharts");
		chartsConfigCache["chartsConfigCache.id"] = "<c:out value='${paraMap.cacheId}' />";
		var iframeId = $("#iframeId").val();
		var parentFrame = top.document.getElementById(iframeId);//获取到父iframe对象
		$.ajax({
            type: "POST",
            dataType: "json",
            url: "${path}charts/barAction_cacheUpdate.ms",
            data:chartsConfigCache,
            success: function(data){
             if(data.success){
            	 parent.closePopWinFp('setKeyDataIframepop');
             }else{
            	 utilsFp.confirmIcon(3,"","","", "更新缓存失败","","260","145");
             };
            },
            error: function(msg){
            	util.closeLoading();
            	 utilsFp.confirmIcon(3,"","","", "更新缓存失败","","260","145");
            }
        });
	}else{
		document.forms.addBarCharts.submit();
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

function showEditCode(source){
	var url;
	if(source=='bar'){
		var barJavaClass = $("#barJavaClass").val();
		var barCodeType = $("#barCodeType").val();
		var barClsCode = $("#barClsCode").val();
		var barClsCodeId = $("#barClsCodeId").val();
		var chartsConfig_id = $("#chartsConfig_id").val();
		var popWinframeId = window.frameElement.id+"PopWin";
	    url = "${path}charts/barAction_cfgClsCode.ms?paraMap.CLASS_NAME="+barJavaClass+"&paraMap.codeType="+barCodeType
				/* +"&paraMap.clsCode="+barClsCode */+"&paraMap.CODE_ID="+barClsCodeId+"&paraMap.source="+source+"&paraMap.piframeName="+window.frameElement.id
				+"&paraMap.piframeId="+window.frameElement.id+"&paraMap.toFlag=classManage"+"&paraMap.popWinframeId="+popWinframeId+"&paraMap.OWNER_ID="+chartsConfig_id;
	}else{
		var lineJavaClass = $("#lineJavaClass").val();
		var lineJavaCodeType = $("#lineCodeType").val();
		var lineJavaClsCode = $("#lineClsCode").val();
		var lineJavaClsCodeId = $("#lineClsCodeId").val();
		var chartsConfig_id = $("#chartsConfig_id").val();
		var popWinframeId = window.frameElement.id+"PopWin";
	    url = "${path}charts/barAction_cfgClsCode.ms?paraMap.CLASS_NAME="+lineJavaClass+"&paraMap.codeType="+lineJavaCodeType
				/* +"&paraMap.clsCode="+lineJavaClsCode */+"&paraMap.CODE_ID="+lineJavaClsCodeId+"&paraMap.source="+source+"&paraMap.piframeName="+window.frameElement.id
				+"&paraMap.piframeId="+window.frameElement.id+"&paraMap.toFlag=classManage"+"&paraMap.popWinframeId="+popWinframeId+"&paraMap.OWNER_ID="+chartsConfig_id;
	}
	showPopWinFp(url, $(top.document).width()*0.90, $(top.document).height()*0.90,null,"<dict:lang value="修改类源码"/>", popWinframeId);
}

function updateCLASS_NAME_TEXT(classNameTextId,className,flag){
	$("#barJavaClass").val('');
	$("#barCodeType").val('');
	$("#barClsCode").val('');
	$("#barClsCodeId").val('');

	$("#lineJavaClass").val('');
	$("#lineCodeType").val('');
	$("#lineClsCode").val('');
	$("#lineClsCodeId").val('');
}

function setBarDatasColor(selector){
	$(selector).each(function(index,item){
		var color = $(this).val();
		setColor($(this),color);
	});	
}


</script>
</head>
<body style="width:100%;min-width:1000px;background-color:#fff;">
  <form id="addBarCharts" name="addBarCharts" action="${path}charts/barAction_doUpdate.ms" method="post" >
     <input type="hidden" id="chartsConfig_id" name="chartsConfig.id" value="<c:out value='${chartsConfig.id}' />" />
      <div class="head">
      	<span style="display: inline-block;height: 20px;margin-top: 5px;margin-left: 5px;">
        	<span>图表类型</span>
        	<dict:selectDict dictCode="CHARTS_TYPE" disabled="true" id="CHARTS_TYPE" dictValue="${fn:escapeXml(chartsConfig.chartsType)}" name="chartsConfig.chartsType"  />
        	<span>数据源</span>  
        	<dict:selectDict dictCode="CHARTS_DATA_SOURCES" disabled="true" id="CHARTS_DATA_SOURCES" dictValue="${fn:escapeXml(chartsConfig.chartsDataSources)}" name="chartsConfig.chartsDataSources"  />
        </span>
        <button type="button" onclick="updateBarAttr(this);" class="_save"><i class="ico ico-save"></i><dict:lang value="修改" /></button>
    </div>
      <div class="all">
        <div class="dataSource">
            <h3>数据源</h3>
            <table border='1'>
            <c:if test="${chartsConfig.chartsDataSources eq '1'}">
                <tr class="sql">
                    <td>SQL语句</td>
                    <td colspan="5" style="padding:5px;">数据库适配：
                        <label><input type="radio" name="bar.barCodeType" value="commql"  id="codeType_comm" <c:if test="${bar.barCodeType eq 'commql'}">checked="checked"</c:if> >通用语句</label>
                        <label><input type="radio" name="bar.barCodeType" value="oracle" id="codeType_oracle" <c:if test="${bar.barCodeType eq 'oracle'}">checked="checked"</c:if> >ORACLE</label>
                        <label><input type="radio" name="bar.barCodeType" value="sqlserver" id="codeType_sqlserver" <c:if test="${bar.barCodeType eq 'sqlserver'}">checked="checked"</c:if> >SQLSERVER</label>
                        <label><input type="radio" name="bar.barCodeType" value="mysql" id="codeType_mysql" <c:if test="${bar.barCodeType eq 'mysql'}">checked="checked"</c:if> >MYSQL</label>
                    	<label><input type="radio" name="bar.barCodeType" value="pgsql" id="codeType_pgsql" <c:if test="${bar.barCodeType eq 'pgsql'}">checked="checked"</c:if>>PGSQL</label>
                    	<textarea id="comm_sql" name="bar.comm" rows="6" style="margin-top:5px;height:200px;"><c:out value='${bar.comm}' /></textarea>
						<textarea id="oracle_sql" name="bar.oracle" rows="6" style="display: none;margin-top:5px;height:200px;"><c:out value='${bar.oracle}' /></textarea>
						<textarea id="sqlserver_sql" name="bar.sqlserver" rows="6" style="display: none;margin-top:5px;height:200px;"><c:out value='${bar.sqlserver}' /></textarea>
						<textarea id="mysql_sql" name="bar.mysql" rows="6" style="display: none;margin-top:5px;height:200px;"><c:out value='${bar.mysql}' /></textarea>
						<textarea id="pg_sql" name="bar.pgsql" rows="6" style="display: none;margin-top:5px;height:200px;"><c:out value='${bar.pgsql}' /></textarea>               
                    </td>
                </tr> 
                
                </c:if>
                 <c:if test="${chartsConfig.chartsDataSources eq '2'}">
                <tr >
                    <td>JAVA类</td>
                    <td colspan="4"><input type="text" name="bar.javaClass" value="<c:out value='${bar.javaClass}' />" id="barJavaClass">
                      <input type="hidden" name="bar.javaCodeType" value="<c:out value='${bar.javaCodeType}' />" id="barCodeType">
                    <input type="hidden"  value="<c:out value='${bar.javaClsCode}' />" id="barClsCode">
                     <input type="hidden" name="bar.javaClsCodeId" value="<c:out value='${bar.javaClsCodeId}' />" id="barClsCodeId">
                      <td>
							<a href="javascript:void(0);" id="barJavaClassText" onclick="showEditCode('bar');">
								<dict:lang value="编辑" />
							</a>
                    </td>
                    </td>
                </tr>
                </c:if>
                 <c:if test="${chartsConfig.chartsDataSources eq '3'}">
               <tr >
                    <td>JSON字符串</td>
                    <td>
                     <textarea name="bar.jsonSourceFun"  ><c:out value='${bar.jsonSourceFun}' /></textarea>
                    <%--<input type='text' name="bar.jsonStr" value="${bar.jsonStr}" >
                    --%></td>
                </tr>
                 </c:if>
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
									</tr>
								</thead>
								<tbody id="colTitle">
								   	<c:forEach items="${bar.barDatas}" var="barDatas" varStatus="status">
								   	 <tr class="dataConfigTr">
								   	    <td><input type='text' readonly='readonly' name='bar.barDatas[${status.index}].name' value="<c:out value='${barDatas.name}' />"></td>
								      	<td><input type='text' name='bar.barDatas[${status.index}].asName' value="<c:out value='${barDatas.asName}' />"></td>
								      	<td><input type='text' name='bar.barDatas[${status.index}].stackCategory' value="<c:out value='${barDatas.stackCategory}' />"></td>
								      	<input type='hidden'  value="${status.index+1}" name='bar.barDatas[${status.index}].id' />
								      	<input type='hidden'  value="${status.index+1}" name='bar.barPointDatas[${status.index}].id'/>
								      	<td><input type='text' class="barDatasColor" id='color1_${status.index}'  value="${bar.barPointDatas[status.index].color1}"  name='bar.barPointDatas[${status.index}].color1'/></td>
								      	<td><input type='text' class="barDatasColor" id='color2_${status.index}'  value="${bar.barPointDatas[status.index].color2}"  name='bar.barPointDatas[${status.index}].color2'/></td>
									    <td>
									        <select class='isBarDataCol' name='bar.barDatas[${status.index}].isBarDataCol' >
									           <option value='2'>否</option>
									           <option <c:if test="${barDatas.isBarDataCol eq '1'}">selected="selected"</c:if> value='1'>是</option>
									        </select>
									     </td>
									     </tr>
									</c:forEach>
									
								</tbody>
							</table>
						</td>
					</tr>
					<%--<tr >
						<td >
							<dict:lang value="标记点数据" />
						</td>
						<td colspan="5">
							<table border="1" class="table_list"  style="margin-top:5px;margin-bottom:5px;margin-right:5px;">
								<thead>
									<tr id="colTitle">
										<th width="40%"><dict:lang value="x轴坐标" /></th>
										<th width="40%"><dict:lang value="数值" /></th>
										<th width="20%"></th>
										<!-- <th width="10%"><img id="addRowImg" src="${path}images/add.png" style="width:20px;height:20px;cursor:pointer;" title="<dict:lang value="添加行" />"/></th>-->
									</tr>
								</thead>
								<tbody id="markPointDatas">
									<c:forEach items="${bar.markPointDatas}" var="markPointDatas" varStatus="status">
									 <tr>
								       <td><input type="text" name="bar.markPointDatas[${status.index}].xAxisValue" class="isNum" value="${markPointDatas.xAxisValue}"></td>
  									   <td><input type="text" name="bar.markPointDatas[${status.index}].yAxisValue" class="isNum" value="${markPointDatas.yAxisValue}"></td>
  									   <td><input type="button" id="addMarkPointDatas" value="添加" /></td>
								    
								    	<td></td>
								    </tr>
							     </c:forEach>
								</tbody>
							</table>
						</td>
					</tr>
					--%>
					<tr>
                    <td>柱图X坐标标识</td>
                    <td colspan="5">
                    <select  name="bar.barXcoordinate" class="isBlank" id = "barXcoordinate">
                    	<c:forEach items="${bar.barDatas}" var="barDatas" varStatus="status">
                    		<option <c:if test="${barDatas.name eq bar.barXcoordinate}">selected="selected"</c:if>  value="<c:out value='${barDatas.name}' />"><c:out value='${barDatas.name}' /></option>
                    	</c:forEach>
                    </select>
                    <%--<input type="text" name="bar.barXcoordinate" class="isBlank" value="${bar.barXcoordinate}" style="width:200px;">
                    --%></td>
                </tr>
					<%--
                <tr>
                    <td>柱图堆叠字段</td>
                    <td colspan="5"><input type="text" name="bar.BarDatas.stackCategory" style="width:200px;"></td>      
                </tr>
                --%>
                <tr >
						<td >
							<dict:lang value="柱图X坐标字段" />
						</td>
						<td colspan="5">
							<table border="1" class="table_list"  style="margin-top:5px;margin-bottom:5px;margin-right:5px;">
								<thead>
									<tr >
										<th width="40%"><dict:lang value="刻度值(用,分隔)" /></th>
										<%--<th width="40%"><dict:lang value="步长" /></th>
									--%></tr>
								</thead>
								<tbody id="markPointDatas">
								<tr>
								    <td><input type="text"  name="bar.xDatas.xDataStr" value="<c:out value='${bar.xDatas.xDataStr}' />"></td>
  									<%--<td><input type="text" name="bar.xDatas.xInterval" class="isNum" value="${bar.xDatas.xInterval}"></td>
								--%></tr>
								</tbody>
							</table>
						</td>
					</tr>
				<tr>
                    <td>图形</td>
                    <td colspan="3">刻度值(用,分隔)</td>
                    <td>最大值</td>
                    <td>最小值</td>
                    <%--<td>步长</td>
                --%></tr>
                <tr>
                    <td>柱图Y坐标</td>
                    <td colspan="3"><input type="text" value="<c:out value='${bar.yDatas.yDatasStr}'/>" name="bar.yDatas.yDatasStr" style="border:0"></td>
                    <td><input type="text" value="<c:out value='${bar.yDatas.yMax eq 0 ? "":bar.yDatas.yMax}' />" class="isNum" name="bar.yDatas.yMax" style="border:0"></td>
                    <td><input type="text" value="<c:out value='${bar.yDatas.yMin eq 0 ? "":bar.yDatas.yMin}' />" class="isNum" name="bar.yDatas.yMin" style="border:0"></td><%--
                    <%--
                    <td><input type="text" value="${bar.yDatas.yInterval}" class="isNum" name="bar.yDatas.yInterval"></td>
                --%></tr><%--
                <tr>
                    <td>传参函数名称</td>
                    <td colspan="5"><input type="text" value="${bar.barFunName}" name="bar.barFunName"  style="width:200px;"></td>
                    
                </tr>
                <tr>
                    <td>传参函数体</td>
                    <td colspan="5">
                        <textarea name="bar.barFunBody"  >${bar.barFunBody}</textarea>
                    </td>
                    
                </tr>
                --%><tr>
                    <td></td>
                    
                    <td colspan="3" style="text-align: center;"><a href='javascript:void(0);' id="addMarkLineDatas"> 添加辅助线</a></td>
                    <td colspan="3"  style="text-align: center;"><a href='javascript:void(0);' id="delMarkLineDatas">删除辅助线</a></td>
                </tr>
                  <tr >
						<td >
							<dict:lang value="柱图X坐标字段" />
						</td>
						<td colspan="5">
							<table border='1' class="table_list"  style="margin-top:5px;margin-bottom:5px;margin-right:5px;">
								<thead>
									<tr>
										<th width="10%" style="text-align: center;"><input id="selectAll" type="checkbox"></th>
										<th width="30%"><dict:lang value="辅助线名称 " /></th>
										<th width="30%"><dict:lang value="辅助线值" /></th>
										<th width="30%"><dict:lang value="辅助线颜色" /></th>
									</tr>
								</thead>
								<tbody id="markLineDatasTbody">
									<c:forEach items="${bar.markLineDatas}" var="markLineDatas" varStatus="status">
									<tr>
										<td style="text-align: center;"><input type="checkbox" name="markLineDatasCheckbox" ></td>
										<td><input type="text" class="markLineName"  name="bar.markLineDatas[${status.index}].name" value="<c:out value='${markLineDatas.name}' />"></td>
										<td><input type="text" class="markLineyAxis" name="bar.markLineDatas[${status.index}].yAxis" value="${markLineDatas.yAxis eq 0 ? '':markLineDatas.yAxis}"></td>
										<td><input type="text" class="markLineColor" id="markLineColor_${status.index}" name="bar.markLineDatas[${status.index}].color" value="<c:out value='${markLineDatas.color}' />"></td>
							       </tr>
							     </c:forEach>
								</tbody>
							</table>
						</td>
					</tr>
                <tr id="isLineTr" >
                    <td>是否叠加折线图</td>
                    <td colspan="5"> 
                       <input type="hidden" name="bar.isLine" value="<c:out value='${bar.isLine}' />">
                    	<select name="isLine" disabled="disabled" style="width:100px" id="isLine">
                    	    <option value="2">否</option>
                            <option value="1"  <c:if test="${bar.isLine eq '1'}">selected="selected"</c:if> >是</option>
                        </select>   
                    </td>
                </tr><%--
               柱状图+折线图
               --%>
             <tr class="lineSql line">
                    <td>SQL语句</td>
                    <td colspan="5" style="padding:5px;">数据库适配：
                        <label><input type="radio" name="bar.lineCodeType" value="commql" id="line_codeType_comm" <c:if test="${bar.lineCodeType eq 'commql'}">checked="checked"</c:if>>通用语句</label>
                        <label><input type="radio" name="bar.lineCodeType" value="oracle" id="line_codeType_oracle" <c:if test="${bar.lineCodeType eq 'oracle'}">checked="checked"</c:if> >ORACLE</label>
                        <label><input type="radio" name="bar.lineCodeType" value="sqlserver" id="line_codeType_sqlserver" <c:if test="${bar.lineCodeType eq 'sqlserver'}">checked="checked"</c:if>>SQLSERVER</label>
                        <label><input type="radio" name="bar.lineCodeType" value="mysql" id="line_codeType_mysql" <c:if test="${bar.lineCodeType eq 'mysql'}">checked="checked"</c:if> >MYSQL</label>
                   		<label><input type="radio" name="bar.lineCodeType" value="pgsql" id="line_codeType_pgsql" <c:if test="${bar.lineCodeType eq 'pgsql'}">checked="checked"</c:if>>PGSQL</label>
                   		<textarea id="line_comm_sql" name="bar.lineComm" rows="6"  style="margin-top:5px;height:200px;"><c:out value='${bar.lineComm}' /></textarea>
						<textarea id="line_oracle_sql" name="bar.lineOracle" rows="6" style="display: none;margin-top:5px;height:200px;"><c:out value='${bar.lineOracle}' /></textarea>
						<textarea id="line_sqlserver_sql" name="bar.lineSqlserver" rows="6" style="display: none;margin-top:5px;height:200px;"><c:out value='${bar.lineSqlserver}' /></textarea>
						<textarea id="line_mysql_sql" name="bar.lineMysql" rows="6" style="display: none;margin-top:5px;height:200px;"><c:out value='${bar.lineMysql}' /></textarea>
                    	<textarea id="line_pg_sql"  name="bar.linePgsql" rows="6" style="display: none;margin-top:5px;height:200px;"><c:out value='${bar.linePgsql}' /></textarea>
                   
                    </td>
                </tr> 
                <tr class="lineJavaClass">
                    <td>JAVA类</td>
                    <td><input type="text" name="bar.lineJavaClass" value="<c:out value='${bar.lineJavaClass}' />" >
                        <input type="hidden" name="bar.lineJavaCodeType" value="<c:out value='${bar.lineJavaCodeType}' />"   id="lineCodeType">
                    <input type="hidden" name="bar.lineJavaClsCode" value="<c:out value='${bar.lineJavaClsCode}' />"  id="lineClsCode">
                     <input type="hidden" name="bar.lineJavaClsCodeId" value="<c:out value='${bar.lineJavaClsCodeId}' />"  id="lineClsCodeId">
                    </td>
                     <td>
							<a href="javascript:void(0);" id="lineJavaClassText" onclick="showEditCode('line');">
								<dict:lang value="编辑" />
							</a>
                    </td>
                </tr>
               <tr class="lineJsonStr">
                    <td>JSON字符串</td>
                    <td>
                    <textarea name="bar.jsonLineSourceFun" value="<c:out value='${bar.jsonLineSourceFun}' />"></textarea><%--
                    <input type='text' name="bar.lineJsonStr" value="${bar.lineJsonStr}">
                    --%></td>
                </tr>
                
                	<tr class="line">
						<td >
							<dict:lang value="字段显示别名" />
						</td>
						<td colspan="5">
							<input type="button" id="getLineFieldBtn" class="botton_img_search _get" value="<dict:lang value="获取字段" />"
							 title="<dict:lang value="只能获取当前类型数据库语句"/>"  />
							
							<table border="1" class="table_list"  style="margin-top:5px;margin-bottom:5px;">
								<thead>
									<tr >
										<th width="20%"><dict:lang value="字段名" /></th>
										<th width="20%"><dict:lang value="别名" /></th>
									    <th><dict:lang value="线体颜色" /></th>
										<th><dict:lang value="线体宽度" /></th>
										<th width="20%"><dict:lang value="线体数据列" /></th>
										<!-- <th width="10%"><img id="addRowImg" src="${path}images/add.png" style="width:20px;height:20px;cursor:pointer;" title="<dict:lang value="添加行" />"/></th>-->
									</tr>
								</thead>
								<tbody id="lineColTitle">
								    
									 <c:forEach items="${bar.lineDatas}" var="lineDatas" varStatus="status">
									 <tr class="lineDataConfigTr" >
								   	    <td><input type='text' readonly='readonly' name='bar.lineDatas[${status.index}].name' value="<c:out value='${lineDatas.name}' />" ></td>
								      	<td><input type='text' name='bar.lineDatas[${status.index}].asName' value="<c:out value='${lineDatas.asName}' />"></td>
								      	
								      		<td><input type='text' class="setColorSelect" name='bar.lineDatas[${status.index}].color' value="<c:out value='${lineDatas.color}' />"></td>
								      	<td><input type='text' class="isNum" name='bar.lineDatas[${status.index}].lineWidth' value="${lineDatas.lineWidth eq 0 ? '':lineDatas.lineWidth}"></td><%--
								      	
								      	<td>
								      	  <select name='bar.lineDatas[${status.index}].pointDatas[${status.index}].markPointImageShow' >
									           <option value='2'>否</option>
									           <option <c:if test="${lineDatas.pointDatas[status.index].markPointImageShow eq '1'}">selected="selected"</c:if> value='1'>是</option>
									        </select>
								      	<input type='text' name='bar.lineDatas[${status.index}].pointDatas[${status.index}].isMarkPointImageShow' value="${lineDatas.pointDatas[status.index].isMarkPointImageShow}" ></td>
								        <td><input type='text'  name='bar.lineDatas[${status.index}].pointDatas[${status.index}].markPointSize' value="${lineDatas.pointDatas[status.index].markPointSize}"/></td>
									    --%><td>
									        <select class='isLineDataCol' name='bar.lineDatas[${status.index}].isLineDataCol' >
									           <option value='2'>否</option>
									           <option <c:if test="${lineDatas.isLineDataCol eq '1'}">selected="selected"</c:if> value='1'>是</option>
									        </select>
									     </td>
									     </tr>
									</c:forEach>
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
                    <td colspan="2"><input type="text" value="<c:out value='${bar.lineYDatas.yDatasStr}' />" name="bar.lineYDatas.yDatasStr" style="border:0;"></td>
                    <td><input type="text" value="${bar.lineYDatas.yMax eq 0 ? '':bar.lineYDatas.yMax}" name="bar.lineYDatas.yMax" style="border:0;"></td>
                    <td><input type="text" value="${bar.lineYDatas.yMin eq 0 ? '':bar.lineYDatas.yMin}" name="bar.lineYDatas.yMin" style="border:0;"></td>
                    <td><input type="text" value="${bar.lineYDatas.yInterval eq 0 ? '':bar.lineYDatas.yInterval}" name="bar.lineYDatas.yInterval" style="border:0;"></td>
                </tr><%--
                
                <tr  class="line">
				    <td>标题</td>
                    <td colspan="3">线体颜色</td>
                    <td colspan="2">线体宽度</td>
                </tr>
                 <tr  class="line">
                    <td>线图线体配置</td>
                    <td colspan="3"><input type="text" value="${bar.lineDatas[0].color}" id="lineDatasColor" name="bar.lineDatas[0].color"></td>
                    <td colspan="2"><input type="text" value="${bar.lineDatas[0].lineWidth}" name="bar.lineDatas[0].lineWidth" style="border:0;"></td>
                </tr>
                
                
                --%><%--
                <tr class="line">
                    <td>传参函数名称</td>
                    <td colspan="5"><input type="text" name="bar.lineFunName" value="${bar.lineFunName}" style="width:200px;"></td>
                    
                </tr>
                <tr class="line">
                    <td>传参函数体</td>
                    <td colspan="5">
                        <textarea name="bar.lineFunBody" id="" >${bar.lineFunBody}</textarea>
                    </td>
                </tr>
            --%></table>
        </div>
        <div  class="attribute dataSource">
            <h3>图标属性</h3>
             <div  id ="chartsAttr">
             <table id="listTable" width="100%" border="1" class="table_list" >
	    		<tr>
					<td width="30%">标题</td>
					<td><input type="text" name="chartsConfig.titleText" value="<c:out value='${chartsConfig.titleText}' />"  /></td>
				</tr>
				<tr>
					<td width="30%">标题字体</td>
					<td>
						<input type="radio" name="chartsConfig.titleTextFontFamily" <s:if test="#request.chartsConfig.titleTextFontFamily=='sans-serif'">checked</s:if> value="sans-serif">sans-serif
						<input type="radio" name="chartsConfig.titleTextFontFamily" <s:if test="#request.chartsConfig.titleTextFontFamily=='宋体'">checked</s:if> value="宋体">宋体
						<input type="radio" name="chartsConfig.titleTextFontFamily" <s:if test="#request.chartsConfig.titleTextFontFamily=='黑体'">checked</s:if> value="黑体">黑体
					</td>
				</tr>
				<tr>
					<td width="30%">标题颜色</td>
					<td><input type="text" name="chartsConfig.titleTextColor" class="setColorSelect"   value="<c:out value='${chartsConfig.titleTextColor}' />" /></td>
				</tr>
				<tr>
					<td width="30%">标题字号</td>
					<td><input type="text" name="chartsConfig.titleTextFontSize" class="isNum"  value="<c:out value='${chartsConfig.titleTextFontSize}' />" /></td>
				</tr>
				<tr>
					<td width="30%">标题文字样式</td>
					<td>
						<input type="radio" name="chartsConfig.titleTextFontWeight" <s:if test="#request.chartsConfig.titleTextFontWeight=='normal'">checked</s:if> value="normal">正常
						<input type="radio" name="chartsConfig.titleTextFontWeight" <s:if test="#request.chartsConfig.titleTextFontWeight=='bold'">checked</s:if> value="bold">粗体
					</td>
				</tr>
				<tr>
					<td width="30%">副标题</td>
					<td><input type="text" name="chartsConfig.titleSubtext" value="<c:out value='${chartsConfig.titleSubtext}' />"  /></td>
				</tr>
				<tr>
					<td width="30%">副标题字体</td>
					<td>
						<input type="radio" name="chartsConfig.titleSubtextFontFamily" <s:if test="#request.chartsConfig.titleSubtextFontFamily=='sans-serif'">checked</s:if> value="sans-serif">sans-serif
						<input type="radio" name="chartsConfig.titleSubtextFontFamily" <s:if test="#request.chartsConfig.titleSubtextFontFamily=='宋体'">checked</s:if> value="宋体">宋体
						<input type="radio" name="chartsConfig.titleSubtextFontFamily" <s:if test="#request.chartsConfig.titleSubtextFontFamily=='黑体'">checked</s:if> value="黑体">黑体
					</td>
				</tr>
				<tr>
					<td width="30%">副标题颜色</td>
					<td><input type="text" name="chartsConfig.titleSubtextColor" class="setColorSelect"  value="<c:out value='${chartsConfig.titleSubtextColor}' />" /></td>
				</tr>
				<tr>
					<td width="30%">副标题字号</td>
					<td><input type="text" name="chartsConfig.titleSubtextFontSize" class="isNum"  value="<c:out value='${chartsConfig.titleSubtextFontSize}' />" /></td>
				</tr>
				<tr>
					<td width="30%">副标题文字样式</td>
					<td>
						<input type="radio" name="chartsConfig.titleSubtextFontWeight" <s:if test="#request.chartsConfig.titleSubtextFontWeight=='normal'">checked</s:if> value="normal">正常
						<input type="radio" name="chartsConfig.titleSubtextFontWeight" <s:if test="#request.chartsConfig.titleSubtextFontWeight=='bold'">checked</s:if> value="bold">粗体
					</td>
				</tr>
				<tr>
					<td width="30%">画布宽度(像素绝对值)</td>
					<td><input type="text" name="chartsConfig.canvasWidth" class="isNum"  value="<c:out value='${chartsConfig.canvasWidth}' />" /></td>
				</tr>
				<tr>
					<td width="30%">画布高度(像素绝对值)</td>
					<td><input type="text" name="chartsConfig.canvasHeight" class="isNum"  value="<c:out value='${chartsConfig.canvasHeight}' />" /></td>
				</tr>
				<tr>
					<td width="30%">是否显示加载动画</td>
					<td>
						<input type="radio" name="chartsConfig.animation" <s:if test="#request.chartsConfig.animation==1">checked</s:if> value="1">显示
						<input type="radio" name="chartsConfig.animation" <s:if test="#request.chartsConfig.animation==2">checked</s:if> value="2">不显示
					</td>
				</tr>	
				<tr>
					<td width="30%">是否显示图例</td>
					<td>
						<input type="radio" name="chartsConfig.isShowLegend" <s:if test="#request.chartsConfig.isShowLegend==1">checked</s:if> value="1">显示
						<input type="radio" name="chartsConfig.isShowLegend" <s:if test="#request.chartsConfig.isShowLegend==2">checked</s:if> value="2">不显示
					</td>
				</tr>	
				<tr>
					<td width="30%">点击事件</td>
					<td>
					<select name="chartsConfig.eventClick">
					    <option value="false" <c:if test="${chartsConfig.eventClick eq 'false'}">selected="selected"</c:if> >不触发</option>
					   <option value="true" <c:if test="${chartsConfig.eventClick eq 'true'}">selected="selected"</c:if>>触发</option>
					</select>
					<%--<input type="text" name="chartsConfig.eventClick"  value="${chartsConfig.eventClick}" />
					--%></td>
				</tr>
				<tr>
					<td width="30%">背景图url</td>
					<td><input type="text" name="chartsConfig.backgroundUrl"  value="<c:out value='${chartsConfig.backgroundUrl}' />" /></td>
				</tr>
				<tr>
					<td width="30%">背景图透明度(100为完全不透明,0为完全透明)</td>
					<td><input type="text" name="chartsConfig.backgroundAlpha" class="isNum"  value="<c:out value='${chartsConfig.backgroundAlpha}' />"  /></td>
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
						<input type="radio" name="bar.xAxisValue" <s:if test="#request.bar.xAxisValue==1">checked</s:if> value="true">x轴
						<input type="radio" name="bar.xAxisValue" <s:if test="#request.bar.xAxisValue==0">checked</s:if> value="false">y轴(注意:只有数据轴为y轴时,才能出现柱图和折线图并存)		
					</td>
				</tr>
				
				<tr>
					<td width="30%">柱体宽度(设置百分数)</td>
					<td><input type="text" name="bar.barWidth" value="<c:out value='${bar.barWidth}' />" /></td>
				</tr>
				
			  <tr id="yInterval" <s:if test="#request.bar.xAxisValue==1">style="display: none;"</s:if> >
					<td width="30%">y轴坐标步长</td>
					<td><input type="text" name="bar.yDatas.yInterval" value="<c:out value='${bar.yDatas.yInterval}' />" class="isNum"   /></td>
				</tr>
				
				<tr id = "xInterval" <s:if test="#request.bar.xAxisValue==0">style="display: none;"</s:if>>
					<td width="30%">x轴坐标步长</td>
					<td><input type="text" name="bar.xDatas.xInterval" value="<c:out value='${bar.xDatas.xInterval}' />" class="isNum"   /></td>
				</tr>
				
				<tr>
					<td width="30%">x轴坐标刻度间隔</td>
					<td><input type="text" name="bar.xAxisInterval" class="isNum" value="<c:out value='${bar.xAxisInterval}' />"  /></td>
				</tr>
				<tr>
					<td width="30%">x轴坐标刻度文字角度(注意:只针对分类轴有效)</td>
					<td><input type="text" name="bar.xAxisRotate" class="isNum" value="<c:out value='${bar.xAxisRotate}' />"  /></td>
				</tr>
				<tr>
					<td width="30%">y轴坐标刻度间隔</td>
					<td><input type="text" name="bar.yAxisInterval" class="isNum" value="<c:out value='${bar.yAxisInterval}' />"  /></td>
				</tr>
				<tr>
					<td width="30%">y轴坐标刻度文字角度(注意:只针对分类轴有效)</td>
					<td><input type="text" name="bar.yAxisRotate" class="isNum" value="<c:out value='${bar.yAxisRotate}' />" /></td>
				</tr>
				<tr>
					<td width="30%">图例说明的排列方式</td>
					<td>
						<input type="radio" name="bar.legendOrient" <s:if test="#request.bar.legendOrient=='vertical'">checked</s:if> value="vertical">竖向排列
						<input type="radio" name="bar.legendOrient" <s:if test="#request.bar.legendOrient=='horizontal'">checked</s:if> value="horizontal">横向排列						
					</td>
				</tr>	
				<tr>
					<td width="30%">图例说明的最大文字长度</td>
					<td><input type="text" name="bar.legendLength" value="<c:out value='${bar.legendLength}' />"  /></td>
				</tr>
				<tr>
					<td width="30%">图例说明的水平位置</td>
					<td>
						<input type="radio" name="bar.legendX" <s:if test="#request.bar.legendX=='left'">checked</s:if> value="left">居左
						<input type="radio" name="bar.legendX" <s:if test="#request.bar.legendX=='center'">checked</s:if> value="center">居中			
						<input type="radio" name="bar.legendX" <s:if test="#request.bar.legendX=='right'">checked</s:if> value="right">居右							
					</td>
				</tr>
				<tr>
					<td width="30%">图例说明的垂直位置</td>
					<td>
						<input type="radio" name="bar.legendY" <s:if test="#request.bar.legendY=='left'">checked</s:if> value="top">顶部
						<input type="radio" name="bar.legendY" <s:if test="#request.bar.legendY=='middle'">checked</s:if> value="middle">居中			
						<input type="radio" name="bar.legendY" <s:if test="#request.bar.legendY=='bottom'">checked</s:if> value="bottom">底部							
					</td>
				</tr>
				<tr>
					<td width="30%">鼠标指上时是否显示提示信息</td>
					<td>
						<input type="radio" name="bar.tooltipTrigger" <s:if test="#request.bar.tooltipTrigger=='axis'">checked</s:if> value="axis">显示
						<input type="radio" name="bar.tooltipTrigger" <s:if test="#request.bar.tooltipTrigger=='none'">checked</s:if> value="none">不显示
					</td>
				</tr>
				<tr>
					<td width="30%">每个柱体是否显示数值</td>
					<td>
						<input type="radio" name="bar.seriesLabelShow" <s:if test="#request.bar.seriesLabelShow==1">checked</s:if> value="true">显示
						<input type="radio" name="bar.seriesLabelShow" <s:if test="#request.bar.seriesLabelShow==0">checked</s:if> value="false">不显示				
					</td>
				</tr>
				<tr>
					<td width="30%">柱体显示数值的位置</td>
					<td>
						<input type="radio" name="bar.seriesLabelPosition" <s:if test="#request.bar.seriesLabelPosition=='outside'">checked</s:if> value="outside">柱体外
						<input type="radio" name="bar.seriesLabelPosition" <s:if test="#request.bar.seriesLabelPosition=='insideTop'">checked</s:if> value="insideTop">柱体内顶部
						<input type="radio" name="bar.seriesLabelPosition" <s:if test="#request.bar.seriesLabelPosition=='inside'">checked</s:if> value="inside">柱体内居中
						<input type="radio" name="bar.seriesLabelPosition" <s:if test="#request.bar.seriesLabelPosition=='insideBottom'">checked</s:if> value="insideBottom">柱体内底部
					</td>
				</tr>
				<tr>
					<td width="30%">每个柱体之间的间隔距离</td>
					<td><input type="text" name="bar.seriesBarGap" value="<c:out value='${bar.seriesBarGap}' />" /></td>
				</tr>
				<tr>
					<td width="30%">每个分类之间的间隔距离</td>
					<td><input type="text" name="bar.seriesBarCategoryGap" value="<c:out value='${bar.seriesBarCategoryGap}' />" /></td>
				</tr>
				<tr>
					<td width="30%">指示线样式</td>
					<td>
						<input type="radio" name="bar.tooltipAxisPointer" <s:if test="#request.bar.tooltipAxisPointer=='shadow'">checked</s:if> value="shadow">整体式
						<input type="radio" name="bar.tooltipAxisPointer" <s:if test="#request.bar.tooltipAxisPointer=='line'">checked</s:if> value="line">线式
					</td>
				</tr>
				<tr>
					<td width="30%">是否显示x轴分隔线</td>
					<td>
						<input type="radio" name="bar.xAxisSplitLine" <s:if test="#request.bar.xAxisSplitLine==0">checked</s:if> value="false">否
						&nbsp;
						<input type="radio" name="bar.xAxisSplitLine" <s:if test="#request.bar.xAxisSplitLine==1">checked</s:if> value="true">是
					</td>
				</tr>
				<tr>
					<td width="30%">x轴分隔线颜色</td>
					<td><input type="text" name="bar.xAxisSplitLineColor"  class="setColorSelect"  value="<c:out value='${bar.xAxisSplitLineColor}' />"  value="20" /></td>
				</tr>
				<tr>
					<td width="30%">是否显示y轴分隔线</td>
					<td>
						<input type="radio" name="bar.yAxisSplitLine" <s:if test="#request.bar.yAxisSplitLine==0">checked</s:if> value="false">否
						&nbsp;
						<input type="radio" name="bar.yAxisSplitLine" <s:if test="#request.bar.yAxisSplitLine==1">checked</s:if> value="true">是
					</td>
				</tr>
				<tr>
					<td width="30%">y轴分隔线颜色<c:out value='${bar.yAxisSplitLineColor}' /></td>
					<td><input type="text" name="bar.yAxisSplitLineColor" class="setColorSelect"   value="<c:out value='${bar.yAxisSplitLineColor}' />" /></td>
				</tr>
				<tr>
					<td width="30%">y轴显示文本后追加的文字</td>
					<td><input type="text" name="bar.yAxisAxisLabelFormatter" value="<c:out value='${bar.yAxisAxisLabelFormatter}' />"  /></td>
				</tr> 
				<tr>
					<td width="30%">是否显示最小值标线</td>
					<td>
						<input type="radio" name="bar.markLineMin" <s:if test="#request.bar.markLineMin==0">checked</s:if> value="false">否
						&nbsp;
						<input type="radio" name="bar.markLineMin" <s:if test="#request.bar.markLineMin==1">checked</s:if> value="true">是
					</td>
				</tr>		
				<tr>
					<td width="30%">最小值标线颜色</td>
					<td><input type="text" name="bar.markLineMinColor" class="setColorSelect"  value="<c:out value='${bar.markLineMinColor}' />" /></td>
				</tr> 
				<tr>
					<td width="30%">是否显示最大值标线</td>
					<td>
						<input type="radio" name="bar.markLineMax" <s:if test="#request.bar.markLineMax==0">checked</s:if> value="false">否
						&nbsp;
						<input type="radio" name="bar.markLineMax" <s:if test="#request.bar.markLineMax==1">checked</s:if> value="true">是
					</td>
				</tr>		
				<tr>
					<td width="30%">最大值标线颜色</td>
					<td><input type="text" name="bar.markLineMaxColor" class="setColorSelect"  value="<c:out value='${bar.markLineMaxColor}' />"  /></td>
				</tr> 
				<tr>
					<td width="30%">是否显示平均值标线</td>
					<td>
						<input type="radio" name="bar.markLineAverage" <s:if test="#request.bar.markLineAverage==0">checked</s:if> value="false">否
						&nbsp;
						<input type="radio" name="bar.markLineAverage" <s:if test="#request.bar.markLineAverage==1">checked</s:if> value="true">是
					</td>
				</tr>		
				<tr>
					<td width="30%">平均值标线颜色</td>
					<td><input type="text" name="bar.markLineAverageColor"  class="setColorSelect" value="<c:out value='${bar.markLineAverageColor}' />"  /></td>
				</tr> 
				<tr>
					<td width="30%">线条外观(如果存在折线)</td>
					<td>
						<input type="radio" name="bar.seriesSmooth" <s:if test="#request.bar.seriesSmooth==0">checked</s:if> value="false">折线
						<input type="radio" name="bar.seriesSmooth" <s:if test="#request.bar.seriesSmooth==1">checked</s:if> value="true">曲线				
					</td>
				</tr>
				<tr>
					<td width="30%">坐标系与画布顶部边距(可填百分比或绝对值)</td>
					<td><input type="text" name="bar.gridTop" class="isPercentOrNum" value="<c:out value='${bar.gridTop}' />"  /></td>
				</tr>
				<tr>
					<td width="30%">坐标系与画布底部边距(可填百分比或绝对值)</td>
					<td><input type="text" name="bar.gridBottom" class="isPercentOrNum" value="<c:out value='${bar.gridBottom}' />"  /></td>
				</tr>
				<tr>
					<td width="30%">坐标系与画布左边距(可填百分比或绝对值)</td>

					<td><input type="text" name="bar.gridLeft" class="isPercentOrNum" value="<c:out value='${bar.gridLeft}' />"  /></td>
				</tr>
				<tr>
					<td width="30%">坐标系与画布右边距(可填百分比或绝对值)</td>

					<td><input type="text" name="bar.gridRight" class="isPercentOrNum" value="<c:out value='${bar.gridRight}' />"  /></td>
				</tr>
				<tr>
					<td width="30%">是否显示数据位置标记条</td>
					<td>
						<input type="radio" name="bar.dataZoomShow" <s:if test="#request.bar.dataZoomShow==0">checked</s:if> value="false">否
						&nbsp;
						<input type="radio" name="bar.dataZoomShow" <s:if test="#request.bar.dataZoomShow==1">checked</s:if> value="true">是
					</td>
				</tr>
				<tr>
					<td width="30%">数据标记条默认数据起始位置</td>
					<td><input type="text" name="bar.dataZoomStart" class="isNumOrNull" value="<c:out value='${bar.dataZoomStart}' />"  value="20" /></td>
				</tr>
				<tr>
					<td width="30%">数据标记条默认数据结束位置</td>
					<td><input type="text" name="bar.dataZoomEnd" class="isNumOrNull" value="<c:out value='${bar.dataZoomEnd}' />" value="20" /></td>
				</tr>
				<tr>
					<td width="30%">数据标记条高度</td>
					<td><input type="text" name="bar.dataZoomHeight" class="isNumOrNull" value="<c:out value='${bar.dataZoomHeight}' />"  value="20" /></td>
				</tr>
				<tr>
					<td width="30%">数据标记条与画布底部边距(可填百分比或绝对值)</td>
					<td><input type="text" name="bar.dataZoomBottom" class="isPercentOrNum" value="<c:out value='${bar.dataZoomBottom}' />"  value="20" /></td>
				</tr>
				<tr>
					<td width="30%">图片导出的画布宽度(像素绝对值，不填写则与显示画布相同)</td>
					<td><input type="text" name="bar.canvasWidth2" class="isNumOrNull" value="<c:out value='${bar.canvasWidth2}' />" /></td>
				</tr>
				<tr>
					<td width="30%">图片导出的画布高度(像素绝对值，不填写则与显示画布相同)</td>
					<td><input type="text" name="bar.canvasHeight2" class="isNumOrNull" value="<c:out value='${bar.canvasHeight2}' />"  /></td>
				</tr>
			</table>
             
             </div>
        </div>
        
    </div>
    	
    </form>
</body>