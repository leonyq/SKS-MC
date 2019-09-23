<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
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
	<!-- head里面 -->
	<script type="text/javascript">
	    var trrCount = 0;
		function popItemDiv(showId, backId) {
		    $("#WSO_OUT_TYPE2").attr("disabled",true);
		    $("#WSO_OUT_TYPE2").attr("disabled",true);
	        $("#paraMap1_WSO_ITEM_CODE_SHOW").val("");
	        $("#paraMap1_WSO_ITEM_CODE").val("");
	        $("#paraMap1_WSO_ITEM_NAME").val("");
	        $("#paraMap1_WSO_ITEM_SPEC").val("");
	        $("#paraMap1_WSI_ITEM_SN").val("");
	        $("#paraMap1_WSO_ITEM_NUM").val("");
	        $("#WSO_MEMO2").val("");
		    var addType=$("#paraMap1_WSO_OUT_TYPE").val();
		    if(addType==""){
		        utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请选择领料类型" />", 0, "260", "");
				return;
		    }else{
    			$("#" + showId + ",#" + backId).show();
    			$("#" + showId).draggable();
    			$("#WSO_OUT_TYPE2_chosen").css("width","230");
    			$("#WSO_OUT_TYPE2").find("option[value='"+addType+"']").attr("selected",true);
			    $("#WSO_OUT_TYPE2").trigger("chosen:updated");
			    $("#WSO_OUT_TYPE2").attr("disabled",true);
			    if(addType==1){
        	        //个体
        	        $("#WSO_OUT_TYPE2").attr("disabled",true);
        	        $("#paraMap1_WSO_ITEM_CODE_SHOW").val("");
        	        $("#paraMap1_WSO_ITEM_CODE").val("");
        	        $("#paraMap1_WSO_ITEM_NAME").val("");
        	        $("#paraMap1_WSO_ITEM_SPEC").val("");
        	        $("#paraMap1_WSO_STOCK_NUM").val("");
        	        $("#paraMap1_WSO_ITEM_CODE_SHOW").attr("disabled",true);
        	        $("#paraMap1_WSI_ITEM_SN").attr("disabled",false);
        	        $("#paraMap1_WSI_ITEM_SN").attr("placeholder","请输入物料SN,按Enter键");
        	    }else if(addType==2){
        	        //批量
        	        $("#WSO_OUT_TYPE2").attr("disabled",true);
        	        $("#paraMap1_WSI_ITEM_SN").val("");
        	        $("#paraMap1_WSO_ITEM_CODE_SHOW").attr("disabled",false);
        	        $("#paraMap1_WSI_ITEM_SN").attr("disabled",true);
        	        $("#paraMap1_WSI_ITEM_SN").attr("placeholder","");
        	        $("#paraMap1_WSO_ITEM_CODE").val("");
        	        $("#paraMap1_WSO_ITEM_NAME").val("");
        	        $("#paraMap1_WSO_ITEM_SPEC").val("");
        	        $("#paraMap1_WSO_STOCK_NUM").val("");
        	    }
            }
		}

		function hideDiv(showId, backId) {
			$("#" + showId + ",#" + backId).hide();
			closeDivFp(showId + "pop");
		}
		
		//点击行寄选中该行
		function clickTr(tableId) {
			$("#" + tableId + " tr").unbind("click");
			$("#" + tableId + " tr input[type=checkbox]").unbind("click");
			$("#" + tableId + " tr").on("click", function(e) {
				var trId = $(this).attr("id");
				if($("#" + trId + " :checkbox").attr("checked")) {
					$("#" + trId + " :checkbox").prop("checked", false);
					$("#" + trId).css("background-color", "");
				} else {
					$("#" + tableId + " input[type='checkbox']").each(function() {
						if($(this).attr("checked")) {
							$(this).prop("checked", false);
							$(this).parents("tr").css("background-color", "");
						}
					});
					$("#" + trId + " :checkbox").prop("checked", true);
					$("#" + trId).css("background-color", "#a0c8e5");
				}
			});

			$("#" + tableId + " tr input[type=checkbox]").click(function(e) {
				e.stopPropagation();
				var style = $(this).parents("tr").attr("style");
				if(style && style.indexOf("background-color") > -1) {
					$(this).parents("tr").css("background-color", "");
				} else {
					$(this).parents("tr").css("background-color", "#a0c8e5");
				}
			});
		}
	</script>
