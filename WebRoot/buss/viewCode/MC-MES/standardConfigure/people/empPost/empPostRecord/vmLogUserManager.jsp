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
		<dict:lang value="员工上下岗管理" />
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
		<bu:header formId ="43f89808ab3949de950adb237f85eae3"/>

    
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
		<bu:func viewId="2822054c096d4a77a287fae96840a815" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="2822054c096d4a77a287fae96840a815" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage43f89808ab3949de950adb237f85eae3" id="formPage43f89808ab3949de950adb237f85eae3" value="${formPage43f89808ab3949de950adb237f85eae3}"/>
		<input type="hidden" name="formId" id="formId1" value='43f89808ab3949de950adb237f85eae3'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='a2b020a53fc14efa8997ecf136e4c610'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='55c034aed0b94dd48abb6dcb726b0108'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="43f89808ab3949de950adb237f85eae3">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax43f89808ab3949de950adb237f85eae3" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner43f89808ab3949de950adb237f85eae3">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable43f89808ab3949de950adb237f85eae3">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="43f89808ab3949de950adb237f85eae3" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_43f89808ab3949de950adb237f85eae3" onclick="_selectAjaxTableAllData(this,'43f89808ab3949de950adb237f85eae3')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px; text-align:center;"><bu:uitn colNo="DATA_AUTH" formId="43f89808ab3949de950adb237f85eae3" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="T2#NAME" formId="43f89808ab3949de950adb237f85eae3" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center;"><bu:uitn colNo="ON_OFF_TYPE" formId="43f89808ab3949de950adb237f85eae3" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="CA_AREA_SN" formId="43f89808ab3949de950adb237f85eae3" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="T3#CA_NAME" formId="43f89808ab3949de950adb237f85eae3" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center;"><bu:uitn colNo="OP_TIME" formId="43f89808ab3949de950adb237f85eae3" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv43f89808ab3949de950adb237f85eae3" onscroll="ajaxTableScroll(this,'43f89808ab3949de950adb237f85eae3')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax43f89808ab3949de950adb237f85eae3">
		<tbody id="tbody_43f89808ab3949de950adb237f85eae3" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage43f89808ab3949de950adb237f85eae3==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=43f89808ab3949de950adb237f85eae3&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="formPage55c034aed0b94dd48abb6dcb726b0108" id="formPage55c034aed0b94dd48abb6dcb726b0108" value="${formPage55c034aed0b94dd48abb6dcb726b0108}"/>
		<input type="hidden" name="formId" id="formId2" value='55c034aed0b94dd48abb6dcb726b0108'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="55c034aed0b94dd48abb6dcb726b0108">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax55c034aed0b94dd48abb6dcb726b0108" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner55c034aed0b94dd48abb6dcb726b0108">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable55c034aed0b94dd48abb6dcb726b0108">
		<s:set name="_$type" value="'view'" />
		<tbody class="isChildsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="55c034aed0b94dd48abb6dcb726b0108" i18n="1"/></td>
		<!--	<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_55c034aed0b94dd48abb6dcb726b0108" onclick="_selectAjaxTableAllData(this,'55c034aed0b94dd48abb6dcb726b0108')" style="cursor: pointer;"title="全选"/></span></td> -->

			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="USER_ID" formId="55c034aed0b94dd48abb6dcb726b0108" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center;"><bu:uitn colNo="ON_OFF_TYPE" formId="55c034aed0b94dd48abb6dcb726b0108" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="CA_AREA_SN" formId="55c034aed0b94dd48abb6dcb726b0108" /></td>
			
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="CA_WORKSTATION_SN" formId="55c034aed0b94dd48abb6dcb726b0108" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="MO_NUMBER" formId="55c034aed0b94dd48abb6dcb726b0108" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center;"><bu:uitn colNo="OP_TIME" formId="55c034aed0b94dd48abb6dcb726b0108" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv55c034aed0b94dd48abb6dcb726b0108" onscroll="ajaxTableScroll(this,'55c034aed0b94dd48abb6dcb726b0108')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax55c034aed0b94dd48abb6dcb726b0108">
		<tbody id="tbody_55c034aed0b94dd48abb6dcb726b0108" class="isChilds">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage55c034aed0b94dd48abb6dcb726b0108==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listChildAjaxTable&formId=55c034aed0b94dd48abb6dcb726b0108&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" id="relColVals" name="relColVals" value='USER_ID'/>
		<input type="hidden" name="tableCount" id="tableCount" value='2' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="2822054c096d4a77a287fae96840a815" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="2822054c096d4a77a287fae96840a815" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
    
