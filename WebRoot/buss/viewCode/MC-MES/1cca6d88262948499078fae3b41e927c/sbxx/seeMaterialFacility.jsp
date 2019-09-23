<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
<%@ include file="/plf/common/pub_meta.jsp"%>
<title>${title}</title>
<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="popDivWinFp" value="1" />
	<jsp:param name="datePicker" value="1" />
	<jsp:param name="chosen" value="1" />
</jsp:include>
<link href="${path}plf/page/common/msui/css/css_tab.css"
	rel="stylesheet" type="text/css" />
<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
<style type="text/css">
.input {
	width:200px !important;
}
#paraMapObj_CD_FILES{
    width:100% !important;
}
.black_overlay {
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: #f8fcff;
	z-index: 1001;
	opacity: 0.5;
	filter: alpha(opacity = 88);
}

.white_content {
	display: none;
	position: absolute;
	top: 25%;
	left: 25%;
	width: 50%;
	height: 60%;
	padding: 10px;
	border: 1px solid #cbe9ff;
	background-color: #f8fcff;
	z-index: 1002;
	overflow: auto;
}

.white_contents {
	display: none;
	position: absolute;
	top: 15%;
	left: 2%;
	width: 94%;
	height: 65%;
	padding: 10px;
	border: 1px solid #cbe9ff;
	background-color: #f8fcff;
	z-index: 1002;
	overflow: auto;
}
		.extend-btn button .ico-kl-new-add {
			width: 15px;
			height: 15px;
			margin-right: 5px;
			margin-bottom: 3px;
			background: url(${path}plf/page/fp/img/ico-kl.png) no-repeat;
		}

		.extend-btn button:hover .ico-kl-new-add {
			width: 15px;
			height: 15px;
			margin-right: 5px;
			margin-bottom: 3px;
			background: url(${path}plf/page/fp/img/ico-kl-h.png) no-repeat;
		}

		.extend-btn button .ico-sc-new-add {
			width: 15px;
			height: 15px;
			margin-right: 5px;
			margin-bottom: 3px;
			background: url(${path}plf/page/fp/img/ico-sc.png) no-repeat;
		}
		
		.extend-btn button:hover .ico-sc-new-add {
			width: 15px;
			height: 15px;
			margin-right: 5px;
			margin-bottom: 3px;
			background: url(${path}plf/page/fp/img/ico-sc-h.png) no-repeat;
		}
		
		.datagrid-header,.datagrid-div3{
	       width:100% !important;
	      }
	    .state {
            display: inline-block;
            width: 45px;
            height: 20px;
            line-height: 20px;
            color: #fff;
            text-align: center;
            font-size: 12px;
            border-radius: 2px;	
	        
	    }
	</style>
	<!-- head里面 -->
	  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	     <jsp:param name="modelName" value="VIEW_TYPE_18" />
	     <jsp:param name="location" value="inHead" />
	  </jsp:include>
<script>
	

		function init(){
		$("#tag1").addClass("current");
		var tableTrJs = $("#loadPoint tbody tr");
		//_toClickColor(tableTrJs);
		_tongLineColor(tableTrJs);
		
	  	//clickTr("loadPoint");
	  		$("#allSelect").click(function(){
    			if($("#allSelect").attr("checked") == "checked"){
        			$("input[name='isSelect1']").attr("checked","checked");
    			}else{
        			$("input[name='isSelect1']").removeAttr("checked","checked");
    			}
			});
		}
	</script>
<script type="text/javascript">
	var loaded = 1;
	var tab_len = 2;

	var currentTag;
	var tabs = "";
	function switchTag(tag, content, url) {
		if (currentTag == tag) {
			return false;
		}
		document.getElementById("content2").style.display="";
		for (i = 1; i < (tab_len + 1); i++) {
			if ("tag" + i == tag) {
				document.getElementById(tag).getElementsByTagName("a")[0].className = "selectli1";
				document.getElementById(tag).getElementsByTagName("a")[0]
						.getElementsByTagName("span")[0].className = "selectspan1";
			} else {
				document.getElementById("tag" + i).getElementsByTagName("a")[0].className = "";
				document.getElementById("tag" + i).getElementsByTagName("a")[0]
						.getElementsByTagName("span")[0].className = "";
			}
			$("#" + tag).addClass("current").siblings().removeClass("current");
			if ("content" + i == content) {
				currentTag = tag;
				document.getElementById(content).className = "";
			} else {
				document.getElementById("content" + i).className = "hidecontent";
			}
			document.getElementById("content").className = content;
		}
	}

