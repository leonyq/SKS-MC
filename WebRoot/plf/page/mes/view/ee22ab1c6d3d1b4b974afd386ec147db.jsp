<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<%@ include file="/plf/common/pub_meta.jsp"%>
<title><dict:lang value="新增" />
</title>
<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="popDivWinFp" value="1" />
	<jsp:param name="datePicker" value="1" />
</jsp:include>
<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
<script type="text/javascript" src="${path}plf/js/ui/include.js"></script>
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

<script type="text/javascript">
	     function select(){
	        var selectobj = document.getElementById("paraMap1_CF_TYPE");
	        var inputobj1 = document.getElementById("CF_PROJECT_ID_SHOW");
	        var inputobj2 = document.getElementById("MODEL_CODE_SHOW");
	        var hinputobj = document.getElementById("flag");
	       for(var i=0;i<selectobj.length;i++){
	         var optionobj = selectobj[i];
	         var optionvalue = selectobj[i].value;
	         if(optionobj.selected==true){
	           if(optionvalue=="0"){
	           $("#pi").text("");
                   $("#mc").text("");
	          $("#CF_PROJECT_ID_SHOW").attr("value","");
	          $("#MODEL_CODE_SHOW").attr("value","");
	          $("#CF_PROJECT_ID").val("");
	          $("#MODEL_CODE").val("");
	          inputobj1.disabled =true;
	          inputobj2.disabled =true;
	          $("#CF_PROJECT_ID_SHOW").addClass("readonly");
		  $("#MODEL_CODE_SHOW").addClass("readonly");
	          $(inputobj1).parent().find("button").attr("disabled",true);
	          $(inputobj2).parent().find("button").attr("disabled",true);
	         }else if(optionvalue=="1"){
	          $("#pi").text("*");
                  $("#mc").text("");
	          $("#MODEL_CODE_SHOW").attr("value","");
	          $("#MODEL_CODE").val("");
	          inputobj1.disabled = false;
	          inputobj2.disabled = true;
	          $("#CF_PROJECT_ID_SHOW").removeClass("readonly");
		  $("#MODEL_CODE_SHOW").addClass("readonly");
	           $(inputobj1).parent().find("button").attr("disabled",false);
	          $(inputobj2).parent().find("button").attr("disabled",true);
	         }else if(optionvalue=="2"){
	          $("#pi").text("");
                  $("#mc").text("*");
	          $("#CF_PROJECT_ID_SHOW").attr("value","");
	          $("#CF_PROJECT_ID").val("");
	          inputobj1.disabled = true;
	          inputobj2.disabled = false;
	          $("#CF_PROJECT_ID_SHOW").addClass("readonly");
		  $("#MODEL_CODE_SHOW").removeClass("readonly");
	           $(inputobj1).parent().find("button").attr("disabled",true); 
	          $(inputobj2).parent().find("button").attr("disabled",false); 
	         } 
	         } 
	         	       }
	     }
	    
	    function validate(thisObj){
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
			
			$DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
			$DisInput.attr("disabled", false); 
			validate_code();
			isQuery = true;
			$DisInput.attr("disabled", true);
		}
	    
	    function validate_code(){
             var ipt1 = document.getElementById("MODEL_CODE").value;
             var ipt2 = document.getElementById("forbidden_code").value;
             var ipt4 = document.getElementById("CF_PROJECT_ID").value;
             var ipt5 = $("#paraMap1_CF_TYPE option:selected").val();
             
             if(ipt1 == ipt2){  
             //utilsFp.alert("<dict:lang value="机种与禁用料不能相同" />");
             utilsFp.confirmIcon(3,"","","", "<dict:lang value="机种与禁用料不能相同" />",0,"","");
             }else{
              if(ipt5 == "1"){
               if(ipt4 == ""){
               //utilsFp.alert("<dict:lang value="工单不能为空" />");
               utilsFp.confirmIcon(3,"","","", "<dict:lang value="工单不能为空" />",0,"","");
               }else{
                 if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
                 document.forms.addForm.submit();
               }
             }else if(ipt5 == "2"){
               if(ipt1 == ""){
               //utilsFp.alert("<dict:lang value="机种不能为空" />");
               utilsFp.confirmIcon(3,"","","", "<dict:lang value="机种不能为空" />",0,"","");
               }else{
                 if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
                 document.forms.addForm.submit();
               }
             }else if(ipt5 == "0"){
                 if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
                 document.forms.addForm.submit();
             }
             }
             
             }
	</script>




