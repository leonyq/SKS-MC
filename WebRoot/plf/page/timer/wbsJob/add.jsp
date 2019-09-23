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
width:728px;
}
	</style>
</head>
<body>
	<div class="all">
		<div class="add_table_div">
			<form id="addForm" class="layui-form" name="addForm" action="${path}sys/websJobMagAction_addWebs.ms" method="post" target="submitFrame">
				
				<table class="add_table">
					
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="事务名称" />
						</td>
						<td colspan="4">
							<s:textfield cssStyle="width:100%"  id="jobName" name="wbs.jobName" onkeyup="javascript:replaceLikeVal(this)" />
						</td>
					</tr>
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="详细说明" />
						</td>
						<td  colspan="4">
								<s:textfield cssStyle="width:100%" id="jobDec" name="wbs.jobDec"  onkeyup="javascript:replaceLikeVal(this)"/>
						</td>
					</tr>
					<s:if test="${isOpenAuth==0}">
						<s:hidden name="paraMap.USER_DATA_AUTH" value="${dataAuthTop}"></s:hidden>
					</s:if>
					<s:else>
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="组织机构" />
						</td>
						<td style="width: 270px;" class="widget" colspan="4">
							  <select name="paraMap.USER_DATA_AUTH"  lay-verify="required"  id="userDataAuth" lay-search>
							       <c:forEach items="${dataAuthMap}" var="listData">
							        <s:if test="${dataAuthTop== listData.ID}">
							       		<option value="${listData.ID}" selected="selected"><dict:lang value="${listData.NAME}" /></option>
							       </s:if>
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
								<s:textfield cssStyle="width:100%" id="param" name="wbs.param" />
						</td>
					</tr>
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<dict:lang value="自定义参数" />
						</td>
						<td colspan="4">
							<div id="paraMap_SEARCH_UI_div" style="width:100%" class="layui-input-inline">
							<input type="text" id="paraCodeName" name="wbs.paraCodeName" style="width:100%" readonly="readonly" class="input_indent" >
							<i class="layui-icon layui-icon-search" onclick="showEditCode();" style="position: absolute;top:11px;right: 8px;"></i>
							</div>
							<div style="display:none;">
							<a href="javascript:void(0);" onclick="showEditCode();">
									<span id="paraButton"><dict:lang value='新增' /></span>
							</a>
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
						<input type="button"  onclick="getField()" id="getFieldBtn" class="layui-btn"  value="<dict:lang value="获取字段" />" />
						<table id="FieledTable"  style="display:none;width:80%">
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
					<input type="button" value="<dict:lang value="保存" />" lay-submit lay-filter="*" onclick="/*add(this);*/" class="layui-btn">
					<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin();" class="layui-btn layui-btn-danger">
				</div>
				<s:hidden id="paramFunc" name="wbs.paramFunc"></s:hidden>
				<s:hidden id="upId" name="paraMap.UP_ID" />
			<s:hidden id="workType" name="paraMap.FLAG"/>
			<s:hidden id="modelMemo" name="paraMap.MODEL_MEMO"/>
			<s:hidden id="modelName" name="paraMap.MODEL_NAME"/>
			<s:hidden id="type" name="paraMap.TYPE"/>
			<s:hidden id="className1" name="paraMap.className"/>
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
	var flag=false;
	var holderArr=null;//替换字符数组
	var paramArr=null;//参数数组
	function clean(){
		//util.confirm(cleanConfirm,"",null);
		cleanConfirm();
	}
	function replaceLikeVal(comp){  
		util.replaceLikeVal(comp)
    }
	function returnBack(){
		document.forms.addForm1.submit();
	}
	$(function(){
		$("#jobName").attr("lay-verify","required");
		$("#jobDec").attr("lay-verify","required");
		$("#websName").attr("lay-verify","required");
		$("#func").attr("lay-verify","required");
	});
	 var form;
	layui.use('form', function(){
		 form = layui.form;
	 	 
	 	form.on('submit(*)', function(data){
	 		add();
	 	});
	 });
	function cleanConfirm(){
		$("#jobName").val("");
		$("#jobDec").val("");
		$("#websName").val("");
		$("#wscId").val("");
		$("#func").val("");
		$("#param").val("");
		$("#paraCodeName").val("");
		$("#codeType").val("");
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
		var menuId=$("#wscId").val();
		var piframeName = window.frameElement.name;
		var url = "${path}sys/websJobMagAction_selectWebs.ms?menuId="+menuId+"&paraMap.piframeName="+piframeName;
		showPopWin(url, 350, 400,null,"<dict:lang value="触发器事务选择" />" );	
	}
	function getFrameName(name){
		var curIframeName = name;
		var curWindow=getSrcByIframeName({mcIframeName:curIframeName,type:'window'});
		console.log(curWindow);
		console.log(curWindow.contentWindow);
		curWindow.contentWindow.closePage();
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
		var paraCodeName=$("#paraCodeName").val();
		var classCode=$("#classCode").val();
		if(paraCodeName==""){
			util.alert("请输入自定义参数类");
			return false
		}
		var context=null;
		var text=null;
		$.ajax({
			type : "POST",
			dataType : "json",
			url : "${path}sys/websJobMagAction_getField.ms",
			data : {"paraMap.className":paraCodeName,"paraMap.clsCode":classCode},
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
				$("#FieledTableBy").html(context);
				form.render("select");
				util.alert("获取字段成功！");
			},
			error : function(msg) {
				flag=false;
				util.closeLoading();
				util.alert("获取字段失败："+msg);
			}
		});
	}
	
	function showEditCode(){
		//var url = "${path}sys/websJobMagAction_toEditCode.ms";
		var classId=$("#paraCodeId").val();
		var paraCodeName=$("#paraCodeName").val();
		var url = "${path}sys/websJobMagAction_toEditCode.ms?paraMap.tableName=MS_JOB_WEBS&paraMap.colName=PARA_CODE_ID&paraMap.tpl=autoParam&paraMap.CODE_ID="+classId+"&dataMap.CLASS_NAME="+paraCodeName+"&paraMap.piframeName="+window.frameElement.name+"&paraMap.toFlag=interface";
		showPopWin(url, '99%', '99%',null,"<dict:lang value="新增类源码"/>");
		
	}
	function add(){
		var param=$("#param").val();
		if(!vailCommit()){
			return;
		}
		if(flag)
		{
			var replace=null;
			var key=null;
			var paramKey=null;
			var paramFunc="[";
			param=eval('('+param+')');
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
			paramFunc+="]";
			$("#paramFunc").val(paramFunc);
		}
		
		if(isSubmit){
			document.forms.addForm.submit();
		}
		isSubmit = true;
	}
	function vailCommit(){
		var jobName=$("#jobName").val();
		var jobDec=$("#jobDec").val();
		var websName=$("#websName").val();
		var func=$("#func").val();
		var param=$("#param").val();
		if(val.isBlank(jobName)){
			isSubmit=false;
			util.alert("<dict:lang value="事务名称必输" />");
			return false;
		}
		if(val.isBlank(jobDec)){
			isSubmit=false;
			util.alert("<dict:lang value="详细说明必输" />");
			return false;
		}
		if(val.isBlank(websName)){
			isSubmit=false;
			util.alert("<dict:lang value="请求wsc接口必输" />");
			return false;
		}
		if(val.isBlank(func)){
			isSubmit=false;
			util.alert("<dict:lang value="调用方法必输" />");
			return false;
		}
		isSubmit=true;
		return true;
	}
	function updateCodeData(codeType,className,classCode) {
			$("#paraCodeName").val(className)
			$("#codeType").val(codeType);
			$("#classCode").val(classCode);
			$("#paraButton").text("编辑");
	}
	function reloadPg(msg){
		isSubmit = false;
		window.parent.reloadPg(msg);
	}
		function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>