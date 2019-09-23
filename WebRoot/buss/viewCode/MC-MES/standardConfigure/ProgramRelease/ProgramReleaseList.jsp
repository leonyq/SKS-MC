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
		<dict:lang value="VM-程序发布列表" />
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
		<bu:header formId ="2a9942a26d914db48edc771637fd9721"/>

    
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
		<bu:func viewId="bbff96eebb1f41a3ac5d8a45bef8731b" />
            </div>
                        <div class="bd">
               <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>  
                     

  <table class="search_table">
     <!-- <bu:search deal_mark="1" viewId="bbff96eebb1f41a3ac5d8a45bef8731b" /> -->

<tbody><tr>
<td>      <div class="group"><div class="name" title="模糊">文件名称</div><div class="dec">	<input type="text" class="input" id="CAU_NAME" name="searchParaList[0]._PAGE_SEARCH_VALUE" value="" onkeypress="_checkEnterSeach(event);" save_mark="0">
<script>
    $(function()
 {
   var obj = document.getElementById("CAU_NAME");
   var json = ;
   obj.validateJson = json;
   addLoadEvent(function () 
   {
   initValidate(obj);
   });
 });
</script>
</div>			<input type="hidden" name="searchParaList[0].ID" value="c032e0bafd614798ac2fd934ad1d444a">
      </div>
</td><td>      <div class="group"><div class="name" title="等于">类型</div><div class="dec">				<select id="CAU_TYPE" name="searchParaList[1]._PAGE_SEARCH_VALUE" class="null dept_select" save_mark="0" style="display: none;"><option value="">--请选择--</option><option value="1">DCT(PC)</option>
<option value="2">DCT(安卓)</option>
<option value="3">PDA(安卓)</option>
<option value="4">C/S程序</option>
<option value="5">N2-factory(安卓)</option>
</select><div class="chosen-container chosen-container-single" style="width: 240px;" title="" id="CAU_TYPE_chosen"><div class="chosen-drop"><div class="chosen-search"><input type="text" autocomplete="off"></div><ul class="chosen-results"></ul></div></div>
</div>			<input type="hidden" name="searchParaList[1].ID" value="15f6663574204ff79fbf270b63d31228">
      </div>
