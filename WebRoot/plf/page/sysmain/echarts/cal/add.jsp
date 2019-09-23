<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<head>
<title><dict:lang value="日历图新增配置" />
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
	setColor($(".setColorSelect"));
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
    	for(var i = 0;i < aList.length; i++){
    		arr.push("<tr class="+configTr+">");
    		arr.push("<td><input type='text' name='cal.datas["+i+"].label' ></td>");
    		arr.push("<td><input type='text' class='isNum' name='cal.datas["+i+"].key' ></td>");
    		arr.push("</tr>");
    	}
    	$("."+configTr).remove();
    	lastTr.html(arr.join(""));
    }

    function getJsonDataFields(data){
    	if(data){
    		var JsonData = data[0];
    		var aList = [];
    		for(var key in JsonData){
    			var colObj = new Object();
    			colObj["filedName"] = key;
    			aList.push(colObj);
    		};
    		setFieldData(aList,"calDataConfigTr","calColTitle");
    	};
    }


    $("#getCalFieldBtn").click(function(){
    	var chartsDataSources = $("#CHARTS_DATA_SOURCES").val();
    	if(chartsDataSources == "1"){
    		getFieldBySql("calDataConfigTr","calColTitle");
    	}else if(chartsDataSources == "2"){
    		getFieldByJava("calDataConfigTr","calColTitle");
    	}else{
    		var jsonCalSourceFun = $("#jsonCalSourceFun").val();
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
	};
});
});

function addCalAttr(thisObj){
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
		};
	}else{
		var calJsonSourceFun = $("#calJsonSourceFun").val();
		if(calJsonSourceFun == ""){
			_alertValMsg($("#calJsonSourceFun"),"<dict:lang value="数据源不能为空" />");
			return;
		};
	}
	if(!isNum()){
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
            url: "${path}charts/calAction_cacheAdd.ms",
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
		};
	});
	return validates;
}


