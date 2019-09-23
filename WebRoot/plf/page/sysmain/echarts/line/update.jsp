<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<head>
<title><dict:lang value="折线图修改配置" />
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
		_alertValMsg($("#barJavaClass"),"<dict:lang value="JAVA类不能为空" />");
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
	var lineXcoordinate = [];
	for(var i = 0;i < aList.length; i++){
		arr.push("<tr class="+configTr+">");
		arr.push("<td><input type='text' readonly='readonly' class='isName' name='line.lineDatas["+i+"].name' value="+aList[i].filedName+"></td>");
		arr.push("<td><input type='text' name='line.lineDatas["+i+"].asName' value="+aList[i].filedName+"></td>");
		arr.push("<td><input type='text' class='setColorSelect' value='#000000' name='line.lineDatas["+i+"].color'></td>");
		arr.push("<td><input type='text' class='isNum' name='line.lineDatas["+i+"].lineWidth' ></td>");
		//arr.push("<td><select name='line.lineDatas["+i+"].pointDatas["+i+"].markPointImageShow' ><option value='2'>否</option><option value='1'>是</option></select></td>");
		//arr.push("<td><input type='text' name='line.lineDatas["+i+"].pointDatas["+i+"].markPointImageShow' ></td>");
		//arr.push("<td><input type='text'  name='line.lineDatas["+i+"].pointDatas["+i+"].markPointImageUrl'/></td>");
		arr.push("<td><select class='isLineDataCol' name='line.lineDatas["+i+"].isLineDataCol' ><option value='2'>否</option><option value='1'>是</option></select></td>");
		arr.push("</tr>");
		lineXcoordinate.push("<option value="+aList[i].filedName+">"+aList[i].filedName+"</option>");
		arrColorCount[i] = i;
	}
	$("."+configTr+",.thisTrSeriesAreaStyleColor").remove();
	$("input[name='line.seriesAreaStyle'][value='false']").attr("checked",true);
	lastTr.after(arr.join(""));
	setBarDatasColor(".setColorSelect");
	if(lineXcoordinate.length>0){
		$("#lineXcoordinate").html(lineXcoordinate.join(""));
	};
}


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
		};
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
$("input[name='line.lineCodeType']:checked").trigger("change");

var markLineDatasCount = $("#markLineDatasTbody").children("tr").length;
$("#addMarkLineDatas").click(function(){
	//<td><input type="text" name="line.markLineDatas[0].name" value=""></td>
	var markLineDatas = "<tr>"
					  + "<td style=\"text-align: center;\"><input type=\"checkbox\" name=\"markLineDatasCheckbox\" ></td>"
					  + "<td><input type=\"text\" class=\"markLineName\"  name=\"line.markLineDatas["+markLineDatasCount+"].name\" value=\"\"></td>"
					  + "<td><input type=\"text\" class=\"markLineyAxis\" class=\"isNum\" name=\"line.markLineDatas["+markLineDatasCount+"].yAxis\" value=\"\"></td>"
					  + "<td><input type=\"text\" class=\"markLineColor\" id=\"markLineColor_"+markLineDatasCount+"\" name=\"line.markLineDatas["+markLineDatasCount+"].color\" value=\"#000000\"></td>"
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
		markLineDatasCount = $("#markLineDatasTbody").children("tr").length;
	}else{
		markLineDatasCount = 0;
	};
});

setBarDatasColor("#lineDatasColor");
setBarDatasColor(".markLineColor");
setBarDatasColor(".seriesAreaStyleColor");
setBarDatasColor(".setColorSelect");
});

