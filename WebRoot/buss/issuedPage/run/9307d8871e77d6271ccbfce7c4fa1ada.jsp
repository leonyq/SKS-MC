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
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <title>
		<dict:lang value="系统功能" />
    </title>
   
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" />
        <jsp:param name="scroll" value="1" />
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="6cb6d4e03c0b41b1b14a5657b33604c9"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
    <!-- head里面 -->
    <!-- 产品静态资源 -->
    <style>
    .deptcss {
    text-align: left!important;

}

    #paraMap1_CFI_FUNC_MODEL {
    width:300px!important;    
    }
    </style>


</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="950f89f0886d4a909aa123e351c3a1af" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="950f89f0886d4a909aa123e351c3a1af" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage6cb6d4e03c0b41b1b14a5657b33604c9" id="formPage6cb6d4e03c0b41b1b14a5657b33604c9" value="${formPage6cb6d4e03c0b41b1b14a5657b33604c9}"/>
		<input type="hidden" name="formId" id="formId1" value='6cb6d4e03c0b41b1b14a5657b33604c9'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="6cb6d4e03c0b41b1b14a5657b33604c9">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax6cb6d4e03c0b41b1b14a5657b33604c9" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner6cb6d4e03c0b41b1b14a5657b33604c9">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable6cb6d4e03c0b41b1b14a5657b33604c9">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="6cb6d4e03c0b41b1b14a5657b33604c9" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_6cb6d4e03c0b41b1b14a5657b33604c9" onclick="_selectAjaxTableAllData(this,'6cb6d4e03c0b41b1b14a5657b33604c9')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px; text-align:center;"><bu:uitn colNo="DATA_AUTH" formId="6cb6d4e03c0b41b1b14a5657b33604c9" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="CFI_FUNC_MODEL" formId="6cb6d4e03c0b41b1b14a5657b33604c9" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="CFI_FUNC_SN" formId="6cb6d4e03c0b41b1b14a5657b33604c9" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="CFI_FUNC_NAME" formId="6cb6d4e03c0b41b1b14a5657b33604c9" /></td>
			<td class="datagrid-cell" style="width:200px; text-align:center;"><bu:uitn colNo="CFI_FUNC_MEMO" formId="6cb6d4e03c0b41b1b14a5657b33604c9" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv6cb6d4e03c0b41b1b14a5657b33604c9" onscroll="ajaxTableScroll(this,'6cb6d4e03c0b41b1b14a5657b33604c9')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax6cb6d4e03c0b41b1b14a5657b33604c9">
		<tbody id="tbody_6cb6d4e03c0b41b1b14a5657b33604c9" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage6cb6d4e03c0b41b1b14a5657b33604c9==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=6cb6d4e03c0b41b1b14a5657b33604c9&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
    <!-- 新增div -->
    <div id="backItem" class="dialog-mask" style="z-index:11111;"/></div>
    <div class="dialog dialog-s1" id="addItem" style="display:none;z-index:11112;margin-left:0px;left:calc(50% - 250px);top:calc(50% - 182.5px);width:520px;height:365px;" >
		<div class="dialog-hd">
			<h3 class="tit"><dict:lang value="新增"/></h3>
		</div>	
		<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addItem','backItem');"></a>
		<div class="optn optn_div hd" style="height: 40px;box-sizing: border-box;margin-bottom: 0;">	
            <div style="margin-left:10px;">
               
                  <div class="save-close" id="savelose"  onclick="saveClose(this)"></div>	
                <input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
                  <div style="float:left" class="deptcss"><span class="dot">*</span><dict:lang value="组织机构"/> 
                  <select disabled class="dept_select IS_SELECT_FILTER" id="addfuncauth" ><option>--请选择--</option></select>
                  </div>	

                   	
          
                </div>
			<button type="button" onclick="addCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
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
    		        <bu:set name="paraMapObj" value="${dataId}" formId="6cb6d4e03c0b41b1b14a5657b33604c9" type="add" />
                	<table class="basic-table" >
                    	<input type="hidden" name="formIds" value="6cb6d4e03c0b41b1b14a5657b33604c9" />
                    	<input type="hidden" id="prefixInd" name="6cb6d4e03c0b41b1b14a5657b33604c9" value="paraMap1@" />
                    	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
                    	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
                    	<s:set name="_$viewId" value="'050e0c82cc1241059045e238b73676b4'" />
        		        <s:set name="_$formId_1" value="'6cb6d4e03c0b41b1b14a5657b33604c9'" />
        		      	<s:set name="_$type" value="'add'" />
                		<tr>
                			<td class="name" style="width:80px;"   /><span class="dot">*</span>功能模块</td>
                			<td class="dec"  style="width:300px;" colNo="CFI_FUNC_MODEL" formId="6cb6d4e03c0b41b1b14a5657b33604c9" ><bu:ui  colNo="CFI_FUNC_MODEL" formId="6cb6d4e03c0b41b1b14a5657b33604c9" style="width:300px;"  value="%{CFI_FUNC_MODEL}" formIndex="1" /></td>
                		</tr>
                		<tr>
                			<td class="name" style="width:80px;"/><span class="dot">*</span><bu:uitn colNo="CFI_FUNC_SN" formId="6cb6d4e03c0b41b1b14a5657b33604c9" /></td>
                			<td class="dec"  style="width:300px;" colNo="CFI_FUNC_SN" formId="6cb6d4e03c0b41b1b14a5657b33604c9" ><bu:ui  colNo="CFI_FUNC_SN" formId="6cb6d4e03c0b41b1b14a5657b33604c9" value="%{CFI_FUNC_SN}" style="" formIndex="1" /></td>
                		</tr>
                		<tr>
                			<td class="name" style="width:80px;"/><span class="dot">*</span><bu:uitn colNo="CFI_FUNC_NAME" formId="6cb6d4e03c0b41b1b14a5657b33604c9" /></td>
                			<td class="dec"  style="width:300px;" colNo="CFI_FUNC_NAME" formId="6cb6d4e03c0b41b1b14a5657b33604c9" ><bu:ui  colNo="CFI_FUNC_NAME" formId="6cb6d4e03c0b41b1b14a5657b33604c9" value="%{CFI_FUNC_NAME}" style="" formIndex="1" /></td>
                		</tr>
                		<!--
                		<tr>
                			<td class="name" /><bu:uitn colNo="CFI_PHOTO" formId="6cb6d4e03c0b41b1b14a5657b33604c9" /></td>
                			<bu:td cssClass="dec" colNo="CFI_PHOTO" formId="6cb6d4e03c0b41b1b14a5657b33604c9" ><bu:ui colNo="CFI_PHOTO"  name="upFile" formId="6cb6d4e03c0b41b1b14a5657b33604c9" value="%{CFI_PHOTO}" style="width:100%;" formIndex="1" /></bu:td>
                		</tr>
                		-->
                		<tr>
                		    <td class="name"    style="vertical-align: bottom;" /><bu:uitn colNo="CFI_PHOTO" formId="6cb6d4e03c0b41b1b14a5657b33604c9" /></td>	
                			<td class="dec"   rowspan="1"  style="width:300px;vertical-align: bottom;">
                			<div id="photoImg"  style="margin-bottom:14px;height:60px;" > 
                			<img alt="" id="img0" src="plf/page/fp/img/MoreWis_s.png" align="bottom" style="width:120px;height:60px;float:left;" > 
                			<span style="font-size:12px;color:#999;float:left;margin-top:46px;margin-left:5px;">支持100KB以内</span>
                			</div>
                			<!--<input type="file" accept="image/*" id="paraMap1_CFI_PHOTO" name="upFile" value="" class="isSubmit input">	-->			

                			<input type='button' value='<dict:lang value="选择默认图片" />' id="select_system" onclick="choosePic('1')">
                			<input type="hidden" name="serverfileName" id="serverfileName" value="" />
                			<input type='button' value='<dict:lang value="选择本地图片" />' id="select_locales">
                			<input type="file" id="paraMap1_CFI_PHOTO" onchange="javascript:_setImagePreview('photoImg','img0','paraMap1_CFI_PHOTO');" style="display:none;" name="upFile" class=" input isSubmit  _VAL_OjbsData">
                			</td>
                		</td>
                		</tr>
                		<tr>
                			<td class="name" style="width:80px;" /><bu:uitn colNo="CFI_FUNC_MEMO" formId="6cb6d4e03c0b41b1b14a5657b33604c9" /></td>
                			<td class="dec" style="width:300px;" colNo="CFI_FUNC_MEMO" formId="6cb6d4e03c0b41b1b14a5657b33604c9" ><bu:ui colNo="CFI_FUNC_MEMO" formId="6cb6d4e03c0b41b1b14a5657b33604c9" value="%{CFI_FUNC_MEMO}" style="height:80px;" formIndex="1" /></td>
                		</tr>
                    </table>
    			    <bu:jsVal formId="6cb6d4e03c0b41b1b14a5657b33604c9" formIndex="1" />
    			</div>
    		</form>
    		<div style="background-color: white;" id="pageDiv">
                                 <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=SearchDetailFun&formId=formId1&showLoading=0" />
            </div>		
		</div>									
	</div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
		  <!-- 修改div -->		
		 <div id="backItems" class="dialog-mask" style="z-index:11111;"/></div>
	    <form id="editForm" name="editForm" action="${path}buss/bussModel_exeFunc.ms?funcMId=59f4c3345634443fb49112b9aaf5d7e7&type=edit" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
		<div class="dialog dialog-s1" id="addItems" style="display:none;z-index:11112;margin-left:0px;left:calc(50% - 250px);top:calc(50% - 182.5px);width:520px;height:365px;" >
		 <div class="dialog-hd">
				 <h3 class="tit"><dict:lang value="修改"/></h3>
			 </div>	
			
				<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addItems','backItems');"></a>

				<div class="optn optn_div">	
				<div style="float:left" class="deptcss"><span class="dot">*</span><dict:lang value="组织机构"/> 
                  <select disabled class="dept_select IS_SELECT_FILTER" id="editfuncauth" ><option>--请选择--</option></select>
                  </div>
		            <button type="button" onclick="editCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        			<button type="button" onclick="hideDiv('addItems','backItems');" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
		</div>
		<div class="edit"  style="height:calc(100% - 5px);">
	<!--<form id="editForm" name="editForm" action="" method="post" >
	<form id="editForm" name="editForm" action="${path}buss/bussModel_exeFunc.ms?funcMId=59f4c3345634443fb49112b9aaf5d7e7&type=edit" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>	-->
			<div class="bd">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
  					           
  		<!--<form id="editForm" name="editForm" action="" method="post" >-->
		<bu:set name="paraMapObj" value="${dataId}" formId="6cb6d4e03c0b41b1b14a5657b33604c9" type="edit" />
		
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="6cb6d4e03c0b41b1b14a5657b33604c9" />
	<input type="hidden" id="prefixInd" name="6cb6d4e03c0b41b1b14a5657b33604c9" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" id="picturePath" name="picturePath" value="${path}" />
	<input type="hidden" id="pPath" name="oldPictureName" value="">
	<input type="hidden" id="selId" name="selId" value="">
		<s:set name="_$viewId" value="'07bcbc8b124849cfb12637b8be1549a3'" />
		<s:set name="_$formId_1" value="'6cb6d4e03c0b41b1b14a5657b33604c9'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name"  style="width:80px" /><span class="dot">*</span>功能模块</td>
			<bu:td cssClass="dec" colNo="CFI_FUNC_MODEL" formId="6cb6d4e03c0b41b1b14a5657b33604c9" ><bu:ui colNo="CFI_FUNC_MODEL" formId="6cb6d4e03c0b41b1b14a5657b33604c9" style="width:100%;" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CFI_FUNC_SN" formId="6cb6d4e03c0b41b1b14a5657b33604c9" /></td>
			<bu:td cssClass="dec" colNo="CFI_FUNC_SN" formId="6cb6d4e03c0b41b1b14a5657b33604c9" ><bu:ui colNo="CFI_FUNC_SN" formId="6cb6d4e03c0b41b1b14a5657b33604c9" style="width:100%;" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CFI_FUNC_NAME" formId="6cb6d4e03c0b41b1b14a5657b33604c9" /></td>
			<bu:td cssClass="dec" colNo="CFI_FUNC_NAME" formId="6cb6d4e03c0b41b1b14a5657b33604c9" ><bu:ui colNo="CFI_FUNC_NAME" formId="6cb6d4e03c0b41b1b14a5657b33604c9" style="width:100%;" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
		    <td class="name"    style="width:64px;vertical-align: bottom;" /><bu:uitn colNo="CFI_PHOTO" formId="6cb6d4e03c0b41b1b14a5657b33604c9" /></td>	
			<td class="dec"   rowspan="1"  style="width:150px;vertical-align: bottom;">
			<div id="photoImgs"  style="margin-bottom:14px;height:60px;" > <img alt="" id="img1" src="plf/page/fp/img/MoreWis_s.png" align="bottom" style="width:120px;height:60px;float:left;" > 
			<span style="font-size:12px;color:#999;float:left;margin-top:46px;margin-left:5px;">支持100KB以内</span>
			</div>
			
			<!--<input type="file" accept="image/*" id="paraMapObj_CFI_PHOTO" name="upFile" value="" class="isSubmit input">-->
			
			<input type='button' value='<dict:lang value="选择默认图片" />' id="select_systems" onclick="choosePic('2')">
			<input type="hidden" name="serverfileName1" id="serverfileName1" value="" />
			<input type='button' value='<dict:lang value="选择本地图片" />' id="select_locale">
			<input type="file" accept="image/*" id="paraMapObj_CFI_PHOTO" onchange="javascript:_setImagePreview('photoImgs','img1','paraMapObj_CFI_PHOTO');" style="display:none;" name="upFile" class=" input isSubmit  _VAL_OjbsData">
			</td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CFI_FUNC_MEMO" formId="6cb6d4e03c0b41b1b14a5657b33604c9" /></td>
			<bu:td cssClass="dec" colNo="CFI_FUNC_MEMO" formId="6cb6d4e03c0b41b1b14a5657b33604c9" ><bu:ui colNo="CFI_FUNC_MEMO" formId="6cb6d4e03c0b41b1b14a5657b33604c9" style="height:80px;width:100%;" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			
			</div>
	</form>	
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	</div>	
	
	 <!-- 查看div -->		
		 <div id="backItemd" class="dialog-mask" style="z-index:11111;"/></div>
	
		<div class="dialog dialog-s1" id="addItemd" style="display:none;z-index:11112;margin-left:0px;left:calc(50% - 250px);top:calc(50% - 182.5px);width:520px;height:365px;" >
		 <div class="dialog-hd">
				 <h3 class="tit"><dict:lang value="查看"/></h3>
			 </div>	
			
				<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addItemd','backItemd');"></a>
		<div class="edit"  style="height:calc(100% - 5px);">
	<form id="showForm" name="showForm" action="" method="post" >
			<div class="bd">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="showForm" />
  					           </jsp:include>
  	<form id="showForm" name="showForm" action="" method="post" >
		<bu:set name="paraMapObj" value="${dataId}" formId="6cb6d4e03c0b41b1b14a5657b33604c9" type="edit" />
		
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="6cb6d4e03c0b41b1b14a5657b33604c9" />
	<input type="hidden" id="prefixInd" name="6cb6d4e03c0b41b1b14a5657b33604c9" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" id="picturePaths" name="picturePath" value="${path}" />
		<s:set name="_$viewId" value="'07bcbc8b124849cfb12637b8be1549a3'" />
		<s:set name="_$formId_1" value="'6cb6d4e03c0b41b1b14a5657b33604c9'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name"  style="width:80px" /><span class="dot">*</span>功能模块</td>
			<bu:td cssClass="dec" colNo="CFI_FUNC_MODEL" formId="6cb6d4e03c0b41b1b14a5657b33604c9" ><bu:ui id="CFI_FUNC_MODELS" name="CFI_FUNC_MODELS" colNo="CFI_FUNC_MODEL" formId="6cb6d4e03c0b41b1b14a5657b33604c9" style="width:100%;" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CFI_FUNC_SN" formId="6cb6d4e03c0b41b1b14a5657b33604c9" /></td>
			<bu:td cssClass="dec" colNo="CFI_FUNC_SN" formId="6cb6d4e03c0b41b1b14a5657b33604c9" ><bu:ui id="CFI_FUNC_SNS" name="CFI_FUNC_SNS" colNo="CFI_FUNC_SN" formId="6cb6d4e03c0b41b1b14a5657b33604c9" style="width:100%;" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CFI_FUNC_NAME" formId="6cb6d4e03c0b41b1b14a5657b33604c9" /></td>
			<bu:td cssClass="dec" colNo="CFI_FUNC_NAME" formId="6cb6d4e03c0b41b1b14a5657b33604c9" ><bu:ui id="CFI_FUNC_NAMES" name="CFI_FUNC_NAMES" colNo="CFI_FUNC_NAME" formId="6cb6d4e03c0b41b1b14a5657b33604c9" style="width:100%;" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
		    <td class="name"    style="width:64px;vertical-align: bottom;" /><bu:uitn colNo="CFI_PHOTO" formId="6cb6d4e03c0b41b1b14a5657b33604c9" /></td>	
			<td class="dec"   rowspan="1"  style="width:150px;vertical-align: bottom;">
			<div id="photoImgd"  style="margin-bottom:14px;height:60px;" > <img alt="" id="img2" src="plf/page/fp/img/MoreWis_s.png" align="bottom" style="width:120px;height:60px;float:left;" > 
			<span style="font-size:12px;color:#999;float:left;margin-top:46px;margin-left:5px;">?支持2M以内</span></div>
			<input type="file" accept="image/*" id="CFI_PHOTOS" name="upFile" value="" class="isSubmit input">
		</td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CFI_FUNC_MEMO" formId="6cb6d4e03c0b41b1b14a5657b33604c9" /></td>
			<bu:td cssClass="dec" colNo="CFI_FUNC_MEMO" formId="6cb6d4e03c0b41b1b14a5657b33604c9" ><bu:ui id="CFI_FUNC_MEMOS" name="CFI_FUNC_MEMOS" colNo="CFI_FUNC_MEMO" formId="6cb6d4e03c0b41b1b14a5657b33604c9" style="height:80px;width:100%;" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			
			</div>
	</form>	
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	</div>	
	

		<bu:submit viewId="950f89f0886d4a909aa123e351c3a1af" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="950f89f0886d4a909aa123e351c3a1af" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
    
