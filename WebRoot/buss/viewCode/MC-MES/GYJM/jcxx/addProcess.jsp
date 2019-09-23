<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></Qscript>
	<script type="text/javascript">
		var addTableTrMap;
	

	</script>
   <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
</head>
<body>
	<div class="edit">
	<form id="addForm" name="addForm" action="${path}buss/bussModel_exeFunc.ms?funcMId=59f4c3345634443fb49112b9aaf5d7e7&type=add" method="post" <bu:formet exeid="%{exeid}" />
										target="submitFrame" enctype="multipart/form-data">	
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
			        <button type="button" onclick="definedSave(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd" style="    height: 400px;">

										<input type="hidden" name="exeid" value="${exeid}">
										<input type="hidden" name="definedMsg" value="${definedMsg}">
										<input type="hidden" name="formId" value="f4bff8054eec43dd9b7ffe75eb0f03ac" />
										<input type="hidden" name=iframeId value="${iframeId}">
										<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
										<s:token />
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
		<bu:set name="paraMapObj" value="${dataId}" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="f4bff8054eec43dd9b7ffe75eb0f03ac" />
	<input type="hidden" name="f4bff8054eec43dd9b7ffe75eb0f03ac" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'13a7067ef1184d538351a3426da3dc41'" />
		<s:set name="_$formId_1" value="'f4bff8054eec43dd9b7ffe75eb0f03ac'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" style="width:73px;"/><span class="dot">*</span><bu:uitn colNo="GROUP_CODE" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" /></td>
			<td class="dec"><bu:ui colNo="GROUP_CODE" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" value="%{GROUP_CODE}" formIndex="1" /></td>
			<td class="dec" style="width:230px;vertical-align: bottom;" rowspan="4" >
				<div id="photoImg53bb92ed69a846788fb8f2cd0ef98609" style="margin-bottom: 12px;">
				 	<img id="preview53bb92ed69a846788fb8f2cd0ef98609"  align="bottom" style="width: 100px; height: 100px;">
				 	<span style="font-size:12px;color:#999;">支持2M以内</span>
				</div>
				
				
				<input type='button' value='<dict:lang value="选择默认图片" />' id="select_system" onclick="choosePic()">
				<input type="hidden" name="serverfileName" id="serverfileName" value="" />
				<input type='button' value='<dict:lang value="选择本地图片" />' id="select_locale">
				<input type="file" id="upFile53bb92ed69a846788fb8f2cd0ef98609" onchange="javascript:_setImagePreview('photoImg53bb92ed69a846788fb8f2cd0ef98609','preview53bb92ed69a846788fb8f2cd0ef98609','upFile53bb92ed69a846788fb8f2cd0ef98609');" style="display:none;" name="paraMap1@0#PHOTO_PATH" class=" input isSubmit  _VAL_OjbsData">
			</td>
		</tr>
		<tr>
			
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="GROUP_NAME" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" /></td>
			<td class="dec"><bu:ui colNo="GROUP_NAME" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" value="%{GROUP_NAME}" formIndex="1" /></td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="MS_CODE" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" /></td>
			<td class="dec"><bu:ui colNo="MS_CODE" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" value="%{MS_CODE}" formIndex="1" /></td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="GROUP_TYPE" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" /></td>
			<td class="dec"><bu:ui colNo="GROUP_TYPE" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" value="%{GROUP_TYPE}" formIndex="1" onchange="changeTest()"/></td>
		</tr>
                <tr>
			<td class="name" /><bu:uitn colNo="GROUP_COLOR" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" /></td>
			<td class="dec"><select id="paraMap1_GROUP_COLOR" name="paraMap1@0#GROUP_COLOR" class=" input isSubmit _VAL_OjbsData dept_select" >
<option value="">--请选择--</option>
 <option style="background-color:#FF0000" value="#FF0000">红色</option>
<option style="background-color:#800080" value="#800080">紫色</option>
<option style="background-color:#00FF00" value="#00FF00">绿色</option>
<option style="background-color:#0000FF" value="#0000FF">蓝色</option>
<option style="background-color:#FFFF00" value="#FFFF00">黄色</option>
<option style="background-color:#FFFFFF" value="#FFFFFF">白色</option>
<option style="background-color:#000000" value="#000000">黑色</option>
</select>
</td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CROUP_TEST_MAX" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" /></td>
			<td class="dec"><bu:ui colNo="CROUP_TEST_MAX" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" value="%{CROUP_TEST_MAX}" formIndex="1" /></td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="VALID_FLAG" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" /></td>
			<td class="dec">
				<bu:ui colNo="VALID_FLAG" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" value="%{VALID_FLAG}" formIndex="1" />
		
		</td>
		
		<tr>
			<td class="name" /><bu:uitn colNo="GROUP_DESC" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" /></td>
			<td class="dec" colspan="2"><bu:ui colNo="GROUP_DESC" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" value="%{GROUP_DESC}" rows="4" formIndex="1" style="width:100%;height:80px;"/></td>
		</tr>
		
		
		
		 
		
		
	</table>
			<bu:jsVal formId="f4bff8054eec43dd9b7ffe75eb0f03ac" formIndex="1" />
									</form>
			</div>
		
	</div>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

