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
		<dict:lang value="导航功能模块1" />
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
		<bu:header formId ="175c4afd1c0149a092c2d0bacf445401"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <!-- 产品静态资源 -->
 <style>
    .deptcss {
    text-align: left!important;

}

   
    </style>
	
	<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
	</object>

</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="20c8a02f7b1c47b6bc0ddf9021dfac20" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="20c8a02f7b1c47b6bc0ddf9021dfac20" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage175c4afd1c0149a092c2d0bacf445401" id="formPage175c4afd1c0149a092c2d0bacf445401" value="${formPage175c4afd1c0149a092c2d0bacf445401}"/>
		<input type="hidden" name="formId" id="formId1" value='175c4afd1c0149a092c2d0bacf445401'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="175c4afd1c0149a092c2d0bacf445401">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax175c4afd1c0149a092c2d0bacf445401" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner175c4afd1c0149a092c2d0bacf445401">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable175c4afd1c0149a092c2d0bacf445401">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="175c4afd1c0149a092c2d0bacf445401" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_175c4afd1c0149a092c2d0bacf445401" onclick="_selectAjaxTableAllData(this,'175c4afd1c0149a092c2d0bacf445401')" style="cursor: pointer;"title="全选"/></span></td>
		 <!--   <td name="noprintset_DATA_AUTH" class="datagrid-cell" style="width:150px;"><bu:uitn colNo="DATA_AUTH" formId="175c4afd1c0149a092c2d0bacf445401" /></td> -->
		<!--	<td name="noprintset_TAM_MENU_ID" class="datagrid-cell"><bu:uitn colNo="TAM_MENU_ID" formId="175c4afd1c0149a092c2d0bacf445401" /></td> -->
			<td name="noprintset_TAM_MENU_NAME" class="datagrid-cell" style="width:150px;"><bu:uitn colNo="TAM_MENU_NAME" formId="175c4afd1c0149a092c2d0bacf445401" /></td>
		<!--	<td name="noprintset_TAM_SEQ" class="datagrid-cell"><bu:uitn colNo="TAM_SEQ" formId="175c4afd1c0149a092c2d0bacf445401" /></td> -->
			<td name="noprintset_TAM_MENU_PHOTO" class="datagrid-cell" style="width:150px;"><bu:uitn colNo="TAM_MENU_PHOTO" formId="175c4afd1c0149a092c2d0bacf445401" /></td>
		<!--	<td name="noprintset_TAM_PHOTO_PATH" class="datagrid-cell"><bu:uitn colNo="TAM_PHOTO_PATH" formId="175c4afd1c0149a092c2d0bacf445401" /></td> -->
			<td name="noprintset_TAM_MENU_PHOTO2" class="datagrid-cell" style="width:150px;"><bu:uitn colNo="TAM_MENU_PHOTO2" formId="175c4afd1c0149a092c2d0bacf445401" /></td>
		<!--	<td name="noprintset_TAM_PHOTO_PATH2" class="datagrid-cell"><bu:uitn colNo="TAM_PHOTO_PATH2" formId="175c4afd1c0149a092c2d0bacf445401" /></td> -->
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv175c4afd1c0149a092c2d0bacf445401" onscroll="ajaxTableScroll(this,'175c4afd1c0149a092c2d0bacf445401')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax175c4afd1c0149a092c2d0bacf445401">
		<tbody id="tbody_175c4afd1c0149a092c2d0bacf445401" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage175c4afd1c0149a092c2d0bacf445401==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=getInfoList&formId=175c4afd1c0149a092c2d0bacf445401&showLoading=0" />
			</div>
		</c:if>
		
		

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 
 <button type="button" onclick="printset_17('175c4afd1c0149a092c2d0bacf445401','1');">打印</button>
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
 <td style="width: 100px;text-align: right;"><span>?导航菜单ID</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="TAM_MENU_ID" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="TAM_MENU_ID" value="" title_name="?导航菜单ID" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>导航菜单</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="TAM_MENU_NAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="TAM_MENU_NAME" value="" title_name="导航菜单" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>显示顺序</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="TAM_SEQ" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="TAM_SEQ" value="" title_name="显示顺序" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>导航菜单图片</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="TAM_MENU_PHOTO" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="TAM_MENU_PHOTO" value="" title_name="导航菜单图片" />px
 </td>
 </tr>choosePic
 <tr>
 <td style="width: 100px;text-align: right;"><span>图片路径</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="TAM_PHOTO_PATH" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="TAM_PHOTO_PATH" value="" title_name="图片路径" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>导航菜单图片</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="TAM_MENU_PHOTO2" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="TAM_MENU_PHOTO2" value="" title_name="导航菜单图片" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?选中图片路径</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="TAM_PHOTO_PATH2" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="TAM_PHOTO_PATH2" value="" title_name="?选中图片路径" />px
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
    
  <!-- 新增div -->
    
    <div id="backItem" class="dialog-mask" style="z-index:11111;"/></div>
    <div class="dialog dialog-s1" id="addItem" style="display:none;z-index:11112;margin-left:0px;left:calc(50% - 250px);top:calc(50% - 182.5px);width:600px;height:340px;" >
		<div class="dialog-hd">
			<h3 class="tit"><dict:lang value="新增"/></h3>
		</div>	
		<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addItem','backItem');"></a>
		<div class="optn optn_div hd" style="height: 40px; width：600px;box-sizing: border-box;margin-bottom: 0;">	
           <!--      <div style="margin-left:10px;">
               <div class="save-close" id="savelose" onclick="saveClose(this)"></div> 
                <input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
                              <div style="float:left" class="deptcss"><span class="dot">*</span><dict:lang value="组织机构"/> 
                  <select disabled class="dept_select IS_SELECT_FILTER" style="width:200px;" id="addfuncauth" ><option>--请选择--</option></select> 
                  </div> 
                </div> -->
			<button type="button" onclick="adds();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
		    <button type="button" onclick="hideDiv('addItem','backItem');"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
		</div>
			
	    <div class="dialog-bd-div" style="width:100%;height:calc(100% - 37px);">
			<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
					target="submitFrame" enctype="multipart/form-data">
                <div class="bd" style="padding:0 20px;">
    				<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
      				</jsp:include>
    		        <bu:set name="paraMapObj" value="${dataId}" formId="175c4afd1c0149a092c2d0bacf445401" type="add" />
                	<table class="basic-table" >
                    	<input type="hidden" name="formIds" value="175c4afd1c0149a092c2d0bacf445401" />
                    	<input type="hidden" id="prefixInd" name="175c4afd1c0149a092c2d0bacf445401" value="paraMap1@" />
                    	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
                    	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
                    	<s:set name="_$viewId" value="'186c737eeb004c5f86747599c595f91a'" />
        		        <s:set name="_$formId_1" value="'175c4afd1c0149a092c2d0bacf445401'" />
        		      	<s:set name="_$type" value="'add'" />
                		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="TAM_MENU_NAME" formId="175c4afd1c0149a092c2d0bacf445401" /></td>
			<bu:td cssClass="dec" colNo="TAM_MENU_NAME" formId="175c4afd1c0149a092c2d0bacf445401" ><bu:ui    colNo="TAM_MENU_NAME" formId="175c4afd1c0149a092c2d0bacf445401" value="%{TAM_MENU_NAME}" formIndex="1" /></bu:td>
		</tr>
		<!--
		<tr>
			<td class="name-three" /><bu:uitn colNo="TAM_MENU_PHOTO" formId="175c4afd1c0149a092c2d0bacf445401" /></td>
			<bu:td cssClass="dec-self" colNo="TAM_MENU_PHOTO" formId="175c4afd1c0149a092c2d0bacf445401" ><bu:ui colNo="TAM_MENU_PHOTO" formId="175c4afd1c0149a092c2d0bacf445401" value="%{TAM_MENU_PHOTO}" formIndex="1" /></bu:td>
		</tr>
		-->
		<tr>
                		    <td class="name"    style="width:88px;vertical-align: bottom;" /><bu:uitn colNo="TAM_MENU_PHOTO" formId="175c4afd1c0149a092c2d0bacf445401" /></td>	
                			<td class="dec"   rowspan="1"  style="width:150px;vertical-align: bottom;">
                			<div id="photoImg"  style="margin-bottom:14px;height:60px;" > 
                			<img alt="" id="img0" src="plf/page/fp/img/MoreWis_s.png" align="bottom" style="width:120px;height:60px;float:left;" > 
                			<!--	<span style="font-size:12px;color:#999;float:left;margin-top:46px;margin-left:5px;">支持100KB以内</span> 	-->	
                			</div>
                <!--	<input type="file" accept="image/*" id="paraMap1_CFI_PHOTO" name="upFile" value="" class="isSubmit input">	-->	

                			<input type='button' value='<dict:lang value="导航默认图片" />' id="select_system" onclick="choosePic('1','img0','serverfileName1')"> 
                			<input type="hidden" name="serverfileName1" id="serverfileName1" value="" />
                			<input type="file" id="paraMap1_TAM_MENU_PHOTO" onchange="javascript:_setImagePreview('photoImg','img0','paraMap1_TAM_MENU_PHOTO');" style="display:none;" name="upFile" class=" input isSubmit  _VAL_OjbsData">
                			</td>
                		</td>
                		</tr>
		<!--
		<tr>
			<td class="name-three" /><bu:uitn colNo="TAM_MENU_PHOTO2" formId="175c4afd1c0149a092c2d0bacf445401" /></td>
			<bu:td cssClass="dec-self" colNo="TAM_MENU_PHOTO2" formId="175c4afd1c0149a092c2d0bacf445401" ><bu:ui colNo="TAM_MENU_PHOTO2" formId="175c4afd1c0149a092c2d0bacf445401" value="%{TAM_MENU_PHOTO2}" formIndex="1" /></bu:td>
		</tr>
		-->
			<tr>
                		  <td class="name"    style="width:88px;vertical-align: bottom;" /><bu:uitn colNo="TAM_MENU_PHOTO2" formId="175c4afd1c0149a092c2d0bacf445401" /></td>	
                			<td class="dec"   rowspan="1"  style="width:150px;vertical-align: bottom;">
                			<div id="photoImgs"  style="margin-bottom:14px;height:60px;" > 
                		<img alt="" id="img1" src="plf/page/fp/img/MoreWis_s.png" align="bottom" style="width:120px;height:60px;float:left;" >  
                			<!--	<span style="font-size:12px;color:#999;float:left;margin-top:46px;margin-left:5px;">支持100KB以内</span> 	-->	
                			</div>
                <!--				<input type="file" accept="image/*" id="paraMap1_CFI_PHOTO2" name="upFile2" value="" class="isSubmit input"> -->			

                	<input type='button' value='<dict:lang value="导航选中图片" />' id="select_systems" onclick="choosePic('1','img1','serverfileName2')">  
                			<input type="hidden" name="serverfileName2" id="serverfileName2" value="" />
                			<input type="file" id="paraMap1_TAM_MENU_PHOTO2" onchange="javascript:_setImagePreview('photoImgs','img1','paraMap1_TAM_MENU_PHOTO2');" style="display:none;" name="upFile2" class=" input isSubmit  _VAL_OjbsData">  
                			</td>
                		</td>
                		</tr>
	
	</table>
			<bu:jsVal formId="175c4afd1c0149a092c2d0bacf445401" formIndex="1" />
				
			</div>
		 </form>
	</div>
