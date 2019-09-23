<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%--业务处理类关联的控件代码：0a54d982b72e460982f9a86228466b0e--%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="新增" />
	</title>
	<style>
		
		td .state0{
			width: 50px;
   			height: 20px;
    			display: inline-block;
    			background-color: red;
    			border-radius: 5px;
    			color: #fff;
		}
		td .state1{
			width: 50px;
   			height: 20px;
    			display: inline-block;
    			background-color: green;
    			border-radius: 5px;
    			color: #fff;
		}
	</style>
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
		//document.getElementById("content3").style.display="";
		//document.getElementById("content4").style.display="";
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
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
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
	<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
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
			    	
			    	<button type="button" onclick="productAddError();"><i class="ico ico-kl"></i><dict:lang value="添加不良" /></button>
			    	<button type="button" onclick="productDelError();"><i class="ico ico-sc"></i><dict:lang value="删除不良" /></button>
			        <button type="button" onclick="completeRepair();" id="completeRepairId"><i class="ico ico-save"></i><dict:lang value="完成维修" /></button>
			    </div>

			</div>
			<div class="bd" style="height:550px;">

				<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="0ab26fe960da4b8e824ba7b136743db9" type="add" />
<div class="mod">
<div class="mod-hd">		
  <h3 class="tit"><dict:lang value="基本信息" /></h3>	
  </div>
<div class="mod-hd" style="height:70px;border-bottom: none;">
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="0ab26fe960da4b8e824ba7b136743db9" />
	<input type="hidden" name="0ab26fe960da4b8e824ba7b136743db9" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" id="paraMap1_WT_PROJECT_ID" name="paraMap1@0#WT_PROJECT_ID" />
		<input type="hidden" id="completeRepairFlag" name="0" />
		<s:set name="_$viewId" value="'b0e4480b4b0d4da884da2b9e2f1499e0'" />
		<s:set name="_$formId_1" value="'0ab26fe960da4b8e824ba7b136743db9'" />
		<s:set name="_$type" value="'add'" />
  	<tr><!--车间，SN 制令单-->
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="DR_REPAIR_STATION" formId="0ab26fe960da4b8e824ba7b136743db9" /></td>
			<bu:td cssClass="dec-self" colNo="DR_REPAIR_STATION" formId="0ab26fe960da4b8e824ba7b136743db9" ><bu:ui colNo="DR_REPAIR_STATION" formId="0ab26fe960da4b8e824ba7b136743db9" value="%{DR_REPAIR_STATION}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="DR_SN" formId="0ab26fe960da4b8e824ba7b136743db9" /></td><%-- --%> 
			<bu:td cssClass="dec-self" colNo="DR_SN" formId="0ab26fe960da4b8e824ba7b136743db9" ><bu:ui colNo="DR_SN" onchange="changer(this)" formId="0ab26fe960da4b8e824ba7b136743db9" value="%{DR_SN}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
					<td class="name-six" /><bu:uitn colNo="DR_MO_NUMBER" formId="0ab26fe960da4b8e824ba7b136743db9" /></td>
			<bu:td cssClass="dec-self" colNo="DR_MO_NUMBER" formId="0ab26fe960da4b8e824ba7b136743db9" ><bu:ui colNo="DR_MO_NUMBER" formId="0ab26fe960da4b8e824ba7b136743db9" value="%{DR_MO_NUMBER}" formIndex="1" /></bu:td>
		
		</tr>
		<tr><!--机种信息-->
			<td class="name-six" /><bu:uitn colNo="DR_MODEL_CODE" formId="0ab26fe960da4b8e824ba7b136743db9" /></td>
			<bu:td cssClass="dec-self" colNo="DR_MODEL_CODE" formId="0ab26fe960da4b8e824ba7b136743db9" ><bu:ui colNo="DR_MODEL_CODE" formId="0ab26fe960da4b8e824ba7b136743db9" value="%{DR_MODEL_CODE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="DR_MODEL_NAME" formId="0ab26fe960da4b8e824ba7b136743db9" /></td>
			<bu:td cssClass="dec-self" colNo="DR_MODEL_NAME" formId="0ab26fe960da4b8e824ba7b136743db9" ><bu:ui colNo="DR_MODEL_NAME" formId="0ab26fe960da4b8e824ba7b136743db9" value="%{DR_MODEL_NAME}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" />规格</td>
			<bu:td cssClass="dec-self" colNo="DR_MODEL_STANDARD" formId="0ab26fe960da4b8e824ba7b136743db9" ><bu:ui colNo="DR_MODEL_STANDARD" formId="0ab26fe960da4b8e824ba7b136743db9" value="%{DR_MODEL_STANDARD}" formIndex="1" /></bu:td>
		
		</tr>
	</table>
