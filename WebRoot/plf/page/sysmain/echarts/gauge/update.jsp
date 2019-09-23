<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<head>
<title><dict:lang value="仪表图修改配置" />
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
	traxisLinesDatasCount = $("#axisLinesDatas tr").length;
	var traxisLinesDatas = "<tr>"
						 + "<td><input type=\"text\"  class=\"percent\" name=\"gauge.gaugeDatas[0].axisLines["+traxisLinesDatasCount+"].percent\" value=\"\"></td>"
						 + "<td><input type=\"text\"  class=\"color isColor isAddAxisLinesDatas\" name=\"gauge.gaugeDatas[0].axisLines["+traxisLinesDatasCount+"].color\" value=\"#000000\"></td>"
						 + "<td><input type=\"button\" class=\"delAxisLinesDatas\" value=\"删除\" /></td>"
						 + "</tr>";
	$("#axisLinesDatas").append(traxisLinesDatas);
	setColor($(".isAddAxisLinesDatas"));
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
	if(gaugeCodeType == "commql"){
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
$("input[name='gauge.gaugeCodeType']:checked").trigger("change");
setBarDatasColor(".isColor");
setBarDatasColor(".setColorSelect");
});

function updateGaugeAttr(thisObj){
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
	
	var isCache = "<c:out value='${paraMap.isCache}' />";
	if(isCache == "1"){
		var chartsConfigCache =  msChartsData("addForm");
		chartsConfigCache["chartsConfigCache.id"] = "<c:out value='${paraMap.cacheId}' />";
		var iframeId = $("#iframeId").val();
		var parentFrame = top.document.getElementById(iframeId);//获取到父iframe对象
		$.ajax({
            type: "POST",
            dataType: "json",
            url: "${path}charts/gaugeAction_cacheUpdate.ms",
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
	var chartsConfig_id = $("#chartsConfig_id").val();
	var popWinframeId = window.frameElement.id+"PopWin";
    var url = "${path}charts/gaugeAction_cfgClsCode.ms?paraMap.CLASS_NAME="+gaugeJavaClass+"&paraMap.codeType="+gaugeJavaCodeType
			/* +"&paraMap.clsCode="+gaugeJavaClsCode */+"&paraMap.CODE_ID="+gaugeJavaClsCodeId+"&paraMap.piframeName="+window.frameElement.id
			+"&paraMap.piframeId="+window.frameElement.id+"&paraMap.toFlag=classManage"+"&paraMap.popWinframeId="+popWinframeId+"&paraMap.OWNER_ID="+chartsConfig_id;
	showPopWinFp(url, $(top.document).width()*0.90, $(top.document).height()*0.90,null,"<dict:lang value="修改类源码"/>", popWinframeId);
}

function updateCLASS_NAME_TEXT(classNameTextId,className,flag){
	$("#gaugeJavaClass").val('');
	$("#gaugeCodeType").val('');
	$("#gaugeClsCode").val('');
	$("#gaugeClsCodeId").val('');
}
</script>
</head>
<body style="width:100%;min-width:1000px;background-color:#fff;">
<form id="addForm" name="addForm" action="${path}charts/gaugeAction_doUpdate.ms" method="post">
<input type="hidden" id="chartsConfig_id" name="chartsConfig.id" value="<c:out value='${chartsConfig.id}' />" />
  <div class="head">
  	<span style="display: inline-block;height: 20px;margin-top: 5px;margin-left: 5px;">
       <span>图表类型</span>
        <dict:selectDict dictCode="CHARTS_TYPE" disabled="true" id="CHARTS_TYPE" dictValue="${fn:escapeXml(chartsConfig.chartsType)}" name="chartsConfig.chartsType"  />
        <span>数据源</span>
        <dict:selectDict dictCode="CHARTS_DATA_SOURCES" disabled="true" id="CHARTS_DATA_SOURCES" dictValue="${fn:escapeXml(chartsConfig.chartsDataSources)}" name="chartsConfig.chartsDataSources"  />
   	</span>
   	<button type="button" onclick="updateGaugeAttr(this);" class="_save"><i class="ico"></i><dict:lang value="修改" /></button>
    </div>
	<div class="all">
           <div class="dataSource">
            <h3>数据源</h3>
            <table border='1' id="leftTable">
            <c:if test="${chartsConfig.chartsDataSources eq '1'}">
                <tr class="sql">
                    <td>SQL语句</td>
                    <td colspan="5" style="padding:5px;">数据库适配：
                        <label><input type="radio" name="gauge.gaugeCodeType" value="commql" id="gauge_codeType_comm" <c:if test="${gauge.gaugeCodeType eq 'commql'}">checked="checked"</c:if>>通用语句</label>
                        <label><input type="radio" name="gauge.gaugeCodeType" value="oracle" id="gauge_codeType_oracle" <c:if test="${gauge.gaugeCodeType eq 'oracle'}">checked="checked"</c:if> >ORACLE</label>
                        <label><input type="radio" name="gauge.gaugeCodeType" value="sqlserver" id="gauge_codeType_sqlserver" <c:if test="${gauge.gaugeCodeType eq 'sqlserver'}">checked="checked"</c:if> >SQLSERVER</label>
                        <label><input type="radio" name="gauge.gaugeCodeType" value="mysql" id="gauge_codeType_mysql" <c:if test="${gauge.gaugeCodeType eq 'mysql'}">checked="checked"</c:if> >MYSQL</label>
                   		<label><input type="radio" name="gauge.gaugeCodeType" value="pgsql" id="gauge_codeType_pgsql" <c:if test="${gauge.gaugeCodeType eq 'pgsql'}">checked="checked"</c:if>>PGSQL</label>
                   		<textarea id="gauge_comm_sql" class="commql" name="gauge.gaugeComm" rows="6"  style="margin-top:5px;height:200px;"><c:out value='${gauge.gaugeComm}' /></textarea>
						<textarea id="gauge_oracle_sql" class="oracle" name="gauge.gaugeOracle" rows="6" style="display: none;margin-top:5px;height:200px;"><c:out value='${gauge.gaugeOracle}' /></textarea>
						<textarea id="gauge_sqlserver_sql" class="sqlserver" name="gauge.gaugeSqlserver" rows="6" style="display: none;margin-top:5px;height:200px;"><c:out value='${gauge.gaugeSqlserver}' /></textarea>
						<textarea id="gauge_mysql_sql" class="mysql" name="gauge.gaugeMysql" rows="6" style="display: none;margin-top:5px;height:200px;"><c:out value='${gauge.gaugeMysql}' /></textarea>
                  		<textarea id="gauge_pg_sql" class="pgsql" name="gauge.gaugePgsql" rows="6" style="display: none;margin-top:5px;height:200px;"><c:out value='${gauge.gaugePgsql}' /></textarea>
                    </td>
                </tr> 
                
                </c:if>
                <c:if test="${chartsConfig.chartsDataSources eq '2'}">
                <tr>
                    <td>JAVA类</td>
                    
                      <td colspan="4">
                    <input type="text" name="gauge.gaugeJavaClass" id="gaugeJavaClass" value="<c:out value='${gauge.gaugeJavaClass}' />">
                    <input type="hidden" name="gauge.gaugeJavaCodeType" id="gaugeCodeType" value="<c:out value='${gauge.gaugeJavaCodeType}' />">
                    <input type="hidden"  id="gaugeClsCode" value="<c:out value='${gauge.gaugeJavaClsCode}' />">
                     <input type="hidden" name="gauge.gaugeJavaClsCodeId" id="gaugeClsCodeId" value="<c:out value='${gauge.gaugeJavaClsCodeId}' />">
                    </td>
                    <td>
							<a href="javascript:void(0);" id="GaugeJavaClassText" onclick="showEditCode();">
								<dict:lang value="编辑" />
							</a>
                    </td>
                </tr>
                </c:if>
                <c:if test="${chartsConfig.chartsDataSources eq '3'}">
               <tr class="jsonStr">
                    <td>JSON字符串</td>
                    <td colspan="5">
                     <textarea name="gauge.jsonGaugeSourceFun" id ="jsonGaugeSourceFun"><c:out value='${gauge.jsonGaugeSourceFun}' /></textarea>
                    </td>
                </tr>
                </c:if>
					<tr >
						<td >
							<dict:lang value="分段数据" />
						</td>
						<td colspan="5">
							<table border="1" class="table_list"  style="margin-top:5px;margin-bottom:5px;">
								<thead>
									<tr>
										<th width="40%"><dict:lang value="数值" /></th>
										<th width="40%"><dict:lang value="颜色" /></th>
										<th width="20%"></th>
									</tr>
								</thead>
								<tbody id="axisLinesDatas">
								  <c:forEach items="${gauge.gaugeDatas[0].axisLines}" var="axisLines" varStatus="status">
								<tr>
								    <td><input type="text"  class="isFloat" name="gauge.gaugeDatas[0].axisLines[${status.index}].percent"  value="<c:out value='${axisLines.percent}' />"></td>
  									<td><input type="text" class="isColor" name="gauge.gaugeDatas[0].axisLines[${status.index}].color"  value="<c:out value='${axisLines.color}' />"></td>
  									<c:choose>
  									  <c:when test="${status.index eq 0}">
  									  <td><input type="button" id="addAxisLinesDatas" value="添加" /></td>
  									  </c:when>
  									  <c:otherwise>
  									    <td><input type="button" class="delAxisLinesDatas" value="删除" /></td>
  									  </c:otherwise>
  									</c:choose>
								</tr>
								</c:forEach>
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
										<td><span>仪表名</span>
										</td>
										<td><input type='text' name='gauge.gaugeDatas[0].name' class="isBlank" value="<c:out value='${gauge.gaugeDatas[0].name}' />">
										</td>
										<td><span>漂浮值</span>
										</td>
										<td><input type='text' class="isNum" name='gauge.gaugeDatas[0].z' value="<c:out value='${gauge.gaugeDatas[0].z}' />">
										</td>
									</tr>
									<tr>
										<td><span>最大值</span>
										</td>
										<td><input type='text' class="isFloat" name='gauge.gaugeDatas[0].max' value="<c:out value='${gauge.gaugeDatas[0].max}' />">
										</td>
										<td><span>最小值</span>
										</td>
										<td><input type='text' class="isFloat" name='gauge.gaugeDatas[0].min' value="<c:out value='${gauge.gaugeDatas[0].min}' />">
										</td>
									</tr>
									<tr>
										<td><span>刻度间隔值</span>
										</td>
										<td><input type='text'
											name='gauge.gaugeDatas[0].splitNumber' class="isNumber" value="<c:out value='${gauge.gaugeDatas[0].splitNumber}' />">
										</td>
										<td><span>仪表直径</span>
										</td>
										<td><input type='text'  name='gauge.gaugeDatas[0].radius' value="<c:out value='${gauge.gaugeDatas[0].radius}' />" >
										</td>
									</tr>
									<tr>
										<td><span>小刻度线的长度</span>
										</td>
										<td><input type='text'
											name='gauge.gaugeDatas[0].axisTickLength' value="<c:out value='${gauge.gaugeDatas[0].axisTickLength}' />">
										</td>
									</tr>
									<tr>
										<td><span>圆心X位置</span>
										</td>
										<td><input type='text'
											name='gauge.gaugeDatas[0].seriesCenterX' class="isPercent" value="<c:out value='${gauge.gaugeDatas[0].seriesCenterX}' />">
										</td>
										<td><span>圆心Y位置</span>
										</td>
										<td><input type='text'
											name='gauge.gaugeDatas[0].seriesCenterY' class="isPercent" value="<c:out value='${gauge.gaugeDatas[0].seriesCenterY}' />">
										</td>
									</tr>

									<tr>
										<td><span>仪表盘起始角度</span>
										</td>
										<td><input type='text'
											name='gauge.gaugeDatas[0].startAngle'  value="<c:out value='${gauge.gaugeDatas[0].startAngle}' />">
										</td>
										<td><span>仪表盘结束角度</span>
										</td>
										<td><input type='text'
											name='gauge.gaugeDatas[0].endAngle'  value="<c:out value='${gauge.gaugeDatas[0].endAngle}' />">
										</td>
									</tr>

									<tr>
										<td><span>仪表外框粗细</span>
										</td>
										<td><input type='text'
											name='gauge.gaugeDatas[0].axisLineWidth' value="<c:out value='${gauge.gaugeDatas[0].axisLineWidth}' />">
										</td>
										<td><span>是否显示小刻度</span>
										</td>
										<td>
										<select  name='gauge.gaugeDatas[0].axisTickShow' >
										<option value="true" >是</option>
										<option value="false" <c:if test="${gauge.gaugeDatas[0].axisTickShow eq false}">selected="selected"</c:if>>否</option>
										</select><%--
										<input type='text'
											name='gauge.gaugeDatas[0].axisTickShow' value="${gauge.gaugeDatas[0].axisTickShow}">
										--%></td>
									</tr>

									<tr>
										<td><span>是否显示大刻度</span>
										</td>
										<td>
										
										<select  name='gauge.gaugeDatas[0].splitLineShow' >
										<option value="true" >是</option>
										<option value="false" <c:if test="${gauge.gaugeDatas[0].splitLineShow eq false}">selected="selected"</c:if>>否</option>
										</select>
										<%--<input type='text'
											name='gauge.gaugeDatas[0].splitLineShow' value="${gauge.gaugeDatas[0].splitLineShow}">
										--%></td>
										<td><span>大刻度线的长度</span>
										</td>
										<td><input type='text'
											name='gauge.gaugeDatas[0].splitLineLength' value="<c:out value='${gauge.gaugeDatas[0].splitLineLength}' />">
										</td>
									</tr>

									<tr>
										<td><span>是否显示指针</span>
										</td>
										<td>
										<select  name='gauge.gaugeDatas[0].pointerShow' >
										<option value="true" >是</option>
										<option value="false" <c:if test="${gauge.gaugeDatas[0].pointerShow eq false}">selected="selected"</c:if>>否</option>
										</select>
										<%--<input type='text'
											name='gauge.gaugeDatas[0].pointerShow' value="${gauge.gaugeDatas[0].pointerShow}">
										--%></td>
										<td><span>指针粗细</span>
										</td>
										<td><input type='text'
											name='gauge.gaugeDatas[0].pointerWidth' value="<c:out value='${gauge.gaugeDatas[0].pointerWidth}' />">
										</td>
									</tr>

									<tr>
										<td><span>指针颜色</span>
										</td>
										<td><input type='text'
											name='gauge.gaugeDatas[0].pointerColor' class="isColor" value="<c:out value='${gauge.gaugeDatas[0].pointerColor}' />">
										</td>
										<td><span>仪表上是否显示数值</span>
										</td>
										<td>
										<select  name='gauge.gaugeDatas[0].detailShow' >
										<option value="true" >是</option>
										<option value="false" <c:if test="${gauge.gaugeDatas[0].detailShow eq false}">selected="selected"</c:if>>否</option>
										</select>
										<%--<input type='text'
											name='gauge.gaugeDatas[0].detailShow' value="${gauge.gaugeDatas[0].detailShow}">
										--%></td>
									</tr>

									<tr>
										<td><span>仪表上显示数值是否粗体</span>
										</td>
										<td>
											<select  name='gauge.gaugeDatas[0].detailFontWeight' >
										<option value="true" >是</option>
										<option value="false" <c:if test="${gauge.gaugeDatas[0].detailFontWeight eq false}">selected="selected"</c:if>>否</option>
										</select>
										<%--<input type='text'
											name='gauge.gaugeDatas[0].detailFontWeight' value="${gauge.gaugeDatas[0].detailFontWeight}">
										--%></td>
										<td><span>仪表上显示数值字号</span>
										</td>
										<td><input type='text'
											name='gauge.gaugeDatas[0].detailFontSize' class="isNum" value="<c:out value='${gauge.gaugeDatas[0].detailFontSize}' />">
										</td>
									</tr>

									<tr>
										<td><span>仪表上显示数值颜色</span>
										</td>
										<td><input type='text'
											name='gauge.gaugeDatas[0].detailColor' class="isColor" value="<c:out value='${gauge.gaugeDatas[0].detailColor}' />">
										</td>
										<td><span>仪表上显示数值后加的单位</span>
										</td>
										<td><input type='text'
											name='gauge.gaugeDatas[0].detailFormatter'  value="<c:out value='${gauge.gaugeDatas[0].detailFormatter}' />">
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
					<td><input type="text" name="chartsConfig.titleText" value="<c:out value='${chartsConfig.titleText}' />" /></td>
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
					<td><input type="text" class="setColorSelect" name="chartsConfig.titleTextColor"  value="<c:out value='${chartsConfig.titleTextColor}' />" /></td>
				</tr>
				<tr>
					<td width="30%">标题字号</td>
					<td><input type="text" name="chartsConfig.titleTextFontSize"  value="<c:out value='${chartsConfig.titleTextFontSize}' />" /></td>
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
					<td><input type="text" class="setColorSelect" name="chartsConfig.titleSubtextColor"  value="<c:out value='${chartsConfig.titleSubtextColor}' />" /></td>
				</tr>
				<tr>
					<td width="30%">副标题字号</td>
					<td><input type="text" name="chartsConfig.titleSubtextFontSize"  value="<c:out value='${chartsConfig.titleSubtextFontSize}' />" /></td>
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
					<td><input type="text" name="chartsConfig.canvasWidth"  value="<c:out value='${chartsConfig.canvasWidth}' />" /></td>
				</tr>
				<tr>
					<td width="30%">画布高度(像素绝对值)</td>
					<td><input type="text" name="chartsConfig.canvasHeight"  value="<c:out value='${chartsConfig.canvasHeight}' />" /></td>
				</tr>
				<tr>
					<td width="30%">是否显示加载动画</td>
					<td>
						<input type="radio" name="chartsConfig.animation" <s:if test="#request.chartsConfig.animation==1">checked</s:if> value="1">显示
						<input type="radio" name="chartsConfig.animation" <s:if test="#request.chartsConfig.animation==2">checked</s:if> value="2">不显示
					</td>
				</tr>	
				
				<tr>
					<td width="30%">点击事件</td>
					<td>
					<%--<input type="text" name="chartsConfig.eventClick" value="${chartsConfig.eventClick}" />
					--%>
					<select name="chartsConfig.eventClick">
					    <option value="false" <c:if test="${chartsConfig.eventClick eq 'false'}">selected="selected"</c:if> >不触发</option>
					   <option value="true" <c:if test="${chartsConfig.eventClick eq 'true'}">selected="selected"</c:if>>触发</option>
					</select>
					</td>
				</tr>
				<tr>
					<td width="30%">背景图url</td>
					<td><input type="text" name="chartsConfig.backgroundUrl"  value="<c:out value='${chartsConfig.backgroundUrl}' />" /></td>
				</tr>
				<tr>
					<td width="30%">背景图透明度(100为完全不透明,0为完全透明)</td>
					<td><input type="text" name="chartsConfig.backgroundAlpha"  value="<c:out value='${chartsConfig.backgroundAlpha}' />" /></td>
				</tr>	
				<%-- *************************************************************************************************** --%>
				<%-- ************************************以上为公共属性配置********************************************** --%>
				<%-- *************************************************************************************************** --%>
				
			</table>
			</div>
		</div>
	</div>
	
		</form>
</body>