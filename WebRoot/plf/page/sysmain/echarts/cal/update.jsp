<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<head>
<title><dict:lang value="日历图修改配置" />
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
    	var iscal = $("#iscal").val();
		if(chartsDataSources=="1"){// sql查询
			$(".calSql").show();
			$(".calJavaClass,.calJsonStr").hide();
		}else if(chartsDataSources=="2"){// java类
			$(".calJavaClass").show();
			$(".calSql,.calJsonStr").hide();
		}else{//json串
			$(".calJsonStr").show();
			$(".calSql,.calJavaClass").hide();
		}
	});	

    var db_dialect="<s:property value="@com.more.fw.core.common.method.CommMethodMc@getCUR_DB_DIALECT()"/>";
    function getFieldBySql(configTr,colTitle){
    	var db_sql2 = document.getElementById("cal_"+db_dialect+"_sql");
    	var val2 = db_sql2.value;
    	var db_sql3 = document.getElementById("cal_comm_sql");
    	var val3 = db_sql3.value;
    	if(val.isBlank(val2)&&val.isBlank(val3)){
    		var lineCodeType = $("input[name='cal.calCodeType']:checked").val();
    		var elementId;
    		switch(lineCodeType)
    		{
    			case "commql":elementId = document.getElementById("cal_comm_sql");
    			  break;
    			case "oracle":elementId = document.getElementById("cal_oracle_sql");
    			  break;
    			case "sqlserver":elementId = document.getElementById("cal_sqlserver_sql");
    			  break;
    			case "pgsql":elementId = document.getElementById("cal_pg_sql");
    			  break;
    			default:elementId = document.getElementById("cal_mysql_sql");	  
    		}
    	   	_alertValMsg(elementId,"<dict:lang value="通用和当前数据库SQL" /> -- <dict:lang value="不能同时为空" />");
    	   	return false;
    	}
    	var sql = {};
    	var url = "${path}charts/calAction_getFields.ms";
    	sql[db_dialect] = val.isBlank(val2)?val3.replace("?","%3F"):val2.replace("?","%3F");
    	util.showLoading("处理中...");
    	$.ajax({
    		type: "POST",
    	    dataType: "json",
    	    url: url,
    	    data: sql,
    		success: function(data){
    				util.closeLoading();
    				if(data){
    					setFieldData(data,configTr,colTitle);
                    }
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
    	var calClsCodeId = $("#calClsCodeId").val();
    	if(calClsCodeId ==""){
    		_alertValMsg($("#calJavaClass"),"<dict:lang value="JAVA类不能为空" />");
    		return;
    	}
    	var url = "${path}charts/calAction_getJavaDataFields.ms";
    	util.showLoading("处理中...");
    	$.ajax({
    		type: "POST",
    	    dataType: "json",
    	    url: url,
    	    data: "paraMap.calClsCodeId="+calClsCodeId,
    		success: function(data){
    				util.closeLoading();
    				if(null == data){return ;}
    				if(data){
    					var aList =data;
    					setFieldData(aList,configTr,colTitle);
                    }
            },
    		error: function(msg){
    				util.closeLoading();
    				utilsFp.confirmIcon(1,"","","", "<dict:lang value='获取字段失败！' />","","255","155");
    				//util.alert("error:"+msg.responseText);
    		  }
    		});
    	return false;
    	
    }
    setBarDatasColor(".setColorSelect");
    function setFieldData(aList,configTr,colTitle){
    	var arr = [];
    	var lastTr = $("#"+colTitle);
    	var arrColorCount = [];
    	for(var i = 0;i < aList.length; i++){
    		arr.push("<tr class="+configTr+">");
    		arr.push("<td><input type='text' name='cal.datas["+i+"].label' ></td>");
    		arr.push("<td><input type='text' class='isNum' name='cal.datas["+i+"].key' ></td>");
    		arr.push("</tr>");
    	}
    	$("."+configTr).remove();
    	lastTr.after(arr.join(""));
    }

    function getJsonDataFields(data){
    	if(data){
    		var JsonData = data[0];
    		var aList = [];
    		for(var key in JsonData){
    			var colObj = {};
    			colObj["filedName"] = key;
    			aList.push(colObj);
            }
            setFieldData(aList,"calDataConfigTr","calColTitle");
        }
    }


    $("#getCalFieldBtn").click(function(){
    	var chartsDataSources = $("#CHARTS_DATA_SOURCES").val();
    	if(chartsDataSources == "1"){
    		getFieldBySql("calDataConfigTr","calColTitle");
    	}else if(chartsDataSources == "2"){
    		getFieldByJava("calDataConfigTr","calColTitle");
    	}else{
    		var jsonCalSourceFun = $("#jsonCalSourceFun").val();
    		alert(jsonCalSourceFun);
    		if(jsonCalSourceFun!=""){
    			var url = "${path}charts/calAction_getJsonData.ms";
    			eval(jsonCalSourceFun);
    		}else{
    			_alertValMsg($("#jsonCalSourceFun"),"<dict:lang value="函数体不能为空" /> -- <dict:lang value="不能为空" />");
    			return false;
    		}
    	}
    });

    $("input[name='cal.calCodeType']").change(function(){
    	var calCodeType = $(this).val();
    	if(calCodeType == "commql"){
    		$("#cal_comm_sql").show();
    		$("#cal_oracle_sql,#cal_sqlserver_sql,#cal_mysql_sql,#cal_pg_sql").hide();
    	}else if(calCodeType == "oracle"){
    		$("#cal_oracle_sql").show();
    		$("#cal_comm_sql,#cal_sqlserver_sql,#cal_mysql_sql,#cal_pg_sql").hide();
    	}else if(calCodeType == "sqlserver"){
    		$("#cal_sqlserver_sql").show();
    		$("#cal_comm_sql,#cal_oracle_sql,#cal_mysql_sql,#cal_pg_sql").hide();
    	}else if(calCodeType == "pgsql"){
    		$("#cal_pg_sql").show();
    		$("#cal_comm_sql,#cal_oracle_sql,#cal_mysql_sql,#cal_sqlserver_sql").hide();
    	}
    	else{
    		$("#cal_mysql_sql").show();
    		$("#cal_comm_sql,#cal_oracle_sql,#cal_sqlserver_sql,#cal_pg_sql").hide();
        }
    });
    $("input[name='cal.calCodeType']:checked").trigger("change");
});

function updateCalAttr(thisObj){
	var chartsType = $("#CHARTS_TYPE").val();
	$("#chartsType").val(chartsType);
	var chartsDataSources = $("#CHARTS_DATA_SOURCES").val();
	$("#chartsDataSources").val(chartsDataSources);
	if(chartsDataSources == "1"){
		var calCodeType = $("input[name='cal.calCodeType']:checked").val();
		var calTxt = $("."+calCodeType).val();
		if(calTxt == ""){
			_alertValMsg($("."+calCodeType),"<dict:lang value="数据源不能为空" />");
			return;
	   }
	}else if(chartsDataSources == "2"){
		var calJavaClass = $("#calJavaClass").val();
		if(calJavaClass == ""){
			_alertValMsg($("#calJavaClass"),"<dict:lang value="数据源不能为空" />");
			return;
        }
    }else{
		var calJsonSourceFun = $("#calJsonSourceFun").val();
		if(calJsonSourceFun == ""){
			_alertValMsg($("#calJsonSourceFun"),"<dict:lang value="数据源不能为空" />");
			return;
        }
    }
	if(!isNum()){
		return ;
    }
    var isCache = "<c:out value='${paraMap.isCache}' />";
	if(isCache == "1"){
		var chartsConfigCache =  msChartsData("editForm");
		chartsConfigCache["chartsConfigCache.id"] = "<c:out value='${paraMap.cacheId}' />";
		var iframeId = $("#iframeId").val();
		var parentFrame = top.document.getElementById(iframeId);//获取到父iframe对象
		$.ajax({
            type: "POST",
            dataType: "json",
            url: "${path}charts/calAction_cacheUpdate.ms",
            data:chartsConfigCache,
            success: function(data){
             if(data.success){
            	 parent.closePopWinFp('setKeyDataIframepop');
             }else{
            	 utilsFp.confirmIcon(3,"","","", "更新缓存失败","","260","145");
             }
            },
            error: function(msg){
            	util.closeLoading();
            	utilsFp.confirmIcon(3,"","","", "更新缓存失败","","260","145");
            }
        });
	}else{
		document.forms.editForm.submit();
	}
}

function isNum(){
	var validates = true;
	var reg = /^(-|\+)?\d+$/;
	$(".isNum").each(function(index,item){
		var vals = $(this).val();
		if(vals == ""){
			return true;
		}
		if(vals>31||!reg.test(vals)){
			_alertValMsg($(this),"<dict:lang value='数据格式错误' />");
			validates = false;
			return false;
        }
    });
	return validates;
}

function showEditCode(){
	var calJavaClass = $("#calJavaClass").val();
	var calJavaCodeType = $("#calCodeType").val();
	var calJavaClsCode = $("#calClsCode").val();
	var calJavaClsCodeId = $("#calClsCodeId").val();
	var chartsConfig_id = $("#chartsConfig_id").val();
	var popWinframeId = window.frameElement.id+"PopWin";
    var url = "${path}charts/calAction_cfgClsCode.ms?paraMap.CLASS_NAME="+calJavaClass+"&paraMap.codeType="+calJavaCodeType
			/* +"&paraMap.clsCode="+calJavaClsCode */+"&paraMap.CODE_ID="+calJavaClsCodeId+"&paraMap.piframeName="+window.frameElement.id
			+"&paraMap.piframeId="+window.frameElement.id+"&paraMap.toFlag=classManage"+"&paraMap.popWinframeId="+popWinframeId+"&paraMap.OWNER_ID="+chartsConfig_id;
	showPopWinFp(url, $(top.document).width()*0.90, $(top.document).height()*0.90,null,"<dict:lang value="修改类源码"/>", popWinframeId);
}

function updateCLASS_NAME_TEXT(classNameTextId,className,flag){
	$("#calJavaClass").val('');
	$("#calCodeType").val('');
	$("#calClsCode").val('');
	$("#calClsCodeId").val('');
}
</script>
</head>
<body style="width:100%;min-width:1000px;background-color:#fff;">
<form id="editForm" name="editForm" action="${path}charts/calAction_doUpdate.ms" method="post">
<input type="hidden" id="chartsConfig_id" name="chartsConfig.id" value="<c:out value='${chartsConfig.id}' />" />
  <div class="head">
  	<span style="display: inline-block;height: 20px;margin-top: 5px;margin-left: 5px;">
       	<span>图表类型</span>
        <dict:selectDict dictCode="CHARTS_TYPE" disabled="true" id="CHARTS_TYPE" dictValue="${fn:escapeXml(chartsConfig.chartsType)}" name="chartsConfig.chartsType"  />
        <span>数据源</span>  
        <dict:selectDict dictCode="CHARTS_DATA_SOURCES" disabled="true" id="CHARTS_DATA_SOURCES" dictValue="${fn:escapeXml(chartsConfig.chartsDataSources)}" name="chartsConfig.chartsDataSources"  />
    </span>
    <button type="button"  class="_save" onclick="updateCalAttr(this);"><i class="ico"></i><dict:lang value="修改" /></button>
    </div>
	<div class="all">
		  <div class="dataSource">
            <h3>数据源</h3>
            <table border='1' id="leftTable">
            <c:if test="${chartsConfig.chartsDataSources eq '1'}">
                <tr class="sql">
                    <td>SQL语句</td>
                    <td colspan="5" style="padding:5px;">数据库适配：
                        <label><input type="radio" name="cal.calCodeType" value="commql" id="cal_codeType_comm" <c:if test="${cal.calCodeType eq 'commql'}">checked="checked"</c:if>>通用语句</label>
                        <label><input type="radio" name="cal.calCodeType" value="oracle" id="cal_codeType_oracle" <c:if test="${cal.calCodeType eq 'oracle'}">checked="checked"</c:if>>ORACLE</label>
                        <label><input type="radio" name="cal.calCodeType" value="sqlserver" id="cal_codeType_sqlserver" <c:if test="${cal.calCodeType eq 'sqlserver'}">checked="checked"</c:if>>SQLSERVER</label>
                        <label><input type="radio" name="cal.calCodeType" value="mysql" id="cal_codeType_mysql" <c:if test="${cal.calCodeType eq 'mysql'}">checked="checked"</c:if>>MYSQL</label>
                    	<label><input type="radio" name="cal.calCodeType" value="pgsql" id="cal_codeType_pgsql" <c:if test="${cal.calCodeType eq 'pgsql'}">checked="checked"</c:if>>PGSQL</label>
                    	<textarea id="cal_comm_sql" class="commql" name="cal.calComm" rows="6" style="margin-top:5px;height:200px;"><c:out value='${cal.calComm}'/></textarea>
						<textarea id="cal_oracle_sql" class="oracle" name="cal.calOracle" rows="6" style="display: none;margin-top:5px;height:200px;"><c:out value='${cal.calOracle}' /></textarea>
						<textarea id="cal_sqlserver_sql" class="sqlserver" name="cal.calSqlserver" rows="6" style="display: none;margin-top:5px;height:200px;"><c:out value='${cal.calSqlserver}' /></textarea>
						<textarea id="cal_mysql_sql" class="mysql" name="cal.calMysql" rows="6" style="display: none;margin-top:5px;height:200px;"><c:out value='${cal.calMysql}' /></textarea>
                   	    <textarea id="cal_pg_sql" class="pgsql" name="cal.calPgsql" rows="6" style="display: none;margin-top:5px;height:200px;"><c:out value='${cal.calPgsql}' /></textarea>
                   
                    </td>
                </tr>
                </c:if>
                <c:if test="${chartsConfig.chartsDataSources eq '2'}">
                <tr>
                    <td>JAVA类</td>
                    
                      <td colspan="4">
                    <input type="text" name="cal.calJavaClass" id="calJavaClass" value="<c:out value='${cal.calJavaClass}' />">
                    <input type="hidden" name="cal.calJavaCodeType" id="calCodeType" value="<c:out value='${cal.calJavaCodeType}' />">
                    <input type="hidden"  id="calClsCode" value="<c:out value='${cal.calJavaClsCode}' />">
                     <input type="hidden" name="cal.calJavaClsCodeId" id="calClsCodeId" value="<c:out value='${cal.calJavaClsCodeId}' />" >
                    </td>
                    <td>
							<a href="javascript:void(0);" id="calJavaClassText" onclick="showEditCode();">
								<dict:lang value="编辑" />
							</a>
                    </td>
                </tr>
                </c:if>
              <c:if test="${chartsConfig.chartsDataSources eq '3'}">
               <tr class="jsonStr">
                    <td>JSON字符串</td>
                    <td colspan="5">
                     <textarea name="cal.jsonCalSourceFun" id ="jsonCalSourceFun">"<c:out value='${cal.jsonCalSourceFun}' />"</textarea>
                    </td>
                </tr>
                </c:if>
                <tr >
						<td >
							<dict:lang value="字段显示别名" />
						</td>
						<td colspan="5">
							<input type="button" id="getCalFieldBtn" class="botton_img_search _get" value="<dict:lang value="获取字段" />"
							 title="<dict:lang value="只能获取当前类型数据库语句"/>"  />
							 
							<table border="1" class="table_list"  style="margin-top:5px;margin-bottom:5px;margin-right:5px;">
								<thead>
									<tr >
										<th width="20%"><dict:lang value="名称" /></th>
										<th width="20%"><dict:lang value="数据显示号数" /></th>
									</tr>
								</thead>
								<tbody id="calColTitle">
								<c:forEach items="${cal.datas}" var="datas" varStatus="status">
								   <tr class="calDataConfigTr">
									<td><input type='text' name='cal.datas[${status.index}].label' value="<c:out value='${datas.label}' />" ></td>
									<td><input type='text' class="isNum" name='cal.datas[${status.index}].key' value="<c:out value='${datas.key}' />" ></td>
									</tr>
									</c:forEach>
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
					<td><input type="text" name="chartsConfig.titleText"  value="<c:out value='${chartsConfig.titleText}' />"  /></td>
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
					--%>
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
				<tr>
					<td colspan="2" bgcolor="#eeeeee">&nbsp;</td>
				</tr>
				<tr>
					<td width="30%">鼠标指上时是否显示提示信息</td>
					<td>
						<input type="radio" name="cal.tooltipShow" <s:if test="#request.cal.tooltipShow==1">checked</s:if> value="true">显示
						<input type="radio" name="cal.tooltipShow" <s:if test="#request.cal.tooltipShow==0">checked</s:if> value="false">不显示
					</td>
				</tr>
				<tr>
					<td width="30%">鼠标指上时是否显示提示信息标题</td>
					<td><input type="text" name="cal.tooltipName" value="<c:out value='${cal.tooltipName}' />" /></td>
				</tr>
				<tr>
					<td width="30%">日历年度</td>
					<td>
						<select name="cal.calYear" id="calYear" style="width:90px" size="1">   
						     <!-- <script language="javascript">   
						     	
						     	for(i=2000;i<=2030;i++){   
									document.write('<option value="'+i+'">'+i+'</option>')   
							    }  
								
								y = <c:out value='${cal.calYear}'/>;

								document.getElementById("calYear").value = y; 
						     </script> -->   
						     <option value="2000">2000</option>
						     <option value="2001">2001</option>
						     <option value="2002">2002</option>
						     <option value="2003">2003</option>
						     <option value="2004">2004</option>
						     <option value="2005">2005</option>
						     <option value="2006">2006</option>
						     <option value="2007">2007</option>
						     <option value="2008">2008</option>
						     <option value="2009">2009</option>
						     <option value="2010">2010</option>
						     <option value="2011">2011</option>
						     <option value="2012">2012</option>
						     <option value="2013">2013</option>
						     <option value="2014">2014</option>
						     <option value="2015">2015</option>
						     <option value="2016">2016</option>
						     <option value="2017" selected>2017</option>
						     <option value="2018">2018</option>
						     <option value="2019">2019</option>
						     <option value="2020">2020</option>
						     <option value="2021">2021</option>
						     <option value="2022">2022</option>
						     <option value="2023">2023</option>
						     <option value="2024">2024</option>
						     <option value="2025">2025</option>
						     <option value="2026">2026</option>
						     <option value="2027">2027</option>
						     <option value="2028">2028</option>
						     <option value="2029">2029</option>
						     <option value="2030">2030</option>
						</select>
					</td>
				</tr>
				<tr>
					<td width="30%">日历月份</td>
					<td>
						<select name="cal.calMonth" id="calMonth" style="width:90px" size="1">   
	                        <option value="1">1</option>   
	                        <option value="2">2</option>   
	                        <option value="3">3</option>   
	                        <option value="4">4</option>   
	                        <option value="5">5</option>   
	                        <option value="6">6</option>   
	                        <option value="7">7</option>   
	                        <option value="8">8</option>   
	                        <option value="9">9</option>   
	                        <option value="10">10</option>   
	                        <option value="11">11</option>   
	                        <option value="12">12</option>   
						</select>
						<script language="javascript">  
							m = <c:out value='${cal.calMonth}' />;

							document.getElementById("calMonth").value = m; 
					    </script> 
					</td>
				</tr>
				<tr>
					<td width="30%">是否显示年份</td>
					<td>
						<input type="radio" name="cal.yearLabelhow" <s:if test="#request.cal.yearLabelhow==0">checked</s:if> value="false">否
						&nbsp;
						<input type="radio" name="cal.yearLabelhow" <s:if test="#request.cal.yearLabelhow==1">checked</s:if> value="true">是
					</td>
				</tr>	
				<tr>
					<td width="30%">是否显示月份</td>
					<td>
						<input type="radio" name="cal.monthLabelShow" <s:if test="#request.cal.monthLabelShow==0">checked</s:if> value="false">否
						&nbsp;
						<input type="radio" name="cal.monthLabelShow" <s:if test="#request.cal.monthLabelShow==1">checked</s:if> value="true">是
					</td>
				</tr>	
				<tr>
					<td width="30%">是否显示周次</td>
					<td>
						<input type="radio" name="cal.dayLabelShow" <s:if test="#request.cal.dayLabelShow==0">checked</s:if> value="false">否
						&nbsp;
						<input type="radio" name="cal.dayLabelShow" <s:if test="#request.cal.dayLabelShow==1">checked</s:if> value="true">是
					</td>
				</tr>	
				<tr>
					<td width="30%">日历方格宽度</td>
					<td><input type="text" name="cal.cellWidth" value="<c:out value='${cal.cellWidth}' />" /></td>
				</tr>
				<tr>
					<td width="30%">日历方格高度</td>
					<td><input type="text" name="cal.cellHeight" value="<c:out value='${cal.cellHeight}' />" /></td>
				</tr>
				<tr>
					<td width="30%">日历方格颜色</td>
					<td><input type="text" class="setColorSelect" name="cal.calItemStyleColor" value="<c:out value='${cal.calItemStyleColor}' />" /></td>
				</tr>
				<tr>
					<td width="30%">日历方格高亮颜色</td>
					<td><input type="text" name="cal.calVisualMapColor" value="<c:out value='${cal.calVisualMapColor}' />" /></td>
				</tr>
			</table>
				</table>
			</div>
		</div>
	</div>
	 
		</form>
</body>