</div>	
    
	
	
	
	
 <!--修改div-->
 
 
   <!-- 修改div -->		
		 <div id="backItems" class="dialog-mask" style="z-index:11111;"/></div>
	    <form id="editForm" name="editForm" action="${path}buss/bussModel_exeFunc.ms?funcMId=59f4c3345634443fb49112b9aaf5d7e7&type=edit" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
		<div class="dialog dialog-s1" id="addItems" style="display:none;z-index:11112;margin-left:0px;left:calc(50% - 250px);top:calc(50% - 182.5px);top:5px;width:600px;height:340px;" >
		 <div class="dialog-hd">
				 <h3 class="tit"><dict:lang value="修改"/></h3>
			 </div>	
			
				<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addItems','backItems');"></a>
				<div class="optn optn_div hd" style="height: 40px; width：600px;box-sizing: border-box;margin-bottom: 0;">	
				                <!--  <div style="float:left" class="deptcss"><span class="dot">*</span><dict:lang value="组织机构"/> 
                  <select disabled class="dept_select IS_SELECT_FILTER" id="editfuncauth" ><option>--请选择--</option></select>
                  </div> -->
		            <button type="button" onclick="edits();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        			<button type="button" onclick="hideDiv('addItems','backItems');" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
		</div>
		<div class="edit"  style="width:100%;height:calc(100% - 5px);">
	<!--<form id="editForm" name="editForm" action="" method="post" >
	<form id="editForm" name="editForm" action="${path}buss/bussModel_exeFunc.ms?funcMId=59f4c3345634443fb49112b9aaf5d7e7&type=edit" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>	-->
			<div class="dialog-bd-div">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
  					           
  		<!--<form id="editForm" name="editForm" action="" method="post" >-->
		<bu:set name="paraMapObj" value="${dataId}" formId="175c4afd1c0149a092c2d0bacf445401" type="edit" />
		
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="175c4afd1c0149a092c2d0bacf445401" />
	<input type="hidden" id="prefixInd" name="175c4afd1c0149a092c2d0bacf445401" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" id="picturePath" name="picturePath" value="${path}" />
	<input type="hidden" id="picturePath2" name="picturePath2" value="${path}" /> 
	<input type="hidden" id="pPath" name="oldPictureName" value="">
	<input type="hidden" id="pPath2" name="oldPictureName2" value="">
	<input type="hidden" id="selId" name="selId" value="">
		<s:set name="_$viewId" value="'09da3a84233e4b648f3096f030cbf054'" />
		<s:set name="_$formId_1" value="'175c4afd1c0149a092c2d0bacf445401'" />
		<s:set name="_$type" value="'edit'"/>
	
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="TAM_MENU_NAME" formId="175c4afd1c0149a092c2d0bacf445401" /></td>
			<bu:td cssClass="dec" colNo="TAM_MENU_NAME" formId="175c4afd1c0149a092c2d0bacf445401" ><bu:ui  id="paraMap1_TAM_MENU_NAME1"   colNo="TAM_MENU_NAME" formId="175c4afd1c0149a092c2d0bacf445401" value="%{TAM_MENU_NAME}" formIndex="1" /></bu:td>
		</tr> 
		<!--
		<tr>
			<td class="name-three" /><bu:uitn colNo="TAM_MENU_PHOTO" formId="175c4afd1c0149a092c2d0bacf445401" /></td>
			<bu:td cssClass="dec-self" colNo="TAM_MENU_PHOTO" formId="175c4afd1c0149a092c2d0bacf445401" ><bu:ui colNo="TAM_MENU_PHOTO" formId="175c4afd1c0149a092c2d0bacf445401" value="%{TAM_MENU_PHOTO}" formIndex="1" /></bu:td>
		</tr>
		-->
		<tr>
                		    <td class="name"    style="width:88px;vertical-align: bottom;" /><bu:uitn colNo="TAM_MENU_PHOTO" formId="175c4afd1c0149a092c2d0bacf445401" /></td>	
                			<td class="dec"   rowspan="1"  style="width:150px;vertical-align: bottom;">
                			<div id="photoImgss"  style="margin-bottom:14px;height:60px;" > 
                			<img alt="" id="img3" src="plf/page/fp/img/MoreWis_s.png" align="bottom" style="width:120px;height:60px;float:left;" > 
                			<!--	<span style="font-size:12px;color:#999;float:left;margin-top:46px;margin-left:5px;">支持100KB以内</span> 	-->	
                			</div>
                <!--	<input type="file" accept="image/*" id="paraMap1_CFI_PHOTO" name="upFile" value="" class="isSubmit input">	-->	

                			<input type='button' value='<dict:lang value="导航默认图片" />' id="select_systemss" onclick="choosePic('2','img3','serverfileName3')"> 
                			<input type="hidden" name="serverfileName3" id="serverfileName3" value="" />
                			<input type="file" id="paraMapObj_TAM_MENU_PHOTO" onchange="javascript:_setImagePreview('photoImgss','img3','paraMapObj_TAM_MENU_PHOTO');" style="display:none;" name="upFile" class=" input isSubmit  _VAL_OjbsData">
                			</td>
                		</td>
                		</tr>
		<!--
		<tr>
			<td class="name-three" /><bu:uitn colNo="TAM_MENU_PHOTO2" formId="175c4afd1c0149a092c2d0bacf445401" /></td>
			<bu:td cssClass="dec-self" colNo="TAM_MENU_PHOTO2" formId="175c4afd1c0149a092c2d0bacf445401" ><bu:ui colNo="TAM_MENU_PHOTO2" formId="175c4afd1c0149a092c2d0bacf445401" value="%{TAM_MENU_PHOTO2}" formIndex="1" /></bu:td>
		</tr>
		-->
			<tr>
                		  <td class="name"    style="width:88px;vertical-align: bottom;" /><bu:uitn colNo="TAM_MENU_PHOTO2" formId="175c4afd1c0149a092c2d0bacf445401" /></td>	
                			<td class="dec"   rowspan="1"  style="width:150px;vertical-align: bottom;">
                			<div id="photoImgsss"  style="margin-bottom:14px;height:60px;" > 
                		<img alt="" id="img4" src="plf/page/fp/img/MoreWis_s.png" align="bottom" style="width:120px;height:60px;float:left;" >  
                			<!--	<span style="font-size:12px;color:#999;float:left;margin-top:46px;margin-left:5px;">支持100KB以内</span> 	-->	
                			</div>
                <!--				<input type="file" accept="image/*" id="paraMap1_CFI_PHOTO2" name="upFile2" value="" class="isSubmit input"> -->			

                	<input type='button' value='<dict:lang value="导航选中图片" />' id="select_systemsss" onclick="choosePic('2','img4','serverfileName4')"> 
                			<input type="hidden" name="serverfileName4" id="serverfileName4" value="" />
                			<input type="file" id="paraMapObj_TAM_MENU_PHOTO2" onchange="javascript:_setImagePreview('photoImgsss','img4','paraMapObj_TAM_MENU_PHOTO2');" style="display:none;" name="upFile2" class=" input isSubmit  _VAL_OjbsData">  
                			</td>
                		</td>
                		</tr>
	
	</table>
			<bu:jsVal formId="175c4afd1c0149a092c2d0bacf445401" formIndex="1" />
				
			</div>
		 </form>
	</div>
