<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
    <title>
		<dict:lang value="VM-辅料回温信息-列表" />
    </title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" />
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="776a9d93290b4cef813dc66f100cbe1e"/>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>

</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="ad8bcc12be0843fe9e80aa3fa241033b" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                      </jsp:include>
		<bu:search viewId="ad8bcc12be0843fe9e80aa3fa241033b" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                   <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage776a9d93290b4cef813dc66f100cbe1e" id="formPage776a9d93290b4cef813dc66f100cbe1e" value="${formPage776a9d93290b4cef813dc66f100cbe1e}"/>
		<input type="hidden" name="formId" id="formId1" value='776a9d93290b4cef813dc66f100cbe1e'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="776a9d93290b4cef813dc66f100cbe1e">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax776a9d93290b4cef813dc66f100cbe1e" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner776a9d93290b4cef813dc66f100cbe1e">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable776a9d93290b4cef813dc66f100cbe1e" style="min-width:1660px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="776a9d93290b4cef813dc66f100cbe1e" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_776a9d93290b4cef813dc66f100cbe1e" onclick="_selectAjaxTableAllData(this,'776a9d93290b4cef813dc66f100cbe1e')" style="cursor: pointer;"title="全选"/></span></td>
		    <td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<td class="datagrid-cell" style="width:210px;"><bu:uitn colNo="CTT_TIN_SN" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="THA_TIN_STATUS" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CTT_PASS_FLAG" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CTT_ITEM_TYPE" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CTT_ITEM_CODE" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="THA_TOOL_NAME" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="THA_TOOLSPEC" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="THA_TIME_TOTAL" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="THA_TIME_MAX" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="THA_CYCLE" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CTT_BEGIN_TIME" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CTT_EXPECT_TIME" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CTT_MAX_TIME" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CTT_END_TIME" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
		
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CTT_OPERATOR" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			
				<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="CTT_PASS_MEMO" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv776a9d93290b4cef813dc66f100cbe1e" onscroll="ajaxTableScroll(this,'776a9d93290b4cef813dc66f100cbe1e')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax776a9d93290b4cef813dc66f100cbe1e" style="min-width:1660px;">
		<tbody id="tbody_776a9d93290b4cef813dc66f100cbe1e" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage776a9d93290b4cef813dc66f100cbe1e==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=776a9d93290b4cef813dc66f100cbe1e&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
        <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
        </jsp:include>
        <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        	<jsp:param name="modelName" value="VIEW_TYPE_17" />
        	<jsp:param name="location" value="jsLoading" />
        </jsp:include>
		<bu:submit viewId="ad8bcc12be0843fe9e80aa3fa241033b" />
		<bu:script viewId="ad8bcc12be0843fe9e80aa3fa241033b" />
<script>

