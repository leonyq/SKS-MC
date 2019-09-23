<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="修改" /></title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
    <script type="text/javascript">
	    var trrCount = 0;
		function popItemDiv(showId, backId) {
		    $("#CDF_OUT_TYPE_chosen").css("width","230");				
            $("#paraMapObj_CDF_ITEM_NAME").css("background-color","#EBEBE4");
    	    $("#paraMapObj_CDF_ITEM_SPEC").css("background-color","#EBEBE4");
    	    
    	   // var selectTypeValue = document.getElementById("CDF_OUT_TYPE");
    	   //selectTypeValue.options[0].selected = true;  
    	    $("#CDF_OUT_TYPE").find("option[value='']").attr("selected",true);
 			$("#CDF_OUT_TYPE").trigger("chosen:updated");
    	    
              
    	    $("#paraMapObj_CDF_ITEM_LIST").val("");
	        $("#paraMapObj_CDF_ITEM_CODE_SHOW").val("");
	        $("#paraMapObj_CDF_ITEM_CODE").val("");
	        $("#paraMapObj_CDF_ITEM_NAME").val("");
	        $("#paraMapObj_CDF_ITEM_SPEC").val("");
	        $("#paraMapObj_CDF_ITEM_NUM").val("");
	        $("#paraMapObj_CDF_ITEM_CODE_SHOW").attr("disabled",true);
	        $("#paraMapObj_CDF_ITEM_SN").attr("disabled",true);
	        //$("#paraMapObj_CDF_ITEM_SN").attr("placeholder","请输入物料SN,按Enter键");
	        $("#paraMapObj_CDF_ITEM_SN").val("");
		    $("#" + showId + ",#" + backId).show();
			$("#" + showId).draggable();
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
    
<style type="text/css">
.input {
	/*width:200px !important;*/
}

  
       .maskdiv{
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
        }    
  	
</style>
<script type="text/javascript">
//把禁用的数据塞到隐藏域中
function setHid(){
$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<input name='CD_DEVICE_TYPE' type='hidden' value='"+$("#paraMapObj_CD_DEVICE_TYPE").val()+"'>");
$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<input name='CD_DEVICE_CLASS' type='hidden' value='"+$("#paraMapObj_CD_DEVICE_CLASS").val()+"'>");
$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<input name='CD_USE_DEP' type='hidden' value='"+$("#paraMapObj_CD_USE_DEP").val()+"'>");
}
</script>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include> 
</head>
<body>
	<div class="edit">
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
                <div style="margin-left:10px;">
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
			    	        <button type="button" onclick="editCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd" style="height:534px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="99338dfb95df4eec8d5714a4e773b127" type="edit" />
<div class="mod">
<div class="mod-hd">		
  <h3 class="tit"><dict:lang value="基本信息" /></h3>	
  </div>
	<table class="basic-table" >
	<input type="hidden" id="selCount" name="selCount" value="0" />
	<input type="hidden" name="formIds" value="99338dfb95df4eec8d5714a4e773b127" />
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<input type="hidden" name="99338dfb95df4eec8d5714a4e773b127" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'1a77b8c63a864d7ea42a2a99fe1b3604'" />
		<s:set name="_$formId_1" value="'99338dfb95df4eec8d5714a4e773b127'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" /><bu:uitn colNo="CD_DEVICE_TYPE" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec"  colNo="CD_DEVICE_TYPE" formId="99338dfb95df4eec8d5714a4e773b127" ><bu:ui colNo="CD_DEVICE_TYPE" style="width:200px;" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="CD_DEVICE_SN" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec" colNo="CD_DEVICE_SN" formId="99338dfb95df4eec8d5714a4e773b127" ><bu:ui colNo="CD_DEVICE_SN" style="width:200px;" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" readonly="readonly" /></bu:td>
			
			<td class="name"/><bu:uitn colNo="CD_DEVICE_CLASS" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="CD_DEVICE_CLASS" formId="99338dfb95df4eec8d5714a4e773b127" ><bu:ui colNo="CD_DEVICE_CLASS" style="width:200px;" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		</tr>
		<tr>
			<td class="name"/><bu:uitn colNo="CD_USE_DEP" formId="99338dfb95df4eec8d5714a4e773b127" /></td>
			<bu:td cssClass="dec" colNo="CD_USE_DEP" formId="99338dfb95df4eec8d5714a4e773b127" ><bu:ui colNo="CD_USE_DEP" style="width:200px;" formId="99338dfb95df4eec8d5714a4e773b127" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="CDE_REPAIR_REASON" formId="415deefd6f8c4b4397c66b6e77cce579" /></td>
			<bu:td cssClass="dec" colNo="CDE_REPAIR_REASON" formId="415deefd6f8c4b4397c66b6e77cce579" ><bu:ui colNo="CDE_REPAIR_REASON" style="width:200px;" formId="415deefd6f8c4b4397c66b6e77cce579" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CDE_REPAIR_LONG" formId="415deefd6f8c4b4397c66b6e77cce579" /></td>
			<bu:td cssClass="dec" colNo="CDE_REPAIR_LONG" formId="415deefd6f8c4b4397c66b6e77cce579" ><bu:ui colNo="CDE_REPAIR_LONG" style="width:200px;" onkeyup="value=value.replace(/[^\d.]/g,'')" formId="415deefd6f8c4b4397c66b6e77cce579" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CDE_REPAIR_METHOD" formId="415deefd6f8c4b4397c66b6e77cce579" /></td>
			<bu:td cssClass="dec" colNo="CDE_REPAIR_METHOD" formId="415deefd6f8c4b4397c66b6e77cce579" ><bu:ui colNo="CDE_REPAIR_METHOD" style="width:200px;" formId="415deefd6f8c4b4397c66b6e77cce579" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CDE_REPORT_EMP" formId="415deefd6f8c4b4397c66b6e77cce579" /></td>
			<bu:td cssClass="dec" colNo="CDE_REPORT_EMP" formId="415deefd6f8c4b4397c66b6e77cce579" ><bu:ui colNo="CDE_REPORT_EMP" style="width:200px;" formId="415deefd6f8c4b4397c66b6e77cce579" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="CDE_AUDIT_EMP" formId="415deefd6f8c4b4397c66b6e77cce579" /></td>
			<bu:td cssClass="dec" colNo="CDE_AUDIT_EMP" formId="415deefd6f8c4b4397c66b6e77cce579" ><bu:ui colNo="CDE_AUDIT_EMP" style="width:200px;" formId="415deefd6f8c4b4397c66b6e77cce579" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CDE_REPAIR_DESC" formId="415deefd6f8c4b4397c66b6e77cce579" /></td>
			<bu:td cssClass="dec" colNo="CDE_REPAIR_DESC" formId="415deefd6f8c4b4397c66b6e77cce579" style="height:80px;" colspan="5"><bu:ui colNo="CDE_REPAIR_DESC" formId="415deefd6f8c4b4397c66b6e77cce579" style="width: 100%;height: 100%;" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CDE_REPAIR_MEMO" formId="415deefd6f8c4b4397c66b6e77cce579" /></td>
			<bu:td cssClass="dec" colNo="CDE_REPAIR_MEMO" formId="415deefd6f8c4b4397c66b6e77cce579" style="height:80px;" colspan="5"><bu:ui colNo="CDE_REPAIR_MEMO" formId="415deefd6f8c4b4397c66b6e77cce579" style="width: 100%;height: 100%;" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
			
	</table>
	        
    	    <div class="mod-hd">		
                <h3 class="tit"><dict:lang value="备件信息" /></h3>	
                <div class="extend-btn" id="addDel" style="float: right;margin-top:5px;margin-bottom:5px;">
    				<button type="button" onclick="popItemDiv('addItem','backItem');" style="padding:0;" title="0">
    					<i class="ico ico-kl-new-add ico-small"></i>
    				</button>
    				<button type="button" onclick="delRow();" style="padding:0" title="删除">
    					<i class="ico ico-sc-new-add ico-small"></i>
    				</button>
    			</div>
            </div>
        	<!--<div class="mod" >
    			<div class="mod-hd" style="height: 25px;margin-top: -5px;"> 
    					<div class="extend-btn" style="float: right;">
    						<button type="button"    onclick="_addRowExtend('37706529238246b884d06623606e4320','1');addCount();"     style="padding:0;" title="<dict:lang value="添加" />">   <i class="ico ico-kl-new-add ico-small"></i>
    						</button>
    						<button type="button" onclick="delMyRowExtend('37706529238246b884d06623606e4320');"     style="padding:0"   title="<dict:lang value="移除" /> " >   <i class="ico ico-sc-new-add ico-small"></i> 
    						</button> 
    					</div>
    			</div>
    			<div class="mod-bd" >
    				<div class="panel datagrid datagrid-div1">
    					<div class="datagrid-div2 datagrid-div6 datagrid-view" style=""  >
    						<div class="datagrid-header" >
    							<div class="datagrid-header-inner" id="datagrid-header-inner37706529238246b884d06623606e4320" >
    								<bu:addSub formid="415deefd6f8c4b4397c66b6e77cce579" formIndex="1"  selfformid="37706529238246b884d06623606e4320" hidecol=""  viewid="" />
    							</div>
    						</div>
    						<div class="datagrid-body datagrid-div3"   style="height:120px;" onscroll="ajaxTableScroll(this,'37706529238246b884d06623606e4320')">
    							<table class="glxb-table fixedTable" style="width:100%"  id="addTable_37706529238246b884d06623606e4320" >
    								<tbody id="tbody_37706529238246b884d06623606e4320" >
    								</tbody>
    							</table>
    						</div>
    					</div>
    				</div>
    			</div>
		   </div>-->
		   
			<div class="mod">
				<div class="mod-bd" style="margin-top:5px;border-bottom: none;">
					<div class="panel datagrid datagrid-div1">
						<div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view">
							<div class="datagrid-header" style="">
								<div class="datagrid-header-inner">
									<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
												<td class="datagrid-cell" style="width:30px;"></td>
												<td class="datagrid-cell" style="width:30px;">
													<input type="checkbox" id="allSelects" name="allSelect" onchange="getAllItem();" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="领料单号" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="备件SN" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="备件料号" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="物料名称" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="物料规格" />
												</td>
												<td class="datagrid-cell" style="width:80px;">
													<dict:lang value="备件数量" />
												</td>
												<td class="datagrid-cell" style="width:135px;">
													<dict:lang value="更换原因" />
												</td>
												<td class="datagrid-cell" style="width:135px;">
													<dict:lang value="备注" />
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="datagrid-body datagrid-div3 scroll" style="height:120px;">
								<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" > <!--table-layout:fixed;-->
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
    	<div class="dialog dialog-s1" id="addItem" style="display:none;z-index:1030;margin-left:0px;left:120px;top:68px;width:660px;height:220px;">
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
            			<td  class="name" style="width:68px;"/><bu:uitn colNo="CDF_OUT_TYPE" formId="37706529238246b884d06623606e4320" /></td>
            			<bu:td style="width:200px;" cssClass="dec" colNo="CDF_OUT_TYPE" formId="37706529238246b884d06623606e4320" ><bu:ui style="width:230px;" id="CDF_OUT_TYPE" colNo="CDF_OUT_TYPE" formId="37706529238246b884d06623606e4320" value="%{CDF_OUT_TYPE}" formIndex="1" /></bu:td>
            			<td  class="name" style="width:68px;" /><span class="dot">*</span><bu:uitn colNo="CDF_ITEM_SN" formId="37706529238246b884d06623606e4320" /></td>
            			<bu:td style="width:200px;" cssClass="dec"  colNo="CDF_ITEM_SN" formId="37706529238246b884d06623606e4320" ><bu:ui colNo="CDF_ITEM_SN" formId="37706529238246b884d06623606e4320" value="%{CDF_ITEM_SN}" formIndex="1" /></bu:td>
            		</tr>
            		<tr>
            			<td  class="name" style="width:68px;"/><span class="dot">*</span><bu:uitn colNo="CDF_ITEM_CODE" formId="37706529238246b884d06623606e4320" /></td>
            			<bu:td style="width:200px;" cssClass="dec" colNo="CDF_ITEM_CODE" formId="37706529238246b884d06623606e4320" ><bu:ui colNo="CDF_ITEM_CODE" formId="37706529238246b884d06623606e4320" value="%{CDF_ITEM_CODE}" formIndex="1" />
            			<div id="maskdiv0"></div>
            			</bu:td>
            			
            			
            			<td  class="name" style="width:68px;" /><span class="dot">*</span><bu:uitn colNo="CDF_ITEM_LIST" formId="37706529238246b884d06623606e4320" /></td>
            			<bu:td style="width:200px;" cssClass="dec"  colNo="CDF_ITEM_LIST" formId="37706529238246b884d06623606e4320" ><bu:ui colNo="CDF_ITEM_LIST" formId="37706529238246b884d06623606e4320"  value="%{CDF_ITEM_LIST}" formIndex="1" />
            			<div id="maskdiv1"></div>
            			</bu:td>
            		</tr>
            		<tr>
            			<td  class="name" style="width:68px;"/><bu:uitn colNo="CDF_ITEM_NAME" formId="37706529238246b884d06623606e4320" /></td>
            			<bu:td  colNo="CDF_ITEM_NAME" cssClass="dec" formId="37706529238246b884d06623606e4320" ><bu:ui colNo="CDF_ITEM_NAME" formId="37706529238246b884d06623606e4320" disabled="disabled" value="%{CDF_ITEM_NAME}" formIndex="1" /></bu:td>
            		
            			<td class="name" style="width:68px;"/><bu:uitn colNo="CDF_ITEM_SPEC" formId="37706529238246b884d06623606e4320" /></td>
            			<bu:td  colNo="CDF_ITEM_SPEC" cssClass="dec" formId="37706529238246b884d06623606e4320" ><bu:ui colNo="CDF_ITEM_SPEC" formId="37706529238246b884d06623606e4320" disabled="disabled" value="%{CDF_ITEM_SPEC}" formIndex="1" /></bu:td>
            		</tr>
            		<tr>
            			<td  class="name" style="width:68px;" /><bu:uitn colNo="CDF_ITEM_NUM" formId="37706529238246b884d06623606e4320" /></td>
            			<bu:td style="width:200px;" cssClass="dec"  colNo="CDF_ITEM_NUM" formId="37706529238246b884d06623606e4320" ><bu:ui colNo="CDF_ITEM_NUM" formId="37706529238246b884d06623606e4320" disabled="disabled" value="%{CDF_ITEM_NUM}" formIndex="1" /></bu:td>
            		</tr>
            		<!--<tr>
            			<td  class="name" style="width:68px;"/><bu:uitn colNo="CDF_MEMO" formId="37706529238246b884d06623606e4320" /></td>
            			<bu:td  colNo="CDF_MEMO" cssClass="dec" formId="37706529238246b884d06623606e4320"  colspan="3"><bu:ui style="height:80px;width:567px;" id="CDF_MEMO2" colNo="CDF_MEMO" formId="37706529238246b884d06623606e4320" value="%{CDF_MEMO}" formIndex="1" /></bu:td>
            		</tr>-->
    			</table>
    		</div>
    
    	</div>
			<bu:jsVal formId="99338dfb95df4eec8d5714a4e773b127" formIndex="1" />
									
			</div>
	</form>	
	</div>
<bu:script viewId="1a77b8c63a864d7ea42a2a99fe1b3604" />
<bu:submit viewId="1a77b8c63a864d7ea42a2a99fe1b3604" />
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	
	
	<script type="text/javascript">								
 	 $("#CDF_OUT_TYPE").change(function(){
    	    var addType=$(this).val();
    	        $("#paraMapObj_CDF_ITEM_LIST_SHOW").val("");
    	        $("#paraMapObj_CDF_ITEM_CODE_SHOW").val("");    	        
    	        $("#paraMapObj_CDF_ITEM_LIST").val("");
    	        $("#paraMapObj_CDF_ITEM_CODE").val("");
    	        $("#paraMapObj_CDF_ITEM_NAME").val("");
    	        $("#paraMapObj_CDF_ITEM_SPEC").val("");
    	    if(addType==1){
    	        //个体
    	        //$("#CDF_OUT_TYPE").attr("disabled",true);
                $("#maskdiv1").addClass("maskdiv");
                $("#maskdiv0").addClass("maskdiv");
                $("#paraMapObj_CDF_ITEM_LIST_SHOW").attr("disabled",true);
                $("#paraMapObj_CDF_ITEM_LIST_SHOW").css("background-color","#ebebe4");
    	        $("#paraMapObj_CDF_ITEM_NUM").val("");
    	        $("#paraMapObj_CDF_ITEM_CODE_SHOW").attr("disabled",true);
    	        $("#paraMapObj_CDF_ITEM_SN").attr("disabled",false);
    	        $("#paraMapObj_CDF_ITEM_SN").attr("placeholder","请输入物料SN,按Enter键");
    	        $("#paraMapObj_CDF_ITEM_SN").val("");
    	    }else if(addType==2){
    	        //批量
    	        //$("#CDF_OUT_TYPE").attr("disabled",true);
                $("#maskdiv1").removeClass("maskdiv");
                $("#maskdiv0").removeClass("maskdiv");
                $("#paraMapObj_CDF_ITEM_LIST_SHOW").attr("disabled",false);
                $("#paraMapObj_CDF_ITEM_LIST_SHOW").css("background-color","");
    	        $("#paraMapObj_CDF_ITEM_SN").val("");
    	        $("#paraMapObj_CDF_ITEM_CODE_SHOW").attr("disabled",false);
    	        $("#paraMapObj_CDF_ITEM_SN").attr("disabled",true);
    	        $("#paraMapObj_CDF_ITEM_SN").attr("placeholder","");
    	        $("#paraMapObj_CDF_ITEM_NUM").val("");

    	    }else{
                $("#maskdiv0").addClass("maskdiv");
                $("#maskdiv1").addClass("maskdiv");
                $("#paraMapObj_CDF_ITEM_LIST_SHOW").attr("disabled",true);
                $("#paraMapObj_CDF_ITEM_LIST_SHOW").css("background-color","#ebebe4");    	    
    	        $("#paraMapObj_CDF_ITEM_LIST").val("");
    	        $("#paraMapObj_CDF_ITEM_CODE_SHOW").val("");
    	        $("#paraMapObj_CDF_ITEM_CODE").val("");
    	        $("#paraMapObj_CDF_ITEM_NAME").val("");
    	        $("#paraMapObj_CDF_ITEM_SPEC").val("");
    	        $("#paraMapObj_CDF_ITEM_NUM").val("");
    	        $("#paraMapObj_CDF_ITEM_CODE_SHOW").attr("disabled",true);
    	        $("#paraMapObj_CDF_ITEM_SN").attr("disabled",true);
    	        //$("#paraMapObj_CDF_ITEM_SN").attr("placeholder","请输入物料SN,按Enter键");
    	        $("#paraMapObj_CDF_ITEM_SN").val("");
    	    }
    	});
    	
        $("#paraMapObj_CDF_ITEM_SN").keydown(function(event){
　　　　			if(event.keyCode == 13){
　　　　　　		var itemSn = $("#paraMapObj_CDF_ITEM_SN").val();
　　　　　　		if(itemSn!=""){
　　　　　　		    var url="${path}buss/bussModel_exeFunc.ms?funcMId=6f6afc2e97124faeb640ae968b37219b";
    			        jQuery.ajax({
    			 			type: "POST",
    			 	   		dataType: "json",
    			 	    	url: url+"&itemSn="+itemSn,
    			 	    	data: "",
    			 			success: function(data){
    			 				var rccList = data.ajaxList;
    			 				var length=rccList.length;
    			 				if(length==0){
    			 				    utilsFp.confirmIcon(3,"","","", "物料未领用,请更换",0,"","");
    			 				    $("#paraMapObj_CDF_ITEM_LIST").val("");
    			 				    $("#paraMapObj_CDF_ITEM_LIST_SHOW").val("");
    			 				    $("#paraMapObj_CDF_ITEM_SN").val("");
                        	        $("#paraMapObj_CDF_ITEM_CODE_SHOW").val("");
                        	        $("#paraMapObj_CDF_ITEM_CODE").val("");
                        	        $("#paraMapObj_CDF_ITEM_NAME").val("");
                        	        $("#paraMapObj_CDF_ITEM_SPEC").val("");
	                                $("#paraMapObj_CDF_ITEM_SPEC").val("");
	                                $("#paraMapObj_CDF_ITEM_NUM").val("");
                                    $("#paraMapObj_CDF_ITEM_SN").focus();
                                    return;
    			 				}else{
    			 				    if(rccList[0].DOC_NUM == null) rccList[0].DOC_NUM = "";
        							if(rccList[0].ITEM_CODE == null) rccList[0].ITEM_CODE = "";
        							if(rccList[0].ITEM_NAME == null) rccList[0].ITEM_NAME = "";
        							if(rccList[0].ITEM_SPEC == null) rccList[0].ITEM_SPEC = "";
        							if(rccList[0].ITEM_NUM == null) rccList[0].ITEM_NUM = "";
    			 				    $("#paraMapObj_CDF_ITEM_LIST").val(rccList[0].DOC_NUM);
    			 				    $("#paraMapObj_CDF_ITEM_LIST_SHOW").val(rccList[0].DOC_NUM);
                        	        $("#paraMapObj_CDF_ITEM_CODE_SHOW").val(rccList[0].ITEM_CODE);
                        	        $("#paraMapObj_CDF_ITEM_CODE").val(rccList[0].ITEM_CODE);
                        	        $("#paraMapObj_CDF_ITEM_NAME").val(rccList[0].ITEM_NAME);
                        	        $("#paraMapObj_CDF_ITEM_SPEC").val(rccList[0].ITEM_SPEC);
                        	        $("#paraMapObj_CDF_ITEM_NUM").val(rccList[0].ITEM_NUM);
    			 				}
    			 			},
    			 			error: function(XMLHttpRequest, textStatus, errorThrown){
    			 				util.closeLoading();
    			 	  }
    			});
　　　　	}
　　　　}
　　});        	

	    function delRow() {
		    var flag=false;
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 :checkbox").each(function() {
				if($(this).attr("checked")) {
					$(this).parent().parent().remove();

					flag=true;
				}
			});
			if(flag==false){
				utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请添加备件信息" />", 0, "260", "");
				return;
			}
			reSort("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
			var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
			_tongLineColor(tableTrJs);
			clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
			defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
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
		var trrCount=0;
		function addItemList(showId, backId) {
		    var addType=$("#CDF_OUT_TYPE").val();
		    if(addType=="1"){
		        if($("#paraMapObj_CDF_ITEM_SN").val()==""){
    	            _alertValMsg($("#paraMapObj_CDF_ITEM_SN"), "<dict:lang value="该项不能为空" />");
    	    	    return;
	            }
		    }else if(addType=="2"){
		        if($("#paraMapObj_CDF_ITEM_CODE").val()==""){
    	            _alertValMsg($("#paraMapObj_CDF_ITEM_CODE_SHOW"), "<dict:lang value="该项不能为空" />");
    	    	    return;
                }
		    }
		    if($("#paraMapObj_CDF_ITEM_NUM").val()==""){
    	        _alertValMsg($("#paraMapObj_CDF_ITEM_NUM"), "<dict:lang value="该项不能为空" />");
    	    	return;
    	    }else{
    	        if(!/^\+?[1-9][0-9]*$/.test($("#paraMapObj_CDF_ITEM_NUM").val())) {
    				_alertValMsg($('#paraMapObj_CDF_ITEM_NUM'), "<dict:lang value="该项只能为正整数" />");
    				return;
    			}
    	    }
    	    var docNum=$("#paraMapObj_CDF_ITEM_LIST").val();
    	    var itemSn=$("#paraMapObj_CDF_ITEM_SN").val();
    	    var itemCode=$("#paraMapObj_CDF_ITEM_CODE").val();
    	    var itemName=$("#paraMapObj_CDF_ITEM_NAME").val();
    	    var itemSpec=$("#paraMapObj_CDF_ITEM_SPEC").val();	
    	    var itemNum=$("#paraMapObj_CDF_ITEM_NUM").val();	
    	    if(docNum == null) docNum = "";
    	    if(itemSn == null) itemSn = "";
    	    if(itemCode == null) itemCode = "";
    	    if(itemName == null) itemName = "";
    	    if(itemSpec == null) itemSpec = "";
    	    if(itemNum == null) itemNum = "";
            $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='trId_"+trrCount+"'></tr>");
		    $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'></td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datgrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:120px;text-align: left;' title='"+docNum+"'>" + docNum + "<input type='hidden'	 name='DOC_NUM' value='" + docNum + "'/></td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: left;' title='"+itemSn+"'>" + itemSn + "<input type='hidden' name='ITEM_SN' value='" + itemSn + "'/></td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: left;' title='"+itemCode+"'>" + itemCode + "<input type='hidden' name='ITEM_CODE' value='" + itemCode + "'/></td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:120px;text-align: left;' title='"+itemName+"'>" + itemName + "<input type='hidden' name='ITEM_NAME' value='" + itemName + "'/></td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:120px;text-align: left;' title='"+itemSpec+"'>" + itemSpec + "<input type='hidden' name='ITEM_SPEC' value='" + itemSpec + "'/></td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:80px;text-align: right;' title='"+itemNum+"'>" + itemNum + "<input type='hidden' name='ITEM_NUM' value='" + itemNum + "'/></td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:135px;text-align: right;'><input style='width:125px;' class='isSubmit input' name='CHANGE_REASON' value=''/></td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:135px;'><input style='width:165px;' class='isSubmit input' name='MEMO' value=''/></td>");
											
            var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
			_tongLineColor(tableTrJs);
			clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
			defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
			if(addType==1){
    	        //个体
    	        //$("#CDF_OUT_TYPE").attr("disabled",true);	
                $("#paraMapObj_CDF_ITEM_LIST").val("");
    	        $("#paraMapObj_CDF_ITEM_CODE_SHOW").val("");
    	        $("#paraMapObj_CDF_ITEM_CODE").val("");
    	        $("#paraMapObj_CDF_ITEM_NAME").val("");
    	        $("#paraMapObj_CDF_ITEM_SPEC").val("");
    	        $("#paraMapObj_CDF_ITEM_NUM").val("");
    	        $("#paraMapObj_CDF_ITEM_CODE_SHOW").attr("disabled",true);
    	        $("#paraMapObj_CDF_ITEM_SN").attr("disabled",false);
    	        //$("#paraMapObj_CDF_ITEM_SN").attr("placeholder","请输入物料SN,按Enter键");
    	        $("#paraMapObj_CDF_ITEM_SN").val("");
    	    }else if(addType==2){
    	        //批量
    	        //$("#CDF_OUT_TYPE").attr("disabled",true);				
                $("#paraMapObj_CDF_ITEM_LIST").val("");
    	        $("#paraMapObj_CDF_ITEM_SN").val("");
    	        $("#paraMapObj_CDF_ITEM_CODE_SHOW").attr("disabled",false);
    	        $("#paraMapObj_CDF_ITEM_SN").attr("disabled",true);
    	        $("#paraMapObj_CDF_ITEM_SN").attr("placeholder","");
    	        $("#paraMapObj_CDF_ITEM_CODE").val("");
    	        $("#paraMapObj_CDF_ITEM_NAME").val("");
    	        $("#paraMapObj_CDF_ITEM_SPEC").val("");
    	        $("#paraMapObj_CDF_ITEM_NUM").val("");
    	        $("#paraMapObj_CDF_ITEM_CODE").val("");
    	        $("#paraMapObj_CDF_ITEM_CODE_SHOW").val("");
    	    }else{				
                $("#paraMapObj_CDF_ITEM_LIST").val("");
    	        $("#paraMapObj_CDF_ITEM_CODE_SHOW").val("");
    	        $("#paraMapObj_CDF_ITEM_CODE").val("");
    	        $("#paraMapObj_CDF_ITEM_NAME").val("");
    	        $("#paraMapObj_CDF_ITEM_SPEC").val("");
    	        $("#paraMapObj_CDF_ITEM_NUM").val("");
    	        $("#paraMapObj_CDF_ITEM_CODE_SHOW").attr("disabled",true);
    	        $("#paraMapObj_CDF_ITEM_SN").attr("disabled",true);
    	        //$("#paraMapObj_CDF_ITEM_SN").attr("placeholder","请输入物料SN,按Enter键");
    	        $("#paraMapObj_CDF_ITEM_SN").val("");
    	    }
    	    trrCount++;
			reSort("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
			
			hideDiv(showId, backId);
			
		}
		//function saveInfo(){
    	    //var tableLength = $("#addItemInfo tr").length;
    	    //console.log(tableLength);
    	    //if(tableLength==0){
    	        //utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请添加明细信息" />", 0, "260", "");
				//return;
    	    //}
            //document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=32d88e43062146228c4df183a337ec6e";
            //document.forms.addForm.submit();
    	//}
    </script>
	
	<script type="text/javascript">
	var tempNum = 0;
	function addCount(){
		tempNum++;
		//alert(tempNum);
		$("#selCount").val(tempNum);
	}
	
	function delCount(obj){
		
		//console.log(obj);
		_delRowExtendConfirm(obj);
		tempNum--;
		$("#selCount").val(tempNum);
	}
	
	function delMyRowExtend(tableId,subformids){
		if($("input[name='checkbox"+tableId+"']:checked").length==0){
		     utilsFp.confirmIcon(3,"","","", "请至少选择一条记录","","260","145");
		     return;
		  }
		  var obj = new Object();
		  obj.tableId = tableId;
		  obj.subformids = subformids;
		  utilsFp.confirmIcon(1,"","delCount",obj, "确认删除?","1","250","145");
	}
	
	function editCal(){
                        if($("#paraMapObj_CDE_REPAIR_LONG").val()<=0){
                           //_alertValMsg(document.getElementById("paraMapObj_CDE_REPAIR_LONG"),"%{getText("请输入大于0的数")}");
                           _alertValMsg(document.getElementById("paraMapObj_CDE_REPAIR_LONG"),"<dict:lang value="请输入大于0的数" />");
                           return ;
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
			if(!val.valDataBaseSetData()){
        		return ;
        	}
                    
          setHid();
           var tableLength = $("#addItemInfo tr").length;
             if(tableLength==0){
    	     document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=2996776d6b9a46b7a4162f6773218c2a&flag=0";
    	       // utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请添加备件信息" />", 0, "260", "");
			//	return;
    	    }else{
    	    
           document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=2996776d6b9a46b7a4162f6773218c2a&flag=1";
           }
        
          /*
           
    	    //console.log(tableLength);
    	    if(tableLength==0){
    	        utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请添加备件信息" />", 0, "260", "");
				return;
    	    }
    	    
           document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=2996776d6b9a46b7a4162f6773218c2a";*/
        
document.forms.editForm.submit();
}

</script>

	<!-- js初始化方法 -->
	
<script>(function($){
  $(window).on('load',function(){
   setPopScroll('.scroll','.datagrid-header-inner');
  })
})(jQuery)</script>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.datagrid-body','.datagrid-header-inner');
  })
})(jQuery)</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->

