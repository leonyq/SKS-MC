<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
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
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- 产品静态资源 -->

</head>
<body style="overflow:auto;">
	<div class="edit">
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
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
			    	        <button type="button" onclick="edit(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="2cf57919bca545d6bac310ca257883c0" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="2cf57919bca545d6bac310ca257883c0" />
	<input type="hidden" id="prefixInd" name="2cf57919bca545d6bac310ca257883c0" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'104eee2dc3f9432281910a838a96fba6'" />
		<s:set name="_$formId_1" value="'2cf57919bca545d6bac310ca257883c0'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name-six" /><bu:uitn colNo="PROJECT_ID" formId="cc0dce4648de4a599b01d4057a2b2c46" /></td>
			<bu:td cssClass="dec-self" colNo="PROJECT_ID" formId="cc0dce4648de4a599b01d4057a2b2c46" ><bu:ui colNo="PROJECT_ID" formId="cc0dce4648de4a599b01d4057a2b2c46" value="%{PROJECT_ID}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="LOT_NUMBER" formId="cc0dce4648de4a599b01d4057a2b2c46" /></td>
			<bu:td cssClass="dec-self" colNo="LOT_NUMBER" formId="cc0dce4648de4a599b01d4057a2b2c46" ><bu:ui colNo="LOT_NUMBER" formId="cc0dce4648de4a599b01d4057a2b2c46" value="%{LOT_NUMBER}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PROJECT_SORT" formId="cc0dce4648de4a599b01d4057a2b2c46" /></td>
			<bu:td cssClass="dec-self" colNo="PROJECT_SORT" formId="cc0dce4648de4a599b01d4057a2b2c46" ><bu:ui colNo="PROJECT_SORT" formId="cc0dce4648de4a599b01d4057a2b2c46" value="%{PROJECT_SORT}" formIndex="1" /></bu:td>
		</tr>
		<tr>
          <td class="name-six" /><bu:uitn colNo="CHECK_USER" formId="cc0dce4648de4a599b01d4057a2b2c46" /></td>
			<bu:td cssClass="dec-self" colNo="CHECK_USER" formId="cc0dce4648de4a599b01d4057a2b2c46" ><bu:ui colNo="CHECK_USER" formId="cc0dce4648de4a599b01d4057a2b2c46" value="%{CHECK_USER}" formIndex="1" /></bu:td>
		   <td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="PM_CHECK_STUST" formId="cc0dce4648de4a599b01d4057a2b2c46" /></td>
			<bu:td cssClass="dec-self" colNo="PM_CHECK_STUST" formId="cc0dce4648de4a599b01d4057a2b2c46" ><bu:ui colNo="PM_CHECK_STUST" formId="cc0dce4648de4a599b01d4057a2b2c46" value="%{PM_CHECK_STUST}" formIndex="1" /></bu:td>
		
       </tr>
       <tr>
			<td class="name-six" /><bu:uitn colNo="CHECK_MON" formId="cc0dce4648de4a599b01d4057a2b2c46" /></td>
			<bu:td cssClass="dec-self" colNo="CHECK_MON" formId="cc0dce4648de4a599b01d4057a2b2c46" ><bu:ui colNo="CHECK_MON" formId="cc0dce4648de4a599b01d4057a2b2c46" value="%{CHECK_MON}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="2cf57919bca545d6bac310ca257883c0" formIndex="1" />		<div style="padding:1px;"></div>

		<div class="mod" >
			<div class="mod-hd"> 
				<h3 class="tit"><dict:lang value="LEO-质检待处理表1" /></h3>
					<div class="extend-btn" style="float: right;margin-top:15px;">
						<button type="button"    onclick="_addRowExtend('15e21142e45540ef9a80862e8c2a56b6','2','','','');"     style="padding:0;" title="<dict:lang value="添加" />">   <i class="ico ico-kl-new-add ico-small"></i>
						</button>
						<button type="button" onclick="_delRowExtend('15e21142e45540ef9a80862e8c2a56b6','');"     style="padding:0"   title="<dict:lang value="移除" /> " >   <i class="ico ico-sc-new-add ico-small"></i> 
						</button> 
					</div>
			</div>
			<div class="mod-bd" >
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"   >
						<div class="datagrid-header" >
							<div class="datagrid-header-inner" id="datagrid-header-inner15e21142e45540ef9a80862e8c2a56b6">
								<bu:addSub formid="2cf57919bca545d6bac310ca257883c0" formIndex="2"  selfformid="15e21142e45540ef9a80862e8c2a56b6" hidecol=""  viewid="" />
							</div>
						</div>
						<div class="datagrid-body datagrid-div3"  style="height:150px" onscroll="ajaxTableScroll(this,'15e21142e45540ef9a80862e8c2a56b6')" >
							<table class="glxb-table" style="width:100%" id="addTable_15e21142e45540ef9a80862e8c2a56b6" >
								<tbody id="dataList" style="">
                                    <c:forEach var="item" items="${dataList}" varStatus="status">
                                        <tr>
                                            <td id="INDEX_${status.count}" class='datagrid-cell datagrid-cell-1' style='width:30px;'>${status.count}</td>
                                            <td id="LOT_NUMBER_${status.count}" class='datagrid-cell datagrid-cell-1' style='width:150px;'>${item.LOT_NUMBER}</td>
                                            <td id="PRODUCT_COUNT_${status.count}" class='datagrid-cell datagrid-cell-2' style="width:150px;">${item.PRODUCT_COUNT}</td>
                                            <td id="FEED_COUNT_${status.count}" class='datagrid-cell datagrid-cell-3' style="width:150px;">${item.FEED_COUNT}</td>
                                            <td id="FEED_NUM_${status.count}" class='datagrid-cell datagrid-cell-4' style="width:150px;">${item.FEED_NUM}</td>
                                            <td  id="RAW_LICENSE_${status.count}" class='datagrid-cell datagrid-cell-5' style="width:150px;">${item.RAW_LICENSE}</td>
                                            <td  id="PM_MEMO${status.count}" class='datagrid-cell datagrid-cell-5' style="width:150px;">${item.PM_MEMO}</td>
                                        </tr>
                                    </c:forEach>
                                 </tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>
<script>
function initEditDataLs(){
getEditRows("15e21142e45540ef9a80862e8c2a56b6","2","2cf57919bca545d6bac310ca257883c0","","3fd0c1209e2640e88706f4d18376411a","");
$('table').find('tbody tr:eq(0)').click();
}
</script>

									
			</div>
	</form>	
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<!-- js初始化方法 -->
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_11" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script type="text/javascript">
  
 $(function () {
        initParam();
        
    });
  function initParam() {
        $("#paraMapObj_PROJECT_ID_SHOW").val('${dataMap.PROJECT_ID}');
        $("#paraMapObj_PROJECT_ID").val('${dataMap.PROJECT_ID}');

        $("#paraMapObj_LOT_NUMBER").val('${dataMap.LOT_NUMBER}');

        $("#paraMapObj_CHECK_USER_SHOW").val('${dataMap.CHECK_USER}');
        $("#paraMapObj_CHECK_USER").val('${dataMap.CHECK_USER}');
    
     
        $("#paraMapObj_CHECK_MON").val('${dataMap.CHECK_MON}');

        $("#paraMapObj_PROJECT_SORT").val('${dataMap.PROJECT_SORT}');
    }
 
</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
