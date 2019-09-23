<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 309329a148014eb89beaaa9b53c1d9d5-->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
		<script type = "text/javascript" src = "${path}/plf/js/common/util.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>


	
	<!-- 产品静态资源 -->
<style type="text/css">
.edit .bd{
    height:calc(100% - 40px);
    width:100%;
    overflow:auto;
    box-sizing:border-box;
}
.edui-default .edui-editor {
    width:100%;
    height:200px;
    border:1px solid #d4d4d4;
    background-color: white;
    position: relative;
    overflow: visible;
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    border-radius: 4px;
    box-sizing: border-box;
}
.edui-default .edui-editor {
    box-sizing: border-box;
}


</style>
	
</head>
<body>
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
					target="submitFrame">
            <div class="hd">
            	
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;"><!--$("#completeRepairId").css("display","none");-->
                <div style="display:none" id="completeRepairId" class="save-close" <dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
                <s:if test="${isDataAuth == '1'}">
                		<span class="dot">*</span><dict:lang value="组织机构" />
                		<s:if test="${fn:length(deptLs)==1}">
                   			<s:select list="deptLs" listKey="id" listValue="name"  name="_DATA_AUTH"
								id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
                   		</s:if>
                   		<s:else>
                			<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
								listKey="id" listValue="name"  name="_DATA_AUTH"
								id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
		   				</s:else>
                	</s:if>	
                </div>
			    <div class="optn">
			        <button type="button" onclick="addCal(this,'${formId}');"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <%--<button type="button" onclick="productAddError();"><i class="ico ico-add"></i><dict:lang value="添加不良" /></button>--%>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd" style="height:556px;   overflow-x:hidden; overflow-y:hidden;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="7be611b7bd2243afb2905d2bc4b714cf" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="7be611b7bd2243afb2905d2bc4b714cf" />
	<input type="hidden" name="7be611b7bd2243afb2905d2bc4b714cf" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'5d66473c6a2b441aa804dc51464630f0'" />
		<s:set name="_$formId_1" value="'7be611b7bd2243afb2905d2bc4b714cf'" />
		<s:set name="_$type" value="'add'" />
		

		<tr>
		<td class="name-four" style="width:75px;" /><span class="dot">*</span><bu:uitn  colNo="XRAY_WORK_STATION" formId="7be611b7bd2243afb2905d2bc4b714cf" /></td>
			<bu:td style="width:198px;" cssClass="dec-self" colNo="XRAY_WORK_STATION" formId="7be611b7bd2243afb2905d2bc4b714cf" ><bu:ui style="width:200px;" colNo="XRAY_WORK_STATION" formId="7be611b7bd2243afb2905d2bc4b714cf" value="%{XRAY_WORK_STATION}" formIndex="1" /></bu:td>
			<td class="name-four" /><span class="dot">*</span><bu:uitn colNo="XRAY_SN" formId="7be611b7bd2243afb2905d2bc4b714cf" /></td>
			<bu:td cssClass="dec-self" colNo="XRAY_SN" formId="7be611b7bd2243afb2905d2bc4b714cf" ><bu:ui colNo="XRAY_SN" onchange="mmz_check(this)" style="width:200px;" formId="7be611b7bd2243afb2905d2bc4b714cf" value="%{XRAY_SN}" formIndex="1" /></bu:td>
			<td class="name-four" /><bu:uitn colNo="XRAY_FLAG" formId="7be611b7bd2243afb2905d2bc4b714cf" /></td>
			<bu:td   cssClass="dec-self" colNo="XRAY_FLAG" formId="7be611b7bd2243afb2905d2bc4b714cf" ><bu:ui colNo="XRAY_FLAG" style="width:200px;" formId="7be611b7bd2243afb2905d2bc4b714cf" value="%{XRAY_FLAG}" formIndex="1" /></bu:td>
		</tr>

		<tr>
			<td class="name-four"   /><bu:uitn colNo="XRAY_PROJECT_ID" formId="7be611b7bd2243afb2905d2bc4b714cf" /></td>
			<bu:td cssClass="dec-self" colNo="XRAY_PROJECT_ID" formId="7be611b7bd2243afb2905d2bc4b714cf" ><bu:ui style="width:200px;" colNo="XRAY_PROJECT_ID" formId="7be611b7bd2243afb2905d2bc4b714cf" value="${param.PM_PROJECT_ID}" formIndex="1" /></bu:td>
			<td class="name-four" /><bu:uitn colNo="XRAY_MO_NUMBER" formId="7be611b7bd2243afb2905d2bc4b714cf" /></td>
			<bu:td cssClass="dec-self" colNo="XRAY_MO_NUMBER" formId="7be611b7bd2243afb2905d2bc4b714cf" ><bu:ui style="width:200px;" colNo="XRAY_MO_NUMBER" formId="7be611b7bd2243afb2905d2bc4b714cf" value="${param.PM_MO_NUMBER}" formIndex="1" /></bu:td>
			<td class="name-four" /><bu:uitn colNo="XRAY_MODEL_CODE" formId="7be611b7bd2243afb2905d2bc4b714cf" /></td>
			<bu:td style="width:200px;" cssClass="dec-self" colNo="XRAY_MODEL_CODE" formId="7be611b7bd2243afb2905d2bc4b714cf" ><bu:ui style="width:200px;" colNo="XRAY_MODEL_CODE" formId="7be611b7bd2243afb2905d2bc4b714cf" value="${param.PM_MODEL_CODE}" formIndex="1" /></bu:td>
			</tr>
		<tr>
		</tr>
		<tr >
			<td class="name-four" /><bu:uitn colNo="XRAY_MEMO" formId="7be611b7bd2243afb2905d2bc4b714cf" /></td>
			<bu:td cssClass="dec-self" colNo="XRAY_MEMO" colspan="5" style="height:220px" formId="7be611b7bd2243afb2905d2bc4b714cf" ><bu:ui  style="width:100%;" colNo="XRAY_MEMO" formId="7be611b7bd2243afb2905d2bc4b714cf" value="%{param.XRAY_MEMO}"  formIndex="1" /></bu:td>
		</tr>

		<tr style="display:none">
			<td class="name-four" /><bu:uitn colNo="XRAY_CHECK_TIME" formId="7be611b7bd2243afb2905d2bc4b714cf" /></td>
			<bu:td cssClass="dec-self" colNo="XRAY_CHECK_TIME" formId="7be611b7bd2243afb2905d2bc4b714cf" ><bu:ui colNo="XRAY_CHECK_TIME" formId="7be611b7bd2243afb2905d2bc4b714cf" value="%{XRAY_CHECK_TIME}" formIndex="1" /></bu:td>
			<td class="name-four" /><bu:uitn colNo="XRAY_EMP" formId="7be611b7bd2243afb2905d2bc4b714cf" /></td>
			<bu:td cssClass="dec-self" colNo="XRAY_EMP"   formId="7be611b7bd2243afb2905d2bc4b714cf" ><bu:ui  colNo="XRAY_EMP" formId="7be611b7bd2243afb2905d2bc4b714cf" value="%{XRAY_EMP}" formIndex="1" /></bu:td>
		</tr>


	
	
	<tr>
	<td colspan="7" style="width:100%">
	<div class="mod" style="height:165px;width:100%;margin-top:-10px;">
