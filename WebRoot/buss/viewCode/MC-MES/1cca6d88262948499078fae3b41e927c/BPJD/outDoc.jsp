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
		<dict:lang value="VM-备品领用单信息" />
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
		<bu:header formId ="24e721d28d3f46758e022d1e6d147782"/>

    <style>
        .datagrid-htable{
            	width:100% !important;
            
        }
        
    </style>
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="85757ed002ae4e2081da66f663b3e405" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="85757ed002ae4e2081da66f663b3e405" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage24e721d28d3f46758e022d1e6d147782" id="formPage24e721d28d3f46758e022d1e6d147782" value="${formPage24e721d28d3f46758e022d1e6d147782}"/>
		<input type="hidden" name="formId" id="formId1" value='24e721d28d3f46758e022d1e6d147782'/>
		<input type="hidden" name="formId" id="formId1" value='24e721d28d3f46758e022d1e6d141234'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" id="itemIdS" name="itemIdS" value='null'/>
		<input type="hidden" id="firstItemId" name="firstItemId" value=''/>
		<div class="panel-ajax datagrid datagrid-div1"  id="24e721d28d3f46758e022d1e6d147782">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax24e721d28d3f46758e022d1e6d147782" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner24e721d28d3f46758e022d1e6d147782">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable24e721d28d3f46758e022d1e6d147782">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="24e721d28d3f46758e022d1e6d147782" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_24e721d28d3f46758e022d1e6d147782" onclick="_selectAjaxTableAllData(this,'24e721d28d3f46758e022d1e6d147782')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px; text-align:center" ><bu:uitn colNo="DATA_AUTH" formId="24e721d28d3f46758e022d1e6d147782" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center" ><bu:uitn colNo="WSO_DOC_NUM" formId="24e721d28d3f46758e022d1e6d147782" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center" ><bu:uitn colNo="WSO_OUT_TYPE" formId="24e721d28d3f46758e022d1e6d147782" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center" ><bu:uitn colNo="WSO_DEPT" formId="24e721d28d3f46758e022d1e6d147782" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center" ><bu:uitn colNo="WSO_OUT_TIME" formId="24e721d28d3f46758e022d1e6d147782" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center" ><bu:uitn colNo="WSI_OUT_EMP" formId="24e721d28d3f46758e022d1e6d147782" /></td>
			<td class="datagrid-cell" style="width:300px; text-align:center" ><bu:uitn colNo="WSO_MEMO" formId="24e721d28d3f46758e022d1e6d147782" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv24e721d28d3f46758e022d1e6d147782" onscroll="ajaxTableScroll(this,'24e721d28d3f46758e022d1e6d147782')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax24e721d28d3f46758e022d1e6d147782">
		<tbody id="tbody_24e721d28d3f46758e022d1e6d147782" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage24e721d28d3f46758e022d1e6d147782==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=24e721d28d3f46758e022d1e6d147782&showLoading=0" />
			</div>
		</c:if>
		
		<!---->
			
				<div class="panel-ajax datagrid datagrid-div1" style="margin-top:10px;"><!--143-->
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
						<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head1"  id="">
								<table  class="datagrid-htable fixedTable  " id="datagrid-htable24e721d28d3f46758e022d1e6d141234"  >
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"><input type="checkbox" id="allSelect" name="allSelect" onchange="getAllItem();"/></td >
			                            <td class="datagrid-cell" style="width:100px;text-align: center" ><dict:lang value="领用单号" /></td >
										<td class="datagrid-cell" style="width:100px;text-align: center" ><dict:lang value="物料SN" /></td >
										<td class="datagrid-cell" style="width:100px;text-align: center" ><dict:lang value="物料料号" /></td >
										<td class="datagrid-cell" style="width:100px;text-align: center" ><dict:lang value="物料名称" /></td >
										<td class="datagrid-cell" style="width:100px;text-align: center" ><dict:lang value="物料规格" /></td >
										<td class="datagrid-cell" style="width:100px;text-align: center" ><dict:lang value="物料数量" /></td >
										
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll1"><!--130-->
							<table class="datagrid-btable fixedTable " style="table-layout: fixed;width:100%;"  id="datagrid-btable-ajax24e721d28d3f46758e022d1e6d141234" >
								<tbody id="addItemDetail" >
								</tbody>
							</table>
						</div>
						
					</div>
				</div>
				<div style="background-color: white;margin-top:0px;" id="">
                                 			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchItemInfo&formId=formId2&showLoading=0" />
                                 		</div>	
			</div><!---->
		</DIV>
			<DIV id="content2" style="display:none" data-tab="tag2">
				<div class="panel1 datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border:0;">
						<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head"  id="" >
								<table  class="datagrid-htable fixedTable  " id="secondItemDetail1"  >
									<tbody>
									<tr class="thcolor">
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"><input type="checkbox" id="allSelect1" name="allSelect" onchange="getAllItem1();"/></td >
						                <td class="datagrid-cell"><dict:lang value="领用单号" /></td >
										<td class="datagrid-cell"><dict:lang value="物料SN" /></td >
										<td class="datagrid-cell"><dict:lang value="物料料号" /></td >
										<td class="datagrid-cell"><dict:lang value="物料名称" /></td >
										<td class="datagrid-cell"><dict:lang value="物料规格" /></td >
										<td class="datagrid-cell"><dict:lang value="物料数量" /></td >
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll">
							<table class="dlist-table table-line " style="table-layout: fixed;width:100%;"  id="secondItemDetail" >
								<tbody id="addSecondItemDetail" >
								</tbody>
							</table>
						</div>
							
					</div>
				</div>
				<div style="background-color: white;" id="pageDiv">
                                 			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchSecondItem&formId=formId3&showLoading=0" />
                                 		</div>
			</DIV>
		 				

	</DIV>

