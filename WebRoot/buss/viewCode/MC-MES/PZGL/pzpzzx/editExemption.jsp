<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include>
</head>
<body>
	<div class="edit">
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
            <div class="hd" >
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
                <div style="margin-left:10px;">
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
			    	        <button type="button" onclick="editInfo();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd" style="height:458px">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="d6969731daf649c0acf934e37c0a4f1f" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="d6969731daf649c0acf934e37c0a4f1f" />
	<input type="hidden" name="d6969731daf649c0acf934e37c0a4f1f" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'82dbb015dd48412fb2410d806b1e9978'" />
		<s:set name="_$formId_1" value="'d6969731daf649c0acf934e37c0a4f1f'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" style="width: 89px;"/><span class="dot">*</span><bu:uitn colNo="QEI_ITEM_CODE" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" style="width: 250px;" colNo="QEI_ITEM_CODE" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_ITEM_CODE" formId="d6969731daf649c0acf934e37c0a4f1f"  dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" style="width: 90px;"/><bu:uitn colNo="QEI_ITEM_NAME" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" style="width: 230px;" colNo="QEI_ITEM_NAME" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_ITEM_NAME" formId="d6969731daf649c0acf934e37c0a4f1f"  dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QEI_ITEM_SPEC" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colNo="QEI_ITEM_SPEC" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_ITEM_SPEC" formId="d6969731daf649c0acf934e37c0a4f1f"  dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QEI_SUP_CODE" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colNo="QEI_SUP_CODE" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_SUP_CODE" formId="d6969731daf649c0acf934e37c0a4f1f"  dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QEI_START_TIME" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colNo="QEI_START_TIME" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_START_TIME" formId="d6969731daf649c0acf934e37c0a4f1f"  dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QEI_END_TIME" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colNo="QEI_END_TIME" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_END_TIME" formId="d6969731daf649c0acf934e37c0a4f1f"  dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<!--<tr>
			<td class="name" /><bu:uitn colNo="QEI_VALID_FLAG" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colNo="QEI_VALID_FLAG" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_VALID_FLAG" formId="d6969731daf649c0acf934e37c0a4f1f" value="%{QEI_VALID_FLAG}" formIndex="1" /></bu:td>
		</tr>-->
		<tr>	
			<td class="name" /><bu:uitn colNo="QEI_FILE_NAME" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colspan="3" colNo="QEI_FILE_NAME" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_FILE_NAME" name="upFile" formId="d6969731daf649c0acf934e37c0a4f1f"  dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QEI_APPLY_REASON" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colspan="3" colNo="QEI_APPLY_REASON" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_APPLY_REASON" style="height:80px;width:580px;" formId="d6969731daf649c0acf934e37c0a4f1f"  dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QEI_APPLY_BASIS" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colspan="3" colNo="QEI_APPLY_BASIS" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_APPLY_BASIS" style="height:80px;width:580px;" formId="d6969731daf649c0acf934e37c0a4f1f"  dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QEI_REVIEW_OPINION" formId="d6969731daf649c0acf934e37c0a4f1f" /></td>
			<bu:td cssClass="dec" colspan="3" colNo="QEI_REVIEW_OPINION" formId="d6969731daf649c0acf934e37c0a4f1f" ><bu:ui colNo="QEI_REVIEW_OPINION" style="height:80px;width:580px;" formId="d6969731daf649c0acf934e37c0a4f1f"  dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="d6969731daf649c0acf934e37c0a4f1f" formIndex="1" />
									
			</div>
	</form>	
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<bu:submit viewId="82dbb015dd48412fb2410d806b1e9978" />
	<bu:script viewId="82dbb015dd48412fb2410d806b1e9978" />
<script type="text/javascript">
$(function(){
	$("input[name='upFile']:hidden").val("");
	var saveFile = $("input[name='QEI_SAVEFILE_NAME']:hidden").val();
	var savePath = $("input[name='QEI_FILE_PATH']:hidden").val()
	//$("#paraMapObj_QEI_FILE_NAME_a").attr("href","javascript:myDelFile('paraMapObj_QEI_FILE_NAME_a','"+saveFile+"','"+savePath+"','paraMapObj_QEI_FILE_NAME','upFile');");
})

        /**删除附件
		*参数:a 标签ID，文件名，文件路径，输入框ID，输入框名称
		**/
		function myDelFile(aId,fileName,filePath,inputId,inputName){
			var obj = new Object();
			obj.fileName = fileName;
			obj.filePath = filePath;
			obj.inputId = inputId;
			obj.inputName = inputName;
			obj.aId = aId;
			
			
			utilsFp.confirmIcon(1,"","myDelFileConFirm",obj, "<dict:lang value="删除之后不可恢复，确定删除吗？" />","1","","");
		}
		
		function myDelFileConFirm(obj){
			if(obj == "" || obj == null || obj == undefined){
				return;
			}
			util.showLoading();
			var url ="${path}buss/bussModel_delFileAx.ms";
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: url,
			    data:{'paraMap.FILENAME':obj.fileName,'paraMap.FILEPATH':obj.filePath},
					success: function(data){
						util.closeLoading();
						if(data.ajaxMap != null){
							if(data.ajaxMap.msg == "1"){
								//util.alert("?删除成功！");
								utilsFp.confirmIcon(2,"","","", "<dict:lang value="删除成功！" />","","260","");
								delOraInfo();
								$("#"+obj.aId).parent().find("input").each(function(idx){
									this.value = "";
								});
								$("#"+obj.aId).prev("a").remove();
								$("#"+obj.aId).remove();
								
							}else{
								
								utilsFp.confirmIcon(3,"","","", ""+data.ajaxMap.msg+"","","","");
							}
						}else{
							utilsFp.confirmIcon(3,"","","", "<dict:lang value="服务器无响应，请稍候再试！" />","","","");
							
						}
					},
					error: function(XMLHttpRequest, textStatus, errorThrown){
						util.closeLoading();
						var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
						if (null != sessionstatus && sessionstatus == "noAuthority") {
						}else{
							//util.alert("error:"+errorThrown);
							utilsFp.confirmIcon(3,"","","", "error:"+errorThrown+"","","","");
						}
				   }
			});
		}   
		
		//删除数据库中的附件相关
		function delOraInfo(){
		    $.ajax({
			    type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=a8688d979a2e45bab03ebec9b2e4c936",
			    data: {delDataId: '${dataId}'},
			    success: function(data){
						    
                                 
				},
			    error: function(msg){
						
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
			});
		}


function editInfo(){

            if(!val.valNullData()){
				return ;
			}
			
			if(!val.valOjbsData()){
				return ;
			}
			if(!val.valDataBaseSetData()){
        		return ;
        	}
                        var startTime=new Date(Date.parse($("#paraMapObj_QEI_START_TIME").val().replace(/-/g,"/"))).getTime();
                        var endTime=new Date(Date.parse($("#paraMapObj_QEI_END_TIME").val().replace(/-/g,"/"))).getTime();
                        if(startTime>endTime){
                          
                        utilsFp.confirmIcon(3,"","","", "<dict:lang value="起始时间不能大于结束时间" />",0,"260","");
                          return;
                        }
                        document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=44c53ea074784fd2892cb48f165b9d2f";

			document.forms.editForm.submit();
			
}
</script>
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
