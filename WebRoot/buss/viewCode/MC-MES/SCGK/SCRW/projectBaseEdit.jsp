<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
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
	      $("#count").val($("#paraMapObj_PRODUCT_COUNT").val());
	      console.log($("#paraMapObj_PROJECT_FLAG_1").val());//$("#paraMapObj_PROJECT_FLAG_1").val()
	  /*  if("Y"== $("#projectFlag").val() ){
	            
	           $("#paraMapObj_PROJECT_FLAG_1").val("Y");
	            document.getElementById('paraMapObj_PROJECT_FLAG_1').checked = true;
	        //$("#paraMap0_PRODUCT_SN_PREFIX").addClass("_VAL_NULL");
        	  $("#paraMapObj_PRODUCT_SN_PREFIX").removeAttr("disabled");
        	  
              $("#paraMapObj_PRODUCT_SN_PREFIX").attr("class","_VAL_NULL input isSubmit isaddSubmit");
              
              $("#paraMapObj_PRODUCT_CONFIGURE").attr("class"," input isSubmit _VAL_NULL  _VAL_OjbsData dept_select");
                $("#paraMapObj_PRODUCT_CONFIGURE").trigger("chosen:updated");			

	    }else{
	        $("#paraMapObj_PROJECT_FLAG_1").val("N");
	       // document.getElementById('paraMapObj_PROJECT_FLAG_1').checked = true;
	       //$("#paraMap0_PRODUCT_SN_PREFIX").removeClass("_VAL_NULL");
    	  $("#paraMapObj_PRODUCT_SN_PREFIX").attr("disabled","disabled");
    	  
          $("#paraMapObj_PRODUCT_SN_PREFIX").attr("class"," _VAL_NULL  input isSubmit  readonly isaddSubmit");
          
           $("#paraMapObj_PRODUCT_CONFIGURE").attr("disabled","disabled");
          $("#paraMapObj_PRODUCT_CONFIGURE").attr("class","  input isSubmit  _VAL_OjbsData readonly isaddSubmit ");
          
    	  $("#paraMapObj_PRODUCT_CONFIGURE").trigger("chosen:updated");
	    }*/
	    if("Y"== $("#paraMapObj_PROJECT_FLAG_1").val() ){
	            
           $("#paraMapObj_PROJECT_FLAG_1").val("Y");
            document.getElementById('paraMapObj_PROJECT_FLAG_1').checked = true;
        //$("#paraMap0_PRODUCT_SN_PREFIX").addClass("_VAL_NULL");
    	  $("#paraMapObj_PRODUCT_SN_PREFIX").removeAttr("disabled");
    	  
          $("#paraMapObj_PRODUCT_SN_PREFIX").attr("class","_VAL_NULL input isSubmit isaddSubmit");
          
          $("#paraMapObj_PRODUCT_CONFIGURE").attr("class"," input isSubmit _VAL_NULL  _VAL_OjbsData dept_select");
            $("#paraMapObj_PRODUCT_CONFIGURE").trigger("chosen:updated");			

    }else{
        $("#paraMapObj_PROJECT_FLAG_1").val("N");
       // document.getElementById('paraMapObj_PROJECT_FLAG_1').checked = true;
       //$("#paraMap0_PRODUCT_SN_PREFIX").removeClass("_VAL_NULL");
	  $("#paraMapObj_PRODUCT_SN_PREFIX").attr("disabled","disabled");
	  
      $("#paraMapObj_PRODUCT_SN_PREFIX").attr("class","_VAL_NULL  input isSubmit  readonly isaddSubmit");
      
       $("#paraMapObj_PRODUCT_CONFIGURE").attr("disabled","disabled");
      $("#paraMapObj_PRODUCT_CONFIGURE").attr("class","  input isSubmit  _VAL_OjbsData readonly isaddSubmit ");
      
	  $("#paraMapObj_PRODUCT_CONFIGURE").trigger("chosen:updated");
    }
		intIframe();

	});
	
    
	function getProduct(){
	  var checkbox = document.getElementById("paraMapObj_PROJECT_FLAG_1");
	  if(checkbox.checked == true){
	  checkbox.value = "Y";
	  
	  //$("#paraMap0_PRODUCT_SN_PREFIX").addClass("_VAL_NULL");
	  $("#paraMapObj_PRODUCT_SN_PREFIX").removeAttr("disabled");
	  
      $("#paraMapObj_PRODUCT_SN_PREFIX").attr("class","_VAL_NULL input isSubmit isaddSubmit");
      
       $("#paraMapObj_PRODUCT_CONFIGURE").removeAttr("disabled");
	  $("#paraMapObj_PRODUCT_CONFIGURE").attr("class"," input isSubmit  _VAL_OjbsData dept_select");
      $("#paraMapObj_PRODUCT_CONFIGURE").trigger("chosen:updated");
	  }else{
	  checkbox.value = "N";
	  
	  //$("#paraMap0_PRODUCT_SN_PREFIX").removeClass("_VAL_NULL");
	  $("#paraMapObj_PRODUCT_SN_PREFIX").attr("disabled","disabled");
	  $("#paraMapObj_PRODUCT_SN_PREFIX").val("");
      $("#paraMapObj_PRODUCT_SN_PREFIX").attr("class","_VAL_NULL  input isSubmit  readonly isaddSubmit");
      
       $("#paraMapObj_PRODUCT_CONFIGURE").val("");
         $("#paraMapObj_PRODUCT_CONFIGURE").attr("disabled","disabled");
      $("#paraMapObj_PRODUCT_CONFIGURE").attr("class"," input isSubmit  _VAL_OjbsData dept_select readonly ");
      
	  $("#paraMapObj_PRODUCT_CONFIGURE").trigger("chosen:updated");
	  }
	    
	    
	}
	/*
	function checks(){
	  var checkbox = document.getElementById("paraMapObj_PRODUCT_PACK_SEQ_1");
	  if(checkbox.checked == true){
	  checkbox.value = "Y";
	 
	  }else{
	  checkbox.value = "N";
	  }
	}
        */
        function getEndInfo(){
	   // console.log("start:"+start);
	     //console.log("num:"+num);
	     
	   // var endMsg= Number(start.replace(/[^0-9]/ig,""))+Number(num) ;
	   var num = $("#paraMapObj_PRODUCT_COUNT").val(); 
        var start =$("#paraMapObj_PRODUCT_SN_START").val();
	   var endMsg= Number(start)+Number(num) ;
	    
	    if(!isNaN(endMsg)){
	       $("#paraMapObj_PRODUCT_SN_END").val((endMsg-1)); 
	    }
	    
	}
