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
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></Qscript>
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
			<div class="bd">
						    			<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms" method="post" <bu:formet exeid="%{exeid}" />
										target="submitFrame">
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
			<td class="name" style="width:63px;"/><span class="dot">*</span><bu:uitn colNo="GROUP_CODE" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" /></td>
			<td class="dec"><bu:ui colNo="GROUP_CODE" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" value="%{GROUP_CODE}" formIndex="1" /></td>
			<td class="dec" style="width:230px;vertical-align: bottom;" rowspan="5" title="点击上传工序图片,图片大小在2M以内" ><bu:ui colNo="GROUP_PHOTO" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" value="%{GROUP_PHOTO}" formIndex="1" /></td>
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
			<td class="name" /><bu:uitn colNo="VALID_FLAG" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" /></td>
			<td class="dec"><bu:ui colNo="VALID_FLAG" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" value="%{VALID_FLAG}" formIndex="1" /></td>
		
		<tr>
			<td class="name" /><bu:uitn colNo="GROUP_DESC" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" /></td>
			<td class="dec" colspan="2"><bu:ui colNo="GROUP_DESC" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" value="%{GROUP_DESC}" rows="4" formIndex="1" style="width:100%;height:80px;"/></td>
		</tr>
	</table>
			<bu:jsVal formId="f4bff8054eec43dd9b7ffe75eb0f03ac" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

<script type="text/javascript">
document.getElementById("paraMap1_VALID_FLAG_1").checked=true;
	function init(){
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
	$("#paraMap1_GROUP_PHOTO").change(function(){
	
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
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