<div class="js-tab" style="width:96%">
<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
		<DIV id="container" style="width:100%;padding:0 2px;box-sizing: border-box;">
						<div class="mod-hd">
							<h3 class="tit"><dict:lang value="不良信息" /></h3>
						</div>					
<!--不良信息部分-->
            <DIV class="content1" id="content" style="margin-top: 15px;"><!-- tab子页 -->
			<%-- <DIV id="content1" style="margin-top:4px;" data-tab="tag1">--%>
			<div class="extend-btn" id="addDel" style=" wdth:55px;float: right;margin-top:-40px;margin-bottom:5px;">
	
	<button type="button" onclick="popItemDiv('addItem','backItem');" style="padding:0;" title="选择不良">
		<i class="ico ico-kl-new-add ico-small"></i>
	</button>
	<button type="button" onclick="delRow();" style="padding:0" title="删除">
		<i class="ico ico-sc-new-add ico-small"></i>
	</button>
</div>
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view">
						<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head1" >
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" style="width:30px;"></td>
										<td class="datagrid-cell" style="width:30px;">
										<input type="checkbox" id="allSelects1" name="allSelect" onchange="getAllItems1();" />
										</td>
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="不良代码" /></td >
										<td class="datagrid-cell" style="width:120px;"><dict:lang value="不良名称" /></td>
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="不良现象" /></td >
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll1"   style="height:170px;overflow-y:auto;">
								<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="addItemDetail" >
								</tbody>
							</table>
						</div>
					</div>
					
				</div>
				
			<%--</DIV>--%>
	
	
	</DIV><!-- 子页容器 -->
			
	    </DIV>
	        
