<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
	<script>
	//加载父ifream中的js\css文件

		var linkList = window.parent.document.getElementsByTagName("link");
		var scriptList = window.parent.document.getElementsByTagName("script");
		var head = document.getElementsByTagName("head").item(0);
		//外联样式
		for(var i=0;i<linkList.length;i++)
		{
			var l = document.createElement("link");
			l.rel = 'stylesheet';
			l.type = 'text/css';
			l.href = linkList[i].href;
			head.appendChild(l);
		}
		
		//去除重复的js引用
		var json = {};
		var scripts = new Array();
		var j = 0;
		for(var i=0;i<scriptList.length;i++)
		{
			if(scriptList[i].src != null && '' != scriptList[i].src && !json[scriptList[i].src])
			{
				json[scriptList[i].src] = 1;
				//include(scriptList[i].src);
				//alert("include "+scriptList[i].src);
				var script = document.createElement("script");
				script.type = 'text/javascript';
				script.src = scriptList[i].src;
				head.appendChild(script);
				scripts[j] = script;
				j++;
			}
		}
		
		window.scripts = scripts;
	</script>
	<script >
	function setImagePreview(){
		var hhotoObj = document.getElementById("paraMap1_CUST_LOGO");
		var imgObjPreview = document.getElementById("privew");
		if (hhotoObj.files && hhotoObj.files[0]) {
			//火狐下，直接設img属性
			imgObjPreview.style.display = 'block';
			imgObjPreview.style.width = '80px';
			imgObjPreview.style.heighr = '120px';
			imgObjPreview.src = window.URL.createObjectURL(hhotoObj.files[0]);
		}else{
			//IE下，使用滤镜
			hhotoObj.select();
			var imgSrc = document.selection.createRange().text;
			alert(imgSrc);
			var imgId = document.getElementById("photoImg");
			imgId.style.width = '80px';
			imgId.style.height = '120px';
			
			try {
				imgId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
				imgId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
			} catch (e) {
				//utilsFp.alert("<dict:lang value='您上传的图片格式不正确' />");
				utilsFp.confirmIcon(3,"","","", "<dict:lang value="您上传的图片格式不正确" />",0,"","");
				return false;
			}
			imgObjPreview.style.display = 'none';
			document.selection.empty();
		}
		return true;
	}
	
	
	
	

</script>
	<script type="text/javascript">
		var addTableTrMap;
	</script>