function updateLineAttr(thisObj){
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
		var linejsonLineSourceFun = $("#jsonLineSourceFun").val();
		if(linejsonLineSourceFun == ""){
			_alertValMsg($("#jsonLineSourceFun"),"<dict:lang value="数据源不能为空" />");
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
	
	var isCache = "<c:out value='${paraMap.isCache}'/>";
	if(isCache == "1"){
		var chartsConfigCache =  msChartsData("addForm");
		//chartsConfigCache["chartsConfigCache.id"] = "<c:out value='${paraMap.cacheId}'/>";
		var iframeId = $("#iframeId").val();
		var parentFrame = top.document.getElementById(iframeId);//获取到父iframe对象
		$.ajax({
            type: "POST",
            dataType: "json",
            url: "${path}charts/lineAction_cacheUpdate.ms",
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
		document.forms.addForm.submit();
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
	var chartsConfig_id = $("#chartsConfig_id").val();
	var popWinframeId = window.frameElement.id+"PopWin";
    var url = "${path}charts/lineAction_cfgClsCode.ms?paraMap.CLASS_NAME="+lineJavaClass+"&paraMap.codeType="+lineJavaCodeType
			/* +"&paraMap.clsCode="+lineJavaClsCode */+"&paraMap.CODE_ID="+lineJavaClsCodeId+"&paraMap.piframeName="+window.frameElement.id
			+"&paraMap.piframeId="+window.frameElement.id+"&paraMap.toFlag=classManage"+"&paraMap.popWinframeId="+popWinframeId+"&paraMap.OWNER_ID="+chartsConfig_id;
	showPopWinFp(url, $(top.document).width()*0.90, $(top.document).height()*0.90,null,"<dict:lang value="修改类源码"/>", popWinframeId);
}

function updateCLASS_NAME_TEXT(classNameTextId,className,flag){
	$("#lineJavaClass").val('');
	$("#lineCodeType").val('');
	$("#lineClsCode").val('');
	$("#lineClsCodeId").val('');
}
</script>
</head>
<body style="width:100%;min-width:1000px;background-color:#fff;">
<form id="addForm" name="addForm" action="${path}charts/lineAction_doUpdate.ms" method="post">
<input type="hidden" id="chartsConfig_id"  name="chartsConfig.id" value="<c:out value='${chartsConfig.id}'/>" />
  <div class="head">
  	<span style="display: inline-block;height: 20px;margin-top: 5px;margin-left: 5px;">
        <span>图表类型</span>
        <dict:selectDict dictCode="CHARTS_TYPE" disabled="true" id="CHARTS_TYPE" dictValue="${fn:escapeXml(chartsConfig.chartsType)}" name="chartsConfig.chartsType"  />
        <span>数据源</span>  
        <dict:selectDict dictCode="CHARTS_DATA_SOURCES" disabled="true" id="CHARTS_DATA_SOURCES" dictValue="${fn:escapeXml(chartsConfig.chartsDataSources)}" name="chartsConfig.chartsDataSources"  />
    </span>
    <button type="button" onclick="updateLineAttr(this);" class="_save"><i class="ico"></i><dict:lang value="修改" /></button> 
    </div>
	<div class="all">
		  <div class="dataSource">
            <h3>数据源</h3>
            <table border='1'>
             <c:if test="${chartsConfig.chartsDataSources eq '1'}">
                <tr class="lineSql">
                    <td>SQL语句</td>
                    <td colspan="5" style="padding:5px;">数据库适配：
                        <label><input type="radio" name="line.lineCodeType" value="commql" id="line_codeType_comm" <c:if test="${line.lineCodeType eq 'commql'}">checked="checked"</c:if>>通用语句</label>
                        <label><input type="radio" name="line.lineCodeType" value="oracle" id="line_codeType_oracle" <c:if test="${line.lineCodeType eq 'oracle'}">checked="checked"</c:if>>ORACLE</label>
                        <label><input type="radio" name="line.lineCodeType" value="sqlserver" id="line_codeType_sqlserver" <c:if test="${line.lineCodeType eq 'sqlserver'}">checked="checked"</c:if>>SQLSERVER</label>
                        <label><input type="radio" name="line.lineCodeType" value="mysql" id="line_codeType_mysql" <c:if test="${line.lineCodeType eq 'mysql'}">checked="checked"</c:if>>MYSQL</label>
                   		 <label><input type="radio" name="line.lineCodeType" value="pgsql" id="line_codeType_pgsql" <c:if test="${line.lineCodeType eq 'pgsql'}">checked="checked"</c:if>>PGSQL</label>
                   		
                   		<textarea id="line_comm_sql" class="linecommql" name="line.lineComm" rows="6" style="margin-top:5px;height:200px;"><c:out value='${line.lineComm}'/></textarea>
						<textarea id="line_oracle_sql" class="lineoracle" name="line.lineOracle" rows="6" style="display: none;margin-top:5px;height:200px;"><c:out value='${line.lineOracle}'/></textarea>
						<textarea id="line_sqlserver_sql" class="linesqlserver" name="line.lineSqlserver" rows="6" style="display: none;margin-top:5px;height:200px;"><c:out value='${line.lineSqlserver}'/></textarea>
						<textarea id="line_mysql_sql" class="linemysql" name="line.lineMysql" rows="6" style="display: none;margin-top:5px;height:200px;"><c:out value='${line.lineMysql}'/></textarea>
                   		<textarea id="line_pg_sql" class="linepgsql" name="line.linePgsql" rows="6" style="display: none;margin-top:5px;height:200px;"><c:out value='${line.linePgsql}'/></textarea>
                    </td>
                </tr> 
                </c:if>
                 <c:if test="${chartsConfig.chartsDataSources eq '2'}">
                <tr >
                    <td>JAVA类</td>
                    
                      <td colspan="4">
                    <input type="text" name="line.lineJavaClass" value="<c:out value='${line.lineJavaClass}'/>" id="lineJavaClass" >
                    <input type="hidden" name="line.lineJavaCodeType" value="<c:out value='${line.lineJavaCodeType}'/>" id="lineCodeType">
                    <input type="hidden" value="<c:out value='${line.lineJavaClsCode}'/>" id="lineClsCode">
                     <input type="hidden" name="line.lineJavaClsCodeId" value="<c:out value='${line.lineJavaClsCodeId}'/>" id="lineClsCodeId">
                    </td>
                    <td>
							<a href="javascript:void(0);" id="lineJavaClassText" onclick="showEditCode();">
								<dict:lang value="编辑" />
							</a>
                    </td>
                </tr>
                </c:if>
                <c:if test="${chartsConfig.chartsDataSources eq '3'}">
               <tr >
                    <td>JSON字符串</td>
                    <td colspan="5">
                     <textarea name="line.jsonLineSourceFun" id ="jsonLineSourceFun"><c:out value='${line.jsonLineSourceFun}'/></textarea>
                    </td>
                </tr>
                </c:if>
                	<tr >
						<td >
							<dict:lang value="字段显示别名" />
						</td>
						<td colspan="5">
							<input type="button" id="getLineFieldBtn" class="botton_img_search _get" value="<dict:lang value="获取字段" />"
							 title="<dict:lang value="只能获取当前类型数据库语句"/>"  />
							
							<table border="1" class="table_list"  style="margin-top:5px;margin-bottom:5px;margin-right:5px;">
								<thead>
									<tr >
										<th><dict:lang value="字段名" /></th>
										<th><dict:lang value="别名" /></th>
										<th><dict:lang value="线体颜色" /></th>
										<th><dict:lang value="线体宽度" /></th>
										<th><dict:lang value="线体数据列" /></th>
										<!-- <th width="10%"><img id="addRowImg" src="${path}images/add.png" style="width:20px;height:20px;cursor:pointer;" title="<dict:lang value="添加行" />"/></th>-->
									</tr>
									
								</thead>
								<tbody id="lineColTitle">
								
								  <c:forEach items="${line.lineDatas}" var="lineDatas" varStatus="status">
									 <tr class="lineDataConfigTr" >
								   	    <td><input type='text' class="isBlank isName" readonly='readonly' name='line.lineDatas[<c:out value="${status.index}"/>].name' value="<c:out value='${lineDatas.name}'/>"></td>
								      	<td><input type='text' class="isBlank" name='line.lineDatas[<c:out value="${status.index}"/>].asName' value="<c:out value='${lineDatas.asName}'/>"></td>
								      	
								      	<td><input type='text' class="setColorSelect" name='line.lineDatas[<c:out value="${status.index}"/>].color' value="<c:out value='${lineDatas.color}'/>"></td>
								      	<td><input type='text' class="isNum" name='line.lineDatas[<c:out value="${status.index}"/>].lineWidth' value="<c:out value='${lineDatas.lineWidth eq 0 ? "":lineDatas.lineWidth}' />"></td>
								      	
								      <%--	<td>
								      	  <select name='line.lineDatas[${status.index}].pointDatas[${status.index}].markPointImageShow' >
									           <option value='2'>否</option>
									           <option <c:if test="${lineDatas.pointDatas[status.index].markPointImageShow eq '1'}">selected="selected"</c:if> value='1'>是</option>
									        </select>
								      	<input type='text' name='line.lineDatas[${status.index}].pointDatas[${status.index}].isMarkPointImageShow' value="${lineDatas.pointDatas[status.index].isMarkPointImageShow}" ></td>
								        <td><input type='text'  name='line.lineDatas[${status.index}].pointDatas[${status.index}].markPointSize' value="${lineDatas.pointDatas[status.index].markPointSize}"/></td>
									    --%><td>
									        <select class="isLineDataCol" name='line.lineDatas[<c:out value="${status.index}"/>].isLineDataCol' >
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
								    <td><input type="text"  name="line.xDatas.xDataStr"  value="<c:out value='${line.xDatas.xDataStr}'/>"></td>
  									<td><input type="text" name="line.xDatas.xInterval" class="isNum"  value="<c:out value='${line.xDatas.xInterval eq 0 ? "":line.xDatas.xInterval}' />"></td>
								</tr>
								</tbody>
							</table>
						</td>
					</tr>
                    <td>线图X坐标标识</td>
                    <td colspan="5">
                      <select  name="line.lineXcoordinate" class="isBlank" id = "lineXcoordinate" style="width:200px;">
                    	<c:forEach items="${line.lineDatas}" var="lineDatas" varStatus="status">
                    		<option <c:if test="${lineDatas.name eq line.lineXcoordinate}">selected="selected"</c:if>  value="<c:out value='${lineDatas.name}' />"><c:out value='${lineDatas.name}' /></option>
                    	</c:forEach>
                    </select><%--
                    <input type="text" name="line.lineXcoordinate" value="${line.lineXcoordinate}" class="isBlank" style="width:200px;">
                    
                    --%></td>
                </tr>
				 <tr  >
				    <td>图形</td>
                    <td colspan="2">刻度值(用,分隔)</td>
                    <td>最大值</td>
                    <td>最小值</td>
                    <td>步长</td>
                </tr>
                <tr  >
                    <td>线图Y坐标</td>
                   
                     <td colspan="2"><input type="text" value="<c:out value='${line.yDatas.yDatasStr}' />" style="border:0" name="line.yDatas.yDatasStr"></td>
                    <td><input type="text" value="<c:out value='${line.yDatas.yMax eq 0 ? "":line.yDatas.yMax}' />" name="line.yDatas.yMax"  style="border:0"></td>
                    <td><input type="text" value="<c:out value='${line.yDatas.yMin eq 0 ? "":line.yDatas.yMin}' />" name="line.yDatas.yMin" style="border:0"></td>
                    <td><input type="text" value="<c:out value='${line.yDatas.yInterval eq 0 ? "":line.yDatas.yInterval}' />" name="line.yDatas.yInterval" style="border:0"></td>
                </tr><%--
                <tr>
				    <td>标题</td>
                    <td colspan="3">线体颜色</td>
                    <td colspan="2">线体宽度</td>
                </tr>
                 <tr  >
                    <td>线图线体配置</td>
                     <td colspan="2"><input type="text" value="${line.lineDatas[0].name}" id="lineDatasName" name="line.lineDatas[0].name"></td>
                    <td colspan="3"><input type="text" value="${line.lineDatas[0].color}" id="lineDatasColor" name="line.lineDatas[0].color"></td>
                    <td colspan="2"><input type="text" class="isNum" value="${line.lineDatas[0].lineWidth}"  style="border:0" name="line.lineDatas[0].lineWidth"></td>
                </tr>
                  --%>
                  <tr>
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
								<tbody id="markLineDatasTbody">
									<c:forEach items="${line.markLineDatas}" var="markLineDatas" varStatus="status">
									<tr>
										<td style="text-align: center;"><input type="checkbox" name="markLineDatasCheckbox" ></td>
										<td><input type="text" class="markLineName"  name="line.markLineDatas[<c:out value='${status.index}'/>].name" value="<c:out value='${markLineDatas.name}'/>"></td>
										<td><input type="text" class="markLineyAxis" name="line.markLineDatas<c:out value='${status.index}'/>].yAxis" value="<c:out value="${markLineDatas.yAxis eq 0 ? '':markLineDatas.yAxis}"/>"></td>
										<td><input type="text" class="markLineColor" id="markLineColor_<c:out value='${status.index}'/>" name="line.markLineDatas[<c:out value='${status.index}'/>].color" value="<c:out value='${markLineDatas.color}'/>"></td>
							       </tr>
							     </c:forEach>
								</tbody>
							</table>
						</td>
					</tr>
                <tr>
             </table>
               </div>
             <div  class="attribute dataSource">
            <h3>图标属性</h3>
             <div  id ="chartsAttr">
	    	<table border="1" id="listTable" width="100%" border="1" class="table_list" >
				<tr>
					<td width="30%">标题</td>
					<td><input type="text" name="chartsConfig.titleText"  value="<c:out value='${chartsConfig.titleText}'/>" /></td>
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
					<td><input type="text" name="chartsConfig.titleTextColor" class="setColorSelect"  value="<c:out value='${chartsConfig.titleTextColor}'/>" /></td>
				</tr>
				<tr>
					<td width="30%">标题字号</td>
					<td><input type="text" name="chartsConfig.titleTextFontSize" class="isNum"  value="<c:out value='${chartsConfig.titleTextFontSize}'/>" /></td>
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
					<td><input type="text" name="chartsConfig.titleSubtext" value="<c:out value='${chartsConfig.titleSubtext}'/>"  /></td>
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
					<td><input type="text" name="chartsConfig.titleSubtextColor" class="setColorSelect"  value="<c:out value='${chartsConfig.titleSubtextColor}'/>" /></td>
				</tr>
				<tr>
					<td width="30%">副标题字号</td>
					<td><input type="text" name="chartsConfig.titleSubtextFontSize" class="isNum" value="<c:out value='${chartsConfig.titleSubtextFontSize}'/>" /></td>
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
					<td><input type="text" name="chartsConfig.canvasWidth" class="isNum"  value="<c:out value='${chartsConfig.canvasWidth}'/>" /></td>
				</tr>
				<tr>
					<td width="30%">画布高度(像素绝对值)</td>
					<td><input type="text" name="chartsConfig.canvasHeight" class="isNum"   value="<c:out value='${chartsConfig.canvasHeight}'/>" /></td>
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
					<td><input type="text" name="chartsConfig.backgroundUrl" value="<c:out value='${chartsConfig.backgroundUrl}' />" /></td>
				</tr>
				<tr>
					<td width="30%">背景图透明度(100为完全不透明,0为完全透明)</td>
					<td><input type="text" name="chartsConfig.backgroundAlpha" class="isNum"   value="<c:out value='${chartsConfig.backgroundAlpha}'/>" /></td>
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
						<input type="radio" name="line.seriesSmooth" <s:if test="#request.line.seriesSmooth==0">checked</s:if> value="false">折线
						<input type="radio" name="line.seriesSmooth" <s:if test="#request.line.seriesSmooth==1">checked</s:if> value="true">曲线				
					</td>
				</tr>
				<tr>
					<td width="30%">坐标系内部是否有边界</td>
					<td>
						<input type="radio" name="line.xAxisBoundaryGap" <s:if test="#request.line.xAxisBoundaryGap==0">checked</s:if> value="false">无边界
						<input type="radio" name="line.xAxisBoundaryGap" <s:if test="#request.line.xAxisBoundaryGap==1">checked</s:if> value="true">有边界					
					</td>
				</tr>
				<tr>
					<td width="30%">图例说明的排列方式</td>
					<td>
						<input type="radio" name="line.legendOrient" <s:if test="#request.line.legendOrient=='vertical'">checked</s:if> value="vertical">竖向排列
						<input type="radio" name="line.legendOrient" <s:if test="#request.line.legendOrient=='horizontal'">checked</s:if> value="horizontal">横向排列						
					</td>
				</tr>	
				<tr>
					<td width="30%">图例说明的最大文字长度</td>
					<td><input type="text" name="line.legendLength" value="<c:out value='${line.legendLength}'/>"  /></td>
				</tr>
				<tr>
					<td width="30%">图例说明的水平位置</td>
					<td>
						<input type="radio" name="line.legendX" <s:if test="#request.line.legendX=='left'">checked</s:if> value="left">居左
						<input type="radio" name="line.legendX" <s:if test="#request.line.legendX=='center'">checked</s:if> value="center">居中			
						<input type="radio" name="line.legendX" <s:if test="#request.line.legendX=='right'">checked</s:if> value="right">居右							
					</td>
				</tr>
				<tr>
					<td width="30%">图例说明的垂直位置</td>
					<td>
						<input type="radio" name="line.legendY" <s:if test="#request.line.legendY=='left'">checked</s:if> value="top">顶部
						<input type="radio" name="line.legendY" <s:if test="#request.line.legendY=='middle'">checked</s:if> value="middle">居中			
						<input type="radio" name="line.legendY" <s:if test="#request.line.legendY=='bottom'">checked</s:if> value="bottom">底部							
					</td>
				</tr>
				<tr>
					<td width="30%">鼠标指上时是否显示提示信息</td>
					<td>
						<input type="radio" name="line.tooltipTrigger" <s:if test="#request.line.tooltipTrigger=='axis'">checked</s:if> value="axis">显示
						<input type="radio" name="line.tooltipTrigger" <s:if test="#request.line.tooltipTrigger=='none'">checked</s:if> value="none">不显示
					</td>
				</tr>
				<tr>
					<td width="30%">线上每个点是否显示数值</td>
					<td>
						<input type="radio" name="line.seriesLabelShow" <s:if test="#request.line.seriesLabelShow==1">checked</s:if> value="true">显示
						<input type="radio" name="line.seriesLabelShow" <s:if test="#request.line.seriesLabelShow==0">checked</s:if> value="false">不显示				
					</td>
				</tr>
				<tr>
					<td width="30%">线上每个点显示数值的位置</td>
					<td>
						<input type="radio" name="line.seriesLabelPosition" <s:if test="#request.line.seriesLabelPosition=='top'">checked</s:if> value="top">上
						<input type="radio" name="line.seriesLabelPosition" <s:if test="#request.line.seriesLabelPosition=='bottom'">checked</s:if> value="bottom">下
						<input type="radio" name="line.seriesLabelPosition" <s:if test="#request.line.seriesLabelPosition=='left'">checked</s:if> value="left">左
						<input type="radio" name="line.seriesLabelPosition" <s:if test="#request.line.seriesLabelPosition=='right'">checked</s:if> value="right">右
					</td>
				</tr>
				<tr id="isSeriesAreaStyleTr">
					<td width="30%">是否叠加图</td>
					<td id="isSeriesAreaStyle">
						<input type="radio" name="line.seriesAreaStyle" <s:if test="#request.line.seriesAreaStyle==0">checked</s:if> value="false">否
						&nbsp;
						<input type="radio" name="line.seriesAreaStyle" <s:if test="#request.line.seriesAreaStyle==1">checked</s:if> value="true">是
					</td>
				</tr>
				<s:if test="#request.line.seriesAreaStyle==1">
				<c:forEach items="${line.lineDatas}" var="lineDatas" varStatus="status">
				<c:if test="${lineDatas.isLineDataCol eq '1'}">
					<tr class='thisTrSeriesAreaStyleColor'>
						<td width='30%'><c:out value="${lineDatas.name}" />叠加图颜色</td>
						<td><input type="text" class="seriesAreaStyleColor"  name="line.lineDatas[<c:out value='${status.index}'/>].seriesAreaStyleColor" value="<c:out value='${lineDatas.seriesAreaStyleColor}'/>"></td>
			       </tr>
			       </c:if>
			   </c:forEach>
			   </s:if> 
				
				<tr>
					<td width="30%">指示线样式</td>
					<td>
						<input type="radio" name="line.tooltipAxisPointer" <s:if test="#request.line.tooltipAxisPointer=='line'">checked</s:if> value="line">线式
						<input type="radio" name="line.tooltipAxisPointer" <s:if test="#request.line.tooltipAxisPointer=='cross'">checked</s:if> value="cross">交叉式
					</td>
				</tr>
				<tr>
					<td width="30%">是否显示x轴分隔线</td>
					<td>
						<input type="radio" name="line.xAxisSplitLine" <s:if test="#request.line.xAxisSplitLine==0">checked</s:if> value="false">否
						&nbsp;
						<input type="radio" name="line.xAxisSplitLine" <s:if test="#request.line.xAxisSplitLine==1">checked</s:if> value="true">是
					</td>
				</tr>
				<tr>
					<td width="30%">x轴分隔线颜色</td>
					<td><input type="text" name="line.xAxisSplitLineColor" class="setColorSelect" value="<c:out value='${line.xAxisSplitLineColor}'/>"  value="20" /></td>
				</tr>
				<tr>
					<td width="30%">是否显示y轴分隔线</td>
					<td>
						<input type="radio" name="line.yAxisSplitLine" <s:if test="#request.line.yAxisSplitLine==0">checked</s:if> value="false">否
						&nbsp;
						<input type="radio" name="line.yAxisSplitLine" <s:if test="#request.line.yAxisSplitLine==1">checked</s:if> value="true">是
					</td>
				</tr>
				<tr>
					<td width="30%">y轴分隔线颜色</td>
					<td><input type="text" name="line.yAxisSplitLineColor" class="setColorSelect"  value="<c:out value='${line.yAxisSplitLineColor}'/>" /></td>
				</tr>
				<tr>
					<td width="30%">y轴显示文本后追加的文字</td>
					<td><input type="text" name="line.yAxisAxisLabelFormatter" value="<c:out value='${line.yAxisAxisLabelFormatter}'/>" /></td>
				</tr> 
				<tr>
					<td width="30%">是否显示最小值标线</td>
					<td>
						<input type="radio" name="line.markLineMin" <s:if test="#request.line.markLineMin==0">checked</s:if> value="false">否
						&nbsp;
						<input type="radio" name="line.markLineMin" <s:if test="#request.line.markLineMin==1">checked</s:if> value="true">是
					</td>
				</tr>		
				<tr>
					<td width="30%">最小值标线颜色</td>
					<td><input type="text" name="line.markLineMinColor" class="setColorSelect" value="<c:out value='${line.markLineMinColor}'/>" /></td>
				</tr> 
				<tr>
					<td width="30%">是否显示最大值标线</td>
					<td>
						<input type="radio" name="line.markLineMax" <s:if test="#request.line.markLineMax==0">checked</s:if> value="false">否
						&nbsp;
						<input type="radio" name="line.markLineMax" <s:if test="#request.line.markLineMax==1">checked</s:if> value="true">是
					</td>
				</tr>		
				<tr>
					<td width="30%">最大值标线颜色</td>
					<td><input type="text" name="line.markLineMaxColor" class="setColorSelect" value="<c:out value='${line.markLineMaxColor}'/>" /></td>
				</tr> 
				<tr>
					<td width="30%">是否显示平均值标线</td>
					<td>
						<input type="radio" name="line.markLineAverage" <s:if test="#request.line.markLineAverage==0">checked</s:if> value="false">否
						&nbsp;
						<input type="radio" name="line.markLineAverage" <s:if test="#request.line.markLineAverage==1">checked</s:if> value="true">是
					</td>
				</tr>		
				<tr>
					<td width="30%">平均值标线颜色</td>
					<td><input type="text" name="line.markLineAverageColor" class="setColorSelect" value="<c:out value='${line.markLineAverageColor}'/>" /></td>
				</tr> 
				<tr>
					<td width="30%">坐标系与画布顶部边距(可填百分比或绝对值)</td>
					<td><input type="text" name="line.gridTop" class="isPercentOrNum"  value="<c:out value='${line.gridTop}'/>"  /></td>
				</tr>
				<tr>
					<td width="30%">坐标系与画布底部边距(可填百分比或绝对值)</td>
					<td><input type="text" name="line.gridBottom" class="isPercentOrNum" value="<c:out value='${line.gridBottom}'/>"  /></td>
				</tr>
				<tr>
					<td width="30%">坐标系与画布左边距(可填百分比或绝对值)</td>
					<td><input type="text" name="line.gridLeft" class="isPercentOrNum" value="<c:out value='${line.gridLeft}'/>"  /></td>
				</tr>
				<tr>
					<td width="30%">坐标系与画布右边距(可填百分比或绝对值)</td>
					<td><input type="text" name="line.gridRight" class="isPercentOrNum" value="<c:out value='${line.gridRight}'/>" /></td>
				</tr>
			</table>
		</div>
		</div>
	</div>
	
</form>
</body>