</div>
<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
<div class="js-tab">
					<DIV id="container" style="padding:0 2px;box-sizing: border-box;">
						<DIV class="hd1">
							<UL class="tab-list tab">
								
								<LI id="tag1"><A class=""
									onclick="switchTag('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="不良信息" /></SPAN> </A>
								</LI>
							<%--	<LI id="tag2"><A class=""
									onclick="switchTag('tag2','content2','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="不良明细" /></SPAN> </A>
								</LI>
							--%>	
							</UL>
						</DIV>
			<DIV class="content1" id="content" style="margin-top: 15px;">
			<DIV id="content1" style="margin-top:4px;" data-tab="tag1">
  <div class="panel datagrid datagrid-div1" >
					<div class="datagrid-div2 datagrid-div6 datagrid-view" 
						id="datagrid-view" style="OVERFLOW: HIDDEN;" >
						<div class="datagrid-header">
							<div class="datagrid-header-inner head" id="datagrid-header-inner1"
								>
									<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
											<td class="datagrid-cell" style="width:30px;"></td>
											<td class="datagrid-cell" style="width:30px;"><input
												type="checkbox" id="allSelect" name="allSelect" />
											</td>
											<td class="datagrid-cell" style="width:100px;"><dict:lang
													value="不良代码" />
											</td>
											<td class="datagrid-cell" style="width:100px;"><dict:lang
													value="不良现象" />
											</td>
											<td class="datagrid-cell" style="width:100px;"><dict:lang
													value="不良点位" />
											</td>
										
											<td class="datagrid-cell" style="width:100px;"><dict:lang
													value="工作中心" />
											</td>
											<td class="datagrid-cell" style="width:130px;"><dict:lang
													value="工作中心名称" />
											</td>
											<td class="datagrid-cell" style="width:90px;"><dict:lang
													value="状态" />
											</td>
											<td class="datagrid-cell" style="width:130px;"><dict:lang
													value="维修时间" />
											</td>
											
											<td class="datagrid-cell" style="width:130px;"><dict:lang value="测试员" />
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>


						<div class="datagrid-body datagrid-div3 scroll" id="datagrid-body"
							style="height:90px;"  onscroll="ajaxTableScroll(this,'1')">
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="tbody_1">
									
								</tbody>
							</table>
						</div>

					</div>
				</div>



<div class="mod-hd">		
  <h3 class="tit"><dict:lang value="维修信息" /></h3>	
  </div>
<div class="mod-hd" style="height:170px;border-bottom: none;">
	<table class="basic-table" >	
	<input type="hidden" id="errorArr" name="errorArr" value="" />
		<tr>
		    <td class="name" style="width:96px;"/><span class="dot">*</span><bu:uitn colNo="DR_REASON_CODE" formId="0ab26fe960da4b8e824ba7b136743db9" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="DR_REASON_CODE" formId="0ab26fe960da4b8e824ba7b136743db9" ><bu:ui colNo="DR_REASON_CODE" formId="0ab26fe960da4b8e824ba7b136743db9" value="%{DR_REASON_CODE}" formIndex="2" /></bu:td>
		
			<td class="name" style="width:96px;" /><bu:uitn colNo="DR_REPAIR_DESC" formId="0ab26fe960da4b8e824ba7b136743db9" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="DR_REPAIR_DESC" formId="0ab26fe960da4b8e824ba7b136743db9" ><bu:ui colNo="DR_REPAIR_DESC" formId="0ab26fe960da4b8e824ba7b136743db9" value="%{DR_REPAIR_DESC}" formIndex="2" /></bu:td>
		
			<td class="name" style="width:84px;"/><span class="dot">*</span><bu:uitn colNo="DR_REPAIR_METHOD" formId="0ab26fe960da4b8e824ba7b136743db9" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="DR_REPAIR_METHOD" formId="0ab26fe960da4b8e824ba7b136743db9" ><bu:ui colNo="DR_REPAIR_METHOD" formId="0ab26fe960da4b8e824ba7b136743db9" value="%{DR_REPAIR_METHOD}" formIndex="2" /></bu:td>
		
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="DR_ERROR_ITEM" formId="0ab26fe960da4b8e824ba7b136743db9" /></td>
			<bu:td cssClass="dec" colNo="DR_ERROR_ITEM" formId="0ab26fe960da4b8e824ba7b136743db9" ><bu:ui colNo="DR_ERROR_ITEM" formId="0ab26fe960da4b8e824ba7b136743db9" value="%{WT_MODEL_CODE}" formIndex="2" /></bu:td>
		    <td class="name" ><dict:lang value="物料名称" /></td>
			<td class="dec" ><input type="text" class=" input isSubmit " id="DR_ITEM_NAME" name="DR_ITEM_NAME" disabled="disabled"/></td>
		
			<td class="name" ><dict:lang value="规格" /></td>
			<td class="dec"><input type="text" class=" input isSubmit " id="DR_ITEM_SPEC" name="DR_ITEM_SPEC" disabled="disabled" /></td>
		</tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="DR_MEMO" formId="0ab26fe960da4b8e824ba7b136743db9" /></td>
			<bu:td cssClass="dec" colspan="5" colNo="DR_MEMO" formId="0ab26fe960da4b8e824ba7b136743db9" ><bu:ui colNo="DR_MEMO" formId="0ab26fe960da4b8e824ba7b136743db9" value="%{DR_MEMO}" rows="3" style="height:50px;width:100%;" formIndex="2" /></bu:td>

		</tr>
		<tr>
		<td colspan="6" align="center">
			<div class="optn" style="position: static;">
		    	<button type="button" onclick="addRepair(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			<button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
		   	</div>
		</td>
		</tr>
	</table>