function showEditCode(){
	var calJavaClass = $("#calJavaClass").val();
	var calJavaCodeType = $("#calCodeType").val();
	var calJavaClsCode = $("#calClsCode").val();
	var calJavaClsCodeId = $("#calClsCodeId").val();
	var popWinframeId = window.frameElement.id+"PopWin";
    var url = "${path}charts/calAction_cfgClsCode.ms?paraMap.CLASS_NAME="+calJavaClass+"&paraMap.codeType="+calJavaCodeType
			/* +"&paraMap.clsCode="+calJavaClsCode */+"&paraMap.CODE_ID="+calJavaClsCodeId+"&paraMap.piframeName="+window.frameElement.id
			+"&paraMap.piframeId="+window.frameElement.id+"&paraMap.popWinframeId="+popWinframeId;
	showPopWinFp(url, $(top.document).width()*0.90, $(top.document).height()*0.90,null,"<dict:lang value="修改类源码"/>",popWinframeId);
}
</script>
</head>
<body>
<button type="button" onclick="addCalAttr(this);" class="_save"><i class="ico"></i><dict:lang value="保存" /></button> 
<form id="addForm" name="addForm" action="${path}charts/calAction_doAdd.ms" method="post" >
	<div class="all">
		 <input type="hidden" id ="chartsDataSources"  name="chartsConfig.chartsDataSources"  />
             <input type="hidden" id ="chartsType"  name="chartsConfig.chartsType"  />
           <div class="dataSource">
            <h3>数据源</h3>
            <table border='1' id="leftTable">
                <tr class="sql">
                    <td>SQL语句</td>
                    <td colspan="5" style="padding:5px;">数据库适配：
                        <label><input type="radio" name="cal.calCodeType" value="commql" id="cal_codeType_comm" checked="checked">通用语句</label>
                        <label><input type="radio" name="cal.calCodeType" value="oracle" id="cal_codeType_oracle" >ORACLE</label>
                        <label><input type="radio" name="cal.calCodeType" value="sqlserver" id="cal_codeType_sqlserver" >SQLSERVER</label>
                        <label><input type="radio" name="cal.calCodeType" value="mysql" id="cal_codeType_mysql" >MYSQL</label>
                        <label><input type="radio" name="cal.calCodeType" value="pgsql" id="cal_codeType_pgsql" >PGSQL</label>
                   		<textarea id="cal_comm_sql" class="commql" name="cal.calComm" rows="6" style="margin-top:5px;height:200px;"></textarea>
						<textarea id="cal_oracle_sql" class="oracle" name="cal.calOracle" rows="6" style="display: none;margin-top:5px;height:200px;"></textarea>
						<textarea id="cal_sqlserver_sql" class="sqlserver" name="cal.calSqlserver" rows="6" style="display: none;margin-top:5px;height:200px;"></textarea>
						<textarea id="cal_mysql_sql" class="mysql" name="cal.calMysql" rows="6" style="display: none;margin-top:5px;height:200px;"></textarea>
						<textarea id="cal_pg_sql" class="pgsql" name="cal.calPgsql" rows="6" style="display: none;margin-top:5px;height:200px;"></textarea>
                    </td>
                </tr> 
                <tr class="javaClass">
                    <td>JAVA类</td>
                    
                      <td colspan="4">
                    <input type="text" name="cal.calJavaClass" id="calJavaClass">
                    <input type="hidden" name="cal.calJavaCodeType" id="calCodeType">
                    <input type="hidden"  id="calClsCode">
                     <input type="hidden" name="cal.calJavaClsCodeId" id="calClsCodeId">
                    </td>
                    <td>
							<a href="javascript:void(0);" id="calJavaClassText" onclick="showEditCode();">
								<dict:lang value="新增" />
							</a>
                    </td>
                </tr>
               <tr class="jsonStr">
                    <td>JSON字符串</td>
                    <td colspan="5">
                     <textarea name="cal.jsonCalSourceFun" id ="jsonCalSourceFun"></textarea>
                    </td>
                </tr>
                
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
					<td><input type="text" class="setColorSelect" name="chartsConfig.titleTextColor"  value="#000000" /></td>
				</tr>
				<tr>
					<td width="30%">标题字号</td>
					<td><input type="text" name="chartsConfig.titleTextFontSize" value="15" /></td>
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
					<td><input type="text" name="chartsConfig.titleSubtextFontSize"  value="12" /></td>
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
					<td><input type="text" name="chartsConfig.canvasWidth"  value="600" /></td>
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
					<%--<input type="text" name="chartsConfig.eventClick"  />
				--%></td>
				</tr>
				<tr>
					<td width="30%">背景图url</td>
					<td><input type="text" name="chartsConfig.backgroundUrl" /></td>
				</tr>
				<tr>
					<td width="30%">背景图透明度(100为完全不透明,0为完全透明)</td>
					<td><input type="text" name="chartsConfig.backgroundAlpha"  value="100" /></td>
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
						<input type="radio" name="cal.tooltipShow" checked value="true">显示
						<input type="radio" name="cal.tooltipShow" value="false">不显示
					</td>
				</tr>
				<tr>
					<td width="30%">鼠标指上时是否显示提示信息标题</td>
					<td><input type="text" name="cal.tooltipName" value="" /></td>
				</tr>
				<tr>
					<td width="30%">日历年度</td>
					<td>
						 <select name="cal.calYear" id="calYear" style="width:90px" size="1">  
						    <c:forEach var="calYear" begin="2000" end="2030" step="1">
						     <option value="<c:out value='${calYear}'/>"><c:out value='${calYear}'/></option>   
						    </c:forEach> 
						 </select> 
						  <script language="javascript"> 
						    var myDate = new Date();  
							y = myDate.getFullYear();
							$("#calYear").val(y);
					    </script> 
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
							var myDate = new Date();  
							m = myDate.getMonth()+1;
							$("#calMonth").val(m);
							//document.getElementById("calMonth").value = m; 
					    </script> 
					</td>
				</tr>
				<tr>
					<td width="30%">是否显示年份</td>
					<td>
						<input type="radio" name="cal.yearLabelhow" checked value="false">否
						&nbsp;
						<input type="radio" name="cal.yearLabelhow" value="true">是
					</td>
				</tr>	
				<tr>
					<td width="30%">是否显示月份</td>
					<td>
						<input type="radio" name="cal.monthLabelShow" checked value="false">否
						&nbsp;
						<input type="radio" name="cal.monthLabelShow" value="true">是
					</td>
				</tr>	
				<tr>
					<td width="30%">是否显示周次</td>
					<td>
						<input type="radio" name="cal.dayLabelShow" value="false">否
						&nbsp;
						<input type="radio" name="cal.dayLabelShow" checked value="true">是
					</td>
				</tr>		
				<tr>
					<td width="30%">日历方格宽度</td>
					<td><input type="text" name="cal.cellWidth" value="100" /></td>
				</tr>
				<tr>
					<td width="30%">日历方格高度</td>
					<td><input type="text" name="cal.cellHeight" value="100"  /></td>
				</tr>
				<tr>
					<td width="30%">日历方格颜色</td>
					<td><input type="text" class="setColorSelect" name="cal.calItemStyleColor" value=""  /></td>
				</tr>
				<tr>
					<td width="30%">日历方格高亮颜色</td>
					<td><input type="text" name="cal.calVisualMapColor" value="" /></td>
				</tr>
			</table>
	</div>
			</div></div>
			
	
</form>
</body>