</script>

<script type="text/javascript">
	$("#paraMapObj_CD_PICTURE").live('change',function(e){
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
                var hhotoObj = document.getElementById("paraMapObj_CD_PICTURE");
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
$(function(){
	if('${dataMap.pictureName}'!=""){
	document.getElementById("img0").src = $("#picturePath").val()+"up_load/comm/"+'${dataMap.pictureName}';
	}
	//console.log($("#picturePath").val()+"up_load/comm/"+'${dataMap.pictureName}');
})
</script>
</head>
<body  style="background-color: #fff;" >
	<DIV class="multilist comwrap content-in">
		<div class="">
		<form id="editCalForm" name="editCalForm" action="${path}buss/bussModel_editAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post" <bu:formet exeid="%{exeid}" /> target="submitFrame" style="">
       <!-- <div class="hd">
                
                
			   <div class="optn" style="margin-right: 5px;">
			  	        <button type="button" id="saveInfo" onclick="editCal()"><i class="ico ico-save"></i><dict:lang value="提交" /></button>
        				<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i>取消</button>
        			    <button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button> 
			    </div>
 				
			</div>
		-->
				<div class="js-tab">
					<DIV id="container"  style="padding: 0 20px;box-sizing: border-box;">
						<DIV class="hd">
							<UL class="tab-list tab">
								<LI id="tag1"><A class="selectli1"
									onclick="switchTag('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN class="selectspan1"><dict:lang value="基本信息" /></SPAN>
								</A>
								</LI>
								<LI id="tag2"><A class=""
									onclick="switchTag('tag2','content2','${path}buss/bussModel.ms?exeid=b3d19dd778dc4bf6ae463d3c3a396e30');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="料站信息" /></SPAN> </A>
								</LI>

							</UL>
						</DIV>
					<!--<form id="editCalForm" name="editCalForm" action="${path}buss/bussModel_editAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post" <bu:formet exeid="%{exeid}" /> target="submitFrame" style="margin-top: 20px;">-->
						
						<DIV class="content1" id="content">
							<DIV id="content1">
								
									<input type="hidden" name="exeid" value="${exeid}">
									<input type="hidden" name="iframeId" value="${iframeId}"> 
									<input type="hidden" name="definedMsg" value="${definedMsg}">
									<input type="hidden" name="formId" value="99338dfb95df4eec8d5714a4e773b127" />
									<s:hidden id="picturePath" value="${path}"/>
									
									<!--<s:hidden
										name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}"
										value="%{FUNC_CODE_2}" />-->
									<s:token />
									<table class="func_table">
										<tr>
											<td width="100%" align="right"></td>
										</tr>
									</table>
									<bu:set name="paraMapObj" value="${dataId}"
										formId="99338dfb95df4eec8d5714a4e773b127" type="edit" />
									<input type="hidden" id="pPath" name="oldPictureName" value="${paraMapObj.PICTURE_PATH}">
									<table class="basic-table">
										<input type="hidden" name="formIds"
											value="99338dfb95df4eec8d5714a4e773b127" />
										<input type="hidden" name="99338dfb95df4eec8d5714a4e773b127"
											value="paraMap0@" />
										<input type="hidden" name="paraMap0@__LEVEL__" value="0" />
										<input type="hidden" name="paraMap0@__DATA_COUNT__" value="1" />
										<s:set name="_$viewId"
											value="'2bbae74963394fa0baeef60d73d21b30'" />
										<s:set name="_$formId_1"
											value="'99338dfb95df4eec8d5714a4e773b127'" />
										<s:set name="_$type" value="'detail'" />
		<tr>
			<td class="name" style="width:67px"/><bu:uitn colNo="CD_DEVICE_TYPE" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec" colNo="CD_DEVICE_TYPE" formId="99338dfb95df4eec8d5714a4e773b127" ><bu:ui colNo="CD_DEVICE_TYPE" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" style="width:67px"/><bu:uitn colNo="CD_DEVICE_SN" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec" style="width:230px" colNo="CD_DEVICE_SN" formId="99338dfb95df4eec8d5714a4e773b127" ><bu:ui colNo="CD_DEVICE_SN" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" rowspan="5"  style="width:64px;vertical-align: bottom;"/><bu:uitn colNo="CD_PICTURE" formId="99338dfb95df4eec8d5714a4e773b127" /></td>	
			<td class="dec" rowspan="5"  style="width:200px;vertical-align: bottom;">
			<div id="photoImg"> <img alt="" id="img0" src="" width="100px" height="100px"> </div>
			<input type="file" accept="image/*" id="paraMapObj_CD_PICTURE" name="upFile" value="" class="isSubmit input" disabled="disabled"/>
			<!--<bu:ui colNo="CD_PICTURE" name="upFile" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1"  />-->
			</td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CD_DEVICE_NAME" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec" colNo="CD_DEVICE_NAME" formId="99338dfb95df4eec8d5714a4e773b127" ><bu:ui colNo="CD_DEVICE_NAME" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="CD_PRODECT_DATE" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec" colNo="CD_PRODECT_DATE" formId="99338dfb95df4eec8d5714a4e773b127" ><bu:ui colNo="CD_PRODECT_DATE" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CD_BUY_DATE" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec" colNo="CD_BUY_DATE" formId="99338dfb95df4eec8d5714a4e773b127" ><bu:ui colNo="CD_BUY_DATE" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="CD_USE_DEP" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec" colNo="CD_USE_DEP" formId="99338dfb95df4eec8d5714a4e773b127" ><bu:ui colNo="CD_USE_DEP" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
    
	    <tr>
			<td class="name" /><bu:uitn colNo="CD_CHARGE_MAN" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec" colNo="CD_CHARGE_MAN" formId="99338dfb95df4eec8d5714a4e773b127" ><bu:ui colNo="CD_CHARGE_MAN" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="CD_CHARGE_MAN_TWO" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec" colNo="CD_CHARGE_MAN_TWO" formId="99338dfb95df4eec8d5714a4e773b127" ><bu:ui colNo="CD_CHARGE_MAN_TWO" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
		<tr>
			<td class="name" /><bu:uitn colNo="CD_CHARGE_MAN_THREE" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec" colNo="CD_CHARGE_MAN_THREE" formId="99338dfb95df4eec8d5714a4e773b127" ><bu:ui colNo="CD_CHARGE_MAN_THREE" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" /></bu:td>
		    <td class="name" /><bu:uitn colNo="CD_STATUS" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec" colNo="CD_STATUS" formId="99338dfb95df4eec8d5714a4e773b127" ><bu:ui colNo="CD_STATUS" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CD_SUPPLIER_ID" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec" colNo="CD_SUPPLIER_ID" formId="99338dfb95df4eec8d5714a4e773b127" ><bu:ui colNo="CD_SUPPLIER_ID" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="CD_VALID_FLAG" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec" colNo="CD_VALID_FLAG" formId="99338dfb95df4eec8d5714a4e773b127" ><bu:ui colNo="CD_VALID_FLAG" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CD_DEVICE_CLASS" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec" colNo="CD_DEVICE_CLASS" formId="99338dfb95df4eec8d5714a4e773b127" ><bu:ui colNo="CD_DEVICE_CLASS" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="CD_DEVICE_SPEC" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec" colNo="CD_DEVICE_SPEC" formId="99338dfb95df4eec8d5714a4e773b127"  ><bu:ui colNo="CD_DEVICE_SPEC" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" />
											<bu:uitn colNo="CD_LOCATION"
												formId="99338dfb95df4eec8d5714a4e773b127" />
											</td>
											<bu:td cssClass="dec" colNo="CD_LOCATION"
												formId="99338dfb95df4eec8d5714a4e773b127">
												<bu:ui colNo="CD_LOCATION"
													formId="99338dfb95df4eec8d5714a4e773b127"
													dataId="${dataId}" formIndex="1" />
											</bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CD_FILES" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec" colNo="CD_FILES" formId="99338dfb95df4eec8d5714a4e773b127"  colspan="5" ><bu:ui    colNo="CD_FILES" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" style="width:100%;height:100%;"/></bu:td>
		</tr>			
		<tr>
			<td class="name" /><bu:uitn colNo="CD_MEMO" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec" colNo="CD_MEMO" formId="99338dfb95df4eec8d5714a4e773b127" style="height:80px;" colspan="5"><bu:ui rows="4" colNo="CD_MEMO" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" style="width:100%;height:100%;"/></bu:td>
		</tr>
	
		</table>
									<bu:jsVal formId="99338dfb95df4eec8d5714a4e773b127"
										formIndex="0" />
										
								
							</DIV>
							<DIV id="content2"  style="display:none">  
							 <div >
							 <bu:funcsi viewId="ca49fdd3d575456cbfbc772d73034dee" funcId="ed334aadf26347b78c1dcaa1b677691a" isHidden="1"/>
							 <div id="back" class="black_overlay"/></div>
						<!-- addFCWT begin -->
								<div class="dialog dialog-s1" id="addFCWT"
											style="display:none;z-index:1030;margin-left:0px;left:169px;top:32px;width:390px;height:240px;">
											<div class="dialog-hd">
												<h3 class="tit">
													<dict:lang value="料站信息" />
												</h3>
											</div>
						<a class="dialog-close" href="javascript:void(0);"
								onclick="hideDiv('addFCWT','back');"></a>
							<div class="dialog-bd" style="width:100%;height:330px;">
									<br />
									
									<div class="optn" style="margin-top:40px;">
									
			        				<button type="button" onclick="addLoadPoint('addFCWT','back');"><i class="ico ico-save"></i>保存</button>
			        				<button type="button" onclick="hideDiv('addFCWT','back');"><i class="ico ico-cancel"></i>取消</button>
			    					</div>
			    					
			    					<div>
							 <table class="basic-table" style="margin-top:15px;background-color: white;">
								<tr>
									<td style="width: 27%;text-align: right;" class="name"><dict:lang value="新增方式" /></td>
									<td class="dec">
										<select id="addWay" name="addWay" class=" input isSubmit" onchange="changeWay();">
	                						<option value="0" selected="selected"><dict:lang value="单个" /></option>
											<option value="1"><dict:lang value="批量" /></option>
										</select>
									</td>
								</tr>
								<tbody id="addDiv1">
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><span class="dot">*</span><dict:lang value="Table"/></td>
												<td class="dec"><input type="text" id="CDL_TABLE" class=" input isSubmit"/>
												<span class="Eng"><span id="CDL_TABLE_err"></span></span></td>
											</tr>
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><span class="dot">*</span><dict:lang value="料站"/></td>
												<td class="dec"><input type="text" id="CDL_LOADPOINT" class=" input isSubmit "/>
												<span class="Eng"><span id="CDL_LOADPOINT_err"></span></span></td>
											</tr>
												<td style="width: 27%;text-align: right;" class="name"><span class="dot">*</span><dict:lang value="轨道"/></td>
												<td class="dec"><dict:selectDict id="TRACK_TYPE" name="TRACK_TYPE" dictCode="TRACK_TYPE" dictValue="%{userDto.TRACK_TYPE}"  style="cursor: pointer;width:230px;" /></td>
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><dict:lang value="说明"/></td>
												<td class="dec"><textarea id="CDL_MEMO" style="height: 62px;" class=" input isSubmit "></textarea></td>
											</tr>
											<tr>
												<td style="width: 27%;text-align: right;" class="name">&nbsp;&nbsp;</td>
												<td class="dec">&nbsp;&nbsp;</td>
											<tr>
											<tr>
												<td style="width: 27%;text-align: right;" class="name">&nbsp;&nbsp;</td>
												<td class="dec">&nbsp;&nbsp;</td>
											<tr>
								</tbody>
								<tbody id="addDiv2" style="display: none;">
								<tr>
												<td style="width: 27%;text-align: right;" class="name"><span class="dot">*</span><dict:lang value="Table"/></td>
												<td class="dec"><input type="text" id="CDL_TABLE1" class=" input isSubmit"/>
												<span class="Eng"><span id="CDL_TABLE1_err"></span></span></td>
											</tr>
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><dict:lang value="料站前缀"/></td>
												<td class="dec"><input type="text" id="CDL_LOADPOINT_PREFIX" class=" input isSubmit"/></td>
											</tr>
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><span class="dot">*</span><dict:lang value="起始流水"/></td>
												<td class="dec"><input type="text" id="CDL_STAR" class=" input isSubmit"/>
												<span class="Eng"><span id="CDL_STAR_err"></span></span></td>
											</tr>
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><span class="dot">*</span><dict:lang value="料站数量"/></td>
												<td class="dec"><input type="text" id="CDL_LOADPOINT_COUNT" class=" input isSubmit"/>
												<span class="Eng"><span id="CDL_LOADPOINT_COUNT_err"></span></span></td>
											</tr>
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><span class="dot">*</span><dict:lang value="轨道"/></td>
												<td class="dec"><dict:selectDict id="TRACK_TYPE1"  dictCode="TRACK_TYPE" dictValue="%{userDto.TRACK_TYPE}"  style="cursor: pointer;width:230px;" /></td>
											</tr>
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><dict:lang value="说明"/></td>
												<td class="dec"><textarea id="CDL_MEMO1" style="height: 62px;" class=" input isSubmit"></textarea></td>
											</tr>
								</tbody>
							 </table>
						 </div>
						</div>
					</div>
					<div class="dialog-mask" id="back" style="z-index:1029"></div>
					<!-- addFCWT end -->
<div class="">
<div class="mod-hd">
<h3 class="tit">&nbsp;</h3>
<!--
<div class="more">
<div class="extend-btn" style="float:right;margin-top:-26px;">
<button href="javascript:void(0);" type="button" onclick="popLoadpointDiv('addFCWT','back');" title="添加"><i class="ico ico-kl-new-add ico-small"></i></button>
<button href="javascript:void(0);" type="button" onclick="delLoadpointRow();" title="删除"><i class="ico ico-sc-new-add ico-small"></i></button>
</div>
</div>
-->
</div>
<div class="panel datagrid datagrid-div1">
<c:forEach items="${dataList}" var="cdlList">
						<div id="hidDiv_${cdlList.rownum}">
						<input name="CDL_TABLE_${cdlList.rownum}" type="hidden" value="${cdlList.cdl_table}">
						<input name="CDL_LOADPOINT_${cdlList.rownum}" type="hidden" value="${cdlList.cdl_loadpoint}">
						<input name="CDL_TRACK_${cdlList.rownum}" type="hidden" value="${cdlList.cdl_track}">
						<input name="CDL_MEMO_${cdlList.rownum}" type="hidden" value="${cdlList.cdl_memo}">
						</div>
				</c:forEach>
	<div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view" style="width:100%;height:100%">
			<div class="datagrid-header">
				<div class="datagrid-header-inner" id="datagrid-header-inner" style="width:100%">
				<table  class="datagrid-htable fixedTable  " id="loadPoint1">        
					<tbody>
					<tr class="thcolor">
						<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
						<td class="datagrid-cell" align="center" style="width:30px;text-align: center"><input type="checkbox" id="allSelect" name="allSelect" disabled="disabled"/></th >
						<td class="datagrid-cell" align="center" width="200px;" ><dict:lang value="Table" /></th >
						<td class="datagrid-cell" align="center" width="200px;" ><dict:lang value="料站位" /></th >
						<td class="datagrid-cell" align="center" width="200px;" ><dict:lang value="轨道" /></th >
						<td class="datagrid-cell" align="center" width="200px;" ><dict:lang value="说明" /></th >
					</tr>
					</tbody>
				</table>
				</div>
		</div>
		<div class="datagrid-body datagrid-div3" id="datagrid-body" style="min-height:239px;height: 222px;width:100%;">
		<table class="dlist-table" id="loadPoint" style="width:100%;border-left: 1px solid #ccc;border-right: 1px solid #ccc;"><!--datagrid-btable-->
					<tbody id="addLoadPoint">
					<c:forEach items="${dataList}" var="cdlList" varStatus="str">
								<tr id="${cdlList.rownum}" name="${cdlList.rownum}">
									<td class="datagrid-cell datagrid-cell-0" style="width:31px;text-align: center;">${str.index+1}</td>
									<td class="datagrid-cell datagrid-cell-1" align="center" style="width:30px;"><input type="checkbox" value="${cdlList.rownum}" name="isSelect1" disabled="disabled"/></td>
									<td class="datagrid-cell datagrid-cell-2"  width="203px;">
										${cdlList.cdl_table}
									</td>
									<td class="datagrid-cell datagrid-cell-3" width="203px;">
										${cdlList.cdl_loadpoint}
									</td>
									<td class="datagrid-cell datagrid-cell-4" width="203px;">
										${cdlList.dict}
									</td>
									<td class="datagrid-cell datagrid-cell-5" >
										${cdlList.cdl_memo}
									</td>
								</tr>
					</c:forEach>
					</tbody>
				</table>
	</div>		
</div>
</div>	
									
							</DIV>

						</DIV>
						</form>
					</DIV>
				</div>
		</div>
	</DIV>
<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<script type="text/javascript">
			var parentWindow;
			$(function(){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
			});
		/*var isQuery = false;
		function edit(thisObj){
			if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
			if(!val.valNullData()){
				return ;
			}
			if(!valData()){
				return ;
			}
			if(!val.valOjbsData()){
				return ;
			}
			//解决附件清空时，无法传到后台的问题;解决checkbox清空时，无法传到后台的问题	
			emptyValToHide('0');
			document.forms.editForm.submit();
			isQuery = true;
		}*/
		
		
				
		var FORM_COL_ID_D=null;
		function getEditRows(tableId,formIndex,formidFirstId,subFormId,subRelColId,relColVal){
			util.showLoading();
			var url ="${path}buss/bussModel_editSubDataAx.ms";
			var addTtable = $('#addTable_'+tableId);
			var tableTrJq = addTtable.find("tbody tr");
			var row_count = tableTrJq.length;
			if(row_count == 0){
				curRowSeq=0;
			}
			var FORM_COL_ID_D = $('#addTable_FORM_COL_ID_D'+tableId).val();// <%-- 该值应该等于subRelColId --%>
		  jQuery.ajax({
				type: "POST",
		    dataType: "json",
		    url: url,
		    data:{'paraMap.FORMID':tableId,'paraMap.formIndex':formIndex,'paraMap.FORM_COL_ID_D':FORM_COL_ID_D,'paraMap.trIndex':curRowSeq,'paraMap.formidFirstId':formidFirstId,'paraMap.subFormId':subFormId,'paraMap.subRelColId':subRelColId,'paraMap.relColVal':relColVal},
				success: function(data){
					util.closeLoading();
					if("" == $("#aaaa").val()){
					$("#aaaa").val(data.ajaxPage.tableData);
					}else{
					$("#bbbb").val(data.ajaxPage.tableData);
					}
					var row = $(data.ajaxPage.tableData);
					_toClickColor(row);// <%-- 行点击着色 --%>
					addTtable.append(row);
					var dataCountObj = $("input[name='paraMap"+formIndex+formSplit+FORM_PAGE_DATA_COUNT_FLAG+"']");
					dataCountObj.val(row_count+ 1);
					curRowSeq=curRowSeq+row.length;
				},
				error: function(XMLHttpRequest, textStatus, errorThrown){
					util.closeLoading();
					var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
					if (null != sessionstatus && sessionstatus == "noAuthority") {
					}else{
						util.alert("error:"+errorThrown);
					}
			   }
			});
		}

</script>
<bu:script viewId="2bbae74963394fa0baeef60d73d21b30" />

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		 <jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	

</body>


<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>