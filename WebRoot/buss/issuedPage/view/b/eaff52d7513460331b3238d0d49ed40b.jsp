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
			        <button type="button" onclick="addGloble_s3()"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd">
						    			<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms" method="post" <bu:formet exeid="%{exeid}" />
										target="submitFrame">
										<input type="hidden" name="exeid" value="${exeid}">
										<input type="hidden" name="definedMsg" value="${definedMsg}">
										<input type="hidden" name="formId" value="${formId}">
										<input type="hidden" name=iframeId value="${iframeId}">
										<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
										<s:token />
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
		<bu:set name="paraMapObj" value="${dataId}" formId="c3a183e393ea4dfabb15712f9dba1873" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="c3a183e393ea4dfabb15712f9dba1873" />
	<input type="hidden" name="c3a183e393ea4dfabb15712f9dba1873" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="_cfi_item_type" id="_cfi_item_type"/> 
	<input type="hidden" name="_cfi_mt_type" id="_cfi_mt_type"/>
		<s:set name="_$viewId" value="'bc00c4cebe524beaba8ba3ccc5f1e29b'" />
		<s:set name="_$formId_1" value="'c3a183e393ea4dfabb15712f9dba1873'" />
		<s:set name="_$type" value="'add'" />
	  
	 	<!--1-->
		<tr>
		   <td class="name-six" /><bu:uitn colNo="CFI_ADDWAY" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_ADDWAY" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_ADDWAY" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		   <td>&nbsp;</td>
		   <td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CFI_FIX_SN" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_FIX_SN" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_FIX_SN" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		    <td>&nbsp;</td>
		    <td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CFI_COUNT" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_COUNT" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_COUNT" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
		<!--2-->
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CFI_ITEM_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_ITEM_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_ITEM_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		    <td>&nbsp;</td>
		    <td class="name-six" /><bu:uitn colNo="CFI_INSTOCK_DOC" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_INSTOCK_DOC" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_INSTOCK_DOC" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		    <td>&nbsp;</td>
		    	<td class="name-six" /><bu:uitn colNo="CFI_SUPPLIER_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_SUPPLIER_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_SUPPLIER_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
		<!--3-->
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFI_ROHS_FLAG" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_ROHS_FLAG" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_ROHS_FLAG" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
			<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFI_MAX_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_MAX_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_MAX_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		    <td>&nbsp;</td>
		    <td class="name-six" /><bu:uitn colNo="CFI_TOTAL_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_TOTAL_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_TOTAL_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<!--4-->
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFI_MT_TYPE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_MT_TYPE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_MT_TYPE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
	     	<td>&nbsp;</td>
	     	<td class="name-six" /><bu:uitn colNo="CFI_MT_VAULE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_MT_VAULE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_MT_VAULE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
	    	<td>&nbsp;</td>
	    	<td class="name-six" /><bu:uitn colNo="CFI_MT_REMIND" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_MT_REMIND" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_MT_REMIND" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<!--5-->
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFI_ITEM_TYPE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_ITEM_TYPE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_ITEM_TYPE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
			<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFI_ASSISTANTTOOLNAME" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_ASSISTANTTOOLNAME" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_ASSISTANTTOOLNAME" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		    <td>&nbsp;</td>
		    <td class="name-three" /><bu:uitn colNo="CFI_ASSISTANTTOOLSPEC" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_ASSISTANTTOOLSPEC" formId="c3a183e393ea4dfabb15712f9dba1873"  colspan="7"><bu:ui colNo="CFI_ASSISTANTTOOLSPEC" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<!--6-->
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFI_LEFT_TOP" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_LEFT_TOP" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_LEFT_TOP" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		    <td>&nbsp;</td>
		    <td class="name-six" /><bu:uitn colNo="CFI_RIGHT_TOP" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_RIGHT_TOP" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_RIGHT_TOP" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
	     	<td>&nbsp;</td>
	     	<td class="name-six" /><bu:uitn colNo="CFI_MIDDLE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_MIDDLE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_MIDDLE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<!--7-->
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFI_LEFT_LOWER" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_LEFT_LOWER" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_LEFT_LOWER" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		    <td>&nbsp;</td>
		    <td class="name-six" /><bu:uitn colNo="CFI_RIGHT_LOWER" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_RIGHT_LOWER" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_RIGHT_LOWER" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<!--8-->
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFI_MEMO" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_MEMO" formId="c3a183e393ea4dfabb15712f9dba1873" colspan="7"><bu:ui colNo="CFI_MEMO" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="height:80px;"/></bu:td>
	    </tr>
		
	 
		 
	</table>
			<bu:jsVal formId="c3a183e393ea4dfabb15712f9dba1873" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<bu:submit viewId="bc00c4cebe524beaba8ba3ccc5f1e29b" />
	<bu:script viewId="bc00c4cebe524beaba8ba3ccc5f1e29b" />
	