</div>
</DIV>
        	<DIV id="content2" style="display:none" data-tab="tag2">
        	<div class="block1" style="float:left;width:60%;">
        	    <div class="panel datagrid datagrid-div1" >
					<div class="datagrid-div2 datagrid-div6 datagrid-view"
						id="datagrid-view" style="">
						<div class="datagrid-header">
							<div class="datagrid-header-inner head2" id="datagrid-header-inner2"
								style="width:100%;">
								<table id="datagrid-htable2" class="datagrid-htable fixedTable" style="min-width:550px;">

									<tbody>
										<tr class="datagrid-header-row datagrid-title-ajax">
											<td class="datagrid-cell" style="width:30px;"></td>
											<td class="datagrid-cell" style="width:30px;"><input
												type="checkbox" id="allSelect2" name="allSelect" />
											</td>
											<td class="datagrid-cell" style="width:100px;"><dict:lang
													value="不良代码" />
											</td>
											<td class="datagrid-cell" style="width:100px;"><dict:lang
													value="不良现象" />
											</td>
											<td class="datagrid-cell" style="width:70px;"><dict:lang
													value="不良点位" />
											</td>
											<td class="datagrid-cell" style="width:130px;"><dict:lang
													value="测试时间" />
											</td>
											
											<td class="datagrid-cell"><dict:lang value="测试员" />
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>


						<div class="datagrid-body datagrid-div3 scroll2" id="datagrid-body"
							style="height:130px;">
							<table class="dlist-table table-line" id="errorTable2" style="min-width:550px;table-layout:fixed;">
								<tbody id＝"tbody_2">
									
								</tbody>
							</table>
						</div>

					</div>
				</div>
			</div>
			<div class="block2" style="float:right;width:38%;">
        	    <div class="panel datagrid datagrid-div1" >
					<div class="datagrid-div2 datagrid-div6 datagrid-view"
						id="datagrid-view" style="">
						<div class="datagrid-header">
							<div class="datagrid-header-inner head3" id="datagrid-header-inner3"
								style="width:100%;">
								<table id="datagrid-htable3" class="datagrid-htable fixedTable" style="min-width:220px;">

									<tbody>
										<tr class="datagrid-header-row datagrid-title-ajax">
											<td class="datagrid-cell" style="width:30px;"></td>
											<td class="datagrid-cell" style="width:30px;"><input
												type="checkbox" id="allSelect3" name="allSelect" />
											</td>
											<td class="datagrid-cell" style="width:140px;"><dict:lang
													value="维修方法" />
											</td>
											<td class="datagrid-cell"><dict:lang
													value="维修次数" />
											</td>
											
										</tr>
									</tbody>
								</table>
							</div>
						</div>


						<div class="datagrid-body datagrid-div3 scroll3" id="datagrid-body"
							style="height:130px;">
							<table class="dlist-table table-line" id="errorTable3" style="width:220px;table-layout:fixed;">
								<tbody id＝"tbody_3">
									
								</tbody>
							</table>
						</div>

					</div>
				</div>
			</div>
        	</DIV>
        
        </DIV>
	        </DIV>
</div>
			<bu:jsVal formId="0ab26fe960da4b8e824ba7b136743db9" formIndex="1" />
									</form>
			</div>
			
			<!-- addFCWT begin -->
					<div class="dialog dialog-s1" id="addFCWT"
											style="display:none;z-index:1030;margin-left:0px;left:200px;top:32px;width:390px;height:130px;">
											<div class="dialog-hd">
												<h3 class="tit">
													<dict:lang value="选择回流工序" />
												</h3>
											</div>
						<a class="dialog-close" href="javascript:void(0);"	onclick="hideDiv('addFCWT','back');"></a>
							<div class="dialog-bd" style="width:100%;height:200px;">
									<br />
									<div class="optn" style="margin-top:46px;">
									
			        				<button type="button" onclick="completeRepair('nextGroup');"><i class="ico ico-save"></i>保存</button>
			        				<button type="button" onclick="hideDiv('addFCWT','back');"><i class="ico ico-cancel"></i>取消</button>
			    					</div>
			    					<div>
							 <table class="basic-table" style="margin-top:15px;background-color: white;">
								<tr>
									<td style="width: 27%;text-align: right;" class="name"><dict:lang value="回流工序" /></td>
									<td class="dec">
										<select id="nextGroup" name="nextGroup" class="input isSubmit _VAL_OjbsData dept_select" >
	                						
										</select>
									</td>
								</tr>
								
								
							 </table>
							 </div>
						</div>
					</div>
					<div class="dialog-mask" id="back" style="z-index:1029"></div>
		
	</div>
	
	

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