</script>
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include>
    
</head>
<body style="background-color:#fff;overflow:hidden;">
	<DIV class="multilist content-in">
		<div class="edit">
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" <bu:formet exeid="%{exeid}" /> target="submitFrame">
       <div class="hd" style="padding-top: 5px;margin-top:0;background-color: #f6f5f7;padding-bottom: 10px;">
       <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
								<jsp:param name="modelName" value="VIEW_TYPE_11" />
								<jsp:param name="location" value="editForm" />
							</jsp:include>
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
 <div style="margin-left:40px;">
                    
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
			         <button type="button" onclick="editSave(this);"><i class="ico ico-save"></i><dict:lang value="提交" /></button>
        			<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
            
				<div class="js-tab">
					<DIV id="container" style="padding:0 20px;box-sizing: border-box;">
						<DIV class="hd1">
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
					
						
						<DIV class="content1" id="content">
							<DIV id="content1" data-tab="tag1">
								
									<input type="hidden" name="exeid" value="${exeid}">
									 <input	type="hidden" name="definedMsg" value="${definedMsg}">
									 <input type="hidden" name="formId" value="d34c8f48bead40d88c24a153c731de82">
									<input type="hidden" name="iframeId" value="${iframeId}">
								     <input type="hidden"  name="dataId" value="${dataId}">
									<input type="hidden" id="dataId0" name="dataId" value="${param.dataId}">
									<input type="hidden" id="count" name="count" value="">
									<input type="hidden" id="projectFlag" name="projectFlag" value="">
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
											<td class="name" style="width:100px;"/>
											<span class="dot">*</span><bu:uitn colNo="PROJECT_ID" 
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" style="width:225px;" colNo="PROJECT_ID"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="PROJECT_ID"
													formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}"
													 formIndex="0" style="width:200px;"/>
											</bu:td>
											<td class="name" style="width:100px;"/>
											<span class="dot">*</span><bu:uitn colNo="PRODUCT_LINE"
												formId="d34c8f48bead40d88c24a153c731de82" /> 
											</td>
											<bu:td cssClass="dec" style="width:225px;" colNo="PRODUCT_LINE" 
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="PRODUCT_LINE"
													formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}"
													 formIndex="0" style="width:200px;"/>
											</bu:td>
											<td class="name" style="width:100px;"/>
											<bu:uitn colNo="CUST_CODE"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" style="width:205px;" colNo="CUST_CODE"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="CUST_CODE"
													formId="d34c8f48bead40d88c24a153c731de82"
													dataId="${dataId}" formIndex="0" style="width:200px;"/>
											</bu:td>
										</tr>
										<tr>
											
											<td class="name" />
											<span class="dot">*</span><bu:uitn colNo="PRODUCT_MATERIAL"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="PRODUCT_MATERIAL"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="PRODUCT_MATERIAL"
													formId="d34c8f48bead40d88c24a153c731de82"
													dataId="${dataId}" formIndex="0" style="width:200px;"/>
											</bu:td>
											<td class="name" />
											<bu:uitn colNo="PRODUCT_NAME"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="PRODUCT_NAME"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="PRODUCT_NAME"
													formId="d34c8f48bead40d88c24a153c731de82" disabled="disabled"
													dataId="${dataId}" formIndex="0" style="width:200px;"/>
											</bu:td>
											<td class="name" />
											<bu:uitn colNo="PRODUCT_STANDARD"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="PRODUCT_STANDARD"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="PRODUCT_STANDARD"
													formId="d34c8f48bead40d88c24a153c731de82" disabled="disabled"
													dataId="${dataId}" formIndex="0" style="width:200px;"/>
											</bu:td>
										</tr>
										
										<tr>
										
											<td class="name" />
											<bu:uitn colNo="PRODUCT_MATERIAL_VER"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="PRODUCT_MATERIAL_VER"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="PRODUCT_MATERIAL_VER" readonly="readonly" cssClass="readonly"
													formId="d34c8f48bead40d88c24a153c731de82"
													dataId="${dataId}"  formIndex="0" style="width:200px;"/>
											</bu:td>										
										
											<td class="name" />
											<bu:uitn colNo="PROJECT_STATUS"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="PROJECT_STATUS"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="PROJECT_STATUS"
													formId="d34c8f48bead40d88c24a153c731de82"
													dataId="${dataId}"  formIndex="0" style="width:200px;"/>
											</bu:td>
											
											<td class="name" />
											<bu:uitn colNo="PROJECT_TYPE"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="PROJECT_TYPE"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="PROJECT_TYPE"
													formId="d34c8f48bead40d88c24a153c731de82"
													dataId="${dataId}" formIndex="0" style="width:200px;"/>
											</bu:td>

											

										</tr>
										<tr>
											<td class="name" />
											<span class="dot">*</span><bu:uitn colNo="PROJECT_STEP"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="PROJECT_STEP"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="PROJECT_STEP"
													formId="d34c8f48bead40d88c24a153c731de82"
													dataId="${dataId}"  formIndex="0" style="width:200px;"/>
											</bu:td>											

											<td class="name" />
											<span class="dot">*</span><bu:uitn colNo="PRODUCT_COUNT"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="PRODUCT_COUNT"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="PRODUCT_COUNT"
													formId="d34c8f48bead40d88c24a153c731de82"
													dataId="${dataId}" formIndex="0" style="width:200px;"/>
											</bu:td>
											
											<td class="name" />
											<bu:uitn colNo="FAI_NUM"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="FAI_NUM"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="FAI_NUM"
													formId="d34c8f48bead40d88c24a153c731de82"
													dataId="${dataId}" formIndex="0" style="width:200px;"/>
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
													dataId="${dataId}" formIndex="0" style="width:200px;"/>
											</bu:td>
											<td class="name" />
											<bu:uitn colNo="ACTUAL_START_DATE"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="ACTUAL_START_DATE"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="ACTUAL_START_DATE"
													formId="d34c8f48bead40d88c24a153c731de82"
													dataId="${dataId}" formIndex="0" style="width:200px;"/>
											</bu:td>

											<td class="name" />
											<bu:uitn colNo="TPPB_PLAN_DELIVERY_DATE"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="TPPB_PLAN_DELIVERY_DATE"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="TPPB_PLAN_DELIVERY_DATE"
													formId="d34c8f48bead40d88c24a153c731de82"
													dataId="${dataId}" formIndex="0" style="width:200px;"/>
											</bu:td>
										</tr>

										<tr>

											<td class="name" />
											<span class="dot">*</span><bu:uitn colNo="PROLEPSIS_END_DATE"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="PROLEPSIS_END_DATE"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="PROLEPSIS_END_DATE"
													formId="d34c8f48bead40d88c24a153c731de82"
													dataId="${dataId}"  formIndex="0" style="width:200px;"/>
											</bu:td>
											
											<td class="name" />
											<bu:uitn colNo="ACTUAL_END_DATE"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="ACTUAL_END_DATE"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="ACTUAL_END_DATE"
													formId="d34c8f48bead40d88c24a153c731de82"
													dataId="${dataId}" formIndex="0" style="width:200px;"/>
											</bu:td>

											
											<!--
											<td class="name" />
											<bu:uitn colNo="PROJECT_FLAG"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="PROJECT_FLAG"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="PROJECT_FLAG"
													formId="d34c8f48bead40d88c24a153c731de82"
													dataId="${dataId}" formIndex="0" onchange="getProduct()" />
											</bu:td>
											-->
											<td class="name" />
											<bu:uitn colNo="DESTROY_NO"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="DESTROY_NO"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="DESTROY_NO"
													formId="d34c8f48bead40d88c24a153c731de82"
													dataId="${dataId}"  formIndex="0" style="width:200px;"/>
											</bu:td>											
										</tr>
										
										<tr>
                                            <td class="name" /><bu:uitn colNo="PRODUCT_PACK_SEQ" formId="d34c8f48bead40d88c24a153c731de82" style="width:200px;"  /></td>
						                        <bu:td cssClass="dec" colNo="PRODUCT_PACK_SEQ" formId="d34c8f48bead40d88c24a153c731de82" ><bu:ui colNo="PRODUCT_PACK_SEQ" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" formIndex="1"  />
												&nbsp;&nbsp;
												<bu:uitn colNo="PROJECT_FLAG" formId="d34c8f48bead40d88c24a153c731de82" />
												<bu:ui colNo="PROJECT_FLAG" onchange="getProduct()" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" formIndex="1" />
											</bu:td>        
											<td class="name" />
											<span class="dot">*</span><bu:uitn colNo="PRODUCT_CONFIGURE"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="PRODUCT_CONFIGURE"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="PRODUCT_CONFIGURE"
													formId="d34c8f48bead40d88c24a153c731de82"
													dataId="${dataId}"  formIndex="0" style="width:200px;"/>
											</bu:td>											
				
											<td class="name" />
											<span class="dot">*</span><bu:uitn colNo="PRODUCT_SN_PREFIX"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="PRODUCT_SN_PREFIX"
												formId="d34c8f48bead40d88c24a153c731de82">
												<bu:ui colNo="PRODUCT_SN_PREFIX"
													formId="d34c8f48bead40d88c24a153c731de82"
													dataId="${dataId}"  formIndex="0" style="width:200px;"/>
											</bu:td>
											
											
										</tr>
									
									
										<tr>
											<td class="name" />
											<bu:uitn colNo="PM_MEMO"
												formId="d34c8f48bead40d88c24a153c731de82" />
											</td>
											<bu:td cssClass="dec" colNo="PM_MEMO" style="height:80px;"
												formId="d34c8f48bead40d88c24a153c731de82" colspan="5">
												<bu:ui colNo="PM_MEMO"
													formId="d34c8f48bead40d88c24a153c731de82"
													dataId="${dataId}"  formIndex="0" style="width:100%;height:100%"/>
											</bu:td>
											
											
										</tr>
									</table>
									<bu:jsVal formId="d34c8f48bead40d88c24a153c731de82"
										formIndex="0" />
										
								
							</DIV>
							<DIV id="content2" data-tab="tag2">  <%-- <bu:addcp exeid="%{exeid}" />   --%>
									
										
											
