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
		<dict:lang value="VM-辅料搅拌-列表" />
    </title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" />
        <jsp:param name="scroll" value="1" />
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="4a9e88fa2740425eb33458f17d6856e3"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <!-- 产品静态资源 -->

</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="d11bb09a9d6f46b1990185a8242e1bc4" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="d11bb09a9d6f46b1990185a8242e1bc4" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage4a9e88fa2740425eb33458f17d6856e3" id="formPage4a9e88fa2740425eb33458f17d6856e3" value="${formPage4a9e88fa2740425eb33458f17d6856e3}"/>
		<input type="hidden" name="formId" id="formId1" value='4a9e88fa2740425eb33458f17d6856e3'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="4a9e88fa2740425eb33458f17d6856e3">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax4a9e88fa2740425eb33458f17d6856e3" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner4a9e88fa2740425eb33458f17d6856e3">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable4a9e88fa2740425eb33458f17d6856e3" style="min-width:1860px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="4a9e88fa2740425eb33458f17d6856e3" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_4a9e88fa2740425eb33458f17d6856e3" onclick="_selectAjaxTableAllData(this,'4a9e88fa2740425eb33458f17d6856e3')" style="cursor: pointer;"title="全选"/></span></td>
		    <td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="4a9e88fa2740425eb33458f17d6856e3" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CTM_TIN_SN" formId="4a9e88fa2740425eb33458f17d6856e3" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CTM_TIN_STATUS" formId="4a9e88fa2740425eb33458f17d6856e3" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CTM_PASS_FLAG" formId="4a9e88fa2740425eb33458f17d6856e3" /></td>
			<td class="datagrid-cell"  style="width:100px;"><bu:uitn colNo="CTM_ITEM_TYPE" formId="4a9e88fa2740425eb33458f17d6856e3" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="CTM_ITEM_CODE" formId="4a9e88fa2740425eb33458f17d6856e3" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="THA_TOOL_NAME" formId="4a9e88fa2740425eb33458f17d6856e3" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="THA_TOOLSPEC" formId="4a9e88fa2740425eb33458f17d6856e3" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CTM_MIX_CYCLE" formId="4a9e88fa2740425eb33458f17d6856e3" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="CTM_MIX_MAX_CYCLE" formId="4a9e88fa2740425eb33458f17d6856e3" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CTM_BEGIN_TIME" formId="4a9e88fa2740425eb33458f17d6856e3" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CTM_EXPECT_TIME" formId="4a9e88fa2740425eb33458f17d6856e3" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CTM_MAX_TIME" formId="4a9e88fa2740425eb33458f17d6856e3" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CTM_END_TIME" formId="4a9e88fa2740425eb33458f17d6856e3" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CTM_PASS_MEMO" formId="4a9e88fa2740425eb33458f17d6856e3" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CTM_OPERATOR" formId="4a9e88fa2740425eb33458f17d6856e3" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv4a9e88fa2740425eb33458f17d6856e3" onscroll="ajaxTableScroll(this,'4a9e88fa2740425eb33458f17d6856e3')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax4a9e88fa2740425eb33458f17d6856e3" style="min-width:1860px;">
		<tbody id="tbody_4a9e88fa2740425eb33458f17d6856e3" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage4a9e88fa2740425eb33458f17d6856e3==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=4a9e88fa2740425eb33458f17d6856e3&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="d11bb09a9d6f46b1990185a8242e1bc4" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="d11bb09a9d6f46b1990185a8242e1bc4" />
    
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
    if(formId=='4a9e88fa2740425eb33458f17d6856e3'){<%--FM-辅料搅拌--%>
        $.each(uiTxt,function(i,v){
           
            
            var nowDate=new Date();
            var expect_time = v['CTM_EXPECT_TIME'];
             var ctt_expect_time_todate=new Date(expect_time);
             var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
             var tinSN=v['CTM_TIN_SN'];
             var itemCode=v['CTM_ITEM_CODE'];
             var endTime=v['CTM_END_TIME'];
             var maxCycle=v['CTM_MIX_MAX_CYCLE'];
             var beginTime=v['CTM_BEGIN_TIME'];
             var cttMaxCycle=maxCycle*60*1000;
             var cttBeginTime=new Date(beginTime);
             var thawingCycle =v['CTM_MIX_CYCLE'];
             var cttThawingCycle = thawingCycle*60*1000;
             var name=v['THA_TOOL_NAME'];
            var spec=v['THA_TOOLSPEC'];
            
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            //arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"'style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            //arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            //arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")		
	        arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")		
	        arrHtml.push("</td>");
            arrHtml.push("<td colno='CTM_TIN_SN' class='datagrid-cell "+ms.tdClass(formId, 'CTM_TIN_SN')+"' style='width:150px;"+ms.tdStyle(formId, 'CTM_TIN_SN')+"' "+ms.tdEvent(formId, 'CTM_TIN_SN')+">")
            arrHtml.push("<span colno='CTM_TIN_SN' class='"+ms.uiClass(formId, 'CTM_TIN_SN')+"' onclick='itemJump1(\""+v['CTM_TIN_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CTM_TIN_SN')+" title='"+ms.titleAttr(formId,'CTM_TIN_SN','IS_TITLE_ATTR',v)+"' >"+v['CTM_TIN_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTM_TIN_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'CTM_TIN_STATUS')+"' style='width:70px;text-align:center"+ms.tdStyle(formId, 'CTM_TIN_STATUS')+"' "+ms.tdEvent(formId, 'CTM_TIN_STATUS')+">")
            //arrHtml.push("<span colno='CTM_TIN_STATUS' class='"+ms.uiClass(formId, 'CTM_TIN_STATUS')+"' style='"+ms.uiStyle(formId, 'CTM_TIN_STATUS')+"' "+ms.uiEvent(formId, 'CTM_TIN_STATUS')+" title='"+ms.titleAttr(formId,'CTM_TIN_STATUS','IS_TITLE_ATTR',v)+"' >"+v['CTM_TIN_STATUS']+"</span>")
            if(null==endTime||endTime==""　){
                    if((cttBeginTime.getTime()+ cttMaxCycle)<nowDate.getTime()){
                        arrHtml.push("<span style='color:#FFFFFF;width:55px;display: inline-block;background-color:#aeaeae;border-radius:4px;' class='state fixedTable dlist-table'>搅拌超时</span>")
                    }else
                    if((cttBeginTime.getTime()+ cttThawingCycle)<=nowDate.getTime() && (cttBeginTime.getTime()+ cttThawingCycle)<=(cttBeginTime.getTime()+ cttMaxCycle)){
                       arrHtml.push("<span style='color:#FFFFFF;width:55px;display: inline-block;background-color:#4e9d0f;border-radius:4px;' class='state fixedTable dlist-table'>搅拌结束</span>") 
                    }else if(nowDate.getTime()<=ctt_expect_time_todate.getTime()){
                         arrHtml.push("<span style='color:#FFFFFF;width:55px;display: inline-block;background-color:#00a0e9;border-radius:4px;' class='state fixedTable dlist-table'>搅拌中</span>")
                    }else if((cttBeginTime.getTime()+ cttMaxCycle)>nowDate.getTime() &&　nowDate.getTime()>(cttBeginTime.getTime()+ cttThawingCycle)　){
                        arrHtml.push("<span style='color:#FFFFFF;width:55px;display: inline-block;background-color:#ff0000;border-radius:4px;' class='state fixedTable dlist-table'>搅拌完成</span>")
                    }    	
                     
                }else{
                    
                    
                    arrHtml.push("<span style='color:#FFFFFF;width:55px;display: inline-block;background-color:#4e9d0f;border-radius:4px;' class='state fixedTable dlist-table'>搅拌结束</span>")
                }
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTM_PASS_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'CTM_PASS_FLAG')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'CTM_PASS_FLAG')+"' "+ms.tdEvent(formId, 'CTM_PASS_FLAG')+">")
            arrHtml.push("<span colno='CTM_PASS_FLAG' class='"+ms.uiClass(formId, 'CTM_PASS_FLAG')+"' style='"+ms.uiStyle(formId, 'CTM_PASS_FLAG')+"' "+ms.uiEvent(formId, 'CTM_PASS_FLAG')+" title='"+ms.titleAttr(formId,'CTM_PASS_FLAG','IS_TITLE_ATTR',v)+"' >"+v['CTM_PASS_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTM_ITEM_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CTM_ITEM_TYPE')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'CTM_ITEM_TYPE')+"' "+ms.tdEvent(formId, 'CTM_ITEM_TYPE')+">")
            arrHtml.push("<span colno='CTM_ITEM_TYPE' class='"+ms.uiClass(formId, 'CTM_ITEM_TYPE')+"' style='"+ms.uiStyle(formId, 'CTM_ITEM_TYPE')+"' "+ms.uiEvent(formId, 'CTM_ITEM_TYPE')+" title='"+ms.titleAttr(formId,'CTM_ITEM_TYPE','IS_TITLE_ATTR',v)+"' >"+v['CTM_ITEM_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTM_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CTM_ITEM_CODE')+"' style='width:120px;"+ms.tdStyle(formId, 'CTM_ITEM_CODE')+"' "+ms.tdEvent(formId, 'CTM_ITEM_CODE')+">")
            arrHtml.push("<span colno='CTM_ITEM_CODE' class='"+ms.uiClass(formId, 'CTM_ITEM_CODE')+"' onclick='itemJump1(\""+v['CTM_ITEM_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CTM_ITEM_CODE')+" title='"+ms.titleAttr(formId,'CTM_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['CTM_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='THA_TOOL_NAME' title='"+name+"' class='datagrid-cell "+ms.tdClass(formId, 'THA_TOOL_NAME')+"' style='width:120px;"+ms.tdStyle(formId, 'THA_TOOL_NAME')+"' "+ms.tdEvent(formId, 'THA_TOOL_NAME')+">")
            arrHtml.push("<span colno='THA_TOOL_NAME' class='"+ms.uiClass(formId, 'THA_TOOL_NAME')+"' style='"+ms.uiStyle(formId, 'THA_TOOL_NAME')+"' "+ms.uiEvent(formId, 'THA_TOOL_NAME')+" >"+v['THA_TOOL_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='THA_TOOLSPEC' title='"+spec+"' class='datagrid-cell "+ms.tdClass(formId, 'THA_TOOLSPEC')+"' style='width:150px;"+ms.tdStyle(formId, 'THA_TOOLSPEC')+"' "+ms.tdEvent(formId, 'THA_TOOLSPEC')+">")
            arrHtml.push("<span colno='THA_TOOLSPEC' class='"+ms.uiClass(formId, 'THA_TOOLSPEC')+"' style='"+ms.uiStyle(formId, 'THA_TOOLSPEC')+"' "+ms.uiEvent(formId, 'THA_TOOLSPEC')+" >"+v['THA_TOOLSPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTM_MIX_CYCLE' class='datagrid-cell "+ms.tdClass(formId, 'CTM_MIX_CYCLE')+"' style='width:100px;text-align:right;"+ms.tdStyle(formId, 'CTM_MIX_CYCLE')+"' "+ms.tdEvent(formId, 'CTM_MIX_CYCLE')+">")
            arrHtml.push("<span colno='CTM_MIX_CYCLE' class='"+ms.uiClass(formId, 'CTM_MIX_CYCLE')+"' style='"+ms.uiStyle(formId, 'CTM_MIX_CYCLE')+"' "+ms.uiEvent(formId, 'CTM_MIX_CYCLE')+" title='"+ms.titleAttr(formId,'CTM_MIX_CYCLE','IS_TITLE_ATTR',v)+"' >"+v['CTM_MIX_CYCLE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTM_MIX_MAX_CYCLE' class='datagrid-cell "+ms.tdClass(formId, 'CTM_MIX_MAX_CYCLE')+"' style='width:120px;text-align:right;"+ms.tdStyle(formId, 'CTM_MIX_MAX_CYCLE')+"' "+ms.tdEvent(formId, 'CTM_MIX_MAX_CYCLE')+">")
            arrHtml.push("<span colno='CTM_MIX_MAX_CYCLE' class='"+ms.uiClass(formId, 'CTM_MIX_MAX_CYCLE')+"' style='"+ms.uiStyle(formId, 'CTM_MIX_MAX_CYCLE')+"' "+ms.uiEvent(formId, 'CTM_MIX_MAX_CYCLE')+" title='"+ms.titleAttr(formId,'CTM_MIX_MAX_CYCLE','IS_TITLE_ATTR',v)+"' >"+v['CTM_MIX_MAX_CYCLE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTM_BEGIN_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CTM_BEGIN_TIME')+"' style='text-align:center;width:140px;"+ms.tdStyle(formId, 'CTM_BEGIN_TIME')+"' "+ms.tdEvent(formId, 'CTM_BEGIN_TIME')+">")
            arrHtml.push("<span colno='CTM_BEGIN_TIME' class='"+ms.uiClass(formId, 'CTM_BEGIN_TIME')+"' style='"+ms.uiStyle(formId, 'CTM_BEGIN_TIME')+"' "+ms.uiEvent(formId, 'CTM_BEGIN_TIME')+" title='"+ms.titleAttr(formId,'CTM_BEGIN_TIME','IS_TITLE_ATTR',v)+"' >"+v['CTM_BEGIN_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTM_EXPECT_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CTM_EXPECT_TIME')+"' style='text-align:center;width:140px;"+ms.tdStyle(formId, 'CTM_EXPECT_TIME')+"' "+ms.tdEvent(formId, 'CTM_EXPECT_TIME')+">")
            arrHtml.push("<span colno='CTM_EXPECT_TIME' class='"+ms.uiClass(formId, 'CTM_EXPECT_TIME')+"' style='"+ms.uiStyle(formId, 'CTM_EXPECT_TIME')+"' "+ms.uiEvent(formId, 'CTM_EXPECT_TIME')+" title='"+ms.titleAttr(formId,'CTM_EXPECT_TIME','IS_TITLE_ATTR',v)+"' >"+v['CTM_EXPECT_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTM_MAX_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CTM_MAX_TIME')+"' style='text-align:center;width:140px;"+ms.tdStyle(formId, 'CTM_MAX_TIME')+"' "+ms.tdEvent(formId, 'CTM_MAX_TIME')+">")
            arrHtml.push("<span colno='CTM_MAX_TIME' class='"+ms.uiClass(formId, 'CTM_MAX_TIME')+"' style='"+ms.uiStyle(formId, 'CTM_MAX_TIME')+"' "+ms.uiEvent(formId, 'CTM_MAX_TIME')+" title='"+ms.titleAttr(formId,'CTM_MAX_TIME','IS_TITLE_ATTR',v)+"' >"+v['CTM_MAX_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTM_END_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CTM_END_TIME')+"' style='text-align:center;width:140px;"+ms.tdStyle(formId, 'CTM_END_TIME')+"' "+ms.tdEvent(formId, 'CTM_END_TIME')+">")
            arrHtml.push("<span colno='CTM_END_TIME' class='"+ms.uiClass(formId, 'CTM_END_TIME')+"' style='"+ms.uiStyle(formId, 'CTM_END_TIME')+"' "+ms.uiEvent(formId, 'CTM_END_TIME')+" title='"+ms.titleAttr(formId,'CTM_END_TIME','IS_TITLE_ATTR',v)+"' >"+v['CTM_END_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTM_PASS_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'CTM_PASS_MEMO')+"' style='width:100px;"+ms.tdStyle(formId, 'CTM_PASS_MEMO')+"' "+ms.tdEvent(formId, 'CTM_PASS_MEMO')+">")
            arrHtml.push("<span colno='CTM_PASS_MEMO' class='"+ms.uiClass(formId, 'CTM_PASS_MEMO')+"' style='"+ms.uiStyle(formId, 'CTM_PASS_MEMO')+"' "+ms.uiEvent(formId, 'CTM_PASS_MEMO')+" title='"+ms.titleAttr(formId,'CTM_PASS_MEMO','IS_TITLE_ATTR',v)+"' >"+v['CTM_PASS_MEMO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTM_OPERATOR' class='datagrid-cell "+ms.tdClass(formId, 'CTM_OPERATOR')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CTM_OPERATOR')+"' "+ms.tdEvent(formId, 'CTM_OPERATOR')+">")
            arrHtml.push("<span colno='CTM_OPERATOR' class='"+ms.uiClass(formId, 'CTM_OPERATOR')+"' style='"+ms.uiStyle(formId, 'CTM_OPERATOR')+"' "+ms.uiEvent(formId, 'CTM_OPERATOR')+" title='"+ms.titleAttr(formId,'CTM_OPERATOR','IS_TITLE_ATTR',v)+"' >"+v['CTM_OPERATOR']+"</span>")
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
    setScroll();
}

</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//辅料履历
function itemJump1(obj){
      winOptMethod.jump("c4d83196ce8d43b59a659770faab3b00","F3830","jumpId",obj);
}  


//辅料制具料号
function itemJump2(obj){
    winOptMethod.jump("8d8dfef2f0e140e88073f6cdad4b431d","F3722","jumpId",obj);
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