<script type="text/javascript">
	function init(){
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}
		   $("#paraMap1_CFI_ASSISTANTTOOLNAME").removeAttr("disabled"); 
			$("#paraMap1_CFI_COUNT").removeAttr("disabled"); 
			
			
			$("#paraMap1_CFI_ITEM_TYPE").attr("readonly","readonly"); 
			$("#paraMap1_CFI_ITEM_TYPE").addClass("readonly");
			
			$("#paraMap1_CFI_ASSISTANTTOOLNAME").attr("readonly","readonly"); 
			$("#paraMap1_CFI_ASSISTANTTOOLNAME").addClass("readonly");  
			
			
			$("#paraMap1_CFI_ASSISTANTTOOLSPEC").attr("readonly","readonly"); 
			$("#paraMap1_CFI_ASSISTANTTOOLSPEC").addClass("readonly");
 
			$("#paraMap1_CFI_MAX_USAGE").attr("readonly","readonly"); 
			$("#paraMap1_CFI_MAX_USAGE").addClass("readonly");
			
			$("#paraMap1_CFI_MT_VAULE").attr("readonly","readonly"); 
			$("#paraMap1_CFI_MT_VAULE").addClass("readonly");
			
			$("#paraMap1_CFI_MT_REMIND").attr("readonly","readonly"); 
			$("#paraMap1_CFI_MT_REMIND").addClass("readonly"); 
			
			$("#paraMap1_CFI_COUNT").attr("readonly","readonly"); 
			$("#paraMap1_CFI_COUNT").addClass("readonly"); 
			
			$("#paraMap1_CFI_MT_TYPE").addAttr("disabled");
			 
			$("#paraMap1_CFI_TOTAL_USAGE").val("0");
       
      
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
	
	
	 $("#paraMap1_CFI_ADDWAY").change(function(){
            if($(this).val()==1){
                 $("#paraMap1_CFI_COUNT").val("");
               
            	$("#paraMap1_CFI_COUNT").attr("readonly","readonly"); 
            	$("#paraMap1_CFI_COUNT").addClass("readonly");
            	
            	$("#paraMap1_CFI_FIX_SN").removeAttr("readonly"); 
            	$("#paraMap1_CFI_FIX_SN").removeClass("readonly");
           }else{
                $("#paraMap1_CFI_FIX_SN").val("");
                
             	$("#paraMap1_CFI_COUNT").removeAttr("readonly"); 
            	$("#paraMap1_CFI_COUNT").removeClass("readonly");
            	
            	$("#paraMap1_CFI_FIX_SN").attr("readonly","readonly"); 
            	$("#paraMap1_CFI_FIX_SN").addClass("readonly");
           }
       });  
       
	 
       $('#paraMap1_CFI_TOTAL_USAGE').bind('keyup', function () {
	var calwStart=$("#paraMap1_CFI_TOTAL_USAGE");
             if( ! /^([\d]+|([\d]+[.]?|[\d]+[.]?[\d]+))$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_CFI_TOTAL_USAGE'),"<dict:lang value="该项只能为数字" />");
             }
         });
       
       
       
       
       	
	$('#paraMap1_CFI_LEFT_TOP').bind('keyup', function () {
	var calwStart=$("#paraMap1_CFI_LEFT_TOP");
             if( ! /^([\d]+|([\d]+[.]?|[\d]+[.]?[\d]+))$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_CFI_LEFT_TOP'),"<dict:lang value="该项只能为数字" />");
             }
         });
		
		$('#paraMap1_CFI_RIGHT_TOP').bind('keyup', function () {
	var calwStart=$("#paraMap1_CFI_RIGHT_TOP");
             if( ! /^([\d]+|([\d]+[.]?|[\d]+[.]?[\d]+))$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_CFI_RIGHT_TOP'),"<dict:lang value="该项只能为数字" />");
             }
         });
         
         $('#paraMap1_CFI_MIDDLE').bind('keyup', function () {
	var calwStart=$("#paraMap1_CFI_MIDDLE");
             if( ! /^([\d]+|([\d]+[.]?|[\d]+[.]?[\d]+))$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_CFI_MIDDLE'),"<dict:lang value="该项只能为数字" />");
             }
         });
         
         $('#paraMap1_CFI_LEFT_LOWER').bind('keyup', function () {
	var calwStart=$("#paraMap1_CFI_LEFT_LOWER");
             if( ! /^([\d]+|([\d]+[.]?|[\d]+[.]?[\d]+))$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_CFI_LEFT_LOWER'),"<dict:lang value="该项只能为数字" />");
             }
         });
         
         $('#paraMap1_CFI_RIGHT_LOWER').bind('keyup', function () {
	var calwStart=$("#paraMap1_CFI_RIGHT_LOWER");
             if( ! /^([\d]+|([\d]+[.]?|[\d]+[.]?[\d]+))$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_CFI_RIGHT_LOWER'),"<dict:lang value="该项只能为数字" />");
             }
         });
         
         
         
         
		
		
		
 
	
