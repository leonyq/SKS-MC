<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
    <title>
		<dict:lang value="leo品质待检测" />
    </title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" />
        <jsp:param name="scroll" value="1" />
         <jsp:param name="jqueryprint" value="1" />
         
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="606ab631c74a4689ac10de3e9f0843c3"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <!-- 产品静态资源 -->

	
	<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
	</object>

</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="4ef7369d7bce4388bfa275506d593f19" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     

  <table class="search_table">
      <bu:search deal_mark="1" viewId="4ef7369d7bce4388bfa275506d593f19" /> 

  </table>

                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage606ab631c74a4689ac10de3e9f0843c3" id="formPage606ab631c74a4689ac10de3e9f0843c3" value="${formPage606ab631c74a4689ac10de3e9f0843c3}"/>
		<input type="hidden" name="formId" id="formId1" value='606ab631c74a4689ac10de3e9f0843c3'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="606ab631c74a4689ac10de3e9f0843c3">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax606ab631c74a4689ac10de3e9f0843c3" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner606ab631c74a4689ac10de3e9f0843c3">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable606ab631c74a4689ac10de3e9f0843c3">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="606ab631c74a4689ac10de3e9f0843c3" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_606ab631c74a4689ac10de3e9f0843c3" onclick="_selectAjaxTableAllData(this,'606ab631c74a4689ac10de3e9f0843c3')" style="cursor: pointer;"title="全选"/></span></td>
                                       
                                        <td name="noprintset_DATA_AUTH" class="datagrid-cell">
                                            <bu:uitn colNo="DATA_AUTH" formId="606ab631c74a4689ac10de3e9f0843c3"/></td>
                                        <td name="noprintset_PROJECT_ID" class="datagrid-cell">
                                            <bu:uitn colNo="PROJECT_ID" formId="606ab631c74a4689ac10de3e9f0843c3"/></td>
                                        <td name="noprintset_PROJECT_STATUS" class="datagrid-cell">
                                            <bu:uitn colNo="PROJECT_STATUS" formId="606ab631c74a4689ac10de3e9f0843c3"/></td>
                                        <td name="noprintset_IS_REL" class="datagrid-cell">
                                            <bu:uitn colNo="IS_REL" formId="606ab631c74a4689ac10de3e9f0843c3"/></td>
          								<td name="noprintset_PM_CHECK_STUST" class="datagrid-cell">
                                            <bu:uitn colNo="PM_CHECK_STUST" formId="606ab631c74a4689ac10de3e9f0843c3"/></td>
                                        <td name="noprintset_PROJECT_SORT" class="datagrid-cell">
                                            <bu:uitn colNo="PROJECT_SORT" formId="606ab631c74a4689ac10de3e9f0843c3"/></td>
                                        <td name="noprintset_PRODUCT_MATERIAL" class="datagrid-cell">
                                            <bu:uitn colNo="PRODUCT_MATERIAL" formId="606ab631c74a4689ac10de3e9f0843c3"/></td>
                                        <td name="noprintset_PRODUCT_NAME" class="datagrid-cell">
                                            <bu:uitn colNo="PRODUCT_NAME" formId="606ab631c74a4689ac10de3e9f0843c3"/></td>
                                        <td name="noprintset_PRODUCT_STANDARD" class="datagrid-cell">
                                            <bu:uitn colNo="PRODUCT_STANDARD" formId="606ab631c74a4689ac10de3e9f0843c3"/></td>
                                        <td name="noprintset_PRODUCT_COUNT" class="datagrid-cell">
                                            <bu:uitn colNo="PRODUCT_COUNT" formId="606ab631c74a4689ac10de3e9f0843c3"/></td>
                                        <td name="noprintset_REL_NUM" class="datagrid-cell">
                                            <bu:uitn colNo="REL_NUM" formId="606ab631c74a4689ac10de3e9f0843c3"/></td>
                                        <td name="noprintset_CREATE_USER" class="datagrid-cell">
                                            <bu:uitn colNo="CREATE_USER" formId="606ab631c74a4689ac10de3e9f0843c3"/></td>
                                        <td name="noprintset_CREATE_TIME" class="datagrid-cell">
                                            <bu:uitn colNo="CREATE_TIME" formId="606ab631c74a4689ac10de3e9f0843c3"/></td>
                                        <td name="noprintset_EDIT_USER" class="datagrid-cell">
                                            <bu:uitn colNo="EDIT_USER" formId="606ab631c74a4689ac10de3e9f0843c3"/></td>
                                        <td name="noprintset_EDIT_TIME" class="datagrid-cell">
                                            <bu:uitn colNo="EDIT_TIME" formId="606ab631c74a4689ac10de3e9f0843c3"/></td>
                                        <td name="noprintset_PM_MEMO" class="datagrid-cell">
                                            <bu:uitn colNo="PM_MEMO" formId="606ab631c74a4689ac10de3e9f0843c3"/></td>
                                    </bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv606ab631c74a4689ac10de3e9f0843c3" onscroll="ajaxTableScroll(this,'606ab631c74a4689ac10de3e9f0843c3')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax606ab631c74a4689ac10de3e9f0843c3">
		<tbody id="tbody_606ab631c74a4689ac10de3e9f0843c3" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage606ab631c74a4689ac10de3e9f0843c3==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=606ab631c74a4689ac10de3e9f0843c3&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('606ab631c74a4689ac10de3e9f0843c3','1');">打印</button>
 </div>
 </div>
 <div style="height: 390px;overflow:auto;border-top: 1px solid #eaeaea;">
 <table id="printset_tab" class="basic-table" style="text-align: center;margin-top:10px;">
 <tr>
 <td style="width: 100px;text-align: right;">列字段</td>
 <td style="padding-left: 5px;">是否打印</td>
 <td style="padding-left: 5px;">打印列宽</td>
 </tr>
 <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>序号</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="SEQ" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="SEQ" value="30" title_name="序号"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>组织机构</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="DATA_AUTH" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="DATA_AUTH" value="" title_name="组织机构"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>工单ID</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PROJECT_ID" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PROJECT_ID" value="" title_name="工单ID"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>工单状态</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PROJECT_STATUS" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PROJECT_STATUS" value="" title_name="工单状态"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>关联状态</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="IS_REL" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="IS_REL" value="" title_name="关联状态"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>检测结果</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PM_CHECK_STUST" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PM_CHECK_STUST" value="" title_name="关联状态"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>?工单类别</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PROJECT_SORT" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PROJECT_SORT" value="" title_name="?工单类别"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>机种料号</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PRODUCT_MATERIAL" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PRODUCT_MATERIAL" value="" title_name="机种料号"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>机种名称</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PRODUCT_NAME" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PRODUCT_NAME" value="" title_name="机种名称"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>规格</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PRODUCT_STANDARD" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PRODUCT_STANDARD" value="" title_name="规格"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>计划数量</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PRODUCT_COUNT" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PRODUCT_COUNT" value="" title_name="计划数量"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>关联数量</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="REL_NUM" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="REL_NUM" value="" title_name="关联数量"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>创建人</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="CREATE_USER" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="CREATE_USER" value="" title_name="创建人"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>创建时间</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="CREATE_TIME" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="CREATE_TIME" value="" title_name="创建时间"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>修改人</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="EDIT_USER" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="EDIT_USER" value="" title_name="修改人"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>修改时间</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="EDIT_TIME" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="EDIT_TIME" value="" title_name="修改时间"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>备注</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PM_MEMO" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PM_MEMO" value="" title_name="备注"/>px
                                </td>
                            </tr>
 </table>
 </div>
 </div>
		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="4ef7369d7bce4388bfa275506d593f19" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="4ef7369d7bce4388bfa275506d593f19" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
    