</div>
</div>
</td>
</tr>
		</table>        
	
	   <script>
	      UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;  
                UE.Editor.prototype.getActionUrl = function(action){  
                    //调用自己写的Controller 
                    if(action == 'uploadimage' || action == 'uploadfile'){  
                   	 return "${path}/buss/bussModel_editorUploadImg.ms?savePath="+$("#_savePath").val(); //自己controller的action  
                    }else if(action == "uploadvideo"){  
                        return "<c:out value='${ctx}' />/ueditor/videoUp";//自己controller的action  
                    }else{  
                        return this._bkGetActionUrl.call(this,action);//百度编辑器默认的action  
                    }  
                }  
	   
	   
    //初始化表单信息
        $("#paraMap1_XRAY_PROJECT_ID").val("<c:out value='${param.PM_PROJECT_ID}'/>");
         $("#paraMap1_XRAY_MODEL_CODE").val("<c:out value='${param.PM_MODEL_CODE}'/>");
          $("#paraMap1_XRAY_MO_NUMBER").val("<c:out value='${param.PM_MO_NUMBER}'/>");

    //添加不良
	var check_sn = true;//校验是否符合流程
	//验证结果
	var exsis_index=1;
	function productAddError() {//#f1
				var sn = $("#paraMap1_XRAY_SN").val();
				var wta = $("#paraMap1_XRAY_WORK_STATION").val();
				var DR_MO_NUMBER = $("#paraMap1_XRAY_MODEL_CODE").val();//paraMap1_DR_MO_NUMBER
				var DR_MODEL_CODE = $("#paraMap1_XRAY_MO_NUMBER").val();
				var dataAuth = $("#deptLs_data_auth").val();
				if(sn==null||sn==''){
				utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择产品SN" />",0,"260","");
		        return false;
				}
		
				var piframeId = window.frameElement.id;//当前的ifid
				
				var url = "${path}buss/bussModel.ms?exeid=4364b185595b40b0a38dca3a8e96a799&weSn="+ sn+"&isXRay=1&DR_MODEL_CODE="+DR_MODEL_CODE+"&piframeId="+piframeId+"&DR_REPAIR_STATION="+wta+"&DR_MO_NUMBER="+DR_MO_NUMBER+"&dataAuth="+dataAuth;
				//console.log(url);
                //弹窗方法
				showPopWinFp(url, 457, 171, "", "添加不良",
						"add", "");//显示自定义添加不良窗口
	}
          
  
          
          
    	//from表单回调执行函数
        function addParentData(msg,title,width,height,time){
	        msgPop(msg,'',title,width,height,time);
	        if($("#isCloseWin").attr('checked')){
		      closeWindow();
		    }
	        var sn=$("#paraMap1_DR_SN").val();
		    queryErrorList(sn);
	    }


    //查询不良
    function queryErrorList(key,flag){
       
        if(""==$("#paraMap1_XRAY_SN").val()){//为空跳回
            $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody").html("");
            $("#paraMap1_XRAY_FLAG").val("0");
			$("#paraMap1_XRAY_FLAG").next().find("span").text("OK");
			$("#paraMap1_XRAY_FLAG").next().find("a").css("background-color","#f5f5f5")
			return;
        }
		util.showLoading("处理中...");
		$("#completeRepairId").prop("disabled",false);
		var getProUrl="${path}buss/bussModel_exeFunc.ms?funcMId=309329a148014eb89beaaa9b53c1d9d5";//VM-X-Ray检测过站 操作功能 DML操作
		$("#addItemDetail").html("");
	  $.ajax({
		type: "POST",
		async:false,
	    dataType: "json",
	    url: getProUrl,
	    data: {'SN':key,'flag':flag,'model':"queryErrorList"},
		success: function(data){
				//console.log(data);
				util.closeLoading();
				if(data.ajaxString!= null && data.ajaxString != ""){
				   utilsFp.confirmIcon(3,"","","", data.ajaxString,0,"260","");
				   clearSn();	
		           return false;
				}
				var tbodyStr = "";
				var tbodyStr2 = "";
				        $('#paraMap1@0#XRAY_FLAG').val('0');
				        $("#paraMap1_XRAY_FLAG").val("0");
				        $("#paraMap1_XRAY_FLAG").next().find("span").text("OK");
				if(data.ajaxList != null && data.ajaxList != ""){
				    if(data.ajaxList.length>0){
				        $('#paraMap1@0#XRAY_FLAG').val('1');				    
				        $("#paraMap1_XRAY_FLAG").val("1");
				        $("#paraMap1_XRAY_FLAG").next().find("span").text("NG");
				    }
					var checkedTag = "";//是否选中paraMap1@0#XRAY_FLAG
						var pList=data.ajaxList;
					
					var len = $("#addItemDetail tr").length;
                	for(var i = 0 ; i< pList.length;i++){
					$("#addItemDetail").append("<tr id='"+pList[i].XRAY_TRID+"' ></tr>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;'>"+nullToEmpty(pList[i].XRAY_CEC_CODE)+"<input type='hidden' name='CEC_CODE' value='"+$("#CEC_CODE"+$(this).attr("id")).val()+"'/></td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: center;'>"+nullToEmpty(pList[i].XRAY_CEC_NAME)+"</td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;'>"+nullToEmpty(pList[i].XRAY_CEC_SPEC)+"</td>");
					len = len+1;
					trrCount++;
					var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
					_tongLineColor(tableTrJs);
					clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
					defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
            	}	
					
				}else{
				    
				}
			},
		error: function(msg){
		        	//	console.log(msg);
				util.closeLoading();
				utilsFp.alert("error:"+msg);
		  }
		});	
	}
	
	//应郑同志要求添加，同时隐藏左上角关闭控制图标
	function mmzalt(){//点击保存后清空SN , 实际上经过SN验证方法合格后的SN都可以过站
	    $("#paraMap1_XRAY_SN").val("");
	    $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody").html("");
	   //默认OK
	    $('#paraMap1@0#XRAY_FLAG').val('0');
        $("#paraMap1_XRAY_FLAG").val("0");
		$("#paraMap1_XRAY_FLAG").next().find("span").text("OK");
	}
	
	//保存方法  #f2	
	function addCal(obj,fid){      
                    if(!val.valNullData()){
        				return ;
        			}
        			if(!valData()){
        				return ;
        			}
        			if(!val.valOjbsData()){
        				return ;
        			}
        			if(!val.valDataBaseSetData()){
                        return ;
                    }
                    if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
        			//	$("#addForm").append($("#isCloseWin").clone());//啥技巧
        			//	$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
        			}
        			var XRAY_PROJECT_ID = $("#paraMap1_XRAY_PROJECT_ID").val();
        			console.log("工单"+XRAY_PROJECT_ID);
        			var XRAY_MO_NUMBER = $("#paraMap1_XRAY_MO_NUMBER").val();
        			var AY_MODEL_CODE = $("#paraMap1_XRAY_MODEL_CODE").val();
			        $("#saveBtn").prop("disabled","disabled");
                        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=8f4a6cccf96d40e1a056494448f5823a&XRAY_PROJECT_ID="
                        +XRAY_PROJECT_ID+"&XRAY_MO_NUMBER="+XRAY_MO_NUMBER+"&XRAY_MODEL_CODE="+AY_MODEL_CODE+"&model=overStation";
                       //console.log($("#addForm").serialize());
                        document.forms.addForm.submit();
                        window.setTimeout(mmzalt,100);//清空方法
                        
    }	

	
	//空处理		
	function nullToEmpty(str){
	 if(str==null){
	   return '';
	 }
	 return str;
	}
	 