<style type="text/css">
.x-fieldset {
	border: 1px solid #B5B8C8;
	padding: 10px;
	margin-botton: 10px;
	display: block;
}
</style>
</head>
<body>
	<div class="edit">
		<div class="hd">
			<!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
			<div style="margin-left:10px;"><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0"/><dict:lang value="保存并关闭窗口" /></div>

			<div class="optn">
				<button type="button" onclick="add(this);">
					<i class="ico ico-save"></i>
					<dict:lang value="保存" />
				</button>
				<button type="button" onclick="closeWindow();">
					<i class="ico ico-cancel"></i>
					<dict:lang value="取消" />
				</button>
			</div>

		</div>
		<div class="bd">
			<form id="addForm" name="addForm"
				action="${path}buss/bussModel_addAjaxComm.ms" method="post"
				<bu:formet exeid="%{exeid}" /> target="submitFrame">
				<input type="hidden" name="exeid" value="${exeid}"> <input type="hidden" name="iframeId" value="${iframeId}"> <input
					type="hidden" name="definedMsg" value="${definedMsg}"> <input type="hidden" name="file_type" value="add_file">
					<input type="hidden" name="formId" value="09206fb514ca4b258beb531bc903334b" />
				<s:hidden
					name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}"
					value="%{FUNC_CODE_2}" />
				<s:token />
				<table class="func_table">
					<tr>
						<td width="100%" align="right"></td>
					</tr>
				</table>
				<bu:set name="paraMapObj" value="${dataId}"
					formId="09206fb514ca4b258beb531bc903334b" type="add" />



				<table class="basic-table" id="table1" name="table1">
					<input type="hidden" name="formIds"
						value="09206fb514ca4b258beb531bc903334b" />
					<input type="hidden" name="09206fb514ca4b258beb531bc903334b"
						value="paraMap1@" />
					<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
					<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
					<s:set name="_$viewId" value="'1b616e9d6be444469add832bd9b70807'" />
					<s:set name="_$formId_1" value="'09206fb514ca4b258beb531bc903334b'" />
					<s:set name="_$type" value="'add'" />
					<tr>
						<td class="name"  style="width:97px;"><span class="dot"></span><span><dict:lang
									value="类型" /><span></span> </span></td>
						<td class="dec"><select id="paraMap1_CF_TYPE"
							name="paraMap1@0#CF_TYPE" class=" input isSubmit  dept_select"
							onchange="select();"  style="width:300px;">
								
								<option value="0">
									<dict:lang value="全局" />
								</option>
								<option value="1">
									<dict:lang value="工单" />
								</option>
								<option value="2">
									<dict:lang value="机种" />
								</option>
						</select>
						</td>
					</tr>
					<tr>
						<td class="name"/>
						<span class="dot">*</span>
						<bu:uitn colNo="CF_STATUS"
							formId="09206fb514ca4b258beb531bc903334b" />
						</td>
						<td class="dec"><bu:ui colNo="CF_STATUS"
								formId="09206fb514ca4b258beb531bc903334b" value="%{CF_STATUS}"
								formIndex="1"  style="width:300px;"/></td>
					</tr>
					<tr>
						<td class="name "><span class="dot" id="pi">*</span> <bu:uitn
								colNo="CF_PROJECT_ID" formId="09206fb514ca4b258beb531bc903334b"
								id="CF_PROJECT_ID_T" /></td>
						<td class="dec"><bu:ui colNo="CF_PROJECT_ID"
								formId="09206fb514ca4b258beb531bc903334b"
								value="%{CF_PROJECT_ID}" formIndex="1" id="CF_PROJECT_ID"  style="width:300px;"/></td>
					</tr>
					<tr>
						<td class="name "><span class="dot" id="mc">*</span> <bu:uitn
								colNo="CF_MODEL_CODE" formId="09206fb514ca4b258beb531bc903334b"
								id="CF_MODEL_CODE_T" /></td>
						<td class="dec"><bu:ui colNo="CF_MODEL_CODE"
								formId="09206fb514ca4b258beb531bc903334b"
								value="%{CF_MODEL_CODE}" formIndex="1" id="MODEL_CODE"  style="width:300px;"/></td>
						</td>
					</tr>
					<tr>
						<td class="name" />
						<span class="dot">*</span>
						<bu:uitn colNo="CF_ITEM_CODE"
							formId="09206fb514ca4b258beb531bc903334b" />
						</td>
						<td class="dec"><bu:ui colNo="CF_ITEM_CODE"
								id="forbidden_code" formId="09206fb514ca4b258beb531bc903334b"
								value="%{CF_ITEM_CODE}" formIndex="1"  style="width:300px;"/></td>
					</tr>
					<tr>
						<td class="name" />
						<bu:uitn colNo="CF_ITEM_NAME"
							formId="09206fb514ca4b258beb531bc903334b" />
						</td>
						<td class="dec"><bu:ui id="CF_ITEM_NAME" colNo="CF_ITEM_NAME"
								formId="09206fb514ca4b258beb531bc903334b"
								value="%{CF_ITEM_NAME}" formIndex="1"  style="width:300px;"/></td>
					</tr>
					<tr>
						<td class="name" />
						<bu:uitn colNo="CF_ITEM_DESC"
							formId="09206fb514ca4b258beb531bc903334b" />
						</td>
						<td class="dec"><bu:ui id="CF_ITEM_DESC" colNo="CF_ITEM_DESC"
								formId="09206fb514ca4b258beb531bc903334b"
								value="%{CF_ITEM_DESC}" formIndex="1"  style="width:300px;"/></td>
					</tr>
					<tr>
						<td class="name"/>
						<bu:uitn colNo="CF_MEMO" formId="09206fb514ca4b258beb531bc903334b" />
						</td>
						<td colspan="3" class="dec"><bu:ui colNo="CF_MEMO"
								formId="09206fb514ca4b258beb531bc903334b" value="%{CF_MEMO}"
								formIndex="1"  style="width:300px;height:80px;"/></td>
					</tr>

				</table>
				<bu:jsVal formId="09206fb514ca4b258beb531bc903334b" formIndex="1" />
			</form>
		</div>

	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0"
			height="0"></iframe>
	</div>

	<script type="text/javascript">
	function init(){
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
	select();
</script>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
