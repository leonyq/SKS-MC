<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   <base href="${path}" />
  <title><dict:lang value="DMP服务修改"/></title>
  <%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="列表显示查询条件" /></title>
	<jsp:include page="/plf/common/pub_head_layui.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="serializeForm" value="1" />
		<jsp:param name="dmp" value="1" />
	</jsp:include>
 <style type="text/css">
 	.headline{
 		margin-bottom: 0;
 	}
   .displayFor1{
       display:none!important;
    }
 .removeBord {
    border:none;
 }    
 </style>
</head>

<body>
    <div class="layui-fluid" style="padding-bottom:78px;overflow: auto;">
        <div class="headline"><dict:lang value="修改" /></div>
       	<div class="Subtitle">
            <h3><dict:lang value="服务" /></h3>
        </div>
        <form class="layui-form searchDiv searchDivBig" action="">
        	<input type="text" class="layui-input" style="display:none;" name="returnType" id="returnType"  value="${param.returnType}">
	        <div class="layui-row">
	            <div class="searchItem">
	                <div class="search_l"><span class="Eng">*</span><dict:lang value="组织机构"/></div>
	                <div class="search_r" title="<dict:lang value='选择DMP所属的组织机构'/>">
	                    <select id="dataauth" name="dataauth">
					        <option placeholder='请选择...' value=''><dict:lang value="--请选择--"/></option>
					    </select>
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><span class="Eng">*</span><dict:lang value="服务ID"/></div>
	                <div class="search_r" title="<dict:lang value='DMP服务的唯一标识码，用户可自定义输入'/>">
	                    <input type="text" name="DMP_ID" id="DMP_ID" value="${dataMap.dmpServiceList[0].DMP_ID}"  readonly="readonly"  maxlength="50" class="layui-input">
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><span class="Eng">*</span><dict:lang value="服务名称"/></div>
	                <div class="search_r" title="<dict:lang value='针对DMP服务的描述内容'/>">
	                   	<input type="text"  name="DMP_REMARK" id="DMP_REMARK" value="${dataMap.dmpServiceList[0].DMP_REMARK}" maxlength="50" class="layui-input">
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><span class="Eng">*</span><dict:lang value="MC地址"/></div>
	                <div class="search_r" title="<dict:lang value='一般情况下为N2的访问地址'/>">
	                   	<input type="text"  name="n2url" id="n2url" maxlength="50" class="layui-input">
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><span class="Eng">*</span><dict:lang value="语种"/></div>
	                <div class="search_r" title="<dict:lang value='DMP服务输出消息的语种'/>">
	                   	<select id="lang" name="lang">
					        <option placeholder='请选择...' value=''><dict:lang value="--请选择--"/></option>
					    </select>
	                </div>
	            </div>
	        </div>
	    </form>
        <div class="Subtitle">
            <h3><dict:lang value="性能和属性" /></h3>
        </div>
        <form class="layui-form searchDiv searchDivSmall" action="">
	        <div class="layui-row">
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="内部处理器数量"/></div>
	                <div class="search_r" title="<dict:lang value='DMP服务内部执行任务调度的对象，增大或缩小会影响DMP处理效率，建议值为100，可根据设备数量增多进行增加'/>">
	                    <input type="text" placeholder="50"  name="maxprocessor" id="maxprocessor" maxlength="50" class="layui-input">
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="接口请求超时时间(ms)"/></div>
	                <div class="search_r" title="<dict:lang value='外部对象访问DMP服务的Http接口超时的时间，同样适用于PDA的Http驱动'/>">
	                    <input type="text" placeholder="30000"  name="waitinterval" id="waitinterval"  maxlength="50"  class="layui-input">
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="线程池最小容量"/></div>
	                <div class="search_r" title="<dict:lang value='设置过小DMP服务会执行自动扩容，扩容会间断性的影响DMP服务内部任务的执行效率，建议值40，可随设备的增多进行增加'/>">
	                   	<input type="text" placeholder="10" name="minpoolsize" id="minpoolsize" maxlength="50" class="layui-input">
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="线程池最大容量"/></div>
	                <div class="search_r" title="<dict:lang value='设置过大会造成资源浪费，建议值150，可随设备的增多进行增加'/>">
	                   	<input type="text" placeholder="200" name="maxpoolsize" id="maxpoolsize" maxlength="50" class="layui-input">
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="组件通道最大值"/></div>
	                <div class="search_r" title="<dict:lang value='DMP服务内部任务缓存通道，当DMP执行效率降低时，设置过小会造成任务丢失，建议值500'/>">
	                   	<input type="text" placeholder="300" name="channelsize" id="channelsize" maxlength="50" class="layui-input">
	                </div>
	            </div>
	            <div class="searchItem displayFor1">
	                <div class="search_l"><dict:lang value="指令是否走缓存数据"/></div>
	                <div class="search_r">
	                    <select  name="isbufferinfo" id="isbufferinfo">
	                    	<option value=""><dict:lang value="--请选择--"/></option>
					        <option value="Y"><dict:lang value="是"/></option>
					        <option value="N"><dict:lang value="否"/></option>
					    </select>
	                </div>
	            </div>
	            <div class="searchItem displayFor1">
	                <div class="search_l"><dict:lang value="指令模式"/></div>
	                <div class="search_r">
	                   	<dict:selectDict  laysearch=""  dictCode="INSTR_MODE" dictValue="%{TYPE}"  id="mode" name="mode" custom_option="<option placeholder='请选择...' value=''>%{getText('--请选择--')}</option>" />
	                </div>
	            </div>
	            <div class="searchItem displayFor1">
	                <div class="search_l"><dict:lang value="监控器池执行频率(ms)"/></div>
	                <div class="search_r">
	                   	<input type="text" name="interval" id="interval" maxlength="50" class="layui-input">
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="是否记录日志"/></div>
	                <div class="search_r" title="<dict:lang value='是否记录DMP服务中指令运行的日志'/>">
	                   	<select  name="logiclogger" id="logiclogger">
	                   		<option value=""><dict:lang value="--请选择--"/></option>
					        <option value="Y"><dict:lang value="是"/></option>
					        <option value="N"><dict:lang value="否"/></option>
					    </select>
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="掉线最大检测次数"/></div>
	                <div class="search_r" title="<dict:lang value='设备异常掉线、人为关闭、网络异常时，DMP服务会对设备连接状态进行检测，当达到最大检测值时，DMP服务内部会触发设备掉线处理，建议值10'/>">
	                    <input type="text" placeholder="10" name="disconnectiontimes" id="disconnectiontimes"  maxlength="50"  class="layui-input">
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="Http接口最大请求数"/></div>
	                <div class="search_r" title="<dict:lang value='外部对象访问DMP服务Http接口的最大数量，同样适用于PDA的Http驱动，建议值1000'/>">
	                   	<input type="text" placeholder="1000" name="maxrequester" id="maxrequester" maxlength="50"  class="layui-input">
	                </div>
	            </div>
	            <div class="searchItem displayFor1">
	                <div class="search_l"><dict:lang value="PDA接口连入方式"/></div>
	                <div class="search_r">
	                   	<dict:selectDict  laysearch=""  name="interfacetype" id="interfacetype" dictCode="INTERFACETYPE" dictValue="%{TYPE}"  custom_option="<option placeholder='请选择...' value=''>%{getText('--请选择--')}</option>" />
	                </div>
	            </div>
	            <div class="searchItem displayFor1">
	                <div class="search_l"><dict:lang value="运行日志保留天数"/></div>
	                  <div class="search_r">
	                     	<input type="text" name="saveday" id="saveday" maxlength="50" class="layui-input">
	                  </div>
	              </div>
	          </div>
	      </form>
          <div class="Subtitle">
              <h3><dict:lang value="设置IP池"/></h3>
              <div class="operates">
	               <span class="ico add" id="addRow"></span>
	               <span class="ico del" id="delRow"></span>
	           </div>
          </div>
          <div class="layui-form" lay-filter="ipTable">
			  <table class="layui-table ipTable">
			    <colgroup>
			      <col width="40">
			      <col>
			    </colgroup>
			    <thead>
			      <tr>
			        <th><input type="checkbox" lay-skin="primary" lay-filter="selectAll"></th>
			        <th><dict:lang value="起始IP"/></th>
			        <th><dict:lang value="结束IP"/></th>
			      </tr> 
			    </thead>
			    <tbody>
			      <%--<tr>
			        <td><input type="checkbox" lay-skin="primary"></td>
			        <td><input type="text" maxlength="50" class="layui-input"></td>
			        <td><input type="text" maxlength="50" class="layui-input"></td>
			      </tr>--%>
			     </tbody>
			  </table>
		  </div>
          <div class="ptop_10">
          	  <!-- <button class="layui-btn">新增</button> -->
          	  <!-- 编辑页面多一个新增   backListPage()-->
          	  <button type="button" class="layui-btn" id="addButten" onclick="preAdd()"><dict:lang value="新增"/></button>   
              <button class="layui-btn"  type="button"  lay-filter="filterSubmit"  onclick="submitForm()" type="button"><dict:lang value="保存" /></button>  <!-- lay-filter="filterSubmit" lay-submit="formSubmit"  -->
              <button class="layui-btn layui-btn-danger" onclick="window.history.back();" type="button"><dict:lang value="取消" /></button>   
	      </div> 
    </div>
    