//景峰兄的设计COOKIE方法
/*获取cookie*/
function getCookie(name) {
    var bikky = document.cookie;
    name += "=";
    var i = 0;
    while (i < bikky.length) {
        var offset = i + name.length;
        if (bikky.substring(i, offset) == name) {
            var endstr = bikky.indexOf(";", offset);
            if (endstr == -1) endstr = bikky.length;
            return unescape(bikky.substring(offset, endstr))
        }
        i = bikky.indexOf(" ", i) + 1;
        if (i == 0) break
    }
    return null
}

//设置Cookoe

function setCookie(name, value,key,expTime) {
    var Days = 7;
    if (expTime == undefined) {
        expTime = Days * 24 * 60 * 60 * 1000;
    }

    var exp = new Date();
    exp.setTime(exp.getTime() + expTime);
    if (key == null || key == "") {
        document.cookie = name + "=" + escape(value) + "; expires=" + exp.toGMTString() + "; path=/"
    } else {
        var nameValue = getCookie(name);
        if (nameValue == "") {
            document.cookie = name + "=" + key + "=" + escape(value) + ";expires=" + exp.toGMTString() + ";path=/"
        } else {
            var keyValue = getCookie(name, key);
            if (keyValue != "") {
                nameValue = nameValue.replace(key + "=" + keyValue, key + "=" + escape(value));
                document.cookie = name + "=" + nameValue + ";expires=" + exp.toGMTString() + ";path=/"
            } else {
                document.cookie = name + "=" + nameValue + "&" + key + "=" + escape(value) + ";expires=" + exp.toGMTString() + ";path=/"
            }
        }
    }
}


