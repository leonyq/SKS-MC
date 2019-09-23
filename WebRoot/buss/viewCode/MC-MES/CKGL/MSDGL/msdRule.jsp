<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
    <title>
		<dict:lang value="VM-MSD管控规则" />
    </title>
     <style type="text/css">
		.datagrid-header,.datagrid-body{
		width:100% !important;
	}
	.datagrid-body1 td{
		border-width: 0 1px 1px 0;
    		border-style: solid;
    		margin:0;
    		border-color: #dbe1ef;
	}
	.datagrid-body2 td{
		border-width: 0 1px 1px 0;
    		border-style: solid;
    		margin:0;
    		border-color: #dbe1ef;
	}
	.block2 td,.block1 td{
		box-sizing: border-box;
	}
	#_loading_lay_div{
		opacity:0 !important;
		background-color:#fff !important;
	}
	
	.datagrid-btable{
		width:100% !important;
	}
	
	.block2{
		height:calc(100% - 39px - 10px);
	}
	.acss{
	    width:30px!important;
	}
	.widths{
	    width:120px!important;
	}
    </style>
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
		<bu:header formId ="6ddfecb9814a43318da4c008221c87c6"/>

</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="8eaf6497a2404891945f03d179bcb062" />
            </div>
            <div class="bd" id="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <input type="hidden" name="exeid" value="${exeid}" />
                       <input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
                       <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="8eaf6497a2404891945f03d179bcb062" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
         <div class="block1" style="float:left;width:58%;">
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                   <input type="hidden" name="exeid" value="${exeid}" />
		<input type="hidden" name="formPage6ddfecb9814a43318da4c008221c87c6" id="formPage6ddfecb9814a43318da4c008221c87c6" value="${formPage6ddfecb9814a43318da4c008221c87c6}"/>
		<input type="hidden" name="formId" id="formId1" value='6ddfecb9814a43318da4c008221c87c6'/>
		<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="6ddfecb9814a43318da4c008221c87c6">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax6ddfecb9814a43318da4c008221c87c6">
		<div class="datagrid-header">
		<div class="datagrid-header-inner head2" id="datagrid-header-inner6ddfecb9814a43318da4c008221c87c6">
		<bu:table cssClass="datagrid-htable1 fixedTable datagrid-div6 datagrid-htable-kz"  id="datagrid-htable6ddfecb9814a43318da4c008221c87c6" >
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass=" datagrid-title-ajax " id="datagrid-title-ajax">
			<td class="datagrid-cell acss" style="width:30px; text-align:center;" ><bu:thSeq  formId="6ddfecb9814a43318da4c008221c87c6" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_6ddfecb9814a43318da4c008221c87c6" onclick="_selectAjaxTableAllData(this,'6ddfecb9814a43318da4c008221c87c6')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="6ddfecb9814a43318da4c008221c87c6" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WSR_RULE_SN" formId="6ddfecb9814a43318da4c008221c87c6" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WSR_RULE_NAME" formId="6ddfecb9814a43318da4c008221c87c6" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WSR_DEFAULT_FLAG" formId="6ddfecb9814a43318da4c008221c87c6" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WSR_EXPOSE_LIMIT" formId="6ddfecb9814a43318da4c008221c87c6" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WSR_BAKE_LIMIT" formId="6ddfecb9814a43318da4c008221c87c6" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WSR_BAKE_TIMES" formId="6ddfecb9814a43318da4c008221c87c6" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body1  datagrid-div3  datagrid-body-ajax scroll2" id="tableDiv6ddfecb9814a43318da4c008221c87c6" onscroll="ajaxTableScroll(this,'6ddfecb9814a43318da4c008221c87c6')" >
		<table class="datagrid-btable fixedTable dblClick"   id="datagrid-btable-ajax6ddfecb9814a43318da4c008221c87c6" ><!--datagrid-btable fixedTable dblClick-->
		<tbody id="tbody_6ddfecb9814a43318da4c008221c87c6" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage6ddfecb9814a43318da4c008221c87c6==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchItemGroup&formId=6ddfecb9814a43318da4c008221c87c6&showLoading=0" />
			
			</div>
		</c:if>
		</div>
			<div class="block2" style="width:40%;float:right;">
					<div style="height:100%;">
				   		<div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view" style="border-bottom:none;">
			<div class="datagrid-header" style="">
			<div class="datagrid-header-inner head1" id="datagrid-header-inner" style="">
				<table  class="datagrid-htable  datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class=" thcolor">
						<td class="datagrid-cell acss" style="width:30px; text-align:center;" ></td>
						<td class="datagrid-cell" style="width:120px;text-align:center;"><dict:lang value="烘烤温度(℃)" /></th >
						<td class="datagrid-cell" style="width:120px;text-align:center;"><dict:lang value="烘烤下限(H)" /></th >
						<td class="datagrid-cell" style="width:120px;text-align:center;"><dict:lang value="烘烤上限(H)" /></th >
						<td class="datagrid-cell" align="text-align:center"><dict:lang value="偏差温度(℃)" /></th >
					</tr>
					</tbody>
				</table>
			</div>
			</div>
		<div class="datagrid-body2 datagrid-div3 scroll1" id="datagrid-body" style="height:calc(100% - 32px);">
				<table class="datagrid-btable  dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" ><!--datagrid-btable-->
					<tbody id="addLoadDetail">
					
					</tbody>
				</table>
		</div>	
		
						</div> 
						
		</div>
					</div>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
               
            </div>
        </div>
    </div>
		<bu:submit viewId="8eaf6497a2404891945f03d179bcb062" />
     
		<bu:script viewId="8eaf6497a2404891945f03d179bcb062" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