<script>

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



<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='6cb6d4e03c0b41b1b14a5657b33604c9'){<%--FM-系统功能信息表--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='text-align:center;width:200px;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />  ")
            arrHtml.push("</td>");            
            arrHtml.push("<td colno='CFI_FUNC_MODEL' class='datagrid-cell "+ms.tdClass(formId, 'CFI_FUNC_MODEL')+"' style='width:150px;"+ms.tdStyle(formId, 'CFI_FUNC_MODEL')+"' "+ms.tdEvent(formId, 'CFI_FUNC_MODEL')+">")
            arrHtml.push("<span colno='CFI_FUNC_MODEL' class='"+ms.uiClass(formId, 'CFI_FUNC_MODEL')+"' style='"+ms.uiStyle(formId, 'CFI_FUNC_MODEL')+"' "+ms.uiEvent(formId, 'CFI_FUNC_MODEL')+" title='"+ms.titleAttr(formId,'CFI_FUNC_MODEL','IS_TITLE_ATTR',v)+"' >"+v['CFI_FUNC_MODEL']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CFI_FUNC_SN' class='datagrid-cell "+ms.tdClass(formId, 'CFI_FUNC_SN')+"' style='width:150px;"+ms.tdStyle(formId, 'CFI_FUNC_SN')+"' "+ms.tdEvent(formId, 'CFI_FUNC_SN')+">")
            arrHtml.push("<span colno='CFI_FUNC_SN' class='"+ms.uiClass(formId, 'CFI_FUNC_SN')+"' style='"+ms.uiStyle(formId, 'CFI_FUNC_SN')+"' "+ms.uiEvent(formId, 'CFI_FUNC_SN')+" title='"+ms.titleAttr(formId,'CFI_FUNC_SN','IS_TITLE_ATTR',v)+"' >"+v['CFI_FUNC_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CFI_FUNC_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CFI_FUNC_NAME')+"' style='width:150px;"+ms.tdStyle(formId, 'CFI_FUNC_NAME')+"' "+ms.tdEvent(formId, 'CFI_FUNC_NAME')+">")
            arrHtml.push("<span colno='CFI_FUNC_NAME' class='"+ms.uiClass(formId, 'CFI_FUNC_NAME')+"' style='"+ms.uiStyle(formId, 'CFI_FUNC_NAME')+"' "+ms.uiEvent(formId, 'CFI_FUNC_NAME')+" title='"+ms.titleAttr(formId,'CFI_FUNC_NAME','IS_TITLE_ATTR',v)+"' >"+v['CFI_FUNC_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CFI_FUNC_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'CFI_FUNC_MEMO')+"' style='width:200px;"+ms.tdStyle(formId, 'CFI_FUNC_MEMO')+"' "+ms.tdEvent(formId, 'CFI_FUNC_MEMO')+">")
            arrHtml.push("<span colno='CFI_FUNC_MEMO' class='"+ms.uiClass(formId, 'CFI_FUNC_MEMO')+"' style='"+ms.uiStyle(formId, 'CFI_FUNC_MEMO')+"' "+ms.uiEvent(formId, 'CFI_FUNC_MEMO')+" title='"+ms.titleAttr(formId,'CFI_FUNC_MEMO','IS_TITLE_ATTR',v)+"' >"+v['CFI_FUNC_MEMO']+"</span>")
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
	    setDataAuth();
	})

//组织机构赋值
function setDataAuth(){
    		    $.ajax({
		        type:"post",
		        dataType:"json",
		        data:"",
		        url:"${path}buss/bussModel_exeFunc.ms?funcMId=47ef403e2fb04c2cbdb40754b90e9f80",
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
//打开新增弹窗	
function addAjax(){
		addInfo('addItem','backItem');
	}
	function addInfo(showId,backId){
			 $("#"+showId+",#"+backId).show();
			$("#"+showId).draggable();
	        		
            $("#paraMap1_CFI_FUNC_MODEL_chosen").attr('style','width:300px;')
		    $("#paraMap1_CFI_FUNC_SN").attr('style','width:300px;')
		    $("#paraMap1_CFI_FUNC_NAME").attr('style','width:300px;')
		    $("#paraMap1_CFI_FUNC_MEMO").attr('style','width:300px;')
		}
		//关闭新增弹窗	
		function hideDiv(showId,backId){
			
			    $("#savelose").removeClass('save-not-close');
				$("#savelose").attr("title","?关闭保存并关闭窗口");
				saveAndClose = true;
				$('#isCloseWin').attr('checked',true);
				$('#isCloseWin').val("0");
                saveose="0";
			    	
                $("#paraMap1_CFI_FUNC_MODEL").val("");
    			$("#paraMap1_CFI_FUNC_SN").val("");
    			$("#paraMap1_CFI_FUNC_NAME").val("");
    			$("#paraMap1_CFI_FUNC_MEMO").val("");	
    			$("#paraMap1_CFI_FUNC_MODEL").trigger("chosen:updated");
                $("#img0").attr("src", "plf/page/fp/img/MoreWis_s.png") ;
                $("#paraMap1_CFI_PHOTO").val("");
                				
			    $("#paraMapObj_CFI_FUNC_MODEL").val("");
    			$("#paraMapObj_CFI_FUNC_SN").val("");
    			$("#paraMapObj_CFI_FUNC_NAME").val("");
    			$("#paraMapObj_CFI_FUNC_MEMO").val("");	
    			$("#paraMapObj_CFI_FUNC_MODEL").trigger("chosen:updated");
                $("#img1").attr("src", "plf/page/fp/img/MoreWis_s.png") ;
                $("#paraMapObj_CFI_PHOTO").val("");
                $("#serverfileName").val("");
                $("#serverfileName1").val("");
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
		//保存	
		var saveTestInfoUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=e5e02c29573e44408513abf99620ab4f";
		function addCal(){
    
            isQuery = false;
	        /*
			if($("#upFile$f5c76b95ad9d4116a5dd9f5bb5e6153c").val()=="" || $("#upFile$f5c76b95ad9d4116a5dd9f5bb5e6153c").val()==undefined){
			
	        	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: saveTestInfoUrl,
			    data: $("#addForm").serialize(),
			    success: function(data){
						    if(null == data){return;}
						    if(null != data){
							    if(data.ajaxMap.returnMsg=="addcount"){	
                                    
    								utilsFp.confirmIcon(3,"","","", "<dict:lang value="功能编号已存在" />",0,"260","");
    								return;
    							}	

    							if(data.ajaxMap.returnMsg=="addSucc"){	
                                    
    								msgPop(data.ajaxMap.alertMsg,"",data.ajaxMap.title.ajaxMap,data.ajaxMap.width.ajaxMap,data.height,data.ajaxMap.time,"");
    							     hideDiv('addItem','backItem');
    							     	query("formId1");
    							}
    							if(data.ajaxMap.returnMsg=="addError"){
    								utilsFp.confirmIcon(3,"","","", "<dict:lang value="操作失败" />",0,"260","");
    								return;
    							}
						    }
					},
			    error: function(msg){
						
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
			});
	        }else{*/
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
						    
						        if(data.ajaxMap.returnMsg=="nullModel"){	
                                    
    								utilsFp.confirmIcon(3,"","","", "<dict:lang value="功能模块不能为空" />",0,"260","");
    								return;
    							}		
                                if(data.ajaxMap.returnMsg=="nullSn"){	
                                    
    								utilsFp.confirmIcon(3,"","","", "<dict:lang value="功能编号不能为空" />",0,"260","");
    								return;
    							}	
    							
    							if(data.ajaxMap.returnMsg=="nullName"){	
                                    
    								utilsFp.confirmIcon(3,"","","", "<dict:lang value="功能名称不能为空" />",0,"260","");
    								return;
    							}
							
    							if(data.ajaxMap.returnMsg=="addcount"){	
                                    
    								utilsFp.confirmIcon(3,"","","", "<dict:lang value="功能编号已存在" />",0,"260","");
    								return;
    							}	
    							if(data.ajaxMap.returnMsg=="nameLength"){	
                                    
    								utilsFp.confirmIcon(3,"","","", "<dict:lang value="功能名称字节不能超过50" />",0,"260","");
    								return;
    							}
                                if(data.ajaxMap.returnMsg=="addSize"){	
                                    
    								utilsFp.confirmIcon(3,"","","", "<dict:lang value="图片大小不能超过100kb" />",0,"260","");
    								$("#paraMap1_CFI_PHOTO").val("");
    								document.getElementById("img0").src="plf/page/fp/img/MoreWis_s.png"; 
    								return;
    							}
    							if(data.ajaxMap.returnMsg=="memoLength"){	
                                    
    								utilsFp.confirmIcon(3,"","","", "<dict:lang value="备注字节不能超过500" />",0,"260","");
    								return;
    							}
    							if(data.ajaxMap.returnMsg=="addSucc"){	
                                    
    								msgPop(data.ajaxMap.alertMsg,"",data.ajaxMap.title.ajaxMap,data.ajaxMap.width.ajaxMap,data.height,data.ajaxMap.time,"");
    							     $("#paraMap1_CFI_FUNC_MODEL").val("");
    								    $("#paraMap1_CFI_FUNC_SN").val("");
    								    $("#paraMap1_CFI_FUNC_NAME").val("");
    								    $("#paraMap1_CFI_FUNC_MEMO").val("");	
    								    $("#paraMap1_CFI_FUNC_MODEL").trigger("chosen:updated");
                                        $("#img0").attr("src", "plf/page/fp/img/MoreWis_s.png") ;
                                        $("#paraMap1_CFI_PHOTO").val("");
                                       
    								if(saveose=="0"){
    								     hideDiv('addItem','backItem');
    								}
    								    parentWindow.getPage();
    									query("formId1");
    							}
    							if(data.ajaxMap.returnMsg=="addError"){
    								utilsFp.confirmIcon(3,"","","", "<dict:lang value="操作失败" />",0,"260","");
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
        
          
  
         
</script>



<script type="text/javascript">
    //图片回调
	$("#paraMap1_CFI_PHOTO").live('change',function(e){
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
                var hhotoObj = document.getElementById("paraMap1_CFI_PHOTO");
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

$("#paraMapObj_CFI_PHOTO").live('change',function(e){
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
                var hhotoObj = document.getElementById("paraMapObj_CFI_PHOTO");
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
function _setImagePreview(photoImgID,previewID,upFileID){
			var hhotoObj = document.getElementById(upFileID);
			var imgObjPreview = document.getElementById(previewID);
			if (hhotoObj.files && hhotoObj.files[0]) {
				//火狐下，直接設img属性
				imgObjPreview.style.display = 'block';
				imgObjPreview.style.width = '120px';
				imgObjPreview.style.height = '60px';
				imgObjPreview.src = window.URL.createObjectURL(hhotoObj.files[0]);
			}else{
				//IE下，使用滤镜
				hhotoObj.select();
				var imgSrc = document.selection.createRange().text;
				document.selection.empty();
				var imgId = document.getElementById(photoImgID);
				imgId.style.width = '120px';
				imgId.style.height = '60px';
				try {
					imgId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
					imgId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
				} catch (e) {
				//	utilsFp.confirmIcon(3,"","","", "图片格式不支持，请重新选择(.png后缀格式的图片)",0,"300","");
					return false;
				}
				imgObjPreview.style.display = 'none';
				//document.selection.empty();
			}
			return true;
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
//打开修改弹窗
	function ajaxEdit(){
	    var isDataAuth = dataAuthentication();
        if(!isDataAuth){return false;};
        var selCount = getNewSelectedCount();
        if(selCount==1){
          var formId = $("#formId1").val();
         var  dataId=_selectedEditTr.attr("id");
          addInfos('addItems','backItems',dataId);
    
        }else{
          return false;
  	    }
    }
	function addInfos(showId,backId,dataId){
			 $("#"+showId+",#"+backId).show();
			$("#"+showId).draggable();
			 dataId=_selectedEditTr.attr("id");
			$("#paraMapObj_CFI_FUNC_MODEL_chosen").attr('style','width:300px;');
		    $("#paraMapObj_CFI_FUNC_SN").attr('style','width:300px;')
		    $("#paraMapObj_CFI_FUNC_NAME").attr('style','width:300px;')
		    $("#paraMapObj_CFI_FUNC_MEMO").attr('style','width:300px;')
			getInfo();
		}
		
		function getInfo(){
		    var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=48d65acd90aa40369530ca03f9417ed3";
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
		                	if(map.CFI_FUNC_MODEL==null) map.CFI_FUNC_MODEL=="";
		                	if(map.CFI_FUNC_SN==null) map.CFI_FUNC_SN=="";
		                	if(map.CFI_FUNC_NAME==null) map.CFI_FUNC_NAME=="";
		                	if(map.CFI_FUNC_MEMO==null) map.CFI_FUNC_MEMO=="";
		                //	if(map.CFI_PATH==null) map.CFI_PATH=="";
		                $("#paraMapObj_CFI_FUNC_MODEL").val(map.CFI_FUNC_MODEL);
		                $("#paraMapObj_CFI_FUNC_SN").val(map.CFI_FUNC_SN);
		                $("#paraMapObj_CFI_FUNC_NAME").val(map.CFI_FUNC_NAME);
		                $("#paraMapObj_CFI_FUNC_MODEL").trigger("chosen:updated");
		                $("#paraMapObj_CFI_FUNC_MEMO").val(map.CFI_FUNC_MEMO);
		                $("#selId").val(map.DATAID);
		                
		                
		                if(map.CFI_PATH!=null){
                    	document.getElementById("img1").src = $("#picturePath").val()+"up_load/comm/"+map.CFI_PATH;
                    	 $("#pPath").val(map.CFI_FUNC_NAME);
                    	}else{
                    	   	document.getElementById("img1").src="plf/page/fp/img/MoreWis_s.png"; 
                    	}
                    	
		            }
		        },
		        error:function(msg){
		            utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
		        }
		        
		    })
		    
		}
	
		function editCal(){
		
                        
            isQuery = false;
            
            
	        /*
			if($("#upFile$f5c76b95ad9d4116a5dd9f5bb5e6153c").val()=="" || $("#upFile$f5c76b95ad9d4116a5dd9f5bb5e6153c").val()==undefined){
			
	        	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: saveTestInfoUrl,
			    data: $("#addForm").serialize(),
			    success: function(data){
						    if(null == data){return;}
						    if(null != data){
							    if(data.ajaxMap.returnMsg=="addcount"){	
                                    
    								utilsFp.confirmIcon(3,"","","", "<dict:lang value="功能编号已存在" />",0,"260","");
    								return;
    							}	

    							if(data.ajaxMap.returnMsg=="addSucc"){	
                                    
    								msgPop(data.ajaxMap.alertMsg,"",data.ajaxMap.title.ajaxMap,data.ajaxMap.width.ajaxMap,data.height,data.ajaxMap.time,"");
    							     hideDiv('addItem','backItem');
    							     	query("formId1");
    							}
    							if(data.ajaxMap.returnMsg=="addError"){
    								utilsFp.confirmIcon(3,"","","", "<dict:lang value="操作失败" />",0,"260","");
    								return;
    							}
						    }
					},
			    error: function(msg){
						
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
			});
	        }else{*/
	        	var formData = new FormData(document.getElementById("editForm"));
	        	
	        	var dataId = $("#selId").val();
	        	console.log(dataId);
	        	var editInfoUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=28aa3ee670e442a19e54c3fe72e435c8&dataId="+dataId;
	        	
	        	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: editInfoUrl,
			    data: formData,
			   // cache: false,
			    processData:false,
                contentType:false,
			    success: function(data){
			                if(null == data){return;}
						    if(null != data){
                                if(data.ajaxMap.returnMsg=="nullModel"){	
                                    
    								utilsFp.confirmIcon(3,"","","", "<dict:lang value="功能模块不能为空" />",0,"260","");
    								return;
    							}
    							if(data.ajaxMap.returnMsg=="nullName"){	
                                    
    								utilsFp.confirmIcon(3,"","","", "<dict:lang value="功能名称不能为空" />",0,"260","");
    								return;
    							}
    							if(data.ajaxMap.returnMsg=="nameLength"){	
                                    
    								utilsFp.confirmIcon(3,"","","", "<dict:lang value="功能名称字节不能超过50" />",0,"260","");
    								return;
    							}
                                if(data.ajaxMap.returnMsg=="addSize"){	
                                    
    								utilsFp.confirmIcon(3,"","","", "<dict:lang value="图片大小不能超过100kb" />",0,"260","");
    								$("#paraMapObj_CFI_PHOTO").val("");
    								document.getElementById("img1").src="plf/page/fp/img/MoreWis_s.png"; 
    								return;
    							}
    							if(data.ajaxMap.returnMsg=="memoLength"){	
                                    
    								utilsFp.confirmIcon(3,"","","", "<dict:lang value="备注字节不能超过500" />",0,"260","");
    								return;
    							}
    							if(data.ajaxMap.returnMsg=="addSucc"){	
                                    
    								msgPop(data.ajaxMap.alertMsg,"",data.ajaxMap.title.ajaxMap,data.ajaxMap.width.ajaxMap,data.height,data.ajaxMap.time,"");
    								 parentWindow.getPage();
    							     hideDiv('addItems','backItems');
    							     	query("formId1");
    							}
    							if(data.ajaxMap.returnMsg=="addError"){
    								utilsFp.confirmIcon(3,"","","", "<dict:lang value="操作失败" />",0,"260","");
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
			$("#CFI_FUNC_MODELS_chosen").attr('style','width:300px;');
			$("#CFI_FUNC_SNS").attr('style','width:300px;');
			$("#CFI_FUNC_NAMES").attr('style','width:300px;');
			$("#CFI_FUNC_MEMOS").attr('style','width:300px;');
		  $("#CFI_FUNC_MODELS").attr("disabled","disabled");
        $("#CFI_FUNC_MODELS").attr("class","isSubmit input readonly _VAL_DATABASE dept_select");
      	$("#CFI_FUNC_MODELS_chosen").attr('disabled','disabled');
        $("#CFI_FUNC_SNS").attr("disabled","disabled");
        $("#CFI_FUNC_SNS").attr("class"," isSubmit input readonly _VAL_DATABASE");
         $("#CFI_FUNC_NAMES").attr("disabled","disabled");
        $("#CFI_FUNC_NAMES").attr("class"," isSubmit input readonly _VAL_DATABASE");
       $("#CFI_FUNC_MEMOS").attr("disabled","disabled");
        $("#CFI_FUNC_MEMOS").attr("class"," isSubmit input readonly _VAL_DATABASE");
       
         $("#photoImgd").attr("disabled","disabled");
        $("#CFI_PHOTOS").attr("disabled","disabled");
         $("#CFI_FUNC_MODELS").trigger("chosen:updated");
         
			getInfod(dataId);
		}
function getInfod(dataId){
		    var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=48d65acd90aa40369530ca03f9417ed3";
		   
		    
		    $.ajax({
		        type:"post",
		        dataType:"json",
		        data:"dataId="+dataId,
		        url:loadItemUrl,
		        success: function(data){
		            if(null == data){return;}
		            console.log(data.ajaxMap);
		            if(null!=data.ajaxMap){
		                var map=eval(data.ajaxMap);
		                	if(map.CFI_FUNC_MODEL==null) map.CFI_FUNC_MODEL=="";
		                	if(map.CFI_FUNC_SN==null) map.CFI_FUNC_SN=="";
		                	if(map.CFI_FUNC_NAME==null) map.CFI_FUNC_NAME=="";
		                	if(map.CFI_FUNC_MEMO==null) map.CFI_FUNC_MEMO=="";
		                //	if(map.CFI_PATH==null) map.CFI_PATH=="";
		                $("#CFI_FUNC_MODELS").val(map.CFI_FUNC_MODEL);
		                $("#CFI_FUNC_SNS").val(map.CFI_FUNC_SN);
		                $("#CFI_FUNC_NAMES").val(map.CFI_FUNC_NAME);
		                $("#CFI_FUNC_MODELS").trigger("chosen:updated");
		                $("#CFI_FUNC_MEMOS").val(map.CFI_FUNC_MEMO);
		              //  $("#selId").val(map.DATAID);
		                if(map.CFI_PATH!=null){
                    	document.getElementById("img2").src = $("#picturePaths").val()+"up_load/comm/"+map.CFI_PATH;
                    	}else{
                    	   	document.getElementById("img2").src="plf/page/fp/img/MoreWis_s.png"; 
                    	}
		            }
		        },
		        error:function(msg){
		            utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
		        }
		        
		    })
		    
		}
		$('#paraMap1_CFI_FUNC_SN').bind('keyup', function () {
	            var calwStart=$("#paraMap1_CFI_FUNC_SN");
	         
             if(  /[\u4E00-\u9FA5]/i.test(this.value)){
             	this.value='';
               
             	//_alertValMsg($('#paraMap1_CFI_FUNC_SN'),"<dict:lang value="不能输入中文" />");
             		utilsFp.confirmIcon(3,"","","", "<dict:lang value="不能输入中文" />",0,"260","");
             }

         });
        function choosePic(types) {
				
				var piframeId = window.frameElement.id;
				var type=types;
				var url = "${path}buss/bussModel.ms?exeid=c200cc87c1984b0cb0d26e1e5e7ecd28&piframeId="+piframeId+"&type="+type;						

				showPopWinFp(url, 552, 350, "", "<dict:lang value="选择默认图片"/>",
						"choosePic", "");
	} 
      $('#select_locale').click(function(){
        $("#serverfileName1").val();
	    $('#paraMapObj_CFI_PHOTO').click();
    })   
    $('#select_locales').click(function(){
        $("#serverfileName").val("");
	    $('#paraMap1_CFI_PHOTO').click();
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