<script>
function  doCheck(){
     var projectSnArr = [];

        $("span[colno='PROJECT_ID']").each(function (){
            var curTitle = $(this).text();
            if (curTitle != null) {
                projectSnArr.push(curTitle);
            }
        });

        var workOrderSn = projectSnArr.join(",");

        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=bdb30da2069c4cbd9f4435415b2bfc87";

        $.ajax({
            type: "POST",
            dataType: "json",
            url: url,
            data: {"workOrderSn":workOrderSn},
            success: function (data) {
                console.log("data: >>> ");
                console.log(data);
                util.closeLoading();
                utilsFp.confirmIcon(2,"","query","", "<dict:lang value="提交检测成功" />",0,"300","");
            },
            error: function (e1,e2,e3) {
                console.log("e1: >>> ");
                console.log(e1);

                console.log("e2: >>> ");
                console.log(e2);

                console.log("e3: >>> ");
                console.log(e3);
                utilsFp.confirmIcon(3, "", "", "", msg, "", "260", "145");
            }
        });
}
<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='606ab631c74a4689ac10de3e9f0843c3'){<%--LEO-品质检测基础表--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row " + backgroudColor + " " + trClass + "' id='" + v.ID + "' abbr='" + v.ID + "' style='cursor: pointer;" + trStyle + "' " + trEvent + ">");
                arrHtml.push("<input type='hidden' name='ID' value='" + v.ID + "' />");
                arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_" + v.ID + "'  value='" + v.DATA_AUTH_ID + "' />");
                getRelColVal(arrHtml, v, colNo);
                arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>" + v._SEQ + "</span></td>");
                arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
                arrHtml.push("<input type='checkbox' name='" + formId + "$ID' value='" + v.ID + "' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='DATA_AUTH' name='noprintset_DATA_AUTH' class='datagrid-cell TD_DATA_AUTH " + ms.tdClass(formId, 'DATA_AUTH') + "' style='" + ms.tdStyle(formId, 'DATA_AUTH') + "' " + ms.tdEvent(formId, 'DATA_AUTH') + ">");
                arrHtml.push("<span colno='DATA_AUTH' class='" + ms.uiClass(formId, 'DATA_AUTH') + "' style='" + ms.uiStyle(formId, 'DATA_AUTH') + "' " + ms.uiEvent(formId, 'DATA_AUTH') + " title='" + ms.titleAttr(formId, 'DATA_AUTH', 'IS_TITLE_ATTR', v) + "' >" + v['DATA_AUTH'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PROJECT_ID' name='noprintset_PROJECT_ID' class='datagrid-cell  " + ms.tdClass(formId, 'PROJECT_ID') + "' style='" + ms.tdStyle(formId, 'PROJECT_ID') + "' " + ms.tdEvent(formId, 'PROJECT_ID') + ">");
                arrHtml.push("<span colno='PROJECT_ID' class='" + ms.uiClass(formId, 'PROJECT_ID') + "' style='" + ms.uiStyle(formId, 'PROJECT_ID') + "' " + ms.uiEvent(formId, 'PROJECT_ID') + " title='" + ms.titleAttr(formId, 'PROJECT_ID', 'IS_TITLE_ATTR', v) + "' >" + v['PROJECT_ID'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PROJECT_STATUS' name='noprintset_PROJECT_STATUS' class='datagrid-cell  " + ms.tdClass(formId, 'PROJECT_STATUS') + "' style='" + ms.tdStyle(formId, 'PROJECT_STATUS') + "' " + ms.tdEvent(formId, 'PROJECT_STATUS') + ">");
                arrHtml.push("<span colno='PROJECT_STATUS' class='" + ms.uiClass(formId, 'PROJECT_STATUS') + "' style='" + ms.uiStyle(formId, 'PROJECT_STATUS') + "' " + ms.uiEvent(formId, 'PROJECT_STATUS') + " title='" + ms.titleAttr(formId, 'PROJECT_STATUS', 'IS_TITLE_ATTR', v) + "' >" + v['PROJECT_STATUS'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='IS_REL' name='noprintset_IS_REL' class='datagrid-cell  " + ms.tdClass(formId, 'IS_REL') + "' style='" + ms.tdStyle(formId, 'IS_REL') + "' " + ms.tdEvent(formId, 'IS_REL') + ">");
                arrHtml.push("<span colno='IS_REL' class='" + ms.uiClass(formId, 'IS_REL') + "' style='" + ms.uiStyle(formId, 'IS_REL') + "' " + ms.uiEvent(formId, 'IS_REL') + " title='" + ms.titleAttr(formId, 'IS_REL', 'IS_TITLE_ATTR', v) + "' >" + v['IS_REL'] + "</span>");
                arrHtml.push("</td>");
      
      			arrHtml.push("<td colno='PM_CHECK_STUST' name='noprintset_PM_CHECK_STUST' class='datagrid-cell  " + ms.tdClass(formId, 'PM_CHECK_STUST') + "' style='" + ms.tdStyle(formId, 'IS_REL') + "' " + ms.tdEvent(formId, 'PM_CHECK_STUST') + ">");
                arrHtml.push("<span colno='PM_CHECK_STUST' class='" + ms.uiClass(formId, 'PM_CHECK_STUST') + "' style='" + ms.uiStyle(formId, 'PM_CHECK_STUST') + "' " + ms.uiEvent(formId, 'IS_REL') + " title='" + ms.titleAttr(formId, 'PM_CHECK_STUST', 'IS_TITLE_ATTR', v) + "' >" + v['PM_CHECK_STUST'] + "</span>");
                arrHtml.push("</td>");
      
                arrHtml.push("<td colno='PROJECT_SORT' name='noprintset_PROJECT_SORT' class='datagrid-cell  " + ms.tdClass(formId, 'PROJECT_SORT') + "' style='" + ms.tdStyle(formId, 'PROJECT_SORT') + "' " + ms.tdEvent(formId, 'PROJECT_SORT') + ">");
                arrHtml.push("<span colno='PROJECT_SORT' class='" + ms.uiClass(formId, 'PROJECT_SORT') + "' style='" + ms.uiStyle(formId, 'PROJECT_SORT') + "' " + ms.uiEvent(formId, 'PROJECT_SORT') + " title='" + ms.titleAttr(formId, 'PROJECT_SORT', 'IS_TITLE_ATTR', v) + "' >" + v['PROJECT_SORT'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_MATERIAL' name='noprintset_PRODUCT_MATERIAL' class='datagrid-cell  " + ms.tdClass(formId, 'PRODUCT_MATERIAL') + "' style='" + ms.tdStyle(formId, 'PRODUCT_MATERIAL') + "' " + ms.tdEvent(formId, 'PRODUCT_MATERIAL') + ">");
                arrHtml.push("<span colno='PRODUCT_MATERIAL' class='" + ms.uiClass(formId, 'PRODUCT_MATERIAL') + "' style='" + ms.uiStyle(formId, 'PRODUCT_MATERIAL') + "' " + ms.uiEvent(formId, 'PRODUCT_MATERIAL') + " title='" + ms.titleAttr(formId, 'PRODUCT_MATERIAL', 'IS_TITLE_ATTR', v) + "' >" + v['PRODUCT_MATERIAL'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_NAME' name='noprintset_PRODUCT_NAME' class='datagrid-cell  " + ms.tdClass(formId, 'PRODUCT_NAME') + "' style='" + ms.tdStyle(formId, 'PRODUCT_NAME') + "' " + ms.tdEvent(formId, 'PRODUCT_NAME') + ">");
                arrHtml.push("<span colno='PRODUCT_NAME' class='" + ms.uiClass(formId, 'PRODUCT_NAME') + "' style='" + ms.uiStyle(formId, 'PRODUCT_NAME') + "' " + ms.uiEvent(formId, 'PRODUCT_NAME') + " title='" + ms.titleAttr(formId, 'PRODUCT_NAME', 'IS_TITLE_ATTR', v) + "' >" + v['PRODUCT_NAME'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_STANDARD' name='noprintset_PRODUCT_STANDARD' class='datagrid-cell  " + ms.tdClass(formId, 'PRODUCT_STANDARD') + "' style='" + ms.tdStyle(formId, 'PRODUCT_STANDARD') + "' " + ms.tdEvent(formId, 'PRODUCT_STANDARD') + ">");
                arrHtml.push("<span colno='PRODUCT_STANDARD' class='" + ms.uiClass(formId, 'PRODUCT_STANDARD') + "' style='" + ms.uiStyle(formId, 'PRODUCT_STANDARD') + "' " + ms.uiEvent(formId, 'PRODUCT_STANDARD') + " title='" + ms.titleAttr(formId, 'PRODUCT_STANDARD', 'IS_TITLE_ATTR', v) + "' >" + v['PRODUCT_STANDARD'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_COUNT' name='noprintset_PRODUCT_COUNT' class='datagrid-cell  " + ms.tdClass(formId, 'PRODUCT_COUNT') + "' style='" + ms.tdStyle(formId, 'PRODUCT_COUNT') + "' " + ms.tdEvent(formId, 'PRODUCT_COUNT') + ">");
                arrHtml.push("<span colno='PRODUCT_COUNT' class='" + ms.uiClass(formId, 'PRODUCT_COUNT') + "' style='" + ms.uiStyle(formId, 'PRODUCT_COUNT') + "' " + ms.uiEvent(formId, 'PRODUCT_COUNT') + " title='" + ms.titleAttr(formId, 'PRODUCT_COUNT', 'IS_TITLE_ATTR', v) + "' >" + v['PRODUCT_COUNT'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='REL_NUM' name='noprintset_REL_NUM' class='datagrid-cell  " + ms.tdClass(formId, 'REL_NUM') + "' style='" + ms.tdStyle(formId, 'REL_NUM') + "' " + ms.tdEvent(formId, 'REL_NUM') + ">");
                arrHtml.push("<span colno='REL_NUM' class='" + ms.uiClass(formId, 'REL_NUM') + "' style='" + ms.uiStyle(formId, 'REL_NUM') + "' " + ms.uiEvent(formId, 'REL_NUM') + " title='" + ms.titleAttr(formId, 'REL_NUM', 'IS_TITLE_ATTR', v) + "' >" + v['REL_NUM'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_USER' name='noprintset_CREATE_USER' class='datagrid-cell  " + ms.tdClass(formId, 'CREATE_USER') + "' style='" + ms.tdStyle(formId, 'CREATE_USER') + "' " + ms.tdEvent(formId, 'CREATE_USER') + ">");
                arrHtml.push("<span colno='CREATE_USER' class='" + ms.uiClass(formId, 'CREATE_USER') + "' style='" + ms.uiStyle(formId, 'CREATE_USER') + "' " + ms.uiEvent(formId, 'CREATE_USER') + " title='" + ms.titleAttr(formId, 'CREATE_USER', 'IS_TITLE_ATTR', v) + "' >" + v['CREATE_USER'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_TIME' name='noprintset_CREATE_TIME' class='datagrid-cell  " + ms.tdClass(formId, 'CREATE_TIME') + "' style='" + ms.tdStyle(formId, 'CREATE_TIME') + "' " + ms.tdEvent(formId, 'CREATE_TIME') + ">");
                arrHtml.push("<span colno='CREATE_TIME' class='" + ms.uiClass(formId, 'CREATE_TIME') + "' style='" + ms.uiStyle(formId, 'CREATE_TIME') + "' " + ms.uiEvent(formId, 'CREATE_TIME') + " title='" + ms.titleAttr(formId, 'CREATE_TIME', 'IS_TITLE_ATTR', v) + "' >" + v['CREATE_TIME'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='EDIT_USER' name='noprintset_EDIT_USER' class='datagrid-cell  " + ms.tdClass(formId, 'EDIT_USER') + "' style='" + ms.tdStyle(formId, 'EDIT_USER') + "' " + ms.tdEvent(formId, 'EDIT_USER') + ">");
                arrHtml.push("<span colno='EDIT_USER' class='" + ms.uiClass(formId, 'EDIT_USER') + "' style='" + ms.uiStyle(formId, 'EDIT_USER') + "' " + ms.uiEvent(formId, 'EDIT_USER') + " title='" + ms.titleAttr(formId, 'EDIT_USER', 'IS_TITLE_ATTR', v) + "' >" + v['EDIT_USER'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='EDIT_TIME' name='noprintset_EDIT_TIME' class='datagrid-cell  " + ms.tdClass(formId, 'EDIT_TIME') + "' style='" + ms.tdStyle(formId, 'EDIT_TIME') + "' " + ms.tdEvent(formId, 'EDIT_TIME') + ">");
                arrHtml.push("<span colno='EDIT_TIME' class='" + ms.uiClass(formId, 'EDIT_TIME') + "' style='" + ms.uiStyle(formId, 'EDIT_TIME') + "' " + ms.uiEvent(formId, 'EDIT_TIME') + " title='" + ms.titleAttr(formId, 'EDIT_TIME', 'IS_TITLE_ATTR', v) + "' >" + v['EDIT_TIME'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PM_MEMO' name='noprintset_PM_MEMO' class='datagrid-cell  " + ms.tdClass(formId, 'PM_MEMO') + "' style='" + ms.tdStyle(formId, 'PM_MEMO') + "' " + ms.tdEvent(formId, 'PM_MEMO') + ">");
                arrHtml.push("<span colno='PM_MEMO' class='" + ms.uiClass(formId, 'PM_MEMO') + "' style='" + ms.uiStyle(formId, 'PM_MEMO') + "' " + ms.uiEvent(formId, 'PM_MEMO') + " title='" + ms.titleAttr(formId, 'PM_MEMO', 'IS_TITLE_ATTR', v) + "' >" + v['PM_MEMO'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    setNumColWidth(formId);
    clearAllSelect();
    setTableWidth(formId);
    setScroll(formId);
}
</script><script>
<%--生成异步表格--%>
function createTableModel_print(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='606ab631c74a4689ac10de3e9f0843c3'){<%--LEO-品质检测基础表--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td colno='PROJECT_STATUS' name='noprintset_PROJECT_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'PROJECT_STATUS')+"' style='"+ms.tdStyle(formId, 'PROJECT_STATUS')+"' "+ms.tdEvent(formId, 'PROJECT_STATUS')+">");
            arrHtml.push("<span colno='PROJECT_STATUS' class='"+ms.uiClass(formId, 'PROJECT_STATUS')+"' style='"+ms.uiStyle(formId, 'PROJECT_STATUS')+"' "+ms.uiEvent(formId, 'PROJECT_STATUS')+" title='"+ms.titleAttr(formId,'PROJECT_STATUS','IS_TITLE_ATTR',v)+"' >"+v['PROJECT_STATUS']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='IS_REL' name='noprintset_IS_REL' class='datagrid-cell "+ms.tdClass(formId, 'IS_REL')+"' style='"+ms.tdStyle(formId, 'IS_REL')+"' "+ms.tdEvent(formId, 'IS_REL')+">");
            arrHtml.push("<span colno='IS_REL' class='"+ms.uiClass(formId, 'IS_REL')+"' style='"+ms.uiStyle(formId, 'IS_REL')+"' "+ms.uiEvent(formId, 'IS_REL')+" title='"+ms.titleAttr(formId,'IS_REL','IS_TITLE_ATTR',v)+"' >"+v['IS_REL']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PM_CHECK_STUST' name='noprintset_PM_CHECK_STUST' class='datagrid-cell "+ms.tdClass(formId, 'PM_CHECK_STUST')+"' style='"+ms.tdStyle(formId, 'PM_CHECK_STUST')+"' "+ms.tdEvent(formId, 'PM_CHECK_STUST')+">");
            arrHtml.push("<span colno='PM_CHECK_STUST' class='"+ms.uiClass(formId, 'PM_CHECK_STUST')+"' style='"+ms.uiStyle(formId, 'PM_CHECK_STUST')+"' "+ms.uiEvent(formId, 'PM_CHECK_STUST')+" title='"+ms.titleAttr(formId,'PM_CHECK_STUST','IS_TITLE_ATTR',v)+"' >"+v['PM_CHECK_STUST']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='LOT_NUMBER' name='noprintset_LOT_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'LOT_NUMBER')+"' style='"+ms.tdStyle(formId, 'LOT_NUMBER')+"' "+ms.tdEvent(formId, 'LOT_NUMBER')+">");
            arrHtml.push("<span colno='LOT_NUMBER' class='"+ms.uiClass(formId, 'LOT_NUMBER')+"' style='"+ms.uiStyle(formId, 'LOT_NUMBER')+"' "+ms.uiEvent(formId, 'LOT_NUMBER')+" title='"+ms.titleAttr(formId,'LOT_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['LOT_NUMBER']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PROJECT_FLAG' name='noprintset_PROJECT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'PROJECT_FLAG')+"' style='"+ms.tdStyle(formId, 'PROJECT_FLAG')+"' "+ms.tdEvent(formId, 'PROJECT_FLAG')+">");
            arrHtml.push("<span colno='PROJECT_FLAG' class='"+ms.uiClass(formId, 'PROJECT_FLAG')+"' style='"+ms.uiStyle(formId, 'PROJECT_FLAG')+"' "+ms.uiEvent(formId, 'PROJECT_FLAG')+" title='"+ms.titleAttr(formId,'PROJECT_FLAG','IS_TITLE_ATTR',v)+"' >"+v['PROJECT_FLAG']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PRODUCT_MATERIAL_VER' name='noprintset_PRODUCT_MATERIAL_VER' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_MATERIAL_VER')+"' style='"+ms.tdStyle(formId, 'PRODUCT_MATERIAL_VER')+"' "+ms.tdEvent(formId, 'PRODUCT_MATERIAL_VER')+">");
            arrHtml.push("<span colno='PRODUCT_MATERIAL_VER' class='"+ms.uiClass(formId, 'PRODUCT_MATERIAL_VER')+"' style='"+ms.uiStyle(formId, 'PRODUCT_MATERIAL_VER')+"' "+ms.uiEvent(formId, 'PRODUCT_MATERIAL_VER')+" title='"+ms.titleAttr(formId,'PRODUCT_MATERIAL_VER','IS_TITLE_ATTR',v)+"' >"+v['PRODUCT_MATERIAL_VER']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PROJECT_ERPTYPE' name='noprintset_PROJECT_ERPTYPE' class='datagrid-cell "+ms.tdClass(formId, 'PROJECT_ERPTYPE')+"' style='"+ms.tdStyle(formId, 'PROJECT_ERPTYPE')+"' "+ms.tdEvent(formId, 'PROJECT_ERPTYPE')+">");
            arrHtml.push("<span colno='PROJECT_ERPTYPE' class='"+ms.uiClass(formId, 'PROJECT_ERPTYPE')+"' style='"+ms.uiStyle(formId, 'PROJECT_ERPTYPE')+"' "+ms.uiEvent(formId, 'PROJECT_ERPTYPE')+" title='"+ms.titleAttr(formId,'PROJECT_ERPTYPE','IS_TITLE_ATTR',v)+"' >"+v['PROJECT_ERPTYPE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PRODUCT_CONFIGURE' name='noprintset_PRODUCT_CONFIGURE' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_CONFIGURE')+"' style='"+ms.tdStyle(formId, 'PRODUCT_CONFIGURE')+"' "+ms.tdEvent(formId, 'PRODUCT_CONFIGURE')+">");
            arrHtml.push("<span colno='PRODUCT_CONFIGURE' class='"+ms.uiClass(formId, 'PRODUCT_CONFIGURE')+"' style='"+ms.uiStyle(formId, 'PRODUCT_CONFIGURE')+"' "+ms.uiEvent(formId, 'PRODUCT_CONFIGURE')+" title='"+ms.titleAttr(formId,'PRODUCT_CONFIGURE','IS_TITLE_ATTR',v)+"' >"+v['PRODUCT_CONFIGURE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PM_CHANGE_TIMES' name='noprintset_PM_CHANGE_TIMES' class='datagrid-cell "+ms.tdClass(formId, 'PM_CHANGE_TIMES')+"' style='"+ms.tdStyle(formId, 'PM_CHANGE_TIMES')+"' "+ms.tdEvent(formId, 'PM_CHANGE_TIMES')+">");
            arrHtml.push("<span colno='PM_CHANGE_TIMES' class='"+ms.uiClass(formId, 'PM_CHANGE_TIMES')+"' style='"+ms.uiStyle(formId, 'PM_CHANGE_TIMES')+"' "+ms.uiEvent(formId, 'PM_CHANGE_TIMES')+" title='"+ms.titleAttr(formId,'PM_CHANGE_TIMES','IS_TITLE_ATTR',v)+"' >"+v['PM_CHANGE_TIMES']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PRODUCT_SN_START' name='noprintset_PRODUCT_SN_START' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_SN_START')+"' style='"+ms.tdStyle(formId, 'PRODUCT_SN_START')+"' "+ms.tdEvent(formId, 'PRODUCT_SN_START')+">");
            arrHtml.push("<span colno='PRODUCT_SN_START' class='"+ms.uiClass(formId, 'PRODUCT_SN_START')+"' style='"+ms.uiStyle(formId, 'PRODUCT_SN_START')+"' "+ms.uiEvent(formId, 'PRODUCT_SN_START')+" title='"+ms.titleAttr(formId,'PRODUCT_SN_START','IS_TITLE_ATTR',v)+"' >"+v['PRODUCT_SN_START']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PRODUCT_PACK_SEQ' name='noprintset_PRODUCT_PACK_SEQ' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_PACK_SEQ')+"' style='"+ms.tdStyle(formId, 'PRODUCT_PACK_SEQ')+"' "+ms.tdEvent(formId, 'PRODUCT_PACK_SEQ')+">");
            arrHtml.push("<span colno='PRODUCT_PACK_SEQ' class='"+ms.uiClass(formId, 'PRODUCT_PACK_SEQ')+"' style='"+ms.uiStyle(formId, 'PRODUCT_PACK_SEQ')+"' "+ms.uiEvent(formId, 'PRODUCT_PACK_SEQ')+" title='"+ms.titleAttr(formId,'PRODUCT_PACK_SEQ','IS_TITLE_ATTR',v)+"' >"+v['PRODUCT_PACK_SEQ']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PRODUCT_SN_PREFIX' name='noprintset_PRODUCT_SN_PREFIX' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_SN_PREFIX')+"' style='"+ms.tdStyle(formId, 'PRODUCT_SN_PREFIX')+"' "+ms.tdEvent(formId, 'PRODUCT_SN_PREFIX')+">");
            arrHtml.push("<span colno='PRODUCT_SN_PREFIX' class='"+ms.uiClass(formId, 'PRODUCT_SN_PREFIX')+"' style='"+ms.uiStyle(formId, 'PRODUCT_SN_PREFIX')+"' "+ms.uiEvent(formId, 'PRODUCT_SN_PREFIX')+" title='"+ms.titleAttr(formId,'PRODUCT_SN_PREFIX','IS_TITLE_ATTR',v)+"' >"+v['PRODUCT_SN_PREFIX']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PRODUCT_SN_END' name='noprintset_PRODUCT_SN_END' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_SN_END')+"' style='"+ms.tdStyle(formId, 'PRODUCT_SN_END')+"' "+ms.tdEvent(formId, 'PRODUCT_SN_END')+">");
            arrHtml.push("<span colno='PRODUCT_SN_END' class='"+ms.uiClass(formId, 'PRODUCT_SN_END')+"' style='"+ms.uiStyle(formId, 'PRODUCT_SN_END')+"' "+ms.uiEvent(formId, 'PRODUCT_SN_END')+" title='"+ms.titleAttr(formId,'PRODUCT_SN_END','IS_TITLE_ATTR',v)+"' >"+v['PRODUCT_SN_END']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='FAI_NUM' name='noprintset_FAI_NUM' class='datagrid-cell "+ms.tdClass(formId, 'FAI_NUM')+"' style='"+ms.tdStyle(formId, 'FAI_NUM')+"' "+ms.tdEvent(formId, 'FAI_NUM')+">");
            arrHtml.push("<span colno='FAI_NUM' class='"+ms.uiClass(formId, 'FAI_NUM')+"' style='"+ms.uiStyle(formId, 'FAI_NUM')+"' "+ms.uiEvent(formId, 'FAI_NUM')+" title='"+ms.titleAttr(formId,'FAI_NUM','IS_TITLE_ATTR',v)+"' >"+v['FAI_NUM']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PROJECT_STEP' name='noprintset_PROJECT_STEP' class='datagrid-cell "+ms.tdClass(formId, 'PROJECT_STEP')+"' style='"+ms.tdStyle(formId, 'PROJECT_STEP')+"' "+ms.tdEvent(formId, 'PROJECT_STEP')+">");
            arrHtml.push("<span colno='PROJECT_STEP' class='"+ms.uiClass(formId, 'PROJECT_STEP')+"' style='"+ms.uiStyle(formId, 'PROJECT_STEP')+"' "+ms.uiEvent(formId, 'PROJECT_STEP')+" title='"+ms.titleAttr(formId,'PROJECT_STEP','IS_TITLE_ATTR',v)+"' >"+v['PROJECT_STEP']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PROJECT_ID' name='noprintset_PROJECT_ID' class='datagrid-cell "+ms.tdClass(formId, 'PROJECT_ID')+"' style='"+ms.tdStyle(formId, 'PROJECT_ID')+"' "+ms.tdEvent(formId, 'PROJECT_ID')+">");
            arrHtml.push("<span colno='PROJECT_ID' class='"+ms.uiClass(formId, 'PROJECT_ID')+"' style='"+ms.uiStyle(formId, 'PROJECT_ID')+"' "+ms.uiEvent(formId, 'PROJECT_ID')+" title='"+ms.titleAttr(formId,'PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['PROJECT_ID']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PRODUCT_MATERIAL' name='noprintset_PRODUCT_MATERIAL' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_MATERIAL')+"' style='"+ms.tdStyle(formId, 'PRODUCT_MATERIAL')+"' "+ms.tdEvent(formId, 'PRODUCT_MATERIAL')+">");
            arrHtml.push("<span colno='PRODUCT_MATERIAL' class='"+ms.uiClass(formId, 'PRODUCT_MATERIAL')+"' style='"+ms.uiStyle(formId, 'PRODUCT_MATERIAL')+"' "+ms.uiEvent(formId, 'PRODUCT_MATERIAL')+" title='"+ms.titleAttr(formId,'PRODUCT_MATERIAL','IS_TITLE_ATTR',v)+"' >"+v['PRODUCT_MATERIAL']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PRODUCT_NAME' name='noprintset_PRODUCT_NAME' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_NAME')+"' style='"+ms.tdStyle(formId, 'PRODUCT_NAME')+"' "+ms.tdEvent(formId, 'PRODUCT_NAME')+">");
            arrHtml.push("<span colno='PRODUCT_NAME' class='"+ms.uiClass(formId, 'PRODUCT_NAME')+"' style='"+ms.uiStyle(formId, 'PRODUCT_NAME')+"' "+ms.uiEvent(formId, 'PRODUCT_NAME')+" title='"+ms.titleAttr(formId,'PRODUCT_NAME','IS_TITLE_ATTR',v)+"' >"+v['PRODUCT_NAME']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PRODUCT_STANDARD' name='noprintset_PRODUCT_STANDARD' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_STANDARD')+"' style='"+ms.tdStyle(formId, 'PRODUCT_STANDARD')+"' "+ms.tdEvent(formId, 'PRODUCT_STANDARD')+">");
            arrHtml.push("<span colno='PRODUCT_STANDARD' class='"+ms.uiClass(formId, 'PRODUCT_STANDARD')+"' style='"+ms.uiStyle(formId, 'PRODUCT_STANDARD')+"' "+ms.uiEvent(formId, 'PRODUCT_STANDARD')+" title='"+ms.titleAttr(formId,'PRODUCT_STANDARD','IS_TITLE_ATTR',v)+"' >"+v['PRODUCT_STANDARD']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SCRAPPED_QTY' name='noprintset_SCRAPPED_QTY' class='datagrid-cell "+ms.tdClass(formId, 'SCRAPPED_QTY')+"' style='"+ms.tdStyle(formId, 'SCRAPPED_QTY')+"' "+ms.tdEvent(formId, 'SCRAPPED_QTY')+">");
            arrHtml.push("<span colno='SCRAPPED_QTY' class='"+ms.uiClass(formId, 'SCRAPPED_QTY')+"' style='"+ms.uiStyle(formId, 'SCRAPPED_QTY')+"' "+ms.uiEvent(formId, 'SCRAPPED_QTY')+" title='"+ms.titleAttr(formId,'SCRAPPED_QTY','IS_TITLE_ATTR',v)+"' >"+v['SCRAPPED_QTY']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DESTROY_NO' name='noprintset_DESTROY_NO' class='datagrid-cell "+ms.tdClass(formId, 'DESTROY_NO')+"' style='"+ms.tdStyle(formId, 'DESTROY_NO')+"' "+ms.tdEvent(formId, 'DESTROY_NO')+">");
            arrHtml.push("<span colno='DESTROY_NO' class='"+ms.uiClass(formId, 'DESTROY_NO')+"' style='"+ms.uiStyle(formId, 'DESTROY_NO')+"' "+ms.uiEvent(formId, 'DESTROY_NO')+" title='"+ms.titleAttr(formId,'DESTROY_NO','IS_TITLE_ATTR',v)+"' >"+v['DESTROY_NO']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CUST_CODE' name='noprintset_CUST_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CUST_CODE')+"' style='"+ms.tdStyle(formId, 'CUST_CODE')+"' "+ms.tdEvent(formId, 'CUST_CODE')+">");
            arrHtml.push("<span colno='CUST_CODE' class='"+ms.uiClass(formId, 'CUST_CODE')+"' style='"+ms.uiStyle(formId, 'CUST_CODE')+"' "+ms.uiEvent(formId, 'CUST_CODE')+" title='"+ms.titleAttr(formId,'CUST_CODE','IS_TITLE_ATTR',v)+"' >"+v['CUST_CODE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PRODUCT_COUNT' name='noprintset_PRODUCT_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_COUNT')+"' style='"+ms.tdStyle(formId, 'PRODUCT_COUNT')+"' "+ms.tdEvent(formId, 'PRODUCT_COUNT')+">");
            arrHtml.push("<span colno='PRODUCT_COUNT' class='"+ms.uiClass(formId, 'PRODUCT_COUNT')+"' style='"+ms.uiStyle(formId, 'PRODUCT_COUNT')+"' "+ms.uiEvent(formId, 'PRODUCT_COUNT')+" title='"+ms.titleAttr(formId,'PRODUCT_COUNT','IS_TITLE_ATTR',v)+"' >"+v['PRODUCT_COUNT']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='FQC_COUNT' name='noprintset_FQC_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'FQC_COUNT')+"' style='"+ms.tdStyle(formId, 'FQC_COUNT')+"' "+ms.tdEvent(formId, 'FQC_COUNT')+">");
            arrHtml.push("<span colno='FQC_COUNT' class='"+ms.uiClass(formId, 'FQC_COUNT')+"' style='"+ms.uiStyle(formId, 'FQC_COUNT')+"' "+ms.uiEvent(formId, 'FQC_COUNT')+" title='"+ms.titleAttr(formId,'FQC_COUNT','IS_TITLE_ATTR',v)+"' >"+v['FQC_COUNT']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='FINISH_COUNT' name='noprintset_FINISH_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'FINISH_COUNT')+"' style='"+ms.tdStyle(formId, 'FINISH_COUNT')+"' "+ms.tdEvent(formId, 'FINISH_COUNT')+">");
            arrHtml.push("<span colno='FINISH_COUNT' class='"+ms.uiClass(formId, 'FINISH_COUNT')+"' style='"+ms.uiStyle(formId, 'FINISH_COUNT')+"' "+ms.uiEvent(formId, 'FINISH_COUNT')+" title='"+ms.titleAttr(formId,'FINISH_COUNT','IS_TITLE_ATTR',v)+"' >"+v['FINISH_COUNT']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WORKING_SC' name='noprintset_WORKING_SC' class='datagrid-cell "+ms.tdClass(formId, 'WORKING_SC')+"' style='"+ms.tdStyle(formId, 'WORKING_SC')+"' "+ms.tdEvent(formId, 'WORKING_SC')+">");
            arrHtml.push("<span colno='WORKING_SC' class='"+ms.uiClass(formId, 'WORKING_SC')+"' style='"+ms.uiStyle(formId, 'WORKING_SC')+"' "+ms.uiEvent(formId, 'WORKING_SC')+" title='"+ms.titleAttr(formId,'WORKING_SC','IS_TITLE_ATTR',v)+"' >"+v['WORKING_SC']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PROJECT_TYPE' name='noprintset_PROJECT_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'PROJECT_TYPE')+"' style='"+ms.tdStyle(formId, 'PROJECT_TYPE')+"' "+ms.tdEvent(formId, 'PROJECT_TYPE')+">");
            arrHtml.push("<span colno='PROJECT_TYPE' class='"+ms.uiClass(formId, 'PROJECT_TYPE')+"' style='"+ms.uiStyle(formId, 'PROJECT_TYPE')+"' "+ms.uiEvent(formId, 'PROJECT_TYPE')+" title='"+ms.titleAttr(formId,'PROJECT_TYPE','IS_TITLE_ATTR',v)+"' >"+v['PROJECT_TYPE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PROLEPSIS_START_DATE' name='noprintset_PROLEPSIS_START_DATE' class='datagrid-cell "+ms.tdClass(formId, 'PROLEPSIS_START_DATE')+"' style='"+ms.tdStyle(formId, 'PROLEPSIS_START_DATE')+"' "+ms.tdEvent(formId, 'PROLEPSIS_START_DATE')+">");
            arrHtml.push("<span colno='PROLEPSIS_START_DATE' class='"+ms.uiClass(formId, 'PROLEPSIS_START_DATE')+"' style='"+ms.uiStyle(formId, 'PROLEPSIS_START_DATE')+"' "+ms.uiEvent(formId, 'PROLEPSIS_START_DATE')+" title='"+ms.titleAttr(formId,'PROLEPSIS_START_DATE','IS_TITLE_ATTR',v)+"' >"+v['PROLEPSIS_START_DATE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PROLEPSIS_END_DATE' name='noprintset_PROLEPSIS_END_DATE' class='datagrid-cell "+ms.tdClass(formId, 'PROLEPSIS_END_DATE')+"' style='"+ms.tdStyle(formId, 'PROLEPSIS_END_DATE')+"' "+ms.tdEvent(formId, 'PROLEPSIS_END_DATE')+">");
            arrHtml.push("<span colno='PROLEPSIS_END_DATE' class='"+ms.uiClass(formId, 'PROLEPSIS_END_DATE')+"' style='"+ms.uiStyle(formId, 'PROLEPSIS_END_DATE')+"' "+ms.uiEvent(formId, 'PROLEPSIS_END_DATE')+" title='"+ms.titleAttr(formId,'PROLEPSIS_END_DATE','IS_TITLE_ATTR',v)+"' >"+v['PROLEPSIS_END_DATE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TPPB_PLAN_DELIVERY_DATE' name='noprintset_TPPB_PLAN_DELIVERY_DATE' class='datagrid-cell "+ms.tdClass(formId, 'TPPB_PLAN_DELIVERY_DATE')+"' style='"+ms.tdStyle(formId, 'TPPB_PLAN_DELIVERY_DATE')+"' "+ms.tdEvent(formId, 'TPPB_PLAN_DELIVERY_DATE')+">");
            arrHtml.push("<span colno='TPPB_PLAN_DELIVERY_DATE' class='"+ms.uiClass(formId, 'TPPB_PLAN_DELIVERY_DATE')+"' style='"+ms.uiStyle(formId, 'TPPB_PLAN_DELIVERY_DATE')+"' "+ms.uiEvent(formId, 'TPPB_PLAN_DELIVERY_DATE')+" title='"+ms.titleAttr(formId,'TPPB_PLAN_DELIVERY_DATE','IS_TITLE_ATTR',v)+"' >"+v['TPPB_PLAN_DELIVERY_DATE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PM_MEMO' name='noprintset_PM_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'PM_MEMO')+"' style='"+ms.tdStyle(formId, 'PM_MEMO')+"' "+ms.tdEvent(formId, 'PM_MEMO')+">");
            arrHtml.push("<span colno='PM_MEMO' class='"+ms.uiClass(formId, 'PM_MEMO')+"' style='"+ms.uiStyle(formId, 'PM_MEMO')+"' "+ms.uiEvent(formId, 'PM_MEMO')+" title='"+ms.titleAttr(formId,'PM_MEMO','IS_TITLE_ATTR',v)+"' >"+v['PM_MEMO']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PRODUCT_LINE' name='noprintset_PRODUCT_LINE' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_LINE')+"' style='"+ms.tdStyle(formId, 'PRODUCT_LINE')+"' "+ms.tdEvent(formId, 'PRODUCT_LINE')+">");
            arrHtml.push("<span colno='PRODUCT_LINE' class='"+ms.uiClass(formId, 'PRODUCT_LINE')+"' style='"+ms.uiStyle(formId, 'PRODUCT_LINE')+"' "+ms.uiEvent(formId, 'PRODUCT_LINE')+" title='"+ms.titleAttr(formId,'PRODUCT_LINE','IS_TITLE_ATTR',v)+"' >"+v['PRODUCT_LINE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ACTUAL_START_DATE' name='noprintset_ACTUAL_START_DATE' class='datagrid-cell "+ms.tdClass(formId, 'ACTUAL_START_DATE')+"' style='"+ms.tdStyle(formId, 'ACTUAL_START_DATE')+"' "+ms.tdEvent(formId, 'ACTUAL_START_DATE')+">");
            arrHtml.push("<span colno='ACTUAL_START_DATE' class='"+ms.uiClass(formId, 'ACTUAL_START_DATE')+"' style='"+ms.uiStyle(formId, 'ACTUAL_START_DATE')+"' "+ms.uiEvent(formId, 'ACTUAL_START_DATE')+" title='"+ms.titleAttr(formId,'ACTUAL_START_DATE','IS_TITLE_ATTR',v)+"' >"+v['ACTUAL_START_DATE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ACTUAL_END_DATE' name='noprintset_ACTUAL_END_DATE' class='datagrid-cell "+ms.tdClass(formId, 'ACTUAL_END_DATE')+"' style='"+ms.tdStyle(formId, 'ACTUAL_END_DATE')+"' "+ms.tdEvent(formId, 'ACTUAL_END_DATE')+">");
            arrHtml.push("<span colno='ACTUAL_END_DATE' class='"+ms.uiClass(formId, 'ACTUAL_END_DATE')+"' style='"+ms.uiStyle(formId, 'ACTUAL_END_DATE')+"' "+ms.uiEvent(formId, 'ACTUAL_END_DATE')+" title='"+ms.titleAttr(formId,'ACTUAL_END_DATE','IS_TITLE_ATTR',v)+"' >"+v['ACTUAL_END_DATE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PM_CLOSE_REASON' name='noprintset_PM_CLOSE_REASON' class='datagrid-cell "+ms.tdClass(formId, 'PM_CLOSE_REASON')+"' style='"+ms.tdStyle(formId, 'PM_CLOSE_REASON')+"' "+ms.tdEvent(formId, 'PM_CLOSE_REASON')+">");
            arrHtml.push("<span colno='PM_CLOSE_REASON' class='"+ms.uiClass(formId, 'PM_CLOSE_REASON')+"' style='"+ms.uiStyle(formId, 'PM_CLOSE_REASON')+"' "+ms.uiEvent(formId, 'PM_CLOSE_REASON')+" title='"+ms.titleAttr(formId,'PM_CLOSE_REASON','IS_TITLE_ATTR',v)+"' >"+v['PM_CLOSE_REASON']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PM_OFONESELF' name='noprintset_PM_OFONESELF' class='datagrid-cell "+ms.tdClass(formId, 'PM_OFONESELF')+"' style='"+ms.tdStyle(formId, 'PM_OFONESELF')+"' "+ms.tdEvent(formId, 'PM_OFONESELF')+">");
            arrHtml.push("<span colno='PM_OFONESELF' class='"+ms.uiClass(formId, 'PM_OFONESELF')+"' style='"+ms.uiStyle(formId, 'PM_OFONESELF')+"' "+ms.uiEvent(formId, 'PM_OFONESELF')+" title='"+ms.titleAttr(formId,'PM_OFONESELF','IS_TITLE_ATTR',v)+"' >"+v['PM_OFONESELF']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='REL_NUM' name='noprintset_REL_NUM' class='datagrid-cell "+ms.tdClass(formId, 'REL_NUM')+"' style='"+ms.tdStyle(formId, 'REL_NUM')+"' "+ms.tdEvent(formId, 'REL_NUM')+">");
            arrHtml.push("<span colno='REL_NUM' class='"+ms.uiClass(formId, 'REL_NUM')+"' style='"+ms.uiStyle(formId, 'REL_NUM')+"' "+ms.uiEvent(formId, 'REL_NUM')+" title='"+ms.titleAttr(formId,'REL_NUM','IS_TITLE_ATTR',v)+"' >"+v['REL_NUM']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PROJECT_SORT' name='noprintset_PROJECT_SORT' class='datagrid-cell "+ms.tdClass(formId, 'PROJECT_SORT')+"' style='"+ms.tdStyle(formId, 'PROJECT_SORT')+"' "+ms.tdEvent(formId, 'PROJECT_SORT')+">");
            arrHtml.push("<span colno='PROJECT_SORT' class='"+ms.uiClass(formId, 'PROJECT_SORT')+"' style='"+ms.uiStyle(formId, 'PROJECT_SORT')+"' "+ms.uiEvent(formId, 'PROJECT_SORT')+" title='"+ms.titleAttr(formId,'PROJECT_SORT','IS_TITLE_ATTR',v)+"' >"+v['PROJECT_SORT']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_print_"+formId).html(arrHtml.join(""));
    }
    setNumColWidth(formId);
    clearAllSelect();
    setTableWidth(formId);
    setScroll(formId);
}
</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