<script type="text/javascript">
document.getElementById("paraMap1_VALID_FLAG_1").checked=true;
	function init(){
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	
	}//初始化方法
	function changeTest(){
	    var GROUP_TYPE = $("#paraMap1_GROUP_TYPE").val();
	    if(GROUP_TYPE==2){//测试工序
	        $("#paraMap1_CROUP_TEST_MAX").removeAttr("disabled");
	        $("#paraMap1_CROUP_TEST_MAX").attr("class","_VAL_NULL input isSubmit _VAL_OjbsData _VAL_DATABASE");
	    }else{
	        $("#paraMap1_CROUP_TEST_MAX").val("");
	        $("#paraMap1_CROUP_TEST_MAX").attr("disabled","disabled");
	        $("#paraMap1_CROUP_TEST_MAX").attr("class"," input isSubmit readonly _VAL_OjbsData _VAL_DATABASE");
	    }
	}
	$("#paraMap1_GROUP_PHOTO").change(function(obj){

	var $file = $(this);
        var fileObj = $file[0];
     if(fileObj && fileObj.files && fileObj.files[0]){
	  var objUrl = getObjectURL(this.files[0]) ;
	  if (objUrl) {
		$("#img0").attr("src", objUrl) ;
		
	    }
     }
      else{
//IE下，使用滤镜
           //$("#paraMap1_GROUP_PHOTO").parent().show();
           var hhotoObj = document.getElementById("paraMap1_GROUP_PHOTO");
		   var imgObjPreview = document.getElementById("img0");
			hhotoObj.select();
			var imgSrc = document.selection.createRange().text;
			document.selection.empty();
			//$("#paraMap1_GROUP_PHOTO").parent().hide();
			var imgId = document.getElementById("photoImg");
			imgId.style.width = '133px';
			imgId.style.height = '133px';
			try {
				imgId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
				imgId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
			} catch (e) {
				//utilsFp.alert("<dict:lang value='您上传的图片格式不正确' />");
				utilsFp.confirmIcon(3,"","","", "<dict:lang value="您上传的图片格式不正确" />",0,"","");
				return false;
			}
			imgObjPreview.style.display = 'none';
			//document.selection.empty(); 
}
}) ;

function getObjectURL(file) {
	var url = null ; 
	if (window.createObjectURL!=undefined) { // basic
		url = window.createObjectURL(file) ;
	} else if (window.URL!=undefined) { // mozilla(firefox)
		url = window.URL.createObjectURL(file) ;
	} else if (window.webkitURL!=undefined) { // webkit or chrome
		url = window.webkitURL.createObjectURL(file) ;
	}
	return url ;
}

$('#select_locale').click(function(){
	$('#upFile53bb92ed69a846788fb8f2cd0ef98609').click();
})

function judgeImg(){
 var src=document.getElementById('preview53bb92ed69a846788fb8f2cd0ef98609').src;
 if(src.indexOf('plf/page/fp/img/process')==-1){//不是服务器图片
    document.getElementById('serverfileName').value='';
 }

}
function choosePic() {
				
				var piframeId = window.frameElement.id;
				
				var url = "${path}buss/bussModel.ms?exeid=2696ac9808c64dfd9d1b2d8e63f13568&piframeId="+piframeId;						

				showPopWinFp(url, 800, 500, "", "<dict:lang value="选择默认图片"/>",
						"choosePic", "");
	}
	
	
	function definedSave(thisObj){
			
			isQuery = false;
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
			judgeImg();
			$DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
			$DisInput.attr("disabled", false); 
			if($("#isCloseWin").length > 0 && $("#addForm").find("#isCloseWin").length == 0){
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled",true);
                        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=59f4c3345634443fb49112b9aaf5d7e7&type=add";
			document.forms.addForm.submit();
			isQuery = true;
			$DisInput.attr("disabled", true);
		}
		
		
</script>
<bu:script viewId="6ed90fe486c24d4d9339f6a339776e3a" />
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>