<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   <base href="${path}" />
  <title><dict:lang value="DMP服务查看"/></title>
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
        <div class="headline"><dict:lang value="查看" /></div>
       	<div class="Subtitle">
            <h3><dict:lang value="服务" /></h3>
        </div>
        <form class="layui-form searchDiv searchDivBig" action="">
	        <div class="layui-row">
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="组织机构"/></div>
	                <div class="search_r" title="<dict:lang value='选择DMP所属的组织机构'/>">
	                    <select id="dataauth" name="dataauth"  disabled="true" >
					        <option placeholder='请选择...' value=''><dict:lang value="--请选择--"/></option>
					    </select>
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="服务ID"/></div>
	                <div class="search_r" title="<dict:lang value='DMP服务的唯一标识码，用户可自定义输入'/>">
	                    <input type="text" name="DMP_ID" id="DMP_ID" value="${dataMap.dmpServiceList[0].DMP_ID}"  readonly="readonly"  maxlength="50" class="layui-input"  value="">
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="服务名称"/></div>
	                <div class="search_r" title="<dict:lang value='针对DMP服务的描述内容'/>">
	                   	<input type="text"  name="DMP_REMARK" id="DMP_REMARK" value="${dataMap.dmpServiceList[0].DMP_REMARK}"  readonly="readonly" maxlength="50" class="layui-input">
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="MC地址"/></div>
	                <div class="search_r" title="<dict:lang value='一般情况下为N2的访问地址'/>">
	                   	<input type="text"  name="n2url" id="n2url" maxlength="50"  readonly="readonly" class="layui-input">
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="语种"/></div>
	                <div class="search_r" title="<dict:lang value='DMP服务输出消息的语种'/>">
	                   	<select id="lang" name="lang"  disabled="true">
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
	                    <input type="text" placeholder="100"  name="maxprocessor" id="maxprocessor" maxlength="50"  readonly="readonly" class="layui-input">
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="接口请求超时时间(ms)"/></div>
	                <div class="search_r" title="<dict:lang value='外部对象访问DMP服务的Http接口超时的时间，同样适用于PDA的Http驱动'/>">
	                    <input type="text" placeholder="30000"  name="waitinterval" id="waitinterval"  maxlength="50"  readonly="readonly" class="layui-input">
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="线程池最小容量"/></div>
	                <div class="search_r" title="<dict:lang value='设置过小DMP服务会执行自动扩容，扩容会间断性的影响DMP服务内部任务的执行效率，建议值40，可随设备的增多进行增加'/>">
	                   	<input type="text" placeholder="40" name="minpoolsize" id="minpoolsize" maxlength="50"  readonly="readonly" class="layui-input">
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="线程池最大容量"/></div>
	                <div class="search_r" title="<dict:lang value='设置过大会造成资源浪费，建议值150，可随设备的增多进行增加'/>">
	                   	<input type="text" placeholder="150" name="maxpoolsize" id="maxpoolsize" maxlength="50"  readonly="readonly" class="layui-input">
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="组件通道最大值"/></div>
	                <div class="search_r" title="<dict:lang value='DMP服务内部任务缓存通道，当DMP执行效率降低时，设置过小会造成任务丢失，建议值500'/>">
	                   	<input type="text" placeholder="500" name="channelsize" id="channelsize" maxlength="50"  readonly="readonly" class="layui-input">
	                </div>
	            </div>
	            <div class="searchItem displayFor1">
	                <div class="search_l"><dict:lang value="指令是否走缓存数据"/></div>
	                <div class="search_r">
	                    <select  name="isbufferinfo" id="isbufferinfo"  disabled="true">
	                    	<option value=""><dict:lang value="--请选择--"/></option>
					        <option value="Y"><dict:lang value="是"/></option>
					        <option value="N"><dict:lang value="否"/></option>
					    </select>
	                </div>
	            </div>
	            <div class="searchItem displayFor1">
	                <div class="search_l"><dict:lang value="指令模式"/></div>
	                <div class="search_r">
	                   	<dict:selectDict  disabled="true"  laysearch=""  dictCode="INSTR_MODE" dictValue="%{TYPE}"  id="mode" name="mode" custom_option="<option placeholder='请选择...' value=''>%{getText('--请选择--')}</option>" />
	                </div>
	            </div>
	            <div class="searchItem displayFor1">
	                <div class="search_l"><dict:lang value="监控器池执行频率(ms)"/></div>
	                <div class="search_r">
	                   	<input type="text" name="interval" id="interval" maxlength="50"  readonly="readonly" class="layui-input">
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="是否记录日志"/></div>
	                <div class="search_r" title="<dict:lang value='是否记录DMP服务中指令运行的日志'/>">
	                   	<select  name="logiclogger" id="logiclogger"  disabled="true">
	                   		<option value=""><dict:lang value="--请选择--"/></option>
					        <option value="Y"><dict:lang value="是"/></option>
					        <option value="N"><dict:lang value="否"/></option>
					    </select>
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="掉线最大检测次数"/></div>
	                <div class="search_r" title="<dict:lang value='设备异常掉线、人为关闭、网络异常时，DMP服务会对设备连接状态进行检测，当达到最大检测值时，DMP服务内部会触发设备掉线处理，建议值10'/>">
	                    <input type="text" placeholder="10" name="disconnectiontimes" id="disconnectiontimes"  readonly="readonly"  maxlength="50"  class="layui-input">
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="Http接口最大请求数"/></div>
	                <div class="search_r" title="<dict:lang value='外部对象访问DMP服务Http接口的最大数量，同样适用于PDA的Http驱动，建议值1000'/>">
	                   	<input type="text" placeholder="1000" name="maxrequester" id="maxrequester" maxlength="50"  readonly="readonly" class="layui-input">
	                </div>
	            </div>
	            <div class="searchItem displayFor1">
	                <div class="search_l"><dict:lang value="PDA接口连入方式"/></div>
	                <div class="search_r">
	                   	<dict:selectDict  disabled="true" laysearch=""  name="interfacetype" id="interfacetype" dictCode="INTERFACETYPE" dictValue="%{TYPE}"  custom_option="<option placeholder='请选择...' value=''>%{getText('--请选择--')}</option>" />
	                </div>
	            </div>
	            <div class="searchItem displayFor1">
	                <div class="search_l"><dict:lang value="运行日志保留天数"/></div>
	                  <div class="search_r">
	                     	<input type="text" name="saveday" id="saveday" maxlength="50"  readonly="readonly" class="layui-input">
	                  </div>
	              </div>
	          </div>
	      </form>
          <div class="Subtitle">
              <h3><dict:lang value="设置IP池"/></h3>
              <div class="operates">
	               <%--<span class="ico add" id="addRow"></span>
	               <span class="ico del" id="delRow"></span>
	           --%>
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
              <button type="button" class="layui-btn" id="editButten" onclick="preEdit()"><dict:lang value="编辑"/></button> 
              <button class="layui-btn layui-btn-danger" onclick="backListPage()" type="button"><dict:lang value="取消" /></button>   
	      </div> 
    </div>
    