<div class="mod" >
		
					<div class="extend-btn" style="float: right;margin-top: -30px;">
						<button type="button"    onclick="newaddRow();"     style="padding:0;" title="<dict:lang value="添加" />">   <i class="ico ico-kl-new-add ico-small"></i>
						</button>
						<button type="button" onclick="_delRowExtend('fbe85506ea9d4a32b0cf78996898c620');"     style="padding:0"   title="<dict:lang value="移除" /> " >   <i class="ico ico-sc-new-add ico-small"></i> 
						</button> 
					</div>

			<div class="mod-bd" >
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"   >
						<div class="datagrid-header" >
							<div class="datagrid-header-inner" id="datagrid-header-innerfbe85506ea9d4a32b0cf78996898c620" >
								<bu:addSub formid="d34c8f48bead40d88c24a153c731de82" formIndex="1"  selfformid="fbe85506ea9d4a32b0cf78996898c620" hidecol=""  viewid="" />
							</div>
						</div>
						<div class="datagrid-body datagrid-div3"   style="height:235px" onscroll="ajaxTableScroll(this,'fbe85506ea9d4a32b0cf78996898c620')">
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
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
<script type="text/javascript">
	function init(){
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
	$(function(){
	    $("#paraMapObj_PRODUCT_MATERIAL_SHOW").attr("disabled","disabled");
	    $("#paraMapObj_PRODUCT_MATERIAL_SHOW").attr("class","input _VAL_NULL isSubmit input readonly ");
	})	
function newaddRow(){
                    var $trs = $("#tbody_fbe85506ea9d4a32b0cf78996898c620 tr");
                    var len = $trs.length;
                    var j=0;
                    if(len>0){
                        var lastTr = $trs.eq(len-1);
 				        j=parseInt($(lastTr).attr("id").split("_")[1])+1;
                    }
                   
 				    var pre="paraMapObj_"+j+"_";
 				    var preName = "paraMap1@"+j+"#"; 
 				    var tempHtml = "<tr id='addTableTr_"+j+"_fbe85506ea9d4a32b0cf78996898c620' onclick=\"_selectExtend(event,this,'')\">"
 				                +"<td style='width:30px;text-align:center' class=''><input type='checkbox' style='width:15px;' name='checkboxfbe85506ea9d4a32b0cf78996898c620' id='checkboxfbe85506ea9d4a32b0cf78996898c620'></td>"
 				                +"<td style='position:relative;' class='dec' width='60px'><input type='text' id='"+pre+"CBD_SEQUENCE' name='"+preName+"CBD_SEQUENCE' value='' class=' _VAL_NULL input isSubmit _VAL_OjbsData'></td>"
 				                +"<td style='position:relative;' class='dec' width='180px'><input type='hidden' id='"+pre+"CBD_ITEM_CODE' name='"+preName+"CBD_ITEM_CODE' value='' class='_VAL_NULL input isSubmit _VAL_OjbsData'>"
				                +"<input editname='"+preName+"CBD_ITEM_CODE' textval='"+preName+"CBD_ITEM_CODESHOW' type='text' id='"+pre+"CBD_ITEM_CODE_SHOW' value='' class='input _VAL_NULL input isSubmit _VAL_OjbsData ' onclick=\"_showCommonTablePage(this,'d54039a23620414c9f79ae8b602d7382','980633287ff9426892f103d4f2fb2c90','料号','','%7B%22WP_WIDTH%22%3A400%2C%22WP_HEIGHT%22%3A450%2C%22WP_FULL_SCREEN%22%3A0%7D','237e8378-48a2-4d20-b7dc-888c85eca99e');\" onfocus='this.blur()' readonly='readonly'>"
                                +"</td>"
                                +"<td style='position:relative;' class='dec' width='150px'><input type='text' id='"+pre+"CBD_ITEM_NAME' name='"+preName+"CBD_ITEM_NAME' value='' class=' input isSubmit ' readonly='' disabled='disabled'></td>"
                                +"<td style='position:relative;' class='dec' width='150px'><input type='text' id='"+pre+"CBD_ITEM_SPEC' name='"+preName+"CBD_ITEM_SPEC' value='' class=' input isSubmit ' readonly='' disabled='disabled'></td>"
                                +"<td style='position:relative;' class='dec' width='60px'><input type='text' id='"+pre+"CBD_UNITS' name='"+preName+"CBD_UNITS' value='' class='_VAL_NULL input isSubmit'></td>"
                                +"<td style='position:relative;' class='dec' width='130px'><input type='text' id='"+pre+"CBD_POINT' name='"+preName+"CBD_POINT' value='' class='_VAL_NULL input isSubmit'></td>"
                                +"<td style='position:relative;' class='dec' width='60px'><input type='text' id='"+pre+"CBD_ITEM_NUM' name='"+preName+"CBD_ITEM_NUM' value='' class=' _VAL_NULL input isSubmit _VAL_OjbsData'></td>"
                                +"<td style='position:relative;' class='dec'><select id='"+pre+"CBD_ITEM_TYPE' name='"+preName+"CBD_ITEM_TYPE' class='_VAL_NULL input isSubmit _VAL_OjbsData ' style='width:100%' ><option value=''>--请选择--</option><option value='0'>物料</option>"
                                +"<option value='1'>PCB</option></select></td>"
                                +"</tr>";
                    $("#tbody_fbe85506ea9d4a32b0cf78996898c620").append(tempHtml); 
                    
}	
function initBomInfo(){

       var dataId = $("#dataId0").val();//id
       //alert(dataId);
	   jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: "${path}buss/bussModel_exeFunc.ms?funcMId=66c764f6c40d4f1aa1c40a5f15e4a96a",
 	    	data:{
 	    	  "dataId":dataId  
 	    	},
 			success: function(data){
 				var pList=data.ajaxList;
 				//console.log(pList);
 				$("#projectFlag").val(pList[0].PROJECT_FLAG);
 				$("#tbody_fbe85506ea9d4a32b0cf78996898c620").empty();
 				for(var i=0;i<pList.length;i++){
 				    var j=i;
 				    var pre="paraMapObj_"+j+"_";
 				    var preName = "paraMap1@"+j+"#"; 
 				    var tempHtml = "<tr id='addTableTr_"+j+"_fbe85506ea9d4a32b0cf78996898c620' onclick=\"_selectExtend(event,this,'')\">"
 				                +"<td style='width:30px;text-align:center' class=''><input type='checkbox' style='width:15px;' name='checkboxfbe85506ea9d4a32b0cf78996898c620' id='checkboxfbe85506ea9d4a32b0cf78996898c620'></td>"
 				                +"<td style='position:relative;' class='dec' width='60px'><input save_mark='0' type='text' id='"+pre+"CBD_SEQUENCE' name='"+preName+"CBD_SEQUENCE' value='' class=' _VAL_NULL input isSubmit _VAL_OjbsData'></td>"
 				                +"<td style='position:relative;' class='dec' width='180px'><input save_mark='0' type='hidden' id='"+pre+"CBD_ITEM_CODE' name='"+preName+"CBD_ITEM_CODE' value='' class='_VAL_NULL input isSubmit _VAL_OjbsData'>"
				                +"<input save_mark='0' editname='"+preName+"CBD_ITEM_CODE' textval='"+preName+"CBD_ITEM_CODESHOW' type='text' id='"+pre+"CBD_ITEM_CODE_SHOW' value='' class='input _VAL_NULL input isSubmit _VAL_OjbsData ' onclick=\"_showCommonTablePage(this,'d54039a23620414c9f79ae8b602d7382','980633287ff9426892f103d4f2fb2c90','料号','','%7B%22WP_WIDTH%22%3A400%2C%22WP_HEIGHT%22%3A450%2C%22WP_FULL_SCREEN%22%3A0%7D','237e8378-48a2-4d20-b7dc-888c85eca99e');\" onfocus='this.blur()' readonly='readonly'>"
                                +"</td>"
                                +"<td style='position:relative;' class='dec' width='150px'><input save_mark='0' type='text' id='"+pre+"CBD_ITEM_NAME' name='"+preName+"CBD_ITEM_NAME' value='' class=' input isSubmit ' readonly='' disabled='disabled'></td>"
                                +"<td style='position:relative;' class='dec' width='150px'><input save_mark='0' type='text' id='"+pre+"CBD_ITEM_SPEC' name='"+preName+"CBD_ITEM_SPEC' value='' class=' input isSubmit ' readonly='' disabled='disabled'></td>"
                                +"<td style='position:relative;' class='dec' width='60px'><input save_mark='0' type='text' id='"+pre+"CBD_UNITS' name='"+preName+"CBD_UNITS' value='' class='_VAL_NULL input isSubmit'></td>"
                                +"<td style='position:relative;' class='dec' width='130px'><input save_mark='0' type='text' id='"+pre+"CBD_POINT' name='"+preName+"CBD_POINT' value='' class='_VAL_NULL input isSubmit'></td>"
                                      +"<td style='position:relative;' class='dec' width='60px'><input save_mark='0' type='text' id='"+pre+"CBD_ITEM_NUM' name='"+preName+"CBD_ITEM_NUM' value='' class=' _VAL_NULL input isSubmit _VAL_OjbsData'></td>"
                                +"<td style='position:relative;' class='dec'><select save_mark='0' id='"+pre+"CBD_ITEM_TYPE' name='"+preName+"CBD_ITEM_TYPE' class='_VAL_NULL input isSubmit _VAL_OjbsData   ' style='width:100%' ><option value=''>--请选择--</option><option value='0'>物料</option>"
                                        +"<option value='1'>PCB</option></select>"
                                +"</tr>";
                    $("#tbody_fbe85506ea9d4a32b0cf78996898c620").append(tempHtml); 
                    $("#"+pre+"CBD_SEQUENCE").val(pList[i].CBD_SEQUENCE);
                    $("#"+pre+"CBD_ITEM_CODE").val(pList[i].CBD_ITEM_CODE);
                    $("#"+pre+"CBD_ITEM_CODE_SHOW").val(pList[i].CBD_ITEM_CODE);
                    $("#"+pre+"CBD_ITEM_NAME").val(pList[i].CI_ITEM_NAME);
                    $("#"+pre+"CBD_ITEM_SPEC").val(pList[i].CI_ITEM_SPEC);
                    $("#"+pre+"CBD_UNITS").val(pList[i].CBD_UNITS);
                    $("#"+pre+"CBD_POINT").val(pList[i].CBD_POINT);
                    $("#"+pre+"CBD_ITEM_NUM").val(pList[i].CBD_ITEM_NUM);
                    $("#"+pre+"CBD_ITEM_TYPE").val(pList[i].CBD_ITEM_TYPE); 
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
	function getOrderBom(key){
	   jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: getBomUrl,
 	    	data:{
 	    	  "dataId":key  
 	    	}, 	    	
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
			$(".dept_select").trigger("chosen:updated");
		}
				
		
		function init(){
			//initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
			initBomInfo();
		}
		function initEditDataLs(){
		
		 var relColVal=$("#paraMapObj_PROJECT_ID").val();
		 getEditRows("fbe85506ea9d4a32b0cf78996898c620","1","d34c8f48bead40d88c24a153c731de82","","97c27cbea7204ba08029f339a015bd8a",relColVal);
		}
		
		function editSave(thisObj){
                        isQuery = false;
                        var seq = "";
                        var itemCode = "";
                        var units = "";
                        var points = "";
                        var number = "";
                        var i = 0;
                        var flag = true;
                        var len = $("#tbody_fbe85506ea9d4a32b0cf78996898c620 tr").length;  
                        $("#tbody_fbe85506ea9d4a32b0cf78996898c620 tr").each(function(){
                        i=parseInt($(this).attr("id").split("_")[1]);
                        seq = $("#paraMapObj_"+i+"_CBD_SEQUENCE").val();
                        itemCode = $("#paraMapObj_"+i+"_CBD_ITEM_CODE").val();
                        units = $("#paraMapObj_"+i+"_CBD_UNITS").val();
                        points = $("#paraMapObj_"+i+"_CBD_POINT").val();
                        number = $("#paraMapObj_"+i+"_CBD_ITEM_NUM").val() ; 
                        console.log("number>>>>");
                        console.log(number);
                                    
                        if(seq==""||itemCode==""||units==""||points==""||number==""){
                        flag = false;
                        switchTag('tag2','content2','${path}buss/bussModel.ms?exeid=b3d19dd778dc4bf6ae463d3c3a396e30');
                        }
             if( ! /^[0-9]+$/.test(seq)){
                flag = false; 
             	_alertValMsg($("#paraMapObj_"+i+"_CBD_SEQUENCE"),"<dict:lang value="该项只能为正整数" />");
             }
            if( ! /^[0-9]+$/.test(number)){
                flag = false; 
             	_alertValMsg($("#paraMapObj_"+i+"_CBD_ITEM_NUM"),"<dict:lang value="该项只能为正整数" />");
             }
              
                        });
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
			if($("#paraMapObj_PROJECT_FLAG_1").val()=="Y"){				
                var stratNum =Number($("#paraMapObj_PRODUCT_SN_START").val());
                var endNum =Number($("#paraMapObj_PRODUCT_SN_END").val());
                    					
                if(!isNaN(stratNum) && !isNaN(endNum)){
                    if(stratNum>=endNum){
                        _alertValMsg($("#paraMapObj_PRODUCT_SN_START"), "<dict:lang value="号段起始不能大于或等于号段终止" />");
        	    	    return;
                    }
                    if(endNum-stratNum>=Number($("#paraMapObj_PRODUCT_COUNT").val())){
                         _alertValMsg($("#paraMapObj_PRODUCT_SN_END"), "<dict:lang value="号段终止不能大于计划数量" />");
        	    	    return;
                    }
                }else{
                    if($("#paraMapObj_PRODUCT_SN_START").val()>=$("#paraMap0_PRODUCT_SN_END").val()){
                        _alertValMsg($("#paraMapObj_PRODUCT_SN_START"), "<dict:lang value="号段起始不能大于或等于号段终止" />");
                	    	return;
                    }  
                }    
            }
            $("#paraMapObj_PROJECT_FLAG_1").attr("disabled","disabled");
			
			if(flag == true){
			$DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
			$DisInput.attr("disabled", false); 
			$("#paraMapObj_PROJECT_ID").attr("disabled", false);
			    var flag = $("#paraMapObj_PROJECT_FLAG_1").val();	
                document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=2079c35d56a84d1c83386ea24a3ed632&flag="+flag+"&paraMapObj.PROJECT_STEP="+$("#paraMapObj_PROJECT_STEP").val(); 
			document.forms.editForm.submit();
			isQuery = true;
			$DisInput.attr("disabled", true);
			 $("#paraMapObj_PROJECT_FLAG_1").removeAttr("disabled");
}
}
$("#paraMapObj_PRODUCT_LINE").on("change",function(){
    var getProductStepUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=e7eb324ad99445d1b5f4e38e85f6cfee";
    var productLine = $("#paraMapObj_PRODUCT_LINE").val();
    console.log("productLine"+productLine);
        $.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url:getProductStepUrl+"&productLine="+productLine,
 	    	success :function(data){
 	    	    var psList = data.ajaxList;
 	    	    console.log(psList[0].CA_PROJECT_STEP);
 	    	    $("#paraMapObj_PROJECT_STEP").val(psList[0].CA_PROJECT_STEP);
 	    	    $("#paraMapObj_PROJECT_STEP_chosen a.chosen-single span").text($("#paraMapObj_PROJECT_STEP option:selected").text());
 	    	    } ,
 	    	error: function(){
 					utilsFp.alert("error");
 	    	    }
 	    	});
   
        });
function backFillItemVal(obj,thisId){

//$("#paraMap1_CBD_ITEM_CODE").val(obj.KEY);
//$("#paraMap1_CBD_ITEM_CODE_SHOW").val(obj.KEY);
$("#"+thisId).val(obj.MKEY);
$("#"+thisId+"_SHOW").val(obj.MKEY);
var iName = thisId.replace("CODE","NAME");
var iSpec = thisId.replace("CODE","SPEC");
$("#"+iName).val(obj.VAL);
$("#"+iSpec).val(obj.ITEMSPEC);
}
</script>
<bu:script viewId="4561c3e0dd7e44dc862b869f75d331ca" />

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.datagrid-body','.datagrid-header-inner');
  })
})(jQuery)</script>

</body>


<%@ include file="/plf/common/pub_end.jsp"%>