//cookie设置	
function addCookie1(name,value,expiresHours){
var cookieString=name+"="+escape(value);
//判断是否设置过期时间 
if(expiresHours>0){
var date=new Date();
date.setTime(date.getTime+(expiresHours*3600*1000));
cookieString=cookieString+"; expires="+date.toGMTString()+ ";path=/";
}
document.cookie=cookieString;
}

function getCookie1(name){
var strCookie=document.cookie;
var arrCookie=strCookie.split("; ");
for(var i=0;i<arrCookie.length;i++){
var arr=arrCookie[i].split("=");
if(arr[0]==name)return arr[1];
}
return "";
}

function deleteCookie(name){ 
var date=new Date(); 
date.setTime(date.getTime()-10000); 
document.cookie=name+"=v; expires="+date.toGMTString(); 
}
var cookie_show = getCookie('X_RAY_STATION_NAME');
var cookie_val = getCookie('X_RAY_STATION_CODE');
    
$("#paraMap1_XRAY_WORK_STATION_SHOW").val(cookie_val);//显示cookie
$("#paraMap1_XRAY_WORK_STATION").val(cookie_show);	 


//验证sn方法
/*
*/
function mmz_check(obj)
{
//console.log($("#paraMap1_XRAY_SN").val());
//console.log($("#paraMap1_XRAY_WORK_STATION").val());
 	util.showLoading("处理中...");
 	var sn=$("#paraMap1_XRAY_SN").val();
 	var workStation=$("#paraMap1_XRAY_WORK_STATION").val();
		var getProUrl="${path}buss/bussModel_exeFunc.ms?funcMId=1353337130d041be80c8d14e83a7681c";//VM-X-Ray检测过站 操作功能 DML操作
	  $.ajax({
		type: "POST",
		async:false,
	    dataType: "json",
	    url: getProUrl,
	    data: {'MSG':"","model":"queryErrorList","sn":sn,"workStation":workStation},
		success: function(data){
				util.closeLoading();
				var msg = data.ajaxMap.msg;
				if('OK'!=data.ajaxMap.msg){
				    _alertValMsg(obj,msg);
				   obj.value="";
				    
				}else{
				
				    
				}
				    queryErrorList(obj.value);
				
			},
		error: function(msg){
				util.closeLoading();
				utilsFp.alert("error:"+msg);
		  }
		});	   
}


//制作弹出选择页面，分页查询
    function popItemDiv(showId,backId){
            if($("#paraMap1_XRAY_SN").val()==""){//gx1
           	utilsFp.confirmIcon(3,"","","", "<dict:lang value="请先填写产品SN信息" />",0,"260","");
           	return;
           }
            $("#itemCode").val("");	
		        $("#"+showId+",#"+backId).show();
			$("#"+showId).draggable({ handle: '#mmz_dialog-hd'});
			//addItemInfo();
			searchItemInfo('formId1');
}
function hideDiv(showId,backId){
			$("#"+showId+",#"+backId).hide();
			closeDivFp(showId+"pop");
}

