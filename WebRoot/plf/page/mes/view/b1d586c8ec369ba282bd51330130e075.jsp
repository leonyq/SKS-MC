<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
	var loaded = 1;
	var tab_len = 2;

	var currentTag;
	var tabs = "";
	function switchTag(tag, content, url) {
		if (currentTag == tag) {
			return false;
		}
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
				/* if ("" != url) {
						currentIframe = document.getElementById("iframe" + i).contentWindow;
						if (typeof (currentIframe.loadedState) == "undefined"
								&& currentIframe.loadedState != false
								&& tabs.indexOf(tag) == -1) {//第一次点击才加载
							//document.getElementById("iframe" + i).src = url;
							tabs += tag + ";";
							if (document.getElementById("iframe" + i).contentWindow.query) {
								document.getElementById("iframe" + i).contentWindow
										.query(this);
							} else {
								document.getElementById("iframe" + i).src = url;
							}
						}
					}  */
				dynIframesize("iframe" + i);
			} else {
				document.getElementById("content" + i).className = "hidecontent";
			}
			document.getElementById("content").className = content;
		}
	}

	var iframehide = "yes";
	function dynIframesize(frameId) {
		if (document.getElementById) {
			dyniframe = document.getElementById(frameId);
			if (dyniframe && !window.opera) {
				dyniframe.style.display = "block";
				if (dyniframe.contentDocument
						&& dyniframe.contentDocument.body.offsetHeight) {
					//dyniframe.height = dyniframe.contentDocument.body.offsetHeight+10;//全显示
					dyniframe.height = getViewportHeight() - 38;
				} else {
					if (dyniframe.Document
							&& dyniframe.Document.body.scrollHeight) {
						//dyniframe.height = dyniframe.Document.body.scrollHeight;//全显示
						dyniframe.height = getViewportHeight() - 38;
					}
				}
			}
		}
		if ((document.all || document.getElementById) && iframehide == "no") {
			var tempobj = document.all ? document.all[iframeids[i]] : document
					.getElementById(iframeids[i]);
			tempobj.style.display = "block";
		}

	}

	function _dynIframesize() {
		var tabIndex = 1;
		if (null != currentTag && "" != currentTag) {
			tabIndex = currentTag.substr(3, currentTag.length);
		}
		dynIframesize("iframe" + tabIndex);
	}

	if (window.addEventListener) {
		window.addEventListener("resize", _dynIframesize, false);
	} else {
		if (window.attachEvent) {
			window.attachEvent("onresize", _dynIframesize);
		} else {
			window.onresize = _dynIframesize;
		}
	}

	function query() {
		if (iframe1.window.query != undefined) {
			iframe1.window.query(this);
		}
		if (iframe2.window.query != undefined) {
			iframe2.window.query(this);
		}

	}

	//初始化iframe
	function intIframe() {
		//switchTag('tag2', 'content2', '');
		switchTag('tag1', 'content1', '');

	}

	$(function() {
		intIframe();

	});
</script>