</head>
<body>
	<div class="edit">
            <div class="hd">
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                	    <div style="margin-left:10px;"><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0"/><dict:lang value="保存并关闭窗口" /></div>
			    <div class="optn">
			        <button type="button" onclick="add(this);"><i class="ico ico-save"></i>保存</button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i>取消</button>
			    </div>

			</div>
			<div class="bd" style="height: 335px;width:685px;">
						    			<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms" method="post" enctype="multipart/form-data" <bu:formet exeid="%{exeid}" />
										target="submitFrame">
										<input type="hidden" name="exeid" value="${exeid}">
										<input type="hidden" name="iframeId" value="${iframeId}">
										<input type="hidden" name="formId" value="4d5275f6a24f44119737918a3136a935" />
										<input type="hidden" name="definedMsg" value="${definedMsg}">
										<input type="hidden" name="edit_type" value="add">
										<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
										<s:token />
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
		<bu:set name="paraMapObj" value="${dataId}" formId="4d5275f6a24f44119737918a3136a935" type="add" />
	<table class="basic-table" style="margin-right:30px">
	<input type="hidden" name="formIds" value="4d5275f6a24f44119737918a3136a935" />
	<input type="hidden" name="4d5275f6a24f44119737918a3136a935" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'ba5e8ada5376480f90f46d499c3cca07'" />
		<s:set name="_$formId_1" value="'4d5275f6a24f44119737918a3136a935'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name"  style="width:63px"/><span class="dot">*</span><bu:uitn colNo="CUST_CODE" formId="4d5275f6a24f44119737918a3136a935" /></td>
			<td class="dec" ><bu:ui colNo="CUST_CODE" formId="4d5275f6a24f44119737918a3136a935" value="%{CUST_CODE}" formIndex="1" /></td>
			<td class="name" rowspan="5"  style="width:64px;vertical-align: bottom;"/><bu:uitn colNo="CUST_LOGO" formId="4d5275f6a24f44119737918a3136a935" /></td>	
			<td class="dec" rowspan="5"  style="width:230px;vertical-align: bottom;">
		         	<bu:ui colNo="CUST_LOGO" formId="4d5275f6a24f44119737918a3136a935" value="%{CUST_LOGO}" formIndex="1"  />
		        </td>
		</tr>
		<tr>	
			<td class="name"/><span class="dot">*</span><bu:uitn colNo="CUSTOMER" formId="4d5275f6a24f44119737918a3136a935" /></td>
			<td class="dec"><bu:ui colNo="CUSTOMER" formId="4d5275f6a24f44119737918a3136a935" value="%{CUSTOMER}" formIndex="1" /></td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CUST_ABBREVIATION" formId="4d5275f6a24f44119737918a3136a935" /></td>
			<td class="dec"><bu:ui colNo="CUST_ABBREVIATION" formId="4d5275f6a24f44119737918a3136a935" value="%{CUST_ABBREVIATION}" formIndex="1" /></td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CUST_GROUP" formId="4d5275f6a24f44119737918a3136a935" /></td>
			<td class="dec" ><bu:ui colNo="CUST_GROUP" formId="4d5275f6a24f44119737918a3136a935" value="%{CUST_GROUP}" formIndex="1" /></td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CUSTOMER_GRADE" formId="4d5275f6a24f44119737918a3136a935" /></td>
			<td class="dec"><bu:ui colNo="CUSTOMER_GRADE" formId="4d5275f6a24f44119737918a3136a935" value="%{CUSTOMER_GRADE}" formIndex="1" /></td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="STATUS" formId="4d5275f6a24f44119737918a3136a935" /></td>
			<td class="dec"><bu:ui colNo="STATUS" formId="4d5275f6a24f44119737918a3136a935" value="%{STATUS}" formIndex="1" /></td>
		        <td class="name" /><bu:uitn colNo="CUST_BOM" formId="4d5275f6a24f44119737918a3136a935" /></td>
			<td class="dec" ><bu:ui colNo="CUST_BOM" formId="4d5275f6a24f44119737918a3136a935" value="%{CUST_BOM}" formIndex="1" /></td>
			
		        

		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CUST_ADDRESS" formId="4d5275f6a24f44119737918a3136a935" /></td>
			<td class="dec" colspan="3"><bu:ui colNo="CUST_ADDRESS" formId="4d5275f6a24f44119737918a3136a935" value="%{CUST_ADDRESS}" formIndex="1" style="width:100%;"/></td>
		</tr>
		
		<tr>
			<td class="name" /><bu:uitn colNo="MEMO" formId="4d5275f6a24f44119737918a3136a935" /></td>
			<td class="dec" colspan="3" ><bu:ui colNo="MEMO" formId="4d5275f6a24f44119737918a3136a935" value="%{MEMO}" formIndex="1" style="width:100%;height:80px;"/></td>
			
		</tr>
		
		
		 <!--
		<tr>	
                <td class="dec" colspan="4">
		<input type="file" id="paraMap1_CUST_LOGO" name="upFile" title="<dict:lang value="选择客户LOGO" />" onchange="javascript:setImagePreview();"/> 
		</td>
		</tr>
		-->
	</table>
			<bu:jsVal formId="4d5275f6a24f44119737918a3136a935" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
        
        <bu:submit viewId="ba5e8ada5376480f90f46d499c3cca07" />
	<bu:script viewId="ba5e8ada5376480f90f46d499c3cca07" />
        
        
<script type="text/javascript">
	function init(){
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
	$("#paraMap1_CUST_LOGO").change(function(){
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

                fileObj.select();
                var hhotoObj = document.getElementById("paraMap1_GROUP_PHOTO");
		var imgObjPreview = document.getElementById("img0");
			hhotoObj.select();
			var imgSrc = document.selection.createRange().text;
			var imgId = document.getElementById("photoImg");
			imgId.style.width = '100px';
			imgId.style.height = '100px';
			try {
				imgId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
				imgId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
			} catch (e) {
				//utilsFp.alert("<dict:lang value='您上传的图片格式不正确' />");
				utilsFp.confirmIcon(3,"","","", "<dict:lang value="您上传的图片格式不正确" />",0,"","");
				return false;
			}
			imgObjPreview.style.display = 'none';
			document.selection.empty(); 
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

</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>