</head>
<body>
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
					target="submitFrame">
            <div class="hd">
            	
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;">
                <div style="display:none;" class="save-close" <dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
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
			        <button type="button" onclick="saveInfo();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="24e721d28d3f46758e022d1e6d147782" type="add" />
		<div class="mod">
		<div class="mod-hd">
				<h3 class="tit"><dict:lang value="基本信息" /></h3>
			</div>
	<table class="basic-table" >
	<input type="hidden" id ="curUser" name="curUser" value=<s:property value='%{#session[@com.more.fw.core.common.method.ConstantsMc@SESSION_USERDTO_KEY].name}'/>
	<input type="hidden" name="formIds" value="24e721d28d3f46758e022d1e6d147782" />
	<input type="hidden" name="24e721d28d3f46758e022d1e6d147782" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'d9bcec419bee448f8395d40ecdb7dc4f'" />
		<s:set name="_$formId_1" value="'24e721d28d3f46758e022d1e6d147782'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" style="width:72px;"/><span class="dot">*</span><bu:uitn colNo="WSO_DOC_NUM" formId="24e721d28d3f46758e022d1e6d147782" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="WSO_DOC_NUM" formId="24e721d28d3f46758e022d1e6d147782" ><bu:ui disabled="disabled" style="width:200px;" colNo="WSO_DOC_NUM" formId="24e721d28d3f46758e022d1e6d147782" value="%{WSO_DOC_NUM}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:72px;"/><bu:uitn colNo="WSO_OUT_TYPE" formId="24e721d28d3f46758e022d1e6d147782" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="WSO_OUT_TYPE" formId="24e721d28d3f46758e022d1e6d147782" ><bu:ui style="width:200px;" colNo="WSO_OUT_TYPE" formId="24e721d28d3f46758e022d1e6d147782" value="%{WSO_OUT_TYPE}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:72px;"/><bu:uitn colNo="WSO_DEPT" formId="24e721d28d3f46758e022d1e6d147782" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="WSO_DEPT" formId="24e721d28d3f46758e022d1e6d147782" ><bu:ui style="width:200px;" colNo="WSO_DEPT" formId="24e721d28d3f46758e022d1e6d147782" value="%{WSO_DEPT}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" style="width:72px;"/><bu:uitn colNo="WSI_OUT_EMP" formId="24e721d28d3f46758e022d1e6d147782" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="WSI_OUT_EMP" formId="24e721d28d3f46758e022d1e6d147782" ><bu:ui disabled="disabled" style="width:200px;" colNo="WSI_OUT_EMP" formId="24e721d28d3f46758e022d1e6d147782" value="%{WSI_OUT_EMP}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WSO_MEMO" formId="24e721d28d3f46758e022d1e6d147782" /></td>
			<bu:td cssClass="dec"  style="height:80px;" colspan="5" colNo="WSO_MEMO" formId="24e721d28d3f46758e022d1e6d147782" ><bu:ui colNo="WSO_MEMO" style="height:80px;width:100%" formId="24e721d28d3f46758e022d1e6d147782" value="%{WSO_MEMO}" formIndex="1" /></bu:td>
		</tr>
	</table>
	<div class="mod-hd">
				<h3 class="tit"><dict:lang value="明细信息" /></h3>
					<div class="extend-btn" id="addDel" style="float: right;margin-top:14px;margin-bottom:5px;">
				<button type="button" onclick="popItemDiv('addItem','backItem');" style="padding:0;" title="">
					<i class="ico ico-kl-new-add ico-small"></i>
				</button>
				<button type="button" onclick="delRow();" style="padding:0" title="删除">
					<i class="ico ico-sc-new-add ico-small"></i>
				</button>
			</div>
			</div>
		
			<div class="mod">
				<div class="mod-bd" style="margin-top:5px;border-bottom: none;">
					<div class="panel datagrid datagrid-div1">
						<div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view">
							<div class="datagrid-header" style="">
								<div class="datagrid-header-inner" style="width:100%;" >
									<table class="datagrid-htable fixedTable  " id="datagrid-htable" style="width:1050px;">
										<tbody>
											<tr class="datagrid-header-row datagrid-title-ajax">
												<td class="datagrid-cell" style="width:30px;"></td>
												<td class="datagrid-cell" style="width:30px;">
													<input type="checkbox" id="allSelects" name="allSelect" onchange="getAllItem();" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="物料SN" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="物料料号" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="物料名称" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="物料规格" />
												</td>
												<td class="datagrid-cell" style="width:80px;">
													<dict:lang value="库存数量" />
												</td>
												<td class="datagrid-cell" style="width:80px;">
													<dict:lang value="领用数量" />
												</td>
												<td class="datagrid-cell" style="width:135px;">
													<dict:lang value="生产日期" />
												</td>
												<td class="datagrid-cell" style="width:135px;">
													<dict:lang value="入库时间" />
												</td>
												<td class="datagrid-cell">
													<dict:lang value="入库人" />
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="datagrid-body datagrid-div3 scroll" style="height:150px;">
								<table class="dlist-table table-line" style="width:1050px;table-layout:fixed;" id="itemInfo"> <!--table-layout:fixed;-->
									<tbody id="addItemInfo">
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="backItem" class="dialog-mask" style="z-index:1029px;" /></div>
	<div class="dialog dialog-s1" id="addItem" style="display:none;z-index:1030;margin-left:0px;left:120px;top:68px;width:660px;height:280px;">
		<div class="dialog-hd">
			<h3 class="tit">
			<dict:lang value="选择明细信息" />
			</h3>
		</div>
		<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addItem','backItem');"></a>
		<div class="dialog-bd-div" style="width:100%;height:120%;">
			<div class="optn optn_div">
				<button type="button" onclick="addItemList('addItem','backItem');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv('addItem','backItem');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
			</div>

			<table class="basic-table">
				<tr>
        			<td  class="name" style="width:68px;"/><bu:uitn colNo="WSO_OUT_TYPE" formId="24e721d28d3f46758e022d1e6d147782" /></td>
        			<bu:td style="width:200px;" cssClass="dec" colNo="WSO_OUT_TYPE" formId="24e721d28d3f46758e022d1e6d147782" ><bu:ui style="width:230px;" id="WSO_OUT_TYPE2" colNo="WSO_OUT_TYPE" formId="24e721d28d3f46758e022d1e6d147782" value="%{WSO_OUT_TYPE}" formIndex="1" /></bu:td>
        			<td  class="name" style="width:68px;" /><span class="dot">*</span><bu:uitn colNo="WSI_ITEM_SN" formId="ad49e8673c8d474d9f926b899bed9a9d" /></td>
        			<bu:td style="width:200px;" cssClass="dec"  colNo="WSI_ITEM_SN" formId="ad49e8673c8d474d9f926b899bed9a9d" ><bu:ui colNo="WSI_ITEM_SN" formId="ad49e8673c8d474d9f926b899bed9a9d" value="%{WSI_ITEM_SN}" formIndex="1" /></bu:td>
        		</tr>
        		<tr>
        			<td  class="name" style="width:68px;"/><span class="dot">*</span><bu:uitn colNo="WSO_ITEM_CODE" formId="24e721d28d3f46758e022d1e6d147782" /></td>
        			<bu:td style="width:200px;" cssClass="dec" colNo="WSO_ITEM_CODE" formId="24e721d28d3f46758e022d1e6d147782" ><bu:ui colNo="WSO_ITEM_CODE" formId="24e721d28d3f46758e022d1e6d147782" value="%{WSO_ITEM_CODE}" formIndex="1" /></bu:td>
        			
        			
        			<td  class="name" style="width:68px;" /><bu:uitn colNo="WSO_STOCK_NUM" formId="24e721d28d3f46758e022d1e6d147782" /></td>
        			<bu:td style="width:200px;" cssClass="dec"  colNo="WSO_STOCK_NUM" formId="24e721d28d3f46758e022d1e6d147782" ><bu:ui colNo="WSO_STOCK_NUM" formId="24e721d28d3f46758e022d1e6d147782" value="%{WSO_ITEM_NUM}" formIndex="1" /></bu:td>
        		</tr>
        		<tr>
        			<td  class="name" style="width:68px;"/><bu:uitn colNo="WSO_ITEM_NAME" formId="24e721d28d3f46758e022d1e6d147782" /></td>
        			<bu:td  colNo="WSO_ITEM_NAME" cssClass="dec" formId="24e721d28d3f46758e022d1e6d147782" ><bu:ui colNo="WSO_ITEM_NAME" formId="24e721d28d3f46758e022d1e6d147782" value="%{WSO_ITEM_NAME}" formIndex="1" /></bu:td>
        		
        			<td class="name" style="width:68px;"/><bu:uitn colNo="WSO_ITEM_SPEC" formId="24e721d28d3f46758e022d1e6d147782" /></td>
        			<bu:td  colNo="WSO_ITEM_SPEC" cssClass="dec" formId="24e721d28d3f46758e022d1e6d147782" ><bu:ui colNo="WSO_ITEM_SPEC" formId="24e721d28d3f46758e022d1e6d147782" value="%{WSO_ITEM_SPEC}" formIndex="1" /></bu:td>
        		</tr>
        		<tr>
        			<td  class="name" style="width:68px;" /><span class="dot">*</span><bu:uitn colNo="WSO_ITEM_NUM" formId="24e721d28d3f46758e022d1e6d147782" /></td>
        			<bu:td style="width:200px;" cssClass="dec"  colNo="WSO_ITEM_NUM" formId="24e721d28d3f46758e022d1e6d147782" ><bu:ui colNo="WSO_ITEM_NUM" formId="24e721d28d3f46758e022d1e6d147782" value="%{WSO_ITEM_NUM}" formIndex="1" /></bu:td>
        		</tr>
        		<tr>
        			<td  class="name" style="width:68px;"/><bu:uitn colNo="WSO_MEMO" formId="24e721d28d3f46758e022d1e6d147782" /></td>
        			<bu:td  colNo="WSO_MEMO" cssClass="dec" formId="24e721d28d3f46758e022d1e6d147782"  colspan="3"><bu:ui style="height:80px;width:567px;" id="WSO_MEMO2" colNo="WSO_MEMO" formId="24e721d28d3f46758e022d1e6d147782" value="%{WSO_MEMO}" formIndex="1" /></bu:td>
        		</tr>
			</table>
		</div>

	</div>
	
			<bu:jsVal formId="24e721d28d3f46758e022d1e6d147782" formIndex="1" />
				
			</div>
		 </form>
	</div>
    <script type="text/javascript">								
        	        
        $("#paraMap1_WSI_ITEM_SN").keydown(function(event){
　　　　			if(event.keyCode == 13){
　　　　　　		var itemSn = $("#paraMap1_WSI_ITEM_SN").val();
　　　　　　		if(itemSn!=""){
　　　　　　		    var url="${path}buss/bussModel_exeFunc.ms?funcMId=8b052dadedeb4237b4fe02d2791cac16&formId=%{formId}";
    			        jQuery.ajax({
    			 			type: "POST",
    			 	   		dataType: "json",
    			 	    	url: url+"&itemSn="+itemSn,
    			 			success: function(data){
    			 				var dataMap=data.ajaxMap;
    			 				if(dataMap.FLAG=="FALSE"){
    			 				    utilsFp.confirmIcon(3,"","","", "物料SN不存在,请更换",0,"","");
    			 				    $("#paraMap1_WSI_ITEM_SN").val("");
                        	        $("#paraMap1_WSO_ITEM_CODE_SHOW").val("");
                        	        $("#paraMap1_WSO_ITEM_CODE").val("");
                        	        $("#paraMap1_WSO_ITEM_NAME").val("");
                        	        $("#paraMap1_WSO_ITEM_SPEC").val("");
	                                $("#paraMap1_WSO_ITEM_SPEC").val("");
                                    $("#paraMap1_WSI_ITEM_SN").focus();
                                    return;
    			 				}else{
                        	        $("#paraMap1_WSO_ITEM_CODE_SHOW").val(dataMap.ITEM_CODE);
                        	        $("#paraMap1_WSO_ITEM_CODE").val(dataMap.ITEM_CODE);
                        	        $("#paraMap1_WSO_ITEM_NAME").val(dataMap.ITEM_NAME);
                        	        $("#paraMap1_WSO_ITEM_SPEC").val(dataMap.ITEM_SPEC);
                        	        $("#paraMap1_WSO_STOCK_NUM").val(dataMap.STOCK_NUM);
    			 				}
    			 			},
    			 			error: function(XMLHttpRequest, textStatus, errorThrown){
    			 				util.closeLoading();
    			 				var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
    			 				if (null != sessionstatus && sessionstatus == "noAuthority") {
    			 				}else{
    			 			}
    			 	  }
    			});
　　　　	}
　　　　}
　　});        	

        $("#paraMap1_WSO_OUT_TYPE").change(function(){
    	    var addType=$(this).val();
    	    if(addType==1){
    	        //个体
    	        $("#addItemInfo").empty();
    	    }else if(addType==2){
    	        //批量
    	        $("#addItemInfo").empty();
    	    }
    	});
        $(function() {
			 $("#paraMap1_WSI_OUT_EMP").val($("#curUser").val());
			 
		})
	    function delRow() {
		    var flag=false;
			$("#itemInfo :checkbox").each(function() {
				if($(this).attr("checked")) {
					var trid = $(this).parent().parent().attr("id");

					$("#" + trid).remove();flag=true;
				}
			});
			if(flag==false){
				utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请添加明细信息" />", 0, "260", "");
				return;
			}
			reSort("itemInfo");
			var tableTrJs = $("#itemInfo tbody tr");
			_tongLineColor(tableTrJs);
			clickTr('itemInfo');
		}
		//重新排序
		function reSort(objid) {

			var i = 1;
			$("#" + objid + " tbody tr").each(function() {

				$(this).find("td").eq(0).text(i);

				i++;
			});
		}
		//全选
		function getAllItem() {
			if($("#allSelects").attr("checked") == "checked") {
				$("#addItemInfo :checkbox").attr("checked", true);
			} else {
				$("#addItemInfo :checkbox").each(function() {
					$(this).attr("checked", false);
				});
			}
		}
		function addItemList(showId, backId) {
    		
		    var addType=$("#paraMap1_WSO_OUT_TYPE").val();
		    if(addType=="1"){
		        if($("#paraMap1_WSI_ITEM_SN").val()==""){
    	            _alertValMsg($("#paraMap1_WSI_ITEM_SN"), "<dict:lang value="该项不能为空" />");
    	    	    return;
	            }
		    }else if(addType=="2"){
		        if($("#paraMap1_WSO_ITEM_CODE").val()==""){
    	            _alertValMsg($("#paraMap1_WSO_ITEM_CODE_SHOW"), "<dict:lang value="该项不能为空" />");
    	    	    return;
                }
		    }
		    if($("#paraMap1_WSO_ITEM_NUM").val()==""){
    	        _alertValMsg($("#paraMap1_WSO_ITEM_NUM"), "<dict:lang value="该项不能为空" />");
    	    	return;
    	    }else{
    	        if(!/^\+?[1-9][0-9]*$/.test($("#paraMap1_WSO_ITEM_NUM").val())) {
    				_alertValMsg($('#paraMap1_WSO_ITEM_NUM'), "<dict:lang value="该项只能为正整数" />");
    				return;
    			}
    	    }
    	    var addType=$("#paraMap1_WSO_OUT_TYPE").val();
    	    var itemCode=$("#paraMap1_WSO_ITEM_CODE").val();
    	    var itemSn=$("#paraMap1_WSI_ITEM_SN").val();
    	    var itemNum=$("#paraMap1_WSO_ITEM_NUM").val();
		    util.showLoading("处理中...");
			$.ajax({
				type: "POST",
				dataType: "json",
				url: "buss/bussModel_exeFunc.ms?funcMId=ca207dc932e74f9393ddb452057f9c5d&addType="+addType+"&itemCode="+itemCode+"&itemSn="+itemSn+"&itemNum="+itemNum,
				data: "" ,
				success: function(data) {
					util.closeLoading();
					var dataMap=data.ajaxMap;
					if(dataMap.FLAG=="FALSE"){
					  	var msg=dataMap.VALUE;
					    //utilsFp.confirmIcon(3, "", "", "", "<dict:lang value='"+msg+"' />", 0, "260", "");
					    if(msg=="领用数量不能大于库存数量"){
					        utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="领用数量不能大于库存数量" />", 0, "260", "");
					    }else{
					        utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="物料不存在，请更换" />", 0, "260", "");
					    }
					    
				        return;
					}else{
    					if(null != data.ajaxList) {
    						var rccList = data.ajaxList;
    						for(var i = 0; i < rccList.length; i++) {
    						    var tempNum=$("#paraMap1_WSO_ITEM_NUM").val();
    						    var productDate=rccList[i].WSI_RECEIVE_TIME; 
    						    var productDate2=rccList[i].WSI_PRODUCE_DATE; 
    							if(rccList[i].WSI_ITEM_SN == null) rccList[i].WSI_ITEM_SN = "";
    							if(rccList[i].WSI_ITEM_CODE == null) rccList[i].WSI_ITEM_CODE = "";
    							if(rccList[i].CI_ITEM_NAME == null) rccList[i].CI_ITEM_NAME = "";
    							if(rccList[i].CI_ITEM_SPEC == null) rccList[i].CI_ITEM_SPEC = "";
    							if(rccList[i].WSI_ITEM_NUM == null) rccList[i].WSI_ITEM_NUM = "0";
    							if(rccList[i].WST_SINGLE_NUM == null) rccList[i].WST_SINGLE_NUM = "0";
    							if(rccList[i].WST_STOCK_NUM == null) rccList[i].WST_STOCK_NUM = "0";
    							if(productDate == null) {productDate = ""}
    							else{
    							    productDate = productDate.replace(/T/," ");
    							};
    							if(productDate2 == null) {productDate2 = ""}
    							else{
    							    productDate2 = productDate2.replace(/T/," ");
    							};
    							//if(rccList[i].WSI_PRODUCE_DATE == null) rccList[i].WSI_PRODUCE_DATE = "";
    							if(rccList[i].WSI_RECEIVE_EMP==null) rccList[i].WSI_RECEIVE_EMP="";
    							if(rccList[i].NAME==null) rccList[i].NAME="";
    							//判断物料是否已存在
    							var trs = $("#addItemInfo tr");
    						    var itemCode2=rccList[i].WSI_ITEM_CODE;
    						    var itemSn2=rccList[i].WSI_ITEM_SN;
    						    for(var j=0;j<trs.length;j++){
    						         var tempSn=$.trim($("#addItemInfo tr:eq(" + j + ")").find("td:eq(2)").text());
    						         var tempCode=$.trim($("#addItemInfo tr:eq(" + j + ")").find("td:eq(3)").text());
    						         if(addType=="1"){
    						             //个体
    						             if(tempSn==itemSn2){
        						             utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="物料已存在，请更换" />", 0, "260", "");
    				                         return;
        						         }
    						         }else{
    						             //批量
    						             if(tempCode==itemCode2){
        						             utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="物料已存在，请更换" />", 0, "260", "");
    				                         return;
        						         }
    						         }
    						    }
    						    
    						    var itemNum=parseInt(rccList[i].WSI_ITEM_NUM)-parseInt(tempNum);//个体数量或批量数量
    							var singleNum=parseInt(rccList[i].WST_SINGLE_NUM)-parseInt(tempNum);//个体汇总数量
    							var stockNum=parseInt(rccList[i].WST_STOCK_NUM)-parseInt(tempNum);//库存数量
    							$("#itemInfo tbody:last").append("<tr id='tr1_" + i + "' ></tr>");
    							//console.log(rccList[i].WSI_ITEM_NUM);
    						    //console.log(rccList[i].WST_SINGLE_NUM);
    						    //console.log(rccList[i].WST_STOCK_NUM);
    						    
    							//console.log(tempNum);
    						    //console.log(singleNum);
    						    //console.log(stockNum);
    						    
    							$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + (i+1) + "</td>");
    							$("#itemInfo tr:last").append("<td class='datagrid-cell datgrid-cell-2' style='width:30px;text-align: center;'><input id='" + (i + 1) + "' type='checkbox' name='isSelect1'/></td>");
    							$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:120px;text-align: left;'>" + rccList[i].WSI_ITEM_SN + "<input type='hidden'	 name='ITEM_SN' id='ITEM_SN" + (i + 1) + "' value='" + rccList[i].WSI_ITEM_SN + "'/></td>");
    							$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: left;'>" + rccList[i].WSI_ITEM_CODE + "<input type='hidden' name='ITEM_CODE' id='ITEM_CODE" + (i + 1) + "' value='" + rccList[i].WSI_ITEM_CODE + "'/></td>");
    							$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: left;'>" + rccList[i].CI_ITEM_NAME + "<input type='hidden' name='ITEM_NAME' id='ITEM_NAME" + (i + 1) + "' value='" + rccList[i].CI_ITEM_NAME + "'/></td>");
    							$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:120px;text-align: left;'>" + rccList[i].CI_ITEM_SPEC + "<input type='hidden' name='ITEM_SPEC' id='ITEM_SPEC" + (i + 1) + "' value='" + rccList[i].CI_ITEM_SPEC + "'/></td>");
    							$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:80px;text-align: right;'>" + rccList[i].WSI_ITEM_NUM + "<input type='hidden' name='ITEM_NUM'  id='ITEM_NUM" + (i + 1) + "' value='" + rccList[i].WSI_ITEM_NUM + "'/></td>");
    							$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:80px;text-align: right;'>"+tempNum+"<input type='hidden' id='USE_NUM" + (i + 1) + "' name='USE_NUM' value='" + tempNum + "'/></td>");
    							$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:135px;text-align: right;'>"+productDate2+"<input type='hidden' id='PRODUCT_DATE" + (i + 1) + "' name='PRODUCT_DATE' value='" + rccList[i].WSI_PRODUCE_DATE + "'/></td>");
    							$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:135px;text-align: center;'>"+productDate+"<input type='hidden' id='RECEIVE_TIME" + (i + 1) + "' value='" + productDate + "'/></td>");
    						    $("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='text-align: center;'>"+rccList[i].NAME+"<input type='hidden' id='MIN_PACK" + (i + 1) + "' value='" + rccList[i].NAME + "'/></td>");
    						    								
                                $("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='display:none;width:80px;text-align: right;'>"+itemNum+"<input type='hidden' id='SINGLE_ITEM_NUM" + (i + 1) + "' name='SINGLE_ITEM_NUM' value='" + itemNum + "'/></td>");	
                                $("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='display:none;width:80px;text-align: right;'>"+singleNum+"<input type='hidden' id='SINGLE_NUM" + (i + 1) + "' name='SINGLE_NUM' value='" + singleNum + "'/></td>");	
                                $("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='display:none;width:80px;text-align: right;'>"+stockNum+"<input type='hidden' id='STOCK_NUM" + (i + 1) + "' name='STOCK_NUM' value='" + stockNum + "'/></td>");
    						    
    						}
    					}
    					var tableTrJs = $("#itemInfo tbody tr");
    					_tongLineColor(tableTrJs);
    					clickTr('itemInfo');
    					if(addType==1){
                	        //个体
                	        $("#WSO_OUT_TYPE2").attr("disabled",true);
                	        $("#paraMap1_WSO_ITEM_CODE_SHOW").val("");
                	        $("#paraMap1_WSO_ITEM_CODE").val("");
                	        $("#paraMap1_WSO_ITEM_NAME").val("");
                	        $("#paraMap1_WSO_ITEM_SPEC").val("");
                	        $("#paraMap1_WSO_STOCK_NUM").val("");
                	        $("#paraMap1_WSO_ITEM_CODE_SHOW").attr("disabled",true);
                	        $("#paraMap1_WSI_ITEM_SN").attr("disabled",false);
                	        $("#paraMap1_WSI_ITEM_SN").attr("placeholder","请输入物料SN,按Enter键");
                	        $("#paraMap1_WSO_ITEM_NUM").val("");
                	        $("#paraMap1_WSI_ITEM_SN").val("");
                	        
                	    }else if(addType==2){
                	        //批量
                	        $("#WSO_OUT_TYPE2").attr("disabled",true);
                	        $("#paraMap1_WSI_ITEM_SN").val("");
                	        $("#paraMap1_WSO_ITEM_CODE_SHOW").attr("disabled",false);
                	        $("#paraMap1_WSI_ITEM_SN").attr("disabled",true);
                	        $("#paraMap1_WSI_ITEM_SN").attr("placeholder","");
                	        $("#paraMap1_WSO_ITEM_CODE").val("");
                	        $("#paraMap1_WSO_ITEM_NAME").val("");
                	        $("#paraMap1_WSO_ITEM_SPEC").val("");
                	        $("#paraMap1_WSO_STOCK_NUM").val("");
                	        $("#paraMap1_WSO_ITEM_NUM").val("");
                	        $("#paraMap1_WSO_ITEM_CODE").val("");
                	        $("#paraMap1_WSO_ITEM_CODE_SHOW").val("");
                	    }
                    }
				}//,
				//error: function(msg) {
					//util.closeLoading();
					//utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "300", "");
				//}
			});
			reSort("itemInfo");
			
			hideDiv(showId, backId);
			
		}
		function saveInfo(){
		    if($("#deptLs_data_auth").val()==""){
                _alertValMsg($("#deptLs_data_auth_chosen"), "<dict:lang value="该项不能为空" />");
    	    	return;
            }
    	    var tableLength = $("#addItemInfo tr").length;
    	    //console.log(tableLength);
    	    if(tableLength==0){
    	        utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请添加明细信息" />", 0, "260", "");
				return;
    	    }
            document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=32d88e43062146228c4df183a337ec6e";
            document.forms.addForm.submit();
    	}
    </script>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<script>(function($){
  $(window).on('load',function(){
   setPopScroll('.scroll','.datagrid-header-inner');
  })
})(jQuery)</script>
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>


