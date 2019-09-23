<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
    <title>
		<dict:lang value="异步-工艺信息" />
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
		<bu:header formId ="9ce89b8198274a25b7219ad226eda21e"/>
         <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
</head>

<body>
    <div class="content-in">
        <div class="dlist">
           <div class="hd">
		<bu:func viewId="883135130ace48bc9db3a1e91f57913b" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
		<bu:search viewId="883135130ace48bc9db3a1e91f57913b" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
                   <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<input type="hidden" name="formPage9ce89b8198274a25b7219ad226eda21e" id="formPage9ce89b8198274a25b7219ad226eda21e" value="${formPage9ce89b8198274a25b7219ad226eda21e}"/>
		<input type="hidden" name="formId" id="formId1" value='9ce89b8198274a25b7219ad226eda21e'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="9ce89b8198274a25b7219ad226eda21e">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax9ce89b8198274a25b7219ad226eda21e" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner9ce89b8198274a25b7219ad226eda21e">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable9ce89b8198274a25b7219ad226eda21e" >
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="9ce89b8198274a25b7219ad226eda21e" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_9ce89b8198274a25b7219ad226eda21e" onclick="_selectAjaxTableAllData(this,'9ce89b8198274a25b7219ad226eda21e')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CT_ID" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CT_NAME" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CT_PRODUCT_STEP" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CT_PROCESS_FACE" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CT_ROUTE_CODE" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CT_PREPOSE_TECH" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CT_DEFAULT_FLAG" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CT_VALID_FLAG" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CREATE_USER" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td class="datagrid-cell" style="width:350px;"><bu:uitn colNo="CREATE_TIME" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="EDIT_USER" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td class="datagrid-cell" style="width:350px;"><bu:uitn colNo="EDIT_TIME" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv9ce89b8198274a25b7219ad226eda21e" onscroll="ajaxTableScroll(this,'9ce89b8198274a25b7219ad226eda21e')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax9ce89b8198274a25b7219ad226eda21e" >
		<tbody id="tbody_9ce89b8198274a25b7219ad226eda21e" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=query&formId=9ce89b8198274a25b7219ad226eda21e&showLoading=0" />
			
			</div>
		
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="883135130ace48bc9db3a1e91f57913b" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>		
		<bu:script viewId="883135130ace48bc9db3a1e91f57913b" />
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>		
    <script type="text/javascript">
    
 function reloadPg(msg,title,width,height,time,isCloseWin){
    msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
  }


function reloadPgExe(isCloseWin){
    /* document.forms.search_form.submit();
    util.showTopLoading(); */
    query("formId1");
    if ("1" != isCloseWin) {
      top.$(".dialog-close").click();
    }
    checkboxAll("joblist");
    
  }
  
