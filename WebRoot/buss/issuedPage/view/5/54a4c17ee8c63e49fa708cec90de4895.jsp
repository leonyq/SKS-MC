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
		var loaded = 1;
	var tab_len = 2;

	var currentTag;
	var tabs = "";
	function switchTag(tag, content,url) {
			if(currentTag == tag){
				return false;
			}
			document.getElementById("content1").style.display="";
			
			for (i = 1; i < (tab_len+1); i++) {
				if ("tag" + i == tag) {
					document.getElementById(tag).getElementsByTagName("a")[0].className = "selectli1";
					document.getElementById(tag).getElementsByTagName("a")[0].getElementsByTagName("span")[0].className = "selectspan1";
				} else {
					document.getElementById("tag" + i).getElementsByTagName("a")[0].className = "";
					document.getElementById("tag" + i).getElementsByTagName("a")[0].getElementsByTagName("span")[0].className = "";
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
</head>
<body>
	<div class="edit">
            <div class="hd">
                <div style="margin-left:10px;"><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0"/><dict:lang value="保存并关闭窗口" /></div>
			    <div class="optn">
			        <button type="button" onclick="saveObj(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd">
						    			<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms" method="post" <bu:formet exeid="%{exeid}" />
										target="submitFrame">
										<input type="hidden" name="exeid" value="${exeid}">
										<input type="hidden" name="definedMsg" value="${definedMsg}">
										<input type="hidden" name="formId" value="${formId}">
										<input type="hidden" name="type" value="add">
										<input type="hidden" name=iframeId value="${iframeId}">
										<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
										<s:token />
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
		<bu:set name="paraMapObj" value="${dataId}" formId="167639778c8f4ee08caad77b61e5081c" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="167639778c8f4ee08caad77b61e5081c" />
	<input type="hidden" name="167639778c8f4ee08caad77b61e5081c" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'c54485c1926748f1a9172a3a2126d444'" />
		<s:set name="_$formId_1" value="'167639778c8f4ee08caad77b61e5081c'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name"  style="width:82px"/><span class="dot">*</span><bu:uitn colNo="CM_SN" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec" style="width:225px" colNo="CM_SN" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_SN" formId="167639778c8f4ee08caad77b61e5081c" value="%{CM_SN}" formIndex="1" style="width:200px"/></bu:td>
			<td class="name" style="width:82px"/><span class="dot">*</span><bu:uitn colNo="CM_NAME" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec" style="width:225px" colNo="CM_NAME" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_NAME" formId="167639778c8f4ee08caad77b61e5081c" value="%{CM_NAME}" formIndex="1" style="width:200px"/></bu:td>
		    	<td class="name" style="width:68px"/><span class="dot">*</span><bu:uitn colNo="CM_PROCESS_FACE" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec" style="width:205px" colNo="CM_PROCESS_FACE" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_PROCESS_FACE" formId="167639778c8f4ee08caad77b61e5081c" value="%{CM_PROCESS_FACE}" formIndex="1" style="width:200px"/></bu:td>
		  
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CM_MODEL_CODE" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec" colNo="CM_MODEL_CODE" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_MODEL_CODE" formId="167639778c8f4ee08caad77b61e5081c" value="%{CM_MODEL_CODE}" formIndex="1" style="width:200px"/></bu:td>
			<td class="name" /><bu:uitn colNo="CM_MODEL_NAME" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec" colNo="CM_MODEL_NAME" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_MODEL_NAME" formId="167639778c8f4ee08caad77b61e5081c" value="%{CM_MODEL_NAME}" formIndex="1" style="width:200px"/></bu:td>
			
			<td class="name" /><bu:uitn colNo="CM_MODEL_STANDARD" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec" colNo="CM_MODEL_STANDARD" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_MODEL_STANDARD" formId="167639778c8f4ee08caad77b61e5081c" value="%{CM_MODEL_STANDARD}" formIndex="1" style="width:200px"/></bu:td>
		</tr>
		
		
		<tr>
			<td class="name" /><bu:uitn colNo="CM_MOUNT_SPEED" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec" colNo="CM_MOUNT_SPEED" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_MOUNT_SPEED" formId="167639778c8f4ee08caad77b61e5081c" value="%{CM_MOUNT_SPEED}" formIndex="1" style="width:200px"/></bu:td>
		    	<td class="name" /><bu:uitn colNo="CM_ITEM_COUNT" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec" colNo="CM_ITEM_COUNT" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_ITEM_COUNT" formId="167639778c8f4ee08caad77b61e5081c" value="%{CM_ITEM_COUNT}" formIndex="1" style="width:200px"/></bu:td>
	        	<td class="name" /><bu:uitn colNo="CM_STAUS" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec" colNo="CM_STAUS" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_STAUS" formId="167639778c8f4ee08caad77b61e5081c" value="%{CM_STAUS}" formIndex="1" style="width:200px"/></bu:td>
	
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CM_MEMO" formId="167639778c8f4ee08caad77b61e5081c" style="width:200px"/></td>
			<bu:td cssClass="dec" colspan="5" colNo="CM_MEMO" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_MEMO" rows="3" formId="167639778c8f4ee08caad77b61e5081c" value="%{CM_MEMO}" formIndex="1" style="width:100%"/></bu:td>
		</tr>
	</table>
	<bu:jsVal formId="167639778c8f4ee08caad77b61e5081c" formIndex="1" />		<div style="padding:1px;"></div>
	
	<div class="js-tab">
	<div id="container">
		<DIV class="hd" style="margin-bottom: 11px;">
			<UL class="tab-list tab">
				<LI id="tag1"><A class=""
					onclick="switchTag('tag1','content1','','');this.blur();"
					href="javascript:void(0);"> <SPAN class="selectspan1"><dict:lang value="料站表明细" /></SPAN>
				</A></LI>
				<LI id="tag2"><A class="selectli1"
					onclick="switchTag('tag2','content2','','');this.blur();"
					href="javascript:void(0);"> <SPAN><dict:lang value="关联线别" /></SPAN> </A></LI>
				

			</UL>
		</DIV>
<DIV class="content1" id="content" >			
<DIV id="content1" data-tab="tag1" style="display:none">
		<div class="mod" >
			<div class="mod-hd"> 
				
					<div class="extend-btn" style="float: right;margin-top:15px;">
						<button type="button"    onclick="showAddPopWin('1abddbae1d704169a987c0af3e06c1df','57dfee4dbc9f40b3bf376573e86795b4');"     style="padding:0;" title="<dict:lang value="添加" />">   <i class="ico ico-kl-new-add ico-small"></i>
						</button>
						<button type="button" onclick="_delRowExtend('1abddbae1d704169a987c0af3e06c1df','');"     style="padding:0"   title="<dict:lang value="移除" /> " >   <i class="ico ico-sc-new-add ico-small"></i> 
						</button> 
						<button type="button" onclick="excelImport('1abddbae1d704169a987c0af3e06c1df','07e5aa1695024ab4816b4538020d83a7');"     style="padding:0"   title="<dict:lang value="Excel导入" /> " >   <i class="ico "></i> 
						</button> 
						<button type="button" onclick="programImport('1abddbae1d704169a987c0af3e06c1df','020edd64c1a648e6b97ad55fccd180b4');"     style="padding:0"   title="<dict:lang value="程式导入" /> " >   <i class="ico "></i> 
						</button>
					</div>
			</div>
			<div class="mod-bd" >
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"   >
						<div class="datagrid-header" >
							<div class="datagrid-header-inner" id="datagrid-header-inner1abddbae1d704169a987c0af3e06c1df">
								<bu:addSub formid="167639778c8f4ee08caad77b61e5081c" formIndex="2"  selfformid="1abddbae1d704169a987c0af3e06c1df" hidecol=""  viewid="" />
							</div>
						</div>
						<div class="datagrid-body datagrid-div3"  style="height:180px" onscroll="ajaxTableScroll(this,'1abddbae1d704169a987c0af3e06c1df')">
							<table class="glxb-table fixedTable" style="width:100%;" id="addTable_1abddbae1d704169a987c0af3e06c1df"  >
								<tbody id="tbody_1abddbae1d704169a987c0af3e06c1df" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>
</DIV>
<DIV id="content2"  data-tab="tag2">
		<div class="mod" >
			<div class="mod-hd"> 
					<div class="extend-btn" style="float: right;margin-top:15px;">
						<button type="button"    onclick="_addRowExtend('99b52ba36c464464aef5216e173ca678','3');"     style="padding:0;" title="<dict:lang value="添加" />">   <i class="ico ico-kl-new-add ico-small"></i>
						</button>
						<button type="button" onclick="_delRowExtend('99b52ba36c464464aef5216e173ca678','');"     style="padding:0"   title="<dict:lang value="移除" /> " >   <i class="ico ico-sc-new-add ico-small"></i> 
						</button> 
					</div>
			</div>
			<div class="mod-bd" >
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"   >
						<div class="datagrid-header" >
							<div class="datagrid-header-inner" id="datagrid-header-inner99b52ba36c464464aef5216e173ca678">
								<bu:addSub formid="167639778c8f4ee08caad77b61e5081c" formIndex="3"  selfformid="99b52ba36c464464aef5216e173ca678" hidecol=""  viewid="" />
							</div>
						</div>
						<div class="datagrid-body datagrid-div3"  style="height:180px">
							<table class="glxb-table fixedTable" style="width:100%" id="addTable_99b52ba36c464464aef5216e173ca678" >
								<tbody id="tbody_99b52ba36c464464aef5216e173ca678" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>
</DIV>
</DIV>
</div>
</div>
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

<script type="text/javascript">
	function init(){

	    document.getElementById("paraMap1_CM_STAUS_1").checked=true;
	    $("#tag2").addClass("current");
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
	
	function showAddPopWin(formId,exeid)
		{
			var piframeId = window.frameElement.id;
			var relcol = $("input[type='hidden'][name='relcol']").val();
			var url;
			var trid = getCurRow();
			var areaSn= checkAreaSn();
		    if(areaSn==''){
		       return;
			}
			url = "${path}buss/bussModel.ms?exeid=" + exeid + "&piframeId=" + piframeId + "&relcol=" + relcol + "&formId=" + formId  + "&areaSn=" + areaSn;
			
			showPopWinFp(url, 680, 350,"","<dict:lang value="新增"/>","add","");
		}
		
		function checkAreaSn(){			
			var areaSn='';
			$("#addTable_99b52ba36c464464aef5216e173ca678").find("tbody tr td").find(":input[name^='paraMap'][name$='CML_AREA_SN']").each(function(i){
			    if(areaSn=='') areaSn+=$(this).val();
			    else{
			      areaSn=areaSn+","+$(this).val();
			    }
			});
			 if(areaSn=='') {
			   utilsFp.confirmIcon(3,"","","", "<dict:lang value="请先关联线别" />",0,"","");
			} 
			return areaSn;
		}
		
		function excelImport(formId,exeid)
		{
		   var areaSn= checkAreaSn();
		   if(areaSn==''){
		      return;
			}
			var url;
			var piframeId = window.frameElement.id;
			url = "${path}buss/bussModel.ms?exeid=" + exeid + "&piframeId=" + piframeId  + "&formId=" + formId  + "&areaSn=" + areaSn;
			
			showPopWinFp(url, 680, 350,"","<dict:lang value="Excel导入"/>","add","");
		}
		
		function programImport(formId,exeid)
		{
		   var areaSn= checkAreaSn();
		   if(areaSn==''){
		      return;
			}
			var url;
			var piframeId = window.frameElement.id;
			url = "${path}buss/bussModel.ms?exeid=" + exeid + "&piframeId=" + piframeId  + "&formId=" + formId  + "&areaSn=" + areaSn;
			
			showPopWinFp(url, 680, 350,"","<dict:lang value="选择程式"/>","add","");
		}
		
		function _delRowExtendConfirm(obj){
		    var tableId=obj.tableId;		    
			$("input[name='checkbox"+tableId+"']:checked").each(function() { // 遍历选中的checkbox
                var trIndex = $(this).parents("tr").index();  
                $("#addTable_"+tableId).find("tr:eq("+trIndex+")").remove();
                
		        
              });
              calItemCount(tableId);
		}
		
		//贴片点数合计
		function calItemCount(formId){
		  var relV;
		  var itemCount=0;
		  //console.log(formId);
		  $("#addTable_"+formId+" tbody tr td").find(":input[name^='paraMap'][name$='CMD_POINT_NUM']").each(function(k){
		      relV=$(this).val();
		      itemCount=Number(itemCount)+Number(relV);
		  });
		  
		  $("#paraMap1_CM_ITEM_COUNT").val(itemCount);
		}
	
        
        function addData(data,formId,rowCount){
			 _addRowExtendFlag(formId,'2',rowCount);
			 
		}
		
		
		function editData(formId,colNo,colNoValue,rowI)
		{
		    
		    var trId;
		    
		    if(rowI!=undefined){
		       trId='addTableTr'+rowI+'_'+formId;
		       
		    }
		    else{
		      trId=$("#addTable_"+formId+" tbody").find("tr:last").attr("id");
		    }
		    
		     $("#"+trId).find(":input[name^='paraMap'][name$='"+colNo+"']").each(function(k){
		        if(colNo=='CMD_ITEM_CODE'){
		           //console.log($(this).attr('id'));
		           var show=$(this).attr('id')+"_SHOW";
		           $("#"+show).val(colNoValue);
		        } 
                $(this).val(colNoValue);
                if($(this)[0].tagName=='SELECT'){
                    $(this).trigger("chosen:updated");                
                }
                           
         });
         
		
		}
		
		
</script>
<bu:script viewId="c54485c1926748f1a9172a3a2126d444" />

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
