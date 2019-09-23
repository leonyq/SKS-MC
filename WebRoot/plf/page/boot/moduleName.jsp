<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="模块名称" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
	</jsp:include>
</head>

<body>
	<div class="crumbs" id="crumbs" style="margin:5px 0px 0px 37px;">
    </div>
	<div class="all" >
		<div>
			<div  class="add_table_div">
			<form id="addForm" name="addForm" class="layui-form" action="${path}sys/moduleMagAction_moduleType.ms" method="post" >
			
			<input type="hidden" name="mcIframeName" value="${mcIframeName}">
				<input type="hidden" name="curIframeName" id="curIframeName" value="${curIframeName}">
				
				<table class="add_table">
					<tr>
						<td width="30%" class="tr1">
							<span class="Eng">*</span><dict:lang value="模块名称" />
						</td>
						<td width="70%">
							<s:textfield id="MODEL_NAME" maxlength="100" name="paraMap.MODEL_NAME"   cssClass="_VAL_NULL _VAL_DATABASE"   cssStyle="width:90%;" />
							
						</td>
					</tr>
						<tr>
						<td width="30%" class="tr1">
							<span class="Eng">*</span><dict:lang value="模块展示名称" />
						</td>
						<td width="70%">
							<s:textfield id="MODEL_SHOW_NAME" maxlength="300" name="paraMap.MODEL_SHOW_NAME"  cssClass="_VAL_NULL _VAL_DATABASE"   cssStyle="width:90%;" />
						
						</td>
					</tr>
						<tr>
						<td width="30%" class="tr1">
							<span class="Eng">*</span><dict:lang value="模块版本号" />
						</td>
						<td width="70%">
							<s:textfield id="MODEL_VERSION" maxlength="300" name="paraMap.MODEL_VERSION"  cssClass="_VAL_NULL _VAL_DATABASE"  cssStyle="width:90%;" />
						</td>
					</tr>
						<tr>
						<td width="30%" class="tr1">
							<span class="Eng">*</span><dict:lang value="模块组名称" />
						</td>
						<td width="70%">
							<s:textfield  id="MODELS_NAME" maxlength="300" name="paraMap.MODELS_NAME"  cssClass="_VAL_NULL _VAL_DATABASE"  cssStyle="width:90%;" />
						</td>
					</tr>
					<tr>
						<td width="30%" class="tr1">
							<span class="Eng">*</span><dict:lang value="模块说明" />
						</td>
						<td width="70%">
							<s:textarea id="MODEL_MEMO" name="paraMap.MODEL_MEMO" rows="2" 
							cssStyle="width:90%;overflow:auto;word-wrap:normal;height:90px" >
							</s:textarea>
						</td>
					</tr>
					<tr>
						<td width="30%" class="tr1">
							<span class="Eng">*</span><dict:lang value="数据库类型" />
						</td>
						<td width="70%">
								<input type="checkbox" id="ORACLE"  name="DATABASE"  value="ORACLE" style="width:30px" title="ORACLE"/>
										&nbsp;&nbsp;
								<input  type="checkbox" id="POSTGRESQL"  name="DATABASE" value="POSTGRESQL" style="width:30px" title="POSTGRESQL"/>
										&nbsp;&nbsp;
								<input  type="checkbox" id="MYSQL"  name="DATABASE" value="MYSQL" style="width:30px" title="MYSQL"/>
										&nbsp;&nbsp;
								<input  type="checkbox" id="SQLSERVER"  name="DATABASE" value="SQLSERVER" style="width:30px" title="SQLSERVER"/>
										&nbsp;&nbsp;
						
						</td>
					</tr>
					<tr>
						<td width="15%" class="tr1">
							<span class="Eng">*</span><dict:lang value="模块启动接口" />
						</td>
						<td colspan="3">
							<s:if test="paraMap.paraCodeName!=null&&paraMap.paraCodeName!=''">
									<!--  
									<a href="javascript:void(0);" onclick="showEditCode();">
									<span id="paraButton"><dict:lang value='编辑' /></span>
									</a>
									-->
									
									<div id="paraButton" style="" class="layui-input-inline">
                					<s:textfield  id="className2" cssClass="p_r_30" name="paraMap.paraCodeName"  readonly="true" />
                            		<i class="layui-icon layui-icon-search" onclick="showEditCode();" style="position: absolute;top:11px;right: 8px;"></i>
                      				</div>
                      			
							</s:if>
							<s:else>
									<!--  
									<a href="javascript:void(0);" onclick="showEditCode();">
											<span id="paraButton"><dict:lang value='新增' /></span>
									</a>
									-->
									
									<div id="paraButton" style="" class="layui-input-inline">
                					<s:textfield  id="className2" cssClass="p_r_30" name="paraMap.paraCodeName"  readonly="true"/>
                            		<i class="layui-icon layui-icon-search" onclick="showEditCode();" style="position: absolute;top:11px;right: 8px;"></i>
                      				</div>
									
							</s:else>
							<s:hidden id="codeType" name="paraMap.paraCodeType"/>
							<s:textarea id="classCode" name="paraMap.paraClsCode" value="%{paraMap.paraClsCode}" cssStyle="display:none;word-wrap: normal;" wrap="off"/>
							<s:hidden id="paraCodeId" name="paraMap.paraCodeId"/>
						</td>
					</tr> 
				</table>
				<input type="hidden" id="UP_ID" name="paraMap.UP_ID" value="<s:property value="ajaxMap.up_id"/>">
				<s:hidden id="MODEL_TYPE" name="paraMap.MODEL_TYPE"></s:hidden>
				<s:hidden id="MODEL_ID" name="paraMap.ID"></s:hidden>
				<s:hidden id="exportModule" name="paraMap.exportModule"></s:hidden>
				<s:hidden id="MODEL_START_ORDER" name="paraMap.MODEL_START_ORDER"></s:hidden>
				<s:hidden id="MODEL_DATABASE" name="paraMap.MODEL_DATABASE"></s:hidden>
				<s:hidden id="MC_ID_MYSQL" name="paraMap.MC_ID_MYSQL" />
				<s:hidden id="MC_ID_SQLSERVER" name="paraMap.MC_ID_SQLSERVER" />
				<s:hidden id="MC_ID_ORACLE" name="paraMap.MC_ID_ORACLE" />
				<s:hidden id="MC_ID_BASE" name="paraMap.MC_ID_BASE" />
				<s:hidden id="MC_ID_PG" name="paraMap.MC_ID_PG"  />
				<s:hidden id="PAGE_ORDER" name="paraMap.PAGE_ORDER"  />
				
				<div class="ptop_10 txac">
					<!--  
					<input id="nextButton" type="button" value="<dict:lang value="下一步" />"  onclick="next(this);" class="botton_img_add">
					-->
					
					<button id="nextButton" class="layui-btn layui-btn-warm" lay-filter="filterSubmit" lay-submit="formSubmit">下一步</button>
					<input id="cancleButton" type="button" value="<dict:lang value="取消" />" onclick="cancel(this);" class="layui-btn layui-btn-danger">
				</div>
		
			</form>
			</div>
		</div>
		
	</div>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

	<script type="text/javascript">
	var currentOrder=1;
	var isSubmit=false;
	var isCan=false;
	function showEditCode(){
		var mcIframeName = window.frameElement.name; //外层iframe的name
		//	var url = "${path}sys/websJobMagAction_toEditCode.ms";
			var classId=$("#paraCodeId").val();
			var url = "${path}sys/moduleMagAction_toEditCode.ms?paraMap.tableName=MS_MODULE_MAG&paraMap.colName=CLASS_CODE_ID&paraMap.tpl=startInterface&paraMap.CODE_ID="+classId+"&mcIframeName="+mcIframeName+"&paraMap.toFlag=zymk";
			if(classId==null){
				showPopWin(url, "99%", "99%",null,"<dict:lang value="类源码"/> <dict:lang value="新增"/>");
			}else{
				showPopWin(url, "99%", "99%",null,"<dict:lang value="类源码"/> <dict:lang value="编辑"/>");
			}
	}
	var pagename=null;
	$(function(){
		var MODEL_DATABASE= $("#MODEL_DATABASE").val();
		var database=MODEL_DATABASE.split(",");
		for(var i=0;i<database.length;i++){
			$("#"+database[i].trim()).attr('checked', true)
		}
		var PAGE_ORDER=$("#PAGE_ORDER").val();
		var html="<ul>";
		if(PAGE_ORDER!=""){
			var pageorders=PAGE_ORDER.split(",");
			if(pageorders.length!=11){
				for(var i=0;i<pageorders.length;i++){
					pagename=null;
					pageName(pageorders[i])
					if(pageorders[i]==currentOrder){//当前为1时
						html+="<li class=\"doing\"> <div class=\"line transparent\"></div>"+
			            "<div class=\"num\">"+pageorders[i]+"</div>"+
			            "<div class=\"line\"></div>"+
			            "<div class=\"text\"><a>"+pagename+"</a></div></li>"
						continue;
					}else{
							html+="<li class=\"done\"> <div class=\"line\"></div>"+
				            "<div class=\"num\">"+pageorders[i]+"</div>"+
				            "<div class=\"line line_right\"></div>"+
				            "<div class=\"text\"><a onclick=\"pageGo("+pageorders[i]+");return false\" style=\"cursor:pointer\">"+pagename+"</a></div></li>"
				            continue;
					}
		       	 }
				for(var j=pageorders.length+1;j<12;j++){
					pagename=null;
					pageName(j)
					if(j==11){
						html+="<li class=\"undone\"> <div class=\"line\"></div>"+
			            "<div class=\"num\">"+j+"</div>"+
			            "<div class=\"text\"><a>"+pagename+"</a></div></li>"
			            continue;
					}else{
						html+="<li class=\"undone\"> <div class=\"line\"></div>"+
			            "<div class=\"num\">"+j+"</div>"+
			            "<div class=\"line\"></div>"+
			            "<div class=\"text\"><a>"+pagename+"</a></div></li>"
			            continue;
					}
				}
			}else{
				for(var i=0;i<pageorders.length;i++){
						pagename=null;
						pageName(pageorders[i])
						if(pageorders[i]==currentOrder){//当前为1时
							html+="<li class=\"doing\"> <div class=\"line transparent\"></div>"+
				            "<div class=\"num\">"+pageorders[i]+"</div>"+
				            "<div class=\"line\"></div>"+
				            "<div class=\"text\"><a>"+pagename+"</a></div></li>"
							continue;
						}else if(i==pageorders.length-1){
								html+="<li class=\"done\"> <div class=\"line\"></div>"+
					            "<div class=\"num\">"+pageorders[i]+"</div>"+
					            "<div class=\"text\"><a onclick=\"pageGo("+pageorders[i]+");return false\" style=\"cursor:pointer\">"+pagename+"</a></div></li>"
					            continue;
						}else{
								html+="<li class=\"done\"> <div class=\"line\"></div>"+
					            "<div class=\"num\">"+pageorders[i]+"</div>"+
					            "<div class=\"line\"></div>"+
					            "<div class=\"text\"><a onclick=\"pageGo("+pageorders[i]+");return false\" style=\"cursor:pointer\">"+pagename+"</a></div></li>"
					            continue;
						}
	            }
			}
			html+="</ul>";
		}else{
			for(var i=1;i<12;i++){
				pagename=null;
				pageName(i)
				if(i==1){//当前为1时
					html+="<li class=\"doing\"> <div class=\"line transparent\"></div>"+
		            "<div class=\"num\">"+i+"</div>"+
		            "<div class=\"line\"></div>"+
		            "<div class=\"text\"><a>"+pagename+"</a></div></li>"
					continue;
				}else if(i==11){
						html+="<li class=\"undone\"> <div class=\"line\"></div>"+
			            "<div class=\"num\">"+i+"</div>"+
			            "<div class=\"text\"><a>"+pagename+"</a></div></li>"
			            continue;
				}else{
						html+="<li class=\"undone\"> <div class=\"line\"></div>"+
			            "<div class=\"num\">"+i+"</div>"+
			            "<div class=\"line\"></div>"+
			            "<div class=\"text\"><a>"+pagename+"</a></div></li>"
			            continue;
				}
	       	 }
			html+="</ul>";
        	$("#PAGE_ORDER").val("1");
		}
		$("#crumbs").html(html);
	})
	
	function pageName(order){
				if(order==1){
					pagename="模块基本信息"	 
				}else if(order==2){
					pagename="模块依赖关系" 
				}else if(order==3){
					pagename="模块菜单" 
				}else if(order==4){
					pagename="业务模型" 
				}else if(order==5){
					pagename="公用页面"; 
				}else if(order==6){
					pagename="公用类" 
				}else if(order==7){
					pagename="静态资源" 
				}else if(order==8){
					pagename="触发器" 
				}else if(order==9){
					pagename="对外接口" 
				}else if(order==10){
					pagename="多语言" 
				}else if(order==11){
					pagename="数据字典" 
				}
	}
	function pageGo(order,pagename){
		var url=null;
		if(order==1){
			url="${path}sys/moduleMagAction_moduleName.ms";
		}else if(order==2){
			url="${path}sys/moduleMagAction_moduleType.ms";
		}else if(order==3){
			url="${path}sys/moduleMagAction_moduleFunc.ms";
		}else if(order==4){
			url="${path}sys/moduleMagAction_bussExport.ms";
		}else if(order==5){
			url="${path}sys/moduleMagAction_pageExport.ms";
		}else if(order==6){
			url="${path}sys/moduleMagAction_classExport.ms";
		}else if(order==7){
			url="${path}sys/moduleMagAction_moduleSourceExport.ms";
		}else if(order==8){
			url="${path}sys/moduleMagAction_trigTree.ms";
		}else if(order==9){
			url="${path}sys/moduleMagAction_interIframe.ms";
		}else if(order==10){
			url="${path}sys/moduleMagAction_languageExport.ms";
			pagename="多语言";
		}else if(order==11){
			url="${path}sys/moduleMagAction_dictExport.ms";
		}
		document.getElementById("addForm").action=url;
		document.forms.addForm.submit();
	}
	
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	function next(thisObj){
		var database=document.getElementsByName("DATABASE")
		var check_val = [];
	    for(k in database){
	        if(database[k].checked)
	            check_val.push(database[k].value);
	    }
		$("#MODEL_DATABASE").val(check_val);
		vali();
		if(isSubmit){
			
			return false
		}
		
<%--		alert(exportModule)--%>
		//document.forms.addForm.submit();
		return true;
		
	}
	function save()
	{
		$("#exportModule").val(JSON.stringify(exportModule));
		var MODEL_ID=$("#MODEL_ID").val();
		if(MODEL_ID!=null&&MODEL_ID!=""){
			document.getElementById("addForm").action="${path}sys/moduleMagAction_modifyModule.ms";
		}else{
			document.getElementById("addForm").action="${path}sys/moduleMagAction_saveModule.ms";
		}
		document.forms.addForm.submit();
	}
	function changeValue(val){
		if(val=="ORACLE"){
			$("#ORACLE").prop("checked",true)
			$("#MODEL_DATABASE").val("ORACLE")
<%--			alert($("#MODEL_DATABASE").val())--%>
		}else{
			$("#POSTGRESQL").prop("checked",true)
			$("#MODEL_DATABASE").val("POSTGRESQL")
		}
}
	function vali(){
		var MODEL_DATABASE=$("#MODEL_DATABASE").val();
<%--		alert(MODEL_DATABASE)--%>
		var MODEL_NAME=$("#MODEL_NAME").val();
		var MODEL_SHOW_NAME=$("#MODEL_SHOW_NAME").val();
		var MODEL_VERSION=$("#MODEL_VERSION").val();
		var MODELS_NAME=$("#MODELS_NAME").val();
		var classCode=$("#classCode").val();
		var className=$("#className2").val();
		
		var regx1=/^[A-Za-z]+$/
		var regx2=/^[\u4e00-\u9fa5a-zA-Z0-9]+$/
		var regx3=/^[0-9]*[0-9.]*[0-9]$/ 
		var regx4=/^[a-zA-Z]*.*[a-zA-Z]$/
		if(val.isBlank(MODEL_NAME)){
			//util.alert("模块名称不能为空");
			alterWindows("模块名称不能为空",5);
			isSubmit=true
			return false;
		}
		if(val.isBlank(MODEL_DATABASE)){
			alterWindows("数据库类型不能为空",5);
			isSubmit=true
			return false;
		}
		if(val.isBlank(classCode)&&val.isBlank(className)){
			util.alert("启动接口必输");
			isSubmit=true
			return false;
		}
		if(!regx1.test(MODEL_NAME)){
			isSubmit=true
			util.alert("模块名称只能输入英文")
			return false;
		}
		if(val.isBlank(MODEL_SHOW_NAME)){
			util.alert("模块展示名称不能为空");
			isSubmit=true
			return false;
		}
		if(!regx2.test(MODEL_SHOW_NAME)){
			isSubmit=true
			util.alert("模块展示名称不能输入符号")
			return false;
		}
		if(val.isBlank(MODEL_VERSION)){
			util.alert("模块版本号不能为空");
			isSubmit=true
			return false;
		}
		if(!regx3.test(MODEL_VERSION)){
			isSubmit=true
			util.alert("模块版本号只能输入数字和 .且头尾不能为.")
			return false;
		}
		if(val.isBlank(MODELS_NAME)){
			util.alert("模块组名称不能为空");
			isSubmit=true
			return false;
		}
		if(!regx4.test(MODELS_NAME)){
			isSubmit=true
			util.alert("模块组名称只能输入英文和 .且头尾不能为.")
			return false;
		}
		checkOnly();
		if(isCan){
			return false;
		}
		isSubmit=false
		
	}
	function cancel(obj){
		//parent.closePopWin();
		closePopWin();
	}
	function updateCodeData(codeType,className,classCode) {
		$("#className2").val(className)
		$("#codeType").val(codeType);
		$("#classCode").val(classCode);
		//$("#paraButton").text("编辑");
	}
	
	function checkOnly(){
		var MODEL_NAME=$("#MODEL_NAME").val();
		var MODEL_SHOW_NAME=$("#MODEL_SHOW_NAME").val();
		var MODEL_VERSION=$("#MODEL_VERSION").val();
		var MODELS_NAME=$("#MODELS_NAME").val();
		var MODEL_ID=$("#MODEL_ID").val();
		var names=MODELS_NAME+"."+MODEL_NAME+"."+MODEL_VERSION
		$.ajax({
			type: "POST",
		    dataType: "json",
		    async:false,
		    data: {
		    	"paraMap.names":names,
		    	"paraMap.model_id":MODEL_ID
		    },
		    url: "${path}sys/moduleMagAction_checkName.ms",
			success: function(data){
				console.log(data.ajaxMap.status=='false')
				if(data.ajaxMap.status=='false'){
					util.alert(data.ajaxMap.info);
					isSubmit=true
					isCan=true;
					return
				}else{
					isSubmit=false;
					isCan=false;
					return ;
				}
			},
			error: function(msg){
				//util.closeLoading();
			}
		});
	}
	
	$(function(){
		layui.use('form', function(){
	    	form = layui.form;
	    	form.render();
	    	  
           	form.on('submit(filterSubmit)', function (data) {
           	   document.getElementById("curIframeName").value=window.frameElement.name;
		       var flag=next(data.elem);
		       if(!flag){
		       		return false;
		       }else{
		       		return true;
		       }
				       
			}) 
			
	    });
	    
	})
	
	</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>