</head>
<body scroll="no">
	<DIV class="multilist comwrap content-in">
		<div class="edit">
       <div class="hd">
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
			    <div class="optn">
			         <button type="button" onclick="editSave(this);"><i class="ico ico-save"></i><dict:lang value="提交" /></button>
        			<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        			<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>

				<div class="js-tab">
					<DIV id="container" style="padding:0 20px;box-sizing: border-box;">
						<DIV class="hd">
							<UL class="tab-list tab">
								<LI id="tag1"><A class="selectli1"
									onclick="switchTag('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN class="selectspan1"><dict:lang value="工单信息" /></SPAN>
								</A>
								</LI>
								<LI id="tag2"><A class=""
									onclick="switchTag('tag2','content2','${path}buss/bussModel.ms?exeid=b3d19dd778dc4bf6ae463d3c3a396e30');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="工单BOM" /></SPAN> </A>
								</LI>

							</UL>
						</DIV>
					<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" <bu:formet exeid="%{exeid}" /> target="submitFrame">
						
						<DIV class="content1" id="content">
							<DIV id="content1">
								
									<input type="hidden" name="exeid" value="${exeid}">
									 <input	type="hidden" name="definedMsg" value="${definedMsg}">
									 <input type="hidden" name="formId" value="d34c8f48bead40d88c24a153c731de82">
									<input type="hidden" name="iframeId" value="${iframeId}">
								     <input type="hidden" name="dataId" value="${dataId}">
									
									<table class="func_table">
										<tr>
											<td width="100%" align="right"></td>
										</tr>
									</table>
									<bu:set name="paraMapObj" value="${dataId}"
										formId="d34c8f48bead40d88c24a153c731de82" type="edit" />
									<table class="basic-table">
										<input type="hidden" name="formIds"
											value="d34c8f48bead40d88c24a153c731de82" />
										<input type="hidden" name="d34c8f48bead40d88c24a153c731de82"
											value="paraMap0@" />
										<input type="hidden" name="paraMap0@__LEVEL__" value="0" />
										<input type="hidden" name="paraMap0@__DATA_COUNT__" value="1" />
										<s:set name="_$viewId"
											value="'4561c3e0dd7e44dc862b869f75d331ca'" />
										<s:set name="_$formId_1"
											value="'d34c8f48bead40d88c24a153c731de82'" />
										<s:set name="_$type" value="'edit'" />
										<tr>
											<td class="name" style="width:89px;"/>
											<span class="dot">*</span><bu:uitn colNo="PROJECT_ID" 
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="PROJECT_ID"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="PROJECT_ID"
													formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}"
													 formIndex="0" />
											</bu:td>
											<td class="name" style="width:89px;"/>
											<bu:uitn colNo="PRODUCT_LINE"
												formId="d34c8f48bead40d88c24a153c731de82" /> 
											</td>
											<bu:td cssClass="dec" colNo="PRODUCT_LINE" style="width:230px;"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="PRODUCT_LINE"
													formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}"
													 formIndex="0" />
											</bu:td>
										</tr>
										<tr>
											<td class="name" />
											<bu:uitn colNo="CUST_CODE"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="CUST_CODE"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="CUST_CODE"
													formId="d34c8f48bead40d88c24a153c731de82"
													dataId="${dataId}" formIndex="0" />
											</bu:td>
											<td class="name" />
											<span class="dot">*</span><bu:uitn colNo="PRODUCT_MATERIAL"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="PRODUCT_MATERIAL"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="PRODUCT_MATERIAL"
													formId="d34c8f48bead40d88c24a153c731de82"
													dataId="${dataId}" formIndex="0" />
											</bu:td>
										</tr>
										<tr>
											<td class="name" />
											<bu:uitn colNo="PRODUCT_NAME"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="PRODUCT_NAME"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="PRODUCT_NAME"
													formId="d34c8f48bead40d88c24a153c731de82"
													dataId="${dataId}" formIndex="0" />
											</bu:td>
											<td class="name" />
											<bu:uitn colNo="PRODUCT_STANDARD"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="PRODUCT_STANDARD"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="PRODUCT_STANDARD"
													formId="d34c8f48bead40d88c24a153c731de82"
													dataId="${dataId}" formIndex="0" />
											</bu:td>
										</tr>
										<tr>
											<td class="name" />
											<bu:uitn colNo="PROJECT_TYPE"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="PROJECT_TYPE"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="PROJECT_TYPE"
													formId="d34c8f48bead40d88c24a153c731de82"
													dataId="${dataId}" formIndex="0" />
											</bu:td>

											<td class="name" />
											<bu:uitn colNo="PROJECT_STATUS"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="PROJECT_STATUS"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="PROJECT_STATUS"
													formId="d34c8f48bead40d88c24a153c731de82"
													dataId="${dataId}"  formIndex="0" />
											</bu:td>
										</tr>
										<tr>
											<td class="name" />
											<bu:uitn colNo="PROJECT_STEP"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="PROJECT_STEP"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="PROJECT_STEP"
													formId="d34c8f48bead40d88c24a153c731de82"
													dataId="${dataId}"  formIndex="0" />
											</bu:td>

											<td class="name" />
											<span class="dot">*</span><bu:uitn colNo="PRODUCT_COUNT"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="PRODUCT_COUNT"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="PRODUCT_COUNT"
													formId="d34c8f48bead40d88c24a153c731de82"
													dataId="${dataId}" formIndex="0" />
											</bu:td>
										</tr>
										<tr>
											<td class="name" />
											<span class="dot">*</span><bu:uitn colNo="PROLEPSIS_START_DATE"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="PROLEPSIS_START_DATE"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="PROLEPSIS_START_DATE"
													formId="d34c8f48bead40d88c24a153c731de82"
													dataId="${dataId}" formIndex="0" />
											</bu:td>

											<td class="name" />
											<span class="dot">*</span><bu:uitn colNo="PROLEPSIS_END_DATE"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="PROLEPSIS_END_DATE"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="PROLEPSIS_END_DATE"
													formId="d34c8f48bead40d88c24a153c731de82"
													dataId="${dataId}"  formIndex="0" />
											</bu:td>
										</tr>
										<tr>
											<td class="name" />
											<bu:uitn colNo="ACTUAL_START_DATE"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="ACTUAL_START_DATE"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="ACTUAL_START_DATE"
													formId="d34c8f48bead40d88c24a153c731de82"
													dataId="${dataId}" formIndex="0" />
											</bu:td>

											<td class="name" />
											<bu:uitn colNo="ACTUAL_END_DATE"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="ACTUAL_END_DATE"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="ACTUAL_END_DATE"
													formId="d34c8f48bead40d88c24a153c731de82"
													dataId="${dataId}" formIndex="0" />
											</bu:td>
										</tr>

										<tr>
											<td class="name" />
											<bu:uitn colNo="TPPB_PLAN_DELIVERY_DATE"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="TPPB_PLAN_DELIVERY_DATE"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="TPPB_PLAN_DELIVERY_DATE"
													formId="d34c8f48bead40d88c24a153c731de82"
													dataId="${dataId}" formIndex="0" />
											</bu:td>
											<td class="name" />
											<bu:uitn colNo="DESTROY_NO"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="DESTROY_NO"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="DESTROY_NO"
													formId="d34c8f48bead40d88c24a153c731de82"
													dataId="${dataId}"  formIndex="0" />
											</bu:td>
										</tr>
										<tr>
											<td class="name" />
											<bu:uitn colNo="PM_MEMO"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="PM_MEMO" style="height:80px;"
												formId="d34c8f48bead40d88c24a153c731de82" colspan="3">
												<bu:ui colNo="PM_MEMO"
													formId="d34c8f48bead40d88c24a153c731de82"
													dataId="${dataId}"  formIndex="0" style="width:100%;height:100%"/>
											</bu:td>
										</tr>
									</table>
									<bu:jsVal formId="d34c8f48bead40d88c24a153c731de82"
										formIndex="0" />
										
								
							</DIV>
							<DIV id="content2">  <%-- <bu:addcp exeid="%{exeid}" />   --%>
									
										
											
