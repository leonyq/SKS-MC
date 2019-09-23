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
		<dict:lang value="cyq员工信息" />
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
		<bu:header formId ="d99fc511a0c74441b9fc6c901eda02ac"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
</head>

<body scroll="auto" style="overflow: auto;" >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="cb5da1c7bbca4bd594b25548943bb368" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="cb5da1c7bbca4bd594b25548943bb368" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPaged99fc511a0c74441b9fc6c901eda02ac" id="formPaged99fc511a0c74441b9fc6c901eda02ac" value="${formPaged99fc511a0c74441b9fc6c901eda02ac}"/>
		<input type="hidden" name="formId" id="formId1" value='d99fc511a0c74441b9fc6c901eda02ac'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="d99fc511a0c74441b9fc6c901eda02ac">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxd99fc511a0c74441b9fc6c901eda02ac" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerd99fc511a0c74441b9fc6c901eda02ac">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htabled99fc511a0c74441b9fc6c901eda02ac">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="d99fc511a0c74441b9fc6c901eda02ac" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_d99fc511a0c74441b9fc6c901eda02ac" onclick="_selectAjaxTableAllData(this,'d99fc511a0c74441b9fc6c901eda02ac')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="SNO" formId="d99fc511a0c74441b9fc6c901eda02ac" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="NAME" formId="d99fc511a0c74441b9fc6c901eda02ac" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="SEX" formId="d99fc511a0c74441b9fc6c901eda02ac" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="AGE" formId="d99fc511a0c74441b9fc6c901eda02ac" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="NATION" formId="d99fc511a0c74441b9fc6c901eda02ac" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="XUELI" formId="d99fc511a0c74441b9fc6c901eda02ac" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="HOBBY" formId="d99fc511a0c74441b9fc6c901eda02ac" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="SCORE" formId="d99fc511a0c74441b9fc6c901eda02ac" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PHOME" formId="d99fc511a0c74441b9fc6c901eda02ac" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="BIRTH" formId="d99fc511a0c74441b9fc6c901eda02ac" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PROVINCE" formId="d99fc511a0c74441b9fc6c901eda02ac" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CITY" formId="d99fc511a0c74441b9fc6c901eda02ac" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PHOTO" formId="d99fc511a0c74441b9fc6c901eda02ac" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WENJIAN" formId="d99fc511a0c74441b9fc6c901eda02ac" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="BEIZHU" formId="d99fc511a0c74441b9fc6c901eda02ac" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="ZHUCE" formId="d99fc511a0c74441b9fc6c901eda02ac" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="MOREN" formId="d99fc511a0c74441b9fc6c901eda02ac" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WU_NAME" formId="d99fc511a0c74441b9fc6c901eda02ac" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WU_CODE" formId="d99fc511a0c74441b9fc6c901eda02ac" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WU_SPEC" formId="d99fc511a0c74441b9fc6c901eda02ac" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TIME" formId="d99fc511a0c74441b9fc6c901eda02ac" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PASTEPHOTO" formId="d99fc511a0c74441b9fc6c901eda02ac" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivd99fc511a0c74441b9fc6c901eda02ac" onscroll="ajaxTableScroll(this,'d99fc511a0c74441b9fc6c901eda02ac')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxd99fc511a0c74441b9fc6c901eda02ac">
		<tbody id="tbody_d99fc511a0c74441b9fc6c901eda02ac" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPaged99fc511a0c74441b9fc6c901eda02ac==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=d99fc511a0c74441b9fc6c901eda02ac&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="cb5da1c7bbca4bd594b25548943bb368" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="cb5da1c7bbca4bd594b25548943bb368" />
    
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
    if(formId=='d99fc511a0c74441b9fc6c901eda02ac'){<%--cyq员工信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SNO' class='datagrid-cell "+ms.tdClass(formId, 'SNO')+"' style='"+ms.tdStyle(formId, 'SNO')+"' "+ms.tdEvent(formId, 'SNO')+">")
            arrHtml.push("<span colno='SNO' class='"+ms.uiClass(formId, 'SNO')+"' style='"+ms.uiStyle(formId, 'SNO')+"' "+ms.uiEvent(formId, 'SNO')+" title='"+ms.titleAttr(formId,'SNO','IS_TITLE_ATTR',v)+"' >"+v['SNO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='NAME' class='datagrid-cell "+ms.tdClass(formId, 'NAME')+"' style='"+ms.tdStyle(formId, 'NAME')+"' "+ms.tdEvent(formId, 'NAME')+">")
            arrHtml.push("<span colno='NAME' class='"+ms.uiClass(formId, 'NAME')+"' style='"+ms.uiStyle(formId, 'NAME')+"' "+ms.uiEvent(formId, 'NAME')+" title='"+ms.titleAttr(formId,'NAME','IS_TITLE_ATTR',v)+"' >"+v['NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SEX' class='datagrid-cell "+ms.tdClass(formId, 'SEX')+"' style='"+ms.tdStyle(formId, 'SEX')+"' "+ms.tdEvent(formId, 'SEX')+">")
            arrHtml.push("<span colno='SEX' class='"+ms.uiClass(formId, 'SEX')+"' style='"+ms.uiStyle(formId, 'SEX')+"' "+ms.uiEvent(formId, 'SEX')+" title='"+ms.titleAttr(formId,'SEX','IS_TITLE_ATTR',v)+"' >"+v['SEX']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='AGE' class='datagrid-cell "+ms.tdClass(formId, 'AGE')+"' style='"+ms.tdStyle(formId, 'AGE')+"' "+ms.tdEvent(formId, 'AGE')+">")
            arrHtml.push("<span colno='AGE' class='"+ms.uiClass(formId, 'AGE')+"' style='"+ms.uiStyle(formId, 'AGE')+"' "+ms.uiEvent(formId, 'AGE')+" title='"+ms.titleAttr(formId,'AGE','IS_TITLE_ATTR',v)+"' >"+v['AGE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='NATION' class='datagrid-cell "+ms.tdClass(formId, 'NATION')+"' style='"+ms.tdStyle(formId, 'NATION')+"' "+ms.tdEvent(formId, 'NATION')+">")
            arrHtml.push("<span colno='NATION' class='"+ms.uiClass(formId, 'NATION')+"' style='"+ms.uiStyle(formId, 'NATION')+"' "+ms.uiEvent(formId, 'NATION')+" title='"+ms.titleAttr(formId,'NATION','IS_TITLE_ATTR',v)+"' >"+v['NATION']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='XUELI' class='datagrid-cell "+ms.tdClass(formId, 'XUELI')+"' style='"+ms.tdStyle(formId, 'XUELI')+"' "+ms.tdEvent(formId, 'XUELI')+">")
            arrHtml.push("<span colno='XUELI' class='"+ms.uiClass(formId, 'XUELI')+"' style='"+ms.uiStyle(formId, 'XUELI')+"' "+ms.uiEvent(formId, 'XUELI')+" title='"+ms.titleAttr(formId,'XUELI','IS_TITLE_ATTR',v)+"' >"+v['XUELI']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='HOBBY' class='datagrid-cell "+ms.tdClass(formId, 'HOBBY')+"' style='"+ms.tdStyle(formId, 'HOBBY')+"' "+ms.tdEvent(formId, 'HOBBY')+">")
            arrHtml.push("<span colno='HOBBY' class='"+ms.uiClass(formId, 'HOBBY')+"' style='"+ms.uiStyle(formId, 'HOBBY')+"' "+ms.uiEvent(formId, 'HOBBY')+" title='"+ms.titleAttr(formId,'HOBBY','IS_TITLE_ATTR',v)+"' >"+v['HOBBY']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SCORE' class='datagrid-cell "+ms.tdClass(formId, 'SCORE')+"' style='"+ms.tdStyle(formId, 'SCORE')+"' "+ms.tdEvent(formId, 'SCORE')+">")
            arrHtml.push("<span colno='SCORE' class='"+ms.uiClass(formId, 'SCORE')+"' style='"+ms.uiStyle(formId, 'SCORE')+"' "+ms.uiEvent(formId, 'SCORE')+" title='"+ms.titleAttr(formId,'SCORE','IS_TITLE_ATTR',v)+"' >"+v['SCORE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PHOME' class='datagrid-cell "+ms.tdClass(formId, 'PHOME')+"' style='"+ms.tdStyle(formId, 'PHOME')+"' "+ms.tdEvent(formId, 'PHOME')+">")
            arrHtml.push("<span colno='PHOME' class='"+ms.uiClass(formId, 'PHOME')+"' style='"+ms.uiStyle(formId, 'PHOME')+"' "+ms.uiEvent(formId, 'PHOME')+" title='"+ms.titleAttr(formId,'PHOME','IS_TITLE_ATTR',v)+"' >"+v['PHOME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='BIRTH' class='datagrid-cell "+ms.tdClass(formId, 'BIRTH')+"' style='"+ms.tdStyle(formId, 'BIRTH')+"' "+ms.tdEvent(formId, 'BIRTH')+">")
            arrHtml.push("<span colno='BIRTH' class='"+ms.uiClass(formId, 'BIRTH')+"' style='"+ms.uiStyle(formId, 'BIRTH')+"' "+ms.uiEvent(formId, 'BIRTH')+" title='"+ms.titleAttr(formId,'BIRTH','IS_TITLE_ATTR',v)+"' >"+v['BIRTH']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PROVINCE' class='datagrid-cell "+ms.tdClass(formId, 'PROVINCE')+"' style='"+ms.tdStyle(formId, 'PROVINCE')+"' "+ms.tdEvent(formId, 'PROVINCE')+">")
            arrHtml.push("<span colno='PROVINCE' class='"+ms.uiClass(formId, 'PROVINCE')+"' style='"+ms.uiStyle(formId, 'PROVINCE')+"' "+ms.uiEvent(formId, 'PROVINCE')+" title='"+ms.titleAttr(formId,'PROVINCE','IS_TITLE_ATTR',v)+"' >"+v['PROVINCE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CITY' class='datagrid-cell "+ms.tdClass(formId, 'CITY')+"' style='"+ms.tdStyle(formId, 'CITY')+"' "+ms.tdEvent(formId, 'CITY')+">")
            arrHtml.push("<span colno='CITY' class='"+ms.uiClass(formId, 'CITY')+"' style='"+ms.uiStyle(formId, 'CITY')+"' "+ms.uiEvent(formId, 'CITY')+" title='"+ms.titleAttr(formId,'CITY','IS_TITLE_ATTR',v)+"' >"+v['CITY']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PHOTO' class='datagrid-cell "+ms.tdClass(formId, 'PHOTO')+"' style='"+ms.tdStyle(formId, 'PHOTO')+"' "+ms.tdEvent(formId, 'PHOTO')+">")
            arrHtml.push("<span colno='PHOTO' class='"+ms.uiClass(formId, 'PHOTO')+"' style='"+ms.uiStyle(formId, 'PHOTO')+"' "+ms.uiEvent(formId, 'PHOTO')+" title='"+ms.titleAttr(formId,'PHOTO','IS_TITLE_ATTR',v)+"' >"+v['PHOTO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WENJIAN' class='datagrid-cell "+ms.tdClass(formId, 'WENJIAN')+"' style='"+ms.tdStyle(formId, 'WENJIAN')+"' "+ms.tdEvent(formId, 'WENJIAN')+">")
            arrHtml.push("<span colno='WENJIAN' class='"+ms.uiClass(formId, 'WENJIAN')+"' style='"+ms.uiStyle(formId, 'WENJIAN')+"' "+ms.uiEvent(formId, 'WENJIAN')+" title='"+ms.titleAttr(formId,'WENJIAN','IS_TITLE_ATTR',v)+"' >"+v['WENJIAN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='BEIZHU' class='datagrid-cell "+ms.tdClass(formId, 'BEIZHU')+"' style='"+ms.tdStyle(formId, 'BEIZHU')+"' "+ms.tdEvent(formId, 'BEIZHU')+">")
            arrHtml.push("<span colno='BEIZHU' class='"+ms.uiClass(formId, 'BEIZHU')+"' style='"+ms.uiStyle(formId, 'BEIZHU')+"' "+ms.uiEvent(formId, 'BEIZHU')+" title='"+ms.titleAttr(formId,'BEIZHU','IS_TITLE_ATTR',v)+"' >"+v['BEIZHU']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ZHUCE' class='datagrid-cell "+ms.tdClass(formId, 'ZHUCE')+"' style='"+ms.tdStyle(formId, 'ZHUCE')+"' "+ms.tdEvent(formId, 'ZHUCE')+">")
            arrHtml.push("<span colno='ZHUCE' class='"+ms.uiClass(formId, 'ZHUCE')+"' style='"+ms.uiStyle(formId, 'ZHUCE')+"' "+ms.uiEvent(formId, 'ZHUCE')+" title='"+ms.titleAttr(formId,'ZHUCE','IS_TITLE_ATTR',v)+"' >"+v['ZHUCE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MOREN' class='datagrid-cell "+ms.tdClass(formId, 'MOREN')+"' style='"+ms.tdStyle(formId, 'MOREN')+"' "+ms.tdEvent(formId, 'MOREN')+">")
            arrHtml.push("<span colno='MOREN' class='"+ms.uiClass(formId, 'MOREN')+"' style='"+ms.uiStyle(formId, 'MOREN')+"' "+ms.uiEvent(formId, 'MOREN')+" title='"+ms.titleAttr(formId,'MOREN','IS_TITLE_ATTR',v)+"' >"+v['MOREN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WU_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WU_NAME')+"' style='"+ms.tdStyle(formId, 'WU_NAME')+"' "+ms.tdEvent(formId, 'WU_NAME')+">")
            arrHtml.push("<span colno='WU_NAME' class='"+ms.uiClass(formId, 'WU_NAME')+"' style='"+ms.uiStyle(formId, 'WU_NAME')+"' "+ms.uiEvent(formId, 'WU_NAME')+" title='"+ms.titleAttr(formId,'WU_NAME','IS_TITLE_ATTR',v)+"' >"+v['WU_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WU_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WU_CODE')+"' style='"+ms.tdStyle(formId, 'WU_CODE')+"' "+ms.tdEvent(formId, 'WU_CODE')+">")
            arrHtml.push("<span colno='WU_CODE' class='"+ms.uiClass(formId, 'WU_CODE')+"' style='"+ms.uiStyle(formId, 'WU_CODE')+"' "+ms.uiEvent(formId, 'WU_CODE')+" title='"+ms.titleAttr(formId,'WU_CODE','IS_TITLE_ATTR',v)+"' >"+v['WU_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WU_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'WU_SPEC')+"' style='"+ms.tdStyle(formId, 'WU_SPEC')+"' "+ms.tdEvent(formId, 'WU_SPEC')+">")
            arrHtml.push("<span colno='WU_SPEC' class='"+ms.uiClass(formId, 'WU_SPEC')+"' style='"+ms.uiStyle(formId, 'WU_SPEC')+"' "+ms.uiEvent(formId, 'WU_SPEC')+" title='"+ms.titleAttr(formId,'WU_SPEC','IS_TITLE_ATTR',v)+"' >"+v['WU_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TIME' class='datagrid-cell "+ms.tdClass(formId, 'TIME')+"' style='"+ms.tdStyle(formId, 'TIME')+"' "+ms.tdEvent(formId, 'TIME')+">")
            arrHtml.push("<span colno='TIME' class='"+ms.uiClass(formId, 'TIME')+"' style='"+ms.uiStyle(formId, 'TIME')+"' "+ms.uiEvent(formId, 'TIME')+" title='"+ms.titleAttr(formId,'TIME','IS_TITLE_ATTR',v)+"' >"+v['TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PASTEPHOTO' class='datagrid-cell "+ms.tdClass(formId, 'PASTEPHOTO')+"' style='"+ms.tdStyle(formId, 'PASTEPHOTO')+"' "+ms.tdEvent(formId, 'PASTEPHOTO')+">")
            arrHtml.push("<span colno='PASTEPHOTO' class='"+ms.uiClass(formId, 'PASTEPHOTO')+"' style='"+ms.uiStyle(formId, 'PASTEPHOTO')+"' "+ms.uiEvent(formId, 'PASTEPHOTO')+" title='"+ms.titleAttr(formId,'PASTEPHOTO','IS_TITLE_ATTR',v)+"' >"+v['PASTEPHOTO']+"</span>")
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
    if(isFirstSetScroll == 0){setScroll();}
    isFirstSetScroll++;
}
</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
