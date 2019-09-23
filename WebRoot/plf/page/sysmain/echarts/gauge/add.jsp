<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<head>
<title><dict:lang value="仪表图新增配置" />
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
    	var isGauge = $("#isGauge").val();
		if(chartsDataSources=="1"){// sql查询
			$(".GaugeSql").show();
			$(".gaugeJavaClass,.GaugeJsonStr").hide();
		}else if(chartsDataSources=="2"){// java类
			$(".gaugeJavaClass").show();
			$(".GaugeSql,.GaugeJsonStr").hide();
		}else{//json串
			$(".GaugeJsonStr").show();
			$(".GaugeSql,.gaugeJavaClass").hide();
		}
	});	

var traxisLinesDatasCount = 1;
$("#addAxisLinesDatas").click(function(){
	var traxisLinesDatas = "<tr>"
						 + "<td><input type=\"text\"  class=\"percent\" name=\"gauge.gaugeDatas[0].axisLines["+traxisLinesDatasCount+"].percent\" value=\"\"></td>"
						 + "<td><input type=\"text\"  class=\"color isColor_"+traxisLinesDatasCount+"\" name=\"gauge.gaugeDatas[0].axisLines["+traxisLinesDatasCount+"].color\" value=\"#000000\"></td>"
						 + "<td style='text-align:center;'><input type=\"button\" class=\"delAxisLinesDatas\" value=\"删除\" /></td>"
						 + "</tr>";
	$("#axisLinesDatas").append(traxisLinesDatas);
	setColor($(".isColor_"+traxisLinesDatasCount));
	traxisLinesDatasCount++;
});

$(".delAxisLinesDatas").live("click",function(){
	$(this).parent().parent().remove();
	$("#axisLinesDatas tr").each(function(index,item){
		$(this).find(".percent").attr("name","gauge.gaugeDatas[0].axisLines["+i+"].percent");
		$(this).find(".color").attr("name","gauge.gaugeDatas[0].axisLines["+i+"].color");
	});
	traxisLinesDatasCount--;
});

$("input[name='gauge.gaugeCodeType']").change(function(){
	var gaugeCodeType = $(this).val();
	if(gaugeCodeType == "comm"){
		$("#gauge_comm_sql").show();
		$("#gauge_oracle_sql,#gauge_sqlserver_sql,#gauge_mysql_sql,#gauge_pg_sql").hide();
	}else if(gaugeCodeType == "oracle"){
		$("#gauge_oracle_sql").show();
		$("#gauge_comm_sql,#gauge_sqlserver_sql,#gauge_mysql_sql,#gauge_pg_sql").hide();
	}else if(gaugeCodeType == "sqlserver"){
		$("#gauge_sqlserver_sql").show();
		$("#gauge_comm_sql,#gauge_oracle_sql,#gauge_mysql_sql,#gauge_pg_sql").hide();
	}else if(gaugeCodeType == "pgsql"){
		$("#gauge_pg_sql").show();
		$("#gauge_comm_sql,#gauge_oracle_sql,#gauge_mysql_sql,#gauge_sqlserver_sql").hide();
	}
	else{
		$("#gauge_mysql_sql").show();
		$("#gauge_comm_sql,#gauge_oracle_sql,#gauge_sqlserver_sql,#gauge_pg_sql").hide();
	};
});
setColor($(".isColor"));
});