<div class="mod" >
			<div class="mod-hd"> 
					<div class="extend-btn" style="float: right;margin-top:15px;">
						<button type="button"    onclick="_addRowExtend('fbe85506ea9d4a32b0cf78996898c620','1');"     style="padding:0;" title="<dict:lang value="添加" />">   <i class="ico ico-kl-new-add ico-small"></i>
						</button>
						<button type="button" onclick="_delRowExtend('fbe85506ea9d4a32b0cf78996898c620');"     style="padding:0"   title="<dict:lang value="移除" /> " >   <i class="ico ico-sc-new-add ico-small"></i> 
						</button> 
					</div>
			</div>
			<div class="mod-bd" >
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"   >
						<div class="datagrid-header" >
							<div class="datagrid-header-inner" id="datagrid-header-innerfbe85506ea9d4a32b0cf78996898c620" >
								<bu:addSub formid="d34c8f48bead40d88c24a153c731de82" formIndex="1"  selfformid="fbe85506ea9d4a32b0cf78996898c620" hidecol=""  viewid="" />
							</div>
						</div>
						<div class="datagrid-body datagrid-div3"   style="height:320px" onscroll="ajaxTableScroll(this,'fbe85506ea9d4a32b0cf78996898c620')">
							<table class="glxb-table fixedTable" style="width:100%"  id="addTable_fbe85506ea9d4a32b0cf78996898c620" >
								<tbody id="tbody_fbe85506ea9d4a32b0cf78996898c620" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>		
									
							</DIV>

						</DIV>
						</form>
					</DIV>
					<%-- <bu:submit viewId="81c065ad475149b7b0c654189d089b71" />
					<bu:script viewId="81c065ad475149b7b0c654189d089b71" /> --%>
				</div>
		</div>
	</DIV>
