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
			width: 60px;
   			height: 20px;
    			display: inline-block;
    			background-color: green;
    			border-radius: 5px;
    			color: #fff;
		}
		.mod{
		    float:left;
		}
		.right_div{     	 
    		width: 405px;
            height: 550px;
		}
		.img{
		    overflow:auto;
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
		/*if(tag="tag2"){
		    loadErrorEchart();
		}*/
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
	<script type = "text/javascript" src = "${path}plf/page/timer/perforMonit/js/echarts.min.js"></script>
	<script type = "text/javascript" src = "${path}buss/pcbviewer/js/lib/jquery.svg.pan.zoom.js"></script>
	<script type = "text/javascript" src = "${path}buss/pcbviewer/js/lib/jquery.modal.js"></script>
	<script type = "text/javascript" src = "${path}buss/pcbviewer/js/pcbviewer.js?v=0.7"></script>
	<script type = "text/javascript" src = "${path}buss/pcbviewer/js/pcbviewer.common.js"></script> 
	<link rel="stylesheet" href="${path}buss/pcbviewer/css/pcbviewer.common.css" type="text/css">
	<script type="text/javascript">
		var addTableTrMap;
	</script>
  	
</head>
<body>
	<div class="edit">
	<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
										target="submitFrame">	
            <div class="hd">
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;display:none;">
                <div class="save-close" <dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="1" style="display:none;"/>
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
			        <button type="button" onclick="addRepair(this);"><i class="ico ico-save"></i><dict:lang value="维修" /></button>
			        
			    	<button type="button" onclick="errorJudge();"><i class="ico ico-wp"></i><dict:lang value="误判" /></button>
			    	<button type="button" onclick="productAddError();"><i class="ico ico-kl"></i><dict:lang value="添加不良" /></button>
			    	<button type="button" onclick="productDelError();"><i class="ico ico-sc"></i><dict:lang value="删除不良" /></button>
			        <button type="button" onclick="productScarp();"><i class="ico ico-scrap"></i><dict:lang value="报废/拆解" /></button>
			        <button type="button" style="display:none;" onclick="productKeyp();"><i class="ico ico-save"></i><dict:lang value="替换主件 "/></button> 
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="关闭" /></button>
			    </div>

			</div>
			<div class="bd" style="height:550px;">

				<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="b80d6492859243b498458c992ab04063" type="add" />
<div class="mod" style="width:720px;margin-right:10px;">
<div class="mod-hd">		
  <h3 class="tit"><dict:lang value="基本信息" /></h3>	
  </div>
<div class="mod-hd" style="height:70px;border-bottom: none;">
	<table class="basic-table" id="itemTable">
	<input type="hidden" name="formIds" value="b80d6492859243b498458c992ab04063" />
	<input type="hidden" name="b80d6492859243b498458c992ab04063" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" id="paraMap1_WT_PROJECT_ID" name="paraMap1@0#WT_PROJECT_ID" />
	<input type="hidden" id="_PRODUCT_STEP" value="" />
	<input type="hidden" id="_GROUP_CODE" value="" />
		<s:set name="_$viewId" value="'1ec3e077d11f4893a408cd72c9c311b1'" />
		<s:set name="_$formId_1" value="'b80d6492859243b498458c992ab04063'" />
		<s:set name="_$type" value="'add'" />
		<tr>
		    <td class="name" style="width:96px;"/><span class="dot">*</span><bu:uitn colNo="WHL_WORKCENTER" formId="8c048b8e35874c168fbff6ab0fee4d69" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="WHL_WORKCENTER" formId="8c048b8e35874c168fbff6ab0fee4d69" ><bu:ui colNo="WHL_WORKCENTER" formId="8c048b8e35874c168fbff6ab0fee4d69"  value="%{WHL_WORKCENTER}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:96px;"/><span class="dot">*</span><bu:uitn colNo="WT_SN" formId="b80d6492859243b498458c992ab04063" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="WT_SN" formId="b80d6492859243b498458c992ab04063" ><bu:ui colNo="WT_SN" formId="b80d6492859243b498458c992ab04063" value="%{WT_SN}" formIndex="1" /></bu:td>
		 		
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WT_MODEL_CODE" formId="b80d6492859243b498458c992ab04063" /></td>
			<bu:td cssClass="dec" colNo="WT_MODEL_CODE" formId="b80d6492859243b498458c992ab04063" ><bu:ui colNo="WT_MODEL_CODE" disabled="disabled" formId="b80d6492859243b498458c992ab04063" value="%{WT_MODEL_CODE}" formIndex="1" /></bu:td>
		     	<td class="name" ><dict:lang value="品名" /></td>
			<td class="dec" ><input type="text" class=" input isSubmit " id="MODEL_NAME" name="MODEL_NAME" disabled="disabled"/></td>
	   	</tr>
	</table>
</div>

<div class="js-tab">
					<DIV id="container" style="padding:0 2px;box-sizing: border-box;">
						<DIV class="hd">
							<UL class="tab-list tab">
								
								<LI id="tag1"><A class=""
									onclick="switchTag('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="不良信息" /></SPAN> </A>
								</LI>
								<!--
								<LI id="tag2"><A class=""
									onclick="switchTag('tag2','content2','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="维修统计" /></SPAN> </A>
								</LI>
								-->
							</UL>
						</DIV>
			<DIV class="content1" id="content" style="margin-top: 15px;">
			<DIV id="content1" style="margin-top:4px;" data-tab="tag1">
  <div class="panel datagrid datagrid-div1" >
					<div class="datagrid-div2 datagrid-div6 datagrid-view"
						id="datagrid-view" style="">
						<div class="datagrid-header">
							<div class="datagrid-header-inner head" id="datagrid-header-inner1"
								style="width:100%;">
								<table id="datagrid-htable" class="datagrid-htable fixedTable" style="min-width:1100px;">

									<tbody>
										<tr class="datagrid-header-row datagrid-title-ajax">
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
											<td class="datagrid-cell" style="width:70px;"><dict:lang
													value="不良点位" />
											</td>
											<td class="datagrid-cell" style="width:100px;"><dict:lang
													value="状态" />
											</td>
											<td class="datagrid-cell" style="width:100px;"><dict:lang
													value="测试工序" />
											</td>
											<td class="datagrid-cell" style="width:100px;"><dict:lang
													value="测试工序名称" />
											</td>
											<td class="datagrid-cell" style="width:100px;"><dict:lang
													value="测试工作中心" />
											</td>
											<td class="datagrid-cell" style="width:150px;"><dict:lang
													value="测试工作中心名称" />
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


						<div class="datagrid-body datagrid-div3 scroll" id="datagrid-body"
							style="height:340px;"  onscroll="ajaxTableScroll(this,'1')">
							<table class="dlist-table table-line" id="errorTable" style="width:1100px;table-layout:fixed;">
								<tbody id="tbody_1">
									
								</tbody>
							</table>
						</div>

					</div>
				</div>



<div class="mod-hd" style="display:none;">		
  <h3 class="tit"><dict:lang value="维修信息" /></h3>	
  </div>
<div class="mod-hd" style="height:170px;border-bottom: none;display:none;">
	<table class="basic-table" >	
	<input type="hidden" id="errorArr" name="errorArr" value="" />
		<tr>
		    <td class="name" style="width:96px;"/><bu:uitn colNo="WR_REASON_CODE" formId="64cf42dca7eb43a4b7f80b8e10749008" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="WR_REASON_CODE" formId="64cf42dca7eb43a4b7f80b8e10749008" ><bu:ui colNo="WR_REASON_CODE" formId="64cf42dca7eb43a4b7f80b8e10749008" value="%{WR_REASON_CODE}" formIndex="2" /></bu:td>
			<td class="name" style="width:96px;" /><bu:uitn colNo="WR_REPAIR_DESC" formId="64cf42dca7eb43a4b7f80b8e10749008" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="WR_REPAIR_DESC" formId="64cf42dca7eb43a4b7f80b8e10749008" ><bu:ui colNo="WR_REPAIR_DESC" formId="64cf42dca7eb43a4b7f80b8e10749008" value="%{WR_REPAIR_DESC}" formIndex="2" /></bu:td>
		</tr>
		<tr>	 
			<td class="name" style="width:84px;"/><bu:uitn colNo="WR_REPAIR_METHOD" formId="64cf42dca7eb43a4b7f80b8e10749008" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="WR_REPAIR_METHOD" formId="64cf42dca7eb43a4b7f80b8e10749008" ><bu:ui colNo="WR_REPAIR_METHOD" formId="64cf42dca7eb43a4b7f80b8e10749008" value="%{WR_REPAIR_METHOD}" formIndex="2" /></bu:td>

			<td class="name" /><bu:uitn colNo="WR_ERROR_ITEM" formId="64cf42dca7eb43a4b7f80b8e10749008" /></td>
			<bu:td cssClass="dec" colNo="WR_ERROR_ITEM" formId="64cf42dca7eb43a4b7f80b8e10749008" ><bu:ui colNo="WR_ERROR_ITEM" formId="64cf42dca7eb43a4b7f80b8e10749008" value="%{WT_MODEL_CODE}" formIndex="2" /></bu:td>
		    
		</tr>
		<tr>
		    <td class="name" ><dict:lang value="物料名称" /></td>
			<td class="dec" ><input type="text" class=" input isSubmit " id="WR_MODEL_NAME" name="WR_MODEL_NAME" disabled="disabled"/></td>
		
			<td class="name" ><dict:lang value="规格" /></td>
			<td class="dec"><input type="text" class=" input isSubmit " id="WR_MODEL_SPEC" name="WR_MODEL_SPEC" disabled="disabled" /></td>
		</tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="WR_MEMO" formId="64cf42dca7eb43a4b7f80b8e10749008" /></td>
			<bu:td cssClass="dec" colspan="3" colNo="WR_MEMO" formId="64cf42dca7eb43a4b7f80b8e10749008" ><bu:ui colNo="WR_MEMO" formId="64cf42dca7eb43a4b7f80b8e10749008" value="%{WR_MEMO}" rows="2" formIndex="2" /></bu:td>

		</tr>
		<tr>
		<td colspan="6" align="center">
			<div class="optn" style="position: static;">
		    	
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
								<table id="datagrid-htable2" class="datagrid-htable fixedTable" style="min-width:555px;">

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
							<table class="dlist-table table-line" id="errorTable2" style="min-width:555px;table-layout:fixed;">
								<tbody id="tbody_2">
									
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
								<table id="datagrid-htable3" class="datagrid-htable fixedTable" style="width:100%;">

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
							<table class="dlist-table table-line" id="errorTable3" style="width:100%;table-layout:fixed;">
								<tbody id＝"tbody_3">
									
								</tbody>
							</table>
						</div>

					</div>
				</div>
				
			</div>
			<div class="mod-hd" style="float:left;width:100%">		
              <h3 class="tit"><dict:lang value="机种不良统计" /></h3>	
            </div>
			<div id="main" style="width: 800px;height:200px;margin-left:15px;float:left;margin-top: -40px"></div>
        	</DIV>
        
        </DIV>
	        </DIV>
</div>
			<bu:jsVal formId="b80d6492859243b498458c992ab04063" formIndex="1" />
									</form>
			</div><!--mod end-->
			<div class="mod right_div" style="background-color:#f9f9f9">
			   <div class="div_draw zoom_area"></div>
			   <div class="div_img zoom_area">
            	<div class="div_title">
            	    	不良图片<b class="zoom zoomMax">+</b>
            	</div>
            	<div class="img">
            	    <img id="error_img"  align="bottom" />
            	</div>
            	</div>
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
									
			        				<button type="button" onclick="completeRepair('nextGroup');"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        				<button type="button" onclick="hideDiv('addFCWT','back');"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
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

<script type="text/javascript">

top.$('script').each(function(i,item){ 
	    if(item.src.indexOf('jquery-1.7.2.js')>-1){ 
	        $(item).remove();
	        location.reload();
	    } 
	});
	$(function(){
	    $("input[name='iframeId']").val('${param.iframeId}');
	    $("#paraMap2_WR_REASON_CODE").val("0");
	    $("#paraMap2_WR_REPAIR_METHOD").val("0");
	})
	function query(){
	    
	}
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
	function productAddError() {
				var sn = $("#paraMap1_WT_SN").val();
				var dataAuth = $("#deptLs_data_auth").val();
				if(sn==null||sn==''){
				utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择产品SN" />",0,"260","");
		        return false;
				}
				var piframeId = window.frameElement.id;
				
				var url = "${path}buss/bussModel.ms?exeid=d746c7b2e81b4c1180641f257ddf00c2&weSn="+ sn+"&piframeId="+piframeId+"&dataAuth="+dataAuth;
						

				showPopWinFp(url, 400, 320, "", "<dict:lang value="添加不良"/>",
						"add", "");
	}
	
	function productDelError() {
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
		  utilsFp.confirmIcon(1,"","productDelErrorConfirm",obj, "<dict:lang value="确认删除？" />","1","","");
	
	}
	
	function productDelErrorConfirm(obj){
	
	 /*  document.forms.addForm.action = "buss/bussModel_exeFunc.ms?FUNC_CODE=F5320&funcMId=a65b93b5ddf04b16b40f59b2fc2019b0&type=del";
      document.forms.addForm.submit(); */
      
	  $.ajax({
		type: "POST",
	    dataType: "json",
	    url: "buss/bussModel_exeFunc.ms?funcMId=a65b93b5ddf04b16b40f59b2fc2019b0&type=del",
	    data: {'ids':obj.ids},
		success: function(data){
		  if(data.ajaxMap!= null){
		     msgPop(data.ajaxMap.alertMsg,'',data.ajaxMap.title,data.ajaxMap.width,data.ajaxMap.height,data.ajaxMap.time);
		  }
		  else if(data.ajaxString!= null && data.ajaxString != ""){
			 utilsFp.confirmIcon(3,"","","", data.ajaxString,0,"260","");	
			 return;  
		   }
		  var sn=$("#paraMap1_WT_SN").val();
		  queryErrorList(sn);
		}
		});
	}
	
	/* 报废 */
	function productScarp() {
				var sn = $("#paraMap1_WT_SN").val();
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
				var WORK_STATION = $("#paraMap1_WHL_WORKCENTER").val();
				var url = "${path}buss/bussModel.ms?exeid=df1a6b8143be4549874ab47ef01d691c&weSn="+ sn+"&piframeId="+piframeId+
				"&MO_NUMBER="+MO_NUMBER+"&MODEL_NAME="+MODEL_NAME+"&MODEL_SPEC="+MODEL_SPEC+"&MODEL_CODE="+MODEL_CODE+"&PROJECT_ID="+PROJECT_ID+"&WORK_STATION="+WORK_STATION+"&dataAuth="+dataAuth;
						

				showPopWinFp(url, 457, 430, "", "<dict:lang value="报废"/>",
						"add", "");
	}
	
	function productKeyp() {
				var sn = $("#paraMap1_WT_SN").val();
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
	   //$("#paraMap1_WT_SN").val("");
	   $("#paraMap1_WT_SN_SHOW").val("");
	   $("#paraMap1_WT_MO_NUMBER").val("");
	   $("#paraMap1_WT_MODEL_CODE").val("");
	   $("#MODEL_NAME").val("");
	   $("#MODEL_SPEC").val("");
	}
	
	function completeRepair(obj){
      var sn = $("#paraMap1_WT_SN").val();
      //console.log(sn);
      if(sn==null||sn==''){
			utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择产品SN" />",0,"260","");
		    return false;
	 }
	 //$("#completeRepair").prop("disabled","disabled");
      var work_station=$("#paraMap1_WHL_WORKCENTER").val();
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
		
	}
	
	//维修信息 保存
	function addRepair(){
	      var selCount=0;
	      var seqs;
		  var errorArr=[];
		  var errorS;
		  $("input[name='isSelect1']:checked").each(function(i) {
		        selCount++;
				seqs = $(this).val();
				errorS={};
				errorS.WE_ID=$("#ID"+seqs).val();
				errorS.WR_ERROR_CODE=$("#ERROR_CODE"+seqs).val();
				errorS.WR_POINT=$("#POINT"+seqs).val();

				errorArr.push(errorS);
					
			});
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
                  
            document.forms.addForm.action = "buss/bussModel_exeFunc.ms?funcMId=a65b93b5ddf04b16b40f59b2fc2019b0&type=addRepair";
       
			document.forms.addForm.submit();
			//var sn=$.trim($("#paraMap1_WT_SN").val());
	        //queryErrorList(sn);
		    /*$("input[name='isSelect1']:checked").each(function(i) {
		        var inputSeqs=$(this).val();
		        var repairState=$("#REPAIR_STATE"+seqs);
		        repairState.html("");
		        repairState.html("<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:60px'>已维修</span>");
			});*/
			
       }
        function addParentData1(msg,title,width,height,time){
	        msgPop(msg,'',title,width,height,time);
	        /*if($("#isCloseWin").attr('checked')){
		      closeWindow();
		    }*/
	        var sn=$("#paraMap1_WT_SN").val();
		    queryErrorList(sn);
	    }
       
        function addParentData(msg,title,width,height,time){
	        msgPop(msg,'',title,width,height,time);
	        if($("#isCloseWin").attr('checked')){
		      closeWindow();
		    }
	        var sn=$("#paraMap1_WT_SN").val();
		    queryErrorList(sn);
	    }
       
	   function errorJudge()
		{
		  var sn=$("#paraMap1_WT_SN").val();
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
	
    var _url = location.protocol+"//"+location.host+"${path}";	
    var _mo_number='';
    var _CoorContent=[];
	function queryErrorList(key,flag){
		util.showLoading("处理中...");
		var work_station=$("#paraMap1_WHL_WORKCENTER").val();
		$("#completeRepairId").prop("disabled",false);
		$("#errorTable tbody").empty();
		$("#errorTable2 tbody").empty();
		var getProUrl="${path}buss/bussModel_exeFunc.ms?funcMId=502c09becd474636af8bdb1e99a27062";
	  $.ajax({
		type: "POST",
	    dataType: "json",
	    async:false,
	    url: getProUrl+'&type=queryErrorList',
	    data: {'weSn':key,'work_station':work_station,'flag':flag},
		success: function(data){
				
				util.closeLoading();
				if(data.ajaxString=="FALSE"){
				   utilsFp.confirmIcon(3,"","","", "产品SN不存在,请更换",0,"260","");
				   clearSn();
				   loadErrorEchart();
		           return false;
				}
				if(data.ajaxString=="REPAIRMAXERROR"){
				   utilsFp.confirmIcon(3,"","","", "该产品已达到维修上限次数，需进行报废",0,"260","");
				   clearSn();
				   loadErrorEchart();
		           return false;
				}
				if(data.ajaxString!= null && data.ajaxString != ""){
				   utilsFp.confirmIcon(3,"","","", data.ajaxString,0,"260","");
				   clearSn();
				   loadErrorEchart();
		           return false;
				}
				var dataMap=data.ajaxMap.product_map;
				if(dataMap==null){
				    dataMap	={};
				    dataMap.WT_MO_NUMBER=null;
				    dataMap.WT_MODEL_CODE=null;
				    dataMap.CI_ITEM_NAME=null;
				    dataMap.CI_ITEM_SPEC=null;
				}
                if(dataMap.WT_MO_NUMBER==null){
                    dataMap.WT_MO_NUMBER="";
                }
                if(dataMap.WT_MODEL_CODE==null){
                    dataMap.WT_MODEL_CODE="";
                }
                if(dataMap.CI_ITEM_NAME==null){
                    dataMap.CI_ITEM_NAME="";
                }
                if(dataMap.CI_ITEM_SPEC==null){
                    dataMap.CI_ITEM_SPEC="";
                }
                $("#paraMap1_WT_MO_NUMBER").val(dataMap.WT_MO_NUMBER);
                $("#paraMap1_WT_MODEL_CODE").val(dataMap.WT_MODEL_CODE);
                $("#MODEL_NAME").val(dataMap.CI_ITEM_NAME);
                $("#MODEL_SPEC").val(dataMap.CI_ITEM_SPEC);
                
				var tbodyStr = "";
				var tbodyStr2 = "";
				if(data.ajaxList != null && data.ajaxList != ""){
					var checkedTag = "";//是否选中
					for(var i=0,j=data.ajaxList.length;i<j;i++){
						var pList=data.ajaxList;
						var repairState="";
						
						if(pList[i].WE_REPAIR_FLAG == "1"){
							//repairState="<span class='state1'>已维修</span>";
							repairState="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:60px'>已维修</span>";
						}else if(pList[i].WE_REPAIR_FLAG == "0"){
							//repairState="<span class='state0'>待维修</span>";
							repairState="<span class='state' style='background-color:#f8b72d;color:#FFFFFF;width:60px'>待维修</span>";
						}
						
						tbodyStr+="<tr class='datagrid-row' id='"+(i+1)+"' style='cursor: pointer;' onclick=\"\">"
								+"<td class='datagrid-cell ' style=\"width:30px; text-align:center;\" >"+(i+1)+"</td>"
								+"<td class=\"datagrid-cell\" style=\"width:30px;text-align:center; \" ><input type='checkbox' name='isSelect1' value='"+i+"'  onclick=\"\"></td>";
								tbodyStr += "<td class=\"datagrid-cell \" style=\"width:100px;\">"+nullToEmpty(pList[i].WE_ERROR_CODE)+"</td>";
								tbodyStr += "<td class=\"datagrid-cell \" style=\"width:100px;\">"+nullToEmpty(pList[i].CEC_DESC)+"</td>";
                                tbodyStr += "<td class=\"datagrid-cell we_point\" style=\"width:70px;\">"+nullToEmpty(pList[i].WE_POINT)+"</td>";
								tbodyStr += "<td class=\"datagrid-cell \" style=\"width:100px;text-align: center;\" id=\"REPAIR_STATE"+i+"\" >"+repairState+"</td>";
								tbodyStr += "<td class=\"datagrid-cell \" style=\"width:100px;\">"+nullToEmpty(pList[i].WE_TEST_GROUP)+"</td>";
								tbodyStr += "<td class=\"datagrid-cell \" style=\"width:100px;\">"+nullToEmpty(pList[i].GROUP_NAME)+"</td>";
								tbodyStr += "<td class=\"datagrid-cell \" style=\"width:100px;\">"+nullToEmpty(pList[i].WE_WORK_STATION)+"</td>";
                                tbodyStr += "<td class=\"datagrid-cell \" style=\"width:150px;\">"+nullToEmpty(pList[i].CA_NAME)+"</td>";
                                tbodyStr += "<td class=\"datagrid-cell \" style=\"width:130px;\">"+nullToEmpty(pList[i].WE_TEST_TIME)+"</td>";
								tbodyStr += "<td class=\"datagrid-cell \" >"+nullToEmpty(pList[i].NAME)+"</td>";
								tbodyStr +="<input type=\"hidden\" id=\"ID"+i+"\" value=\""+nullToEmpty(pList[i].ID)+"\" />";
								tbodyStr +="<input type=\"hidden\" id=\"ERROR_CODE"+i+"\" value=\""+nullToEmpty(pList[i].WE_ERROR_CODE)+"\" />";
								tbodyStr +="<input type=\"hidden\" id=\"POINT"+i+"\" value=\""+nullToEmpty(pList[i].WE_POINT)+"\" />";
								tbodyStr +="<input type=\"hidden\" class='we_error_img' id=\"WE_ERROR_IMG"+i+"\" value=\""+nullToEmpty(pList[i].WE_ERROR_IMG)+"\" />";
								tbodyStr +="</tr>";
								
						tbodyStr2+="<tr class='datagrid-row' id='tr2"+(i+1)+"' style='cursor: pointer;' onclick=\"showMethodNum('"+nullToEmpty(pList[i].WE_ERROR_CODE)+"');\">"
								+"<td class='datagrid-cell ' style=\"width:30px; text-align:center;\" >"+(i+1)+"</td>"
								+"<td class=\"datagrid-cell\" style=\"width:30px;text-align:center; \" ><input type='checkbox' name='isSelect1' value='"+i+"'  onclick=\"\"></td>";
								tbodyStr2 += "<td class=\"datagrid-cell \" style=\"width:100px;\">"+nullToEmpty(pList[i].WE_ERROR_CODE)+"</td>";
								tbodyStr2 += "<td class=\"datagrid-cell \" style=\"width:100px;\">"+nullToEmpty(pList[i].CEC_DESC)+"</td>";
                                tbodyStr2 += "<td class=\"datagrid-cell \" style=\"width:70px;\">"+nullToEmpty(pList[i].WE_POINT)+"</td>";
                                tbodyStr2 += "<td class=\"datagrid-cell \" style=\"width:130px;\">"+nullToEmpty(pList[i].WE_TEST_TIME)+"</td>";
								tbodyStr2 += "<td class=\"datagrid-cell \" >"+nullToEmpty(pList[i].NAME)+"</td>";
								tbodyStr2 +="</tr>";
					}
				}
				$("#errorTable tbody").html(tbodyStr);
				$("#errorTable2 tbody").html(tbodyStr2);
				$("#errorTable tr:odd").addClass("tr-hover");//奇数行
				$("#errorTable2 tr:odd").addClass("tr-hover");//奇数行
				clickTr('errorTable');
				clickTr('errorTable2');
                loadErrorEchart();
                if(_mo_number!=dataMap.WT_MO_NUMBER){
                    _mo_number=dataMap.WT_MO_NUMBER;
                    pcbViewer.topPath=_url+dataMap.GDO_TOP;
    	            pcbViewer.botPath=_url+dataMap.GDO_BOTTOM;
    	            util.showLoading("获取数据中...");
    	            pcbViewer.loadPcbViewer(function(){
    	                $('.div_draw .btn_top').click();
    	                util.closeLoading();
    	            });
	            } 
                var _coor_content = data.ajaxMap.coor_content; 
                if(_coor_content!=undefined&&_coor_content.length>0){
	                _CoorContent=lowerJSONKey(_coor_content);
    	        }else{
    	            _CoorContent=[];
    	        } 
    	        
                $('#error_img').removeAttr('src');
                $("#errorTable tr").off("click").on("click",function(){
                    $('#error_img').removeAttr('src');
                    $('#error_img').attr('src',$(this).find('.we_error_img').val());
                    
                    var point=$(this).find('.we_point').text();
                    var _coor=_CoorContent.filter(n=>n.code==point);
                    var _face='top';
                    if(_coor!=undefined&&_coor[0].face=='BOTTOM'){
                        _face='bot';
                    }
                    $('.btn').removeClass('checked');
                    $('.btn[_face="'+_face+'"]').addClass('checked');
                    pcbViewer.drawLocations(_coor,_face);
                }); 
                $("#errorTable tr").off("dblclick").on("dblclick",function(){  
    	             $('.div_draw .zoom').click();
                });
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
	
	//点击不良代码获取维修信息
	function showMethodNum(errorCode){console.log(errorCode);
	    var showUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=1f60a0afb5ff49ebaccfe258d80e3634";
	    util.showLoading("处理中...");
    $.ajax({
			    type: "POST",
			    dataType: "json",
			    url: showUrl+"&type=errorMethod&errorCode="+errorCode,
			    data: "",
				success: function(data){	
                        util.closeLoading();
						if(null == data){return ;}
						if(null != data.ajaxList){
							var pList = eval(data.ajaxList);
							var tbodyStr3 = "";
							for(var i = 0;i < pList.length; i++){
								tbodyStr3+="<tr class='datagrid-row' id='tr3"+(i+1)+"' style='cursor: pointer;' >"
								+"<td class='datagrid-cell ' style=\"width:30px; text-align:center;\" >"+(i+1)+"</td>"
								+"<td class=\"datagrid-cell\" style=\"width:30px;text-align:center; \" ><input type='checkbox' name='isSelect1' value='"+i+"' ></td>";
								tbodyStr3 += "<td class=\"datagrid-cell \" style=\"width:140px;\">"+nullToEmpty(pList[i].METHOD_NAME)+"</td>";
								tbodyStr3 += "<td class=\"datagrid-cell \" >"+nullToEmpty(pList[i].METHODNUM)+"</td>";
                                
								tbodyStr3 +="</tr>";
							}
							$("#errorTable3 tbody").html(tbodyStr3);
            				$("#errorTable3 tr:odd").addClass("tr-hover");//奇数行
            				
            				clickTr('errorTable3');
						}
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
	}
	
	function loadErrorEchart(){
	    // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));

        // 指定图表的配置项和数据
        myChart.setOption({
            title: {
                //text: '机种不良统计'
            },
            tooltip: {},
            legend: {
               
            },
            grid: {  
                    bottom:'35%'   //柱状图大小
            },  
            xAxis: {
                data: [],
                axisLabel:{  
                         interval:0,//横轴信息全部显示  
                         rotate:-30,//-30度角倾斜显示  
                    }  
            },
            yAxis: {},
            series: [{
                //name: '数量',
                type: 'bar',
                data: [],
                itemStyle: {
                        //柱形图圆角，鼠标移上去效果，如果只是一个数字则说明四个参数全部设置为那么多
                        emphasis: {
                            barBorderRadius: 30
                        },

                        normal: {
                            //柱形图圆角，初始化效果
                            barBorderRadius:[10, 10, 10, 10],
                            label: {
                                show: true,//是否展示
                                textStyle: {
                                    fontWeight:'bolder',
                                    fontSize : '12',
                                    fontFamily : '微软雅黑',
                                }
                            },
                            color: function (params){
                                var colorList = ['#00a0e9'];
                                return colorList[params.dataIndex];
                            }
                        }
                }
            }]
        });

        myChart.showLoading();    //数据加载完之前先显示一段简单的loading动画
        
        var names=[];    //类别数组（实际用来盛放X轴坐标值）
        var nums=[];    //销量数组（实际用来盛放Y坐标值）
        var showUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=1f60a0afb5ff49ebaccfe258d80e3634";
        var modelCode = $("#paraMap1_WT_MODEL_CODE").val();
        $.ajax({
			    type: "POST",
			    dataType: "json",
			    url: showUrl+"&type=modelEchart&modelCode="+modelCode,
			    data: "",
				success: function(data){	
                        
						if(null == data){return ;}
						if(null != data.ajaxList){
							var rccList = eval(data.ajaxList);
							for(var i = 0;i < rccList.length; i++){
								names.push(rccList[i].WE_ERROR_CODE+"/"+rccList[i].ERROR_NAME); 
								nums.push(rccList[i].ERRORNUM);
							}
							myChart.hideLoading();    //隐藏加载动画
                            myChart.setOption({        //加载数据图表
                                xAxis: {
                                    data: names
                                },
                                series: [{
                                    // 根据名字对应到相应的系列
                                    //name: '数量',
                                    data: nums
                                }]
                            });
						}
						
					},
				error: function(msg){
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
						myChart.hideLoading();
				  }
				});
	}
	
	function nullToEmpty(str){
	 if(str==null){
	   return '';
	 }
	 return str;
	}
	
	var workStationName=localStorage.getItem("WORK_STATION_NAME");//工作中心名称
	var workStationVal=localStorage.getItem("WORK_STATION_VAL");//工作中心值
	if(workStationName==null || workStationName==""){	
        var tempWorkStationName=$("#paraMap1_WHL_WORKCENTER_SHOW").val();
        localStorage.setItem("WORK_STATION_NAME",tempWorkStationName);
	}else{
	    $("#paraMap1_WHL_WORKCENTER_SHOW").val(workStationName);
	}
	if(workStationVal==null || workStationVal==""){	
        var tempWorkStationVal=$("#paraMap1_WHL_WORKCENTER").val();
        localStorage.setItem("WORK_STATION_NAME",tempWorkStationVal);
	}else{
	    $("#paraMap1_WHL_WORKCENTER").val(workStationVal);
	}
	function changeVal(){
	    //alert ("The new content1: " + event.target.value);
        //var newContent=event.target.value;
        //alert("bbb");
	    localStorage.removeItem("WORK_STATION_NAME");
 		localStorage.removeItem("WORK_STATION_VAL");
 		
 		var tempWorkStationName=$("#paraMap1_WHL_WORKCENTER_SHOW").val();
 		var tempWorkStationVal=$("#paraMap1_WHL_WORKCENTER").val();
 		
 		//console.log(tempWorkStationName);
 		//console.log(tempWorkStationVal);
 		localStorage.setItem("WORK_STATION_NAME",tempWorkStationName);
 		localStorage.setItem("WORK_STATION_VAL",tempWorkStationVal);
	}
	
	var tempStr=$("#itemTable tbody tr:eq(0)").find("td:eq(3)").find("img");
	//console.log(tempStr);
	
	//输入产品SN 按回车键
	$("#paraMap1_WT_SN_SHOW").keydown(function(event){
	    if(event.keyCode == 13){
	        var sn=$.trim($("#paraMap1_WT_SN").val());
	        queryErrorList(sn,'check');
	    }
	});
	var pcbViewer;
	$(function(){
	    $('#paraMap1_WT_SN_SHOW').next("img").css("left","215px");
	    $('#paraMap1_WT_MO_NUMBER').attr("disabled",false);
	    $('#paraMap1_WT_MO_NUMBER').attr("readonly","readonly");
	    $('#paraMap1_WT_MODEL_CODE').attr("disabled",false);
	    $('#paraMap1_WT_MODEL_CODE').attr("readonly","readonly");
	    
	    pcbViewer=new PcbViewerMulti();
        pcbViewer.Tag=$('.div_draw')
        pcbViewer.topDivId='divPcbTop';
        pcbViewer.botDivId='divPcbBot';
        pcbViewer.btnClickEvent=function(){
            pcbViewer.drawLocations([],$('.div_draw .btn.checked').attr('_face'));
        }
        pcbViewer.show();
        $('.draw').height(($(window).height()-130)/2);
        $('.img').height(($(window).height()-130)/2);
        
        
        $('#paraMap1_WHL_WORKCENTER').val(localStorage.handWorkCenterVal);
        $('#paraMap1_WHL_WORKCENTER_SHOW').val(localStorage.handWorkCenterName);
        $('#_PRODUCT_STEP').val(localStorage.handProductStep); 
        $('#_GROUP_CODE').val(localStorage.handGroupCode);
        $('#paraMap1_WT_SN_SHOW').next().remove();
        var image = document.getElementById("error_img");   
        if (image.addEventListener) {   
            // IE9, Chrome, Safari, Opera   
            image.addEventListener("mousewheel", MouseWheelHandler, false);   
            // Firefox   
            image.addEventListener("DOMMouseScroll", MouseWheelHandler, false);   
        }   
        // IE 6/7/8   
        else image.attachEvent("onmousewheel", MouseWheelHandler);  
        var sn=getParam('sn');
        if(sn!=undefined&&sn!=''&&sn!='undefined'){
            $("#paraMap1_WT_SN").val(sn);
            $("#paraMap1_WT_SN_SHOW").val(sn);
    	    queryErrorList(sn,'check');
	    }
	    $('#paraMap1_WHL_WORKCENTER_SHOW').attr('disabled','disabled');
	    $('#paraMap1_WHL_WORKCENTER_SHOW').removeClass('ico-search-input');
        
	});
	
	function MouseWheelHandler(e) {   
	    var image = document.getElementById("error_img");  
        // cross-browser wheel delta   
        var e = window.event || e; // old IE support   
        var delta = Math.max(-1, Math.min(1, (e.wheelDelta || -e.detail)));   
        image.style.width = Math.max(50, Math.min(800, image.width + (30 * delta))) + "px";   
        return false;   
    } 
    /**
     * 获取指定的URL参数值
     * URL:http://www.quwan.com/index?name=tyler
     * 参数：paramName URL参数
     * 调用方法:getParam("name")
     * 返回值:tyler
     */
    function getParam(paramName) {
        paramValue = "", isFound = !1;
        if (this.location.search.indexOf("?") == 0 && this.location.search.indexOf("=") > 1) {
            arrSource = unescape(this.location.search).substring(1, this.location.search.length).split("&"), i = 0;
            while (i < arrSource.length && !isFound) arrSource[i].indexOf("=") > 0 && arrSource[i].split("=")[0].toLowerCase() == paramName.toLowerCase() && (paramValue = arrSource[i].split("=")[1], isFound = !0), i++
        }
        return paramValue == "" && (paramValue = null), paramValue
    }
    function lowerJSONKey(jsonArr){
	    $.each(jsonArr,function(n,jsonObj){	 
            for (var key in jsonObj){
                jsonObj[key.toLowerCase()] = jsonObj[key];
                delete(jsonObj[key]);
            } 
	    });
        return jsonArr;
    } 
    function saveStorage(val,MKEY){
        
    }
    function showMessage(){
        
    }
</script>
<bu:script viewId="1ec3e077d11f4893a408cd72c9c311b1" />
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	
	<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll','.head');
    setPopScroll('.scroll2','.head2');
    setPopScroll('.scroll3','.head3');
  })
})(jQuery)</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>