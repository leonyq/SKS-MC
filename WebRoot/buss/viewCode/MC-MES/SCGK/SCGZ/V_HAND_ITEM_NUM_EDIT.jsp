<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="修改" /></title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- 产品静态资源 -->
    
    <style>
    .input{
        width:300px;
    }
    </style>
</head>
<script>
$(function(){
    $("#paraMapObj_WSI_ITEM_NUM").removeAttr("disabled");
    $("#paraMapObj_WSI_ITEM_SN").val(getParam('itemSn'));
    $("#paraMapObj_WSI_ITEM_NUM").val(getParam('itemNum')).focus(); 
    $("#paraMapObj_WSI_ITEM_NUM").attr('oninput','this.value=this.value.replace(/[^\\d.]/g,\"\")');
});
function editNum(){
    var item_sn=$('#paraMapObj_WSI_ITEM_SN').val();
	var mo_number=getParam('moNumber');
	var item_num=$('#paraMapObj_WSI_ITEM_NUM').val(); 
	var url = "buss/bussModel_exeFunc.ms?funcMId=3752489578d74c129e0f9bfe6ac7056f";
	try{
        if(parseInt(item_num)<=0||isNaN(parseInt(item_num))){
            utilsFp.alert("请输入大于0的数量");
            return;
        } 
	}catch(e){
        utilsFp.alert("请输入大于0的数量");
        return;
    }  
    util.showLoading("保存数据中...");
    $.ajax({
        type: "POST",
        dataType: "json",
        url: url,
        data:{item_sn:item_sn,mo_number:mo_number,item_num:item_num},
        success: function(data){
           util.closeLoading(); 
           if(data.ajaxString.indexOf("OK")!=0){
                utilsFp.alert(data.ajaxString);
           }else{ 
                msgPop("保存成功",editItemNumCallback,"摩尔提示",200,150,3000);
           }
        },
        error: function(msg){ 
           util.closeLoading();
           utilsFp.alert(JSON.stringify(msg));
        }
    });
    
    function editItemNumCallback(){
        top.editItemNumCallback();
        closeWindow();	 
    }
}

/**
 * 获取指定的URL参数值
 * URL:http://www.quwan.com/index?name=tyler
 * 参数：paramName URL参数
 * 调用方法:getParam("name")
 * 返回值:tyler
 */
function getParam(paramName) {
    paramValue = "", isFound = !1;
    if (this.location.search.indexOf("?") == 0 && this.location.search.indexOf("=") > 1) {
        arrSource = unescape(this.location.search).substring(1, this.location.search.length).split("&"), i = 0;
        while (i < arrSource.length && !isFound) arrSource[i].indexOf("=") > 0 && arrSource[i].split("=")[0].toLowerCase() == paramName.toLowerCase() && (paramValue = arrSource[i].split("=")[1], isFound = !0), i++
    }
    return paramValue == "" && (paramValue = null), paramValue
}
</script>
<body>
	<div class="edit">
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
                <div style="margin-left:40px;">
	               <s:if test="${isDataAuth == '1'}">
		               <span class="dot">*</span><dict:lang value="组织机构" />
		               <s:if test="${fn:length(deptLs)==1}">
		                   	<s:select list="deptLs" listKey="id" listValue="name" name="paraMapObj._DATA_AUTH" 
							id="deptLs_data_auth"  cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
		               </s:if>
		               <s:else>
		                	<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
							listKey="id" listValue="name"   name="paraMapObj._DATA_AUTH"
							id="deptLs_data_auth"  cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
				  		</s:else>
     				</s:if>	
               </div>
			    	<div class="optn">
			    	        <button type="button" onclick="editNum(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button> 
			    </div>

			</div>
			<div class="bd">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="db084c9c700b4c9597366a4c5593f8f3" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="db084c9c700b4c9597366a4c5593f8f3" />
	<input type="hidden" id="prefixInd" name="db084c9c700b4c9597366a4c5593f8f3" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'19ba911f322c4bcdb1f96d92a6c934e6'" />
		<s:set name="_$formId_1" value="'db084c9c700b4c9597366a4c5593f8f3'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name-three" /><bu:uitn colNo="WSI_ITEM_SN" formId="db084c9c700b4c9597366a4c5593f8f3" /></td>
			<bu:td cssClass="dec-self" colNo="WSI_ITEM_SN" formId="db084c9c700b4c9597366a4c5593f8f3" ><bu:ui colNo="WSI_ITEM_SN" formId="db084c9c700b4c9597366a4c5593f8f3" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="WSI_ITEM_NUM" formId="db084c9c700b4c9597366a4c5593f8f3" /></td>
			<bu:td cssClass="dec-self" colNo="WSI_ITEM_NUM" formId="db084c9c700b4c9597366a4c5593f8f3" ><bu:ui colNo="WSI_ITEM_NUM" formId="db084c9c700b4c9597366a4c5593f8f3" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="db084c9c700b4c9597366a4c5593f8f3" formIndex="1" />
									
			</div>
	</form>	
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<!-- js初始化方法 -->
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_11" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
