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
	<title><dict:lang value="excel导入" />
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

<style>
 
 .pic {
    width: 220px;
    height: 100px;
    background-image: url(/mc/plf/page/fp/img/leading-in.png);
    
}
</style>
</head>
<body style="overflow:auto;">
	<div class="edit">
		<form id="addForm" name="addForm"
				action="" method="post"
				enctype="multipart/form-data" <bu:formet exeid="%{exeid}" />
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
								listKey="id" listValue="name" value=""  name="_DATA_AUTH"
								id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/>
		   				</s:else>
                	</s:if>
                	
                	
                </div>
			    <div class="optn">
			        <button type="button" onclick="uploadExcel(this)"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeCurrentWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd">
	    
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="04fdea69454640d1828d5b903153d18e" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="04fdea69454640d1828d5b903153d18e" />
	<input type="hidden" id="prefixInd" name="04fdea69454640d1828d5b903153d18e" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'8e6928fe8ed3430fabf568f3387b3e21'" />
		<s:set name="_$formId_1" value="'04fdea69454640d1828d5b903153d18e'" />
		<s:set name="_$type" value="'add'" />
      <tr>
        <td >
        <div class='pic'>
        </div>
      </td>
      
      </tr>
	<tr>
					

						<td class="dec-self"  >
						<input type="file" name="upFile" id="upFile" accept="vnd.ms-excel"/>
						</td>
      </tr>
      <tr>
						<td class="dec-self" ><a href="plf/template/ProjectRel.xls" download="关联表导入模板.xls" onclick="/*downTemplate();*/"><font color="blue"><dict:lang value="下载关联表导入模板" /></font></a>
						</td>
					</tr>
	</table>
			<bu:jsVal formId="04fdea69454640d1828d5b903153d18e" formIndex="1" />
			
			</div>
		 </form>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
      <form id="dowm_form" name="downForm" action="${path}sys/UserAction_downTemplate.ms" method="post">
       <input type="hidden" name="paraMap.fileName" value="料站表导入模板.xls">
       <input type="hidden" name="paraMap.filePath" value="plf/template/materialTemplate.xls">
     </form>
	</div>
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script>
  function downTemplate(){//cs
	
		document.forms.dowm_form.submit();
		thisObj.onclick = function(){utilsFp.confirmIcon(1,"","","","<dict:lang value="模板正在下载中..." />",0,"300","");};
	}
  function closeCurrentWindow(){
		closeTopPopWinFp(window.frameElement.id + "pop");
	}
function uploadExcel(thisObj) {
		var file = document.getElementById("upFile").value;
		if (file == "") {
		//	utilsFp.confirmIcon(3, "", "", "","%{getText("请选择要上传的excel文档")}"
		//			, "", "360", "145");
			
			utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择要上传的excel文档" />",0,"260","");

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
			
        var funid;
    
        funid='2aeac2015d09405a998ae3ef70fc3749';
 
		document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId="+funid;
		document.forms.addForm.submit();
	}
	
}
</script>
      <bu:script viewId="8e6928fe8ed3430fabf568f3387b3e21" />

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