</div>	
	
 
 <!--查看div-->
    
    
    
     <div id="backItemd" class="dialog-mask" style="z-index:11111;"/></div>
	
		<div class="dialog dialog-s1" id="addItemd" style="display:none;z-index:11112;margin-left:0px;left:calc(50% - 250px);top:calc(50% - 182.5px);top:90px;width:500px;height:365px;" >
		 <div class="dialog-hd">
				 <h3 class="tit"><dict:lang value="查看"/></h3>
			 </div>	
			
				<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addItemd','backItemd');"></a>
		<div class="edit"  style="height:calc(100% - 5px);">
	<form id="showForm" name="showForm" action="" method="post" >
			<div class="dialog-bd-div">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="showForm" />
  					           </jsp:include>
  	<form id="showForm" name="showForm" action="" method="post" >
		<bu:set name="paraMapObj" value="${dataId}" formId="175c4afd1c0149a092c2d0bacf445401" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="175c4afd1c0149a092c2d0bacf445401" />
	<input type="hidden" id="prefixInd" name="175c4afd1c0149a092c2d0bacf445401" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" id="picturePaths" name="picturePath" value="${path}" />
		<s:set name="_$viewId" value="'f6887344231646d0854d4391d5e32e23'" />
		<s:set name="_$formId_1" value="'175c4afd1c0149a092c2d0bacf445401'" />
		<s:set name="_$type" value="'edit'" />
	
		<tr>
			<td class="name" /><bu:uitn colNo="TAM_MENU_NAME" formId="175c4afd1c0149a092c2d0bacf445401" /></td>
			<bu:td cssClass="dec" colNo="TAM_MENU_NAME" formId="175c4afd1c0149a092c2d0bacf445401" ><bu:ui  id="TAM_MENU_NAMES"  colNo="TAM_MENU_NAME" formId="175c4afd1c0149a092c2d0bacf445401" value="%{TAM_MENU_NAME}" formIndex="1" /></bu:td>
		</tr>
		<!--
		<tr>
			<td class="name-three" /><bu:uitn colNo="TAM_MENU_PHOTO" formId="175c4afd1c0149a092c2d0bacf445401" /></td>
			<bu:td cssClass="dec-self" colNo="TAM_MENU_PHOTO" formId="175c4afd1c0149a092c2d0bacf445401" ><bu:ui colNo="TAM_MENU_PHOTO" formId="175c4afd1c0149a092c2d0bacf445401" value="%{TAM_MENU_PHOTO}" formIndex="1" /></bu:td>
		</tr>
		-->
		<tr>
                		    <td class="name"    style="width:64px;vertical-align: bottom;" /><bu:uitn colNo="TAM_MENU_PHOTO" formId="175c4afd1c0149a092c2d0bacf445401" /></td>	
                			<td class="dec"   rowspan="1"  style="width:150px;vertical-align: bottom;">
                			<div id="photoImgssss"  style="margin-bottom:14px;height:60px;" > 
                			<img alt="" id="img5" src="plf/page/fp/img/MoreWis_s.png" align="bottom" style="width:120px;height:60px;float:left;" > 
                			<!--	<span style="font-size:12px;color:#999;float:left;margin-top:46px;margin-left:5px;">支持100KB以内</span> 	-->	
                			</div>
                <!--	<input type="file" accept="image/*" id="paraMap1_CFI_PHOTO" name="upFile" value="" class="isSubmit input">	-->	
                			<input type="file" id="TAM_MENU_PHOTOS1" name="upFile" class=" input isSubmit  _VAL_OjbsData">
                			</td>
                		</td>
                		</tr>
		<!--
		<tr>
			<td class="name-three" /><bu:uitn colNo="TAM_MENU_PHOTO2" formId="175c4afd1c0149a092c2d0bacf445401" /></td>
			<bu:td cssClass="dec-self" colNo="TAM_MENU_PHOTO2" formId="175c4afd1c0149a092c2d0bacf445401" ><bu:ui colNo="TAM_MENU_PHOTO2" formId="175c4afd1c0149a092c2d0bacf445401" value="%{TAM_MENU_PHOTO2}" formIndex="1" /></bu:td>
		</tr>
		-->
			<tr>
                		  <td class="name"    style="width:64px;vertical-align: bottom;" /><bu:uitn colNo="TAM_MENU_PHOTO2" formId="175c4afd1c0149a092c2d0bacf445401" /></td>	
                			<td class="dec"   rowspan="1"  style="width:150px;vertical-align: bottom;">
                			<div id="photoImgsssss"  style="margin-bottom:14px;height:60px;" > 
                		<img alt="" id="img6" src="plf/page/fp/img/MoreWis_s.png" align="bottom" style="width:120px;height:60px;float:left;" >  
                			<!--	<span style="font-size:12px;color:#999;float:left;margin-top:46px;margin-left:5px;">支持100KB以内</span> 	-->	
                			</div>
                <!--				<input type="file" accept="image/*" id="paraMap1_CFI_PHOTO2" name="upFile2" value="" class="isSubmit input"> -->			

                
                			<input type="file" id="TAM_MENU_PHOTOS2"  name="upFile2" class=" input isSubmit  _VAL_OjbsData">  
                			</td>
                		</td>
                		</tr>
	
	</table>
			<bu:jsVal formId="175c4afd1c0149a092c2d0bacf445401" formIndex="1" />
				
			</div>
		 </form>
	</div>
	
    
    

    
		<bu:submit viewId="20c8a02f7b1c47b6bc0ddf9021dfac20" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="20c8a02f7b1c47b6bc0ddf9021dfac20" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
    
