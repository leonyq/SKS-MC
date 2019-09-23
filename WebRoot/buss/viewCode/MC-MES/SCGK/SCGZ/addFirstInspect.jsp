<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
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
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
	<!-- head里面 -->
	
	<!-- 产品静态资源 -->

	
</head>
<body>
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
					target="submitFrame">
            <div class="hd">
            	
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;">
                <div class="save-close" <dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
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
			        <button type="button" onclick="addCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="eb37ed041b084b8c9eb5b809964eea60" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="eb37ed041b084b8c9eb5b809964eea60" />
	<input type="hidden" id="prefixInd" name="eb37ed041b084b8c9eb5b809964eea60" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'43c01e6b7ef44de4b6f5afd7fc615837'" />
		<s:set name="_$formId_1" value="'eb37ed041b084b8c9eb5b809964eea60'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name-three" /><bu:uitn colNo="TFI_TYPE" formId="eb37ed041b084b8c9eb5b809964eea60" /></td>
			<bu:td cssClass="dec-self" colNo="TFI_TYPE" formId="eb37ed041b084b8c9eb5b809964eea60" ><bu:ui colNo="TFI_TYPE" formId="eb37ed041b084b8c9eb5b809964eea60" value="%{TFI_TYPE}" formIndex="1" /></bu:td>
		    
		
			<td class="name-three" /><bu:uitn colNo="TFI_PRODUCT_SN" formId="eb37ed041b084b8c9eb5b809964eea60" /></td>
			<bu:td cssClass="dec-self" colNo="TFI_PRODUCT_SN" formId="eb37ed041b084b8c9eb5b809964eea60" ><bu:ui colNo="TFI_PRODUCT_SN" formId="eb37ed041b084b8c9eb5b809964eea60" value="%{TFI_PRODUCT_SN}" formIndex="1" /></bu:td>
		 </tr>
		<tr>   
			<td class="name-three" /><bu:uitn colNo="TFI_PROJECT_ID" formId="eb37ed041b084b8c9eb5b809964eea60" /></td>
			<bu:td cssClass="dec-self" colNo="TFI_PROJECT_ID" formId="eb37ed041b084b8c9eb5b809964eea60" ><bu:ui colNo="TFI_PROJECT_ID" formId="eb37ed041b084b8c9eb5b809964eea60" value="%{TFI_PROJECT_ID}" formIndex="1" readonly="readonly"/></bu:td>
		
			<td class="name-three" /><bu:uitn colNo="TFI_MKDH" formId="eb37ed041b084b8c9eb5b809964eea60" /></td>
			<bu:td cssClass="dec-self" colNo="TFI_MKDH" formId="eb37ed041b084b8c9eb5b809964eea60" ><bu:ui colNo="TFI_MKDH" formId="eb37ed041b084b8c9eb5b809964eea60" value="%{TFI_MKDH}" formIndex="1"  readonly="readonly"/></bu:td>
		 </tr>
		<tr>   
			<td class="name-three" /><bu:uitn colNo="TFI_MKJD" formId="eb37ed041b084b8c9eb5b809964eea60" /></td>
			<bu:td cssClass="dec-self" colNo="TFI_MKJD" formId="eb37ed041b084b8c9eb5b809964eea60" ><bu:ui colNo="TFI_MKJD" formId="eb37ed041b084b8c9eb5b809964eea60" value="%{TFI_MKJD}" formIndex="1"  readonly="readonly"/></bu:td>
		
			<td class="name-three" /><bu:uitn colNo="TFI_MKBB" formId="eb37ed041b084b8c9eb5b809964eea60" /></td>
			<bu:td cssClass="dec-self" colNo="TFI_MKBB" formId="eb37ed041b084b8c9eb5b809964eea60" ><bu:ui colNo="TFI_MKBB" formId="eb37ed041b084b8c9eb5b809964eea60" value="%{TFI_MKBB}" formIndex="1"  readonly="readonly"/></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="TFI_GROUP" formId="eb37ed041b084b8c9eb5b809964eea60" /></td>
			<bu:td cssClass="dec-self" colNo="TFI_GROUP" formId="eb37ed041b084b8c9eb5b809964eea60" ><bu:ui colNo="TFI_GROUP" formId="eb37ed041b084b8c9eb5b809964eea60" value="%{TFI_GROUP}" formIndex="1" /></bu:td>
		
			<td class="name-three" /><bu:uitn colNo="TFG_TEST_FACE" formId="5d9af4616d3f4dfabb0c11111d6304c1" /></td>
			<bu:td cssClass="dec-self" colNo="TFG_TEST_FACE" formId="5d9af4616d3f4dfabb0c11111d6304c1" ><bu:ui colNo="TFG_TEST_FACE" formId="5d9af4616d3f4dfabb0c11111d6304c1" value="%{TFG_TEST_FACE}" formIndex="1" /></bu:td>
		</tr>
		
		<tr>
			<td class="name-three" /><bu:uitn colNo="TFG_TEST_RESULT" formId="5d9af4616d3f4dfabb0c11111d6304c1" /></td>
			<bu:td cssClass="dec-self" colNo="TFG_TEST_RESULT" formId="5d9af4616d3f4dfabb0c11111d6304c1" ><bu:ui colNo="TFG_TEST_RESULT" formId="5d9af4616d3f4dfabb0c11111d6304c1" value="%{TFG_TEST_RESULT}" formIndex="1" /></bu:td>
		    <td class="name-three" /><bu:uitn colNo="TFG_CONTENT" formId="5d9af4616d3f4dfabb0c11111d6304c1" /></td>
			<bu:td cssClass="dec-self" colNo="TFG_CONTENT" formId="5d9af4616d3f4dfabb0c11111d6304c1" ><bu:ui colNo="TFG_CONTENT" formId="5d9af4616d3f4dfabb0c11111d6304c1" value="%{TFG_CONTENT}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
		    <td class="name-three" /><bu:uitn colNo="TFI_TEST_CONTENT" formId="eb37ed041b084b8c9eb5b809964eea60" /></td>
			<bu:td cssClass="dec-self" colNo="TFI_TEST_CONTENT" formId="eb37ed041b084b8c9eb5b809964eea60" colspan="3" style="height:80px;"><bu:ui style="width: 100%;height: 100%;" readonly="readonly" colNo="TFI_TEST_CONTENT" formId="eb37ed041b084b8c9eb5b809964eea60" value="%{TFI_TEST_CONTENT}" formIndex="1" /></bu:td>
		
		</tr>
		
	</table>
			<bu:jsVal formId="eb37ed041b084b8c9eb5b809964eea60" formIndex="1" />		<div style="padding:1px;"></div>

			</div>
		 </form>
	</div>

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
<script type="text/javascript">
$(function(){
    $("#paraMap1_TFI_PRODUCT_SN").attr("onkeydown","handleInfo()");
    $("#paraMap1_TFI_TYPE").attr("onchange","changeGroup();");
     $("#paraMap1_TFI_GROUP").attr("onchange","changeContent();");
});
function changeGroup(){
    var type = $("#paraMap1_TFI_TYPE").val();
    if(type=="回流焊"){
        $("#paraMap1_TFI_GROUP").empty();
        $("#paraMap1_TFI_GROUP").append("<option value=''>--请选择--</option>");
        $("#paraMap1_TFI_GROUP").append("<option value='锡膏印刷'>锡膏印刷</option>");
        $("#paraMap1_TFI_GROUP").append("<option value='贴片检验'>贴片检验</option>");
        $("#paraMap1_TFI_GROUP").append("<option value='焊点检验'>焊点检验</option>");
        $("#paraMap1_TFI_GROUP").trigger("chosen:updated");
    }else if(type=="波峰焊"){
        $("#paraMap1_TFI_GROUP").empty();
        $("#paraMap1_TFI_GROUP").append("<option value=''>--请选择--</option>");
        $("#paraMap1_TFI_GROUP").append("<option value='焊点检验'>焊点检验</option>");
        $("#paraMap1_TFI_GROUP").append("<option value='元器件安装检验'>元器件安装检验</option>");
        $("#paraMap1_TFI_GROUP").trigger("chosen:updated");
    }
}
function changeContent(){
    $("#paraMap1_TFG_CONTENT").attr("disabled","disabled");
    $("#paraMap1_TFG_CONTENT").trigger("chosen:updated");
    $("#paraMap1_TFG_TEST_FACE").removeAttr("disabled");
        $("#paraMap1_TFG_TEST_FACE").attr("class","_VAL_NULL input isSubmit _VAL_OjbsData _VAL_DATABASE dept_select");
        $("#paraMap1_TFG_TEST_FACE").trigger("chosen:updated");
    var type = $("#paraMap1_TFI_TYPE").val();
    var group = $("#paraMap1_TFI_GROUP").val();
    if(type=="回流焊"&&group=="锡膏印刷"){
        $("#paraMap1_TFI_TEST_CONTENT").text("锡膏印刷均匀；无桥连、塌陷、偏离焊盘现象。");
    }else if(type=="回流焊"&&group=="贴片检验"){
        $("#paraMap1_TFI_TEST_CONTENT").text("器件无错贴、漏贴、方向贴反、偏移。");
    }else if(type=="回流焊"&&group=="焊点检验"){
        $("#paraMap1_TFI_TEST_CONTENT").text("焊点润湿明显，无漏焊、桥连。");
    }else if(type=="波峰焊"&&group=="焊点检验"){
        $("#paraMap1_TFG_TEST_FACE").attr("disabled","disabled");
        $("#paraMap1_TFG_TEST_FACE").attr("class"," input isSubmit _VAL_OjbsData _VAL_DATABASE dept_select");
        $("#paraMap1_TFG_TEST_FACE").trigger("chosen:updated");
        $("#paraMap1_TFG_CONTENT").removeAttr("disabled");
        $("#paraMap1_TFG_CONTENT").attr("onchange","getCont();");
        $("#paraMap1_TFG_CONTENT").empty();
        $("#paraMap1_TFG_CONTENT").append("<option value='焊孔透锡'>焊孔透锡</option>");
        $("#paraMap1_TFG_CONTENT").append("<option value='焊点锡量'>焊点锡量</option>");
        $("#paraMap1_TFG_CONTENT").append("<option value='焊点缺陷'>焊点缺陷</option>");
        $("#paraMap1_TFG_CONTENT").trigger("chosen:updated");
        $("#paraMap1_TFI_TEST_CONTENT").text("焊锡的垂直填充量应最少75%。");
    }else if(type=="波峰焊"&&group=="元器件安装检验"){
        $("#paraMap1_TFI_TEST_CONTENT").text("器件无错装、漏装、方向装反和偏移。");
    }
}
function getCont(){
    var con = $("#paraMap1_TFG_CONTENT").val();
    if(con=="焊孔透锡"){
        $("#paraMap1_TFI_TEST_CONTENT").text("焊锡的垂直填充量应最少75%。");
    }else if(con=="焊点锡量"){
        $("#paraMap1_TFI_TEST_CONTENT").text("焊脚轮廓均匀，引脚清晰可辨。");
    }else if(con=="焊点缺陷"){
        $("#paraMap1_TFI_TEST_CONTENT").text("焊点间无出现桥连，凹坑和气孔等缺陷。");
    }
}
function changeProject(snInfo){
    var tt = $("#paraMap1_TFI_PRODUCT_SN").val();
    if(snInfo!=tt){
        $("#paraMap1_TFI_PROJECT_ID").val("");
        $("#paraMap1_TFI_MKDH").val("");
        $("#paraMap1_TFI_MKJD").val("");
        $("#paraMap1_TFI_MKBB").val("");
    }
}
//根据产品获取信息
function handleInfo(){
    if(event.keyCode == 13){	
        var snInfo = $("#paraMap1_TFI_PRODUCT_SN").val();
        $.ajax({
	           type:"post",
	           dataType:"json",
	           data: {
	               "snInfo" : snInfo
	           },
	           url:"${path}buss/bussModel_exeFunc.ms?funcMId=f89b49dbe5454b318fbd028e19a2ccb9",
	           success:function(data){	
                	util.closeLoading();
                	if(null==data){
                	    return;
                	}
                	if(null!=data.ajaxMap){
                	   	if(data.ajaxMap.res!="succ"){
                	   	    utilsFp.confirmIcon(3,"","","", data.ajaxMap.res,0,"300","");
                	   	}else{
                	   	    $("#paraMap1_TFI_PROJECT_ID").val(data.ajaxList[0].PROJECT_ID);
                	   	    $("#paraMap1_TFI_MKDH").val(data.ajaxList[0].PRODUCT_MATERIAL);
                	   	    $("#paraMap1_TFI_MKJD").val(data.ajaxList[0].PRODUCT_MODEL);
                	   	    $("#paraMap1_TFI_MKBB").val(data.ajaxList[0].PRODUCT_VER);
                	   	    $("#paraMap1_TFI_PRODUCT_SN").attr("oninput","changeProject('"+snInfo+"');")
                	   	}
                	}
	           },
	           error:function(msg){
	                if(msg.readyState!=0){
    	               util.closeLoading();
    	               utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
	                }
	           }
	       });
	}
}
function addCal(){      

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
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled","disabled");
            document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=06c55484b3a6414087681545a6bcc07c";
            document.forms.addForm.submit();
}
</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