//div物料信息分页
var paginationImpl = {};
function searchItemInfo(paginationImpl){
	var isFirstLoad = firstLoadThisPage(paginationImpl);
    	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
    	var itemCode = $.trim($("#itemCode").val());
    	util.showLoading("处理中...");
    	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: "buss/bussModel_exeFunc.ms?funcMId=b43407a0e8714fe489cd362ba4de6640",//VM-X-Ray检测过站 操作功能 分页查询CEC
			    data: {"paraMap.itemCode":itemCode,"page.currentPage":currentPage,"page.pageRecord":pageRecord},
				success: function(data){
				                 $("#itemTbody").empty();
						util.closeLoading();
						
						if(null!=data.ajaxPage&&null!= data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							for(var i=0;i<rccList.length;i++){
								if(rccList[i].CEC_CODE==null) rccList[i].CEC_CODE="";
								if(rccList[i].CEC_CODE==null) rccList[i].CEC_CODE="";
								if(rccList[i].CEC_CODE==null) rccList[i].CEC_CODE=0;
								$("#itemTable tbody:last").append("<tr id='tr_"+((currentPage-1)*pageRecord+(i+1))+"' ></tr>");//t.CEC_CODE   ,t.CEC_NAME,t.CEC_DESC
								$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+rccList[i].ID+"' type='checkbox' name='isSelect1'/></td>");
								$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;'>"+nullToEmpty(rccList[i].CEC_CODE)+"<input type='hidden' id='CEC_CODE"+rccList[i].ID+"' value='"+rccList[i].CEC_CODE+"'/></td>");
								$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;'>"+nullToEmpty(rccList[i].CEC_NAME)+"<input type='hidden' id='CEC_NAME"+rccList[i].ID+"' value='"+rccList[i].CEC_NAME+"'/></td>");
								$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: center;'>"+nullToEmpty(rccList[i].CEC_DESC)+"<input type='hidden' id='CEC_DESC"+rccList[i].ID+"' value='"+rccList[i].CEC_DESC+"'/></td>");
							}
							
						}
						pageFun(data.ajaxPage,"formId1");
							var tableTrJs = $("#itemTable tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('itemTable');
						
					},
				error: function(msg){
						console.log(msg);
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
var trrCount=0;

//保存选择的物料
function addItemList(showId,backId){//g1
	var len = $("#addItemDetail tr").length;
	$("#itemTbody :checkbox").each(function(){
			if($(this).attr("checked")){
			        if (!$("#trr"+$(this).attr("id")).length) {//防止重复的
					$("#addItemDetail").append("<tr id='trr"+$(this).attr("id")+"' ></tr>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(len+1)+"</td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;'>"+nullToEmpty($("#CEC_CODE"+$(this).attr("id")).val())+"<input type='hidden' name='CEC_CODE' value='"+$("#CEC_CODE"+$(this).attr("id")).val()+"'/></td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: center;'>"+nullToEmpty($("#CEC_NAME"+$(this).attr("id")).val())+"</td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;'>"+nullToEmpty($("#CEC_DESC"+$(this).attr("id")).val())+"</td>");
					len = len+1;
						trrCount++;
					var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
					_tongLineColor(tableTrJs);
					clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
					defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
				}
			}

			
	})
	
	//改变下拉控件
	 $('#paraMap1@0#XRAY_FLAG').val('1');
        $("#paraMap1_XRAY_FLAG").val("1");
		$("#paraMap1_XRAY_FLAG").next().find("span").text("NG");
	
	//数据保存
	var list=[];
	$("#addItemDetail tr").each(function(i,obj){
	   	var str={};
	    str.id= obj.id;
	    str.code=$(obj).find("td")[2].innerText;
	    str.name = $(obj).find("td")[3].innerText;
	    str.desc = $(obj).find("td")[4].innerText;
	    list.push(str);
	});
    	list = JSON.stringify(list);
    	console.log(list);
	    var getProUrl="${path}buss/bussModel_exeFunc.ms?funcMId=309329a148014eb89beaaa9b53c1d9d5";//VM-X-Ray检测过站 操作功能 DML操作
	$.ajax({
		type: "POST",
		async:false,
	    dataType: "json",
	    url: getProUrl,
	    data: {"model":"save",'SN':$("#paraMap1_XRAY_SN").val(),"list":list,"XRAY_WORK_STATION":$("#paraMap1_XRAY_WORK_STATION").val(),"XRAY_FLAG":$('#paraMap1@0#XRAY_FLAG').val()},
		success: function(data){
		        console.log(data);
			},
		error: function(msg){
		        console.log(msg);
				util.closeLoading();
				utilsFp.alert("error:"+msg);
		  }
		});	
	
	$("#itemTbody").empty();
	
	hideDiv(showId,backId);
	//trCount=0;
	$("#item_list_cb").attr("checked",false);
}


function delRow(){//删除方法	
        var selCount=0;
        var ids = "";
	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 :checkbox").each(function(){
		if($(this).attr("checked")){
			var tr = $(this).parent().parent();
			if(ids=='')
	        ids=tr[0].id;
            else ids=ids+';'+tr[0].id;	
            selCount++;
		}
	});
	    if(selCount==0){
             utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少选择一条记录" />",0,"260","");
		     return false;
		  }
		  var obj = new Object();
		  obj.ids = ids;
          utilsFp.confirmIcon(1,"","MyDelErrorConfirm",obj, "<dict:lang value="是否确认删除" />?","1","260","155");//弹出选择/执行函数窗
	 }


