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
		<dict:lang value="SAW_STUDENT97" />
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
		<bu:header formId ="877ec66d70334b25a2a2a4ea172da89a"/>

    
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
		<bu:func viewId="48a463a41ef743e48f1d3a5cafbe3546" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     

  <table class="search_table">
      <bu:search deal_mark="1" viewId="48a463a41ef743e48f1d3a5cafbe3546" /> 

  </table>

                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage877ec66d70334b25a2a2a4ea172da89a" id="formPage877ec66d70334b25a2a2a4ea172da89a" value="${formPage877ec66d70334b25a2a2a4ea172da89a}"/>
		<input type="hidden" name="formId" id="formId1" value='877ec66d70334b25a2a2a4ea172da89a'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="877ec66d70334b25a2a2a4ea172da89a">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax877ec66d70334b25a2a2a4ea172da89a" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner877ec66d70334b25a2a2a4ea172da89a">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable877ec66d70334b25a2a2a4ea172da89a">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="877ec66d70334b25a2a2a4ea172da89a" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_877ec66d70334b25a2a2a4ea172da89a" onclick="_selectAjaxTableAllData(this,'877ec66d70334b25a2a2a4ea172da89a')" style="cursor: pointer;"title="全选"/></span></td>
			<td name="noprintset_SNO" class="datagrid-cell"><bu:uitn colNo="SNO" formId="877ec66d70334b25a2a2a4ea172da89a" /></td>
			<td name="noprintset_NAME" class="datagrid-cell"><bu:uitn colNo="NAME" formId="877ec66d70334b25a2a2a4ea172da89a" /></td>
			<td name="noprintset_TIMES" class="datagrid-cell"><bu:uitn colNo="TIMES" formId="877ec66d70334b25a2a2a4ea172da89a" /></td>
			<td name="noprintset_DATES" class="datagrid-cell"><bu:uitn colNo="DATES" formId="877ec66d70334b25a2a2a4ea172da89a" /></td>
			<td name="noprintset_SEX" class="datagrid-cell"><bu:uitn colNo="SEX" formId="877ec66d70334b25a2a2a4ea172da89a" /></td>
			<td name="noprintset_AGE" class="datagrid-cell"><bu:uitn colNo="AGE" formId="877ec66d70334b25a2a2a4ea172da89a" /></td>
			<td name="noprintset_NATHION" class="datagrid-cell"><bu:uitn colNo="NATHION" formId="877ec66d70334b25a2a2a4ea172da89a" /></td>
			<td name="noprintset_XUELI" class="datagrid-cell"><bu:uitn colNo="XUELI" formId="877ec66d70334b25a2a2a4ea172da89a" /></td>
			<td name="noprintset_HOBBY" class="datagrid-cell"><bu:uitn colNo="HOBBY" formId="877ec66d70334b25a2a2a4ea172da89a" /></td>
			<td name="noprintset_SCORE" class="datagrid-cell"><bu:uitn colNo="SCORE" formId="877ec66d70334b25a2a2a4ea172da89a" /></td>
			<td name="noprintset_PHONE" class="datagrid-cell"><bu:uitn colNo="PHONE" formId="877ec66d70334b25a2a2a4ea172da89a" /></td>
			<td name="noprintset_BEIZHU" class="datagrid-cell"><bu:uitn colNo="BEIZHU" formId="877ec66d70334b25a2a2a4ea172da89a" /></td>
			<td name="noprintset_CI_ITEM_GENRE" class="datagrid-cell"><bu:uitn colNo="CI_ITEM_GENRE" formId="877ec66d70334b25a2a2a4ea172da89a" /></td>
			<td name="noprintset_CI_ITEM_TYPE" class="datagrid-cell"><bu:uitn colNo="CI_ITEM_TYPE" formId="877ec66d70334b25a2a2a4ea172da89a" /></td>
			<td name="noprintset_PROVINCE" class="datagrid-cell"><bu:uitn colNo="PROVINCE" formId="877ec66d70334b25a2a2a4ea172da89a" /></td>
			<td name="noprintset_CITY" class="datagrid-cell"><bu:uitn colNo="CITY" formId="877ec66d70334b25a2a2a4ea172da89a" /></td>
			<td name="noprintset_TOWN" class="datagrid-cell"><bu:uitn colNo="TOWN" formId="877ec66d70334b25a2a2a4ea172da89a" /></td>
			<td name="noprintset_VILLAGE" class="datagrid-cell"><bu:uitn colNo="VILLAGE" formId="877ec66d70334b25a2a2a4ea172da89a" /></td>
			<td name="noprintset_WU_CODE" class="datagrid-cell"><bu:uitn colNo="WU_CODE" formId="877ec66d70334b25a2a2a4ea172da89a" /></td>
			<td name="noprintset_WU_NAME" class="datagrid-cell"><bu:uitn colNo="WU_NAME" formId="877ec66d70334b25a2a2a4ea172da89a" /></td>
			<td name="noprintset_WU_SPEC" class="datagrid-cell"><bu:uitn colNo="WU_SPEC" formId="877ec66d70334b25a2a2a4ea172da89a" /></td>
			<td name="noprintset_MORELEAN" class="datagrid-cell"><bu:uitn colNo="MORELEAN" formId="877ec66d70334b25a2a2a4ea172da89a" /></td>
			<td name="noprintset_ZHUCE" class="datagrid-cell"><bu:uitn colNo="ZHUCE" formId="877ec66d70334b25a2a2a4ea172da89a" /></td>
			<td name="noprintset_PHOTO" class="datagrid-cell"><bu:uitn colNo="PHOTO" formId="877ec66d70334b25a2a2a4ea172da89a" /></td>
			<td name="noprintset_PHOTO_SIZE" class="datagrid-cell"><bu:uitn colNo="PHOTO_SIZE" formId="877ec66d70334b25a2a2a4ea172da89a" /></td>
			<td name="noprintset_PHOTO_NAME" class="datagrid-cell"><bu:uitn colNo="PHOTO_NAME" formId="877ec66d70334b25a2a2a4ea172da89a" /></td>
			<td name="noprintset_PHOTO_PATH" class="datagrid-cell"><bu:uitn colNo="PHOTO_PATH" formId="877ec66d70334b25a2a2a4ea172da89a" /></td>
			<td name="noprintset_PHOTO_LIU" class="datagrid-cell"><bu:uitn colNo="PHOTO_LIU" formId="877ec66d70334b25a2a2a4ea172da89a" /></td>
			<td name="noprintset_WENJIAN" class="datagrid-cell"><bu:uitn colNo="WENJIAN" formId="877ec66d70334b25a2a2a4ea172da89a" /></td>
			<td name="noprintset_WENJIAN_SIZE" class="datagrid-cell"><bu:uitn colNo="WENJIAN_SIZE" formId="877ec66d70334b25a2a2a4ea172da89a" /></td>
			<td name="noprintset_WENJIAN_NAME" class="datagrid-cell"><bu:uitn colNo="WENJIAN_NAME" formId="877ec66d70334b25a2a2a4ea172da89a" /></td>
			<td name="noprintset_WENJIAN_PATH" class="datagrid-cell"><bu:uitn colNo="WENJIAN_PATH" formId="877ec66d70334b25a2a2a4ea172da89a" /></td>
			<td name="noprintset_MULFILES" class="datagrid-cell"><bu:uitn colNo="MULFILES" formId="877ec66d70334b25a2a2a4ea172da89a" /></td>
			<td name="noprintset_RICHTEXT" class="datagrid-cell"><bu:uitn colNo="RICHTEXT" formId="877ec66d70334b25a2a2a4ea172da89a" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv877ec66d70334b25a2a2a4ea172da89a" onscroll="ajaxTableScroll(this,'877ec66d70334b25a2a2a4ea172da89a')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax877ec66d70334b25a2a2a4ea172da89a">
		<tbody id="tbody_877ec66d70334b25a2a2a4ea172da89a" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage877ec66d70334b25a2a2a4ea172da89a==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=877ec66d70334b25a2a2a4ea172da89a&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('877ec66d70334b25a2a2a4ea172da89a','1');">打印</button>
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
 <input type="checkbox" name="NAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="NAME" value="" title_name="姓名" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?生日</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="TIMES" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="TIMES" value="" title_name="?生日" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?入学日期</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="DATES" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="DATES" value="" title_name="?入学日期" />px
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
 <td style="width: 100px;text-align: right;"><span>?民族</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="NATHION" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="NATHION" value="" title_name="?民族" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?学历</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="XUELI" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="XUELI" value="" title_name="?学历" />px
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
 <td style="width: 100px;text-align: right;"><span>?已修学分</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="SCORE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="SCORE" value="" title_name="?已修学分" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?联系方式</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PHONE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PHONE" value="" title_name="?联系方式" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>备注</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="BEIZHU" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="BEIZHU" value="" title_name="备注" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?物料分类</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CI_ITEM_GENRE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CI_ITEM_GENRE" value="" title_name="?物料分类" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?物料类型</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CI_ITEM_TYPE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CI_ITEM_TYPE" value="" title_name="?物料类型" />px
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
 <td style="width: 100px;text-align: right;"><span>?城市</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CITY" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CITY" value="" title_name="?城市" />px
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
 <td style="width: 100px;text-align: right;"><span>?默认标志</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="MORELEAN" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="MORELEAN" value="" title_name="?默认标志" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?注册</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="ZHUCE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="ZHUCE" value="" title_name="?注册" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>上传图片</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PHOTO" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PHOTO" value="" title_name="上传图片" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?图片大小</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PHOTO_SIZE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PHOTO_SIZE" value="" title_name="?图片大小" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>图片名称</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PHOTO_NAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PHOTO_NAME" value="" title_name="图片名称" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?图片路径</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PHOTO_PATH" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PHOTO_PATH" value="" title_name="?图片路径" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?图片字节流</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PHOTO_LIU" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PHOTO_LIU" value="" title_name="?图片字节流" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>文件</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WENJIAN" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WENJIAN" value="" title_name="文件" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>文件大小</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WENJIAN_SIZE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WENJIAN_SIZE" value="" title_name="文件大小" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?文件名称</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WENJIAN_NAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WENJIAN_NAME" value="" title_name="?文件名称" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>文件路径</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WENJIAN_PATH" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WENJIAN_PATH" value="" title_name="文件路径" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?多文件</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="MULFILES" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="MULFILES" value="" title_name="?多文件" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?富文本</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="RICHTEXT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="RICHTEXT" value="" title_name="?富文本" />px
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
		<bu:submit viewId="48a463a41ef743e48f1d3a5cafbe3546" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="48a463a41ef743e48f1d3a5cafbe3546" />
    
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
    if(formId=='877ec66d70334b25a2a2a4ea172da89a'){<%--SAW_STUDENT97--%>
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
            arrHtml.push("<td colno='NAME' name='noprintset_NAME' class='datagrid-cell "+ms.tdClass(formId, 'NAME')+"' style='"+ms.tdStyle(formId, 'NAME')+"' "+ms.tdEvent(formId, 'NAME')+">")
            arrHtml.push("<span colno='NAME' class='"+ms.uiClass(formId, 'NAME')+"' style='"+ms.uiStyle(formId, 'NAME')+"' "+ms.uiEvent(formId, 'NAME')+" title='"+ms.titleAttr(formId,'NAME','IS_TITLE_ATTR',v)+"' >"+v['NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TIMES' name='noprintset_TIMES' class='datagrid-cell "+ms.tdClass(formId, 'TIMES')+"' style='"+ms.tdStyle(formId, 'TIMES')+"' "+ms.tdEvent(formId, 'TIMES')+">")
            arrHtml.push("<span colno='TIMES' class='"+ms.uiClass(formId, 'TIMES')+"' style='"+ms.uiStyle(formId, 'TIMES')+"' "+ms.uiEvent(formId, 'TIMES')+" title='"+ms.titleAttr(formId,'TIMES','IS_TITLE_ATTR',v)+"' >"+v['TIMES']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATES' name='noprintset_DATES' class='datagrid-cell "+ms.tdClass(formId, 'DATES')+"' style='"+ms.tdStyle(formId, 'DATES')+"' "+ms.tdEvent(formId, 'DATES')+">")
            arrHtml.push("<span colno='DATES' class='"+ms.uiClass(formId, 'DATES')+"' style='"+ms.uiStyle(formId, 'DATES')+"' "+ms.uiEvent(formId, 'DATES')+" title='"+ms.titleAttr(formId,'DATES','IS_TITLE_ATTR',v)+"' >"+v['DATES']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SEX' name='noprintset_SEX' class='datagrid-cell "+ms.tdClass(formId, 'SEX')+"' style='"+ms.tdStyle(formId, 'SEX')+"' "+ms.tdEvent(formId, 'SEX')+">")
            arrHtml.push("<span colno='SEX' class='"+ms.uiClass(formId, 'SEX')+"' style='"+ms.uiStyle(formId, 'SEX')+"' "+ms.uiEvent(formId, 'SEX')+" title='"+ms.titleAttr(formId,'SEX','IS_TITLE_ATTR',v)+"' >"+v['SEX']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='AGE' name='noprintset_AGE' class='datagrid-cell "+ms.tdClass(formId, 'AGE')+"' style='"+ms.tdStyle(formId, 'AGE')+"' "+ms.tdEvent(formId, 'AGE')+">")
            arrHtml.push("<span colno='AGE' class='"+ms.uiClass(formId, 'AGE')+"' style='"+ms.uiStyle(formId, 'AGE')+"' "+ms.uiEvent(formId, 'AGE')+" title='"+ms.titleAttr(formId,'AGE','IS_TITLE_ATTR',v)+"' >"+v['AGE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='NATHION' name='noprintset_NATHION' class='datagrid-cell "+ms.tdClass(formId, 'NATHION')+"' style='"+ms.tdStyle(formId, 'NATHION')+"' "+ms.tdEvent(formId, 'NATHION')+">")
            arrHtml.push("<span colno='NATHION' class='"+ms.uiClass(formId, 'NATHION')+"' style='"+ms.uiStyle(formId, 'NATHION')+"' "+ms.uiEvent(formId, 'NATHION')+" title='"+ms.titleAttr(formId,'NATHION','IS_TITLE_ATTR',v)+"' >"+v['NATHION']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='XUELI' name='noprintset_XUELI' class='datagrid-cell "+ms.tdClass(formId, 'XUELI')+"' style='"+ms.tdStyle(formId, 'XUELI')+"' "+ms.tdEvent(formId, 'XUELI')+">")
            arrHtml.push("<span colno='XUELI' class='"+ms.uiClass(formId, 'XUELI')+"' style='"+ms.uiStyle(formId, 'XUELI')+"' "+ms.uiEvent(formId, 'XUELI')+" title='"+ms.titleAttr(formId,'XUELI','IS_TITLE_ATTR',v)+"' >"+v['XUELI']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='HOBBY' name='noprintset_HOBBY' class='datagrid-cell "+ms.tdClass(formId, 'HOBBY')+"' style='"+ms.tdStyle(formId, 'HOBBY')+"' "+ms.tdEvent(formId, 'HOBBY')+">")
            arrHtml.push("<span colno='HOBBY' class='"+ms.uiClass(formId, 'HOBBY')+"' style='"+ms.uiStyle(formId, 'HOBBY')+"' "+ms.uiEvent(formId, 'HOBBY')+" title='"+ms.titleAttr(formId,'HOBBY','IS_TITLE_ATTR',v)+"' >"+v['HOBBY']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SCORE' name='noprintset_SCORE' class='datagrid-cell "+ms.tdClass(formId, 'SCORE')+"' style='"+ms.tdStyle(formId, 'SCORE')+"' "+ms.tdEvent(formId, 'SCORE')+">")
            arrHtml.push("<span colno='SCORE' class='"+ms.uiClass(formId, 'SCORE')+"' style='"+ms.uiStyle(formId, 'SCORE')+"' "+ms.uiEvent(formId, 'SCORE')+" title='"+ms.titleAttr(formId,'SCORE','IS_TITLE_ATTR',v)+"' >"+v['SCORE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PHONE' name='noprintset_PHONE' class='datagrid-cell "+ms.tdClass(formId, 'PHONE')+"' style='"+ms.tdStyle(formId, 'PHONE')+"' "+ms.tdEvent(formId, 'PHONE')+">")
            arrHtml.push("<span colno='PHONE' class='"+ms.uiClass(formId, 'PHONE')+"' style='"+ms.uiStyle(formId, 'PHONE')+"' "+ms.uiEvent(formId, 'PHONE')+" title='"+ms.titleAttr(formId,'PHONE','IS_TITLE_ATTR',v)+"' >"+v['PHONE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='BEIZHU' name='noprintset_BEIZHU' class='datagrid-cell "+ms.tdClass(formId, 'BEIZHU')+"' style='"+ms.tdStyle(formId, 'BEIZHU')+"' "+ms.tdEvent(formId, 'BEIZHU')+">")
            arrHtml.push("<span colno='BEIZHU' class='"+ms.uiClass(formId, 'BEIZHU')+"' style='"+ms.uiStyle(formId, 'BEIZHU')+"' "+ms.uiEvent(formId, 'BEIZHU')+" title='"+ms.titleAttr(formId,'BEIZHU','IS_TITLE_ATTR',v)+"' >"+v['BEIZHU']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CI_ITEM_GENRE' name='noprintset_CI_ITEM_GENRE' class='datagrid-cell "+ms.tdClass(formId, 'CI_ITEM_GENRE')+"' style='"+ms.tdStyle(formId, 'CI_ITEM_GENRE')+"' "+ms.tdEvent(formId, 'CI_ITEM_GENRE')+">")
            arrHtml.push("<span colno='CI_ITEM_GENRE' class='"+ms.uiClass(formId, 'CI_ITEM_GENRE')+"' style='"+ms.uiStyle(formId, 'CI_ITEM_GENRE')+"' "+ms.uiEvent(formId, 'CI_ITEM_GENRE')+" title='"+ms.titleAttr(formId,'CI_ITEM_GENRE','IS_TITLE_ATTR',v)+"' >"+v['CI_ITEM_GENRE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CI_ITEM_TYPE' name='noprintset_CI_ITEM_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CI_ITEM_TYPE')+"' style='"+ms.tdStyle(formId, 'CI_ITEM_TYPE')+"' "+ms.tdEvent(formId, 'CI_ITEM_TYPE')+">")
            arrHtml.push("<span colno='CI_ITEM_TYPE' class='"+ms.uiClass(formId, 'CI_ITEM_TYPE')+"' style='"+ms.uiStyle(formId, 'CI_ITEM_TYPE')+"' "+ms.uiEvent(formId, 'CI_ITEM_TYPE')+" title='"+ms.titleAttr(formId,'CI_ITEM_TYPE','IS_TITLE_ATTR',v)+"' >"+v['CI_ITEM_TYPE']+"</span>")
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
            arrHtml.push("<td colno='MORELEAN' name='noprintset_MORELEAN' class='datagrid-cell "+ms.tdClass(formId, 'MORELEAN')+"' style='"+ms.tdStyle(formId, 'MORELEAN')+"' "+ms.tdEvent(formId, 'MORELEAN')+">")
            arrHtml.push("<span colno='MORELEAN' class='"+ms.uiClass(formId, 'MORELEAN')+"' style='"+ms.uiStyle(formId, 'MORELEAN')+"' "+ms.uiEvent(formId, 'MORELEAN')+" title='"+ms.titleAttr(formId,'MORELEAN','IS_TITLE_ATTR',v)+"' >"+v['MORELEAN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ZHUCE' name='noprintset_ZHUCE' class='datagrid-cell "+ms.tdClass(formId, 'ZHUCE')+"' style='"+ms.tdStyle(formId, 'ZHUCE')+"' "+ms.tdEvent(formId, 'ZHUCE')+">")
            arrHtml.push("<span colno='ZHUCE' class='"+ms.uiClass(formId, 'ZHUCE')+"' style='"+ms.uiStyle(formId, 'ZHUCE')+"' "+ms.uiEvent(formId, 'ZHUCE')+" title='"+ms.titleAttr(formId,'ZHUCE','IS_TITLE_ATTR',v)+"' >"+v['ZHUCE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PHOTO' name='noprintset_PHOTO' class='datagrid-cell "+ms.tdClass(formId, 'PHOTO')+"' style='"+ms.tdStyle(formId, 'PHOTO')+"' "+ms.tdEvent(formId, 'PHOTO')+">")
            arrHtml.push("<span colno='PHOTO' class='"+ms.uiClass(formId, 'PHOTO')+"' style='"+ms.uiStyle(formId, 'PHOTO')+"' "+ms.uiEvent(formId, 'PHOTO')+" title='"+ms.titleAttr(formId,'PHOTO','IS_TITLE_ATTR',v)+"' >"+v['PHOTO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PHOTO_SIZE' name='noprintset_PHOTO_SIZE' class='datagrid-cell "+ms.tdClass(formId, 'PHOTO_SIZE')+"' style='"+ms.tdStyle(formId, 'PHOTO_SIZE')+"' "+ms.tdEvent(formId, 'PHOTO_SIZE')+">")
            arrHtml.push("<span colno='PHOTO_SIZE' class='"+ms.uiClass(formId, 'PHOTO_SIZE')+"' style='"+ms.uiStyle(formId, 'PHOTO_SIZE')+"' "+ms.uiEvent(formId, 'PHOTO_SIZE')+" title='"+ms.titleAttr(formId,'PHOTO_SIZE','IS_TITLE_ATTR',v)+"' >"+v['PHOTO_SIZE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PHOTO_NAME' name='noprintset_PHOTO_NAME' class='datagrid-cell "+ms.tdClass(formId, 'PHOTO_NAME')+"' style='"+ms.tdStyle(formId, 'PHOTO_NAME')+"' "+ms.tdEvent(formId, 'PHOTO_NAME')+">")
            arrHtml.push("<span colno='PHOTO_NAME' class='"+ms.uiClass(formId, 'PHOTO_NAME')+"' style='"+ms.uiStyle(formId, 'PHOTO_NAME')+"' "+ms.uiEvent(formId, 'PHOTO_NAME')+" title='"+ms.titleAttr(formId,'PHOTO_NAME','IS_TITLE_ATTR',v)+"' >"+v['PHOTO_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PHOTO_PATH' name='noprintset_PHOTO_PATH' class='datagrid-cell "+ms.tdClass(formId, 'PHOTO_PATH')+"' style='"+ms.tdStyle(formId, 'PHOTO_PATH')+"' "+ms.tdEvent(formId, 'PHOTO_PATH')+">")
            arrHtml.push("<span colno='PHOTO_PATH' class='"+ms.uiClass(formId, 'PHOTO_PATH')+"' style='"+ms.uiStyle(formId, 'PHOTO_PATH')+"' "+ms.uiEvent(formId, 'PHOTO_PATH')+" title='"+ms.titleAttr(formId,'PHOTO_PATH','IS_TITLE_ATTR',v)+"' >"+v['PHOTO_PATH']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PHOTO_LIU' name='noprintset_PHOTO_LIU' class='datagrid-cell "+ms.tdClass(formId, 'PHOTO_LIU')+"' style='"+ms.tdStyle(formId, 'PHOTO_LIU')+"' "+ms.tdEvent(formId, 'PHOTO_LIU')+">")
            arrHtml.push("<span colno='PHOTO_LIU' class='"+ms.uiClass(formId, 'PHOTO_LIU')+"' style='"+ms.uiStyle(formId, 'PHOTO_LIU')+"' "+ms.uiEvent(formId, 'PHOTO_LIU')+" title='"+ms.titleAttr(formId,'PHOTO_LIU','IS_TITLE_ATTR',v)+"' >"+v['PHOTO_LIU']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WENJIAN' name='noprintset_WENJIAN' class='datagrid-cell "+ms.tdClass(formId, 'WENJIAN')+"' style='"+ms.tdStyle(formId, 'WENJIAN')+"' "+ms.tdEvent(formId, 'WENJIAN')+">")
            arrHtml.push("<span colno='WENJIAN' class='"+ms.uiClass(formId, 'WENJIAN')+"' style='"+ms.uiStyle(formId, 'WENJIAN')+"' "+ms.uiEvent(formId, 'WENJIAN')+" title='"+ms.titleAttr(formId,'WENJIAN','IS_TITLE_ATTR',v)+"' >"+v['WENJIAN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WENJIAN_SIZE' name='noprintset_WENJIAN_SIZE' class='datagrid-cell "+ms.tdClass(formId, 'WENJIAN_SIZE')+"' style='"+ms.tdStyle(formId, 'WENJIAN_SIZE')+"' "+ms.tdEvent(formId, 'WENJIAN_SIZE')+">")
            arrHtml.push("<span colno='WENJIAN_SIZE' class='"+ms.uiClass(formId, 'WENJIAN_SIZE')+"' style='"+ms.uiStyle(formId, 'WENJIAN_SIZE')+"' "+ms.uiEvent(formId, 'WENJIAN_SIZE')+" title='"+ms.titleAttr(formId,'WENJIAN_SIZE','IS_TITLE_ATTR',v)+"' >"+v['WENJIAN_SIZE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WENJIAN_NAME' name='noprintset_WENJIAN_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WENJIAN_NAME')+"' style='"+ms.tdStyle(formId, 'WENJIAN_NAME')+"' "+ms.tdEvent(formId, 'WENJIAN_NAME')+">")
            arrHtml.push("<span colno='WENJIAN_NAME' class='"+ms.uiClass(formId, 'WENJIAN_NAME')+"' style='"+ms.uiStyle(formId, 'WENJIAN_NAME')+"' "+ms.uiEvent(formId, 'WENJIAN_NAME')+" title='"+ms.titleAttr(formId,'WENJIAN_NAME','IS_TITLE_ATTR',v)+"' >"+v['WENJIAN_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WENJIAN_PATH' name='noprintset_WENJIAN_PATH' class='datagrid-cell "+ms.tdClass(formId, 'WENJIAN_PATH')+"' style='"+ms.tdStyle(formId, 'WENJIAN_PATH')+"' "+ms.tdEvent(formId, 'WENJIAN_PATH')+">")
            arrHtml.push("<span colno='WENJIAN_PATH' class='"+ms.uiClass(formId, 'WENJIAN_PATH')+"' style='"+ms.uiStyle(formId, 'WENJIAN_PATH')+"' "+ms.uiEvent(formId, 'WENJIAN_PATH')+" title='"+ms.titleAttr(formId,'WENJIAN_PATH','IS_TITLE_ATTR',v)+"' >"+v['WENJIAN_PATH']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MULFILES' name='noprintset_MULFILES' class='datagrid-cell "+ms.tdClass(formId, 'MULFILES')+"' style='"+ms.tdStyle(formId, 'MULFILES')+"' "+ms.tdEvent(formId, 'MULFILES')+">")
            arrHtml.push("<span colno='MULFILES' class='"+ms.uiClass(formId, 'MULFILES')+"' style='"+ms.uiStyle(formId, 'MULFILES')+"' "+ms.uiEvent(formId, 'MULFILES')+" title='"+ms.titleAttr(formId,'MULFILES','IS_TITLE_ATTR',v)+"' >"+v['MULFILES']+"</span>")
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
    if(formId=='877ec66d70334b25a2a2a4ea172da89a'){<%--SAW_STUDENT97--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td colno='SNO' name='noprintset_SNO' class='datagrid-cell "+ms.tdClass(formId, 'SNO')+"' style='"+ms.tdStyle(formId, 'SNO')+"' "+ms.tdEvent(formId, 'SNO')+">")
            arrHtml.push("<span colno='SNO' class='"+ms.uiClass(formId, 'SNO')+"' style='"+ms.uiStyle(formId, 'SNO')+"' "+ms.uiEvent(formId, 'SNO')+" title='"+ms.titleAttr(formId,'SNO','IS_TITLE_ATTR',v)+"' >"+v['SNO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='NAME' name='noprintset_NAME' class='datagrid-cell "+ms.tdClass(formId, 'NAME')+"' style='"+ms.tdStyle(formId, 'NAME')+"' "+ms.tdEvent(formId, 'NAME')+">")
            arrHtml.push("<span colno='NAME' class='"+ms.uiClass(formId, 'NAME')+"' style='"+ms.uiStyle(formId, 'NAME')+"' "+ms.uiEvent(formId, 'NAME')+" title='"+ms.titleAttr(formId,'NAME','IS_TITLE_ATTR',v)+"' >"+v['NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TIMES' name='noprintset_TIMES' class='datagrid-cell "+ms.tdClass(formId, 'TIMES')+"' style='"+ms.tdStyle(formId, 'TIMES')+"' "+ms.tdEvent(formId, 'TIMES')+">")
            arrHtml.push("<span colno='TIMES' class='"+ms.uiClass(formId, 'TIMES')+"' style='"+ms.uiStyle(formId, 'TIMES')+"' "+ms.uiEvent(formId, 'TIMES')+" title='"+ms.titleAttr(formId,'TIMES','IS_TITLE_ATTR',v)+"' >"+v['TIMES']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATES' name='noprintset_DATES' class='datagrid-cell "+ms.tdClass(formId, 'DATES')+"' style='"+ms.tdStyle(formId, 'DATES')+"' "+ms.tdEvent(formId, 'DATES')+">")
            arrHtml.push("<span colno='DATES' class='"+ms.uiClass(formId, 'DATES')+"' style='"+ms.uiStyle(formId, 'DATES')+"' "+ms.uiEvent(formId, 'DATES')+" title='"+ms.titleAttr(formId,'DATES','IS_TITLE_ATTR',v)+"' >"+v['DATES']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SEX' name='noprintset_SEX' class='datagrid-cell "+ms.tdClass(formId, 'SEX')+"' style='"+ms.tdStyle(formId, 'SEX')+"' "+ms.tdEvent(formId, 'SEX')+">")
            arrHtml.push("<span colno='SEX' class='"+ms.uiClass(formId, 'SEX')+"' style='"+ms.uiStyle(formId, 'SEX')+"' "+ms.uiEvent(formId, 'SEX')+" title='"+ms.titleAttr(formId,'SEX','IS_TITLE_ATTR',v)+"' >"+v['SEX']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='AGE' name='noprintset_AGE' class='datagrid-cell "+ms.tdClass(formId, 'AGE')+"' style='"+ms.tdStyle(formId, 'AGE')+"' "+ms.tdEvent(formId, 'AGE')+">")
            arrHtml.push("<span colno='AGE' class='"+ms.uiClass(formId, 'AGE')+"' style='"+ms.uiStyle(formId, 'AGE')+"' "+ms.uiEvent(formId, 'AGE')+" title='"+ms.titleAttr(formId,'AGE','IS_TITLE_ATTR',v)+"' >"+v['AGE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='NATHION' name='noprintset_NATHION' class='datagrid-cell "+ms.tdClass(formId, 'NATHION')+"' style='"+ms.tdStyle(formId, 'NATHION')+"' "+ms.tdEvent(formId, 'NATHION')+">")
            arrHtml.push("<span colno='NATHION' class='"+ms.uiClass(formId, 'NATHION')+"' style='"+ms.uiStyle(formId, 'NATHION')+"' "+ms.uiEvent(formId, 'NATHION')+" title='"+ms.titleAttr(formId,'NATHION','IS_TITLE_ATTR',v)+"' >"+v['NATHION']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='XUELI' name='noprintset_XUELI' class='datagrid-cell "+ms.tdClass(formId, 'XUELI')+"' style='"+ms.tdStyle(formId, 'XUELI')+"' "+ms.tdEvent(formId, 'XUELI')+">")
            arrHtml.push("<span colno='XUELI' class='"+ms.uiClass(formId, 'XUELI')+"' style='"+ms.uiStyle(formId, 'XUELI')+"' "+ms.uiEvent(formId, 'XUELI')+" title='"+ms.titleAttr(formId,'XUELI','IS_TITLE_ATTR',v)+"' >"+v['XUELI']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='HOBBY' name='noprintset_HOBBY' class='datagrid-cell "+ms.tdClass(formId, 'HOBBY')+"' style='"+ms.tdStyle(formId, 'HOBBY')+"' "+ms.tdEvent(formId, 'HOBBY')+">")
            arrHtml.push("<span colno='HOBBY' class='"+ms.uiClass(formId, 'HOBBY')+"' style='"+ms.uiStyle(formId, 'HOBBY')+"' "+ms.uiEvent(formId, 'HOBBY')+" title='"+ms.titleAttr(formId,'HOBBY','IS_TITLE_ATTR',v)+"' >"+v['HOBBY']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SCORE' name='noprintset_SCORE' class='datagrid-cell "+ms.tdClass(formId, 'SCORE')+"' style='"+ms.tdStyle(formId, 'SCORE')+"' "+ms.tdEvent(formId, 'SCORE')+">")
            arrHtml.push("<span colno='SCORE' class='"+ms.uiClass(formId, 'SCORE')+"' style='"+ms.uiStyle(formId, 'SCORE')+"' "+ms.uiEvent(formId, 'SCORE')+" title='"+ms.titleAttr(formId,'SCORE','IS_TITLE_ATTR',v)+"' >"+v['SCORE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PHONE' name='noprintset_PHONE' class='datagrid-cell "+ms.tdClass(formId, 'PHONE')+"' style='"+ms.tdStyle(formId, 'PHONE')+"' "+ms.tdEvent(formId, 'PHONE')+">")
            arrHtml.push("<span colno='PHONE' class='"+ms.uiClass(formId, 'PHONE')+"' style='"+ms.uiStyle(formId, 'PHONE')+"' "+ms.uiEvent(formId, 'PHONE')+" title='"+ms.titleAttr(formId,'PHONE','IS_TITLE_ATTR',v)+"' >"+v['PHONE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='BEIZHU' name='noprintset_BEIZHU' class='datagrid-cell "+ms.tdClass(formId, 'BEIZHU')+"' style='"+ms.tdStyle(formId, 'BEIZHU')+"' "+ms.tdEvent(formId, 'BEIZHU')+">")
            arrHtml.push("<span colno='BEIZHU' class='"+ms.uiClass(formId, 'BEIZHU')+"' style='"+ms.uiStyle(formId, 'BEIZHU')+"' "+ms.uiEvent(formId, 'BEIZHU')+" title='"+ms.titleAttr(formId,'BEIZHU','IS_TITLE_ATTR',v)+"' >"+v['BEIZHU']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CI_ITEM_GENRE' name='noprintset_CI_ITEM_GENRE' class='datagrid-cell "+ms.tdClass(formId, 'CI_ITEM_GENRE')+"' style='"+ms.tdStyle(formId, 'CI_ITEM_GENRE')+"' "+ms.tdEvent(formId, 'CI_ITEM_GENRE')+">")
            arrHtml.push("<span colno='CI_ITEM_GENRE' class='"+ms.uiClass(formId, 'CI_ITEM_GENRE')+"' style='"+ms.uiStyle(formId, 'CI_ITEM_GENRE')+"' "+ms.uiEvent(formId, 'CI_ITEM_GENRE')+" title='"+ms.titleAttr(formId,'CI_ITEM_GENRE','IS_TITLE_ATTR',v)+"' >"+v['CI_ITEM_GENRE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CI_ITEM_TYPE' name='noprintset_CI_ITEM_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CI_ITEM_TYPE')+"' style='"+ms.tdStyle(formId, 'CI_ITEM_TYPE')+"' "+ms.tdEvent(formId, 'CI_ITEM_TYPE')+">")
            arrHtml.push("<span colno='CI_ITEM_TYPE' class='"+ms.uiClass(formId, 'CI_ITEM_TYPE')+"' style='"+ms.uiStyle(formId, 'CI_ITEM_TYPE')+"' "+ms.uiEvent(formId, 'CI_ITEM_TYPE')+" title='"+ms.titleAttr(formId,'CI_ITEM_TYPE','IS_TITLE_ATTR',v)+"' >"+v['CI_ITEM_TYPE']+"</span>")
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
            arrHtml.push("<td colno='MORELEAN' name='noprintset_MORELEAN' class='datagrid-cell "+ms.tdClass(formId, 'MORELEAN')+"' style='"+ms.tdStyle(formId, 'MORELEAN')+"' "+ms.tdEvent(formId, 'MORELEAN')+">")
            arrHtml.push("<span colno='MORELEAN' class='"+ms.uiClass(formId, 'MORELEAN')+"' style='"+ms.uiStyle(formId, 'MORELEAN')+"' "+ms.uiEvent(formId, 'MORELEAN')+" title='"+ms.titleAttr(formId,'MORELEAN','IS_TITLE_ATTR',v)+"' >"+v['MORELEAN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ZHUCE' name='noprintset_ZHUCE' class='datagrid-cell "+ms.tdClass(formId, 'ZHUCE')+"' style='"+ms.tdStyle(formId, 'ZHUCE')+"' "+ms.tdEvent(formId, 'ZHUCE')+">")
            arrHtml.push("<span colno='ZHUCE' class='"+ms.uiClass(formId, 'ZHUCE')+"' style='"+ms.uiStyle(formId, 'ZHUCE')+"' "+ms.uiEvent(formId, 'ZHUCE')+" title='"+ms.titleAttr(formId,'ZHUCE','IS_TITLE_ATTR',v)+"' >"+v['ZHUCE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PHOTO' name='noprintset_PHOTO' class='datagrid-cell "+ms.tdClass(formId, 'PHOTO')+"' style='"+ms.tdStyle(formId, 'PHOTO')+"' "+ms.tdEvent(formId, 'PHOTO')+">")
            arrHtml.push("<span colno='PHOTO' class='"+ms.uiClass(formId, 'PHOTO')+"' style='"+ms.uiStyle(formId, 'PHOTO')+"' "+ms.uiEvent(formId, 'PHOTO')+" title='"+ms.titleAttr(formId,'PHOTO','IS_TITLE_ATTR',v)+"' >"+v['PHOTO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PHOTO_SIZE' name='noprintset_PHOTO_SIZE' class='datagrid-cell "+ms.tdClass(formId, 'PHOTO_SIZE')+"' style='"+ms.tdStyle(formId, 'PHOTO_SIZE')+"' "+ms.tdEvent(formId, 'PHOTO_SIZE')+">")
            arrHtml.push("<span colno='PHOTO_SIZE' class='"+ms.uiClass(formId, 'PHOTO_SIZE')+"' style='"+ms.uiStyle(formId, 'PHOTO_SIZE')+"' "+ms.uiEvent(formId, 'PHOTO_SIZE')+" title='"+ms.titleAttr(formId,'PHOTO_SIZE','IS_TITLE_ATTR',v)+"' >"+v['PHOTO_SIZE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PHOTO_NAME' name='noprintset_PHOTO_NAME' class='datagrid-cell "+ms.tdClass(formId, 'PHOTO_NAME')+"' style='"+ms.tdStyle(formId, 'PHOTO_NAME')+"' "+ms.tdEvent(formId, 'PHOTO_NAME')+">")
            arrHtml.push("<span colno='PHOTO_NAME' class='"+ms.uiClass(formId, 'PHOTO_NAME')+"' style='"+ms.uiStyle(formId, 'PHOTO_NAME')+"' "+ms.uiEvent(formId, 'PHOTO_NAME')+" title='"+ms.titleAttr(formId,'PHOTO_NAME','IS_TITLE_ATTR',v)+"' >"+v['PHOTO_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PHOTO_PATH' name='noprintset_PHOTO_PATH' class='datagrid-cell "+ms.tdClass(formId, 'PHOTO_PATH')+"' style='"+ms.tdStyle(formId, 'PHOTO_PATH')+"' "+ms.tdEvent(formId, 'PHOTO_PATH')+">")
            arrHtml.push("<span colno='PHOTO_PATH' class='"+ms.uiClass(formId, 'PHOTO_PATH')+"' style='"+ms.uiStyle(formId, 'PHOTO_PATH')+"' "+ms.uiEvent(formId, 'PHOTO_PATH')+" title='"+ms.titleAttr(formId,'PHOTO_PATH','IS_TITLE_ATTR',v)+"' >"+v['PHOTO_PATH']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PHOTO_LIU' name='noprintset_PHOTO_LIU' class='datagrid-cell "+ms.tdClass(formId, 'PHOTO_LIU')+"' style='"+ms.tdStyle(formId, 'PHOTO_LIU')+"' "+ms.tdEvent(formId, 'PHOTO_LIU')+">")
            arrHtml.push("<span colno='PHOTO_LIU' class='"+ms.uiClass(formId, 'PHOTO_LIU')+"' style='"+ms.uiStyle(formId, 'PHOTO_LIU')+"' "+ms.uiEvent(formId, 'PHOTO_LIU')+" title='"+ms.titleAttr(formId,'PHOTO_LIU','IS_TITLE_ATTR',v)+"' >"+v['PHOTO_LIU']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WENJIAN' name='noprintset_WENJIAN' class='datagrid-cell "+ms.tdClass(formId, 'WENJIAN')+"' style='"+ms.tdStyle(formId, 'WENJIAN')+"' "+ms.tdEvent(formId, 'WENJIAN')+">")
            arrHtml.push("<span colno='WENJIAN' class='"+ms.uiClass(formId, 'WENJIAN')+"' style='"+ms.uiStyle(formId, 'WENJIAN')+"' "+ms.uiEvent(formId, 'WENJIAN')+" title='"+ms.titleAttr(formId,'WENJIAN','IS_TITLE_ATTR',v)+"' >"+v['WENJIAN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WENJIAN_SIZE' name='noprintset_WENJIAN_SIZE' class='datagrid-cell "+ms.tdClass(formId, 'WENJIAN_SIZE')+"' style='"+ms.tdStyle(formId, 'WENJIAN_SIZE')+"' "+ms.tdEvent(formId, 'WENJIAN_SIZE')+">")
            arrHtml.push("<span colno='WENJIAN_SIZE' class='"+ms.uiClass(formId, 'WENJIAN_SIZE')+"' style='"+ms.uiStyle(formId, 'WENJIAN_SIZE')+"' "+ms.uiEvent(formId, 'WENJIAN_SIZE')+" title='"+ms.titleAttr(formId,'WENJIAN_SIZE','IS_TITLE_ATTR',v)+"' >"+v['WENJIAN_SIZE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WENJIAN_NAME' name='noprintset_WENJIAN_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WENJIAN_NAME')+"' style='"+ms.tdStyle(formId, 'WENJIAN_NAME')+"' "+ms.tdEvent(formId, 'WENJIAN_NAME')+">")
            arrHtml.push("<span colno='WENJIAN_NAME' class='"+ms.uiClass(formId, 'WENJIAN_NAME')+"' style='"+ms.uiStyle(formId, 'WENJIAN_NAME')+"' "+ms.uiEvent(formId, 'WENJIAN_NAME')+" title='"+ms.titleAttr(formId,'WENJIAN_NAME','IS_TITLE_ATTR',v)+"' >"+v['WENJIAN_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WENJIAN_PATH' name='noprintset_WENJIAN_PATH' class='datagrid-cell "+ms.tdClass(formId, 'WENJIAN_PATH')+"' style='"+ms.tdStyle(formId, 'WENJIAN_PATH')+"' "+ms.tdEvent(formId, 'WENJIAN_PATH')+">")
            arrHtml.push("<span colno='WENJIAN_PATH' class='"+ms.uiClass(formId, 'WENJIAN_PATH')+"' style='"+ms.uiStyle(formId, 'WENJIAN_PATH')+"' "+ms.uiEvent(formId, 'WENJIAN_PATH')+" title='"+ms.titleAttr(formId,'WENJIAN_PATH','IS_TITLE_ATTR',v)+"' >"+v['WENJIAN_PATH']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MULFILES' name='noprintset_MULFILES' class='datagrid-cell "+ms.tdClass(formId, 'MULFILES')+"' style='"+ms.tdStyle(formId, 'MULFILES')+"' "+ms.tdEvent(formId, 'MULFILES')+">")
            arrHtml.push("<span colno='MULFILES' class='"+ms.uiClass(formId, 'MULFILES')+"' style='"+ms.uiStyle(formId, 'MULFILES')+"' "+ms.uiEvent(formId, 'MULFILES')+" title='"+ms.titleAttr(formId,'MULFILES','IS_TITLE_ATTR',v)+"' >"+v['MULFILES']+"</span>")
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
