<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<head>
<title><dict:lang value="饼图新增配置" />
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
<script type="text/javascript" src="${path}/plf/page/sysmain/echarts/js/chartsComm.js?_mc_res_version=<%=PlfStaticRes.CHARTSCOMM_JS %>"></script>
<script type="text/javascript">

$(function(){
	setColor($(".setColorSelect"));
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
		if(chartsDataSources=="1"){// sql查询
			$(".sql").show();
			$(".javaClass,.jsonStr").hide();
		}else if(chartsDataSources=="2"){// java类
			$(".javaClass").show();
			$(".sql,.jsonStr").hide();
		}else{//json串
			$(".jsonStr").show();
			$(".sql,.javaClass").hide();
		}
	});	
var db_dialect="<s:property value="@com.more.fw.core.common.method.CommMethodMc@getCUR_DB_DIALECT()"/>";
function getFieldBySql(configTr,colTitle){
	var db_sql2 = document.getElementById(db_dialect+"_sql");
	var val2 = db_sql2.value;
	var db_sql3 = document.getElementById("comm_sql");
	var val3 = db_sql3.value;
	if(val.isBlank(val2)&&val.isBlank(val3)){
		var lineCodeType = $("input[name='pie.pieCodeType']:checked").val();
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
	var url = "${path}charts/pieAction_getFields.ms";
	util.showLoading("处理中...");
	$.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: "paraMap."+db_dialect+"="+val2.replace("?","%3F"),
		success: function(data){
				util.closeLoading();
				if(data){
					setFieldData(data,configTr,colTitle);
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
	var pieClsCodeId = $("#pieClsCodeId").val();
	if(pieClsCodeId ==""){
		_alertValMsg($("#pieJavaClass"),"<dict:lang value="JAVA类不能为空" />");
		return;
	}
	var url = "${path}charts/pieAction_getJavaDataFields.ms";
	util.showLoading("处理中...");
	$.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: "paraMap.pieClsCodeId="+pieClsCodeId,
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
			arr.push("<td><input type='text' name='pie.pieDatas[0].piePointDatas["+i+"].name' value="+aList[i].PIENAME+"></td>");
			arr.push("<td><input type='text' id='color1_"+i+"' value='#000000' name='pie.pieDatas[0].piePointDatas["+i+"].color'></td>");
			arr.push("<input type='hidden' value="+aList[i].VAL+"  name='pie.pieDatas[0].piePointDatas["+i+"].value'>");
		}
		arr.push("</tr>");
		arrColorCount[i] = i;
	}
	$("."+configTr).remove();
	lastTr.html(arr.join(""));
	if(arrColorCount.length>0){
		for(var atr in arrColorCount){
			setColor($("#color1_"+atr));
		};
	};
}

$("#getFieldBtn").click(function(){
	var chartsDataSources = $("#CHARTS_DATA_SOURCES").val();
	if(chartsDataSources == "1"){
		getFieldBySql("dataConfigTr","colTitle");
	}else if(chartsDataSources == "2"){
		getFieldByJava("dataConfigTr","colTitle");
	}else{
		var jsonSourceFun = $("#jsonSourceFun").val();
		if(jsonSourceFun!=""){
			var url = "${path}charts/pieAction_getJsonData.ms";
			eval(jsonSourceFun);
		}else{
			_alertValMsg($("#jsonSourceFun"),"<dict:lang value="函数体不能为空" /> -- <dict:lang value="不能为空" />");
			return false;
		}
	};
});

function getJsonDataFields(data,flag){
	if(data){
		 setFieldData(data,"dataConfigTr","colTitle");
	};
}

$("input[name='pie.pieCodeType']").change(function(){
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
});

function addPieAttr(thisObj){
	var chartsType = $("#CHARTS_TYPE").val();
	$("#chartsType").val(chartsType);
	var chartsDataSources = $("#CHARTS_DATA_SOURCES").val();
	$("#chartsDataSources").val(chartsDataSources);
	if(chartsDataSources == "1"){
		var barCodeType = $("input[name='pie.pieCodeType']:checked").val();
		var barTxt = $("."+barCodeType).val();
		if(barTxt == ""){
			_alertValMsg($("."+barCodeType),"<dict:lang value="数据源不能为空" />");
			return;
		};
	}else if(chartsDataSources == "2"){
		var pieJavaClass = $("#pieJavaClass").val();
		if(pieJavaClass == ""){
			_alertValMsg($("#pieJavaClass"),"<dict:lang value="数据源不能为空" />");
			return;
		};
	}else{
		var jsonSourceFun = $("#jsonSourceFun").val();
		if(jsonSourceFun == ""){
			_alertValMsg($("#jsonSourceFun"),"<dict:lang value="数据源不能为空" />");
			return;
		};
	}
	
	
	if($("#pieName tbody tr").length==1){
		alert("请先获取字段!");
		return;
	}
	
	if(!isBlank()){
		return ;
	};
	
	if(!valIsNum()){
		return ;
	}
	
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
            url: "${path}charts/pieAction_cacheAdd.ms",
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
		document.forms.addForm.submit();
	}
}

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

