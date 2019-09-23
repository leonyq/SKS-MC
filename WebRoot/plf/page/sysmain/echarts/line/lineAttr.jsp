<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<head>
<title><dict:lang value="部门信息列表" />
</title>
<%@ include file="/plf/common/pub_meta.jsp"%>
<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="popDivWinFp" value="1" />
	<jsp:param name="chosen" value="1" />
	<jsp:param name="spectrum" value="1" />
	<jsp:param name="popDivWin" value="1" />
</jsp:include>
<title></title>

<style type="text/css">
table td{word-break:break-all;
		} 
.all{
  height: 575px;
  overflow-y:auto;
}
</style>
<script type="text/javascript" src="${path}/plf/page/sysmain/echarts/js/chartsComm.js?_mc_res_version=<%=PlfStaticRes.CHARTSCOMM_JS %>"></script>
<script type="text/javascript">

$(function(){
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
function getFieldBySql(configTr,colTitle){
	var db_sql = document.getElementById(db_dialect+"_sql");
	var val2 = db_sql.value;
	if(val.isBlank(db_sql)){
		db_sql = configTr=="dataConfigTr"?document.getElementById("comm_sql"):document.getElementById("line_comm_sql");
		val2 = db_sql.value;
		if(val.isBlank(db_sql)){
		   	_alertValMsg(db_sql,"<dict:lang value="SQL语句" /> -- <dict:lang value="不能为空" />");
		   	return false;
		}
	}
	var url = "${path}sys/BussModelAction_getFields.ms";
	util.showLoading("处理中...");
	$.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: "paraMap."+db_dialect+"="+val2.replace("?","%3F"),
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
				//util.alert("error:"+msg);
				util.alert("error:"+msg.responseText);
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
				util.closeLoading();
				util.alert("error:"+msg);
		  }
		});
	return false;
	
}

function setFieldData(aList,configTr,colTitle){
	var arr = [];
	var lastTr = $("#"+colTitle);
	var arrColorCount = [];
	for(var i = 0;i < aList.length; i++){
		arr.push("<tr class="+configTr+">");
		if(configTr=="dataConfigTr"){
			arr.push("<td><input type='text' name='bar.barDatas["+i+"].name' value="+aList[i].filedName+"></td>");
			arr.push("<td><input type='text' name='bar.barDatas["+i+"].asName' value="+aList[i].filedName+"></td>");
			arr.push("<td><input type='text' name='bar.barDatas["+i+"].stackCategory' ></td>");
			arr.push("<input type='hidden'  value="+(i+1)+" name='bar.barDatas["+i+"].id'/>");
			arr.push("<input type='hidden'  value="+(i+1)+" name='bar.barPointDatas["+i+"].id'/>");
			arr.push("<td><input type='text' id='color1_"+i+"' value='#000000' name='bar.barPointDatas["+i+"].color1'/></td>");
			arr.push("<td><input type='text' id='color2_"+i+"' value='#000000' name='bar.barPointDatas["+i+"].color2'/></td>");
			arr.push("<td><select name='bar.barDatas["+i+"].isBarDataCol' ><option value='2'>否</option><option value='1'>是</option></select></td>");
		}else{
			arr.push("<td><input type='text' name='bar.lineDatas["+i+"].name' value="+aList[i].filedName+"></td>");
			arr.push("<td><input type='text' name='bar.lineDatas["+i+"].asName' value="+aList[i].filedName+"></td>");
			arr.push("<td><input type='text' name='bar.lineDatas["+i+"].pointDatas["+i+"].isMarkPointImageShow' ></td>");
			arr.push("<td><input type='text'  name='bar.lineDatas["+i+"].pointDatas["+i+"].markPointImageUrl'/></td>");
			arr.push("<td><input type='text'  name='bar.lineDatas["+i+"].pointDatas["+i+"].markPointSize'/></td>");
			arr.push("<td><select name='bar.lineDatas["+i+"].isLineDataCol' ><option value='2'>否</option><option value='1'>是</option></select></td>");
		}
		arr.push("</tr>");
		arrColorCount[i] = i;
	}
	$("."+configTr).remove();
	lastTr.after(arr.join(""));
	if(arrColorCount.length>0){
		for(var atr in arrColorCount){
			setColor($("#color1_"+atr));
			setColor($("#color2_"+atr));
		};
	};
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
		var jsonSourceFun = $("#jsonSourceFun").val();
		if(jsonSourceFun!=""){
			var url = "${path}charts/lineAction_getJsonData.ms";
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
			var url = "${path}charts/lineAction_getJsonData.ms";
			eval(jsonSourceFun);
		};
	}
});


