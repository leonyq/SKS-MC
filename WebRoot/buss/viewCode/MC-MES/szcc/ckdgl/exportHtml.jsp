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
		<form id="addForm" name="addForm" enctype="multipart/form-data" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
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
			        <button type="button" onclick="uploadExcel();"><i class="ico ico-save"></i><dict:lang value="确认" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="b1001c913da94c22b6e93cf7148da0d6" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="b1001c913da94c22b6e93cf7148da0d6" />
	<input type="hidden" name="b1001c913da94c22b6e93cf7148da0d6" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'1f7e695c67df4d2ea27f7b5e727d10cc'" />
		<s:set name="_$formId_1" value="'b1001c913da94c22b6e93cf7148da0d6'" />
		<s:set name="_$type" value="'add'" />
			<div id="template1">

		<tbody>
	<!--	<tr><td align="center" style="font-size:18px;width:600px" >
		 		使用导入功能时，出库单信息需要与模板中的格式一致！<br>
		 		若无模板，请下载模板！
		 		<input type="button" value="下载模板" onclick="down()">
		 	</td>
		</tr>-->
		
		<tr><td>&nbsp;&nbsp;</td></tr><tr><td>&nbsp;&nbsp;</td></tr>
		<tr>
			<td align="center" style="font-size:18px;width:600px">
				请选择出库单信息<br></td>
		</tr>
		<tr>
			<td align="center" style="font-size:18px;width:600px">
				（上传前请核实是否为内部正确的文件！）<br></td>
				
		</tr>
		<tr>
			<td align="center" style="width:600px"><input type="file" id="upFile" name="upFile"></td>
		</tr>
			<tr><td>&nbsp;&nbsp;</td></tr><tr><td>&nbsp;&nbsp;</td></tr>
				<tr><td>&nbsp;&nbsp;</td></tr>
			
     </tbody>
	</table>
			<bu:jsVal formId="b1001c913da94c22b6e93cf7148da0d6" formIndex="1" />
				
			</div>
		 </form>
	</div>
<script>
function uploadExcel() {
		var file = document.getElementById("upFile").value;
		if (file == "") {
		//	utilsFp.confirmIcon(3, "", "", "","%{getText("请选择要上传的excel文档")}"
		//			, "", "360", "145");
					
			utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择要上传的excel文档" />",0,"260","");		
         return;
		} else {
                        var fileL=file.toLowerCase();
var pos = fileL.lastIndexOf('.xls');
var posx = fileL.lastIndexOf('.xlsx');
    if(pos == -1&&posx==-1)  {
        		//utilsFp.confirmIcon(3, "", "", "","%{getText("请选择要上传的excel文档")}"
				//	, "", "360", "145");
			 utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择要上传的excel文档" />",0,"260","");
    return false;
}

var organiztionName=$("#deptLs_data_auth").val();
if(organiztionName==""||organiztionName==null){
     utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择组织机构" />",0,"260","");
     return;
}
/*if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}*/

  document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=319d2a07272440e4a9aaa4e1ae256858";
		document.forms.addForm.submit();



	}}
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

</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