function addGaugeAttr(thisObj){
	var chartsType = $("#CHARTS_TYPE").val();
	$("#chartsType").val(chartsType);
	var chartsDataSources = $("#CHARTS_DATA_SOURCES").val();
	$("#chartsDataSources").val(chartsDataSources);
	if(chartsDataSources == "1"){
		var gaugeCodeType = $("input[name='gauge.gaugeCodeType']:checked").val();
		var GaugeTxt = $("."+gaugeCodeType).val();
		if(GaugeTxt == ""){
			_alertValMsg($("."+gaugeCodeType),"<dict:lang value="数据源不能为空" />");
			return;
	   }
	}else if(chartsDataSources == "2"){
		var gaugeJavaClass = $("#gaugeJavaClass").val();
		if(gaugeJavaClass == ""){
			_alertValMsg($("#gaugeJavaClass"),"<dict:lang value="数据源不能为空" />");
			return;
		};
	}else{
		var GaugeJsonSourceFun = $("#GaugeJsonSourceFun").val();
		if(GaugeJsonSourceFun == ""){
			_alertValMsg($("#GaugeJsonSourceFun"),"<dict:lang value="数据源不能为空" />");
			return;
		};
	}
	if(!isNum()){
		return ;
	};
	
	if(!isBlank()){
		return ;
	};
	if(!valIsNum()){
		return ;
	}
	if(!isFloat()){
		return ;
	};
	if(!isPercent()){
		return ;
	};
	
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
            url: "${path}charts/gaugeAction_cacheAdd.ms",
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
setColor($(".setColorSelect"));
function isPercent(){
	var validates = true;
	$(".isPercent").each(function(index,item){
		var vals = $(this).val();
		if(!val.isPercent(vals)){
			_alertValMsg($(this),"<dict:lang value="数据格式错误" />");
			validates = false;
			return false;
		};
	});
	return validates;
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
	$(".isNumber").each(function(index,item){
		var vals = $(this).val();
		if(!val.isInt(vals)){
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

function isFloat(){
	var validates = true;
	$(".isFloat").each(function(index,item){
		var vals = $(this).val();
		if(!val.isFloat(vals)){
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

function isNum(){
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

function showEditCode(){
	var gaugeJavaClass = $("#gaugeJavaClass").val();
	var gaugeJavaCodeType = $("#gaugeCodeType").val();
	var gaugeJavaClsCode = $("#gaugeClsCode").val();
	var gaugeJavaClsCodeId = $("#gaugeClsCodeId").val();
	var popWinframeId = window.frameElement.id+"PopWin";
    var url = "${path}charts/gaugeAction_cfgClsCode.ms?paraMap.CLASS_NAME="+gaugeJavaClass+"&paraMap.codeType="+gaugeJavaCodeType
			/* +"&paraMap.clsCode="+gaugeJavaClsCode */+"&paraMap.CODE_ID="+gaugeJavaClsCodeId+"&paraMap.piframeName="+window.frameElement.id
			+"&paraMap.piframeId="+window.frameElement.id+"&paraMap.popWinframeId="+popWinframeId;
	showPopWinFp(url, $(top.document).width()*0.90, $(top.document).height()*0.90,null,"<dict:lang value="修改类源码"/>",popWinframeId);
}
</script>
</head>
<body>
<button type="button" onclick="addGaugeAttr(this);" class="_save"><i class="ico"></i><dict:lang value="保存" /></button> 
<form id="addForm" name="addForm" action="${path}charts/gaugeAction_doAdd.ms" method="post" >
	<div class="all">
		 <input type="hidden" id ="chartsDataSources"  name="chartsConfig.chartsDataSources"  />
             <input type="hidden" id ="chartsType"  name="chartsConfig.chartsType"  />
           <div class="dataSource">
            <h3>数据源</h3>
            <table border='1' id="leftTable">
                <tr class="sql">
                    <td>SQL语句</td>
                    <td colspan="5" style="padding:5px;">数据库适配：
                        <label><input type="radio" name="gauge.gaugeCodeType" value="commql" id="gauge_codeType_comm" checked="checked">通用语句</label>
                        <label><input type="radio" name="gauge.gaugeCodeType" value="oracle" id="gauge_codeType_oracle" >ORACLE</label>
                        <label><input type="radio" name="gauge.gaugeCodeType" value="sqlserver" id="gauge_codeType_sqlserver" >SQLSERVER</label>
                        <label><input type="radio" name="gauge.gaugeCodeType" value="mysql" id="gauge_codeType_mysql" >MYSQL</label>
                         <label><input type="radio" name="gauge.gaugeCodeType" value="pgsql" id="gauge_codeType_pgsql" >PGSQL</label>
                        <textarea id="gauge_comm_sql" class="commql" name="gauge.gaugeComm" rows="6" style="margin-top:5px;height:200px;"></textarea>
						<textarea id="gauge_oracle_sql" class="oracle" name="gauge.gaugeOracle" rows="6" style="display: none;margin-top:5px;height:200px;"></textarea>
						<textarea id="gauge_sqlserver_sql" class="sqlserver" name="gauge.gaugeSqlserver" rows="6" style="display: none;margin-top:5px;height:200px;"></textarea>
						<textarea id="gauge_mysql_sql" class="mysql" name="gauge.gaugeMysql" rows="6" style="display: none;margin-top:5px;height:200px;"></textarea>
						<textarea id="gauge_pg_sql" class="pgsql" name="gauge.gaugePgsql" rows="6" style="display: none;margin-top:5px;height:200px;"></textarea>
                    </td>
                </tr> 
                
                <tr class="javaClass">
                    <td>JAVA类</td>
                    
                      <td colspan="4">
                    <input type="text" name="gauge.gaugeJavaClass" id="gaugeJavaClass">
                    <input type="hidden" name="gauge.gaugeJavaCodeType" id="gaugeCodeType">
                    <input type="hidden"  id="gaugeClsCode">
                     <input type="hidden" name="gauge.gaugeJavaClsCodeId" id="gaugeClsCodeId">
                    </td>
                    <td>
							<a href="javascript:void(0);" id="gaugeJavaClassText" onclick="showEditCode();">
								<dict:lang value="新增" />
							</a>
                    </td>
                </tr>
               <tr class="jsonStr">
                    <td>JSON字符串</td>
                    <td colspan="5">
                     <textarea name="gauge.jsonGaugeSourceFun" id ="jsonGaugeSourceFun"></textarea>
                    </td>
                </tr>
					<tr >
						<td >
							<dict:lang value="分段数据" />
						</td>
						<td colspan="5">
							<table border="1" class="table_list"  style="margin-top:5px;margin-bottom:5px;margin-right:5px;">
								<thead>
									<tr>
										<th width="40%"><dict:lang value="数值" /></th>
										<th width="40%"><dict:lang value="颜色" /></th>
										<th width="20%"></th>
									</tr>
								</thead>
								<tbody id="axisLinesDatas">
								<tr>
								    <td><input type="text" class="isFloat"  name="gauge.gaugeDatas[0].axisLines[0].percent"  value=""></td>
  									<td><input type="text" class="isColor" name="gauge.gaugeDatas[0].axisLines[0].color"  value=""></td>
  									<td style="text-align:center;"><input type="button" id="addAxisLinesDatas" value="添加" /></td>
								</tr>
								</tbody>
							</table>
						</td>
					</tr>
					
					<tr>
					<td><dict:lang value='仪表盘数据配置' /></td>
					<td id="gaugeConfig" colspan='5'>
							<table border="1" class='table_list _config' 
								style='margin-top:5px;margin-bottom:5px;'>
								<thead></thead>
								<tbody>
									<tr>
										<td style="width: 100px;"><span>仪表名</span>
										</td>
										<td><input type='text' class="isBlank" name='gauge.gaugeDatas[0].name' value="测试1">
										</td>
										<td style="width: 100px;"><span>漂浮值</span>
										</td>
										<td><input type='text' class="isNum" name='gauge.gaugeDatas[0].z' value="3">
										</td>
									</tr>
									<tr>
										<td><span>最大值</span>
										</td>
										<td><input type='text' class="isFloat" name='gauge.gaugeDatas[0].max' value="150">
										</td>
										<td><span>最小值</span>
										</td>
										<td><input type='text' class="isFloat" name='gauge.gaugeDatas[0].min' value="0">
										</td>
									</tr>
									<tr>
										<td><span>刻度间隔值</span>
										</td>
										<td><input type='text'
											name='gauge.gaugeDatas[0].splitNumber' class="isNumber" value="10">
										</td>
										<td><span>仪表直径</span>
										</td>
										<td><input type='text'  name='gauge.gaugeDatas[0].radius' value="120">
										</td>
									</tr>

									<tr>
										<td><span>圆心X位置</span>
										</td>
										<td><input type='text'
											name='gauge.gaugeDatas[0].seriesCenterX' class="isPercent" value="30%">
										</td>
										<td><span>圆心Y位置</span>
										</td>
										<td><input type='text'
											name='gauge.gaugeDatas[0].seriesCenterY' class="isPercent" value="65%">
										</td>
									</tr>

									<tr>
										<td><span>仪表盘起始角度</span>
										</td>
										<td><input type='text'
											name='gauge.gaugeDatas[0].startAngle' class="isNumber" value="0">
										</td>
										<td><span>仪表盘结束角度</span>
										</td>
										<td><input type='text'
											name='gauge.gaugeDatas[0].endAngle' class="isNumber" value="300">
										</td>
									</tr>

									<tr>
										<td><span>仪表外框粗细</span>
										</td>
										<td><input type='text'
											name='gauge.gaugeDatas[0].axisLineWidth' value="8">
										</td>
										<td><span>是否显示小刻度</span>
										</td>
										<td>
										<select  name='gauge.gaugeDatas[0].axisTickShow' >
										<option value="true">是</option>
										<option value="false">否</option>
										</select>
										
										</td>
									</tr>
									<tr>
										<td><span>小刻度线的长度</span>
										</td>
										<td><input type='text'
											name='gauge.gaugeDatas[0].axisTickLength' value="3">
										</td>
									</tr>



									<tr>
										<td><span>是否显示大刻度</span>
										</td>
										<td>
											<select  name='gauge.gaugeDatas[0].splitLineShow' >
										<option value="true">是</option>
										<option value="false">否</option>
										</select>
										<%--<input type='text'
											name='gauge.gaugeDatas[0].splitLineShow' value="true">
										--%></td>
										<td><span>大刻度线的长度</span>
										</td>
										<td><input type='text'
											name='gauge.gaugeDatas[0].splitLineLength' value="6">
										</td>
									</tr>

									<tr>
										<td><span>是否显示指针</span>
										</td>
										<td>
											<select  name='gauge.gaugeDatas[0].pointerShow' >
										<option value="true">是</option>
										<option value="false">否</option>
										</select>
										<%--<input type='text'
											name='gauge.gaugeDatas[0].pointerShow' value="true">
										--%></td>
										<td><span>指针粗细</span>
										</td>
										<td><input type='text'
											name='gauge.gaugeDatas[0].pointerWidth' class="isNumber" value="5">
										</td>
									</tr>

									<tr>
										<td><span>指针颜色</span>
										</td>
										<td><input type='text'
											name='gauge.gaugeDatas[0].pointerColor' class="isColor" value="">
										</td>
										<td><span>是否显示数值</span>
										</td>
										<td>
											<select  name='gauge.gaugeDatas[0].detailShow' >
										<option value="true">是</option>
										<option value="false">否</option>
										</select></td>
									</tr>

									<tr>
										<td><span>数值是否粗体</span>
										</td>
										<td>
										<select  name='gauge.gaugeDatas[0].detailFontWeight' >
										<option value="true">是</option>
										<option value="false">否</option>
										</select>
										</td>
										<td><span>数值字号</span>
										</td>
										<td><input type='text'
											name='gauge.gaugeDatas[0].detailFontSize' class="isNum" value="10">
										</td>
									</tr>

									<tr>
										<td><span>数值颜色</span>
										</td>
										<td><input type='text'
											name='gauge.gaugeDatas[0].detailColor' class="isColor" value="">
										</td>
										<td><span>数值后加的单位</span>
										</td>
										<td><input type='text'
											name='gauge.gaugeDatas[0].detailFormatter' value="测试22">
										</td>
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
					<td><input type="text" name="chartsConfig.titleTextFontSize"  value="15" /></td>
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
					<td><input type="text" name="chartsConfig.titleSubtext"  /></td>
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
					<td><input type="text" name="chartsConfig.titleSubtextFontSize" value="12" /></td>
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
					<td><input type="text" name="chartsConfig.canvasWidth" value="600" /></td>
				</tr>
				<tr>
					<td width="30%">画布高度(像素绝对值)</td>
					<td><input type="text" name="chartsConfig.canvasHeight" value="600" /></td>
				</tr>
				<tr>
					<td width="30%">是否显示加载动画</td>
					<td>
						<input type="radio" name="chartsConfig.animation" checked value="1">显示
						<input type="radio" name="chartsConfig.animation" value="2">不显示
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
					<td><input type="text" name="chartsConfig.backgroundAlpha"  value="100" /></td>
				</tr>
				<%-- *************************************************************************************************** --%>
				<%-- ************************************以上为公共属性配置*************************************************** --%>
				<%-- *************************************************************************************************** --%>
				<tr>
					<td colspan="2" bgcolor="#eeeeee">&nbsp;</td>
				</tr>
			</table>
	</div>
			</div></div>

			


</form>
</body>