<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

<script type="text/javascript">
	function init(){
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
		
		
	function getOrderBom(key){
	   jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: getBomUrl+"&dataId="+key,
 			success: function(data){
 				var pList=data.ajaxList;
 				//alert(utilsFp.jsonToString(pList));
 				
 				for(var i=0;i<pList.length;i++){
 				    if(i==0){
 				     	$("#addTable_fbe85506ea9d4a32b0cf78996898c620 tbody tr").html('');
 				        curRowSeq=1;			    
 				    }
 				 	_addRowExtend('fbe85506ea9d4a32b0cf78996898c620','1');
 				    var j=i+1;
 				    var pre="#paraMap"+j+"_";
 				    $(pre+"CBD_SEQUENCE").val(pList[i].CBD_ITEM_SECTION);
 				    $(pre+"CBD_ITEM_CODE").val(pList[i].CBD_ITEM_CODE);
 				    $(pre+"CBD_ITEM_CODE_SHOW").val(pList[i].CBD_ITEM_CODE);
 				    $(pre+"CBD_ITEM_NAME").val(pList[i].CI_ITEM_NAME);
 				    $(pre+"CBD_ITEM_SPEC").val(pList[i].CI_ITEM_SPEC);
 				    $(pre+"CBD_UNITS").val(pList[i].CBD_UNITS);
 				    $(pre+"CBD_POINT").val(pList[i].CBD_POINT);
 				    $(pre+"CBD_ITEM_NUM").val(pList[i].CBD_ITEM_NUM);
 				    $(pre+"CBD_ITEM_TYPE").val(pList[i].CBD_ITEM_TYPE);
 				}
 				
 			},
 			error: function(XMLHttpRequest, textStatus, errorThrown){
 				util.closeLoading();
 				var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
 				if (null != sessionstatus && sessionstatus == "noAuthority") {
 				}else{
 					utilsFp.alert("error:"+errorThrown);
 				}
 		   }
 		});
	}
	
	var parentWindow;
			$(function(){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
			});
		var isQuery = false;

		//重置	
		function resetForm(){
			$("#editForm")[0].reset();
		}
				
		
		function init(){
			initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
			
		}
		function initEditDataLs(){
		
		 var relColVal=$("#paraMapObj_PROJECT_ID").val();
		 getEditRows("fbe85506ea9d4a32b0cf78996898c620","1","d34c8f48bead40d88c24a153c731de82","","97c27cbea7204ba08029f339a015bd8a",relColVal);
		}
</script>
<bu:script viewId="4561c3e0dd7e44dc862b869f75d331ca" />

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	

</body>


<%@ include file="/plf/common/pub_end.jsp"%>