</script>
<script>
                function query(thisObj){
                    //var formId = $("#formId1").val();
                    queryMethod("9ce89b8198274a25b7219ad226eda21e");
                    
                }
  var paginationImpl = {};
  function queryMethod(paginationImpl){
        var isFirstLoad = firstLoadThisPage(paginationImpl);

    	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
        var currentPage = "1";
        var pageRecord = "20";
     var url = "${path}buss/bussModel_exeFunc.ms?funcMId=052b0494a14d4cf388bece00ec01ec96";
      var ctId=$("#CT_ID").val();
      var ctName=$("#CT_NAME").val();
      var ctStep=$("#CT_PRODUCT_STEP").val();
      var ctRouteCode=$("#CT_ROUTE_CODE_SHOW").val();
      var ctFace=$("#CT_PROCESS_FACE").val();
      var ctModelCode=$("#CTM_MODEL_CODE_SHOW").val();
      $.ajax({
        type:"post",
        dataType:"json",
        url:url,
        data:{
            "ctId":ctId,
            "ctName":ctName,
            "ctStep":ctStep,
            "ctRouteCode":ctRouteCode,
            "ctFace":ctFace,
            "ctModelCode":ctModelCode,
            "page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
            "page.pageRecord": _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
        },
		success:function(data){
		console.log(data);
            if(null==data){
                return;
            }
            var tempCheck;
            var tempFreeze;
            var productStep;
            var processFace;
            $("#tbody_9ce89b8198274a25b7219ad226eda21e").empty();
            if(null!=data.ajaxPage.dataList){
                var list = eval(data.ajaxPage.dataList);
                
                    for(var i=0; i<list.length;i++){
                        if(list[i].CT_ID==null) list[i].CT_ID="";
                        if(list[i].CT_NAME==null) list[i].CT_NAME="";
                        if(list[i].CT_DEFAULT_FLAG==null) tempCheck="";
						if(list[i].	CT_DEFAULT_FLAG=='Y') tempCheck="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
						if(list[i].CT_DEFAULT_FLAG=='N') tempCheck="<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
						if(list[i].CT_VALID_FLAG==null) tempFreeze="";
						if(list[i].CT_VALID_FLAG=='Y') tempFreeze="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
						if(list[i].CT_VALID_FLAG=='N') tempFreeze="<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
                        if(list[i].CT_PRODUCT_STEP==null) productStep="";
                        if(list[i].CT_PRODUCT_STEP=='1') productStep="贴片工艺";
                        if(list[i].CT_PRODUCT_STEP=='2') productStep="插件焊接";
                        if(list[i].CT_PRODUCT_STEP=='3') productStep="包装";
                        if(list[i].CT_PRODUCT_STEP=='4') productStep="组装";
                        if(list[i].CT_PRODUCT_STEP=='BCP') productStep="BCP";
                        if(list[i].CT_PROCESS_FACE==null) processFace="";
                        if(list[i].CT_PROCESS_FACE=='0') processFace="单面";
                        if(list[i].CT_PROCESS_FACE=='1') processFace="正面";
                        if(list[i].CT_PROCESS_FACE=='2') processFace="反面";
                        if(list[i].CT_PROCESS_FACE=='3') processFace="阴阳面";
                        if(list[i].CR_ROUTE_NAME==null) list[i].CR_ROUTE_NAME="";
                        if(list[i].CT_PREPOSE_TECH==null) list[i].CT_PREPOSE_TECH="";
                        if(list[i].CREATE_USER==null) list[i].CREATE_USER="";
                        if(list[i].CREATE_TIME==null) list[i].CREATE_TIME="";
                        if(list[i].EDIT_USER==null) list[i].EDIT_USER="";
                        if(list[i].EDIT_TIME==null) list[i].EDIT_TIME="";
                        $("#datagrid-btable-ajax9ce89b8198274a25b7219ad226eda21e ").append("<tr id='"+list[i].ID+"'  ondblclick='dblClickShowDetail(this.id)'  ></tr>");
                        $("#datagrid-btable-ajax9ce89b8198274a25b7219ad226eda21e  tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"<input type='hidden' name='ID' value='"+list[i].ID+"' /></td>");
						$("#datagrid-btable-ajax9ce89b8198274a25b7219ad226eda21e tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='9ce89b8198274a25b7219ad226eda21e$ID' value='"+list[i].ID+"'/></td>");
						$("#datagrid-btable-ajax9ce89b8198274a25b7219ad226eda21e tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='text-align: left;width:110px;' title='"+list[i].CT_ID+"'>"+list[i].CT_ID+"</td>");
						$("#datagrid-btable-ajax9ce89b8198274a25b7219ad226eda21e tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='text-align: center;width:110px;' title='"+list[i].CT_NAME+"'>"+list[i].CT_NAME+"</td>");
						$("#datagrid-btable-ajax9ce89b8198274a25b7219ad226eda21e tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='text-align: center;width:90px;' >"+productStep+"</td>");
						$("#datagrid-btable-ajax9ce89b8198274a25b7219ad226eda21e tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='text-align: center;width:90px;' >"+processFace+"</td>");
						$("#datagrid-btable-ajax9ce89b8198274a25b7219ad226eda21e tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='text-align: center;width:110px;' >"+list[i].CR_ROUTE_NAME+"</td>");
						
					
						$("#datagrid-btable-ajax9ce89b8198274a25b7219ad226eda21e tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='text-align: left;width:110px;' >"+list[i].CT_PREPOSE_TECH+"</td>");
						$("#datagrid-btable-ajax9ce89b8198274a25b7219ad226eda21e tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='text-align: center;width:70px;' >"+tempCheck+"</td>");
						
						$("#datagrid-btable-ajax9ce89b8198274a25b7219ad226eda21e tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='text-align: center;width:70px;' >"+tempFreeze+"</td>");
						$("#datagrid-btable-ajax9ce89b8198274a25b7219ad226eda21e tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='text-align: center;width:90px;' >"+list[i].CREATE_USER+"</td>");
						$("#datagrid-btable-ajax9ce89b8198274a25b7219ad226eda21e tr:last").append("<td class='datagrid-cell datagrid-cell-16' style='text-align: center;width:350px;' >"+list[i].CREATE_TIME+"</td>");
						$("#datagrid-btable-ajax9ce89b8198274a25b7219ad226eda21e tr:last").append("<td class='datagrid-cell datagrid-cell-17' style='text-align: center;width:90px;' >"+list[i].EDIT_USER+"</td>");
						
						$("#datagrid-btable-ajax9ce89b8198274a25b7219ad226eda21e tr:last").append("<td class='datagrid-cell datagrid-cell-19' style='text-align: left;width:350px;' >"+list[i].EDIT_TIME+"</td>");
                    }
            }
            pageFun(data.ajaxPage,"9ce89b8198274a25b7219ad226eda21e");
							var tableTrJs = $("#datagrid-btable-ajax9ce89b8198274a25b7219ad226eda21e tbody tr");
							_tongLineColor(tableTrJs);
						clickTr('datagrid-btable-ajax9ce89b8198274a25b7219ad226eda21e');
							defTableWidthRewrite('9ce89b8198274a25b7219ad226eda21e');
        },
        error:function(msg){
            	utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
        }
    })
 }
 

 		function clickTr(tableId){
		    
			$("#"+tableId+" tr").unbind("click");
			$("#"+tableId+" tr input[type=checkbox]").unbind("click");
			$("#"+tableId+" tr").on("click",function(e){
			var trId = $(this).attr("id");
			if ($("#"+trId+" :checkbox").attr("checked")) {
				$("#"+trId+" :checkbox").prop("checked",false);
				$("#"+trId).css("background-color","");
			}else{
				$("#"+tableId+" input[type='checkbox']").each(function(){
					if ($(this).attr("checked")) {
						$(this).prop("checked",false);
						$(this).parents("tr").css("background-color","");
					}
				});
				$("#"+trId+" :checkbox").prop("checked",true);
				$("#"+trId).css("background-color","#a0c8e5");
			}
		});
		
		  $("#"+tableId+" tr input[type=checkbox]").click(function(e) {
			  e.stopPropagation();
			  var style = $(this).parents("tr").attr("style");
			  if(style && style.indexOf("background-color") > -1){
				  $(this).parents("tr").css("background-color","");
			  }else{
				  $(this).parents("tr").css("background-color","#a0c8e5");
			  }
		  });
		}
var isFirstSetScroll=0;
//生成异步表格
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    if(formId=='9ce89b8198274a25b7219ad226eda21e'){<%--工艺信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            if($("#"+formId).find(".left-datagrid-title-ajax").length>0){
                arrLeftHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
                arrLeftHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
                arrLeftHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
                arrLeftHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
                arrLeftHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                arrLeftHtml.push("</td>");
            }else{
                arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
                arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
                arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
                arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                arrHtml.push("</td>");
            }
                arrHtml.push("<td colno='CT_ID' class='datagrid-cell "+ms.tdClass(formId, 'CT_ID')+"' style='width:110px;"+ms.tdStyle(formId, 'CT_ID')+"' "+ms.tdEvent(formId, 'CT_ID')+">")
                arrHtml.push("<span colno='CT_ID' class='"+ms.uiClass(formId, 'CT_ID')+"' style='"+ms.uiStyle(formId, 'CT_ID')+"' "+ms.uiEvent(formId, 'CT_ID')+" title='"+ms.titleAttr(formId,'CT_ID','IS_TITLE_ATTR',v)+"'>"+v['CT_ID']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CT_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CT_NAME')+"' style='width:110px;"+ms.tdStyle(formId, 'CT_NAME')+"' "+ms.tdEvent(formId, 'CT_NAME')+">")
                arrHtml.push("<span colno='CT_NAME' class='"+ms.uiClass(formId, 'CT_NAME')+"' style='"+ms.uiStyle(formId, 'CT_NAME')+"' "+ms.uiEvent(formId, 'CT_NAME')+" title='"+ms.titleAttr(formId,'CT_NAME','IS_TITLE_ATTR',v)+"'>"+v['CT_NAME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CT_PRODUCT_STEP' class='datagrid-cell "+ms.tdClass(formId, 'CT_PRODUCT_STEP')+"' style='width:90px;"+ms.tdStyle(formId, 'CT_PRODUCT_STEP')+"' "+ms.tdEvent(formId, 'CT_PRODUCT_STEP')+">")
                arrHtml.push("<span colno='CT_PRODUCT_STEP' class='"+ms.uiClass(formId, 'CT_PRODUCT_STEP')+"' style='"+ms.uiStyle(formId, 'CT_PRODUCT_STEP')+"' "+ms.uiEvent(formId, 'CT_PRODUCT_STEP')+" title='"+ms.titleAttr(formId,'CT_PRODUCT_STEP','IS_TITLE_ATTR',v)+"'>"+v['CT_PRODUCT_STEP']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CT_PROCESS_FACE' class='datagrid-cell "+ms.tdClass(formId, 'CT_PROCESS_FACE')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'CT_PROCESS_FACE')+"' "+ms.tdEvent(formId, 'CT_PROCESS_FACE')+">")
                arrHtml.push("<span colno='CT_PROCESS_FACE' class='"+ms.uiClass(formId, 'CT_PROCESS_FACE')+"' style='"+ms.uiStyle(formId, 'CT_PROCESS_FACE')+"' "+ms.uiEvent(formId, 'CT_PROCESS_FACE')+" title='"+ms.titleAttr(formId,'CT_PROCESS_FACE','IS_TITLE_ATTR',v)+"'>"+v['CT_PROCESS_FACE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CT_ROUTE_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CT_ROUTE_CODE')+"' style='width:110px;"+ms.tdStyle(formId, 'CT_ROUTE_CODE')+"' "+ms.tdEvent(formId, 'CT_ROUTE_CODE')+">")
                arrHtml.push("<span colno='CT_ROUTE_CODE' class='"+ms.uiClass(formId, 'CT_ROUTE_CODE')+"' style='"+ms.uiStyle(formId, 'CT_ROUTE_CODE')+"' "+ms.uiEvent(formId, 'CT_ROUTE_CODE')+" title='"+ms.titleAttr(formId,'CT_ROUTE_CODE','IS_TITLE_ATTR',v)+"'>"+v['CT_ROUTE_CODE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CT_PREPOSE_TECH' class='datagrid-cell "+ms.tdClass(formId, 'CT_PREPOSE_TECH')+"' style='width:110px;"+ms.tdStyle(formId, 'CT_PREPOSE_TECH')+"' "+ms.tdEvent(formId, 'CT_PREPOSE_TECH')+">")
                arrHtml.push("<span colno='CT_PREPOSE_TECH' class='"+ms.uiClass(formId, 'CT_PREPOSE_TECH')+"' style='"+ms.uiStyle(formId, 'CT_PREPOSE_TECH')+"' "+ms.uiEvent(formId, 'CT_PREPOSE_TECH')+" title='"+ms.titleAttr(formId,'CT_PREPOSE_TECH','IS_TITLE_ATTR',v)+"'>"+v['CT_PREPOSE_TECH']+"</span>")
                arrHtml.push("</td>");
                
                arrHtml.push("<td colno='CT_DEFAULT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'CT_DEFAULT_FLAG')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'CT_DEFAULT_FLAG')+"' "+ms.tdEvent(formId, 'CT_DEFAULT_FLAG')+">")
                arrHtml.push("<span colno='CT_DEFAULT_FLAG' class='"+ms.uiClass(formId, 'CT_DEFAULT_FLAG')+"' style='"+ms.uiStyle(formId, 'CT_DEFAULT_FLAG')+"' "+ms.uiEvent(formId, 'CT_DEFAULT_FLAG')+" title='"+ms.titleAttr(formId,'CT_DEFAULT_FLAG','IS_TITLE_ATTR',v)+"'>"+v['CT_DEFAULT_FLAG']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CT_VALID_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'CT_VALID_FLAG')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'CT_VALID_FLAG')+"' "+ms.tdEvent(formId, 'CT_VALID_FLAG')+">")
                arrHtml.push("<span colno='CT_VALID_FLAG' class='"+ms.uiClass(formId, 'CT_VALID_FLAG')+"' style='"+ms.uiStyle(formId, 'CT_VALID_FLAG')+"' "+ms.uiEvent(formId, 'CT_VALID_FLAG')+" title='"+ms.titleAttr(formId,'CT_VALID_FLAG','IS_TITLE_ATTR',v)+"'>"+v['CT_VALID_FLAG']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_USER' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_USER')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'CREATE_USER')+"' "+ms.tdEvent(formId, 'CREATE_USER')+">")
                arrHtml.push("<span colno='CREATE_USER' class='"+ms.uiClass(formId, 'CREATE_USER')+"' style='"+ms.uiStyle(formId, 'CREATE_USER')+"' "+ms.uiEvent(formId, 'CREATE_USER')+" title='"+ms.titleAttr(formId,'CREATE_USER','IS_TITLE_ATTR',v)+"'>"+v['CREATE_USER']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_TIME')+"' style='width:350px;text-align:center;"+ms.tdStyle(formId, 'CREATE_TIME')+"' "+ms.tdEvent(formId, 'CREATE_TIME')+">")
                arrHtml.push("<span colno='CREATE_TIME' class='"+ms.uiClass(formId, 'CREATE_TIME')+"' style='"+ms.uiStyle(formId, 'CREATE_TIME')+"' "+ms.uiEvent(formId, 'CREATE_TIME')+" title='"+ms.titleAttr(formId,'CREATE_TIME','IS_TITLE_ATTR',v)+"'  >"+v['CREATE_TIME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='EDIT_USER' class='datagrid-cell "+ms.tdClass(formId, 'EDIT_USER')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'EDIT_USER')+"' "+ms.tdEvent(formId, 'EDIT_USER')+">")
                arrHtml.push("<span colno='EDIT_USER' class='"+ms.uiClass(formId, 'EDIT_USER')+"' style='"+ms.uiStyle(formId, 'EDIT_USER')+"' "+ms.uiEvent(formId, 'EDIT_USER')+" title='"+ms.titleAttr(formId,'EDIT_USER','IS_TITLE_ATTR',v)+"'>"+v['EDIT_USER']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='EDIT_TIME' class='datagrid-cell "+ms.tdClass(formId, 'EDIT_TIME')+"' style='width:350px;text-align:center;"+ms.tdStyle(formId, 'EDIT_TIME')+"' "+ms.tdEvent(formId, 'EDIT_TIME')+">")
                arrHtml.push("<span colno='EDIT_TIME' class='"+ms.uiClass(formId, 'EDIT_TIME')+"' style='"+ms.uiStyle(formId, 'EDIT_TIME')+"' "+ms.uiEvent(formId, 'EDIT_TIME')+" title='"+ms.titleAttr(formId,'EDIT_TIME','IS_TITLE_ATTR',v)+"'  >"+v['EDIT_TIME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    setNumColWidth(formId);
    clearAllSelect();
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
                    listAjaxTable($("#formId1").val());
                    //listAjaxTable_print($("#formId1").val());
                    //query("9ce89b8198274a25b7219ad226eda21e");
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