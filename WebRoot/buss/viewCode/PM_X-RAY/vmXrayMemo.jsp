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
.edui-default .edui-editor {
    height:345px;
    //width:550px;
    border: 1px solid #d4d4d4;
    background-color: white;
    position: relative;
    overflow: visible;
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    border-radius: 4px;
    box-sizing: border-box;
}
.edui-default .edui-toolbar {
    position: relative;
    display:none;
}
#edui1 {
    width:549px;
}
 .edui-editor {
    width:549px;
    border: 1px solid #d4d4d4;
    background-color: white;
    position: relative;
    overflow: visible;
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    border-radius: 4px;
    box-sizing: border-box;
}
.edit .bd {
    height:350px;
    background-color: #fff;
    border: 1px solid #eaeaea;
    padding: 10px 20px 10px 20px;
}
#edui1_toolbarbox{
    display:none;
}
</style>
</head>
<script> 
    function showedit(){//f1
        var edit =	window.frames['ueditor_0'].contentWindow.document;//
     $(edit).find("body").html('<c:out value="${param.msg}"/>');
     // console.log(edit);
    }
    function mmz_closeWindow(){
        parent.focus();
    	closeTopPopWinFp('addpop');
    }
    window.setTimeout(showedit,1000);;
    
</script>
<body>

    <div style="  position:absolute;z-index:3000;left:0px; top:35px;width:100%;height:90%; background-color:black;opacity:0;" ></div>
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
			    	    <%--    <button type="button" onclick="edit(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
        				--%>
        					<button type="button" onclick="mmz_closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="关闭" /></button>
			    </div>

			</div>
			<div class="bd" style="height:360px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="7be611b7bd2243afb2905d2bc4b714cf" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="7be611b7bd2243afb2905d2bc4b714cf" />
	<input type="hidden" name="7be611b7bd2243afb2905d2bc4b714cf" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'1b919eeffb244a158dff50d4de05fbe1'" />
		<s:set name="_$formId_1" value="'7be611b7bd2243afb2905d2bc4b714cf'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<%--<td class="name-four" /><bu:uitn colNo="XRAY_MEMO" formId="7be611b7bd2243afb2905d2bc4b714cf" /></td>--%>
			<bu:td cssClass="dec-self" style="width:549px" colNo="XRAY_MEMO" formId="7be611b7bd2243afb2905d2bc4b714cf" ><bu:ui style="width:546px" colNo="XRAY_MEMO" formId="7be611b7bd2243afb2905d2bc4b714cf" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="7be611b7bd2243afb2905d2bc4b714cf" formIndex="1" />
									
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