<script>


function reloadPg(msg,title,width,height,time,isCloseWin){
  	msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
}
function reloadPgExe(isCloseWin){
  	query("formId1");
  	if ("0" == isCloseWin || undefined == isCloseWin  ) {
    		top.$(".dialog-close").click();
  	}
   	//checkboxAll("joblist");
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
    if(formId=='43f89808ab3949de950adb237f85eae3'){<%--FM-员工上下岗--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align: center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />  ")
            arrHtml.push("</td>");            
            arrHtml.push("<td colno='T2#NAME' class='datagrid-cell "+ms.tdClass(formId, 'T2#NAME')+"' style='width:150px;text-align: center;"+ms.tdStyle(formId, 'T2#NAME')+"' "+ms.tdEvent(formId, 'T2#NAME')+">")
            arrHtml.push("<span colno='T2#NAME' class='"+ms.uiClass(formId, 'T2#NAME')+"' style='"+ms.uiStyle(formId, 'T2#NAME')+"' "+ms.uiEvent(formId, 'T2#NAME')+" title='"+ms.titleAttr(formId,'T2#NAME','IS_TITLE_ATTR',v)+"' >"+v['T2#NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ON_OFF_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'ON_OFF_TYPE')+"' style='width:100px;"+ms.tdStyle(formId, 'ON_OFF_TYPE')+"' "+ms.tdEvent(formId, 'ON_OFF_TYPE')+">")
            arrHtml.push("<input type='hidden' id='state_"+v.ID+"' value='"+v['ON_OFF_TYPE']+"'/>");
            var styStr ;
            var valStr = v['ON_OFF_TYPE'];
            console.log("valStr==>",valStr);
            if(valStr == 1 ){
                styStr = '<span class="state"style="background-color:#6aa84f;color:#ffffff;width:45px" ><dict:lang value="在岗" /></span>';
            }else{
                styStr = '<span class="state"style="background-color:#666666;color:#FFFFFF;width:45px" ><dict:lang value="离岗" /></span>';
            }
            arrHtml.push("<span colno='ON_OFF_TYPE' class='"+ms.uiClass(formId, 'ON_OFF_TYPE')+"' style='text-align: center;"+ms.uiStyle(formId, 'ON_OFF_TYPE')+"' "+ms.uiEvent(formId, 'ON_OFF_TYPE')+" title='"+ms.titleAttr(formId,'ON_OFF_TYPE','IS_TITLE_ATTR',v)+"' >"+styStr+"</span>")
            arrHtml.push("</td>");
            
            arrHtml.push("<td colno='CA_AREA_SN' class='datagrid-cell "+ms.tdClass(formId, 'CA_AREA_SN')+"' style='width:150px;"+ms.tdStyle(formId, 'CA_AREA_SN')+"' "+ms.tdEvent(formId, 'CA_AREA_SN')+">")
            arrHtml.push("<span colno='CA_AREA_SN' class='"+ms.uiClass(formId, 'CA_AREA_SN')+"' style='"+ms.uiStyle(formId, 'CA_AREA_SN')+"' "+ms.uiEvent(formId, 'CA_AREA_SN')+" title='"+ms.titleAttr(formId,'CA_AREA_SN','IS_TITLE_ATTR',v)+"' >"+v['CA_AREA_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T3#CA_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T3#CA_NAME')+"' style='width:150px;"+ms.tdStyle(formId, 'T3#CA_NAME')+"' "+ms.tdEvent(formId, 'T3#CA_NAME')+">")
            arrHtml.push("<span colno='T3#CA_NAME' class='"+ms.uiClass(formId, 'T3#CA_NAME')+"' style='"+ms.uiStyle(formId, 'T3#CA_NAME')+"' "+ms.uiEvent(formId, 'T3#CA_NAME')+" title='"+ms.titleAttr(formId,'T3#CA_NAME','IS_TITLE_ATTR',v)+"' >"+v['T3#CA_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='OP_TIME' class='datagrid-cell "+ms.tdClass(formId, 'OP_TIME')+"'  style='width:140px;text-align: center;"+ms.tdStyle(formId, 'OP_TIME')+"' "+ms.tdEvent(formId, 'OP_TIME')+">")
            arrHtml.push("<span colno='OP_TIME' class='"+ms.uiClass(formId, 'OP_TIME')+"' style='"+ms.uiStyle(formId, 'OP_TIME')+"' "+ms.uiEvent(formId, 'OP_TIME')+" title='"+ms.titleAttr(formId,'OP_TIME','IS_TITLE_ATTR',v)+"' >"+v['OP_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    if(formId=='55c034aed0b94dd48abb6dcb726b0108'){<%--FM-员工上下岗日志--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
           // arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            //arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
           // arrHtml.push("</td>");
         
            arrHtml.push("<td colno='USER_ID' class='datagrid-cell "+ms.tdClass(formId, 'USER_ID')+"' style='width:150px;text-align: center;"+ms.tdStyle(formId, 'USER_ID')+"' "+ms.tdEvent(formId, 'USER_ID')+">")
            arrHtml.push("<span colno='USER_ID' class='"+ms.uiClass(formId, 'USER_ID')+"' style='"+ms.uiStyle(formId, 'USER_ID')+"' "+ms.uiEvent(formId, 'USER_ID')+" title='"+ms.titleAttr(formId,'USER_ID','IS_TITLE_ATTR',v)+"' >"+v['USER_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ON_OFF_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'ON_OFF_TYPE')+"' style='width:100px;"+ms.tdStyle(formId, 'ON_OFF_TYPE')+"' "+ms.tdEvent(formId, 'ON_OFF_TYPE')+">")
            arrHtml.push("<span colno='ON_OFF_TYPE' class='"+ms.uiClass(formId, 'ON_OFF_TYPE')+"' style='text-align: center;"+ms.uiStyle(formId, 'ON_OFF_TYPE')+"' "+ms.uiEvent(formId, 'ON_OFF_TYPE')+" title='"+ms.titleAttr(formId,'ON_OFF_TYPE','IS_TITLE_ATTR',v)+"' >"+v['ON_OFF_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CA_AREA_SN' class='datagrid-cell "+ms.tdClass(formId, 'CA_AREA_SN')+"' style='width:150px;text-align: center;"+ms.tdStyle(formId, 'CA_AREA_SN')+"' "+ms.tdEvent(formId, 'CA_AREA_SN')+">")
            arrHtml.push("<span colno='CA_AREA_SN' class='"+ms.uiClass(formId, 'CA_AREA_SN')+"' style='"+ms.uiStyle(formId, 'CA_AREA_SN')+"' "+ms.uiEvent(formId, 'CA_AREA_SN')+" title='"+ms.titleAttr(formId,'CA_AREA_SN','IS_TITLE_ATTR',v)+"' >"+v['CA_AREA_SN']+"</span>")
            arrHtml.push("</td>");
            
            arrHtml.push("<td colno='CA_WORKSTATION_SN' class='datagrid-cell "+ms.tdClass(formId, 'CA_WORKSTATION_SN')+"' style='width:150px;"+ms.tdStyle(formId, 'CA_WORKSTATION_SN')+"' "+ms.tdEvent(formId, 'CA_WORKSTATION_SN')+">")
            arrHtml.push("<span colno='CA_WORKSTATION_SN' class='"+ms.uiClass(formId, 'CA_WORKSTATION_SN')+"' style='"+ms.uiStyle(formId, 'CA_WORKSTATION_SN')+"' "+ms.uiEvent(formId, 'CA_WORKSTATION_SN')+" title='"+ms.titleAttr(formId,'CA_WORKSTATION_SN','IS_TITLE_ATTR',v)+"' >"+v['CA_WORKSTATION_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'MO_NUMBER')+"' style='width:150px;"+ms.tdStyle(formId, 'MO_NUMBER')+"' "+ms.tdEvent(formId, 'MO_NUMBER')+">")
            arrHtml.push("<span colno='MO_NUMBER' class='"+ms.uiClass(formId, 'MO_NUMBER')+"' onclick='itemJump1(\""+v['MO_NUMBER']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'MO_NUMBER')+" title='"+ms.titleAttr(formId,'MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='OP_TIME' class='datagrid-cell "+ms.tdClass(formId, 'OP_TIME')+"' style='width:140px;"+ms.tdStyle(formId, 'OP_TIME')+"' "+ms.tdEvent(formId, 'OP_TIME')+">")
            arrHtml.push("<span colno='OP_TIME' class='"+ms.uiClass(formId, 'OP_TIME')+"' style='text-align: center;"+ms.uiStyle(formId, 'OP_TIME')+"' "+ms.uiEvent(formId, 'OP_TIME')+" title='"+ms.titleAttr(formId,'OP_TIME','IS_TITLE_ATTR',v)+"' >"+v['OP_TIME']+"</span>")
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

//制令单信息
function itemJump1(obj){
      winOptMethod.jump("7d0349f7a60b405299af347205b1d92f","F3454","jumpId",obj);
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