<script type="text/javascript" src="${path}plf/page/bussmodel/dmp/js/echarts.js"></script>
<script>
	function preAdd(){
	    var url = "${path}dmp/DmpServiceAction_dmpServiceAdd.ms";
	    window.location.href= url;
	}

    function preEdit(){
        var url = "${path}dmp/DmpServiceAction_dmpServicelEdit.ms?paraMap.DMP_ID="+$("#DMP_ID").val()+"&returnType=edit";
 	    window.location.href= url;
    }
	
	function backListPage(){
		var url = "${path}dmp/DmpServiceAction_getDmpServiceList.ms?FUNC_CODE=F_dd7e3f95a6534576b26abcdc6941b352";
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
	      	operHtml=operHtml+"<td><input type='text' maxlength='50'  readonly='readonly' class='removeBord layui-input' value='"+startIp+"'></td>";
	      	operHtml=operHtml+"<td><input type='text' maxlength='50'  readonly='readonly' class='removeBord layui-input' value='"+endIp+"'></td>";
	      	operHtml=operHtml+"</tr>";
		}
		$(".ipTable tbody").append(operHtml);
		$("#dataauth").attr("disabled",true);
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
	
	layui.use(['element','form'], function(){
        var element = layui.element
        var form = layui.form	
    	
	    //删除行
	    $('#delRow').click(function(){
	    	$('.ipTable tbody input[type="checkbox"]:checked').parents('tr').remove()
	    })
	    
	    //添加行
	    $('#addRow').click(function(){
	    	$('.ipTable tbody').append('<tr><td><input type="checkbox" lay-skin="primary"></td><td><input type="text" class="layui-input"></td><td><input type="text" class="layui-input"></td></tr>')
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