function showEditCode(){
	var pieJavaClass = $("#pieJavaClass").val();
	var pieCodeType = $("#pieCodeType").val();
	var pieClsCode = $("#pieClsCode").val();
	var pieClsCodeId = $("#pieClsCodeId").val();
	var popWinframeId = window.frameElement.id+"PopWin";
	var url = "${path}charts/pieAction_cfgClsCode.ms?paraMap.CLASS_NAME="+pieJavaClass+"&paraMap.codeType="+pieCodeType
			/* +"&paraMap.clsCode="+pieClsCode */+"&paraMap.CODE_ID="+pieClsCodeId+"&paraMap.piframeName="+window.frameElement.id
			+"&paraMap.piframeId="+window.frameElement.id+"&paraMap.popWinframeId="+popWinframeId;
	showPopWinFp(url, $(top.document).width()*0.90, $(top.document).height()*0.90,null,"<dict:lang value="修改类源码"/>",popWinframeId);
}
</script>
</head>
<body>
<button type="button" class="_save" onclick="addPieAttr(this);"><i class="ico"></i><dict:lang value="保存" /></button> 
<form id="addForm" name="addForm" action="${path}charts/pieAction_doAdd.ms" method="post" >
	<div class="all">
	    	  <input type="hidden" id ="chartsDataSources"  name="chartsConfig.chartsDataSources"  />
             <input type="hidden" id ="chartsType"  name="chartsConfig.chartsType"  />
           <div class="dataSource">
            <h3>数据源</h3>
            <table border='1'>
                <tr class="sql">
                    <td>SQL语句<span class="Eng">*</span></td>
                    <td colspan="5" style="padding:5px;">数据库适配：
                        <label><input type="radio" name="pie.pieCodeType" value="commql" id="codeType_comm" checked="checked">通用语句</label>
                        <label><input type="radio" name="pie.pieCodeType" value="oracle" id="codeType_oracle" >ORACLE</label>
                        <label><input type="radio" name="pie.pieCodeType" value="sqlserver" id="codeType_sqlserver" >SQLSERVER</label>
                        <label><input type="radio" name="pie.pieCodeType" value="mysql" id="codeType_mysql" >MYSQL</label>
                        <label><input type="radio" name="pie.pieCodeType" value="pgsql" id="codeType_pgsql" >PGSQL</label>
                        <textarea id="comm_sql" class="commql" name="pie.comm"  rows="6" style="margin-top: 5px;height:200px;"></textarea>
						<textarea id="oracle_sql" class="oracle" name="pie.oracle" rows="6" style="display: none;margin-top: 5px;height:200px;"></textarea>
						<textarea id="sqlserver_sql" class="sqlserver" name="pie.sqlserver" rows="6" style="display: none;margin-top: 5px;height:200px;"></textarea>
						<textarea id="mysql_sql" class="mysql" name="pie.mysql" rows="6" style="display: none;margin-top: 5px;height:200px;"></textarea>
						<textarea id="pg_sql" class="pgsql" name="pie.pgsql" rows="6" style="display: none;margin-top: 5px;height:200px;"></textarea>
                    </td>
                </tr> 
               
                <tr class="javaClass">
                    <td>JAVA类<span class="Eng">*</span></td>
                    <td colspan="4">
                    <input type="text" name="pie.javaClass" class="_VAL_NULL" id="pieJavaClass">
                    <input type="hidden" name="pie.javaCodeType" id="pieCodeType">
                    <input type="hidden"  value="" id="pieClsCode">
                     <input type="hidden" name="pie.javaClsCodeId" id="pieClsCodeId">
                    </td>
                    <td>
					<a href="javascript:void(0);" id="pieJavaClassText" onclick="showEditCode();">
						<dict:lang value="新增" />
					</a>
                    </td>
                </tr>
               <tr class="jsonStr">
                    <td>JSON字符串<span class="Eng">*</span></td>
                    <td colspan="5">
                    <textarea name="pie.jsonSourceFun" class="_VAL_NULL" id="jsonSourceFun"></textarea></td>
                    <%--<input type='text' name="pie.JsonStr" >--%>
                </tr><%--
                
                	<tr >
						<td >
							<dict:lang value="字段显示别名" />
						</td>
						<td colspan="5">
							<input type="button" id="getFieldBtn" class="botton_img_search _get" value="<dict:lang value="获取字段" />"
							   title="<dict:lang value="只能获取当前类型数据库语句"/>" />
							
								<table class="table_list" border='1' id="pieName" style="margin-top:5px;margin-bottom:5px;margin-right:5px;table-layout:fixed;">
								<thead>
									<tr >
										<th style="width:50%"><dict:lang value="版块名称" /></th>
										<th style="width:50%"><dict:lang value="版块颜色" /></th>
									</tr>
								</thead>
								<tbody id="colTitle">
								  
								</tbody>
							</table>
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
					<td><input type="text" name="chartsConfig.titleTextFontSize" class="isNum" value="15" /></td>
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
					<td><input type="text" class="setColorSelect" name="chartsConfig.titleSubtextColor"  value="#cccccc" /></td>
				</tr>
				<tr>
					<td width="30%">副标题字号</td>
					<td><input type="text" name="chartsConfig.titleSubtextFontSize" class="isNum"  value="12" /></td>
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
					<td><input type="text" name="chartsConfig.canvasWidth" class="isNum" value="600" /></td>
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
					<%--<input type="text" name="chartsConfig.eventClick"/>
					--%></td>
				</tr>
				<tr>
					<td width="30%">背景图url</td>
					<td><input type="text" name="chartsConfig.backgroundUrl"  /></td>
				</tr>
				<tr>
					<td width="30%">背景图透明度(100为完全不透明,0为完全透明)</td>
					<td><input type="text" name="chartsConfig.backgroundAlpha" class="isNum" value="100" /></td>
				</tr>
				 <input type="hidden" name="chartsConfig.type" value="1"/>
				<%-- *************************************************************************************************** --%>
				<%-- ************************************以上为公共属性配置********************************************** --%>
				<%-- *************************************************************************************************** --%>
				<tr>
					<td colspan="2" bgcolor="#eeeeee">&nbsp;</td>
				</tr>
				<tr>
					<td width="30%">是否南丁格尔玫瑰图</td>
					<td>
						<input type="radio" name="pie.roseShow" value="true">是
						<input type="radio" name="pie.roseShow" checked value="false">否
					</td>
				</tr>
				<tr>
					<td width="30%">图例说明的排列方式</td>
					<td>
						<input type="radio" name="pie.legendOrient" checked value="vertical">竖向排列
						<input type="radio" name="pie.legendOrient" value="horizontal">横向排列						
					</td>
				</tr>
				<tr>
					<td width="30%">图例说明的水平位置</td>
					<td>
						<input type="radio" name="pie.legendX" checked value="left">居左
						<input type="radio" name="pie.legendX" value="center">居中			
						<input type="radio" name="pie.legendX" value="right">居右							
					</td>
				</tr>
				<tr>
					<td width="30%">图例说明的垂直位置</td>
					<td>
						<input type="radio" name="pie.legendY" checked value="top">顶部
						<input type="radio" name="pie.legendY" value="middle">居中			
						<input type="radio" name="pie.legendY" value="bottom">底部							
					</td>
				</tr>
				<tr>
					<td width="30%">是否显示标签</td>
					<td>
						<input type="radio" name="pie.labelNormalShow" checked value="true">显示
						<input type="radio" name="pie.labelNormalShow" value="false">不显示
					</td>
				</tr>
				<tr>
					<td width="30%">标签内容</td>
					<td>
						<input type="checkbox" name="pie.labelFormatterC" checked value="true">分类数值
						&nbsp;
						<input type="checkbox" name="pie.labelFormatterD" checked value="true">分类百分比
					</td>
				</tr>
				<tr>
					<td width="30%">鼠标指上时是否显示提示信息</td>
					<td>
						<input type="radio" name="pie.tooltipTrigger" checked value="item">显示
						<input type="radio" name="pie.tooltipTrigger" value="none">不显示
					</td>
				</tr>
				<tr>
					<td width="30%">提示信息上的标题</td>
					<td><input type="text" name="pie.seriesName" /></td>
				</tr> 
				<tr>
					<td width="30%">饼图圆心x轴位置(可填页面百分比或坐标绝对值)</td>
					<td><input type="text" name="pie.seriesCenterX" class="isPercentOrNum" /></td>
				</tr>
				<tr>
					<td width="30%">饼图圆心y轴位置(可填页面百分比或坐标绝对值)</td>
					<td><input type="text" name="pie.seriesCenterY" class="isPercentOrNum"  /></td>
				</tr>			
			</table>
			</div>
			</div>	</div>
			

 </form>
</body>