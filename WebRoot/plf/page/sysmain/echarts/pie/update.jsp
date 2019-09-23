<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<head>
<title><dict:lang value="饼图修改配置" />
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
	setBarDatasColor(".setColorSelect");
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
			//arr.push("<td><select name='pie.pieDataEntityList["+i+"].isPieData' ><option value='2'>否</option><option value='1'>是</option></select></td>");
		}
		arr.push("</tr>");
		arrColorCount[i] = i;
	}
	$("."+configTr).remove();
	lastTr.after(arr.join(""));
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
		alert(jsonSourceFun);
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
$("input[name='pie.pieCodeType']:checked").trigger("change");
setBarDatasColor(".pieColor");
});

function updateBarAttr(thisObj){
	var chartsDataSources = $("#CHARTS_DATA_SOURCES").val();
	if(chartsDataSources == "1"){
		var pieCodeType = $("input[name='pie.pieCodeType']:checked").val();
		var barTxt = $("."+pieCodeType).val();
		if(barTxt == ""){
			_alertValMsg($("."+pieCodeType),"<dict:lang value="数据源不能为空" />");
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
	
	if(!isBlank()){
		return ;
	};
	
	if(!valIsNum()){
		return ;
	}
	
	if(!valIsPercentOrNum()){
		return ;
	}
	
	var isCache = "<c:out value='${paraMap.isCache}' />";
	if(isCache == "1"){
		var chartsConfigCache =  msChartsData("addForm");
		chartsConfigCache["chartsConfigCache.id"] = "<c:out value='${paraMap.cacheId}'/>";
		var iframeId = $("#iframeId").val();
		var parentFrame = top.document.getElementById(iframeId);//获取到父iframe对象
		$.ajax({
            type: "POST",
            dataType: "json",
            url: "${path}charts/pieAction_cacheUpdate.ms",
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
function setBarDatasColor(selector){
	$(selector).each(function(index,item){
		var color = $(this).val();
		setColor($(this),color);
	});	
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
	var chartsConfig_id = $("#chartsConfig_id").val();
	var popWinframeId = window.frameElement.id+"PopWin";
	var url = "${path}charts/pieAction_cfgClsCode.ms?paraMap.CLASS_NAME="+pieJavaClass+"&paraMap.codeType="+pieCodeType
			/* +"&paraMap.clsCode="+pieClsCode */+"&paraMap.CODE_ID="+pieClsCodeId+"&paraMap.piframeName="+window.frameElement.id
			+"&paraMap.piframeId="+window.frameElement.id+"&paraMap.toFlag=classManage"+"&paraMap.popWinframeId="+popWinframeId+"&paraMap.OWNER_ID="+chartsConfig_id;
	showPopWinFp(url, $(top.document).width()*0.90, $(top.document).height()*0.90,null,"<dict:lang value="修改类源码"/>", popWinframeId);
}

function updateCLASS_NAME_TEXT(classNameTextId,className,flag){
	$("#pieJavaClass").val('');
	$("#pieCodeType").val('');
	$("#pieClsCode").val('');
	$("#pieClsCodeId").val('');
}
</script>
</head>
<body style="width:100%;min-width:1000px;background-color:#fff;">
<form id="addForm" name="addForm" action="${path}charts/pieAction_doUpdate.ms" method="post">
<input type="hidden" id="chartsConfig_id" name="chartsConfig.id" value="<c:out value='${chartsConfig.id}' />" />
  <div class="head">
  <span style="display: inline-block;height: 20px;margin-top: 5px;margin-left: 5px;">	
      	<span>图表类型</span>
        <dict:selectDict dictCode="CHARTS_TYPE" disabled="true" id="CHARTS_TYPE" dictValue="${fn:escapeXml(chartsConfig.chartsType)}" name="chartsConfig.chartsType"  />
        <span>数据源</span>  
        <dict:selectDict dictCode="CHARTS_DATA_SOURCES" disabled="true" id="CHARTS_DATA_SOURCES" dictValue="${fn:escapeXml(chartsConfig.chartsDataSources)}" name="chartsConfig.chartsDataSources"  />
   	</span>
    <button type="button" onclick="updateBarAttr(this);" class="_save"><i class="ico"></i><dict:lang value="修改" /></button>
    </div>
	<div class="all">
	 <div class="dataSource">
            <h3>数据源</h3>
            <table border='1'>
             <c:if test="${chartsConfig.chartsDataSources eq '1'}">
                <tr>
                    <td>SQL语句<span class="Eng">*</span></td>
                    <td colspan="5" style="padding:5px;">数据库适配：
                        <label><input type="radio" name="pie.pieCodeType" value="commql" id="codeType_comm" <c:if test="${pie.pieCodeType eq 'commql'}">checked="checked"</c:if> >通用语句</label>
                        <label><input type="radio" name="pie.pieCodeType" value="oracle" id="codeType_oracle" <c:if test="${pie.pieCodeType eq 'oracle'}">checked="checked"</c:if> >ORACLE</label>
                        <label><input type="radio" name="pie.pieCodeType" value="sqlserver" id="codeType_sqlserver" <c:if test="${pie.pieCodeType eq 'sqlserver'}">checked="checked"</c:if> >SQLSERVER</label>
                        <label><input type="radio" name="pie.pieCodeType" value="mysql" id="codeType_mysql" <c:if test="${pie.pieCodeType eq 'mysql'}">checked="checked"</c:if> >MYSQL</label>
                    	<label><input type="radio" name="pie.pieCodeType" value="pgsql" id="codeType_pgsql" <c:if test="${pie.pieCodeType eq 'pgsql'}">checked="checked"</c:if>  >PGSQL</label>
                    	
                    	<textarea id="comm_sql" class="commql" name="pie.comm"  rows="6" style="margin-top:5px;height:200px;"><c:out value='${pie.comm}'/></textarea>
						<textarea id="oracle_sql" class="oracle" name="pie.oracle" rows="6" style="display: none;margin-top:5px;height:200px;"><c:out value='${pie.oracle}'/></textarea>
						<textarea id="sqlserver_sql" class="sqlserver" name="pie.sqlserver" rows="6" style="display: none;margin-top:5px;height:200px;"><c:out value='${pie.sqlserver}'/></textarea>
						<textarea id="mysql_sql" class="mysql" name="pie.mysql" rows="6" style="display: none;margin-top:5px;height:200px;"><c:out value='${pie.mysql}'/></textarea>
                    	<textarea id="pg_sql" class="pgsql" name="pie.pgsql" rows="6" style="display: none;margin-top: 5px;height:200px;"><c:out value='${pie.pgsql}'/></textarea>
                    </td>
                </tr> 
                <tr>
                    <td colspan="5">
                        
                    </td>  
                </tr>
                </c:if>
                <c:if test="${chartsConfig.chartsDataSources eq '2'}">
                <tr>
                    <td>JAVA类<span class="Eng">*</span></td>
                    <td colspan="4">
                    <input type="text" name="pie.javaClass" class="_VAL_NULL" value="<c:out value='${pie.javaClass}' />" id="pieJavaClass">
                    <input type="hidden" name="pie.javaCodeType" value="<c:out value='${pie.javaCodeType}'/>" id="pieCodeType">
                    <input type="hidden"  value="<c:out value='${pie.javaClsCode}'/>" id="pieClsCode">
                     <input type="hidden" name="pie.javaClsCodeId" value="<c:out value='${pie.javaClsCodeId}'/>" id="pieClsCodeId">
                    </td>
                    <td>
					<a href="javascript:void(0);" id="pieJavaClassText" onclick="showEditCode();">
						<dict:lang value="编辑" />
					</a>
                    </td>
                </tr>
                </c:if>
                <c:if test="${chartsConfig.chartsDataSources eq '3'}">
               <tr>
                    <td>JSON字符串<span class="Eng">*</span></td>
                    <td colspan="5">
                    <textarea name="pie.jsonSourceFun" class="_VAL_NULL" id="jsonSourceFun"><c:out value='${pie.jsonSourceFun}'/></textarea></td>
                    <%--<input type='text' name="pie.JsonStr" >--%>
                </tr>
                </c:if>
                	<%--<tr >
						<td >
							<dict:lang value="字段显示别名" />
						</td>
						<td colspan="5">
							<input type="button" id="getFieldBtn" class="botton_img_search _get" value="<dict:lang value="获取字段" />"
							   title="<dict:lang value="只能获取当前类型数据库语句"/>"  />
							
							<table border="1" class="table_list"  style="margin-top:5px;margin-bottom:5px;margin-right:5px;">
								<thead>
									<tr >
										<th width="20%"><dict:lang value="版块名称" /></th>
										<th width="10%"><dict:lang value="版块颜色" /></th>
									</tr>
								</thead>
								<tbody>
								
								   	<c:forEach items="${pie.pieDatas[0].piePointDatas}" var="piePointDatas" varStatus="status">
								   	 <tr class="dataConfigTr">
								   	    <td><input type='text' name='pie.pieDatas[0].piePointDatas[${status.index}].name' value="${piePointDatas.name}"></td>
								      	<td><input type='text' class="pieColor" name='pie.pieDatas[0].piePointDatas[${status.index}].color' value="${piePointDatas.color}"></td>
								      	<input type='hidden'  value="${piePointDatas.value}" name='pie.pieDatas[0].piePointDatas[${status.index}].value' />
									     </tr>
								   	</c:forEach>
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
					<td><input type="text" name="chartsConfig.titleText"  value="<c:out value='${chartsConfig.titleText}'/>"  /></td>
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
					<td><input type="text" class="setColorSelect" name="chartsConfig.titleTextColor"  value="<c:out value='${chartsConfig.titleTextColor}'/>" /></td>
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
					<td><input type="text" class="setColorSelect" name="chartsConfig.titleSubtextColor"  value="<c:out value='${chartsConfig.titleSubtextColor}'/>" /></td>
				</tr>
				<tr>
					<td width="30%">副标题字号</td>
					<td><input type="text" name="chartsConfig.titleSubtextFontSize" class="isNum"  value="<c:out value='${chartsConfig.titleSubtextFontSize}'/>" /></td>
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
					<td><input type="text" name="chartsConfig.canvasWidth" class="isNum" value="<c:out value='${chartsConfig.canvasWidth}'/>" /></td>
				</tr>
				<tr>
					<td width="30%">画布高度(像素绝对值)</td>
					<td><input type="text" name="chartsConfig.canvasHeight" class="isNum"  value="<c:out value='${chartsConfig.canvasHeight}'/>" /></td>
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
					<td><input type="text" name="chartsConfig.backgroundUrl"  value="<c:out value='${chartsConfig.backgroundUrl}'/>" /></td>
				</tr>
				<tr>
					<td width="30%">背景图透明度(100为完全不透明,0为完全透明)</td>
					<td><input type="text" name="chartsConfig.backgroundAlpha" class="isNum"  value="<c:out value='${chartsConfig.backgroundAlpha}'/>" /></td>
				</tr>	
				<%-- *************************************************************************************************** --%>
				<%-- ************************************以上为公共属性配置********************************************** --%>
				<%-- *************************************************************************************************** --%>
				
				<tr>
					<td width="30%">是否南丁格尔玫瑰图</td>
					<td>
						<input type="radio" name="pie.roseShow" <s:if test="#request.pie.roseShow==1">checked</s:if> value="true">是
						<input type="radio" name="pie.roseShow" <s:if test="#request.pie.roseShow==0">checked</s:if> value="false">否
					</td>
				</tr>
				<tr>
					<td width="30%">图例说明的排列方式</td>
					<td>
						<input type="radio" name="pie.legendOrient" <s:if test="#request.pie.legendOrient=='vertical'">checked</s:if> value="vertical">竖向排列
						<input type="radio" name="pie.legendOrient" <s:if test="#request.pie.legendOrient=='horizontal'">checked</s:if> value="horizontal">横向排列						
					</td>
				</tr>	
				<tr>
					<td width="30%">图例说明的水平位置</td>
					<td>
						<input type="radio" name="pie.legendX" <s:if test="#request.pie.legendX=='left'">checked</s:if> value="left">居左
						<input type="radio" name="pie.legendX" <s:if test="#request.pie.legendX=='center'">checked</s:if> value="center">居中			
						<input type="radio" name="pie.legendX" <s:if test="#request.pie.legendX=='right'">checked</s:if> value="right">居右							
					</td>
				</tr>
				<tr>
					<td width="30%">图例说明的垂直位置</td>
					<td>
						<input type="radio" name="pie.legendY" <s:if test="#request.pie.legendY=='left'">checked</s:if> value="top">顶部
						<input type="radio" name="pie.legendY" <s:if test="#request.pie.legendY=='middle'">checked</s:if> value="middle">居中			
						<input type="radio" name="pie.legendY" <s:if test="#request.pie.legendY=='bottom'">checked</s:if> value="bottom">底部							
					</td>
				</tr>
				<tr>
					<td width="30%">是否显示标签</td>
					<td>
						<input type="radio" name="pie.labelNormalShow" <s:if test="#request.pie.labelNormalShow==1">checked</s:if> value="true">显示
						<input type="radio" name="pie.labelNormalShow" <s:if test="#request.pie.labelNormalShow==0">checked</s:if> value="false">不显示
					</td>
				</tr>
				<tr>
					<td width="30%">标签内容</td>
					<td>
						<input type="checkbox" name="pie.labelFormatterC" <s:if test="#request.pie.labelFormatterC=='true'">checked</s:if> value="true">分类数值
						&nbsp;
						<input type="checkbox" name="pie.labelFormatterD" <s:if test="#request.pie.labelFormatterD=='true'">checked</s:if> value="true">分类百分比
					</td>
				</tr>		
				<tr>
					<td width="30%">鼠标指上时是否显示提示信息</td>
					<td>
						<input type="radio" name="pie.tooltipTrigger" <s:if test="#request.pie.tooltipTrigger=='item'">checked</s:if> value="item">显示
						<input type="radio" name="pie.tooltipTrigger" <s:if test="#request.pie.tooltipTrigger=='none'">checked</s:if> value="none">不显示
					</td>
				</tr>
				<tr>
					<td width="30%">提示信息上的标题</td>
					<td><input type="text" name="pie.seriesName" value="<c:out value='${pie.seriesName}'/>"  /></td>
				</tr> 
				<tr>
					<td width="30%">饼图圆心x轴位置(可填页面百分比或坐标绝对值)</td>
					<td><input type="text" name="pie.seriesCenterX" class="isPercentOrNum" value="<c:out value='${pie.seriesCenterX}'/>" /></td>
				</tr>
				<tr>
					<td width="30%">饼图圆心y轴位置(可填页面百分比或坐标绝对值)</td>
					<td><input type="text" name="pie.seriesCenterY" class="isPercentOrNum" value="<c:out value='${pie.seriesCenterY}'/>"  /></td>
				</tr>
			</table>
			<input type="hidden" name="chartsConfig.type" value="1"/>
		</div>
		</div>
	</div>
	 
	</form>
<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>