function MyDelErrorConfirm(obj){
    $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 :checkbox").each(function(){
		if($(this).attr("checked")){
			var tr = $(this).parent().parent();
    	     tr.remove();
		}
	});
	//数据库中删除
	var getProUrl="${path}buss/bussModel_exeFunc.ms?funcMId=309329a148014eb89beaaa9b53c1d9d5";//VM-X-Ray检测过站 操作功能 DML操作
	$.ajax({
		type: "POST",
		async:false,
	    dataType: "json",
	    url: getProUrl,
	    data: {"model":"del",'SN':$("#paraMap1_XRAY_SN").val(),"ids":obj.ids,"WORK_STATION":$("#paraMap1_XRAY_WORK_STATION").val()},
		success: function(data){
		console.log(data);
		  if(data.ajaxMap!= null){
		     msgPop(data.ajaxMap.alertMsg,'',data.ajaxMap.title,data.ajaxMap.width,data.ajaxMap.height,data.ajaxMap.time);
		  }
			},
		error: function(msg){
				util.closeLoading();
				utilsFp.alert("发生错误:"+msg);
		  }
		});	
	//排序
	reSort("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
	var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
	_tongLineColor(tableTrJs);
	clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');		        
}
//重新排序
function reSort(objid){
         
         var i = 1;
         $("#"+objid+" tbody tr").each(function(){
         
         $(this).find("td").eq(0).text(i);
         
         i++;
      });
}
//点击行寄选中该行
function clickTr(tableId){
			$("#"+tableId+" tr").unbind("click");
			$("#"+tableId+" tr input[type=checkbox]").unbind("click");
			$("#"+tableId+" tr").on("click",function(e){
			var trId = $(this).attr("id");
			if ($("#"+trId+" :checkbox").attr("checked")) {
				$("#"+trId+" :checkbox").prop("checked",false);
				$("#"+trId).css("background-color","");
			}else{
				$("#"+tableId+" input[type='checkbox']").each(function(){
					if ($(this).attr("checked")) {
						$(this).prop("checked",false);
						$(this).parents("tr").css("background-color","");
					}
				});
				$("#"+trId+" :checkbox").prop("checked",true);
				$("#"+trId).css("background-color","#a0c8e5");
			}
		});
		
		  $("#"+tableId+" tr input[type=checkbox]").click(function(e) {
			  e.stopPropagation();
			  var style = $(this).parents("tr").attr("style");
			  if(style && style.indexOf("background-color") > -1){
				  $(this).parents("tr").css("background-color","");
			  }else{
				  $(this).parents("tr").css("background-color","#a0c8e5");
			  }
		  });
}

