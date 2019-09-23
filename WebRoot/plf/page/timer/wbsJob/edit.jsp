<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="新增webservice事务" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
	</jsp:include>
	<style type="text/css">
	.widget .layui-form-select{
width:710px;
}
	</style>
</head>
<body>
	<div class="all">
		<div class="add_table_div">
			<form id="addForm" class="layui-form" name="editForm" action="${path}sys/websJobMagAction_editWebs.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.UP_ID" />
				<table class="add_table">
					
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="接口名称" />
						</td>
						<td colspan="4">
							<s:textfield  id="MODEL_NAME" cssStyle="width:100%" maxlength="100" name="paraMap.MODEL_NAME" onkeyup="javascript:replaceLikeVal(this)" cssClass="_VAL_NULL _VAL_DATABASE" />
						</td>
					</tr>
					<tr>
					<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="接口说明" />
						</td>
						<td  colspan="4">
							<s:textfield  maxlength="300" cssStyle="width:100%" id="MODEL_MEMO" name="paraMap.MODEL_MEMO" onkeyup="javascript:replaceLikeVal(this)" cssClass="_VAL_NULL _VAL_DATABASE"  />
						</td>
					</tr>
					<tr >
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="事务名称" />
						</td>
						<td colspan="4">
							<s:textfield cssStyle="width:100%"  id="jobName" name="wbs.jobName"  onkeyup="javascript:replaceLikeVal(this)"/>
						</td>
					</tr>
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="详细说明" />
						</td>
						<td colspan="4">
								<s:textfield cssStyle="width:100%" id="jobDec" name="wbs.jobDec"  onkeyup="javascript:replaceLikeVal(this)"/>
						</td>
					</tr>
					<s:if test="${isOpenAuth==0}">
						<s:hidden name="paraMap.USER_DATA_AUTH" ></s:hidden>
					</s:if>
					<s:else>
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="组织机构" />
						</td>
						<td style="width: 270px;"  class="widget" colspan="4">
							  <select name="paraMap.USER_DATA_AUTH"  lay-verify="required"  id="userDataAuth" lay-search>
							       <c:forEach items="${dataAuthMap}" var="listData">
							        <s:if test="${paraMap.USER_DATA_AUTH==null&&dataAuthTop== listData.ID}">
							       		<option value="${listData.ID}" selected="selected"><dict:lang value="${listData.NAME}" /></option>
							       </s:if>
							       <s:elseif test="${listData.ID==paraMap.USER_DATA_AUTH}">
							       		<option value="${listData.ID}" selected="selected"><dict:lang value="${listData.NAME}" /></option>
							       </s:elseif>
							       <s:else>
	       							   <option value="${listData.ID}"><dict:lang value="${listData.NAME}" /></option>
	       							</s:else>
	  							   </c:forEach>
							   </select>
						</td>
					</tr>
					</s:else>
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="请求wsc接口" />
						</td>
						<td style="width: 270px;">
							<div id="paraMap_SEARCH_UI_div1" style="" class="layui-input-inline">
							<s:textfield id="websName" name="wbs.wscName"  readonly="true" cssClass="input_indent" />
							<i class="layui-icon layui-icon-search" onclick="selectW();" style="position: absolute;top:11px;right: 8px;"></i>
							</div>
								<a href="javascript:void(0);" onclick="selectW();" onchange="genFunc();" style="display:none;">
									<dict:lang value="选择" />
								</a>
							<s:hidden id="wscId" name="wbs.wscId"/>
						</td>
						<td>
							&nbsp;
						</td>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="调用方法" />
						</td>
						<td style="width: 270px;">