<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    if(formId=='776a9d93290b4cef813dc66f100cbe1e'){<%--FM-辅料回温信息表--%>
        $.each(uiTxt,function(i,v){
        
            var expect_time = v['CTT_EXPECT_TIME'];
           
            var nowDate=new Date();
           
            
            var ctt_expect_time_todate=new Date(expect_time);
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            var tinSN=v['CTT_TIN_SN'];
            var itemCode=v['CTT_ITEM_CODE'];
            var name=v['THA_TOOL_NAME'];
            var spec=v['THA_TOOLSPEC'];
            var endTime=v['CTT_END_TIME'];
             var maxCycle=v['CTT_THAWING_MAX_CYCLE'];
             var beginTime=v['CTT_BEGIN_TIME'];
             var cttMaxCycle=maxCycle*60*1000;
             var cttBeginTime=new Date(beginTime);
             var thawingCycle =v['CTT_THAWING_CYCLE'];
             var cttThawingCycle = thawingCycle*60*1000;

             
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
             arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTT_TIN_SN' title='"+tinSN+"' class='datagrid-cell "+ms.tdClass(formId, 'CTT_TIN_SN')+"' style='width:210px;"+ms.tdStyle(formId, 'CTT_TIN_SN')+"' "+ms.tdEvent(formId, 'CTT_TIN_SN')+">")
            arrHtml.push("<span colno='CTT_TIN_SN' class='"+ms.uiClass(formId, 'CTT_TIN_SN')+"' onclick='itemJump1(\""+v['CTT_TIN_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CTT_TIN_SN')+" >"+v['CTT_TIN_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='THA_TIN_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'THA_TIN_STATUS')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'THA_TIN_STATUS')+"' "+ms.tdEvent(formId, 'THA_TIN_STATUS')+">")
            
           // arrHtml.push("<td colno='THA_TIN_STATUS' title='"+tinSN+"' class='datagrid-cell "+ms.tdClass(formId, 'THA_TIN_STATUS')+"' style='width:70px;"+ms.tdStyle(formId, 'THA_TIN_STATUS')+"' "+ms.tdEvent(formId, 'THA_TIN_STATUS')+">")
          //  arrHtml.push("<span colno='THA_TIN_STATUS' class='"+ms.uiClass(formId, 'THA_TIN_STATUS')+"' style='"+ms.uiStyle(formId, 'THA_TIN_STATUS')+"' "+ms.uiEvent(formId, 'THA_TIN_STATUS')+" >"+v['THA_TIN_STATUS']+"</span>")
           // arrHtml.push("</td>");
            
            
            //arrHtml.push("<span colno='THA_TIN_STATUS' class='"+ms.uiClass(formId, 'THA_TIN_STATUS')+"' style='"+ms.uiStyle(formId, 'THA_TIN_STATUS')+"' "+ms.uiEvent(formId, 'THA_TIN_STATUS')+" >"+1+"</span>")
            //console.log(v['T2#CTI_TIN_STATUS']);
            //if(v['T2#CTI_TIN_STATUS']=="7"){
            //    arrHtml.push("<span style='color:#FFFFFF;width:60px;display: inline-block;background-color:#E35850;border-radius:2px;' class='state fixedTable dlist-table'>搅拌</span>")
            //}else{
                	console.log((cttBeginTime.getTime()+ cttMaxCycle));
                	console.log(nowDate.getTime());
                if(null==endTime||endTime==""　){
                    if((cttBeginTime.getTime()+ cttThawingCycle)<=nowDate.getTime() && (cttBeginTime.getTime()+ cttThawingCycle)<=(cttBeginTime.getTime()+ cttMaxCycle) && nowDate.getTime()<=(cttBeginTime.getTime()+ cttMaxCycle)){
                       arrHtml.push("<span style='color:#FFFFFF;width:60px;display: inline-block;background-color:#aeaeae;border-radius:2px;' class='state fixedTable dlist-table'>回温结束</span>") 
                    }else if(nowDate.getTime()<=ctt_expect_time_todate.getTime()){
                         arrHtml.push("<span style='color:#FFFFFF;width:60px;display: inline-block;background-color:#00a0e9;border-radius:2px;' class='state fixedTable dlist-table'>回温中</span>")
                    }else if((cttBeginTime.getTime()+ cttMaxCycle)>nowDate.getTime() &&　nowDate>(cttBeginTime.getTime()+ cttThawingCycle)　){
                        arrHtml.push("<span style='color:#FFFFFF;width:60px;display: inline-block;background-color:#ff0000;border-radius:2px;' class='state fixedTable dlist-table'>回温完成</span>")
                    }else if((cttBeginTime.getTime()+ cttMaxCycle)<nowDate.getTime()){
                        arrHtml.push("<span style='color:#FFFFFF;width:60px;display: inline-block;background-color:#dd4b39;border-radius:2px;' class='state fixedTable dlist-table'>回温超时</span>")
                    }    	
                     
                }else{
                    
                    
                    arrHtml.push("<span style='color:#FFFFFF;width:60px;display: inline-block;background-color:#aeaeae;border-radius:2px;' class='state fixedTable dlist-table'>回温结束</span>")
                }
            //}
            arrHtml.push("</td>");
           
            
            arrHtml.push("<td colno='CTT_PASS_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'CTT_PASS_FLAG')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'CTT_PASS_FLAG')+"' "+ms.tdEvent(formId, 'CTT_PASS_FLAG')+">")
            arrHtml.push("<span colno='CTT_PASS_FLAG' class='"+ms.uiClass(formId, 'CTT_PASS_FLAG')+"' style='"+ms.uiStyle(formId, 'CTT_PASS_FLAG')+"' "+ms.uiEvent(formId, 'CTT_PASS_FLAG')+" >"+v['CTT_PASS_FLAG']+"</span>")
            arrHtml.push("</td>");
            
            arrHtml.push("<td colno='CTT_ITEM_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CTT_ITEM_TYPE')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'CTT_ITEM_TYPE')+"' "+ms.tdEvent(formId, 'CTT_ITEM_TYPE')+">")
            arrHtml.push("<span colno='CTT_ITEM_TYPE' class='"+ms.uiClass(formId, 'CTT_ITEM_TYPE')+"' style='"+ms.uiStyle(formId, 'CTT_ITEM_TYPE')+"' "+ms.uiEvent(formId, 'CTT_ITEM_TYPE')+" >"+v['CTT_ITEM_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTT_ITEM_CODE' title='"+itemCode+"' class='datagrid-cell "+ms.tdClass(formId, 'CTT_ITEM_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'CTT_ITEM_CODE')+"' "+ms.tdEvent(formId, 'CTT_ITEM_CODE')+">")
            arrHtml.push("<span colno='CTT_ITEM_CODE' class='"+ms.uiClass(formId, 'CTT_ITEM_CODE')+"' onclick='itemJump2(\""+v['CTT_ITEM_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CTT_ITEM_CODE')+" >"+v['CTT_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='THA_TOOL_NAME' title='"+name+"' class='datagrid-cell "+ms.tdClass(formId, 'THA_TOOL_NAME')+"' style='width:120px;"+ms.tdStyle(formId, 'THA_TOOL_NAME')+"' "+ms.tdEvent(formId, 'THA_TOOL_NAME')+">")
            arrHtml.push("<span colno='THA_TOOL_NAME' class='"+ms.uiClass(formId, 'THA_TOOL_NAME')+"' style='"+ms.uiStyle(formId, 'THA_TOOL_NAME')+"' "+ms.uiEvent(formId, 'THA_TOOL_NAME')+" >"+v['THA_TOOL_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='THA_TOOLSPEC' title='"+spec+"' class='datagrid-cell "+ms.tdClass(formId, 'THA_TOOLSPEC')+"' style='width:150px;"+ms.tdStyle(formId, 'THA_TOOLSPEC')+"' "+ms.tdEvent(formId, 'THA_TOOLSPEC')+">")
            arrHtml.push("<span colno='THA_TOOLSPEC' class='"+ms.uiClass(formId, 'THA_TOOLSPEC')+"' style='"+ms.uiStyle(formId, 'THA_TOOLSPEC')+"' "+ms.uiEvent(formId, 'THA_TOOLSPEC')+" >"+v['THA_TOOLSPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='THA_TIME_TOTAL' class='datagrid-cell "+ms.tdClass(formId, 'THA_TIME_TOTAL')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'THA_TIME_TOTAL')+"' "+ms.tdEvent(formId, 'THA_TIME_TOTAL')+">")
            arrHtml.push("<span colno='THA_TIME_TOTAL' class='"+ms.uiClass(formId, 'THA_TIME_TOTAL')+"' style='"+ms.uiStyle(formId, 'THA_TIME_TOTAL')+"' "+ms.uiEvent(formId, 'THA_TIME_TOTAL')+" >"+v['THA_TIME_TOTAL']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='THA_TIME_MAX' class='datagrid-cell "+ms.tdClass(formId, 'THA_TIME_MAX')+"' style='width:120px;text-align:right;"+ms.tdStyle(formId, 'THA_TIME_MAX')+"' "+ms.tdEvent(formId, 'THA_TIME_MAX')+">")
            arrHtml.push("<span colno='THA_TIME_MAX' class='"+ms.uiClass(formId, 'THA_TIME_MAX')+"' style='"+ms.uiStyle(formId, 'THA_TIME_MAX')+"' "+ms.uiEvent(formId, 'THA_TIME_MAX')+" >"+v['THA_TIME_MAX']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='THA_CYCLE' class='datagrid-cell "+ms.tdClass(formId, 'THA_CYCLE')+"' style='width:120px;text-align:right;"+ms.tdStyle(formId, 'THA_CYCLE')+"' "+ms.tdEvent(formId, 'THA_CYCLE')+">")
            arrHtml.push("<span colno='THA_CYCLE' class='"+ms.uiClass(formId, 'THA_CYCLE')+"' style='"+ms.uiStyle(formId, 'THA_CYCLE')+"' "+ms.uiEvent(formId, 'THA_CYCLE')+" >"+v['THA_CYCLE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTT_BEGIN_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CTT_BEGIN_TIME')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'CTT_BEGIN_TIME')+"' "+ms.tdEvent(formId, 'CTT_BEGIN_TIME')+">")
            arrHtml.push("<span colno='CTT_BEGIN_TIME' class='"+ms.uiClass(formId, 'CTT_BEGIN_TIME')+"' style='"+ms.uiStyle(formId, 'CTT_BEGIN_TIME')+"' "+ms.uiEvent(formId, 'CTT_BEGIN_TIME')+" >"+v['CTT_BEGIN_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTT_EXPECT_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CTT_EXPECT_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CTT_EXPECT_TIME')+"' "+ms.tdEvent(formId, 'CTT_EXPECT_TIME')+">")
            arrHtml.push("<span colno='CTT_EXPECT_TIME' class='"+ms.uiClass(formId, 'CTT_EXPECT_TIME')+"' style='"+ms.uiStyle(formId, 'CTT_EXPECT_TIME')+"' "+ms.uiEvent(formId, 'CTT_EXPECT_TIME')+" >"+v['CTT_EXPECT_TIME']+"</span>")
            arrHtml.push("</td>");
            
            arrHtml.push("<td colno='CTT_MAX_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CTT_MAX_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CTT_MAX_TIME')+"' "+ms.tdEvent(formId, 'CTT_MAX_TIME')+">")
            arrHtml.push("<span colno='CTT_MAX_TIME' class='"+ms.uiClass(formId, 'CTT_MAX_TIME')+"' style='"+ms.uiStyle(formId, 'CTT_MAX_TIME')+"' "+ms.uiEvent(formId, 'CTT_MAX_TIME')+" >"+v['CTT_MAX_TIME']+"</span>")
            arrHtml.push("</td>");
            
            arrHtml.push("<td colno='CTT_END_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CTT_END_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CTT_END_TIME')+"' "+ms.tdEvent(formId, 'CTT_END_TIME')+">")
            arrHtml.push("<span colno='CTT_END_TIME' class='"+ms.uiClass(formId, 'CTT_END_TIME')+"' style='"+ms.uiStyle(formId, 'CTT_END_TIME')+"' "+ms.uiEvent(formId, 'CTT_END_TIME')+" >"+v['CTT_END_TIME']+"</span>")
            arrHtml.push("</td>");
            
            arrHtml.push("<td colno='CTT_OPERATOR' class='datagrid-cell "+ms.tdClass(formId, 'CTT_OPERATOR')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CTT_OPERATOR')+"' "+ms.tdEvent(formId, 'CTT_OPERATOR')+">")
            arrHtml.push("<span colno='CTT_OPERATOR' class='"+ms.uiClass(formId, 'CTT_OPERATOR')+"' style='"+ms.uiStyle(formId, 'CTT_OPERATOR')+"' "+ms.uiEvent(formId, 'CTT_OPERATOR')+" >"+v['CTT_OPERATOR']+"</span>")
            arrHtml.push("</td>");
            
             arrHtml.push("<td colno='CTT_PASS_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'CTT_PASS_MEMO')+"' style='width:200px;text-align:left;"+ms.tdStyle(formId, 'CTT_PASS_MEMO')+"' "+ms.tdEvent(formId, 'CTT_PASS_MEMO')+">")
            arrHtml.push("<span colno='CTT_PASS_MEMO' class='"+ms.uiClass(formId, 'CTT_PASS_MEMO')+"' style='"+ms.uiStyle(formId, 'CTT_PASS_MEMO')+"' "+ms.uiEvent(formId, 'CTT_PASS_MEMO')+" >"+v['CTT_PASS_MEMO']+"</span>")
            arrHtml.push("</td>");
            
            
            arrHtml.push("</tr>");
               
        
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    setNumColWidth(formId);
    clearAllSelect();
    //setTableWidth(formId);
    
    if(isFirstSetScroll == 0){
    	isFirstSetScroll =1;
    	setScroll();
    }
    
  
    
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
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