//全选
     	function getAllItem(){
		if($("#item_list_cb").attr("checked")=="checked"){
			$("#itemTbody :checkbox").attr("checked",true);
		}else{
			$("#itemTbody :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	} 
	//全选1
     	function getAllItems1(){
		if($("#allSelects1").attr("checked")=="checked"){
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 :checkbox").attr("checked",true);
		}else{
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	} 



	</script>
			<bu:jsVal formId="7be611b7bd2243afb2905d2bc4b714cf" formIndex="1" />
				
			</div>
			
		 </form>
	</div>


<!--选择不良信息页面-->
<!--隔离布-->
<div id="backItem" class="dialog-mask" style="z-index:1029px;width:100%;height:100%;" /></div>
<!-- 弹出选择物料 -->
		<div class="dialog dialog-s1" id="addItem" style="display:none;z-index:1030;margin-left:0px;left:calc(50% - 285px);top:20px;width:570px;height:560px;">
			<div class="dialog-hd" id="mmz_dialog-hd">
			<h3 class="tit">
			<dict:lang value="选择物料" />
			</h3>
			</div>
				<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addItem','backItem');"></a>
				<div class="dialog-bd-div" style="width:100%;height:calc(100% - 37px);">
					<div class="optn optn_div">
			        <button type="button" onclick="addItemList('addItem','backItem');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv('addItem','backItem');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				<button type="button" onclick="searchItemInfo('formId1');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
				         </div>
				      
				<table class="basic-table">
				 <tr>
			    		<td class="name" /><dict:lang value="不良代码"/></td>
					<td class="dec"><input type="text" id="itemCode" name="itemCode" class=" input isSubmit isaddSubmit"/></td>
			    	</tr>
			    	</table>
			    	<div style="width:570px;">  
			    	<table  width="570px" class="dlist-table table-line " >
						<thead>
						<tr>
			    			<th style="width: 30px;text-align: center;"></th>
							<th style="width: 30px;text-align: center;"><input type="checkbox" id="item_list_cb"  onchange="getAllItem();" /></th>
							<th style="width: 150px;text-align: center;"><dict:lang value="不良代码" /></th>
							<th style="width: 150px;text-align: center;"><dict:lang value="不良名称" /></th>
							<th style="width: 150px;text-align: center;"><dict:lang value="不良现象" /></th>
						</tr>
			    	</thead>
			    	</table>
			    	</div>
			    	<div style="width:570px;height:calc(100% - 136px);overflow-y: auto;overflow-x: hidden;" class="scroll">  
			    	<table style="table-layout:fixed;width:100%" class="dlist-table table-line " id="itemTable">
			    		<tbody id="itemTbody">
		            	</tbody>
				
				</table>

					</div>
				<div style="background-color: white;width:570px;" id="pageDiv">
                                 <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchItemInfo&formId=formId1&showLoading=0" />
                                 </div>		
				</div>
				

	</div>
    
<script>(function($){
    
  $(window).on('load',function(){
    setPopScroll('.scroll1','.head1');
    setPopScroll('.scroll')
  })
})(jQuery)
 function sett(){//编辑区覆盖范围	
    	var a = $(".dialog-bd-div").find("div")[2];
    	//$(a).css("height","235px");
    	$("#edui1").css("width","99%");
    $("#edui1_iframeholder").css("height","125px");	
    $("#paraMap1_XRAY_FLAG").val("0");
    $("#paraMap1_XRAY_FLAG").trigger("chosen:updated");    
		//移除下拉效果，默认OK	
      //  $("#paraMap1_XRAY_FLAG").next().unbind(); //移除所有 ;	
	 //   $("#paraMap1_XRAY_FLAG").next().find("a").css("background-color","#f5f5f5")
     //    $('#paraMap1@0#XRAY_FLAG').val('0');
     //   $("#paraMap1_XRAY_FLAG").val("0");
	//	$("#paraMap1_XRAY_FLAG").next().find("span").text("OK");
    //$("#mCSB_1").css("overflow-y","auto");
 }
$(function (){

window.setTimeout(sett,100);
});
     
     
     	//空处理		
	function nullToEmpty(str){
	 if(str==null||str=='null'){
	   return '';
	 }
	 return str;
	}


          function closeWinFun(){
			$("#isCloseWin").attr
			if($("#isCloseWin").attr("checked")) {
				$("#isCloseWinVal").val("1");
				//alert($("#isCloseWinVal").val());
			} else {
				$("#isCloseWinVal").val("0");
				//alert($("#isCloseWinVal").val()); 
			}
		}
		

		
</script>	 

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
 
 
 
 

 