<%--							<s:select list="funcMap" name="wbs.func" id="" headerKey="" headerValue="请选择"/>--%>
							<s:textfield id="func" name="wbs.func"/>
						</td>
					</tr>
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<dict:lang value="请求参数" />
						</td>
						<td colspan="4">
								<s:textfield id="param"  cssStyle="width:100%" name="wbs.param"/>
								 
						</td>
					</tr>
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<dict:lang value="自定义参数" />
						</td>
						<td colspan="4">
							<div id="paraMap_SEARCH_UI_div" style="width:100%" class="layui-input-inline">
							<s:textfield  id="className1" name="wbs.paraCodeName" cssStyle="width:100%" readonly="true" cssClass="input_indent" />
							<i class="layui-icon layui-icon-search" onclick="showEditCode();" style="position: absolute;top:11px;right: 8px;"></i>
							</div>
							<div style="display:none;">
							<s:if test="wbs.paraCodeName!=null&&wbs.paraCodeName!=''">
									<a href="javascript:void(0);" onclick="showEditCode();">
									<span id="paraButton"><dict:lang value='编辑' /></span>
									</a>
							</s:if>
							<s:else>
									<a href="javascript:void(0);" onclick="showEditCode();">
											<span id="paraButton"><dict:lang value='新增' /></span>
									</a>
							</s:else>
							</div>
							<s:hidden id="codeType" name="wbs.paraCodeType"/>
							<s:textarea id="classCode" name="paraMap.paraClsCode" value="%{paraMap.paraClsCode}" cssStyle="display:none;word-wrap: normal;" wrap="off"/>
							<s:hidden id="paraCodeId" name="wbs.paraCodeId"/>
						</td>
					</tr> 
					<tr> 
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<dict:lang value="参数占位符解析" />
						</td>
						<td colspan="4">
						<input type="button"  onclick="getField()" id="getFieldBtn" class="layui-btn" value="<dict:lang value="获取字段" />" />
						<table id="FieledTable"  style="display:none;width:80%" class="table_list">
							<thead>
								<tr>
										<th width="35%" text-align="center"><dict:lang value="占位符内容" /></th>
										<th width="30%" text-align="center"><dict:lang value="是否替换" /></th>
										<th width="35%" text-align="center"><dict:lang value="替换内容" /></th>
								</tr>
							</thead>
							<tbody id="FieledTableBy">
							
							</tbody>
						</table>
						</td>
					</tr>
				</table>
				<div class="ptop_10 txac">
					<input type="button" value="<dict:lang value="清空" />" onclick="clean(this);" class="layui-btn layui-btn-primary">
					<input type="button" value="<dict:lang value="提交" />" lay-submit lay-filter="*" onclick="/*commit(this);*/" class="layui-btn">
					<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin();" class="layui-btn layui-btn-danger">
				</div>
				<s:hidden id="paramFunc" name="wbs.paramFunc"></s:hidden>
				<s:hidden id="websId" name="paraMap.websId"></s:hidden>
				<s:hidden name="paraMap.id" ></s:hidden>
				<input type="hidden" name="paraMap.MC_ID_MYSQL" value="<s:property value="dataMap.MC_ID_MYSQL" />" />
				<input type="hidden" name="paraMap.MC_ID_SQLSERVER" value="<s:property value="dataMap.MC_ID_SQLSERVER" />" />
				<input type="hidden" name="paraMap.MC_ID_ORACLE" value="<s:property value="dataMap.MC_ID_ORACLE" />" />
				<input type="hidden" name="paraMap.MC_ID_BASE" value="<s:property value="dataMap.MC_ID_BASE" />" />
				<input type="hidden" name="paraMap.MC_ID_PG" value="<s:property value="dataMap.MC_ID_PG" />" />
			</form>
		</div>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

	<script type="text/javascript">
	var isSumbit=false;
	var flag=false;//是否获取到字段
	var holderArr=null;//替换字符数组
	var paramArr=null;//参数数组
	function replaceLikeVal(comp){  
		util.replaceLikeVal(comp);
    }
	function clean(){
		//top.util.confirm(cleanConfirm);
		cleanConfirm();
	}
	$(function(){
		$("#MODEL_NAME").attr("lay-verify","required");
		$("#MODEL_MEMO").attr("lay-verify","required");
		$("#jobName").attr("lay-verify","required");
		$("#jobDec").attr("lay-verify","required");
		$("#websName").attr("lay-verify","required");
		$("#func").attr("lay-verify","required");
		
		 $("#param").attr("lay-verify","param_valid");
		 
	});

	 var form;
	layui.use('form', function(){
		form = layui.form;
	 	 
	 	form.on('submit(*)', function(data){
	 		commit();
	 	});
	 	
	 	form.verify({
		  		param_valid: function(value, item){ //value：表单的值、item：表单的DOM对象
		   		 try{
		   		 	var param=$("#param").val();
		   		 	param=eval('('+param+')');
		   		 }catch(e){
		   		 	return "<dict:lang value="请求参数格式错误" />";
		   		 }
		  }
		});
		
	 });
	function cleanConfirm(){
		$("#jobName").val("");
		$("#jobDec").val("");
		$("#websName").val("");
		$("#wscId").val("");
		$("#func").val("");
		$("#param").val("");
		$("#className1").val("");
		$("#paraCodeType").val("");
		$("#classCode").val("");
		$("#paraCodeId").val("");
		isSumbit=false;
		flag=false;
		$("#FieledTable").css('display','none');
		$("#FieledTableBy").html("");
	}
	function cancel(){
		parent.closePopWin();
	}
	function selectW(){
		var mcIframeName = window.frameElement.name;
		var menuId=$("#wscId").val();
		var url = "${path}sys/websJobMagAction_selectWebs.ms?menuId="+menuId+"&paraMap.piframeName="+mcIframeName;
		showPopWin(url, 350, 400,null,"<dict:lang value="触发器事务选择" />" );	
	}
	function getField(){
		var param=$("#param").val();
		if(val.isBlank(param)){
			util.alert("请输入请求参数！再点击获取字段按钮");
			return false
		}
		var reg=/(\[@([0-9a-zA-Z]*)\])/g
		holderArr=param.match(reg);
		var hasArr={};
		if(holderArr==null){
			util.alert("请输入请求参数value值,格式为 [@任意字母或者数字]");
			return false
		}else{
			for(var i=0;i<holderArr.length;i++){//去除重复占位符
				if(hasArr[holderArr[i]]){
					holderArr.remove(i);
				}
				hasArr[holderArr[i]]=true;
			}
		}
		hasArr={};
		param=eval('('+param+')')
		for(key in param){
			if(key.match(reg)){
				util.alert("方法名请不要使用占位符");
			}
			if(hasArr[key]){
				util.alert("请不要输入重复方法名");
				return false;
			}
			hasArr[key]=true;
		}
		var className=$("#className1").val();
		var classCode=$("#classCode").val();
		if(className==""){
			util.alert("请输入自定义参数类");   
			return false
		}
		getFiledAjax(holderArr,className,classCode)
	}
	function getFiledAjax(holderArr,className,classCode){
		var context=null;
		var text=null;
	
		$.ajax({
			type : "POST",
			dataType : "json",
			url : "${path}sys/websJobMagAction_getField.ms",
			data : {"paraMap.className":className,"paraMap.clsCode":classCode},
			success : function(data) {
				var arr=data.ajaxList
				if(arr==null){
					util.alert("获取字段失败！");
					return;
				}
				if(arr!=null&&arr.length>0){
					flag=true;
					$("#FieledTable").css('display','block');
					for(var j=0;j<arr.length;j++){
						if(j==0){
							text="<option value='"+arr[j]+"' selected=\"selected\">"+arr[j]+"</option>"
						}else{
							text+="<option value='"+arr[j]+"'>"+arr[j]+"</option>"	
						}
					}
					
					for(var i=0;i<holderArr.length;i++){
						if(i==0){
						context="<tr>"
						}else{
							context+="<tr>"
						}
						context+="<td width=\"35%\" text-align=\"center\">"+holderArr[i]+"</td>"
						+"<td width=\"30%\" text-align=\"center\">"
						+"<select id=\"select1_"+holderArr[i]+"\"width=\"50px\">"
						+"	<option value=\"1\" selected=\"selected\"  ><dict:lang value='是' /></option>"
						+"	<option value=\"0\" ><dict:lang value='否' /></option>"
						+"</select></td>"
						+"<td width=\"35%\" text-align=\"center\"><select id=\"select2_"+holderArr[i]+"\">"
						context+=text;
						context+="</select></td></tr>"
					}
				}
				util.alert("获取字段成功");
				$("#FieledTableBy").html(context);
				form.render("select");
			},
			error : function(msg) {
				flag=false;
				util.closeLoading();
				util.alert("获取字段失败："+msg);
			}
		});
	}
	function showEditCode(){
	//	var url = "${path}sys/websJobMagAction_toEditCode.ms";
		var classId=$("#paraCodeId").val();
		var url = "${path}sys/websJobMagAction_toEditCode.ms?paraMap.tableName=MS_JOB_WEBS&paraMap.colName=PARA_CODE_ID&paraMap.tpl=autoParam&paraMap.CODE_ID="+classId+"&paraMap.piframeName="+window.frameElement.name+"&paraMap.toFlag=interface";
		
		showPopWin(url, '99%', '99%',null,"<dict:lang value="新增类源码"/>");
		
	}
	function commit(){
		var param=$("#param").val();
		if(!vailCommit()){
			return;
		}
		if(flag)
		{
			var replace=null;
			var key=null;
			var paramFunc="[";
			param=eval('('+param+')')
			$("#FieledTable tbody tr").each(function(seq,length){
				 var tdArr=$(this).children();
				 holder=tdArr.eq(0).text();
				 replace=tdArr.eq(1).find("select").val();
				 selectKey=tdArr.eq(2).find("select").val();
				 for(key in param){
						if(param[key].indexOf(holder)>=0){
							 paramFunc+="{\"param\":\""+key+"\",\"holder\":\""+holder+"\",replace:\""+replace+"\",key:\""+selectKey+"\"}";
						}
					}
				 if(seq!=$("#FieledTable tbody tr").length-1){
					 paramFunc += ",";
				}
			});
			paramFunc+="]"
			$("#paramFunc").val(paramFunc);
		}
		
		if(isSubmit){
			document.forms.editForm.submit();
		}
		isSubmit = true;
	}
	
	
	function vailCommit(){
		var jobName=$("#jobName").val();
		var jobDec=$("#jobDec").val();
		var websName=$("#websName").val();
		var func=$("#func").val();
		if(!val.valNullData()){
			isSubmit=false;
			return false;
		}
		if(!val.valOjbsData()){
			isSubmit=false;
			return false;
		}
		if(!val.valDataBaseSetData()){
			isSubmit=false;
			return false;
		}
		if(val.isBlank(jobName)){
			isSubmit=false;
			//util.alert("<dict:lang value="事务名称必输" />");
			alterWindows("<dict:lang value="事务名称必输" />",5);
			return false;
		}
		if(val.isBlank(jobDec)){
			isSubmit=false;
			//util.alert("<dict:lang value="详细说明必输" />");
			alterWindows("<dict:lang value="详细说明必输" />",5);
			return false;
		}
		if(val.isBlank(websName)){
			isSubmit=false;
			//util.alert("<dict:lang value="请求wsc接口必输" />");
			alterWindows("<dict:lang value="请求wsc接口必输" />",5);
			return false;
		}
		if(val.isBlank(func)){
			isSubmit=false;
			//util.alert("<dict:lang value="调用方法必输" />");
			alterWindows("<dict:lang value="调用方法必输" />",5);
			return false;
		}
		isSubmit=true;
		return true;
	}
	function updateCodeData(codeType,className,classCode) {
			$("#className1").val(className)
			$("#codeType").val(codeType);
			$("#classCode").val(classCode);
			$("#paraButton").text("编辑");
	}
	function reloadPg(msg){
		isSubmit = false;
		window.parent.reloadPg(msg);
	}
	function getInitAjax(jsonObj,className,classCode){
		var context=null;
		var text="";
		$.ajax({
			type : "POST",
			dataType : "json",
			url : "${path}sys/websJobMagAction_getField.ms",
			data : {"paraMap.className":className,"paraMap.clsCode":classCode},
			success : function(data) {
				var arr=data.ajaxList
				if(arr==null){
					util.alert("获取字段失败！");
					return;
				}
				if(arr!=null&&arr.length>0){
					flag=true;
					$("#FieledTable").css('display','block');
					for(var i=0;i<jsonObj.length;i++){
						holder=jsonObj[i].holder;
						replace=jsonObj[i].replace;
						key=jsonObj[i].key;
						text="";
						for(var j=0;j<arr.length;j++){
							
							if(arr[j]==key){
								text+="<option value='"+key+"' selected=\"selected\">"+key+"</option>"
							}else{
								text+="<option value='"+arr[j]+"'>"+arr[j]+"</option>"	
							}
						}
						
						if(i==0){
							context="<tr>"
						}else{
							context+="<tr>"
						}
						context+="<td width=\"35%\" text-align=\"center\">"+holder+"</td>"
						+"<td width=\"30%\" text-align=\"center\">"
						+"<select id=\"select1_"+holder+"\"width=\"50px\">"
						if(replace==1){
							context+="	<option value=\"1\" selected=\"selected\"  ><dict:lang value='是' /></option>"
								+"	<option value=\"0\" ><dict:lang value='否' /></option>"
						}
						if(replace==0){
							context+="	<option value=\"0\" selected=\"selected\"  ><dict:lang value='否' /></option>"
								+"	<option value=\"1\" ><dict:lang value='是' /></option>"
						}
						context+="</select></td>"
						+"<td width=\"35%\" text-align=\"center\"><select id=\"select2_"+holder+"\">"
						context+=text;
						context+="</select></td></tr>"
					}
				}
				$("#FieledTableBy").html(context);
				form.render("select");
			},
			error : function(msg) {
				flag=false;
				util.closeLoading();
				util.alert("获取字段失败："+msg);
			}
		});
	}
	$(function(){
		var paramFunc=$("#paramFunc").val();
		if(!val.isBlank(paramFunc)){
			var jsonObj=eval(paramFunc);
			var className=$("#className1").val();
			var classCode=$("#classCode").val();
			getInitAjax(jsonObj,className,classCode)
			
		}
		
	})
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	
	</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>