<script>
function init(){
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    initTableWidth();      
                  getInfoList();
                    //listAjaxTable_print($("#formId1").val());
                    
                 }
function query(){
    getInfoList();
}
function reloadPgAx(msg,title,width,height,time,isCloseWin){
        
		msgPop(msg,reloadPgExeAx,title,width,height,time,isCloseWin);
	}
					
	function reloadPgExeAx(isCloseWin){
	
	    query("formId1");
		util.showTopLoading();
		if(isCloseWin == "0"){
			top.$(".dialog-close").click();
		}
	} 

 function ajaxDel(){
        
      if(checkNewIsSelected()){
    	utilsFp.confirmIcon(1,"","delConfirm","", "是否确认删除？","1","260","");
      }else{
    	return false;
      }
    }
    
    
    function delConfirm(){
    var delId = '';
    $('input[name="isSelect"]:checked').each(function(i){
        if(i==0){
            delId = $(this).val();
        }else{
            delId = delId + "," +$(this).val();
        } 
    });
      $.ajax({
		        type:"post",
		        dataType:"json",
		        data:{
		            "delId":delId,
		            "iframeId":_currentFrameId
		        },
		        url:"${path}buss/bussModel_exeFunc.ms?funcMId=9fd080e07b614e2f8cf075d7b1c7b861",
		        success: function(data){
		            if(data.ajaxMap.code=="success"){
		                query("formId1");
		            }else{
		            utilsFp.confirmIcon(3,"","","", "error:"+data.ajaxMap.msg,0,"300","");
		            }
		        },
		        error:function(msg){
		            
		        }
		        })
    }
    
function reloadPg(msg,title,width,height,time,isCloseWin){
    
	msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
}
function reloadPgExe(isCloseWin){
    
    /* document.forms.search_form.submit();
 	util.showTopLoading(); */
 	query("formId1");
 	if ("0" == isCloseWin) {
   	top.$(".dialog-close").click();
    }
   // checkboxAll("joblist");
}