$("input[name='lineCodeType']").change(function(){
	var lineCodeType = $(this).val();
	if(lineCodeType == "comm"){
		$("#comm_sql").show();
		$("#oracle_sql,#sqlserver_sql,#mysql_sql").hide();
	}else if(lineCodeType == "oracle"){
		$("#oracle_sql").show();
		$("#comm_sql,#sqlserver_sql,#mysql_sql").hide();
	}else if(lineCodeType == "sqlserver"){
		$("#sqlserver_sql").show();
		$("#comm_sql,#oracle_sql,#mysql_sql").hide();
	}else{
		$("#mysql_sql").show();
		$("#comm_sql,#oracle_sql,#sqlserver_sql").hide();
	};
});

$("input[name='lineCodeType']").change(function(){
	var lineCodeType = $(this).val();
	if(lineCodeType == "comm"){
		$("#line_comm_sql").show();
		$("#line_oracle_sql,#line_sqlserver_sql,#line_mysql_sql").hide();
	}else if(lineCodeType == "oracle"){
		$("#line_oracle_sql").show();
		$("#line_comm_sql,#line_sqlserver_sql,#line_mysql_sql").hide();
	}else if(lineCodeType == "sqlserver"){
		$("#line_sqlserver_sql").show();
		$("#line_comm_sql,#line_oracle_sql,#line_mysql_sql").hide();
	}else{
		$("#line_mysql_sql").show();
		$("#line_comm_sql,#line_oracle_sql,#line_sqlserver_sql").hide();
	};
});


var markLineDatasCount = 0;
$("#addMarkLineDatas").click(function(){
	//<td><input type="text" name="bar.markLineDatas[0].name" value=""></td>
	var markLineDatas = "<tr>"
					  + "<td style=\"text-align: center;\"><input type=\"checkbox\" name=\"markLineDatasCheckbox\" ></td>"
					  + "<td><input type=\"text\" class=\"markLineName\"  name=\"bar.markLineDatas["+markLineDatasCount+"].name\" value=\"\"></td>"
					  + "<td><input type=\"text\" class=\"markLineyAxis\" name=\"bar.markLineDatas["+markLineDatasCount+"].yAxis\" value=\"\"></td>"
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
		 utilsFp.confirmIcon(3,"","","", "请选择一条数据！","","260","145");
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
		$(".line,.lineSql,.lineJavaClass,.lineJsonStr").hide();
	};
});
setColor($("#lineDatasColor"));
});

