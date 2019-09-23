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
		<form id="addForm" name="addForm" enctype="multipart/form-data" action="${path}buss/bussModel_addAjaxComm.ms" method="post" <bu:formet exeid="%{exeid}" />
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
	    			
					
		<bu:set name="paraMapObj" value="${dataId}" formId="b1001c913da94c22b6e93cf7148da0d6" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="b1001c913da94c22b6e93cf7148da0d6" />
	<input type="hidden" name="b1001c913da94c22b6e93cf7148da0d6" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'f21bd399ee1749d9aadf3d0238b6eff3'" />
		<s:set name="_$formId_1" value="'b1001c913da94c22b6e93cf7148da0d6'" />
		<s:set name="_$type" value="'add'" />
	
			<bu:jsVal formId="b1001c913da94c22b6e93cf7148da0d6" formIndex="1" />
				
			</div>
		 
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	
	
	
	


		<div id="template1">
		 <br>
		 <br>
		
	<table id="template">
		<tbody><tr><td align="center" style="font-size:18px;width:600px" >
		 		使用导入功能时，出库单信息需要与模板中的格式一致！<br>
		 		若无模板，请下载模板！
		 		<input type="button" value="下载模板" onclick="down()">
		 	</td>
		</tr>
		<tr><td>&nbsp;&nbsp;</td></tr><tr><td>&nbsp;&nbsp;</td></tr><tr><td>&nbsp;&nbsp;</td></tr>
		<tr>
			<td align="center" style="font-size:18px;width:600px">
				?请选择出库单信息！（只支持xls或xlsx文件）<br></td>
		</tr>
		<tr>
			<td align="center" style="width:600px"><input type="file" id="upFile" name="upFile"></td>
		</tr>
     </tbody></table>
<br>

</div>
    
</form>

	
		
		<script>
			function init(){
		$("#allSelect").click(function(){
    			if($("#allSelect").attr("checked") == "checked"){
        			$("input[name='isSelect1']").attr("checked","checked");
    			}else{
        			$("input[name='isSelect1']").removeAttr("checked","checked");
    			}
			});
		clickTr('deviceTable');
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
	
		
		function closeWindow1(){
		    document.getElementById("template").style.display="none";
		    
		}
		
		
		function add(){

		/*	isQuery = false;
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
            }*/
        
			uploadExcel();
			
		/*	$DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
			$DisInput.attr("disabled", false); 
			if($("#isCloseWin").length > 0 && $("#addForm").find("#isCloseWin").length == 0){
			 
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled",true);
			document.forms.addForm.submit();
			isQuery = true;
			$DisInput.attr("disabled", true);*/
		}
		

		
		
		
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

var organiztionName=$("#deptLs_data_auth").text();
if(organiztionName==""){
     utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择组织机构" />",0,"260","");
     return;
}
if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}

  document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=da5e75061b0943a490a40282cc740ff9";
		document.forms.addForm.submit();



		/*	var seqs = "";
			var deviceArr=[];
			
			$("input[name='isSelect1']:checked").each(function(i) {
                var deviceS={};

				seqs = $(this).val();
				deviceS.CAD_DEVICE_SEQUENCE=$("#CAD_DEVICE_SEQUENCE"+seqs).val();
				deviceS.CD_DEVICE_SN=$("#CD_DEVICE_SN"+seqs).val();

				deviceArr.push(deviceS);
			});
			if (seqs == "") {
							//utilsFp.confirmIcon(3, "", "", "","%{getText("请至少选择一条记录")}"
					//	, "", "260", "145");
    	        utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少选择一条记录" />",0,"260","");
			 return;}

			$("#deviceArr").val(JSON.stringify(deviceArr));*/
			
		}
                
	/*	document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=eb49be3431a8451bbc907372b6383a1b";
		document.forms.addForm.submit();*/
	}
	
		
		
		
		</script>
		
		
	 
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>


<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