function getInfoList(paginationImpl){ 
    	var currentPage = paginationImpl==undefined? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  paginationImpl==undefined? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
    	var menuName = $("#TAM_MENU_NAME").val();
    	var itemId = $("#itemId").val();
    	util.showLoading("处理中...");
    	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: "buss/bussModel_exeFunc.ms?funcMId=5930194c21d040c78400a6df550c08d8",
			    data:{
                        "page.currentPage":currentPage,
                        "page.pageRecord": pageRecord,
                        "menuCode":menuName
                    },
				success: function(data){
						util.closeLoading();
						$("#tbody_175c4afd1c0149a092c2d0bacf445401").empty();
						if(null != data.ajaxPage.dataList){
							var list = eval(data.ajaxPage.dataList);
							for(var i = 0;i < list.length; i++){
							    if(list[i].MENU_NAME==null)  list[i].MENU_NAME="";
								if(list[i].TAM_PHOTO_PATH==null)  list[i].TAM_PHOTO_PATH="";
								if(list[i].TAM_PHOTO_PATH2==null)  list[i].TAM_PHOTO_PATH2="";
								$("#datagrid-btable-ajax175c4afd1c0149a092c2d0bacf445401 tbody").append("<tr class='datagrid-row' id='"+list[i].ID+"'  style='cursor: pointer;'></tr>");
                        $("#tbody_175c4afd1c0149a092c2d0bacf445401 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
						$("#tbody_175c4afd1c0149a092c2d0bacf445401 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' class='_selectdata' value='"+list[i].ID+"' name='isSelect'/></td>");
						$("#tbody_175c4afd1c0149a092c2d0bacf445401 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='text-align: center;width:200px;' >"+list[i].MENU_NAME+"</td>");
						$("#tbody_175c4afd1c0149a092c2d0bacf445401 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='text-align: left;width:140px;' >"+list[i].TAM_PHOTO_PATH+"</td>");
                        $("#tbody_175c4afd1c0149a092c2d0bacf445401 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='text-align: left;width:110px;' >"+list[i].TAM_PHOTO_PATH2+"</td>");
							    
							}
						}
						pageFun(data.ajaxPage,"175c4afd1c0149a092c2d0bacf445401");
						var tableTrJs = $("#datagrid-btable-ajax175c4afd1c0149a092c2d0bacf445401 tbody tr");
						clickTr('175c4afd1c0149a092c2d0bacf445401');
						_tongLineColor(tableTrJs);
						defTableWidthRewrite("175c4afd1c0149a092c2d0bacf445401");
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}

function clickTr(formId){
		    var tableId = "tbody_"+formId;
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
				$("#"+trId).css("background-color","#a0c8e5");
			}
		});
		
		  $("#"+tableId+" tr input[type=checkbox]").click(function(e) {
			  e.stopPropagation();
			  var style = $(this).parents("tr").attr("style");
			  if(style && style.indexOf("background-color") > -1){
				  $(this).parents("tr").css("background-color","");
			  }else{
				  $(this).parents("tr").css("background-color","#a0c8e5");
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
    if(formId=='175c4afd1c0149a092c2d0bacf445401'){<%--APP导航图片--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
           arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
         //    arrHtml.push("<td colno='DATA_AUTH' style='width:200px;text-align:center;' name='noprintset_DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
         // arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
         //   arrHtml.push("</td>");
            
         //   arrHtml.push("<td colno='TAM_MENU_ID' name='noprintset_TAM_MENU_ID' class='datagrid-cell "+ms.tdClass(formId, 'TAM_MENU_ID')+"' style='"+ms.tdStyle(formId, 'TAM_MENU_ID')+"' "+ms.tdEvent(formId, 'TAM_MENU_ID')+">")
         //   arrHtml.push("<span colno='TAM_MENU_ID' class='"+ms.uiClass(formId, 'TAM_MENU_ID')+"' style='"+ms.uiStyle(formId, 'TAM_MENU_ID')+"' "+ms.uiEvent(formId, 'TAM_MENU_ID')+" title='"+ms.titleAttr(formId,'TAM_MENU_ID','IS_TITLE_ATTR',v)+"' >"+v['TAM_MENU_ID']+"</span>")
         //   arrHtml.push("</td>");
            arrHtml.push("<td colno='TAM_MENU_NAME'  style='width:200px;text-align:center;' name='noprintset_TAM_MENU_NAME' class='datagrid-cell "+ms.tdClass(formId, 'TAM_MENU_NAME')+"' style='"+ms.tdStyle(formId, 'TAM_MENU_NAME')+"' "+ms.tdEvent(formId, 'TAM_MENU_NAME')+">")
            arrHtml.push("<span colno='TAM_MENU_NAME' class='"+ms.uiClass(formId, 'TAM_MENU_NAME')+"' style='"+ms.uiStyle(formId, 'TAM_MENU_NAME')+"' "+ms.uiEvent(formId, 'TAM_MENU_NAME')+" title='"+ms.titleAttr(formId,'TAM_MENU_NAME','IS_TITLE_ATTR',v)+"' >"+v['TAM_MENU_NAME']+"</span>")
            arrHtml.push("</td>");
         //   arrHtml.push("<td colno='TAM_SEQ' name='noprintset_TAM_SEQ' class='datagrid-cell "+ms.tdClass(formId, 'TAM_SEQ')+"' style='"+ms.tdStyle(formId, 'TAM_SEQ')+"' "+ms.tdEvent(formId, 'TAM_SEQ')+">")
         //   arrHtml.push("<span colno='TAM_SEQ' class='"+ms.uiClass(formId, 'TAM_SEQ')+"' style='"+ms.uiStyle(formId, 'TAM_SEQ')+"' "+ms.uiEvent(formId, 'TAM_SEQ')+" title='"+ms.titleAttr(formId,'TAM_SEQ','IS_TITLE_ATTR',v)+"' >"+v['TAM_SEQ']+"</span>")
         //   arrHtml.push("</td>");
         //   arrHtml.push("<td colno='TAM_MENU_PHOTO' name='noprintset_TAM_MENU_PHOTO' class='datagrid-cell ' disabled='disabled' "+ms.tdClass(formId, 'TAM_MENU_PHOTO')+"' style='"+ms.tdStyle(formId, 'TAM_MENU_PHOTO')+"' "+ms.tdEvent(formId, 'TAM_MENU_PHOTO')+">")
         //   arrHtml.push("<span colno='TAM_MENU_PHOTO' class='"+ms.uiClass(formId, 'TAM_MENU_PHOTO')+"' style='"+ms.uiStyle(formId, 'TAM_MENU_PHOTO')+"' "+ms.uiEvent(formId, 'TAM_MENU_PHOTO')+" title='"+ms.titleAttr(formId,'TAM_MENU_PHOTO','IS_TITLE_ATTR',v)+"' >"+v['TAM_MENU_PHOTO']+"</span>")
         //   arrHtml.push("</td>");
            arrHtml.push("<td colno='TAM_PHOTO_PATH' name='noprintset_TAM_PHOTO_PATH' class='datagrid-cell "+ms.tdClass(formId, 'TAM_PHOTO_PATH')+"' style='"+ms.tdStyle(formId, 'TAM_PHOTO_PATH')+"' "+ms.tdEvent(formId, 'TAM_PHOTO_PATH')+">")
            arrHtml.push("<span colno='TAM_PHOTO_PATH' class='"+ms.uiClass(formId, 'TAM_PHOTO_PATH')+"' style='"+ms.uiStyle(formId, 'TAM_PHOTO_PATH')+"' "+ms.uiEvent(formId, 'TAM_PHOTO_PATH')+" title='"+ms.titleAttr(formId,'TAM_PHOTO_PATH','IS_TITLE_ATTR',v)+"' >"+v['TAM_PHOTO_PATH']+"</span>")
            arrHtml.push("</td>");
         //   arrHtml.push("<td colno='TAM_MENU_PHOTO2' name='noprintset_TAM_MENU_PHOTO2' class='datagrid-cell "+ms.tdClass(formId, 'TAM_MENU_PHOTO2')+"' style='"+ms.tdStyle(formId, 'TAM_MENU_PHOTO2')+"' "+ms.tdEvent(formId, 'TAM_MENU_PHOTO2')+">")
         //   arrHtml.push("<span colno='TAM_MENU_PHOTO2' class='"+ms.uiClass(formId, 'TAM_MENU_PHOTO2')+"' style='"+ms.uiStyle(formId, 'TAM_MENU_PHOTO2')+"'  "+ms.uiEvent(formId, 'TAM_MENU_PHOTO2')+" title='"+ms.titleAttr(formId,'TAM_MENU_PHOTO2','IS_TITLE_ATTR',v)+"' >"+v['TAM_MENU_PHOTO2']+"</span>")
            //  arrHtml.push("<span +v['TAM_MENU_PHOTO2']+"</span>")
         //   arrHtml.push("</td>");
            arrHtml.push("<td colno='TAM_PHOTO_PATH2' name='noprintset_TAM_PHOTO_PATH2' class='datagrid-cell "+ms.tdClass(formId, 'TAM_PHOTO_PATH2')+"' style='"+ms.tdStyle(formId, 'TAM_PHOTO_PATH2')+"' "+ms.tdEvent(formId, 'TAM_PHOTO_PATH2')+">")
            arrHtml.push("<span colno='TAM_PHOTO_PATH2' class='"+ms.uiClass(formId, 'TAM_PHOTO_PATH2')+"' style='"+ms.uiStyle(formId, 'TAM_PHOTO_PATH2')+"' "+ms.uiEvent(formId, 'TAM_PHOTO_PATH2')+" title='"+ms.titleAttr(formId,'TAM_PHOTO_PATH2','IS_TITLE_ATTR',v)+"' >"+v['TAM_PHOTO_PATH2']+"</span>")
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
//选择导航菜单图片

function addAjax(){
		addInfo('addItem','backItem');
	}
	function addInfo(showId,backId){
			 $("#"+showId+",#"+backId).show();
			$("#"+showId).draggable();
	        		
            $("#paraMap1_TAM_MENU_NAME_chosen").attr('style','width:373px;')
		
		}
	
function ajaxEdit(){
        var selCount = getNewSelectedCount();
        if(selCount==1){
          var formId = $("#formId1").val();
         var  dataId=_selectedEditTr.attr("id");
          addInfos('addItems','backItems',dataId);
    
        }else{
          return false;
  	    }
    }
    
function closeCurrentWindow()
	{
		closeTopPopWinFp(window.frameElement.id + "pop");
//	msgPop("新增成功","","摩尔提示",200,150,3000);
	}
	$(function(){
	    //$("#paraMap1_PTD_LEVEL").val(packLevel);
	    var iframeId=_currentFrame;
	  //  alert(window.frameElement.name);
	 //   parentWindow = $("#"+iframeId)[0].contentWindow;
	  //  setDataAuth();
	})
//组织机构赋值
function setDataAuth(){
    		    $.ajax({
		        type:"post",
		        dataType:"json",
		        data:"",
		        url:"${path}buss/bussModel_exeFunc.ms?funcMId=d97c83831dd8478cbee767d56bc067e1",
		        success: function(data){
		            var list = data.ajaxList;
		            $("#addfuncauth").empty();
		            $("#addfuncauth").append("<option value='"+list[0].ID+"'>"+list[0].NAME+"</option>");
		            $("#addfuncauth").trigger("chosen:updated");
		            $("#editfuncauth").empty();
		            $("#editfuncauth").append("<option value='"+list[0].ID+"'>"+list[0].NAME+"</option>");
		            $("#editfuncauth").trigger("chosen:updated");		            
		        },
		        error:function(msg){
		            
		        }
		        })
}
//关闭新增弹窗	
		function hideDiv(showId,backId){
			
			    $("#savelose").removeClass('save-not-close');
				$("#savelose").attr("title","?关闭保存并关闭窗口");
				saveAndClose = true;
				$('#isCloseWin').attr('checked',true);
				$('#isCloseWin').val("0");
                saveose="0";
			    	
               	$("#paraMap1_TAM_MENU_NAME").val("");
    			$("#paraMap1_TAM_MENU_NAME").trigger("chosen:updated");
                $("#img0").attr("src", "plf/page/fp/img/MoreWis_s.png") ;
                $("#img1").attr("src", "plf/page/fp/img/MoreWis_s.png") ;
                $("#paraMap1_TAM_MENU_PHOTO").val("");
                $("#paraMap1_TAM_MENU_PHOTO2").val("");
                				
			    $("#paraMap1_TAM_MENU_NAME1").val("");
    			$("#paraMap1_TAM_MENU_NAME1").trigger("chosen:updated");
                $("#img3").attr("src", "plf/page/fp/img/MoreWis_s.png") ;
                $("#img4").attr("src", "plf/page/fp/img/MoreWis_s.png") ;
                $("#paraMapObj_TAM_MENU_PHOTO").val("");
                $("#paraMapObj_TAM_MENU_PHOTO2").val("");
                $("#serverfileName1").val("");
                $("#serverfileName2").val("");
                $("#serverfileName3").val("");
                $("#serverfileName4").val("");
                //parentWindow.query("formId1");
                
			$("#"+showId+",#"+backId).hide();
			closeDivFp(showId+"pop");
		}
		function hideDiv1(showId,backId){
			$("#"+showId+",#"+backId).hide();
			$('#isCloseWin').attr('checked',true);
			$('#isCloseWin').val("0");
				saveose="0"; 
		
			closeDivFp(showId+"pop");
		}

		var saveTestInfoUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=96406c6e1033472a811446332763cacb";
		function adds(){

    
            isQuery = false;
	       
	        		var formData = new FormData(document.getElementById("addForm"));
	        	console.log(formData);
	        	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: saveTestInfoUrl,
			    data: formData,
			    //cache: false,
			    processData:false,
                contentType:false,
			    success: function(data){
			                if(null == data){return;}
						    if(null != data){
						    
    							if(data.ajaxMap.returnMsg=="addSucc"){	
                                    
    								msgPop(data.ajaxMap.alertMsg,"",data.ajaxMap.title.ajaxMap,data.ajaxMap.width.ajaxMap,data.height,data.ajaxMap.time,"");
                                        $("#paraMap1_TAM_MENU_NAME").val("");
    								    $("#paraMap1_TAM_MENU_NAME").trigger("chosen:updated");
                                        $("#img0").attr("src", "plf/page/fp/img/MoreWis_s.png") ;
                                        $("#img1").attr("src", "plf/page/fp/img/MoreWis_s.png") ;
                                        $("#paraMap1_TAM_MENU_PHOTO").val("");
                                        $("#paraMap1_TAM_MENU_PHOTO2").val("");
    								if(saveose=="0"){
    								     hideDiv('addItem','backItem');
    								}
    								   // parentWindow.getPage();
    									query("formId1");
    							}
    							if(data.ajaxMap.returnMsg=="addError"){
    								utilsFp.confirmIcon(3,"","","", "<dict:lang value="操作失败" />",0,"260","");
    								return;
    							}
    							if(data.ajaxMap.returnMsg=="tamMenuName"){
    								utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择导航菜单" />",0,"260","");
    								return;
    							}
    								if(data.ajaxMap.returnMsg=="tamMenuNames"){
    								utilsFp.confirmIcon(3,"","","", "<dict:lang value="当前导航菜单下导航图片已存在" />",0,"260","");
    								return;
    							}
    							
						    }
                                
					},
			    error: function(msg){
						
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
			});
	       // }
	        
	        
			
            }
            
            /*
		   function adds(){
	 
	    	    	
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
            	
	    	
	    	    
	    	
   if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
	$("#addForm").append($("#isCloseWin").clone());
	$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
   }
   //alert($("#serverfileName").val());
   document.forms.addForm.action="${path}buss/bussModel_exeFunc.ms?funcMId=96406c6e1033472a811446332763cacb";
   
   //console.log($("#addForm").serialize()); 
   document.forms.addForm.submit();
   
	    	}
	    	*/
	    	
   
</script>





<script type="text/javascript">
    //图片回调
	$("#paraMap1_TAM_PHOTO_PATH").live('change',function(e){
	var $file = $(this);
        var fileObj = $file[0];
        if(fileObj && fileObj.files && fileObj.files[0]){
	  var objUrl = getObjectURL(this.files[0]) ;
	  if (objUrl) {
		$("#img0").attr("src", objUrl) ;
	   }
}
else{
//IE下，使用滤镜

                fileObj.select();
                var hhotoObj = document.getElementById("paraMap1_TAM_PHOTO_PATH");
                
		var imgObjPreview = document.getElementById("img0");
	
			hhotoObj.select();
			
			var imgSrc = document.selection.createRange().text;
			var imgId = document.getElementById("photoImg");
			imgId.style.width = '100px';
			imgId.style.height = '100px';
			try {
				imgId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
				imgId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
			} catch (e) {
				//utilsFp.alert("<dict:lang value='您上传的图片格式不正确' />");
				utilsFp.confirmIcon(3,"","","", "<dict:lang value="您上传的图片格式不正确" />",0,"","");
				return false;
			}
			imgObjPreview.style.display = 'none';
			document.selection.empty(); 
}
}) ;


$("#paraMap1_TAM_PHOTO_PATH2").live('change',function(e){
	var $file = $(this);
        var fileObj = $file[0];
        if(fileObj && fileObj.files && fileObj.files[0]){
	  var objUrl = getObjectURL(this.files[0]) ;
	  if (objUrl) {
		$("#img1").attr("src", objUrl) ;
	   }
}
else{
//IE下，使用滤镜

                fileObj.select();
                var hhotoObj = document.getElementById("paraMapObj_TAM_PHOTO_PATH2");
		var imgObjPreview = document.getElementById("img1");
			hhotoObj.select();
			var imgSrc = document.selection.createRange().text;
			var imgId = document.getElementById("photoImgs");
			imgId.style.width = '100px';
			imgId.style.height = '100px';
			try {
				imgId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
				imgId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
			} catch (e) {
				//utilsFp.alert("<dict:lang value='您上传的图片格式不正确' />");
				utilsFp.confirmIcon(3,"","","", "<dict:lang value="您上传的图片格式不正确" />",0,"","");
				return false;
			}
			imgObjPreview.style.display = 'none';
			document.selection.empty(); 
}
}) ;


function getObjectURL(file) {
	var url = null ; 
	if (window.createObjectURL!=undefined) { // basic
		url = window.createObjectURL(file) ;
	} else if (window.URL!=undefined) { // mozilla(firefox)
		url = window.URL.createObjectURL(file) ;
	} else if (window.webkitURL!=undefined) { // webkit or chrome
		url = window.webkitURL.createObjectURL(file) ;
	}
	return url ;
}


 var saveAndClose = true;
	    var	 saveose="0"; 
		function saveClose(self){
		 
			if(saveAndClose == true){
			   
				$(self).addClass('save-not-close');
				$(self).attr("title","?开启保存并关闭窗口");
				saveAndClose = false;
				$('#isCloseWin').attr('checked',false);
			    $('#isCloseWin').val("1");
			    
			    saveose="1"; 
			 
			}
			else if(saveAndClose == false){
			   
				$(self).removeClass('save-not-close');
				$(self).attr("title","?关闭保存并关闭窗口");
				saveAndClose = true;
				$('#isCloseWin').attr('checked',true);
				$('#isCloseWin').val("0");
			
                saveose="0";
              
			}
		}


</script>

<script>

    function addInfos(showId,backId,dataId){
			 $("#"+showId+",#"+backId).show();
			$("#"+showId).draggable();
			 dataId=_selectedEditTr.attr("id");
			$("#paraMap1_TAM_MENU_NAME1_chosen").attr('style','width:373px;');
			
			
			getInfo();
		}


    	function getInfo(){
		    var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=ed3d7fdcb7314e099c9651c53a340cc5";
		     dataId=_selectedEditTr.attr("id");
		    
		    $.ajax({
		        type:"post",
		        dataType:"json",
		        data:"dataId="+dataId,
		        url:loadItemUrl,
		        success: function(data){
		            if(null == data){return;}
		            
		            if(null!=data.ajaxMap){
		                var map=eval(data.ajaxMap);
		                console.log(map);
		                	if(map.TAM_MENU_NAME==null) map.TAM_MENU_NAME=="";
		                //	alert(map.TAM_MENU_NAME);
		                $("#paraMap1_TAM_MENU_NAME1").val(map.TAM_MENU_NAME);
		               // $("#paraMap1_TAM_MENU_NAME1").val(map.CFI_FUNC_MODEL);
		                 $("#paraMap1_TAM_MENU_NAME1").trigger("chosen:updated");
		                 $("#selId").val(map.DATAID);
		                if(map.TAM_PHOTO_PATH!=null){
		                	document.getElementById("img3").src =$("#picturePath").val()+"up_load/comm/"+map.TAM_PHOTO_PATH;
		                //	$("#serverfileName3").val(map.TAM_PHOTO_PATH);
                    	 $("#pPath").val(map.TAM_MENU_NAME);
                    	}else{
                    	   	document.getElementById("img3").src="plf/page/fp/img/MoreWis_s.png"; 
                    	 
                   	}
                    	if(map.TAM_PHOTO_PATH2!=null){
                    		document.getElementById("img4").src=$("#picturePath2").val()+"up_load/comm/"+map.TAM_PHOTO_PATH2;
                    	//	$("#serverfileName4").val(map.TAM_PHOTO_PATH2);
                    	 $("#pPaths").val(map.TAM_MENU_NAME);
                    	}else{
                    	   	document.getElementById("img4").src="plf/page/fp/img/MoreWis_s.png"; 
                    	}
		            }
		        },
		        error:function(msg){
		            utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
		        }
		        
		    })
		    
		}
		
		
		
				//var editInfoUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=04d081dd87c74b7b88dd1fdefbc99872"+dataId;;
		function edits(){
            
            isQuery = false;
            	var formData = new FormData(document.getElementById("editForm"));
	        	var dataIds =_selectedEditTr.attr("id");
	        	
	        	
	        	var dataId = $("#selId").val();
	        	//var dataId = $("#selId").val();
	        	console.log(dataId);
	        	var editInfoUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=04d081dd87c74b7b88dd1fdefbc99872&dataId="+dataIds;
		
            var formData = new FormData(document.getElementById("editForm"));
	        	console.log(formData);
	        	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: editInfoUrl,
			    data: formData,
			    //cache: false,
			    processData:false,
                contentType:false,
			    success: function(data){
			                if(null == data){return;}
						    if(null != data){
						    
    							if(data.ajaxMap.returnMsg=="addSucc"){	
                                  	msgPop(data.ajaxMap.alertMsg,"",data.ajaxMap.title.ajaxMap,data.ajaxMap.width.ajaxMap,data.height,data.ajaxMap.time,""); 
    							 //parentWindow.getPage();
    							     hideDiv('addItems','backItems');
    							     	query("formId1");
    							}
    							if(data.ajaxMap.returnMsg=="addError"){
    								utilsFp.confirmIcon(3,"","","", "<dict:lang value="操作失败" />",0,"260","");
    								return;
    							}
    							if(data.ajaxMap.returnMsg=="tamMenuName"){
    								utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择导航菜单" />",0,"260","");
    								return;
    							}
    								if(data.ajaxMap.returnMsg=="tamMenuNames"){
    								utilsFp.confirmIcon(3,"","","", "<dict:lang value="当前导航菜单下导航图片已存在" />",0,"260","");
    								return;
    							}
						    }
                                
					},
			    error: function(msg){
						
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
			});
	       // }
	        
	        
			
            }
            /*
		   function edits(){
	 
	    	    	
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
	    	
	    	    
	    	
   if($("#isCloseWin") && $("#editForm").find("#isCloseWin").length == 0){
	$("#editForm").append($("#isCloseWin").clone());
	$("#editForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
   }
   var dataIds =_selectedEditTr.attr("id");
   //alert($("#serverfileName").val());
   document.forms.editForm.action="${path}buss/bussModel_exeFunc.ms?funcMId=04d081dd87c74b7b88dd1fdefbc99872&dataId="+dataIds;
   
   //console.log($("#addForm").serialize()); 
   document.forms.editForm.submit();
   
	    	}
	    	*/