<script type="text/javascript">
var parentWindow;
    $(function(){
      if(top.$("#"+window.frameElement.name) != null && top.$("#"+window.frameElement.name).length > 0 && 
          top.$("#"+window.frameElement.name)[0].contentWindow != undefined){
         parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
          
      }
      
      //setPopScroll('.bd');
      
    });
	function init(){
	    $("#tag1").addClass("current");
		$("#allSelect").click(function(){
    			if($("#allSelect").attr("checked") == "checked"){
        			$("input[name='isSelect1']").attr("checked","checked");
    			}else{
        			$("input[name='isSelect1']").removeAttr("checked","checked");
    			}
			});
		
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
	
	function hideDiv(showId,backId){
	  $("#"+showId+",#"+backId).hide();
	}
	
	//添加不良
	var check_pm_mo_numeber = true;//是否制令单验证
	//验证结果
	var exsis_index=1;
	function productAddError() {
				var sn = $("#paraMap1_DR_SN").val();
				var wta = $("#paraMap1_DR_REPAIR_STATION").val();
				var DR_MO_NUMBER = $("#paraMap1_DR_MO_NUMBER").val();//paraMap1_DR_MO_NUMBER
				var DR_MODEL_CODE = $("#paraMap1_DR_MODEL_CODE").val();
				var dataAuth = $("#deptLs_data_auth").val();
				if(sn==null||sn==''){
				utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择产品SN" />",0,"260","");
		        return false;
				}
				if(check_pm_mo_numeber&&""!=DR_MO_NUMBER){
			//	console.log(checkPmNo(DR_MO_NUMBER)); 返回结果为undefind
		        	checkPmNo(DR_MO_NUMBER);
		        	return;
		        
				}
				var piframeId = window.frameElement.id;
				
				var url = "${path}buss/bussModel.ms?exeid=4364b185595b40b0a38dca3a8e96a799&weSn="+ sn+"&DR_MODEL_CODE="+DR_MODEL_CODE+"&piframeId="+piframeId+"&DR_REPAIR_STATION="+wta+"&DR_MO_NUMBER="+DR_MO_NUMBER+"&dataAuth="+dataAuth;
				//console.log(url);
                //弹窗方法
				showPopWinFp(url, 480, 191, "", "添加不良",
						"add", "");//显示自定义添加不良窗口
	}
 
	//验证制令单
	function checkPmNo(obj){
	     $.ajax({
		type: "POST",
	    dataType: "json",
	    
	    url: "buss/bussModel_exeFunc.ms?funcMId=0a54d982b72e460982f9a86228466b0e&model=checkMoNumber",
	    data: {'DR_MO_NUMBER':obj},
		success: function(data){
		       //console.log(data);
		        var sn = $("#paraMap1_DR_SN").val();
				var wta = $("#paraMap1_DR_REPAIR_STATION").val();
				var DR_MO_NUMBER = $("#paraMap1_DR_MO_NUMBER").val();//paraMap1_DR_MO_NUMBER
				var DR_MODEL_CODE = $("#paraMap1_DR_MODEL_CODE").val();
				var dataAuth = $("#deptLs_data_auth").val();
		  if(data.ajaxString!= null && data.ajaxString != ""){
			 utilsFp.confirmIcon(3,"","","", data.ajaxString,0,"260","");	
			 return;  
		   }
		   //console.log(data.ajaxMap.check);
        	exsis_index = data.ajaxMap.check; //获取验证信息
		   	//console.log("验证字段"+exsis_index);
				   if(1!=exsis_index){
				       _alertValMsg($("#paraMap1_DR_MO_NUMBER"),"<dict:lang value="制令单号不存在" />");
				       return;
				   }
	  			var piframeId = window.frameElement.id;
				var url = "${path}buss/bussModel.ms?exeid=4364b185595b40b0a38dca3a8e96a799&weSn="+ sn+"&DR_MODEL_CODE="+DR_MODEL_CODE+"&piframeId="+piframeId+"&DR_REPAIR_STATION="+wta+"&DR_MO_NUMBER="+DR_MO_NUMBER+"&dataAuth="+dataAuth;
				//console.log(url);
                //弹窗方法
				showPopWinFp(url, 457, 171, "", "添加不良",
						"add", "");//显示自定义添加不良窗口
		    //console.log("验证信息:"+data.ajaxMap.check);
        	return data.ajaxMap.check;//返回验证信息 无法返回
		},
		error:function(data){
		     utilsFp.confirmIcon(3,"","","", data,0,"260","");
		}
		});    
	    
	}
	
	function productDelError() {//删除预处理，先获得删除id 封装在ids中
	     var selCount=0;
	     var ids="";
		  $("input[name='isSelect1']:checked").each(function(i) {
		        selCount++;
				var seqs = $(this).val();
				if(ids=='')
				ids=$("#ID"+seqs).val();
				else ids=ids+';'+$("#ID"+seqs).val();
					
			});
		  if(selCount==0){
             utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少选择一条记录" />",0,"260","");
		     return false;
		  }
		  var obj = new Object();
		  obj.ids = ids;

		  utilsFp.confirmIcon(1,"","productDelErrorConfirm",obj, "<dict:lang value="是否确认删除" />?","1","260","155");//弹出选择/执行函数窗
	}
	
      //删除
	function productDelErrorConfirm(obj){
	
	 /*  document.forms.addForm.action = "buss/bussModel_exeFunc.ms?FUNC_CODE=F5320&funcMId=a65b93b5ddf04b16b40f59b2fc2019b0&type=del";
      document.forms.addForm.submit(); */
	  $.ajax({
		type: "POST",
	    dataType: "json",
	    url: "buss/bussModel_exeFunc.ms?funcMId=0a54d982b72e460982f9a86228466b0e&model=del",
	    data: {'ids':obj.ids},
		success: function(data){
		       //console.log(data);
		  if(data.ajaxMap!= null){
		     msgPop(data.ajaxMap.alertMsg,'',data.ajaxMap.title,data.ajaxMap.width,data.ajaxMap.height,data.ajaxMap.time);
		  }
		  else if(data.ajaxString!= null && data.ajaxString != ""){
			 utilsFp.confirmIcon(3,"","","", data.ajaxString,0,"260","");	
			 return;  
		   }
		  var sn=$("#paraMap1_DR_SN").val();
		  queryErrorList(sn);
		},
		error:function(data){
		     utilsFp.confirmIcon(3,"","","", data,0,"260","");
		}
		});
	}
	
	/* 报废 */
	function productScarp() {
				var sn = $("#paraMap1_DR_SN").val();
				var dataAuth = $("#deptLs_data_auth").val();
				if(sn==null||sn==''){
				utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择产品SN" />",0,"260","");
		        return false;
				}
				var piframeId = window.frameElement.id;
				var MO_NUMBER = $("#paraMap1_WT_MO_NUMBER").val();
				var PROJECT_ID = $("#paraMap1_WT_PROJECT_ID").val();
				var MODEL_CODE=$("#paraMap1_WT_MODEL_CODE").val();
				var MODEL_NAME=$("#MODEL_NAME").val();
				var MODEL_SPEC=$("#MODEL_SPEC").val();
				var WORK_STATION = $("#paraMap1_WT_WORK_STATION").val();
				var url = "${path}buss/bussModel.ms?exeid=df1a6b8143be4549874ab47ef01d691c&weSn="+ sn+"&piframeId="+piframeId+
				"&MO_NUMBER="+MO_NUMBER+"&MODEL_NAME="+MODEL_NAME+"&MODEL_SPEC="+MODEL_SPEC+"&MODEL_CODE="+MODEL_CODE+"&PROJECT_ID="+PROJECT_ID+"&WORK_STATION="+WORK_STATION+"&dataAuth="+dataAuth;
						

				showPopWinFp(url, 457, 430, "", "<dict:lang value="报废"/>",
						"add", "");
	}
	
	function productKeyp() {
				var sn = $("#paraMap1_DR_SN").val();
				if(sn==null||sn==''){
				utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择产品SN" />",0,"260","");
		        return false;
				}
				var piframeId = window.frameElement.id;
				var MODEL_CODE=$("#paraMap1_WT_MODEL_CODE").val();
				var url = "${path}buss/bussModel.ms?exeid=a1dd9d91ef1b45b697372e7f7dfa4b10&weSn="+ sn+"&piframeId="+piframeId+
				"&MODEL_CODE="+MODEL_CODE;						

				showPopWinFp(url, 700, 350, "", "<dict:lang value="替换主件"/>",
						"add", "");
	}
	
	function clearSn(){
	   $("#paraMap1_DR_SN").val('');
	   $("#paraMap1_DR_SN_SHOW").val('');
	   $("#paraMap1_WT_MO_NUMBER").val('');
	   $("#paraMap1_WT_MODEL_CODE").val('');
	   $("#MODEL_NAME").val('');
	   $("#MODEL_SPEC").val('');
	}
	
	function completeRepair(obj){
      var sn = $("#paraMap1_DR_SN").val();
      $("#completeRepairFlag").val(1);
      $(":checkbox").prop("checked",true);
            if(sn==null||sn==''){
			utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择产品SN" />",0,"260","");
		    return false;
	 }
      addRepair();
      
    	    // 不做流程验证，全打完成标签


	 /*
	 //$("#completeRepair").prop("disabled","disabled");
      var work_station=$("#paraMap1_WT_WORK_STATION").val();
      var crc_nextgroup;
      var crc_next_seq;
      if(obj=='nextGroup'){
         crc_nextgroup=$("#nextGroup").find("option:selected").text();
         crc_next_seq=$("#nextGroup").val();
         if(crc_nextgroup==''){
            utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择回流工序" />",0,"260","");
		    return false;
         }
      }
	  $.ajax({
		type: "POST",
	    dataType: "json",
	    url: "buss/bussModel_exeFunc.ms?funcMId=a65b93b5ddf04b16b40f59b2fc2019b0&type=completeRepair",
	    data: {'sn':sn,'work_station':work_station,'crc_nextgroup':crc_nextgroup,'crc_next_seq':crc_next_seq},
		success: function(data){
		
		   if(data.ajaxList!=null&&data.ajaxList.length>0){
		     
			var pList=data.ajaxList;
			$("#nextGroup").empty();
			for(var i=0;i<pList.length;i++){ 				  
 				   $("#nextGroup").append("<option value='"+pList[i].KEY+"'>"+pList[i].VAL+"<option>"); 
 			}
 			$("#nextGroup").trigger("chosen:updated");
			$("#addFCWT,#back").show();
			$("#addFCWT").draggable();
			$('.chosen-container').css("width","230px");
		   }
		  else if(data.ajaxString!= null && data.ajaxString != ""){
			 utilsFp.confirmIcon(3,"","","", data.ajaxString,0,"260","");	
			 //$("#completeRepair").prop("disabled",false);  
		   }
		   else if(data.ajaxMap!= null){
		     if(obj=='nextGroup'){
		        hideDiv('addFCWT','back');
		     }
		     msgPop(data.ajaxMap.alertMsg,'',data.ajaxMap.title,data.ajaxMap.width,data.ajaxMap.height,data.ajaxMap.time);
		     clearSn();
		     $("#errorTable tbody").html('');
	         if($("#isCloseWin").attr('checked')){
		      closeWindow();
		     }
		   }
		   
		},
		error: function(XMLHttpRequest, textStatus, errorThrown){
					//$("#completeRepair").prop("disabled",false);  
			   }
		});
		*/
	}
	
	//维修信息 保存方法
	function addRepair(){
	      var selCount=0;
	      var seqs;
		  var errorArr=[];
		  var errorS;
		  $("input[name='isSelect1']:checked").each(function(i) {
		        selCount++;
				seqs = $(this).val();
				errorS={};
				errorS.DR_ID=$("#ID"+seqs).val();//传DI：id
				//errorS.WR_ERROR_CODE=$("#ERROR_CODE"+seqs).val();
				//errorS.WR_POINT=$("#POINT"+seqs).val();
                errorS.flag=$("#reflag"+seqs).attr("data");
				errorArr.push(errorS);
					
			});		
			//console.log(JSON.stringify(errorArr));//return;
		// var params = getFormData('addForm'); 
          //   console.log(params);查看表单内容
			//$("#errorArr").val(JSON.stringify(errorArr));//查看更新ID
		  if(selCount==0){
             utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少选择一条记录" />",0,"260","");
		     return false;
		  }
                       
			if(!val.valNullData()){
				return ;
			}
			if(!valData()){
				return ;
			}
			if(!val.valOjbsData()){
				return ;
			}
	   	$("#errorArr").val(JSON.stringify(errorArr));            
            var url = "buss/bussModel_exeFunc.ms?funcMId=0a54d982b72e460982f9a86228466b0e&model=addRepair";
            if( $("#completeRepairFlag").val()==1)
            url+= '&Flag=Y';
            //console.log(url);
             $("#completeRepairFlag").val(0);
            document.forms.addForm.action = url;
            
			document.forms.addForm.submit();
			
       }
       
       function getFormData(formId) {  						//获得form表单内容
     var result = {};  
        $.each($("#" + formId).serializeArray(), function() {  
        result[this.name] = this.value;  
        });  
        return result;  
        }  
       
        function addParentData(msg,title,width,height,time){
	        msgPop(msg,'',title,width,height,time);
	        if($("#isCloseWin").attr('checked')){
		      closeWindow();
		      parentWindow.query("0ab26fe960da4b8e824ba7b136743db9");
		    }
	        var sn=$("#paraMap1_DR_SN").val();
		    queryErrorList(sn);
		    
	    }
       
	   function errorJudge()
		{
		  var sn=$("#paraMap1_DR_SN").val();
		  var dataAuth = $("#deptLs_data_auth").val();
		  if(sn==null||sn==''){
				utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择产品SN" />",0,"260","");
		        return false;
		  }
		  var id;
		  var selCount=0;
		  $("input[name='isSelect1']:checked").each(function(i) {
		  selCount++;
				var seqs = $(this).val();
				id=$("#ID"+seqs).val();
					
			});
		  if(selCount!=1){
             utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择一条记录" />",0,"260","");
		     return false;
		  }
		  var piframeId = window.frameElement.id;
		  var url = "${path}buss/bussModel.ms?exeid=b3999aad54704d29a43bf3e15493cd25&weSn="+sn+"&id="+id+"&piframeId="+piframeId+"&dataAuth="+dataAuth;
			
		showPopWinFp(url, 680, 460,"","<dict:lang value="误判"/>","add","");
	}
		
	function queryErrorList(key,flag){
	    //	console.log("入错");
		util.showLoading("处理中...");
		var work_station=$("#paraMap1_DR_REPAIR_STATION").val();
		$("#completeRepairId").prop("disabled",false);
		var getProUrl="${path}buss/bussModel_exeFunc.ms?funcMId=0a54d982b72e460982f9a86228466b0e";
	  $.ajax({
		type: "POST",
		async:false,
	    dataType: "json",
	    url: getProUrl+'&model=queryErrorList',
	    data: {'SN':key,'work_station':work_station,'flag':flag},
		success: function(data){
				
				util.closeLoading();
				if(data.ajaxString!= null && data.ajaxString != ""){
				   utilsFp.confirmIcon(3,"","","", data.ajaxString,0,"260","");
				   clearSn();				   
		           return false;
				}
				var tbodyStr = "";
				var tbodyStr2 = "";
				if(data.ajaxList != null && data.ajaxList != ""){
					var checkedTag = "";//是否选中
					for(var i=0,j=data.ajaxList.length;i<j;i++){
						var pList=data.ajaxList;
						var repairState="";//状态
						
						if(pList[i].DR_FINISH_FLAG == "1"){//DR_FINISH_FLAG
							//repairState="<span class='state1'>已维修</span>";
							repairState="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:60px'>已维修</span>";
						}else {
							//repairState="<span class='state0'>待维修</span>";
							repairState="<span class='state' style='background-color:#f8b72d;color:#FFFFFF;width:60px'>待维修</span>";
						}
						
						tbodyStr+="<tr class='datagrid-row' id='"+(i+1)+"' style='cursor: pointer;' onclick=\"\">"
								+"<td class='datagrid-cell ' style=\"width:30px; text-align:center;\" >"+(i+1)+"</td>"
								+"<td class=\"datagrid-cell\" style=\"width:30px;text-align:center; \" ><input type='checkbox' name='isSelect1' value='"+i+"'  onclick=\"\"></td>";
								tbodyStr += "<td class=\"datagrid-cell \" style=\"text-align:center;width:100px;\" title=\""+nullToEmpty(pList[i].DR_ERROR_CODE)+"\" >"+nullToEmpty(pList[i].DR_ERROR_CODE)+"</td>";
								tbodyStr += "<td class=\"datagrid-cell \" style=\"width:100px;\" title=\""+nullToEmpty(pList[i].CEC_DESC)+"\"  >"+nullToEmpty(pList[i].CEC_DESC)+"</td>";
                                tbodyStr += "<td class=\"datagrid-cell \" style=\"text-align:center;width:100px;  \"  title=\""+nullToEmpty(pList[i].DR_POINT)+"\" >"+nullToEmpty(pList[i].DR_POINT)+"</td>";
								tbodyStr += "<td class=\"datagrid-cell \" style=\"width:100px;\" title=\""+nullToEmpty(pList[i].DR_REPAIR_STATION)+"\"  >"+nullToEmpty(pList[i].DR_REPAIR_STATION)+"</td>";
								tbodyStr += "<td class=\"datagrid-cell \" style=\"width:130px;\" title=\""+nullToEmpty(pList[i].CA_NAME)+"\"  >"+nullToEmpty(pList[i].CA_NAME)+"</td>";
								tbodyStr += "<td class=\"datagrid-cell \" style=\"width:90px;text-align: center;\"   id='reflag"+(i)+"' data='"+pList[i].DR_FINISH_FLAG+"'>"+repairState+"</td>";
                                tbodyStr += "<td class=\"datagrid-cell \" style=\"width:130px;\">"+nullToEmpty(pList[i].DR_REPAIR_TIME)+"</td>";
                                tbodyStr += "<td class=\"datagrid-cell \" style=\"width:130px;text-align: center;\">"+nullToEmpty(pList[i].DR_EMP)+"</td>";
								tbodyStr +="<input type=\"hidden\" id=\"ID"+i+"\" value=\""+nullToEmpty(pList[i].ID)+"\" />";
								tbodyStr +="<input type=\"hidden\" id=\"ERROR_CODE"+i+"\" value=\""+nullToEmpty(pList[i].DRE_ERROR_CODE)+"\" />";
								tbodyStr +="<input type=\"hidden\" id=\"POINT"+i+"\" value=\""+nullToEmpty(pList[i].DR_POINT)+"\" />";
								tbodyStr +="</tr>";
								
					/*	tbodyStr2+="<tr class='datagrid-row' id='tr2"+(i+1)+"' style='cursor: pointer;' onclick=\"\">"
								+"<td class='datagrid-cell ' style=\"width:30px; text-align:center;\" >"+(i+1)+"</td>"
								+"<td class=\"datagrid-cell\" style=\"width:30px;text-align:center; \" ><input type='checkbox' name='isSelect1' value='"+i+"'  onclick=\"\"></td>";
								tbodyStr2 += "<td class=\"datagrid-cell \" style=\"width:100px;\">"+nullToEmpty(pList[i].WE_ERROR_CODE)+"</td>";
								tbodyStr2 += "<td class=\"datagrid-cell \" style=\"width:100px;\">"+nullToEmpty(pList[i].CEC_DESC)+"</td>";
                                tbodyStr2 += "<td class=\"datagrid-cell \" style=\"width:70px;\">"+nullToEmpty(pList[i].WE_POINT)+"</td>";
                                tbodyStr2 += "<td class=\"datagrid-cell \" style=\"width:130px;\">"+nullToEmpty(pList[i].WE_TEST_TIME)+"</td>";
								tbodyStr2 += "<td class=\"datagrid-cell \" >"+nullToEmpty(pList[i].NAME)+"</td>";
								tbodyStr2 +="</tr>";
					*/
					}
				}
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody").html(tbodyStr);
				//$("#errorTable2 tbody").html(tbodyStr2);
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:odd").addClass("tr-hover");//奇数行
			//	$("#errorTable2 tr:odd").addClass("tr-hover");//奇数行
				clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
				defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
			//	clickTr('errorTable2');

			},
		error: function(msg){
				util.closeLoading();
				utilsFp.alert("error:"+msg);
		  }
		});	
	}
	
	function clickTr(tableId){
			$("#"+tableId+" tr").unbind("click");
			$("#"+tableId+" tr input[type=checkbox]").unbind("click");
			$("#"+tableId+" tr").on("click",function(e){
			var trId = $(this).attr("id");
			if ($("#"+trId+" :checkbox").attr("checked")) {
				$("#"+trId+" :checkbox").prop("checked",false);
				$("#"+trId).css("background-color","");
			}else{
				$("#"+tableId+" input[type='checkbox']").each(function(){
					if ($(this).attr("checked")) {
						$(this).prop("checked",false);
						$(this).parents("tr").css("background-color","");
					}
				});
				$("#"+trId+" :checkbox").prop("checked",true);
				$("#"+trId).css("background-color","#d3eafc");
			}
		});
		
		  $("#"+tableId+" tr input[type=checkbox]").click(function(e) {
			  e.stopPropagation();
			  var style = $(this).parents("tr").attr("style");
			  if(style && style.indexOf("background-color") > -1){
				  $(this).parents("tr").css("background-color","");
			  }else{
				  $(this).parents("tr").css("background-color","#d3eafc");
			  }
		  });
	}
	
