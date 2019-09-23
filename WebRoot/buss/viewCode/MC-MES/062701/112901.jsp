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
		<dict:lang value="Sawyer测试模板1129" />
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
		<bu:header formId ="e7ffc6d5b0784a0798f464e6a653d641"/>

    
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
		<bu:func viewId="79425e4b701d4ca9b242b31943c0840e" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     

  <table class="search_table">
      <bu:search deal_mark="1" viewId="79425e4b701d4ca9b242b31943c0840e" /> 

  </table>

                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagee7ffc6d5b0784a0798f464e6a653d641" id="formPagee7ffc6d5b0784a0798f464e6a653d641" value="${formPagee7ffc6d5b0784a0798f464e6a653d641}"/>
		<input type="hidden" name="formId" id="formId1" value='e7ffc6d5b0784a0798f464e6a653d641'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="e7ffc6d5b0784a0798f464e6a653d641">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxe7ffc6d5b0784a0798f464e6a653d641" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innere7ffc6d5b0784a0798f464e6a653d641">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablee7ffc6d5b0784a0798f464e6a653d641">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="e7ffc6d5b0784a0798f464e6a653d641" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_e7ffc6d5b0784a0798f464e6a653d641" onclick="_selectAjaxTableAllData(this,'e7ffc6d5b0784a0798f464e6a653d641')" style="cursor: pointer;"title="全选"/></span></td>
			<td name="noprintset_SNO" class="datagrid-cell"><bu:uitn colNo="SNO" formId="e7ffc6d5b0784a0798f464e6a653d641" /></td>
			<td name="noprintset_SNAME" class="datagrid-cell"><bu:uitn colNo="SNAME" formId="e7ffc6d5b0784a0798f464e6a653d641" /></td>
			<td name="noprintset_DEPTS" class="datagrid-cell"><bu:uitn colNo="DEPTS" formId="e7ffc6d5b0784a0798f464e6a653d641" /></td>
			<td name="noprintset_HOBBY" class="datagrid-cell"><bu:uitn colNo="HOBBY" formId="e7ffc6d5b0784a0798f464e6a653d641" /></td>
			<td name="noprintset_NATION" class="datagrid-cell"><bu:uitn colNo="NATION" formId="e7ffc6d5b0784a0798f464e6a653d641" /></td>
			<td name="noprintset_PROVINCE" class="datagrid-cell"><bu:uitn colNo="PROVINCE" formId="e7ffc6d5b0784a0798f464e6a653d641" /></td>
			<td name="noprintset_CITY" class="datagrid-cell"><bu:uitn colNo="CITY" formId="e7ffc6d5b0784a0798f464e6a653d641" /></td>
			<td name="noprintset_TOWN" class="datagrid-cell"><bu:uitn colNo="TOWN" formId="e7ffc6d5b0784a0798f464e6a653d641" /></td>
			<td name="noprintset_VILLAGE" class="datagrid-cell"><bu:uitn colNo="VILLAGE" formId="e7ffc6d5b0784a0798f464e6a653d641" /></td>
			<td name="noprintset_WU_CODE" class="datagrid-cell"><bu:uitn colNo="WU_CODE" formId="e7ffc6d5b0784a0798f464e6a653d641" /></td>
			<td name="noprintset_WU_NAME" class="datagrid-cell"><bu:uitn colNo="WU_NAME" formId="e7ffc6d5b0784a0798f464e6a653d641" /></td>
			<td name="noprintset_WU_SPEC" class="datagrid-cell"><bu:uitn colNo="WU_SPEC" formId="e7ffc6d5b0784a0798f464e6a653d641" /></td>
			<td name="noprintset_CR_ITEM_REPLACE" class="datagrid-cell"><bu:uitn colNo="CR_ITEM_REPLACE" formId="e7ffc6d5b0784a0798f464e6a653d641" /></td>
			<td name="noprintset_SCORE" class="datagrid-cell"><bu:uitn colNo="SCORE" formId="e7ffc6d5b0784a0798f464e6a653d641" /></td>
			<td name="noprintset_EDUCATION" class="datagrid-cell"><bu:uitn colNo="EDUCATION" formId="e7ffc6d5b0784a0798f464e6a653d641" /></td>
			<td name="noprintset_SEX" class="datagrid-cell"><bu:uitn colNo="SEX" formId="e7ffc6d5b0784a0798f464e6a653d641" /></td>
			<td name="noprintset_AGE" class="datagrid-cell"><bu:uitn colNo="AGE" formId="e7ffc6d5b0784a0798f464e6a653d641" /></td>
			<td name="noprintset_DATES" class="datagrid-cell"><bu:uitn colNo="DATES" formId="e7ffc6d5b0784a0798f464e6a653d641" /></td>
			<td name="noprintset_TIMES" class="datagrid-cell"><bu:uitn colNo="TIMES" formId="e7ffc6d5b0784a0798f464e6a653d641" /></td>
			<td name="noprintset_COMMS" class="datagrid-cell"><bu:uitn colNo="COMMS" formId="e7ffc6d5b0784a0798f464e6a653d641" /></td>
			<td name="noprintset_LABEL" class="datagrid-cell"><bu:uitn colNo="LABEL" formId="e7ffc6d5b0784a0798f464e6a653d641" /></td>
			<td name="noprintset_BUTTONS" class="datagrid-cell"><bu:uitn colNo="BUTTONS" formId="e7ffc6d5b0784a0798f464e6a653d641" /></td>
			<td name="noprintset_PICTURES" class="datagrid-cell"><bu:uitn colNo="PICTURES" formId="e7ffc6d5b0784a0798f464e6a653d641" /></td>
			<td name="noprintset_PIC_SIZE" class="datagrid-cell"><bu:uitn colNo="PIC_SIZE" formId="e7ffc6d5b0784a0798f464e6a653d641" /></td>
			<td name="noprintset_PIC_NAME" class="datagrid-cell"><bu:uitn colNo="PIC_NAME" formId="e7ffc6d5b0784a0798f464e6a653d641" /></td>
			<td name="noprintset_PIC_PATH" class="datagrid-cell"><bu:uitn colNo="PIC_PATH" formId="e7ffc6d5b0784a0798f464e6a653d641" /></td>
			<td name="noprintset_PIC_STREAM" class="datagrid-cell"><bu:uitn colNo="PIC_STREAM" formId="e7ffc6d5b0784a0798f464e6a653d641" /></td>
			<td name="noprintset_FILES" class="datagrid-cell"><bu:uitn colNo="FILES" formId="e7ffc6d5b0784a0798f464e6a653d641" /></td>
			<td name="noprintset_FILE_SIZE" class="datagrid-cell"><bu:uitn colNo="FILE_SIZE" formId="e7ffc6d5b0784a0798f464e6a653d641" /></td>
			<td name="noprintset_FILE_NAME" class="datagrid-cell"><bu:uitn colNo="FILE_NAME" formId="e7ffc6d5b0784a0798f464e6a653d641" /></td>
			<td name="noprintset_FILE_PATH" class="datagrid-cell"><bu:uitn colNo="FILE_PATH" formId="e7ffc6d5b0784a0798f464e6a653d641" /></td>
			<td name="noprintset_MUL_FILES" class="datagrid-cell"><bu:uitn colNo="MUL_FILES" formId="e7ffc6d5b0784a0798f464e6a653d641" /></td>
			<td name="noprintset_RICHTEXT" class="datagrid-cell"><bu:uitn colNo="RICHTEXT" formId="e7ffc6d5b0784a0798f464e6a653d641" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDive7ffc6d5b0784a0798f464e6a653d641" onscroll="ajaxTableScroll(this,'e7ffc6d5b0784a0798f464e6a653d641')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxe7ffc6d5b0784a0798f464e6a653d641">
		<tbody id="tbody_e7ffc6d5b0784a0798f464e6a653d641" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagee7ffc6d5b0784a0798f464e6a653d641==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=e7ffc6d5b0784a0798f464e6a653d641&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('e7ffc6d5b0784a0798f464e6a653d641','1');">打印</button>
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
 <td style="width: 100px;text-align: right;"><span>序号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="SEQ" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="SEQ" value="30" title_name="序号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?学号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="SNO" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="SNO" value="" title_name="?学号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>姓名</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="SNAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="SNAME" value="" title_name="姓名" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>部门</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="DEPTS" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="DEPTS" value="" title_name="部门" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?爱好</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="HOBBY" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="HOBBY" value="" title_name="?爱好" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?民族</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="NATION" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="NATION" value="" title_name="?民族" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?省</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PROVINCE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PROVINCE" value="" title_name="?省" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?市</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CITY" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CITY" value="" title_name="?市" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?镇</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="TOWN" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="TOWN" value="" title_name="?镇" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?村</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="VILLAGE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="VILLAGE" value="" title_name="?村" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?物料号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WU_CODE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WU_CODE" value="" title_name="?物料号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?物料名</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WU_NAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WU_NAME" value="" title_name="?物料名" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?物料描述</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WU_SPEC" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WU_SPEC" value="" title_name="?物料描述" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?替代料号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CR_ITEM_REPLACE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CR_ITEM_REPLACE" value="" title_name="?替代料号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?学分</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="SCORE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="SCORE" value="" title_name="?学分" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?学历</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="EDUCATION" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="EDUCATION" value="" title_name="?学历" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?性别</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="SEX" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="SEX" value="" title_name="?性别" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?年龄</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="AGE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="AGE" value="" title_name="?年龄" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>日期</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="DATES" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="DATES" value="" title_name="日期" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>时间</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="TIMES" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="TIMES" value="" title_name="时间" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?多行文本</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="COMMS" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="COMMS" value="" title_name="?多行文本" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?标记</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="LABEL" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="LABEL" value="" title_name="?标记" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?按钮</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="BUTTONS" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="BUTTONS" value="" title_name="?按钮" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>上传图片</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PICTURES" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PICTURES" value="" title_name="上传图片" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?图片大小</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PIC_SIZE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PIC_SIZE" value="" title_name="?图片大小" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>图片名称</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PIC_NAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PIC_NAME" value="" title_name="图片名称" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?图片路径</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PIC_PATH" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PIC_PATH" value="" title_name="?图片路径" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?图片流</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PIC_STREAM" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PIC_STREAM" value="" title_name="?图片流" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>上传文件</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="FILES" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="FILES" value="" title_name="上传文件" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>文件大小</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="FILE_SIZE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="FILE_SIZE" value="" title_name="文件大小" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>文件名</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="FILE_NAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="FILE_NAME" value="" title_name="文件名" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>文件路径</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="FILE_PATH" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="FILE_PATH" value="" title_name="文件路径" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?多文件</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="MUL_FILES" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="MUL_FILES" value="" title_name="?多文件" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?富文本编辑器</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="RICHTEXT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="RICHTEXT" value="" title_name="?富文本编辑器" />px
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
		<bu:submit viewId="79425e4b701d4ca9b242b31943c0840e" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="79425e4b701d4ca9b242b31943c0840e" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
    