$('#paraMap1_CFI_COUNT').bind('keyup', function () {
 
  if( ! /^(1)$|^100$|^[1-9][0-9]?$/.test(this.value)){
 
             	this.value='';
   
             	_alertValMsg($('#paraMap1_CFI_COUNT'),"<dict:lang value="该项只能为不大于100的数字" />");
             }
 
         });
       
       
       
       
       
       
	 function equal_3(){
		 	$("#paraMap1_CFI_LEFT_TOP").attr("readonly","readonly"); $("#paraMap1_CFI_LEFT_TOP").addClass("readonly");$("#paraMap1_CFI_LEFT_TOP").val(0);
$("#paraMap1_CFI_RIGHT_TOP").attr("readonly","readonly");  $("#paraMap1_CFI_RIGHT_TOP").addClass("readonly");$("#paraMap1_CFI_RIGHT_TOP").val(0);
$("#paraMap1_CFI_MIDDLE").attr("readonly","readonly");  $("#paraMap1_CFI_MIDDLE").addClass("readonly");$("#paraMap1_CFI_MIDDLE").val(0);
$("#paraMap1_CFI_LEFT_LOWER").attr("readonly","readonly");  $("#paraMap1_CFI_LEFT_LOWER").addClass("readonly");$("#paraMap1_CFI_LEFT_LOWER").val(0);
$("#paraMap1_CFI_RIGHT_LOWER").attr("readonly","readonly");  $("#paraMap1_CFI_RIGHT_LOWER").addClass("readonly");$("#paraMap1_CFI_RIGHT_LOWER").val(0);$("#paraMap1_CFI_TOTAL_USAGE").val("0");
		 }
		 
		 		 function equal_2(){
		 	$("#paraMap1_CFI_LEFT_TOP").removeAttr("readonly");  $("#paraMap1_CFI_LEFT_TOP").removeClass("readonly");$("#paraMap1_CFI_LEFT_TOP").val(0);
$("#paraMap1_CFI_RIGHT_TOP").removeAttr("readonly"); $("#paraMap1_CFI_RIGHT_TOP").removeClass("readonly");$("#paraMap1_CFI_RIGHT_TOP").val(0)
$("#paraMap1_CFI_MIDDLE").removeAttr("readonly"); $("#paraMap1_CFI_MIDDLE").removeClass("readonly");$("#paraMap1_CFI_MIDDLE").val(0);
$("#paraMap1_CFI_LEFT_LOWER").removeAttr("readonly"); $("#paraMap1_CFI_LEFT_LOWER").removeClass("readonly");$("#paraMap1_CFI_LEFT_LOWER").val(0);
$("#paraMap1_CFI_RIGHT_LOWER").removeAttr("readonly"); $("#paraMap1_CFI_RIGHT_LOWER").removeClass("readonly");$("#paraMap1_CFI_RIGHT_LOWER").val(0);$("#paraMap1_CFI_TOTAL_USAGE").val("0");
		 }
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