</script>


<script>
var parentWindow;
		$(function(){
			if(top.$("#"+window.frameElement.name) != null && top.$("#"+window.frameElement.name).length > 0 && 
					top.$("#"+window.frameElement.name)[0].contentWindow != undefined){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
			    
			}
			
			//setPopScroll('.bd');
			
		});




function showDetail(){
    var selCount = getNewSelectedCount();
    if(selCount==1){
      var formId = $("#formId1").val();
      var dataId = _selectedEditTr.attr("id");
       addInfod('addItemd','backItemd',dataId);
  }else{
      return false;
  }
};
function dblClickShowDetail(thisObj){
      var dataId = thisObj.attr("id");
      var formId = $("#formId1").val();
      addInfod('addItemd','backItemd',dataId);
}

function addInfod(showId,backId,dataId){
			 $("#"+showId+",#"+backId).show();
			$("#"+showId).draggable();
			$("#TAM_MENU_NAMES_chosen").attr('style','width:373px;');
		  $("#TAM_MENU_NAMES").attr("disabled","disabled");
        $("#TAM_MENU_NAMES").attr("class","isSubmit input readonly _VAL_DATABASE dept_select");
      	$("#TAM_MENU_NAMES_chosen").attr('disabled','disabled');
       
       
         $("#photoImgssss").attr("disabled","disabled");
        $("#TAM_MENU_PHOTOS1").attr("disabled","disabled");
        $("#photoImgsssss").attr("disabled","disabled");
        $("#TAM_MENU_PHOTOS2").attr("disabled","disabled");
         $("#TAM_MENU_NAMES").trigger("chosen:updated");
         
			getInfod(dataId);
		}