<script>
<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='e7ffc6d5b0784a0798f464e6a653d641'){<%--Sawyer测试模板1129--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SNO' name='noprintset_SNO' class='datagrid-cell "+ms.tdClass(formId, 'SNO')+"' style='"+ms.tdStyle(formId, 'SNO')+"' "+ms.tdEvent(formId, 'SNO')+">")
            arrHtml.push("<span colno='SNO' class='"+ms.uiClass(formId, 'SNO')+"' style='"+ms.uiStyle(formId, 'SNO')+"' "+ms.uiEvent(formId, 'SNO')+" title='"+ms.titleAttr(formId,'SNO','IS_TITLE_ATTR',v)+"' >"+v['SNO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SNAME' name='noprintset_SNAME' class='datagrid-cell "+ms.tdClass(formId, 'SNAME')+"' style='"+ms.tdStyle(formId, 'SNAME')+"' "+ms.tdEvent(formId, 'SNAME')+">")
            arrHtml.push("<span colno='SNAME' class='"+ms.uiClass(formId, 'SNAME')+"' style='"+ms.uiStyle(formId, 'SNAME')+"' "+ms.uiEvent(formId, 'SNAME')+" title='"+ms.titleAttr(formId,'SNAME','IS_TITLE_ATTR',v)+"' >"+v['SNAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DEPTS' name='noprintset_DEPTS' class='datagrid-cell "+ms.tdClass(formId, 'DEPTS')+"' style='"+ms.tdStyle(formId, 'DEPTS')+"' "+ms.tdEvent(formId, 'DEPTS')+">")
            arrHtml.push("<span colno='DEPTS' class='"+ms.uiClass(formId, 'DEPTS')+"' style='"+ms.uiStyle(formId, 'DEPTS')+"' "+ms.uiEvent(formId, 'DEPTS')+" title='"+ms.titleAttr(formId,'DEPTS','IS_TITLE_ATTR',v)+"' >"+v['DEPTS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='HOBBY' name='noprintset_HOBBY' class='datagrid-cell "+ms.tdClass(formId, 'HOBBY')+"' style='"+ms.tdStyle(formId, 'HOBBY')+"' "+ms.tdEvent(formId, 'HOBBY')+">")
            arrHtml.push("<span colno='HOBBY' class='"+ms.uiClass(formId, 'HOBBY')+"' style='"+ms.uiStyle(formId, 'HOBBY')+"' "+ms.uiEvent(formId, 'HOBBY')+" title='"+ms.titleAttr(formId,'HOBBY','IS_TITLE_ATTR',v)+"' >"+v['HOBBY']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='NATION' name='noprintset_NATION' class='datagrid-cell "+ms.tdClass(formId, 'NATION')+"' style='"+ms.tdStyle(formId, 'NATION')+"' "+ms.tdEvent(formId, 'NATION')+">")
            arrHtml.push("<span colno='NATION' class='"+ms.uiClass(formId, 'NATION')+"' style='"+ms.uiStyle(formId, 'NATION')+"' "+ms.uiEvent(formId, 'NATION')+" title='"+ms.titleAttr(formId,'NATION','IS_TITLE_ATTR',v)+"' >"+v['NATION']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PROVINCE' name='noprintset_PROVINCE' class='datagrid-cell "+ms.tdClass(formId, 'PROVINCE')+"' style='"+ms.tdStyle(formId, 'PROVINCE')+"' "+ms.tdEvent(formId, 'PROVINCE')+">")
            arrHtml.push("<span colno='PROVINCE' class='"+ms.uiClass(formId, 'PROVINCE')+"' style='"+ms.uiStyle(formId, 'PROVINCE')+"' "+ms.uiEvent(formId, 'PROVINCE')+" title='"+ms.titleAttr(formId,'PROVINCE','IS_TITLE_ATTR',v)+"' >"+v['PROVINCE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CITY' name='noprintset_CITY' class='datagrid-cell "+ms.tdClass(formId, 'CITY')+"' style='"+ms.tdStyle(formId, 'CITY')+"' "+ms.tdEvent(formId, 'CITY')+">")
            arrHtml.push("<span colno='CITY' class='"+ms.uiClass(formId, 'CITY')+"' style='"+ms.uiStyle(formId, 'CITY')+"' "+ms.uiEvent(formId, 'CITY')+" title='"+ms.titleAttr(formId,'CITY','IS_TITLE_ATTR',v)+"' >"+v['CITY']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TOWN' name='noprintset_TOWN' class='datagrid-cell "+ms.tdClass(formId, 'TOWN')+"' style='"+ms.tdStyle(formId, 'TOWN')+"' "+ms.tdEvent(formId, 'TOWN')+">")
            arrHtml.push("<span colno='TOWN' class='"+ms.uiClass(formId, 'TOWN')+"' style='"+ms.uiStyle(formId, 'TOWN')+"' "+ms.uiEvent(formId, 'TOWN')+" title='"+ms.titleAttr(formId,'TOWN','IS_TITLE_ATTR',v)+"' >"+v['TOWN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='VILLAGE' name='noprintset_VILLAGE' class='datagrid-cell "+ms.tdClass(formId, 'VILLAGE')+"' style='"+ms.tdStyle(formId, 'VILLAGE')+"' "+ms.tdEvent(formId, 'VILLAGE')+">")
            arrHtml.push("<span colno='VILLAGE' class='"+ms.uiClass(formId, 'VILLAGE')+"' style='"+ms.uiStyle(formId, 'VILLAGE')+"' "+ms.uiEvent(formId, 'VILLAGE')+" title='"+ms.titleAttr(formId,'VILLAGE','IS_TITLE_ATTR',v)+"' >"+v['VILLAGE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WU_CODE' name='noprintset_WU_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WU_CODE')+"' style='"+ms.tdStyle(formId, 'WU_CODE')+"' "+ms.tdEvent(formId, 'WU_CODE')+">")
            arrHtml.push("<span colno='WU_CODE' class='"+ms.uiClass(formId, 'WU_CODE')+"' style='"+ms.uiStyle(formId, 'WU_CODE')+"' "+ms.uiEvent(formId, 'WU_CODE')+" title='"+ms.titleAttr(formId,'WU_CODE','IS_TITLE_ATTR',v)+"' >"+v['WU_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WU_NAME' name='noprintset_WU_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WU_NAME')+"' style='"+ms.tdStyle(formId, 'WU_NAME')+"' "+ms.tdEvent(formId, 'WU_NAME')+">")
            arrHtml.push("<span colno='WU_NAME' class='"+ms.uiClass(formId, 'WU_NAME')+"' style='"+ms.uiStyle(formId, 'WU_NAME')+"' "+ms.uiEvent(formId, 'WU_NAME')+" title='"+ms.titleAttr(formId,'WU_NAME','IS_TITLE_ATTR',v)+"' >"+v['WU_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WU_SPEC' name='noprintset_WU_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'WU_SPEC')+"' style='"+ms.tdStyle(formId, 'WU_SPEC')+"' "+ms.tdEvent(formId, 'WU_SPEC')+">")
            arrHtml.push("<span colno='WU_SPEC' class='"+ms.uiClass(formId, 'WU_SPEC')+"' style='"+ms.uiStyle(formId, 'WU_SPEC')+"' "+ms.uiEvent(formId, 'WU_SPEC')+" title='"+ms.titleAttr(formId,'WU_SPEC','IS_TITLE_ATTR',v)+"' >"+v['WU_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CR_ITEM_REPLACE' name='noprintset_CR_ITEM_REPLACE' class='datagrid-cell "+ms.tdClass(formId, 'CR_ITEM_REPLACE')+"' style='"+ms.tdStyle(formId, 'CR_ITEM_REPLACE')+"' "+ms.tdEvent(formId, 'CR_ITEM_REPLACE')+">")
            arrHtml.push("<span colno='CR_ITEM_REPLACE' class='"+ms.uiClass(formId, 'CR_ITEM_REPLACE')+"' style='"+ms.uiStyle(formId, 'CR_ITEM_REPLACE')+"' "+ms.uiEvent(formId, 'CR_ITEM_REPLACE')+" title='"+ms.titleAttr(formId,'CR_ITEM_REPLACE','IS_TITLE_ATTR',v)+"' >"+v['CR_ITEM_REPLACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SCORE' name='noprintset_SCORE' class='datagrid-cell "+ms.tdClass(formId, 'SCORE')+"' style='"+ms.tdStyle(formId, 'SCORE')+"' "+ms.tdEvent(formId, 'SCORE')+">")
            arrHtml.push("<span colno='SCORE' class='"+ms.uiClass(formId, 'SCORE')+"' style='"+ms.uiStyle(formId, 'SCORE')+"' "+ms.uiEvent(formId, 'SCORE')+" title='"+ms.titleAttr(formId,'SCORE','IS_TITLE_ATTR',v)+"' >"+v['SCORE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='EDUCATION' name='noprintset_EDUCATION' class='datagrid-cell "+ms.tdClass(formId, 'EDUCATION')+"' style='"+ms.tdStyle(formId, 'EDUCATION')+"' "+ms.tdEvent(formId, 'EDUCATION')+">")
            arrHtml.push("<span colno='EDUCATION' class='"+ms.uiClass(formId, 'EDUCATION')+"' style='"+ms.uiStyle(formId, 'EDUCATION')+"' "+ms.uiEvent(formId, 'EDUCATION')+" title='"+ms.titleAttr(formId,'EDUCATION','IS_TITLE_ATTR',v)+"' >"+v['EDUCATION']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SEX' name='noprintset_SEX' class='datagrid-cell "+ms.tdClass(formId, 'SEX')+"' style='"+ms.tdStyle(formId, 'SEX')+"' "+ms.tdEvent(formId, 'SEX')+">")
            arrHtml.push("<span colno='SEX' class='"+ms.uiClass(formId, 'SEX')+"' style='"+ms.uiStyle(formId, 'SEX')+"' "+ms.uiEvent(formId, 'SEX')+" title='"+ms.titleAttr(formId,'SEX','IS_TITLE_ATTR',v)+"' >"+v['SEX']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='AGE' name='noprintset_AGE' class='datagrid-cell "+ms.tdClass(formId, 'AGE')+"' style='"+ms.tdStyle(formId, 'AGE')+"' "+ms.tdEvent(formId, 'AGE')+">")
            arrHtml.push("<span colno='AGE' class='"+ms.uiClass(formId, 'AGE')+"' style='"+ms.uiStyle(formId, 'AGE')+"' "+ms.uiEvent(formId, 'AGE')+" title='"+ms.titleAttr(formId,'AGE','IS_TITLE_ATTR',v)+"' >"+v['AGE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATES' name='noprintset_DATES' class='datagrid-cell "+ms.tdClass(formId, 'DATES')+"' style='"+ms.tdStyle(formId, 'DATES')+"' "+ms.tdEvent(formId, 'DATES')+">")
            arrHtml.push("<span colno='DATES' class='"+ms.uiClass(formId, 'DATES')+"' style='"+ms.uiStyle(formId, 'DATES')+"' "+ms.uiEvent(formId, 'DATES')+" title='"+ms.titleAttr(formId,'DATES','IS_TITLE_ATTR',v)+"' >"+v['DATES']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TIMES' name='noprintset_TIMES' class='datagrid-cell "+ms.tdClass(formId, 'TIMES')+"' style='"+ms.tdStyle(formId, 'TIMES')+"' "+ms.tdEvent(formId, 'TIMES')+">")
            arrHtml.push("<span colno='TIMES' class='"+ms.uiClass(formId, 'TIMES')+"' style='"+ms.uiStyle(formId, 'TIMES')+"' "+ms.uiEvent(formId, 'TIMES')+" title='"+ms.titleAttr(formId,'TIMES','IS_TITLE_ATTR',v)+"' >"+v['TIMES']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='COMMS' name='noprintset_COMMS' class='datagrid-cell "+ms.tdClass(formId, 'COMMS')+"' style='"+ms.tdStyle(formId, 'COMMS')+"' "+ms.tdEvent(formId, 'COMMS')+">")
            arrHtml.push("<span colno='COMMS' class='"+ms.uiClass(formId, 'COMMS')+"' style='"+ms.uiStyle(formId, 'COMMS')+"' "+ms.uiEvent(formId, 'COMMS')+" title='"+ms.titleAttr(formId,'COMMS','IS_TITLE_ATTR',v)+"' >"+v['COMMS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='LABEL' name='noprintset_LABEL' class='datagrid-cell "+ms.tdClass(formId, 'LABEL')+"' style='"+ms.tdStyle(formId, 'LABEL')+"' "+ms.tdEvent(formId, 'LABEL')+">")
            arrHtml.push("<span colno='LABEL' class='"+ms.uiClass(formId, 'LABEL')+"' style='"+ms.uiStyle(formId, 'LABEL')+"' "+ms.uiEvent(formId, 'LABEL')+" title='"+ms.titleAttr(formId,'LABEL','IS_TITLE_ATTR',v)+"' >"+v['LABEL']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='BUTTONS' name='noprintset_BUTTONS' class='datagrid-cell "+ms.tdClass(formId, 'BUTTONS')+"' style='"+ms.tdStyle(formId, 'BUTTONS')+"' "+ms.tdEvent(formId, 'BUTTONS')+">")
            arrHtml.push("<span colno='BUTTONS' class='"+ms.uiClass(formId, 'BUTTONS')+"' style='"+ms.uiStyle(formId, 'BUTTONS')+"' "+ms.uiEvent(formId, 'BUTTONS')+" title='"+ms.titleAttr(formId,'BUTTONS','IS_TITLE_ATTR',v)+"' >"+v['BUTTONS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PICTURES' name='noprintset_PICTURES' class='datagrid-cell "+ms.tdClass(formId, 'PICTURES')+"' style='"+ms.tdStyle(formId, 'PICTURES')+"' "+ms.tdEvent(formId, 'PICTURES')+">")
            arrHtml.push("<span colno='PICTURES' class='"+ms.uiClass(formId, 'PICTURES')+"' style='"+ms.uiStyle(formId, 'PICTURES')+"' "+ms.uiEvent(formId, 'PICTURES')+" title='"+ms.titleAttr(formId,'PICTURES','IS_TITLE_ATTR',v)+"' >"+v['PICTURES']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PIC_SIZE' name='noprintset_PIC_SIZE' class='datagrid-cell "+ms.tdClass(formId, 'PIC_SIZE')+"' style='"+ms.tdStyle(formId, 'PIC_SIZE')+"' "+ms.tdEvent(formId, 'PIC_SIZE')+">")
            arrHtml.push("<span colno='PIC_SIZE' class='"+ms.uiClass(formId, 'PIC_SIZE')+"' style='"+ms.uiStyle(formId, 'PIC_SIZE')+"' "+ms.uiEvent(formId, 'PIC_SIZE')+" title='"+ms.titleAttr(formId,'PIC_SIZE','IS_TITLE_ATTR',v)+"' >"+v['PIC_SIZE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PIC_NAME' name='noprintset_PIC_NAME' class='datagrid-cell "+ms.tdClass(formId, 'PIC_NAME')+"' style='"+ms.tdStyle(formId, 'PIC_NAME')+"' "+ms.tdEvent(formId, 'PIC_NAME')+">")
            arrHtml.push("<span colno='PIC_NAME' class='"+ms.uiClass(formId, 'PIC_NAME')+"' style='"+ms.uiStyle(formId, 'PIC_NAME')+"' "+ms.uiEvent(formId, 'PIC_NAME')+" title='"+ms.titleAttr(formId,'PIC_NAME','IS_TITLE_ATTR',v)+"' >"+v['PIC_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PIC_PATH' name='noprintset_PIC_PATH' class='datagrid-cell "+ms.tdClass(formId, 'PIC_PATH')+"' style='"+ms.tdStyle(formId, 'PIC_PATH')+"' "+ms.tdEvent(formId, 'PIC_PATH')+">")
            arrHtml.push("<span colno='PIC_PATH' class='"+ms.uiClass(formId, 'PIC_PATH')+"' style='"+ms.uiStyle(formId, 'PIC_PATH')+"' "+ms.uiEvent(formId, 'PIC_PATH')+" title='"+ms.titleAttr(formId,'PIC_PATH','IS_TITLE_ATTR',v)+"' >"+v['PIC_PATH']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PIC_STREAM' name='noprintset_PIC_STREAM' class='datagrid-cell "+ms.tdClass(formId, 'PIC_STREAM')+"' style='"+ms.tdStyle(formId, 'PIC_STREAM')+"' "+ms.tdEvent(formId, 'PIC_STREAM')+">")
            arrHtml.push("<span colno='PIC_STREAM' class='"+ms.uiClass(formId, 'PIC_STREAM')+"' style='"+ms.uiStyle(formId, 'PIC_STREAM')+"' "+ms.uiEvent(formId, 'PIC_STREAM')+" title='"+ms.titleAttr(formId,'PIC_STREAM','IS_TITLE_ATTR',v)+"' >"+v['PIC_STREAM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='FILES' name='noprintset_FILES' class='datagrid-cell "+ms.tdClass(formId, 'FILES')+"' style='"+ms.tdStyle(formId, 'FILES')+"' "+ms.tdEvent(formId, 'FILES')+">")
            arrHtml.push("<span colno='FILES' class='"+ms.uiClass(formId, 'FILES')+"' style='"+ms.uiStyle(formId, 'FILES')+"' "+ms.uiEvent(formId, 'FILES')+" title='"+ms.titleAttr(formId,'FILES','IS_TITLE_ATTR',v)+"' >"+v['FILES']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='FILE_SIZE' name='noprintset_FILE_SIZE' class='datagrid-cell "+ms.tdClass(formId, 'FILE_SIZE')+"' style='"+ms.tdStyle(formId, 'FILE_SIZE')+"' "+ms.tdEvent(formId, 'FILE_SIZE')+">")
            arrHtml.push("<span colno='FILE_SIZE' class='"+ms.uiClass(formId, 'FILE_SIZE')+"' style='"+ms.uiStyle(formId, 'FILE_SIZE')+"' "+ms.uiEvent(formId, 'FILE_SIZE')+" title='"+ms.titleAttr(formId,'FILE_SIZE','IS_TITLE_ATTR',v)+"' >"+v['FILE_SIZE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='FILE_NAME' name='noprintset_FILE_NAME' class='datagrid-cell "+ms.tdClass(formId, 'FILE_NAME')+"' style='"+ms.tdStyle(formId, 'FILE_NAME')+"' "+ms.tdEvent(formId, 'FILE_NAME')+">")
            arrHtml.push("<span colno='FILE_NAME' class='"+ms.uiClass(formId, 'FILE_NAME')+"' style='"+ms.uiStyle(formId, 'FILE_NAME')+"' "+ms.uiEvent(formId, 'FILE_NAME')+" title='"+ms.titleAttr(formId,'FILE_NAME','IS_TITLE_ATTR',v)+"' >"+v['FILE_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='FILE_PATH' name='noprintset_FILE_PATH' class='datagrid-cell "+ms.tdClass(formId, 'FILE_PATH')+"' style='"+ms.tdStyle(formId, 'FILE_PATH')+"' "+ms.tdEvent(formId, 'FILE_PATH')+">")
            arrHtml.push("<span colno='FILE_PATH' class='"+ms.uiClass(formId, 'FILE_PATH')+"' style='"+ms.uiStyle(formId, 'FILE_PATH')+"' "+ms.uiEvent(formId, 'FILE_PATH')+" title='"+ms.titleAttr(formId,'FILE_PATH','IS_TITLE_ATTR',v)+"' >"+v['FILE_PATH']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MUL_FILES' name='noprintset_MUL_FILES' class='datagrid-cell "+ms.tdClass(formId, 'MUL_FILES')+"' style='"+ms.tdStyle(formId, 'MUL_FILES')+"' "+ms.tdEvent(formId, 'MUL_FILES')+">")
            arrHtml.push("<span colno='MUL_FILES' class='"+ms.uiClass(formId, 'MUL_FILES')+"' style='"+ms.uiStyle(formId, 'MUL_FILES')+"' "+ms.uiEvent(formId, 'MUL_FILES')+" title='"+ms.titleAttr(formId,'MUL_FILES','IS_TITLE_ATTR',v)+"' >"+v['MUL_FILES']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='RICHTEXT' name='noprintset_RICHTEXT' class='datagrid-cell "+ms.tdClass(formId, 'RICHTEXT')+"' style='"+ms.tdStyle(formId, 'RICHTEXT')+"' "+ms.tdEvent(formId, 'RICHTEXT')+">")
            arrHtml.push("<span colno='RICHTEXT' class='"+ms.uiClass(formId, 'RICHTEXT')+"' style='"+ms.uiStyle(formId, 'RICHTEXT')+"' "+ms.uiEvent(formId, 'RICHTEXT')+" title='"+ms.titleAttr(formId,'RICHTEXT','IS_TITLE_ATTR',v)+"' >"+v['RICHTEXT']+"</span>")
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
    if(formId=='e7ffc6d5b0784a0798f464e6a653d641'){<%--Sawyer测试模板1129--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td colno='SNO' name='noprintset_SNO' class='datagrid-cell "+ms.tdClass(formId, 'SNO')+"' style='"+ms.tdStyle(formId, 'SNO')+"' "+ms.tdEvent(formId, 'SNO')+">")
            arrHtml.push("<span colno='SNO' class='"+ms.uiClass(formId, 'SNO')+"' style='"+ms.uiStyle(formId, 'SNO')+"' "+ms.uiEvent(formId, 'SNO')+" title='"+ms.titleAttr(formId,'SNO','IS_TITLE_ATTR',v)+"' >"+v['SNO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SNAME' name='noprintset_SNAME' class='datagrid-cell "+ms.tdClass(formId, 'SNAME')+"' style='"+ms.tdStyle(formId, 'SNAME')+"' "+ms.tdEvent(formId, 'SNAME')+">")
            arrHtml.push("<span colno='SNAME' class='"+ms.uiClass(formId, 'SNAME')+"' style='"+ms.uiStyle(formId, 'SNAME')+"' "+ms.uiEvent(formId, 'SNAME')+" title='"+ms.titleAttr(formId,'SNAME','IS_TITLE_ATTR',v)+"' >"+v['SNAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DEPTS' name='noprintset_DEPTS' class='datagrid-cell "+ms.tdClass(formId, 'DEPTS')+"' style='"+ms.tdStyle(formId, 'DEPTS')+"' "+ms.tdEvent(formId, 'DEPTS')+">")
            arrHtml.push("<span colno='DEPTS' class='"+ms.uiClass(formId, 'DEPTS')+"' style='"+ms.uiStyle(formId, 'DEPTS')+"' "+ms.uiEvent(formId, 'DEPTS')+" title='"+ms.titleAttr(formId,'DEPTS','IS_TITLE_ATTR',v)+"' >"+v['DEPTS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='HOBBY' name='noprintset_HOBBY' class='datagrid-cell "+ms.tdClass(formId, 'HOBBY')+"' style='"+ms.tdStyle(formId, 'HOBBY')+"' "+ms.tdEvent(formId, 'HOBBY')+">")
            arrHtml.push("<span colno='HOBBY' class='"+ms.uiClass(formId, 'HOBBY')+"' style='"+ms.uiStyle(formId, 'HOBBY')+"' "+ms.uiEvent(formId, 'HOBBY')+" title='"+ms.titleAttr(formId,'HOBBY','IS_TITLE_ATTR',v)+"' >"+v['HOBBY']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='NATION' name='noprintset_NATION' class='datagrid-cell "+ms.tdClass(formId, 'NATION')+"' style='"+ms.tdStyle(formId, 'NATION')+"' "+ms.tdEvent(formId, 'NATION')+">")
            arrHtml.push("<span colno='NATION' class='"+ms.uiClass(formId, 'NATION')+"' style='"+ms.uiStyle(formId, 'NATION')+"' "+ms.uiEvent(formId, 'NATION')+" title='"+ms.titleAttr(formId,'NATION','IS_TITLE_ATTR',v)+"' >"+v['NATION']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PROVINCE' name='noprintset_PROVINCE' class='datagrid-cell "+ms.tdClass(formId, 'PROVINCE')+"' style='"+ms.tdStyle(formId, 'PROVINCE')+"' "+ms.tdEvent(formId, 'PROVINCE')+">")
            arrHtml.push("<span colno='PROVINCE' class='"+ms.uiClass(formId, 'PROVINCE')+"' style='"+ms.uiStyle(formId, 'PROVINCE')+"' "+ms.uiEvent(formId, 'PROVINCE')+" title='"+ms.titleAttr(formId,'PROVINCE','IS_TITLE_ATTR',v)+"' >"+v['PROVINCE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CITY' name='noprintset_CITY' class='datagrid-cell "+ms.tdClass(formId, 'CITY')+"' style='"+ms.tdStyle(formId, 'CITY')+"' "+ms.tdEvent(formId, 'CITY')+">")
            arrHtml.push("<span colno='CITY' class='"+ms.uiClass(formId, 'CITY')+"' style='"+ms.uiStyle(formId, 'CITY')+"' "+ms.uiEvent(formId, 'CITY')+" title='"+ms.titleAttr(formId,'CITY','IS_TITLE_ATTR',v)+"' >"+v['CITY']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TOWN' name='noprintset_TOWN' class='datagrid-cell "+ms.tdClass(formId, 'TOWN')+"' style='"+ms.tdStyle(formId, 'TOWN')+"' "+ms.tdEvent(formId, 'TOWN')+">")
            arrHtml.push("<span colno='TOWN' class='"+ms.uiClass(formId, 'TOWN')+"' style='"+ms.uiStyle(formId, 'TOWN')+"' "+ms.uiEvent(formId, 'TOWN')+" title='"+ms.titleAttr(formId,'TOWN','IS_TITLE_ATTR',v)+"' >"+v['TOWN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='VILLAGE' name='noprintset_VILLAGE' class='datagrid-cell "+ms.tdClass(formId, 'VILLAGE')+"' style='"+ms.tdStyle(formId, 'VILLAGE')+"' "+ms.tdEvent(formId, 'VILLAGE')+">")
            arrHtml.push("<span colno='VILLAGE' class='"+ms.uiClass(formId, 'VILLAGE')+"' style='"+ms.uiStyle(formId, 'VILLAGE')+"' "+ms.uiEvent(formId, 'VILLAGE')+" title='"+ms.titleAttr(formId,'VILLAGE','IS_TITLE_ATTR',v)+"' >"+v['VILLAGE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WU_CODE' name='noprintset_WU_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WU_CODE')+"' style='"+ms.tdStyle(formId, 'WU_CODE')+"' "+ms.tdEvent(formId, 'WU_CODE')+">")
            arrHtml.push("<span colno='WU_CODE' class='"+ms.uiClass(formId, 'WU_CODE')+"' style='"+ms.uiStyle(formId, 'WU_CODE')+"' "+ms.uiEvent(formId, 'WU_CODE')+" title='"+ms.titleAttr(formId,'WU_CODE','IS_TITLE_ATTR',v)+"' >"+v['WU_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WU_NAME' name='noprintset_WU_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WU_NAME')+"' style='"+ms.tdStyle(formId, 'WU_NAME')+"' "+ms.tdEvent(formId, 'WU_NAME')+">")
            arrHtml.push("<span colno='WU_NAME' class='"+ms.uiClass(formId, 'WU_NAME')+"' style='"+ms.uiStyle(formId, 'WU_NAME')+"' "+ms.uiEvent(formId, 'WU_NAME')+" title='"+ms.titleAttr(formId,'WU_NAME','IS_TITLE_ATTR',v)+"' >"+v['WU_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WU_SPEC' name='noprintset_WU_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'WU_SPEC')+"' style='"+ms.tdStyle(formId, 'WU_SPEC')+"' "+ms.tdEvent(formId, 'WU_SPEC')+">")
            arrHtml.push("<span colno='WU_SPEC' class='"+ms.uiClass(formId, 'WU_SPEC')+"' style='"+ms.uiStyle(formId, 'WU_SPEC')+"' "+ms.uiEvent(formId, 'WU_SPEC')+" title='"+ms.titleAttr(formId,'WU_SPEC','IS_TITLE_ATTR',v)+"' >"+v['WU_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CR_ITEM_REPLACE' name='noprintset_CR_ITEM_REPLACE' class='datagrid-cell "+ms.tdClass(formId, 'CR_ITEM_REPLACE')+"' style='"+ms.tdStyle(formId, 'CR_ITEM_REPLACE')+"' "+ms.tdEvent(formId, 'CR_ITEM_REPLACE')+">")
            arrHtml.push("<span colno='CR_ITEM_REPLACE' class='"+ms.uiClass(formId, 'CR_ITEM_REPLACE')+"' style='"+ms.uiStyle(formId, 'CR_ITEM_REPLACE')+"' "+ms.uiEvent(formId, 'CR_ITEM_REPLACE')+" title='"+ms.titleAttr(formId,'CR_ITEM_REPLACE','IS_TITLE_ATTR',v)+"' >"+v['CR_ITEM_REPLACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SCORE' name='noprintset_SCORE' class='datagrid-cell "+ms.tdClass(formId, 'SCORE')+"' style='"+ms.tdStyle(formId, 'SCORE')+"' "+ms.tdEvent(formId, 'SCORE')+">")
            arrHtml.push("<span colno='SCORE' class='"+ms.uiClass(formId, 'SCORE')+"' style='"+ms.uiStyle(formId, 'SCORE')+"' "+ms.uiEvent(formId, 'SCORE')+" title='"+ms.titleAttr(formId,'SCORE','IS_TITLE_ATTR',v)+"' >"+v['SCORE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='EDUCATION' name='noprintset_EDUCATION' class='datagrid-cell "+ms.tdClass(formId, 'EDUCATION')+"' style='"+ms.tdStyle(formId, 'EDUCATION')+"' "+ms.tdEvent(formId, 'EDUCATION')+">")
            arrHtml.push("<span colno='EDUCATION' class='"+ms.uiClass(formId, 'EDUCATION')+"' style='"+ms.uiStyle(formId, 'EDUCATION')+"' "+ms.uiEvent(formId, 'EDUCATION')+" title='"+ms.titleAttr(formId,'EDUCATION','IS_TITLE_ATTR',v)+"' >"+v['EDUCATION']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SEX' name='noprintset_SEX' class='datagrid-cell "+ms.tdClass(formId, 'SEX')+"' style='"+ms.tdStyle(formId, 'SEX')+"' "+ms.tdEvent(formId, 'SEX')+">")
            arrHtml.push("<span colno='SEX' class='"+ms.uiClass(formId, 'SEX')+"' style='"+ms.uiStyle(formId, 'SEX')+"' "+ms.uiEvent(formId, 'SEX')+" title='"+ms.titleAttr(formId,'SEX','IS_TITLE_ATTR',v)+"' >"+v['SEX']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='AGE' name='noprintset_AGE' class='datagrid-cell "+ms.tdClass(formId, 'AGE')+"' style='"+ms.tdStyle(formId, 'AGE')+"' "+ms.tdEvent(formId, 'AGE')+">")
            arrHtml.push("<span colno='AGE' class='"+ms.uiClass(formId, 'AGE')+"' style='"+ms.uiStyle(formId, 'AGE')+"' "+ms.uiEvent(formId, 'AGE')+" title='"+ms.titleAttr(formId,'AGE','IS_TITLE_ATTR',v)+"' >"+v['AGE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATES' name='noprintset_DATES' class='datagrid-cell "+ms.tdClass(formId, 'DATES')+"' style='"+ms.tdStyle(formId, 'DATES')+"' "+ms.tdEvent(formId, 'DATES')+">")
            arrHtml.push("<span colno='DATES' class='"+ms.uiClass(formId, 'DATES')+"' style='"+ms.uiStyle(formId, 'DATES')+"' "+ms.uiEvent(formId, 'DATES')+" title='"+ms.titleAttr(formId,'DATES','IS_TITLE_ATTR',v)+"' >"+v['DATES']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TIMES' name='noprintset_TIMES' class='datagrid-cell "+ms.tdClass(formId, 'TIMES')+"' style='"+ms.tdStyle(formId, 'TIMES')+"' "+ms.tdEvent(formId, 'TIMES')+">")
            arrHtml.push("<span colno='TIMES' class='"+ms.uiClass(formId, 'TIMES')+"' style='"+ms.uiStyle(formId, 'TIMES')+"' "+ms.uiEvent(formId, 'TIMES')+" title='"+ms.titleAttr(formId,'TIMES','IS_TITLE_ATTR',v)+"' >"+v['TIMES']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='COMMS' name='noprintset_COMMS' class='datagrid-cell "+ms.tdClass(formId, 'COMMS')+"' style='"+ms.tdStyle(formId, 'COMMS')+"' "+ms.tdEvent(formId, 'COMMS')+">")
            arrHtml.push("<span colno='COMMS' class='"+ms.uiClass(formId, 'COMMS')+"' style='"+ms.uiStyle(formId, 'COMMS')+"' "+ms.uiEvent(formId, 'COMMS')+" title='"+ms.titleAttr(formId,'COMMS','IS_TITLE_ATTR',v)+"' >"+v['COMMS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='LABEL' name='noprintset_LABEL' class='datagrid-cell "+ms.tdClass(formId, 'LABEL')+"' style='"+ms.tdStyle(formId, 'LABEL')+"' "+ms.tdEvent(formId, 'LABEL')+">")
            arrHtml.push("<span colno='LABEL' class='"+ms.uiClass(formId, 'LABEL')+"' style='"+ms.uiStyle(formId, 'LABEL')+"' "+ms.uiEvent(formId, 'LABEL')+" title='"+ms.titleAttr(formId,'LABEL','IS_TITLE_ATTR',v)+"' >"+v['LABEL']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='BUTTONS' name='noprintset_BUTTONS' class='datagrid-cell "+ms.tdClass(formId, 'BUTTONS')+"' style='"+ms.tdStyle(formId, 'BUTTONS')+"' "+ms.tdEvent(formId, 'BUTTONS')+">")
            arrHtml.push("<span colno='BUTTONS' class='"+ms.uiClass(formId, 'BUTTONS')+"' style='"+ms.uiStyle(formId, 'BUTTONS')+"' "+ms.uiEvent(formId, 'BUTTONS')+" title='"+ms.titleAttr(formId,'BUTTONS','IS_TITLE_ATTR',v)+"' >"+v['BUTTONS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PICTURES' name='noprintset_PICTURES' class='datagrid-cell "+ms.tdClass(formId, 'PICTURES')+"' style='"+ms.tdStyle(formId, 'PICTURES')+"' "+ms.tdEvent(formId, 'PICTURES')+">")
            arrHtml.push("<span colno='PICTURES' class='"+ms.uiClass(formId, 'PICTURES')+"' style='"+ms.uiStyle(formId, 'PICTURES')+"' "+ms.uiEvent(formId, 'PICTURES')+" title='"+ms.titleAttr(formId,'PICTURES','IS_TITLE_ATTR',v)+"' >"+v['PICTURES']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PIC_SIZE' name='noprintset_PIC_SIZE' class='datagrid-cell "+ms.tdClass(formId, 'PIC_SIZE')+"' style='"+ms.tdStyle(formId, 'PIC_SIZE')+"' "+ms.tdEvent(formId, 'PIC_SIZE')+">")
            arrHtml.push("<span colno='PIC_SIZE' class='"+ms.uiClass(formId, 'PIC_SIZE')+"' style='"+ms.uiStyle(formId, 'PIC_SIZE')+"' "+ms.uiEvent(formId, 'PIC_SIZE')+" title='"+ms.titleAttr(formId,'PIC_SIZE','IS_TITLE_ATTR',v)+"' >"+v['PIC_SIZE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PIC_NAME' name='noprintset_PIC_NAME' class='datagrid-cell "+ms.tdClass(formId, 'PIC_NAME')+"' style='"+ms.tdStyle(formId, 'PIC_NAME')+"' "+ms.tdEvent(formId, 'PIC_NAME')+">")
            arrHtml.push("<span colno='PIC_NAME' class='"+ms.uiClass(formId, 'PIC_NAME')+"' style='"+ms.uiStyle(formId, 'PIC_NAME')+"' "+ms.uiEvent(formId, 'PIC_NAME')+" title='"+ms.titleAttr(formId,'PIC_NAME','IS_TITLE_ATTR',v)+"' >"+v['PIC_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PIC_PATH' name='noprintset_PIC_PATH' class='datagrid-cell "+ms.tdClass(formId, 'PIC_PATH')+"' style='"+ms.tdStyle(formId, 'PIC_PATH')+"' "+ms.tdEvent(formId, 'PIC_PATH')+">")
            arrHtml.push("<span colno='PIC_PATH' class='"+ms.uiClass(formId, 'PIC_PATH')+"' style='"+ms.uiStyle(formId, 'PIC_PATH')+"' "+ms.uiEvent(formId, 'PIC_PATH')+" title='"+ms.titleAttr(formId,'PIC_PATH','IS_TITLE_ATTR',v)+"' >"+v['PIC_PATH']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PIC_STREAM' name='noprintset_PIC_STREAM' class='datagrid-cell "+ms.tdClass(formId, 'PIC_STREAM')+"' style='"+ms.tdStyle(formId, 'PIC_STREAM')+"' "+ms.tdEvent(formId, 'PIC_STREAM')+">")
            arrHtml.push("<span colno='PIC_STREAM' class='"+ms.uiClass(formId, 'PIC_STREAM')+"' style='"+ms.uiStyle(formId, 'PIC_STREAM')+"' "+ms.uiEvent(formId, 'PIC_STREAM')+" title='"+ms.titleAttr(formId,'PIC_STREAM','IS_TITLE_ATTR',v)+"' >"+v['PIC_STREAM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='FILES' name='noprintset_FILES' class='datagrid-cell "+ms.tdClass(formId, 'FILES')+"' style='"+ms.tdStyle(formId, 'FILES')+"' "+ms.tdEvent(formId, 'FILES')+">")
            arrHtml.push("<span colno='FILES' class='"+ms.uiClass(formId, 'FILES')+"' style='"+ms.uiStyle(formId, 'FILES')+"' "+ms.uiEvent(formId, 'FILES')+" title='"+ms.titleAttr(formId,'FILES','IS_TITLE_ATTR',v)+"' >"+v['FILES']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='FILE_SIZE' name='noprintset_FILE_SIZE' class='datagrid-cell "+ms.tdClass(formId, 'FILE_SIZE')+"' style='"+ms.tdStyle(formId, 'FILE_SIZE')+"' "+ms.tdEvent(formId, 'FILE_SIZE')+">")
            arrHtml.push("<span colno='FILE_SIZE' class='"+ms.uiClass(formId, 'FILE_SIZE')+"' style='"+ms.uiStyle(formId, 'FILE_SIZE')+"' "+ms.uiEvent(formId, 'FILE_SIZE')+" title='"+ms.titleAttr(formId,'FILE_SIZE','IS_TITLE_ATTR',v)+"' >"+v['FILE_SIZE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='FILE_NAME' name='noprintset_FILE_NAME' class='datagrid-cell "+ms.tdClass(formId, 'FILE_NAME')+"' style='"+ms.tdStyle(formId, 'FILE_NAME')+"' "+ms.tdEvent(formId, 'FILE_NAME')+">")
            arrHtml.push("<span colno='FILE_NAME' class='"+ms.uiClass(formId, 'FILE_NAME')+"' style='"+ms.uiStyle(formId, 'FILE_NAME')+"' "+ms.uiEvent(formId, 'FILE_NAME')+" title='"+ms.titleAttr(formId,'FILE_NAME','IS_TITLE_ATTR',v)+"' >"+v['FILE_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='FILE_PATH' name='noprintset_FILE_PATH' class='datagrid-cell "+ms.tdClass(formId, 'FILE_PATH')+"' style='"+ms.tdStyle(formId, 'FILE_PATH')+"' "+ms.tdEvent(formId, 'FILE_PATH')+">")
            arrHtml.push("<span colno='FILE_PATH' class='"+ms.uiClass(formId, 'FILE_PATH')+"' style='"+ms.uiStyle(formId, 'FILE_PATH')+"' "+ms.uiEvent(formId, 'FILE_PATH')+" title='"+ms.titleAttr(formId,'FILE_PATH','IS_TITLE_ATTR',v)+"' >"+v['FILE_PATH']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MUL_FILES' name='noprintset_MUL_FILES' class='datagrid-cell "+ms.tdClass(formId, 'MUL_FILES')+"' style='"+ms.tdStyle(formId, 'MUL_FILES')+"' "+ms.tdEvent(formId, 'MUL_FILES')+">")
            arrHtml.push("<span colno='MUL_FILES' class='"+ms.uiClass(formId, 'MUL_FILES')+"' style='"+ms.uiStyle(formId, 'MUL_FILES')+"' "+ms.uiEvent(formId, 'MUL_FILES')+" title='"+ms.titleAttr(formId,'MUL_FILES','IS_TITLE_ATTR',v)+"' >"+v['MUL_FILES']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='RICHTEXT' name='noprintset_RICHTEXT' class='datagrid-cell "+ms.tdClass(formId, 'RICHTEXT')+"' style='"+ms.tdStyle(formId, 'RICHTEXT')+"' "+ms.tdEvent(formId, 'RICHTEXT')+">")
            arrHtml.push("<span colno='RICHTEXT' class='"+ms.uiClass(formId, 'RICHTEXT')+"' style='"+ms.uiStyle(formId, 'RICHTEXT')+"' "+ms.uiEvent(formId, 'RICHTEXT')+" title='"+ms.titleAttr(formId,'RICHTEXT','IS_TITLE_ATTR',v)+"' >"+v['RICHTEXT']+"</span>")
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