</DIV>

		
		
		

		<input type="hidden" name="tableCount" id="tableCount" value='2' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="85757ed002ae4e2081da66f663b3e405" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="85757ed002ae4e2081da66f663b3e405" />
    
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
    if(formId=='24e721d28d3f46758e022d1e6d147782'){<%--备品领用单信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' onclick=\"getInfo('"+v.WSO_DOC_NUM+"');\"  id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='auth_"+v['ID']+"' value='"+v['ID']+"' /></td>"); 
            arrHtml.push("<td colno='WSO_DOC_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WSO_DOC_NUM')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'WSO_DOC_NUM')+"' "+ms.tdEvent(formId, 'WSO_DOC_NUM')+">")
            arrHtml.push("<span colno='WSO_DOC_NUM' class='"+ms.uiClass(formId, 'WSO_DOC_NUM')+"' style='"+ms.uiStyle(formId, 'WSO_DOC_NUM')+"' "+ms.uiEvent(formId, 'WSO_DOC_NUM')+" title='"+ms.titleAttr(formId,'WSO_DOC_NUM','IS_TITLE_ATTR',v)+"' >"+v['WSO_DOC_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSO_OUT_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'WSO_OUT_TYPE')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'WSO_OUT_TYPE')+"' "+ms.tdEvent(formId, 'WSO_OUT_TYPE')+">")
            arrHtml.push("<span colno='WSO_OUT_TYPE' class='"+ms.uiClass(formId, 'WSO_OUT_TYPE')+"' style='"+ms.uiStyle(formId, 'WSO_OUT_TYPE')+"' "+ms.uiEvent(formId, 'WSO_OUT_TYPE')+" title='"+ms.titleAttr(formId,'WSO_OUT_TYPE','IS_TITLE_ATTR',v)+"' >"+v['WSO_OUT_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSO_DEPT' class='datagrid-cell "+ms.tdClass(formId, 'WSO_DEPT')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'WSO_DEPT')+"' "+ms.tdEvent(formId, 'WSO_DEPT')+">")
            arrHtml.push("<span colno='WSO_DEPT' class='"+ms.uiClass(formId, 'WSO_DEPT')+"' style='"+ms.uiStyle(formId, 'WSO_DEPT')+"' "+ms.uiEvent(formId, 'WSO_DEPT')+" title='"+ms.titleAttr(formId,'WSO_DEPT','IS_TITLE_ATTR',v)+"' >"+v['WSO_DEPT']+"</span>")
            arrHtml.push("</td>");
            
            arrHtml.push("<td colno='WSO_OUT_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WSO_OUT_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'WSO_OUT_TIME')+"' "+ms.tdEvent(formId, 'WSO_OUT_TIME')+">")
            arrHtml.push("<span colno='WSO_OUT_TIME' class='"+ms.uiClass(formId, 'WSO_OUT_TIME')+"' style='"+ms.uiStyle(formId, 'WSO_OUT_TIME')+"' "+ms.uiEvent(formId, 'WSO_OUT_TIME')+" title='"+ms.titleAttr(formId,'WSO_OUT_TIME','IS_TITLE_ATTR',v)+"' >"+v['WSO_OUT_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_OUT_EMP' class='datagrid-cell "+ms.tdClass(formId, 'WSI_OUT_EMP')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'WSI_OUT_EMP')+"' "+ms.tdEvent(formId, 'WSI_OUT_EMP')+">")
            arrHtml.push("<span colno='WSI_OUT_EMP' class='"+ms.uiClass(formId, 'WSI_OUT_EMP')+"' style='"+ms.uiStyle(formId, 'WSI_OUT_EMP')+"' "+ms.uiEvent(formId, 'WSI_OUT_EMP')+" title='"+ms.titleAttr(formId,'WSI_OUT_EMP','IS_TITLE_ATTR',v)+"' >"+v['WSI_OUT_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSO_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'WSO_MEMO')+"' style='width:300px;text-align:left;"+ms.tdStyle(formId, 'WSO_MEMO')+"' "+ms.tdEvent(formId, 'WSO_MEMO')+">")
            arrHtml.push("<span colno='WSO_MEMO' class='"+ms.uiClass(formId, 'WSO_MEMO')+"' style='"+ms.uiStyle(formId, 'WSO_MEMO')+"' "+ms.uiEvent(formId, 'WSO_MEMO')+" title='"+ms.titleAttr(formId,'WSO_MEMO','IS_TITLE_ATTR',v)+"' >"+v['WSO_MEMO']+"</span>")
            arrHtml.push("</td>");
            if(i==0){
		       //arrHtml.push("<input type='hidden' id='firstItemId' value='"+v.WSO_DOC_NUM+"' />");
		       $("#firstItemId").val(v.WSO_DOC_NUM);
	        }
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
    getInfo($("#firstItemId").val())
}



//通过备用单信息获取明细信息
function getInfo(itemId){
    
    $("#itemIdS").val(itemId);	
    var WSO_ITEM_SN = $("#WSO_ITEM_SN").val();
    	var WSO_ITEM_CODE = $("#WSO_ITEM_CODE_SHOW").val();
    	var WSO_DOC_NUM = $("#WSO_DOC_NUM").val();
    var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=ce6ba48f20f84a7e916e2981744dcab1"; 
    util.showLoading("处理中...");
    $.ajax({
        type:"post",
        dataType:"json",
        url:loadItemUrl,
        data:{
          "itemId":itemId,
          "WSO_ITEM_SN":WSO_ITEM_SN,
          "WSO_ITEM_CODE":WSO_ITEM_CODE,
          "WSO_DOC_NUM":WSO_DOC_NUM
        },
        success:function(data){
             util.closeLoading();
              $("#addItemDetail").empty();
             if(null==data){
                 return;
             }
			if(null != data.ajaxPage.dataList){
			    
			    var rccList = eval(data.ajaxPage.dataList); 
			    for(var i=0;i<rccList.length;i++){
			        if(rccList[i].WSO_DOC_NUM==null)  rccList[i].WSO_DOC_NUM="";
					if(rccList[i].WSO_ITEM_CODE==null)  rccList[i].WSO_ITEM_CODE="";
					if(rccList[i].WSO_ITEM_NUM==null)  rccList[i].WSO_ITEM_NUM="";
					if(rccList[i].WSO_ITEM_SN==null)  rccList[i].WSO_ITEM_SN="";
					if(rccList[i].CI_ITEM_NAME==null)  rccList[i].CI_ITEM_NAME="";
					if(rccList[i].CI_ITEM_SPEC==null)  rccList[i].CI_ITEM_SPEC="";
					
					$("#addItemDetail").append("<tr id='tr1_"+i+"' ></tr>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='allSelect'/></td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:100px;text-align: left;' title='"+rccList[i].WSO_DOC_NUM+"'>"+rccList[i].WSO_DOC_NUM+"</td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:100px;text-align: left;' title='"+rccList[i].WSO_ITEM_SN+"'><span onclick='itemJump1(\""+rccList[i].WSO_ITEM_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WSO_ITEM_SN+"</span></td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:100px;text-align: left;' title='"+rccList[i].WSO_ITEM_CODE+"'>"+rccList[i].WSO_ITEM_CODE+"</td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:100px;text-align: left;' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"</td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:100px;text-align: left;' title='"+rccList[i].CI_ITEM_SPEC+"'>"+rccList[i].CI_ITEM_SPEC+"</td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:100px;text-align: right;' title='"+rccList[i].WSO_ITEM_NUM+"'>"+rccList[i].WSO_ITEM_NUM+"</td>");
					
			        
			    }
			    
			    
			}
            pageFun(data.ajaxPage,"formId2");
			var tableTrJs = $("#datagrid-btable-ajax24e721d28d3f46758e022d1e6d141234 tbody tr");
			_tongLineColor(tableTrJs);
			defTableWidthRewrite("24e721d28d3f46758e022d1e6d141234");
        },
        error:function(msg){
            util.closeLoading();
			utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
        }
        
        
    });
    
    
}


var paginationImpl = {};
function SearchItemInfo(paginationImpl,url){ 
	    var isFirstLoad = firstLoadThisPage(paginationImpl);
    	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
    	var itemId = $("#itemIdS").val();
    	
    	var WSO_ITEM_SN =$(document.getElementById('T2#WSO_ITEM_SN')).val(); 
    	var WSO_ITEM_CODE =$(document.getElementById('T2#WSO_ITEM_CODE_SHOW')).val();  
    	var WSO_DOC_NUM =$(document.getElementById('WSO_DOC_NUM')).val(); 
    	
    	
    	util.showLoading("处理中...");
    	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: url,
			    data:{
			     "itemId":itemId,
			     "WSO_ITEM_SN":WSO_ITEM_SN,
			     "WSO_ITEM_CODE":WSO_ITEM_CODE,
			     "WSO_DOC_NUM":WSO_DOC_NUM,
			     "page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			     "page.pageRecord":_GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
			    },
				success: function(data){
				                 
						util.closeLoading();
						$("#addItemDetail").empty();
						
			if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList); 
							
			    for(var i=0;i<rccList.length;i++){
			        if(rccList[i].WSO_DOC_NUM==null)  rccList[i].WSO_DOC_NUM="";
					if(rccList[i].WSO_ITEM_CODE==null)  rccList[i].WSO_ITEM_CODE="";
					if(rccList[i].WSO_ITEM_NUM==null)  rccList[i].WSO_ITEM_NUM="";
					if(rccList[i].WSO_ITEM_SN==null)  rccList[i].WSO_ITEM_SN="";
					if(rccList[i].CI_ITEM_NAME==null)  rccList[i].CI_ITEM_NAME="";
					if(rccList[i].CI_ITEM_SPEC==null)  rccList[i].CI_ITEM_SPEC="";
					
					$("#addItemDetail").append("<tr id='tr1_"+i+"' ></tr>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='allSelect'/></td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:100px;text-align: left;' title='"+rccList[i].WSO_DOC_NUM+"'>"+rccList[i].WSO_DOC_NUM+"</td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:100px;text-align: left;' title='"+rccList[i].WSO_ITEM_SN+"'><span onclick='itemJump1(\""+rccList[i].WSO_ITEM_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WSO_ITEM_SN+"</span></td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:100px;text-align: left;' title='"+rccList[i].WSO_ITEM_CODE+"'>"+rccList[i].WSO_ITEM_CODE+"</td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:100px;text-align: left;' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"</td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:100px;text-align: left;' title='"+rccList[i].CI_ITEM_SPEC+"'>"+rccList[i].CI_ITEM_SPEC+"</td>");
					$("#addItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:100px;text-align: right;' title='"+rccList[i].WSO_ITEM_NUM+"'>"+rccList[i].WSO_ITEM_NUM+"</td>");
					
			        
			    }
						}
						pageFun(data.ajaxPage,"formId2");
							var tableTrJs = $("#datagrid-btable-ajax24e721d28d3f46758e022d1e6d141234 tbody tr");
							_tongLineColor(tableTrJs);
							//clickTr('itemDetail');
						defTableWidthRewrite("24e721d28d3f46758e022d1e6d141234");
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}

function searchItemInfo(paginationImpl){
        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=c762923b3893430b9d60097243bdc95f";
	SearchItemInfo(paginationImpl,url);
}
//全选
function getAllItem(){
		if($("#allSelect").attr("checked")=="checked"){
			$("#addItemDetail :checkbox").attr("checked",true);
		}else{
			$("#addItemDetail :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	} 

</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//备品建档
function itemJump1(obj){
      winOptMethod.jump("3ba296cba3a544729ccd331795ef6c17","F7671","jumpId",obj);
}  



</script>
<script>(function($){
  $(window).on('load',function(){

    setPopScroll('.scroll1','.head1');
  })
})(jQuery)</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