function getInfod(dataId){
		    var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=ed3d7fdcb7314e099c9651c53a340cc5";
		   
		    
		     $.ajax({
		        type:"post",
		        dataType:"json",
		        data:"dataId="+dataId,
		        url:loadItemUrl,
		        success: function(data){
		            if(null == data){return;}
		            
		            if(null!=data.ajaxMap){
		                var map=eval(data.ajaxMap);
		                console.log(map);
		                	if(map.TAM_MENU_NAME==null) map.TAM_MENU_NAME=="";
		                	//alert(map.TAM_MENU_NAME);
		                $("#TAM_MENU_NAMES").val(map.TAM_MENU_NAME);
		               // $("#paraMap1_TAM_MENU_NAME1").val(map.CFI_FUNC_MODEL);
		                 $("#TAM_MENU_NAMES").trigger("chosen:updated");
		                 $("#selId").val(map.DATAID);
		                if(map.TAM_PHOTO_PATH!=null){
		                	document.getElementById("img5").src =$("#picturePaths").val()+"up_load/comm/"+map.TAM_PHOTO_PATH;
		                //	$("#serverfileName3").val(map.TAM_PHOTO_PATH);
                    	// $("#pPath").val(map.TAM_MENU_NAME);
                    	}else{
                    	   	document.getElementById("img5").src="plf/page/fp/img/MoreWis_s.png"; 
                    	 
                   	}
                    	if(map.TAM_PHOTO_PATH2!=null){
                    		document.getElementById("img6").src=$("#picturePaths").val()+"up_load/comm/"+map.TAM_PHOTO_PATH2;
                    	//	$("#serverfileName4").val(map.TAM_PHOTO_PATH2);
                    	// $("#pPath").val(map.TAM_MENU_NAME);
                    	}else{
                    	   	document.getElementById("img6").src="plf/page/fp/img/MoreWis_s.png"; 
                    	}
		            }
		        },
		        error:function(msg){
		            utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
		        }
		        
		    })
		    
		}
		
		 function choosePic(types,a,b) {
				
				var piframeId = window.frameElement.id;
				var type=types;
				var url = "${path}buss/bussModel.ms?exeid=092b086f9047468f88727645640197cc&piframeId="+piframeId+"&type="+type+"&a="+a+"&b="+b;						

				showPopWinFp(url, 552, 350, "", "<dict:lang value="选择导航菜单图片"/>",
						"choosePic", "");
	}
	 $('#select_system').click(function(){
        $("#serverfileName1").val();
	    $('#paraMap1_TAM_PHOTO_PATH').click();
    })   
    $('#select_systems').click(function(){
        $("#serverfileName2").val("");
	    $('#paraMap1_TAM_PHOTO_PATH2').click();
    })   
     $('#select_systemss').click(function(){
        $("#serverfileName3").val();
	    $('#paraMapObj_TAM_PHOTO_PATH1').click();
    })   
    $('#select_systemsss').click(function(){
        $("#serverfileName4").val("");
	    $('#paraMapObj_TAM_PHOTO_PATH2').click();
    })   
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
