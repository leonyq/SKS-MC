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
		<dict:lang value="VM-物料锁定" />
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
		<bu:header formId ="619857e79e7443e0b1af8012c357c53b"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <script type="text/javascript">
     $(function(){
     
        $("#WML_WH_CODE").attr("onchange","_selectCascadNew(this.value,'WML_WH_CODE','f788a5fc31724d7ca88ff3f2e9fa790a','WML_WH_CODE','WML_DISTRICT_CODE');getStorageCode();");
        $("#WML_DISTRICT_CODE").attr("onchange","getStorageCode();");
    });
    
  function getStorageCode(){
    util.showLoading("处理中...");
    $.ajax({
			    type: "POST",
			    dataType: "json",
			    url: "buss/bussModel_exeFunc.ms?funcMId=9b045aeef1684c1b8c968cc740b7c3cd",
			    data: {
			        "whCode" : $("#WML_WH_CODE").val(),
			        "DISTRICT_CODE" : $("#WML_DISTRICT_CODE").val()
			    },
				success: function(data){	
                        util.closeLoading();
						if(null == data){return ;}
						if(null != data.ajaxList){
							var rccList = eval(data.ajaxList);
							var tempOption = "";
							for(var i = 0;i < rccList.length; i++){
								tempOption = tempOption + "<option value='"+rccList[i].WA_AREA_SN+"'>"+rccList[i].WA_AREA_NAME+"</option>";
							}
							$("#WML_STORAGE_CODE").empty();
             				$("#WML_STORAGE_CODE").append("<option value=''>--请选择--</option>");
             				$("#WML_STORAGE_CODE").append(tempOption);
             				$("#WML_STORAGE_CODE").trigger("chosen:updated");
						}
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
        function unlockItem(){
       
           $.ajax({
               type: "POST",
               dataType: "json",
               url:unLockUrl, 
               data: {
                   "snStr" : snStr
               },
               success: function(data){
                        util.closeLoading();msgPop("解锁成功","","摩尔提示",200,150,3000);var formId = $("#formId1").val();  listAjaxTable(formId);	
               },
               error: function(msg){util.closeLoading();
               
               utilsFp.confirmIcon(3,"","","", "error:解锁失败",0,"","");
               }
           });
        }
    </script>
    
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="0b0c61d37c97440084ada31e0c4a7e9c" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="0b0c61d37c97440084ada31e0c4a7e9c" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage619857e79e7443e0b1af8012c357c53b" id="formPage619857e79e7443e0b1af8012c357c53b" value="${formPage619857e79e7443e0b1af8012c357c53b}"/>
		<input type="hidden" name="formId" id="formId1" value='619857e79e7443e0b1af8012c357c53b'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="619857e79e7443e0b1af8012c357c53b">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax619857e79e7443e0b1af8012c357c53b" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner619857e79e7443e0b1af8012c357c53b">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable619857e79e7443e0b1af8012c357c53b">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="619857e79e7443e0b1af8012c357c53b" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_619857e79e7443e0b1af8012c357c53b" onclick="_selectAjaxTableAllData(this,'619857e79e7443e0b1af8012c357c53b')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px; text-align:center" ><bu:uitn colNo="DATA_AUTH" formId="619857e79e7443e0b1af8012c357c53b" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center" ><bu:uitn colNo="WML_DOC_NUM" formId="619857e79e7443e0b1af8012c357c53b" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center" ><bu:uitn colNo="WML_ITEM_SN" formId="619857e79e7443e0b1af8012c357c53b" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center" ><bu:uitn colNo="WML_ITEM_CODE" formId="619857e79e7443e0b1af8012c357c53b" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center" ><bu:uitn colNo="WML_ITEM_NUM" formId="619857e79e7443e0b1af8012c357c53b" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center" ><bu:uitn colNo="WML_WH_CODE" formId="619857e79e7443e0b1af8012c357c53b" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center" ><bu:uitn colNo="WML_DISTRICT_CODE" formId="619857e79e7443e0b1af8012c357c53b" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center" ><bu:uitn colNo="WML_STORAGE_CODE" formId="619857e79e7443e0b1af8012c357c53b" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center" ><bu:uitn colNo="WAD_MEMO" formId="619857e79e7443e0b1af8012c357c53b" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv619857e79e7443e0b1af8012c357c53b" onscroll="ajaxTableScroll(this,'619857e79e7443e0b1af8012c357c53b')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax619857e79e7443e0b1af8012c357c53b">
		<tbody id="tbody_619857e79e7443e0b1af8012c357c53b" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage619857e79e7443e0b1af8012c357c53b==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=619857e79e7443e0b1af8012c357c53b&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="0b0c61d37c97440084ada31e0c4a7e9c" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="0b0c61d37c97440084ada31e0c4a7e9c" />
    
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
    if(formId=='619857e79e7443e0b1af8012c357c53b'){<%--FM-物料锁定--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /></td>");
            arrHtml.push("<td colno='WML_DOC_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WML_DOC_NUM')+"' style='width:140px;"+ms.tdStyle(formId, 'WML_DOC_NUM')+"' "+ms.tdEvent(formId, 'WML_DOC_NUM')+">")
            arrHtml.push("<span colno='WML_DOC_NUM' class='"+ms.uiClass(formId, 'WML_DOC_NUM')+"' onclick='itemJump1(\""+v['WML_DOC_NUM']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WML_DOC_NUM')+" title='"+ms.titleAttr(formId,'WML_DOC_NUM','IS_TITLE_ATTR',v)+"' >"+v['WML_DOC_NUM']+"</span>")
            arrHtml.push("<input type='hidden' id='doc_"+v.ID+"' value='"+v['WML_DOC_NUM']+"'></td>");
            arrHtml.push("<td colno='WML_ITEM_SN' class='datagrid-cell "+ms.tdClass(formId, 'WML_ITEM_SN')+"' style='width:140px;"+ms.tdStyle(formId, 'WML_ITEM_SN')+"' "+ms.tdEvent(formId, 'WML_ITEM_SN')+">")
            arrHtml.push("<span colno='WML_ITEM_SN' class='"+ms.uiClass(formId, 'WML_ITEM_SN')+"' onclick='itemJump2(\""+v['WML_ITEM_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WML_ITEM_SN')+" title='"+ms.titleAttr(formId,'WML_ITEM_SN','IS_TITLE_ATTR',v)+"' >"+v['WML_ITEM_SN']+"</span>")
            arrHtml.push("<input type='hidden' id='sn_"+v.ID+"' value='"+v['WML_ITEM_SN']+"'></td>");
            arrHtml.push("<td colno='WML_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WML_ITEM_CODE')+"' style='width:140px;"+ms.tdStyle(formId, 'WML_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WML_ITEM_CODE')+">")
            arrHtml.push("<span colno='WML_ITEM_CODE' class='"+ms.uiClass(formId, 'WML_ITEM_CODE')+"' onclick='itemJump3(\""+v['WML_ITEM_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WML_ITEM_CODE')+" title='"+ms.titleAttr(formId,'WML_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['WML_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WML_ITEM_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WML_ITEM_NUM')+"' style='width:140px;text-align:right;"+ms.tdStyle(formId, 'WML_ITEM_NUM')+"' "+ms.tdEvent(formId, 'WML_ITEM_NUM')+">")
            arrHtml.push("<span colno='WML_ITEM_NUM' class='"+ms.uiClass(formId, 'WML_ITEM_NUM')+"' style='"+ms.uiStyle(formId, 'WML_ITEM_NUM')+"' "+ms.uiEvent(formId, 'WML_ITEM_NUM')+" title='"+ms.titleAttr(formId,'WML_ITEM_NUM','IS_TITLE_ATTR',v)+"' >"+v['WML_ITEM_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WML_WH_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WML_WH_CODE')+"' style='width:140px;"+ms.tdStyle(formId, 'WML_WH_CODE')+"' "+ms.tdEvent(formId, 'WML_WH_CODE')+">")
            arrHtml.push("<span colno='WML_WH_CODE' class='"+ms.uiClass(formId, 'WML_WH_CODE')+"' style='"+ms.uiStyle(formId, 'WML_WH_CODE')+"' "+ms.uiEvent(formId, 'WML_WH_CODE')+" title='"+ms.titleAttr(formId,'WML_WH_CODE','IS_TITLE_ATTR',v)+"' >"+v['WML_WH_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WML_DISTRICT_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WML_DISTRICT_CODE')+"' style='width:140px;"+ms.tdStyle(formId, 'WML_DISTRICT_CODE')+"' "+ms.tdEvent(formId, 'WML_DISTRICT_CODE')+">")
            arrHtml.push("<span colno='WML_DISTRICT_CODE' class='"+ms.uiClass(formId, 'WML_DISTRICT_CODE')+"' style='"+ms.uiStyle(formId, 'WML_DISTRICT_CODE')+"' "+ms.uiEvent(formId, 'WML_DISTRICT_CODE')+" title='"+ms.titleAttr(formId,'WML_DISTRICT_CODE','IS_TITLE_ATTR',v)+"' >"+v['WML_DISTRICT_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WML_STORAGE_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WML_STORAGE_CODE')+"' style='width:140px;"+ms.tdStyle(formId, 'WML_STORAGE_CODE')+"' "+ms.tdEvent(formId, 'WML_STORAGE_CODE')+">")
            arrHtml.push("<span colno='WML_STORAGE_CODE' class='"+ms.uiClass(formId, 'WML_STORAGE_CODE')+"' style='"+ms.uiStyle(formId, 'WML_STORAGE_CODE')+"' "+ms.uiEvent(formId, 'WML_STORAGE_CODE')+" title='"+ms.titleAttr(formId,'WML_STORAGE_CODE','IS_TITLE_ATTR',v)+"' >"+v['WML_STORAGE_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WAD_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'WAD_MEMO')+"' style='width:140px;"+ms.tdStyle(formId, 'WAD_MEMO')+"' "+ms.tdEvent(formId, 'WAD_MEMO')+">")
            arrHtml.push("<span colno='WAD_MEMO' class='"+ms.uiClass(formId, 'WAD_MEMO')+"' style='"+ms.uiStyle(formId, 'WAD_MEMO')+"' "+ms.uiEvent(formId, 'WAD_MEMO')+" title='"+ms.titleAttr(formId,'WAD_MEMO','IS_TITLE_ATTR',v)+"' >"+v['WAD_MEMO']+"</span>")
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

//生产领料
function itemJump1(obj){
      winOptMethod.jump("b1bd96ced2af4ca1af9ea4e8dd2886a7","F6725","jumpId",obj);
}  


//物料追溯
function itemJump2(obj){
    winOptMethod.jump("0b0276d9a6e3422592e30a48ad93b418","F10790","jumpId",obj);
} 

//物料信息
function itemJump3(obj){
    winOptMethod.jump("15e211df6f9d435088ad89c31837ef5f","F3428","jumpId",obj);
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
