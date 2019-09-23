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
		<dict:lang value="VM-仓库捡货方案" />
    </title>
    <style>
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
	.wcss1{
	    width:30px!important;
	}
	.block2{
		height:calc(100% - 39px - 10px);
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
		<bu:header formId ="07ea397ead0f4ea8ac3eef0e970752cc"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
</head>

<body >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="67e3a6464bb04ee1a398638bd26006e8" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="67e3a6464bb04ee1a398638bd26006e8" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
                <div class="block1" style="float:left;width:50%;">
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage07ea397ead0f4ea8ac3eef0e970752cc" id="formPage07ea397ead0f4ea8ac3eef0e970752cc" value="${formPage07ea397ead0f4ea8ac3eef0e970752cc}"/>
		<input type="hidden" name="formId" id="formId1" value='07ea397ead0f4ea8ac3eef0e970752cc'/>
		<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
		<input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="07ea397ead0f4ea8ac3eef0e970752cc">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax07ea397ead0f4ea8ac3eef0e970752cc" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner07ea397ead0f4ea8ac3eef0e970752cc">
		<bu:table cssClass=" fixedTable datagrid-htable1 datagrid-div6 datagrid-htable-kz" id="datagrid-htable07ea397ead0f4ea8ac3eef0e970752cc">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass=" datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell wcss1" style="width:30px; text-align:center;" ><bu:thSeq  formId="07ea397ead0f4ea8ac3eef0e970752cc" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_07ea397ead0f4ea8ac3eef0e970752cc" onclick="_selectAjaxTableAllData(this,'07ea397ead0f4ea8ac3eef0e970752cc')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px; text-align:center"><bu:uitn colNo="DATA_AUTH" formId="07ea397ead0f4ea8ac3eef0e970752cc" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="WPS_SCHEME_SN" formId="07ea397ead0f4ea8ac3eef0e970752cc" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="WPS_SCHEME_NAME" formId="07ea397ead0f4ea8ac3eef0e970752cc" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center"><bu:uitn colNo="WPS_DEFAULT_FLAG" formId="07ea397ead0f4ea8ac3eef0e970752cc" /></td>
			<td class="datagrid-cell" style="width:200px; text-align:center"><bu:uitn colNo="WPS_MEMO" formId="07ea397ead0f4ea8ac3eef0e970752cc" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv07ea397ead0f4ea8ac3eef0e970752cc" onscroll="ajaxTableScroll(this,'07ea397ead0f4ea8ac3eef0e970752cc')">
		<table class="fixedTable datagrid-btable dblClick"  id="datagrid-btable-ajax07ea397ead0f4ea8ac3eef0e970752cc"><!--dlist-table  datagrid-btable fixedTable dblClick-->
		<tbody id="tbody_07ea397ead0f4ea8ac3eef0e970752cc" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage07ea397ead0f4ea8ac3eef0e970752cc==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=07ea397ead0f4ea8ac3eef0e970752cc&showLoading=0" />
			</div>
		</c:if>
		</div>
					<div class="block2" style="width:48%;float:right;">
					<div style="height:100%;">
				   		<div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view" style="height:100%;border-bottom:none;">
			<div class="datagrid-header">
			<div class="datagrid-header-inner head2" id="datagrid-header-inner" >
				<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class=" thcolor">
						<td class="datagrid-cell" style="width:30px; text-align:center;" ></td>
						
						<td class="datagrid-cell" style="width:200px;text-align:center;"><dict:lang value="策略代码" /></td >
						<td class="datagrid-cell" style="width:200px;text-align:center;"><dict:lang value="发货策略" /></td >
						<td class="datagrid-cell" style="width:200px;text-align:center;"><dict:lang value="策略描述" /></td >
					</tr>
					</tbody>
				</table>
			</div>
			</div>
		<div class="datagrid-body datagrid-div3 scroll2" id="datagrid-body">
			<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
					<tbody id="addScheme">
					
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
		<bu:submit viewId="67e3a6464bb04ee1a398638bd26006e8" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="67e3a6464bb04ee1a398638bd26006e8" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
    
<script>
function reloadPg(msg,title,width,height,time,isCloseWin){
    	msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
    }
    function reloadPgExe(isCloseWin){
    	/* document.forms.search_form.submit();
    	util.showTopLoading(); */
    	query("formId1");
    	if ("0" == isCloseWin || undefined == isCloseWin) {
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
    if(formId=='07ea397ead0f4ea8ac3eef0e970752cc'){<%--FM-仓库捡货方案信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' onclick=\"showSchemeDetail('"+v.ID+"');\" abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")
            arrHtml.push("</td>");
            //arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            //arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            // arrHtml.push("<input type='hidden' id='auth_"+v.ID+"' value='"+v['ID']+"'></td>");            
            arrHtml.push("<td colno='WPS_SCHEME_SN' class='datagrid-cell "+ms.tdClass(formId, 'WPS_SCHEME_SN')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'WPS_SCHEME_SN')+"' "+ms.tdEvent(formId, 'WPS_SCHEME_SN')+">")
            arrHtml.push("<span colno='WPS_SCHEME_SN' class='"+ms.uiClass(formId, 'WPS_SCHEME_SN')+"' style='"+ms.uiStyle(formId, 'WPS_SCHEME_SN')+"' "+ms.uiEvent(formId, 'WPS_SCHEME_SN')+" title='"+ms.titleAttr(formId,'WPS_SCHEME_SN','IS_TITLE_ATTR',v)+"' >"+v['WPS_SCHEME_SN']+"</span>")
            arrHtml.push("<input type='hidden' id='schemeSn_"+v.ID+"' value='"+v['WPS_SCHEME_SN']+"'></td>");
            arrHtml.push("<td colno='WPS_SCHEME_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WPS_SCHEME_NAME')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'WPS_SCHEME_NAME')+"' "+ms.tdEvent(formId, 'WPS_SCHEME_NAME')+">")
            arrHtml.push("<span colno='WPS_SCHEME_NAME' class='"+ms.uiClass(formId, 'WPS_SCHEME_NAME')+"' style='"+ms.uiStyle(formId, 'WPS_SCHEME_NAME')+"' "+ms.uiEvent(formId, 'WPS_SCHEME_NAME')+" title='"+ms.titleAttr(formId,'WPS_SCHEME_NAME','IS_TITLE_ATTR',v)+"' >"+v['WPS_SCHEME_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WPS_DEFAULT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WPS_DEFAULT_FLAG')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'WPS_DEFAULT_FLAG')+"' "+ms.tdEvent(formId, 'WPS_DEFAULT_FLAG')+">")
            arrHtml.push("<span colno='WPS_DEFAULT_FLAG' class='"+ms.uiClass(formId, 'WPS_DEFAULT_FLAG')+"' style='"+ms.uiStyle(formId, 'WPS_DEFAULT_FLAG')+"' "+ms.uiEvent(formId, 'WPS_DEFAULT_FLAG')+" title='"+ms.titleAttr(formId,'WPS_DEFAULT_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WPS_DEFAULT_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WPS_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'WPS_MEMO')+"' style='width:200px;"+ms.tdStyle(formId, 'WPS_MEMO')+"' "+ms.tdEvent(formId, 'WPS_MEMO')+">")
            arrHtml.push("<span colno='WPS_MEMO' class='"+ms.uiClass(formId, 'WPS_MEMO')+"' style='"+ms.uiStyle(formId, 'WPS_MEMO')+"' "+ms.uiEvent(formId, 'WPS_MEMO')+" title='"+ms.titleAttr(formId,'WPS_MEMO','IS_TITLE_ATTR',v)+"' >"+v['WPS_MEMO']+"</span>")
            arrHtml.push("</td>");
            if(i==0){
		arrHtml.push("<input type='hidden' id='firstSchemeSn' value='"+v['WPS_SCHEME_SN']+"' />");
		arrHtml.push("<input type='hidden' id='firstauth' value='"+v['DATA_AUTH_ID']+"' />");
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
    if(isFirstSetScroll == 0){setScroll();}
    isFirstSetScroll++;
    getFirstScheme();
}
    function trchoose(schemeId){
        var cbox = $("#"+schemeId).find("input[type='checkbox']");
        if(cbox.prop("checked")){

            cbox.attr("checked", false);
        }else{
            cbox.attr("checked", true);
        }
    }
//点击显示详细信息
function showSchemeDetail(schemeId){
    //trchoose(schemeId);
	var schemeSn = $("#schemeSn_"+schemeId).val();
	var idd = $("#DATA_AUTH_ID_"+schemeId).val();
	console.log("idd："+idd);
	util.showLoading("处理中...");
	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=e6e9ce09fb9b4dc1ac371d1fda752f3c",
			    data:{"schemeSn":schemeSn,"cid":idd},
				success: function(data){
						util.closeLoading();
						$("#addScheme").empty();
						
						if(null == data){return ;}
						if(null != data.ajaxList){
							var rccList = eval(data.ajaxList);
							
							for(var i = 0;i < rccList.length; i++){
								$("#addScheme").append("<tr></tr>");
								$("#addScheme tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px; text-align:center;'>"+(i+1)+"</td>");
								$("#addScheme tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:200px;text-align:center;' title='"+rccList[i].PCD_TACTICS_SN+"'>"+rccList[i].PCD_TACTICS_SN+"</td>");
								$("#addScheme tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:200px;text-align:center;' title='"+rccList[i].PCD_TACTICS_NAME+"'>"+rccList[i].PCD_TACTICS_NAME+"</td>");
								$("#addScheme tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:200px;text-align:center;' title='"+rccList[i].PCD_MEMO+"'>"+rccList[i].PCD_MEMO+"</td>");
								
							}
							
							
						}
							var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
							_tongLineColor(tableTrJs);
							defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//加载第一条的信息
function getFirstScheme(){
	var schemeSn = $("#firstSchemeSn").val();
	var idd = $("#firstauth").val();
	util.showLoading("处理中...");
	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=e6e9ce09fb9b4dc1ac371d1fda752f3c",
			    data:{"schemeSn":schemeSn,"cid":idd},
				success: function(data){
						util.closeLoading();
						$("#addScheme").empty();
						
						if(null == data){return ;}
						if(null != data.ajaxList){
							var rccList = eval(data.ajaxList);
							
							for(var i = 0;i < rccList.length; i++){
								$("#addScheme").append("<tr></tr>");
								$("#addScheme tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px; text-align:center;'>"+(i+1)+"</td>");
								$("#addScheme tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:200px;text-align:center;' title='"+rccList[i].PCD_TACTICS_SN+"'>"+rccList[i].PCD_TACTICS_SN+"</td>");
								$("#addScheme tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:200px;text-align:center;' title='"+rccList[i].PCD_TACTICS_NAME+"'>"+rccList[i].PCD_TACTICS_NAME+"</td>");
								$("#addScheme tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:200px;text-align:center;' title='"+rccList[i].PCD_MEMO+"'>"+rccList[i].PCD_MEMO+"</td>");
								
							}
							
							
						}
							var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
							_tongLineColor(tableTrJs);
							defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}

function initHeight(){
    	
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
                  $("#WPS_SCHEME_NAME").val(jumpId);
                  
                  }                
                  listAjaxTable($("#formId1").val());
                    //listAjaxTable_print($("#formId1").val());
                    
                 }
</script>
<script>(function($){
  $(window).on('load',function(){
    //setPopScroll('.scroll','.head');
    setPopScroll('.scroll2','.head2');
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