<script type="text/javascript" src="${path}plf/page/bussmodel/dmp/js/echarts.js"></script>
<script>
	function backListPage(){
		var url = "${path}dmp/DmpServiceAction_getDmpServiceList.ms?FUNC_CODE=F_dd7e3f95a6534576b26abcdc6941b352";
	    window.location.href= url;
	}

	function preAdd(){
	    var url = "${path}dmp/DmpServiceAction_dmpServiceAdd.ms";
	    window.location.href= url;
	}
	
	function onProChange(){
		//var tcsRemark = $("#orderSetDto_tcsRemark").val();
		//if(tcsRemark.length>100) $("#orderSetDto_tcsRemark").val(tcsRemark.substr(0,100));
	}
	
	function backListPage(){
		var url = "${path}dmp/DmpServiceAction_getDmpServiceList.ms";
	    window.location.href= url;
	}
	init();
	function init(){
		getSelInfo();
		fillBackInfo();
	}
	function fillBackInfo(){
		var dmpParamList=${dataMap.dmpParamList};
		for(var i=0;i<dmpParamList.length;i++){
			var paramFlag=dmpParamList[i].PARAM_FLAG;
			var paramVal=dmpParamList[i].PARAM_VALUE;
			if(paramFlag=="service.dataauth"){$("#dataauth").val(paramVal);}
			if(paramFlag=="service.n2url"){$("#n2url").val(paramVal);}
			if(paramFlag=="host.lang"){$("#lang").val(paramVal);}
			if(paramFlag=="service.maxprocessor"){$("#maxprocessor").val(paramVal);}
			if(paramFlag=="service.request.waitinterval"){$("#waitinterval").val(paramVal);}
			if(paramFlag=="service.minpoolsize"){$("#minpoolsize").val(paramVal);}
			if(paramFlag=="service.maxpoolsize"){$("#maxpoolsize").val(paramVal);}
			if(paramFlag=="component.channelsize"){$("#channelsize").val(paramVal);}
			if(paramFlag=="instr.isbufferinfo"){$("#isbufferinfo").val(paramVal);}
			if(paramFlag=="instr.mode"){$("#mode").val(paramVal);}
			if(paramFlag=="host.monitorexcute.interval"){$("#interval").val(paramVal);}
			if(paramFlag=="host.logiclogger"){$("#logiclogger").val(paramVal);}
			if(paramFlag=="dev.auto.disconnectiontimes"){$("#disconnectiontimes").val(paramVal);}
			if(paramFlag=="http.maxrequester"){$("#maxrequester").val(paramVal);}
			if(paramFlag=="http.pda.interfacetype"){$("#interfacetype").val(paramVal);}
			if(paramFlag=="host.runlogger.saveday"){$("#saveday").val(paramVal);}
			
		}
		var operHtml="";
		var dmpIpList=${dataMap.dmpIpList};
		console.log(dmpIpList)
		for(var i=0;i<dmpIpList.length;i++){
			var startIp=dmpIpList[i].START_IP;
			var endIp=dmpIpList[i].END_IP;
	      	operHtml=operHtml+"<tr>";
	      	operHtml=operHtml+"<td><input type='checkbox' lay-skin='primary'></td>";
	      	operHtml=operHtml+"<td><input type='text' maxlength='50' class='layui-input removeBord' value='"+startIp+"'></td>";
	      	operHtml=operHtml+"<td><input type='text' maxlength='50' class='layui-input removeBord' value='"+endIp+"'></td>";
	      	operHtml=operHtml+"</tr>";
		}
		$(".ipTable tbody").append(operHtml);
	}
	function getSelInfo(){
		var operHtml="";
		var operHtml2="";
		var jsondata={"type":"2"};
		var url = "${path}dmp/DmpServiceAction_getSelInfo.ms";
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    async:false,
	    data:jsondata,
		success: function(data){	
			if(null !=data.ajaxMap){	
				var i=0;
				$.each(data.ajaxMap,function(key,values){
					i++;
					if(key=="dataAuthList"){
						$.each(values, function(i, paraDto) {
				    	    if(paraDto.NAME==""){paraDto.NAME="";}
				    		operHtml=operHtml+"<option value='"+paraDto.ID+"' >"+paraDto.NAME+"</option>";
						}); 
					}
					if(key=="languageList"){
						$.each(values, function(i, paraDto) {
				    	    operHtml2=operHtml2+"<option value='"+paraDto.LANGUAGE_CODE+"' >"+paraDto.LANGUAGE_NAME+"</option>";
						}); 
					}
					});
				}
				$("#dataauth").append(operHtml);
				$("#lang").append(operHtml2);
			},
			error: function(msg){
				util.alert("error:"+msg);
		   }
		});
	}
	function submitForm(){
		if($("#dataauth").val()==""){
			$("#dataauth").val("");
	    	layer.msg("<dict:lang value='组织机构不能为空'/>", {time: 1000, icon:5});
	    	return;
		}
		if($("#DMP_ID").val()==""){
			$("#DMP_ID").val("");
	    	layer.msg("<dict:lang value='服务ID不能为空'/>", {time: 1000, icon:5});
	    	return;
		}
		if($("#DMP_REMARK").val()==""){
			$("#DMP_REMARK").val("");
	    	layer.msg("<dict:lang value='服务名称不能为空'/>", {time: 1000, icon:5});
	    	return;
		}
		if($("#n2url").val()==""){
			$("#n2url").val("");
	    	layer.msg("<dict:lang value='MC地址不能为空'/>", {time: 1000, icon:5});
	    	return;
		}
		if($("#lang").val()==""){
			$("#lang").val("");
	    	layer.msg("<dict:lang value='语种不能为空'/>", {time: 1000, icon:5});
	    	return;
		}
		var dataauth = $("#dataauth").val();//组织机构
		var DMP_ID = $("#DMP_ID").val();//服务ID
		var DMP_REMARK = $("#DMP_REMARK").val();//服务说明
		var n2url = $("#n2url").val();//MC地址
		var lang = $("#lang").val();//语种
		var maxprocessor = $("#maxprocessor").val();//内部处理器数量
		var waitinterval = $("#waitinterval").val();//接口请求超时时间
		var minpoolsize = $("#minpoolsize").val();//线程池最小容量
		var maxpoolsize = $("#maxpoolsize").val();//线程池最大容量
		var channelsize = $("#channelsize").val();//组件通道最大值
		var isbufferinfo = $("#isbufferinfo").val();//指令是否走缓存数据
		var mode = $("#mode").val();//指令模式
		var interval = $("#interval").val();//监控器池执行频率
		var logiclogger = $("#logiclogger").val();//是否记录日志
		var disconnectiontimes = $("#disconnectiontimes").val();//掉线最大检测次数
		var maxrequester = $("#maxrequester").val();//Http接口最大请求数
		var interfacetype = $("#interfacetype").val();//PDA接口连入方式
		var saveday = $("#saveday").val();//运行日志保留天数
		

		if(!/^(\+)?\d*$/.test(maxprocessor)){
			$("#maxprocessor").val("");          
			layer.msg("<dict:lang value='内部处理器数量只能为正整数'/>", {time: 1000, icon:5});
			return;
        }
		if(!/^(\+)?\d*$/.test(waitinterval)){
			$("#waitinterval").val("");          
			layer.msg("<dict:lang value='接口请求超时时间只能为正整数'/>", {time: 1000, icon:5});
			return;
        }
		if(!/^(\+)?\d*$/.test(minpoolsize)){
			$("#minpoolsize").val("");          
			layer.msg("<dict:lang value='线程池最小容量只能为正整数'/>", {time: 1000, icon:5});
			return;
        }
		if(!/^(\+)?\d*$/.test(maxpoolsize)){
			$("#maxpoolsize").val("");          
			layer.msg("<dict:lang value='线程池最大容量只能为正整数'/>", {time: 1000, icon:5});
			return;
        }
		if(!/^(\+)?\d*$/.test(channelsize)){
			$("#channelsize").val("");          
			layer.msg("<dict:lang value='组件通道最大值只能为正整数'/>", {time: 1000, icon:5});
			return;
        }
		if(!/^(\+)?\d*$/.test(interval)){
			$("#interval").val("");          
			layer.msg("<dict:lang value='监控器池执行频率只能为正整数'/>", {time: 1000, icon:5});
			return;
        }
		if(!/^(\+)?\d*$/.test(disconnectiontimes)){
			$("#disconnectiontimes").val("");          
			layer.msg("<dict:lang value='掉线最大检测次数只能为正整数'/>", {time: 1000, icon:5});
			return;
        }
		if(!/^(\+)?\d*$/.test(maxrequester)){
			$("#maxrequester").val("");          
			layer.msg("<dict:lang value='Http接口最大请求数只能为正整数'/>", {time: 1000, icon:5});
			return;
        }
		if(!/^(\+)?\d*$/.test(saveday)){
			$("#saveday").val("");          
			layer.msg("<dict:lang value='运行日志保留天数只能为正整数'/>", {time: 1000, icon:5});
			return;
        }
		
		var paramFlagList = {};
        var paramRemarkList = {};
        var paramValueList = {};
        paramFlagList[0] = "service.dataauth";   paramRemarkList[0] = "组织机构";   paramValueList[0] = dataauth;
        paramFlagList[1] = "service.n2url";   paramRemarkList[1] = "MC地址";   paramValueList[1] = n2url;
        paramFlagList[2] = "host.lang";   paramRemarkList[2] = "语种";   paramValueList[2] = lang;
        paramFlagList[3] = "service.maxprocessor";   paramRemarkList[3] = "内部处理器数量";   paramValueList[3] = maxprocessor;
        paramFlagList[4] = "service.request.waitinterval";   paramRemarkList[4] = "接口请求超时时间(ms)";   paramValueList[4] = waitinterval;
        paramFlagList[5] = "service.minpoolsize";   paramRemarkList[5] = "线程池最小容量";   paramValueList[5] = minpoolsize;
        paramFlagList[6] = "service.maxpoolsize";   paramRemarkList[6] = "线程池最大容量";   paramValueList[6] = maxpoolsize;
        paramFlagList[7] = "component.channelsize";   paramRemarkList[7] = "组件通道最大值";   paramValueList[7] = channelsize;
        paramFlagList[8] = "instr.isbufferinfo";   paramRemarkList[8] = "指令是否走缓存数据";   paramValueList[8] = isbufferinfo;
        paramFlagList[9] = "instr.mode";   paramRemarkList[9] = "指令模式";   paramValueList[9] = mode;
        paramFlagList[10] = "host.monitorexcute.interval";   paramRemarkList[10] = "监控器池执行频率(ms)";   paramValueList[10] = interval;
        paramFlagList[11] = "host.logiclogger";   paramRemarkList[11] = "是否记录日志";   paramValueList[11] = logiclogger;
        paramFlagList[12] = "dev.auto.disconnectiontimes";   paramRemarkList[12] = "掉线最大检测次数";   paramValueList[12] = disconnectiontimes;
        paramFlagList[13] = "http.maxrequester";   paramRemarkList[13] = "Http接口最大请求数";   paramValueList[13] = maxrequester;
        paramFlagList[14] = "http.pda.interfacetype";   paramRemarkList[14] = "PDA接口连入方式";   paramValueList[14] = interfacetype;
        paramFlagList[15] = "host.runlogger.saveday";   paramRemarkList[15] = "运行日志保留天数";   paramValueList[15] = saveday;
        var returnType = $("#returnType").val();
    	var operHtml = "";
        var i=0;
        var beginIpList = {};
        var endIpList = {};
        
        var tempFlag=true;
    	$(".ipTable tbody tr").each(function(i){
			var trObj=$(this);
			var beginIp=trObj.find("td:eq(1) input").val();
			var endIp=trObj.find("td:eq(2) input").val();
			if($.trim(beginIp)==""){
				layer.msg("<dict:lang value='起始IP不能为空'/>", {time: 1000, icon:5});
				tempFlag=false;
		    	return;
			}
			if($.trim(endIp)==""){
				layer.msg("<dict:lang value='结束IP不能为空'/>", {time: 1000, icon:5});
				tempFlag=false;
		    	return;
			}
			if(checkip(beginIp)==false){
				layer.msg("<dict:lang value='起始IP不符合规范'/>", {time: 1000, icon:5});
				tempFlag=false;
		    	return;
			}
			if(checkip(endIp)==false){
				layer.msg("<dict:lang value='结束IP不符合规范'/>", {time: 1000, icon:5});
				tempFlag=false;
		    	return;
			}
			beginIpList[i] = beginIp;
			endIpList[i] = endIp;
			i++;
		});
    	if(tempFlag==false){
    		return;
    	}
    	//var jsondata={"paraMap.dataauth":dataauth,"paraMap.DMP_ID":DMP_ID,"paraMap.DMP_REMARK":DMP_REMARK,"paraMap.n2url":n2url,
    	//    	"paraMap.lang":lang,"paraMap.maxprocessor":maxprocessor,"paraMap.waitinterval":waitinterval,"paraMap.minpoolsize":minpoolsize,
    	//    	"paraMap.maxpoolsize":maxpoolsize,"paraMap.channelsize":channelsize,"paraMap.isbufferinfo":isbufferinfo,"paraMap.mode":mode,
    	//    	"paraMap.interval":interval,"paraMap.logiclogger":logiclogger,"paraMap.disconnectiontimes":disconnectiontimes,
    	//    	"paraMap.maxrequester":maxrequester,"paraMap.interfacetype":interfacetype,"paraMap.saveday":saveday,
    	//    	"paraMap.beginIpList":JSON.stringify(beginIpList),"paraMap.endIpList":JSON.stringify(endIpList)};
    	var jsondata={"paraMap.DMP_ID":DMP_ID,"paraMap.DMP_REMARK":DMP_REMARK,"paraMap.returnType":returnType,"paraMap.paramFlagList":JSON.stringify(paramFlagList),
    			"paraMap.paramRemarkList":JSON.stringify(paramRemarkList),"paraMap.paramValueList":JSON.stringify(paramValueList),
    	    	"paraMap.beginIpList":JSON.stringify(beginIpList),"paraMap.endIpList":JSON.stringify(endIpList)};
    	
    	var url = "${path}dmp/DmpServiceAction_dmpServiceEditInfo.ms";
    	jQuery.ajax({
    		type: "POST",
    	    dataType: "json",
    	    url: url,
    	    data: jsondata,
    	    async:false,
    		success: function(data){
                var result = data.ajaxString;
                if(result.indexOf("SUCCESS")!=-1){
                	if(result=="SUCCESS"){
                		window.history.back();
                	}else if(result=="SUCCESS2"){
                		var url = "${path}dmp/DmpServiceAction_dmpServicelView.ms?paraMap.DMP_ID="+DMP_ID;//?paraMap.UP_ID="+$("#up_id").val()+"&paraMap.typeFlag="+$("#typeFlag").val()+"&paraMap.mcIframeName="+window.parent.name;
    	                window.location.href= url;
                	}
                }else{
                 	if(result=="FAIL1"){
    	             	layer.msg("<dict:lang value='起始IP已存在,请更换'/>", {time: 1000, icon:5});
    	            }else if(result=="FAIL2"){
    	             	layer.msg("<dict:lang value='结束IP已存在,请更换'/>", {time: 1000, icon:5});
    	            }else if(result=="FAIL3"){
    	             	layer.msg("<dict:lang value='结束IP不能小于起始IP'/>", {time: 1000, icon:5});
    	            }else if(result=="FAIL4"){
    	             	layer.msg("<dict:lang value='IP不允许交叉,请更换'/>", {time: 1000, icon:5});
    	            }else if(result=="FAIL5"){
    	             	layer.msg("<dict:lang value='起始IP和结束IP不在同一个IP段,请更换'/>", {time: 1000, icon:5});
    	            }else{
    	             	layer.msg("<dict:lang value='修改失败'/>", {time: 1000, icon:5});
    	            }
                }
    		},
    		error: function(msg){
    				 console.log(msg);
    			}
    	});
    }
	//校验是否已存在
    function validateCode(value){
   	  $.post("${path}dmp/DmpServiceAction_validateCode.ms",{value:value},function(res){
		    if(res.ajaxMap.state==1){
		    	$("#DMP_ID").val("");
		    	layer.msg("<dict:lang value='该服务ID已存在，请重新输入'/>", {time: 1000, icon:5});
		    }
      });
    }
	
    function checkip(ip)
    {
        var pcount = 0
        var ip_length = ip.length
        var ip_letters = "1234567890."
        for (p=0; p < ip_length; p++)
        {
	    var ip_char = ip.charAt(p)
	    if (ip_letters.indexOf(ip_char) == -1)
	    {
	         return false
	    }
        }
        for (var u = 0; u < ip_length; u++) { (ip.substr(u,1) == ".") ? pcount++ : pcount }
        if(pcount != 3) { return false }
        firstp = ip.indexOf(".")
        lastp = ip.lastIndexOf(".")
        str1 = ip.substring(0,firstp)
        ipstr_tmp = ip.substring(0,lastp)
        secondp = ipstr_tmp.lastIndexOf(".")
        str2 = ipstr_tmp.substring(firstp+1,secondp)
        str3 = ipstr_tmp.substring(secondp+1,lastp)
        str4 = ip.substring(lastp+1,ip_length)
        if (str1 == '' || str2 == '' || str3 == '' || str4 == '') { return false }
        if (str1.length > 3 || str2.length > 3 || str3.length > 3 || str4.length > 3) { return false }
        if (str1 <= 0 || str1 > 255) { return false }
        else if (str2 < 0 || str2 > 255) { return false }
        else if (str3 < 0 || str3 > 255) { return false }
        else if (str4 < 0 || str4 > 255) { return false }
        return true
    }
	
	layui.use(['element','form'], function(){
        var element = layui.element
        var form = layui.form	
    	
	    //删除行
	    $('#delRow').click(function(){
	    	$('.ipTable tbody input[type="checkbox"]:checked').parents('tr').remove()
	    })
	    
	    //添加行
	    $('#addRow').click(function(){
	    	$('.ipTable tbody').append('<tr><td><input type="checkbox" lay-skin="primary"></td><td><input type="text" class="layui-input removeBord"></td><td><input type="text" class="layui-input removeBord"></td></tr>')
	    	form.render('checkbox', 'ipTable') 
	    	$(".layui-fluid").scrollTop($(".layui-fluid")[0].scrollHeight); //滚动到最底
	    })
	    
	    //是否取消全选
	    form.on('checkbox(selectAll)', function(data){
            if(data.elem.checked){
                $('.ipTable').find('input[type="checkbox"]').prop("checked",true)
            }else{
                $('.ipTable').find('input[type="checkbox"]').prop("checked",false)
            }
            form.render('checkbox', 'ipTable') 
        }); 
    });
    
	
</script>	


</body>
</html>