</td></tr><input type="hidden" id="searchParaNull" value="3"><input type="hidden" id="isClearOrder" value="1"> 



  </tbody>

  </table>
  


                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>  
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage2a9942a26d914db48edc771637fd9721" id="formPage2a9942a26d914db48edc771637fd9721" value="${formPage2a9942a26d914db48edc771637fd9721}"/>
		<input type="hidden" name="formId" id="formId1" value='2a9942a26d914db48edc771637fd9721'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="2a9942a26d914db48edc771637fd9721">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax2a9942a26d914db48edc771637fd9721" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner head" id="datagrid-header-inner2a9942a26d914db48edc771637fd9721">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable2a9942a26d914db48edc771637fd9721">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="2a9942a26d914db48edc771637fd9721" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_2a9942a26d914db48edc771637fd9721" onclick="_selectAjaxTableAllData(this,'2a9942a26d914db48edc771637fd9721')" style="cursor: pointer;"title="全选"/></span></td>

			<td name="noprintset_CAU_NAME" style="width:200px;" class="datagrid-cell"><bu:uitn colNo="CAU_NAME" formId="2a9942a26d914db48edc771637fd9721" /></td>
			<td name="noprintset_CAU_TYPE" style="width:200px;" class="datagrid-cell"><bu:uitn colNo="CAU_TYPE" formId="2a9942a26d914db48edc771637fd9721" /></td>
			<td name="noprintset_CAU_VERSION" style="width:200px;" class="datagrid-cell"><bu:uitn colNo="CAU_VERSION" formId="2a9942a26d914db48edc771637fd9721" /></td>
		<!--	<td name="noprintset_CAU_SYS_NAME" style="width:200px;" class="datagrid-cell"><bu:uitn colNo="CAU_SYS_NAME" formId="2a9942a26d914db48edc771637fd9721" /></td>-->
		
			<td name="noprintset_CAU_UPLOAD_USER" style="width:200px;" class="datagrid-cell"><bu:uitn colNo="CAU_UPLOAD_USER" formId="2a9942a26d914db48edc771637fd9721" /></td>
			<td name="noprintset_CAU_UPLOAD_TIME" style="width:200px;" class="datagrid-cell"><bu:uitn colNo="CAU_UPLOAD_TIME" formId="2a9942a26d914db48edc771637fd9721" /></td>
			<td name="noprintset_CAU_MEMO" style="width:200px;" class="datagrid-cell"><bu:uitn colNo="CAU_MEMO" formId="2a9942a26d914db48edc771637fd9721" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax scroll" id="tableDiv2a9942a26d914db48edc771637fd9721" onscroll="ajaxTableScroll(this,'2a9942a26d914db48edc771637fd9721')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax2a9942a26d914db48edc771637fd9721">
		<tbody id="tbody_2a9942a26d914db48edc771637fd9721" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
				<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchSecondItem&formId=2a9942a26d914db48edc771637fd9721&showLoading=0" />
			</div>
	

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('2a9942a26d914db48edc771637fd9721','1');">打印</button>
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
 <td style="width: 100px;text-align: right;"><span>组织机构</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="DATA_AUTH" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="DATA_AUTH" value="" title_name="组织机构" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?文件代码</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CAU_SN" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CAU_SN" value="" title_name="?文件代码" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>文件名称</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CAU_NAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CAU_NAME" value="" title_name="文件名称" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>类型</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CAU_TYPE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CAU_TYPE" value="" title_name="类型" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>版本</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CAU_VERSION" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CAU_VERSION" value="" title_name="版本" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?文件存放路径</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CAU_ADDRESS" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CAU_ADDRESS" value="" title_name="?文件存放路径" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?文件原始名称</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CAU_SYS_NAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CAU_SYS_NAME" value="" title_name="?文件原始名称" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?文件存放名称</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CAU_FILE_NAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CAU_FILE_NAME" value="" title_name="?文件存放名称" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>备注</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CAU_MEMO" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CAU_MEMO" value="" title_name="备注" />px
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
		<bu:submit viewId="bbff96eebb1f41a3ac5d8a45bef8731b" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="bbff96eebb1f41a3ac5d8a45bef8731b" />
    
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
                    searchInfo();
                    //listAjaxTable($("#formId1").val());
                    //listAjaxTable_print($("#formId1").val());
                    
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
    if(formId=='2a9942a26d914db48edc771637fd9721'){<%--FM-自动更新信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v.ID+"'  value='"+v.DATA_AUTH_ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            
            arrHtml.push("<td colno='DATA_AUTH' name='noprintset_CAU_SN' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("</td>");
            
            arrHtml.push("<td colno='CAU_NAME' name='noprintset_CAU_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CAU_NAME')+"' style='width:200px;' "+ms.tdEvent(formId, 'CAU_NAME')+">")
            arrHtml.push("<span colno='CAU_NAME' class='"+ms.uiClass(formId, 'CAU_NAME')+"' style='"+ms.uiStyle(formId, 'CAU_NAME')+"' "+ms.uiEvent(formId, 'CAU_NAME')+" title='"+ms.titleAttr(formId,'CAU_NAME','IS_TITLE_ATTR',v)+"' >"+v['CAU_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CAU_TYPE' name='noprintset_CAU_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CAU_TYPE')+"' style='width:200px;' "+ms.tdEvent(formId, 'CAU_TYPE')+">")
            arrHtml.push("<span colno='CAU_TYPE' class='"+ms.uiClass(formId, 'CAU_TYPE')+"' style='"+ms.uiStyle(formId, 'CAU_TYPE')+"' "+ms.uiEvent(formId, 'CAU_TYPE')+" title='"+ms.titleAttr(formId,'CAU_TYPE','IS_TITLE_ATTR',v)+"' >"+v['CAU_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CAU_VERSION' name='noprintset_CAU_VERSION' class='datagrid-cell "+ms.tdClass(formId, 'CAU_VERSION')+"' style='width:200px;' "+ms.tdEvent(formId, 'CAU_VERSION')+">")
            arrHtml.push("<span colno='CAU_VERSION' class='"+ms.uiClass(formId, 'CAU_VERSION')+"' style='"+ms.uiStyle(formId, 'CAU_VERSION')+"' "+ms.uiEvent(formId, 'CAU_VERSION')+" title='"+ms.titleAttr(formId,'CAU_VERSION','IS_TITLE_ATTR',v)+"' >"+v['CAU_VERSION']+"</span>")
            arrHtml.push("</td>");

            arrHtml.push("<td colno='CAU_SYS_NAME' name='noprintset_CAU_SYS_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CAU_SYS_NAME')+"' style='width:200px;' "+ms.tdEvent(formId, 'CAU_SYS_NAME')+">")
            arrHtml.push("<span colno='CAU_SYS_NAME' class='"+ms.uiClass(formId, 'CAU_SYS_NAME')+"' style='"+ms.uiStyle(formId, 'CAU_SYS_NAME')+"' "+ms.uiEvent(formId, 'CAU_SYS_NAME')+" title='"+ms.titleAttr(formId,'CAU_SYS_NAME','IS_TITLE_ATTR',v)+"' >"+v['CAU_SYS_NAME']+"</span>")
            arrHtml.push("</td>");
 
            arrHtml.push("<td colno='CAU_UPLOAD_USER' name='noprintset_CAU_UPLOAD_USER' class='datagrid-cell "+ms.tdClass(formId, 'CAU_UPLOAD_USER')+"' style='width:200px;' "+ms.tdEvent(formId, 'CAU_UPLOAD_USER')+">")
            arrHtml.push("<span colno='CAU_UPLOAD_USER' class='"+ms.uiClass(formId, 'CAU_UPLOAD_USER')+"' style='"+ms.uiStyle(formId, 'CAU_UPLOAD_USER')+"' "+ms.uiEvent(formId, 'CAU_UPLOAD_USER')+" title='"+ms.titleAttr(formId,'CAU_UPLOAD_USER','IS_TITLE_ATTR',v)+"' >"+v['CAU_UPLOAD_USER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CAU_UPLOAD_TIME' name='noprintset_CAU_UPLOAD_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CAU_UPLOAD_TIME')+"' style='width:140px;text-align:center; ' "+ms.tdEvent(formId, 'CAU_UPLOAD_TIME')+">")
            arrHtml.push("<span colno='CAU_UPLOAD_TIME' class='"+ms.uiClass(formId, 'CAU_UPLOAD_TIME')+"' style='"+ms.uiStyle(formId, 'CAU_UPLOAD_TIME')+"' "+ms.uiEvent(formId, 'CAU_UPLOAD_TIME')+" title='"+ms.titleAttr(formId,'CAU_UPLOAD_TIME','IS_TITLE_ATTR',v)+"' >"+v['CAU_UPLOAD_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CAU_MEMO' name='noprintset_CAU_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'CAU_MEMO')+"' style='width:200px;' "+ms.tdEvent(formId, 'CAU_MEMO')+">")
            arrHtml.push("<span colno='CAU_MEMO' class='"+ms.uiClass(formId, 'CAU_MEMO')+"' style='"+ms.uiStyle(formId, 'CAU_MEMO')+"' "+ms.uiEvent(formId, 'CAU_MEMO')+" title='"+ms.titleAttr(formId,'CAU_MEMO','IS_TITLE_ATTR',v)+"' >"+v['CAU_MEMO']+"</span>")
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
function createTableModel_print(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='2a9942a26d914db48edc771637fd9721'){<%--FM-自动更新信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
          
            arrHtml.push("<td colno='DATA_AUTH' name='noprintset_CAU_SN' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("</td>");
            
             arrHtml.push("<td colno='CAU_NAME' name='noprintset_CAU_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CAU_NAME')+"' style='width:200px;' "+ms.tdEvent(formId, 'CAU_NAME')+">")
            arrHtml.push("<span colno='CAU_NAME' class='"+ms.uiClass(formId, 'CAU_NAME')+"' style='"+ms.uiStyle(formId, 'CAU_NAME')+"' "+ms.uiEvent(formId, 'CAU_NAME')+" title='"+ms.titleAttr(formId,'CAU_NAME','IS_TITLE_ATTR',v)+"' >"+v['CAU_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CAU_TYPE' name='noprintset_CAU_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CAU_TYPE')+"' style='width:200px;' "+ms.tdEvent(formId, 'CAU_TYPE')+">")
            arrHtml.push("<span colno='CAU_TYPE' class='"+ms.uiClass(formId, 'CAU_TYPE')+"' style='"+ms.uiStyle(formId, 'CAU_TYPE')+"' "+ms.uiEvent(formId, 'CAU_TYPE')+" title='"+ms.titleAttr(formId,'CAU_TYPE','IS_TITLE_ATTR',v)+"' >"+v['CAU_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CAU_VERSION' name='noprintset_CAU_VERSION' class='datagrid-cell "+ms.tdClass(formId, 'CAU_VERSION')+"' style='width:200px;' "+ms.tdEvent(formId, 'CAU_VERSION')+">")
            arrHtml.push("<span colno='CAU_VERSION' class='"+ms.uiClass(formId, 'CAU_VERSION')+"' style='"+ms.uiStyle(formId, 'CAU_VERSION')+"' "+ms.uiEvent(formId, 'CAU_VERSION')+" title='"+ms.titleAttr(formId,'CAU_VERSION','IS_TITLE_ATTR',v)+"' >"+v['CAU_VERSION']+"</span>")
            arrHtml.push("</td>");

            arrHtml.push("<td colno='CAU_SYS_NAME' name='noprintset_CAU_SYS_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CAU_SYS_NAME')+"' style='width:200px;' "+ms.tdEvent(formId, 'CAU_SYS_NAME')+">")
            arrHtml.push("<span colno='CAU_SYS_NAME' class='"+ms.uiClass(formId, 'CAU_SYS_NAME')+"' style='"+ms.uiStyle(formId, 'CAU_SYS_NAME')+"' "+ms.uiEvent(formId, 'CAU_SYS_NAME')+" title='"+ms.titleAttr(formId,'CAU_SYS_NAME','IS_TITLE_ATTR',v)+"' >"+v['CAU_SYS_NAME']+"</span>")
            arrHtml.push("</td>");
 
            arrHtml.push("<td colno='CAU_UPLOAD_USER' name='noprintset_CAU_UPLOAD_USER' class='datagrid-cell "+ms.tdClass(formId, 'CAU_UPLOAD_USER')+"' style='width:200px;' "+ms.tdEvent(formId, 'CAU_UPLOAD_USER')+">")
            arrHtml.push("<span colno='CAU_UPLOAD_USER' class='"+ms.uiClass(formId, 'CAU_UPLOAD_USER')+"' style='"+ms.uiStyle(formId, 'CAU_UPLOAD_USER')+"' "+ms.uiEvent(formId, 'CAU_UPLOAD_USER')+" title='"+ms.titleAttr(formId,'CAU_UPLOAD_USER','IS_TITLE_ATTR',v)+"' >"+v['CAU_UPLOAD_USER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CAU_UPLOAD_TIME' name='noprintset_CAU_UPLOAD_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CAU_UPLOAD_TIME')+"' style='width:140px;text-align:center;' "+ms.tdEvent(formId, 'CAU_UPLOAD_TIME')+">")
            arrHtml.push("<span colno='CAU_UPLOAD_TIME' class='"+ms.uiClass(formId, 'CAU_UPLOAD_TIME')+"' style='"+ms.uiStyle(formId, 'CAU_UPLOAD_TIME')+"' "+ms.uiEvent(formId, 'CAU_UPLOAD_TIME')+" title='"+ms.titleAttr(formId,'CAU_UPLOAD_TIME','IS_TITLE_ATTR',v)+"' >"+v['CAU_UPLOAD_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CAU_MEMO' name='noprintset_CAU_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'CAU_MEMO')+"' style='width:200px;' "+ms.tdEvent(formId, 'CAU_MEMO')+">")
            arrHtml.push("<span colno='CAU_MEMO' class='"+ms.uiClass(formId, 'CAU_MEMO')+"' style='"+ms.uiStyle(formId, 'CAU_MEMO')+"' "+ms.uiEvent(formId, 'CAU_MEMO')+" title='"+ms.titleAttr(formId,'CAU_MEMO','IS_TITLE_ATTR',v)+"' >"+v['CAU_MEMO']+"</span>")
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
    setScroll();
}


function searchInfo(){

    var url = "${path}buss/bussModel_exeFunc.ms?funcMId=58a92128390c4935a50d800cc386be63";

	var name = $.trim($("#CAU_NAME").val());
    var type = $.trim($("#CAU_TYPE").val());
	
    $.ajax({
        type:"post",
        dataType:"json",
        url:url,
         data:  {
        "name" : name,		
        "type" : type,			
},
         //"connectDoc="+connectDoc+"&beginTime="+beginTime+"&endTime="+endTime+"&type=1&itemStatus="+itemStatus+"&itemCode="+itemCode+"&dataAuth="+dataAuth+"&docNum="+docNum+"&docType=DJ14",
		success:function(data){
            if(null==data){
                return;
            }
            var tempType;
            var tempCheck;
            var tempFreeze;
            $("#tbody_2a9942a26d914db48edc771637fd9721").empty();
            if(null!=data.ajaxPage.dataList){
                var list = eval(data.ajaxPage.dataList);
               console.log(list);
                    for(var i=0; i<list.length;i++){

                        if(list[i].ID==null) list[i].ID="";
                        if(list[i].CAU_NAME==null) list[i].CAU_NAME="";
                        if(list[i].CAU_TYPE==null) tempType="";
                        if(list[i].CAU_VERSION==null) list[i].CAU_VERSION="";
                        if(list[i].CAU_TYPE==1) {tempType="<span  >DCT(PC)</span>";}
						if(list[i].CAU_TYPE==2) {tempType="<span  >DCT(安卓)</span>";}
					    if(list[i].CAU_TYPE==3) {tempType="<span  >PDA(安卓)</span>";}
					    if(list[i].CAU_TYPE==4) {tempType="<span  >C/S程序</span>";}
						if(list[i].CAU_TYPE==5) {tempType="<span  >N2-factory(安卓)</span>";}
						if(list[i].CAU_SYS_NAME==null) list[i].CAU_SYS_NAME="";
                        if(list[i].CAU_FILE_NAME==null) list[i].CAU_FILE_NAME="";
                        if(list[i].CAU_MEMO==null) list[i].CAU_MEMO="";
                        if(list[i].CAU_UPLOAD_TIME==null) list[i].CAU_UPLOAD_TIME="";
                        if(list[i].UPLOAD_USER==null) list[i].UPLOAD_USER="";
                        
  
                        //$("#addOutstock ").append("<tr id='trr"+(i+1)+"' ></tr>");
                        $("#tbody_2a9942a26d914db48edc771637fd9721 ").append("<tr abbr='"+list[i].ID+"' id='"+list[i].ID+"'  ></tr>");
                        $("#tbody_2a9942a26d914db48edc771637fd9721 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
						$("#tbody_2a9942a26d914db48edc771637fd9721 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input value='"+list[i].ID+"' class='isSubmit _selectdata' type='checkbox' name='isSelect3'/></td>");
                       	$("#tbody_2a9942a26d914db48edc771637fd9721 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='text-align: center;width:200px;' title='"+list[i].CAU_NAME+"'>"+list[i].CAU_NAME+"<input type='hidden' name='ID' value='"+list[i].ID+"' /></td>");
						$("#tbody_2a9942a26d914db48edc771637fd9721 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='text-align: center;width:200px;' >"+tempType+"</td>");
						$("#tbody_2a9942a26d914db48edc771637fd9721 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='text-align: center;width:200px;' title='"+list[i].CAU_VERSION+"'>"+list[i].CAU_VERSION+"</td>");
						//$("#tbody_2a9942a26d914db48edc771637fd9721 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='text-align: center;width:200px;' >"+list[i].CAU_SYS_NAME+"</td>");
						$("#tbody_2a9942a26d914db48edc771637fd9721 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='text-align: center;width:200px;' >"+list[i].UPLOAD_USER+"</td>");
						$("#tbody_2a9942a26d914db48edc771637fd9721 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='text-align: center;width:200px;' >"+list[i].CAU_UPLOAD_TIME+"</td>");
						$("#tbody_2a9942a26d914db48edc771637fd9721 tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='text-align: left;width:200px;' >"+list[i].CAU_MEMO+"</td>");
						
                    }
            }
            pageFun(data.ajaxPage,"2a9942a26d914db48edc771637fd9721");
							var tableTrJs = $("#datagrid-btable-ajax65324c73fb4340eab7fcd1a57edfee04 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('addOutstock');
							defTableWidthRewrite('65324c73fb4340eab7fcd1a57edfee04');
							setScroll();
        },
        error:function(msg){
            	utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
        }
    })
}

var paginationImpl = {};
function searchSecondItem(paginationImpl){
	var isFirstLoad = firstLoadThisPage(paginationImpl);
    	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
	var url = "${path}buss/bussModel_exeFunc.ms?funcMId=58a92128390c4935a50d800cc386be63";

	var name = $.trim($("#CAU_NAME").val());
    var type = $.trim($("#CAU_TYPE").val());
	
    $.ajax({
        type:"post",
        dataType:"json",
        url:url,
         data:  {
        "name" : name,		
        "type" : type,
        "page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
		"page.pageRecord":_GLO_FORM_PAGE_MAP[paginationImpl].pageRecord, 
        },
         //"connectDoc="+connectDoc+"&beginTime="+beginTime+"&endTime="+endTime+"&type=1&itemStatus="+itemStatus+"&itemCode="+itemCode+"&dataAuth="+dataAuth+"&docNum="+docNum+"&docType=DJ14",
		success:function(data){
            if(null==data){
                return;
            }
            var tempType;
            var tempCheck;
            var tempFreeze;
            $("#tbody_2a9942a26d914db48edc771637fd9721").empty();
            if(null!=data.ajaxPage.dataList){
                var list = eval(data.ajaxPage.dataList);
               console.log(list);
                    for(var i=0; i<list.length;i++){

                        if(list[i].ID==null) list[i].ID="";
                        if(list[i].CAU_NAME==null) list[i].CAU_NAME="";
                        if(list[i].CAU_TYPE==null) tempType="";
                        if(list[i].CAU_VERSION==null) list[i].CAU_VERSION="";
                        if(list[i].CAU_TYPE==1) {tempType="<span  >DCT(PC)</span>";}
						if(list[i].CAU_TYPE==2) {tempType="<span  >DCT(安卓)</span>";}
					    if(list[i].CAU_TYPE==3) {tempType="<span  >PDA(安卓)</span>";}
					    if(list[i].CAU_TYPE==4) {tempType="<span  >C/S程序</span>";}
						if(list[i].CAU_TYPE==5) {tempType="<span  >N2-factory(安卓)</span>";}
						if(list[i].CAU_SYS_NAME==null) list[i].CAU_SYS_NAME="";
                        if(list[i].CAU_FILE_NAME==null) list[i].CAU_FILE_NAME="";
                        if(list[i].CAU_MEMO==null) list[i].CAU_MEMO="";
                        if(list[i].CAU_UPLOAD_TIME==null) list[i].CAU_UPLOAD_TIME="";
                        if(list[i].UPLOAD_USER==null) list[i].UPLOAD_USER="";
                        
  
                        //$("#addOutstock ").append("<tr id='trr"+(i+1)+"' ></tr>");
                        $("#tbody_2a9942a26d914db48edc771637fd9721 ").append("<tr abbr='"+list[i].ID+"' id='"+list[i].ID+"'  ></tr>");
                        $("#tbody_2a9942a26d914db48edc771637fd9721 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
						$("#tbody_2a9942a26d914db48edc771637fd9721 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input VALUE='"+list[i].ID+"' class='isSubmit _selectdata' type='checkbox' name='isSelect3'/></td>");
                       	$("#tbody_2a9942a26d914db48edc771637fd9721 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='text-align: center;width:200px;' title='"+list[i].CAU_NAME+"'>"+list[i].CAU_NAME+"<input type='hidden' name='ID' value='"+list[i].ID+"' /></td>");
						$("#tbody_2a9942a26d914db48edc771637fd9721 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='text-align: center;width:200px;' >"+tempType+"</td>");
						$("#tbody_2a9942a26d914db48edc771637fd9721 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='text-align: center;width:200px;' title='"+list[i].CAU_VERSION+"'>"+list[i].CAU_VERSION+"</td>");
					//	$("#tbody_2a9942a26d914db48edc771637fd9721 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='text-align: center;width:200px;' >"+list[i].CAU_SYS_NAME+"</td>");
						$("#tbody_2a9942a26d914db48edc771637fd9721 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='text-align: center;width:200px;' >"+list[i].UPLOAD_USER+"</td>");
						$("#tbody_2a9942a26d914db48edc771637fd9721 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='text-align: center;width:200px;' >"+list[i].CAU_UPLOAD_TIME+"</td>");
						$("#tbody_2a9942a26d914db48edc771637fd9721 tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='text-align: left;width:200px;' >"+list[i].CAU_MEMO+"</td>");
						
                    }
            }
            pageFun(data.ajaxPage,"2a9942a26d914db48edc771637fd9721");
							var tableTrJs = $("#datagrid-btable-ajax65324c73fb4340eab7fcd1a57edfee04 tbody tr");
							_tongLineColor(tableTrJs);
							//clickTr('addOutstock');
							defTableWidthRewrite('65324c73fb4340eab7fcd1a57edfee04');
							setScroll();
        },
        error:function(msg){
            	utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
        }
    })
}
 function query(thisObj){
                    var formId = $("#formId1").val();
                  // if( getDealSearchMultiTimeSlotBtn())
                  try{chkMsSaveMarkUtils.saveConfig();}catch(err){}
                    // listAjaxTable(formId);
                     //listAjaxTable_print(formId);
                     searchSecondItem("2a9942a26d914db48edc771637fd9721");
                }


</script>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll','.head');
    
  })
})(jQuery)</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