function cbFun1(key,val,obj){
	_thisSelObj.value = val;
	var editName=$(_thisSelObj).attr("editName");
	$("input[name='"+editName+"']").val(key);
        
	if(null!=obj){		
          queryErrorList(key,'check');//获得已有不良信息函数
$("#paraMap1_DR_MO_NUMBER").val(obj.eq(4).text());
$("#paraMap1_DR_MODEL_CODE").val(obj.eq(5).text());
$("#paraMap1_DR_MODEL_CODE_SHOW").val(obj.eq(5).text());
$("#paraMap1_DR_MODEL_NAME").val(obj.eq(6).text());
$("#paraMap1_DR_MODEL_STANDARD").val(obj.eq(7).text());
        }
	_thisSelObj.focus();
}

 //自动加载字段信息 #f1
 function changer(obj){
     var wt = $("#paraMap1_DR_REPAIR_STATION").val();
     
     if(""==wt){
         $("#paraMap1_DR_SN").val('');
           _alertValMsg($("#paraMap1_DR_REPAIR_STATION_SHOW"),"<dict:lang value="工作中心不能为空" />");
         return;
     }
     var sn=$("#paraMap1_DR_SN").val();
     			
        util.showLoading("处理中...");
		$("#completeRepairId").prop("disabled",false);
		var getProUrl="${path}buss/bussModel_exeFunc.ms?funcMId=0a54d982b72e460982f9a86228466b0e";
	  $.ajax({
		type: "POST",
		ajax:false,
		async: false,
	    dataType: "json",
	    url: getProUrl+'&model=check',
	    data: {'SN':sn},
		success: function(data){
                  util.closeLoading();
                
                if(null!=data&&undefined!=data&&""!=data){  
				var map = data.ajaxMap;
            	//if(isEmptyValue(map))return;
            	$("#paraMap1_DR_MO_NUMBER").val(map.DR_MO_NUMBER);
				$("#paraMap1_DR_MODEL_CODE").val(map.DR_MODEL_CODE);
                $("#paraMap1_DR_MODEL_CODE_SHOW").val(map.DR_MODEL_CODE);
                $("#paraMap1_DR_MODEL_NAME").val(map.DR_MODEL_NAME);
                $("#paraMap1_DR_MODEL_STANDARD").val(map.DR_MODEL_STANDARD);
		        var listLength = map.listLength;//已经存在维修信息，但是未曾录入制令单信息时候
		        if(""!=map.DR_MO_NUMBER&&undefined!=map.DR_MO_NUMBER||listLength==0){
		        //输入框禁用
		        $("#paraMap1_DR_MO_NUMBER").attr("disabled",true);
				$("#paraMap1_DR_MODEL_CODE").attr("disabled",true);
                $("#paraMap1_DR_MODEL_CODE_SHOW").attr("disabled",true);
                if($("#paraMap1_DR_MODEL_CODE_SHOW").hasClass("ico-search-input"))
                $("#paraMap1_DR_MODEL_CODE_SHOW").removeClass("ico-search-input");
                check_pm_mo_numeber =false;
		        }else{//启用
		        $("#paraMap1_DR_MO_NUMBER").attr("disabled",false);
				$("#paraMap1_DR_MODEL_CODE").attr("disabled",false);
                $("#paraMap1_DR_MODEL_CODE_SHOW").attr("disabled",false);
                if(!$("#paraMap1_DR_MODEL_CODE_SHOW").hasClass("ico-search-input"))
                 $("#paraMap1_DR_MODEL_CODE_SHOW").addClass("ico-search-input");
		        check_pm_mo_numeber = true;
		        }
		        queryErrorList(sn);
                }else{
                $("#paraMap1_DR_MO_NUMBER").attr("disabled",false);
				$("#paraMap1_DR_MODEL_CODE").attr("disabled",false);
                $("#paraMap1_DR_MODEL_CODE_SHOW").attr("disabled",false);
                check_pm_mo_numeber = true;
                }
		},
		error: function(msg){
				util.closeLoading();
				utilsFp.alert("error:"+msg);
		  }
		});
     
     
 }
	
	
 /*字符串，数组，对象的空判断*/
    var isEmptyValue = function(value) {
        var type;
        if(value == null) { // 等同于 value === undefined || value === null
        return true;
        }
        type = Object.prototype.toString.call(value).slice(8, -1);
        switch(type){
        case 'String':
        return !$.trim(value);
        case 'Array':
        return !value.length;
        case 'Object':
        return $.isEmptyObject(value);// 普通对象使用 for...in 判断，有 key 即为 false
        default:
            return false;// 其他对象均视作非空		
        }		
    };
	
	
	
	
	function nullToEmpty(str){
	 if(str==null){
	   return '';
	 }
	 return str;
	}
</script>
<bu:script viewId="b0e4480b4b0d4da884da2b9e2f1499e0" />
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	
	<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll','.head');
    setPopScroll('.scroll2','.head2');
    setPopScroll('.scroll3','.head3');
  })
})(jQuery)

</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>