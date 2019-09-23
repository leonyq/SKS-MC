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
		<dict:lang value="VM-辅料履历-列表" />
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
		<bu:header formId ="62aabb92147842e1983bcfcda04f9a1d"/>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
</head>

<body >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="c4d83196ce8d43b59a659770faab3b00" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                      </jsp:include>
		<bu:search viewId="c4d83196ce8d43b59a659770faab3b00" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                   <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage62aabb92147842e1983bcfcda04f9a1d" id="formPage62aabb92147842e1983bcfcda04f9a1d" value="${formPage62aabb92147842e1983bcfcda04f9a1d}"/>
		<input type="hidden" name="formId" id="formId1" value='62aabb92147842e1983bcfcda04f9a1d'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="62aabb92147842e1983bcfcda04f9a1d">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax62aabb92147842e1983bcfcda04f9a1d" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner62aabb92147842e1983bcfcda04f9a1d">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable62aabb92147842e1983bcfcda04f9a1d" style="min-width:1350px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="62aabb92147842e1983bcfcda04f9a1d" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_62aabb92147842e1983bcfcda04f9a1d" onclick="_selectAjaxTableAllData(this,'62aabb92147842e1983bcfcda04f9a1d')" style="cursor: pointer;"title="全选"/></span></td>
		    <td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="62aabb92147842e1983bcfcda04f9a1d" /></td>
			<!--1-->
			<td class="datagrid-cell" style="width:210px;"><bu:uitn colNo="CTO_TIN_SN" formId="62aabb92147842e1983bcfcda04f9a1d" /></td>
			<!--2-->
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CTO_OPERATE_TYPE" formId="62aabb92147842e1983bcfcda04f9a1d" /></td>
			<!--3-->
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CTO_ITEM_TYPE" formId="62aabb92147842e1983bcfcda04f9a1d" /></td>
			<!--4-->
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CTO_TIN_CODEE" formId="62aabb92147842e1983bcfcda04f9a1d" /></td>
			<!--5-->
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="CTO_TIN_NAME" formId="62aabb92147842e1983bcfcda04f9a1d" /></td>
			<!--6-->
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CTO_TIN_SPEC" formId="62aabb92147842e1983bcfcda04f9a1d"/></td>
			<!--7-->
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CTO_TIN_LOT" formId="62aabb92147842e1983bcfcda04f9a1d" /></td>
			<!--8-->
		<!--	<td class="datagrid-cell" style="width:180px;"><bu:uitn colNo="CTO_SUPPLIER_NAME" formId="62aabb92147842e1983bcfcda04f9a1d"/></td> -->
			<!--9-->
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CTO_OPERATE_TIME" formId="62aabb92147842e1983bcfcda04f9a1d" /></td>
			<!--10-->
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="T2#NAME" formId="62aabb92147842e1983bcfcda04f9a1d" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv62aabb92147842e1983bcfcda04f9a1d" onscroll="ajaxTableScroll(this,'62aabb92147842e1983bcfcda04f9a1d')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax62aabb92147842e1983bcfcda04f9a1d" style="min-width:1350px;">
		<tbody id="tbody_62aabb92147842e1983bcfcda04f9a1d" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage62aabb92147842e1983bcfcda04f9a1d==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=62aabb92147842e1983bcfcda04f9a1d&showLoading=0" />
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
		<bu:submit viewId="c4d83196ce8d43b59a659770faab3b00" />
		<bu:script viewId="c4d83196ce8d43b59a659770faab3b00" />
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
    if(formId=='62aabb92147842e1983bcfcda04f9a1d'){<%--FM-辅料履历信息表--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            var tinSN=v['CTO_TIN_SN'];
            var itemCode=v['CTO_TIN_CODEE'];
            var name=v['CTO_TIN_NAME'];
            var spec=v['CTO_TIN_SPEC'];
            
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            // arrHtml.push("<td colno='DATA_AUTH' title='"+tinSN+"' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
           // arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" >"+v['DATA_AUTH']+"</span>")
           // arrHtml.push("</td>");
           arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")		
	        arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")		
	        arrHtml.push("</td>");
            arrHtml.push("<td colno='CTO_TIN_SN' title='"+tinSN+"' class='datagrid-cell "+ms.tdClass(formId, 'CTO_TIN_SN')+"' style='width:210px;"+ms.tdStyle(formId, 'CTO_TIN_SN')+"' "+ms.tdEvent(formId, 'CTO_TIN_SN')+">")
            arrHtml.push("<span colno='CTO_TIN_SN' class='"+ms.uiClass(formId, 'CTO_TIN_SN')+"' onclick='itemJump1(\""+v['CTO_TIN_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CTO_TIN_SN')+" >"+v['CTO_TIN_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTO_OPERATE_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CTO_OPERATE_TYPE')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CTO_OPERATE_TYPE')+"' "+ms.tdEvent(formId, 'CTO_OPERATE_TYPE')+">")
            arrHtml.push("<span colno='CTO_OPERATE_TYPE' class='"+ms.uiClass(formId, 'CTO_OPERATE_TYPE')+"' style='"+ms.uiStyle(formId, 'CTO_OPERATE_TYPE')+"' "+ms.uiEvent(formId, 'CTO_OPERATE_TYPE')+" >"+v['CTO_OPERATE_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTO_ITEM_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CTO_ITEM_TYPE')+"' style='width:80px;;text-align:center;"+ms.tdStyle(formId, 'CTO_ITEM_TYPE')+"' "+ms.tdEvent(formId, 'CTO_ITEM_TYPE')+">")
            arrHtml.push("<span colno='CTO_ITEM_TYPE' class='"+ms.uiClass(formId, 'CTO_ITEM_TYPE')+"' style='"+ms.uiStyle(formId, 'CTO_ITEM_TYPE')+"' "+ms.uiEvent(formId, 'CTO_ITEM_TYPE')+" title='"+v.CTO_ITEM_TYPE+"'>"+v['CTO_ITEM_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTO_TIN_CODEE' title='"+itemCode+"' class='datagrid-cell "+ms.tdClass(formId, 'CTO_TIN_CODEE')+"' style='width:150px;"+ms.tdStyle(formId, 'CTO_TIN_CODEE')+"' "+ms.tdEvent(formId, 'CTO_TIN_CODEE')+">")
            arrHtml.push("<span colno='CTO_TIN_CODEE' class='"+ms.uiClass(formId, 'CTO_TIN_CODEE')+"' onclick='itemJump2(\""+v['CTO_TIN_CODEE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CTO_TIN_CODEE')+" >"+v['CTO_TIN_CODEE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTO_TIN_NAME' title='"+name+"' class='datagrid-cell "+ms.tdClass(formId, 'CTO_TIN_NAME')+"' style='width:120px;"+ms.tdStyle(formId, 'CTO_TIN_NAME')+"' "+ms.tdEvent(formId, 'CTO_TIN_NAME')+">")
            arrHtml.push("<span colno='CTO_TIN_NAME' class='"+ms.uiClass(formId, 'CTO_TIN_NAME')+"' style='"+ms.uiStyle(formId, 'CTO_TIN_NAME')+"' "+ms.uiEvent(formId, 'CTO_TIN_NAME')+" >"+v['CTO_TIN_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTO_TIN_SPEC' title='"+spec+"' class='datagrid-cell "+ms.tdClass(formId, 'CTO_TIN_SPEC')+"' style='width:150px;"+ms.tdStyle(formId, 'CTO_TIN_SPEC')+"' "+ms.tdEvent(formId, 'CTO_TIN_SPEC')+">")
            arrHtml.push("<span colno='CTO_TIN_SPEC' class='"+ms.uiClass(formId, 'CTO_TIN_SPEC')+"' style='"+ms.uiStyle(formId, 'CTO_TIN_SPEC')+"' "+ms.uiEvent(formId, 'CTO_TIN_SPEC')+" >"+v['CTO_TIN_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTO_TIN_LOT' class='datagrid-cell "+ms.tdClass(formId, 'CTO_TIN_LOT')+"' style='width:100px;"+ms.tdStyle(formId, 'CTO_TIN_LOT')+"' "+ms.tdEvent(formId, 'CTO_TIN_LOT')+">")
            arrHtml.push("<span colno='CTO_TIN_LOT' class='"+ms.uiClass(formId, 'CTO_TIN_LOT')+"' style='"+ms.uiStyle(formId, 'CTO_TIN_LOT')+"' "+ms.uiEvent(formId, 'CTO_TIN_LOT')+" title='"+v.CTO_TIN_LOT+"'>"+v['CTO_TIN_LOT']+"</span>")
            arrHtml.push("</td>");
          //  arrHtml.push("<td colno='CTO_SUPPLIER_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CTO_SUPPLIER_NAME')+"' style='width:180px;"+ms.tdStyle(formId, 'CTO_SUPPLIER_NAME')+"' "+ms.tdEvent(formId, 'CTO_SUPPLIER_NAME')+">")
          //  arrHtml.push("<span colno='CTO_SUPPLIER_NAME' class='"+ms.uiClass(formId, 'CTO_SUPPLIER_NAME')+"' style='"+ms.uiStyle(formId, 'CTO_SUPPLIER_NAME')+"' "+ms.uiEvent(formId, 'CTO_SUPPLIER_NAME')+" title='"+v.CTO_SUPPLIER_NAME+"'>"+v['CTO_SUPPLIER_NAME']+"</span>")
          //  arrHtml.push("</td>");
            arrHtml.push("<td colno='CTO_OPERATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CTO_OPERATE_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CTO_OPERATE_TIME')+"' "+ms.tdEvent(formId, 'CTO_OPERATE_TIME')+">")
            arrHtml.push("<span colno='CTO_OPERATE_TIME' class='"+ms.uiClass(formId, 'CTO_OPERATE_TIME')+"' style='"+ms.uiStyle(formId, 'CTO_OPERATE_TIME')+"' "+ms.uiEvent(formId, 'CTO_OPERATE_TIME')+" title='"+v.CTO_OPERATE_TIME+"'>"+v['CTO_OPERATE_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#NAME' class='datagrid-cell "+ms.tdClass(formId, 'T2#NAME')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'T2#NAME')+"' "+ms.tdEvent(formId, 'T2#NAME')+">")
            arrHtml.push("<span colno='T2#NAME' class='"+ms.uiClass(formId, 'T2#NAME')+"' style='"+ms.uiStyle(formId, 'T2#NAME')+"' "+ms.uiEvent(formId, 'T2#NAME')+" >"+v['T2#NAME']+"</span>")
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
    //setTableWidth(formId);
    if(isFirstSetScroll == 0){
    	isFirstSetScroll =1;
    	setScroll();
    } 
}

function init(){
            
  
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    initTableWidth();
                    var jumpId = $("#jumpId").val();  
              		if(jumpId!=""){
                  $("#CTO_TIN_SN").val(jumpId);
                  
                  }                
                  listAjaxTable($("#formId1").val());
                    //listAjaxTable_print($("#formId1").val());
                    
                 }
function judgIsOpen(title,url){
    var flag = true;
    var timestamp = Date.parse(new Date());
     $(window.parent.document).find("#tag1").siblings().each(function(seq,item){
						//打开过的标签不再重复打开
						console.log(top);
						if(title == $(item).attr("title")){
							var count = item.id.substring(3);
						 $(window.parent.document).find("#iframe"+count).attr("src",url);
						 top.switchTag(item.id,"content"+count,url);
							flag = false;
							return;
						}
					});
					if(flag){
					showPopWinFp(url, 800, 400,null,title,timestamp,1);
					}
}

function itemJump1(obj){
      var title = "<dict:lang value="辅料信息" />";
      var formId = $("#formId1").val();
      var url = "${path}buss/bussModel.ms?&formId="+formId+"&exeid=f8de3c8160954ee7a90cacbd34498720&FUNC_CODE=F3821&frameId="+_currentFrame+"&jumpId="+obj;
      judgIsOpen(title,url);
    
}  



function itemJump2(obj){
    var title = "<dict:lang value="辅料制具料号" />";
  var formId = $("#formId1").val();
  var url = "${path}buss/bussModel.ms?&formId="+formId+"&exeid=8d8dfef2f0e140e88073f6cdad4b431d&FUNC_CODE=F3722&frameId="+_currentFrame+"&jumpId="+obj;
    judgIsOpen(title,url);
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