function addBarAttr(thisObj){
	var chartsType = $("#CHARTS_TYPE").val();
	$("#chartsType").val(chartsType);
	var chartsDataSources = $("#CHARTS_DATA_SOURCES").val();
	$("#chartsDataSources").val(chartsDataSources);
	var isLine = $("#isLine").val();
	if(chartsDataSources == "1"){
		var lineCodeType = $("input[name='bar.lineCodeType']:checked").val();
		var barTxt = $("."+lineCodeType).val();
		if(barTxt == ""){
			_alertValMsg($("."+lineCodeType),"<dict:lang value="数据源不能为空" />");
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
		var lineJavaClass = $("#lineJavaClass").val();
		if(lineJavaClass == ""){
			_alertValMsg($("#lineJavaClass"),"<dict:lang value="数据源不能为空" />");
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
	document.forms.addBarCharts.submit();
}


function showEditCode(source){
	var url;
	if(source=='bar'){
		var lineJavaClass = $("#lineJavaClass").val();
		var lineCodeType = $("#lineCodeType").val();
		var lineClsCode = $("#lineClsCode").val();
		var lineClsCodeId = $("#lineClsCodeId").val();
	    url = "${path}charts/lineAction_cfgClsCode.ms?paraMap.CLASS_NAME="+lineJavaClass+"&paraMap.codeType="+lineCodeType
				+"&paraMap.clsCode="+lineClsCode+"&paraMap.lineClsCodeId="+lineClsCodeId+"&paraMap.source="+source;
	}else{
		var lineJavaClass = $("#lineJavaClass").val();
		var lineJavaCodeType = $("#lineCodeType").val();
		var lineJavaClsCode = $("#lineClsCode").val();
		var lineJavaClsCodeId = $("#lineClsCodeId").val();
	    url = "${path}charts/lineAction_cfgClsCode.ms?paraMap.CLASS_NAME="+lineJavaClass+"&paraMap.codeType="+lineJavaCodeType
				+"&paraMap.clsCode="+lineJavaClsCode+"&paraMap.CODE_ID="+lineJavaClsCodeId+"&paraMap.source="+source;
	}
	showPopWin(url, "99%", "99%",null,"<dict:lang value="修改类源码"/>");
}
</script>

</head>
<body>
<form id="addForm" name="addForm" action="${path}charts/lineAction_doAdd.ms" method="post" >
	<div class="all">
		
	    	
	    	 <div class="dataSource">
            <h3>数据源</h3>
            <table border='1'>
                <tr class="sql">
                    <td rowspan="2">SQL语句<span class="Eng">*</span></td>
                    <td colspan="5">数据库适配：
                        <label><input type="radio" name="line.lineCodeType" value="commql" id="codeType_comm" checked="checked">通用语句</label>
                        <label><input type="radio" name="line.lineCodeType" value="oracle" id="codeType_oracle" >ORACLE</label>
                        <label><input type="radio" name="line.lineCodeType" value="sqlserver" id="codeType_sqlserver" >SQLSERVER</label>
                        <label><input type="radio" name="line.lineCodeType" value="mysql" id="codeType_mysql" >MYSQL</label>
                    </td>
                </tr> 
                <tr class="sql">
                    <td colspan="5">
                        <textarea id="comm_sql" class="commql" name="line.comm"  rows="6"></textarea>
						<textarea id="oracle_sql" class="oracle" name="line.oracle" rows="6" style="display: none;"></textarea>
						<textarea id="sqlserver_sql" class="sqlserver" name="line.sqlserver" rows="6" style="display: none;"></textarea>
						<textarea id="mysql_sql" class="mysql" name="line.mysql" rows="6" style="display: none;"></textarea>
                    </td>  
                </tr>
                <tr class="javaClass">
                    <td>JAVA类<span class="Eng">*</span></td>
                    <td colspan="4">
                    <input type="text" name="line.javaClass" class="_VAL_NULL" id="lineJavaClass">
                    <input type="hidden" name="line.javaCodeType" id="lineCodeType">
                    <input type="hidden" name="line.javaClsCode" value="" id="lineClsCode">
                     <input type="hidden" name="line.javaClsCodeId" id="lineClsCodeId">
                    </td>
                    <td>
					<a href="javascript:void(0);" id="lineJavaClassText" onclick="showEditCode();">
						<dict:lang value="新增" />
					</a>
                    </td>
                </tr>
               <tr class="jsonStr">
                    <td>JSON字符串<span class="Eng">*</span></td>
                    <td colspan="5">
                    <textarea name="line.jsonSourceFun" class="_VAL_NULL" id="jsonSourceFun"></textarea></td>
                    <%--<input type='text' name="line.JsonStr" >--%>
                </tr>
                
                	<tr >
						<td >
							<dict:lang value="字段显示别名" />
						</td>
						<td colspan="5">
							<input type="button" id="getFieldBtn" class="botton_img_search" value="<dict:lang value="获取字段" />"
							  style="width: 70px;" title="<dict:lang value="只能获取当前类型数据库语句"/>"  />
							
							<table class="table_list"  style="margin-top:5px;margin-bottom:5px;margin-right:5px;">
								<thead>
									<tr >
										<th width="20%"><dict:lang value="版块名称" /></th>
										<th width="10%"><dict:lang value="版块颜色" /></th>
									</tr>
								</thead>
								<tbody>
								   <tr id="colTitle">
									
									</tr>
								</tbody>
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
					<td><input type="text" name="chartsConfig.titleText" style="width:95%" /></td>
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
					<td><input type="text" name="chartsConfig.titleTextColor" style="width:95%" value="#000000" /></td>
				</tr>
				<tr>
					<td width="30%">标题字号</td>
					<td><input type="text" name="chartsConfig.titleTextFontSize" style="width:95%" value="15" /></td>
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
					<td><input type="text" name="chartsConfig.titleSubtext" style="width:95%" /></td>
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
					<td><input type="text" name="chartsConfig.titleSubtextColor" style="width:95%" value="#cccccc" /></td>
				</tr>
				<tr>
					<td width="30%">副标题字号</td>
					<td><input type="text" name="chartsConfig.titleSubtextFontSize" style="width:95%" value="12" /></td>
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
					<td><input type="text" name="chartsConfig.canvasWidth" style="width:95%" value="600" /></td>
				</tr>
				<tr>
					<td width="30%">画布高度(像素绝对值)</td>
					<td><input type="text" name="chartsConfig.canvasHeight" style="width:95%" value="600" /></td>
				</tr>
				<tr>
					<td width="30%">是否显示加载动画</td>
					<td>
						<input type="radio" name="chartsConfig.animation" checked value="1">显示
						<input type="radio" name="chartsConfig.animation" value="2">不显示
					</td>
				</tr>	
				<tr>
					<td width="30%">饼图点击事件</td>
					<td><input type="text" name="chartsConfig.eventClick" style="width:95%" /></td>
				</tr>
				<tr>
					<td width="30%">背景图url</td>
					<td><input type="text" name="chartsConfig.backgroundUrl" style="width:95%" /></td>
				</tr>
				<tr>
					<td width="30%">背景图透明度(100为完全不透明,0为完全透明)</td>
					<td><input type="text" name="chartsConfig.backgroundAlpha" style="width:95%" value="100" /></td>
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
					<td><input type="text" name="line.legendLength" style="width:95%" /></td>
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
				<tr>
					<td width="30%">是否叠加图</td>
					<td>
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
					<td><input type="text" name="line.xAxisSplitLineColor" style="width:95%" value="20" /></td>
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
					<td><input type="text" name="line.yAxisSplitLineColor" style="width:95%" value="20" /></td>
				</tr>
				<tr>
					<td width="30%">y轴显示文本后追加的文字</td>
					<td><input type="text" name="line.yAxisAxisLabelFormatter" style="width:95%" /></td>
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
					<td><input type="text" name="line.markLineMinColor" style="width:95%" /></td>
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
					<td><input type="text" name="line.markLineMaxColor" style="width:95%" /></td>
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
					<td><input type="text" name="line.markLineAverageColor" style="width:95%" /></td>
				</tr> 
				<tr>
					<td width="30%">坐标系与画布顶部边距(可填百分比或绝对值)</td>
					<td><input type="text" name="line.gridTop" style="width:95%" value="20" /></td>
				</tr>
				<tr>
					<td width="30%">坐标系与画布底部边距(可填百分比或绝对值)</td>
					<td><input type="text" name="line.gridBottom" style="width:95%" value="20" /></td>
				</tr>
				<tr>
					<td width="30%">坐标系与画布左边距(可填百分比或绝对值)</td>
					<td><input type="text" name="line.gridLeft" style="width:95%" value="20" /></td>
				</tr>
				<tr>
					<td width="30%">坐标系与画布右边距(可填百分比或绝对值)</td>
					<td><input type="text" name="line.gridRight" style="width:95%" value="20" /></td>
				</tr>
			</table>
		<%--
	--%></div>
     </div>
			</div>
			<div style="text-align: center;"><button type="button" onclick="addlineAttr(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button> </div>
			</form>
</body>