<script>
var getRuleDetailUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=c3ccdd15b1d14bee89e763cc36c8dd41";  //VM-MSD管控规则 操作功能 根据规则代码获取明细
function showRuleDetail(ruleId){
    trchoose(ruleId);
	var ruleSn = $("#RULE_SN_"+ruleId).val();
	var dataAuth = $("#auth_"+ruleId).val(); 
	console.log(dataAuth);
	util.showLoading("处理中...");
	
	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: getRuleDetailUrl,
			    data:{
			        "ruleSn":ruleSn,"dataAuth":ruleId
			    },
			    //data: "",
				success: function(data){
						util.closeLoading();
						$("#addLoadDetail").empty();
						if(null != data.ajaxList){
							var rccList = eval(data.ajaxList);
							for(var i = 0;i < rccList.length; i++){
								
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1 acss' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								//$("#loadDetail tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3 widths' style='width:120px;text-align: center;'>"+rccList[i].WSRD_BAKE_TEMP+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4 widths' style='width:120px;text-align: center;'>"+rccList[i].WSRD_BAKE_TIME+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4  widths' style='width:120px;text-align: center;'>"+rccList[i].WSRD_BAKE_MAX+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4 ' style='text-align: center;'>"+rccList[i].WSRD_TEMP_DEPARTURE+"</td>");
								
							}
						}
						
							var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
							_tongLineColor(tableTrJs);
							//defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
							
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
function reloadPg(msg,title,width,height,time,isCloseWin){
  	msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
}
function reloadPgExe(isCloseWin){
  	query("formId1");
  	if ("0" == isCloseWin || undefined == isCloseWin  ) {
    		top.$(".dialog-close").click();
  	}
   	checkboxAll("joblist");
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
    if(formId=='6ddfecb9814a43318da4c008221c87c6'){<%--FM-MSD管控规则--%>
    $('.scroll2').mCustomScrollbar("destroy");
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' onclick=\"showRuleDetail('"+v.ID+"');\" abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
           //arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
           // arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID' value='"+v['DATA_AUTH_ID']+"' />")
            //arrHtml.push("<input type='hidden' id='auth_"+v.ID+"' value='"+v['ID']+"' /></td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")		
	        arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")		
	        arrHtml.push("</td>");
            arrHtml.push("<td colno='WSR_RULE_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSR_RULE_SN')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'WSR_RULE_SN')+"' "+ms.tdEvent(formId, 'WSR_RULE_SN')+">")
            arrHtml.push("<span colno='WSR_RULE_SN' class='"+ms.uiClass(formId, 'WSR_RULE_SN')+"' style='"+ms.uiStyle(formId, 'WSR_RULE_SN')+"' "+ms.uiEvent(formId, 'WSR_RULE_SN')+" title='"+ms.titleAttr(formId,'WSR_RULE_SN','IS_TITLE_ATTR',v)+"' >"+v['WSR_RULE_SN']+"</span>")
            arrHtml.push("<input type='hidden' id='RULE_SN_"+v.ID+"' value='"+v['WSR_RULE_SN']+"' /></td>");
            arrHtml.push("<td colno='WSR_RULE_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WSR_RULE_NAME')+"' style='width:150px;"+ms.tdStyle(formId, 'WSR_RULE_NAME')+"' "+ms.tdEvent(formId, 'WSR_RULE_NAME')+">")
            arrHtml.push("<span colno='WSR_RULE_NAME' class='"+ms.uiClass(formId, 'WSR_RULE_NAME')+"' style='"+ms.uiStyle(formId, 'WSR_RULE_NAME')+"' "+ms.uiEvent(formId, 'WSR_RULE_NAME')+" title='"+ms.titleAttr(formId,'WSR_RULE_NAME','IS_TITLE_ATTR',v)+"' >"+v['WSR_RULE_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSR_DEFAULT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WSR_DEFAULT_FLAG')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'WSR_DEFAULT_FLAG')+"' "+ms.tdEvent(formId, 'WSR_DEFAULT_FLAG')+">")
            arrHtml.push("<span colno='WSR_DEFAULT_FLAG' class='"+ms.uiClass(formId, 'WSR_DEFAULT_FLAG')+"' style='"+ms.uiStyle(formId, 'WSR_DEFAULT_FLAG')+"' "+ms.uiEvent(formId, 'WSR_DEFAULT_FLAG')+" title='"+ms.titleAttr(formId,'WSR_DEFAULT_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WSR_DEFAULT_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSR_EXPOSE_LIMIT' class='datagrid-cell "+ms.tdClass(formId, 'WSR_EXPOSE_LIMIT')+"' style='width:100px;text-align:right;"+ms.tdStyle(formId, 'WSR_EXPOSE_LIMIT')+"' "+ms.tdEvent(formId, 'WSR_EXPOSE_LIMIT')+">")
            arrHtml.push("<span colno='WSR_EXPOSE_LIMIT' class='"+ms.uiClass(formId, 'WSR_EXPOSE_LIMIT')+"' style='"+ms.uiStyle(formId, 'WSR_EXPOSE_LIMIT')+"' "+ms.uiEvent(formId, 'WSR_EXPOSE_LIMIT')+" title='"+ms.titleAttr(formId,'WSR_EXPOSE_LIMIT','IS_TITLE_ATTR',v)+"' >"+v['WSR_EXPOSE_LIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSR_BAKE_LIMIT' class='datagrid-cell "+ms.tdClass(formId, 'WSR_BAKE_LIMIT')+"' style='width:100px;text-align:right;"+ms.tdStyle(formId, 'WSR_BAKE_LIMIT')+"' "+ms.tdEvent(formId, 'WSR_BAKE_LIMIT')+">")
            arrHtml.push("<span colno='WSR_BAKE_LIMIT' class='"+ms.uiClass(formId, 'WSR_BAKE_LIMIT')+"' style='"+ms.uiStyle(formId, 'WSR_BAKE_LIMIT')+"' "+ms.uiEvent(formId, 'WSR_BAKE_LIMIT')+" title='"+ms.titleAttr(formId,'WSR_BAKE_LIMIT','IS_TITLE_ATTR',v)+"' >"+v['WSR_BAKE_LIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSR_BAKE_TIMES' class='datagrid-cell "+ms.tdClass(formId, 'WSR_BAKE_TIMES')+"' style='width:100px;text-align:right;"+ms.tdStyle(formId, 'WSR_BAKE_TIMES')+"' "+ms.tdEvent(formId, 'WSR_BAKE_TIMES')+">")
            arrHtml.push("<span colno='WSR_BAKE_TIMES' class='"+ms.uiClass(formId, 'WSR_BAKE_TIMES')+"' style='"+ms.uiStyle(formId, 'WSR_BAKE_TIMES')+"' "+ms.uiEvent(formId, 'WSR_BAKE_TIMES')+" title='"+ms.titleAttr(formId,'WSR_BAKE_TIMES','IS_TITLE_ATTR',v)+"' >"+v['WSR_BAKE_TIMES']+"</span>")
            arrHtml.push("</td>");
            if(i==0){
		arrHtml.push("<input type='hidden' id='firstRuleSn' value='"+v['WSR_RULE_SN']+"' />");
		arrHtml.push("<input type='hidden' id='firstauth' value='"+v['ID']+"' />");
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
   // setScroll();
    setPopScroll('.scroll2','.head2');
    //defTableWidthRewrite("6ddfecb9814a43318da4c008221c87c6");
    showFirstDetail();
     $(".head2").scrollLeft(0);
}
    function trchoose(schemeId){
        var cbox = $("#"+schemeId).find("input[type='checkbox']");
        if(cbox.prop("checked")){

            cbox.attr("checked", false);
        }else{
            cbox.attr("checked", true);
        }
    }
function showFirstDetail(){
	var ruleSn = $("#firstRuleSn").val();
	var dataAuth = $("#firstauth").val();
	util.showLoading("处理中...");
	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: getRuleDetailUrl,
			    data:{
			        "ruleSn":ruleSn,"dataAuth":dataAuth
			    },
			    //data: "",
				success: function(data){
						util.closeLoading();
						$("#addLoadDetail").empty();
						if(null != data.ajaxList){
							var rccList = eval(data.ajaxList);
							for(var i = 0;i < rccList.length; i++){
								
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1 acss' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								//$("#loadDetail tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3 widths' style='width:120px;text-align: center;'>"+rccList[i].WSRD_BAKE_TEMP+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4  widths' style='width:120px;text-align: center;'>"+rccList[i].WSRD_BAKE_TIME+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4 widths' style='width:120px;text-align: center;'>"+rccList[i].WSRD_BAKE_MAX+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4 ' style='text-align: center;'>"+rccList[i].WSRD_TEMP_DEPARTURE+"</td>");
								
							}
						}
						
							var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
							_tongLineColor(tableTrJs);
							//defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
							
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}

function newScroll(item){
	$(item).mCustomScrollbar({
		axis:"yx",
		snapAmount:40,
		theme:"minimal-dark",
		keyboard:{scrollAmount:40},
		mouseWheel:{deltaFactor:40,preventDefault:true},
		scrollInertia:80,
			
	  });
}

function initHeight(){
    	//$('.block2').height($(window).height() - 56 - 78 - 10);
    
}

$(function(){
	initHeight();
})

$(window).resize(function(){
        initHeight();	 
});
function init(){
            
  
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    initTableWidth();
                    var jumpId = $("#jumpId").val();  
              		if(jumpId!=""){
                  $("#WSR_RULE_NAME").val(jumpId);
                  
                  }                
                  listAjaxTable($("#formId1").val());
                    //listAjaxTable_print($("#formId1").val());
                    
                 }
</script>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll1','.head1');
  })
})(jQuery)</script>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>

<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>