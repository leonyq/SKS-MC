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
		<dict:lang value="VM-仓库捡货方案配置" />
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
		<bu:header formId ="a62aa1e0249f4e2a8a049e7121acc6ce"/>

    
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
		<bu:func viewId="da17d0e549bc4ef3adbf6dc11f3563b5" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="da17d0e549bc4ef3adbf6dc11f3563b5" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagea62aa1e0249f4e2a8a049e7121acc6ce" id="formPagea62aa1e0249f4e2a8a049e7121acc6ce" value="${formPagea62aa1e0249f4e2a8a049e7121acc6ce}"/>
		<input type="hidden" name="formId" id="formId1" value='a62aa1e0249f4e2a8a049e7121acc6ce'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="a62aa1e0249f4e2a8a049e7121acc6ce">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxa62aa1e0249f4e2a8a049e7121acc6ce" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innera62aa1e0249f4e2a8a049e7121acc6ce">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablea62aa1e0249f4e2a8a049e7121acc6ce">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="a62aa1e0249f4e2a8a049e7121acc6ce" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_a62aa1e0249f4e2a8a049e7121acc6ce" onclick="_selectAjaxTableAllData(this,'a62aa1e0249f4e2a8a049e7121acc6ce')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="DATA_AUTH" formId="a62aa1e0249f4e2a8a049e7121acc6ce" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center"><bu:uitn colNo="WPC_PICK_TYPE" formId="a62aa1e0249f4e2a8a049e7121acc6ce" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="WPC_PICK_VALUE" formId="a62aa1e0249f4e2a8a049e7121acc6ce" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="WPC_SCHEME_SN" formId="a62aa1e0249f4e2a8a049e7121acc6ce" /></td>
			<td class="datagrid-cell" style="width:200px; text-align:center"><bu:uitn colNo="WPC_SCHEME_MEMO" formId="a62aa1e0249f4e2a8a049e7121acc6ce" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiva62aa1e0249f4e2a8a049e7121acc6ce" onscroll="ajaxTableScroll(this,'a62aa1e0249f4e2a8a049e7121acc6ce')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxa62aa1e0249f4e2a8a049e7121acc6ce">
		<tbody id="tbody_a62aa1e0249f4e2a8a049e7121acc6ce" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagea62aa1e0249f4e2a8a049e7121acc6ce==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=a62aa1e0249f4e2a8a049e7121acc6ce&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="da17d0e549bc4ef3adbf6dc11f3563b5" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="da17d0e549bc4ef3adbf6dc11f3563b5" />
    
    <script type="text/javascript">
                
                function listAjaxTable(formId){
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    //var url = "/mes/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
                    var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,WPC_PICK_TYPE\"}";
                    var searchParams = $("#searchForm").serialize()+"&"+$("#searchFormTop").serialize();
                    if(isPage(formId)){
                        var isFirstLoad = firstLoadThisPage(formId);
                        var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[formId].currentPage;
                        var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[formId].pageRecord;
                    }
                    util.showLoading("处理中...");
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: url,
                        data:searchParams+"&page.currentPage="+currentPage+"&page.pageRecord=" + pageRecord,
                        success: function(data){
                            if(data.RES){
                                var ms = new MSdata(data);
                                var page = ms.page(formId);
                                createTableModel(ms,formId);
                                if(isPage(formId)){
                                    initPage(page,formId);
                                }
                            }else{
                                utilsFp.confirmIcon(3,"","","", data.RES_MSG,"","260","145");
                            }
                            clearChildTable();
                        	util.closeLoading();
                        },
                        error: function(msg){
                        	util.closeLoading();
                            utilsFp.confirmIcon(3,"","","", msg,"","260","145");
                        }
                    });
                }
                
                
                function isPage(formId){
                    var isPageVal =  $("#formPage"+formId).val();
                    if(isPageVal =="1"){    
                       return true;
                    }
                    return false;
                }
                
                
                function query(thisObj){
                    var formId = $("#formId1").val();
                    listAjaxTable(formId);
                }
                
                
                function clearChildTable(){
                    $(".isChilds").empty();
                    getFormIdInitChildPage();
                }
                
               
               function setTableWidth(formId){
                    /**
                    *var scrollHeight = $("#tableDiv"+formId)[0].scrollHeight;
                    var height = $("#tableDiv"+formId).height();
                    var datagridHeaderWidth = $("#datagrid-view-ajax"+formId+" .datagrid-header").width();
                    if(scrollHeight-height>0){
                      $("#datagrid-htable"+formId).css("width",datagridHeaderWidth-20+'px');
                      $("#datagrid-btable-ajax"+formId).css("width",datagridHeaderWidth-20+'px');
                    }else{
                      $("#datagrid-htable"+formId).css("width",datagridHeaderWidth+'px');
                      $("#datagrid-btable-ajax"+formId).css("width",datagridHeaderWidth+'px');    
                    }
                    *
                    */
                }
            
                
                function alertInfo(msg){
                    utilsFp.alert(msg);
                }
                
                
                function clearAllSelect(){
                    $(".left-datagrid-title-ajax,.datagrid-title-ajax").find("input[type='checkbox']").prop("checked",false);
                }
                
                function reloadPg(msg,title,width,height,time){
                    msgPop(msg,"",title,width,height,time);
                }
                
                
                function listChildAjaxTable(formId,paramList){
                    var data = {
                        "paraMap.formidFirstId":_GLO_FORM_PAGE_MAP[formId].formidFirstId,
                        "paraMap.subFormId":_GLO_FORM_PAGE_MAP[formId].subFormId,
                        "paraMap.subRelColId":_GLO_FORM_PAGE_MAP[formId].subRelColId,
                        "paraMap.relColVal":_GLO_FORM_PAGE_MAP[formId].relColVal,
                        "paraMap.subSortCol":_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColStr,
                        "paraMap.subSortColOrder":_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColOrderStr
                    };
                    if(isPage(formId)){
                        data["page.currentPage"] = _GLO_FORM_PAGE_MAP[formId].currentPage;
                        data["page.pageRecord"] = _GLO_FORM_PAGE_MAP[formId].pageRecord;
                    }
                    if(paramList != null && paramList != ""){
                        data["paramList"] = paramList;
                    }
                    if($("#DATA_AUTH").length>0){
                    	data["DATA_AUTH"] = $("#DATA_AUTH").val();
                    }
                    var url = "${path}buss/bussModel_listMsCasData.ms?exeid=da17d0e549bc4ef3adbf6dc11f3563b5";
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: url,
                        data:data,
                        success: function(data){
                            if(data.RES){
                                var ms = new MSdata(data);
                                var page = ms.page(formId);
                                createTableModel(ms,formId);
                                if(isPage(formId)){
                                    initPage(page,formId);    
                                }
                            }else{
                                utilsFp.confirmIcon(3,"","","", data.RES_MSG,"","260","145");
                            }
                        },
                        error: function(msg){
                            utilsFp.confirmIcon(3,"","","", "后台操作出错!","","260","145");
                        }
                    });
                }
                
                function setCrossWiseScroll(formId,arrHtml){
                    if(arrHtml.length==0){
                        var tableWidth = $("#datagrid-btable-ajax"+formId).width();  
                        arrHtml.push("<tr  style='width: ");
                        arrHtml.push(tableWidth+"px");
                        arrHtml.push(";");
                        arrHtml.push("height:1000px;'");
                        $("#tableDiv"+formId).css({"overflow-y":"hidden","overflow-x":"auto"});
                   }else{
                        $("#tableDiv"+formId).css({"overflow-y":"auto","overflow-x":"auto"});    
                   }
               }
                
                
                function initChildPage(formId){
                    var ajaxPage = new Object();
                    ajaxPage.currentPage = 1;
                    ajaxPage.pageRecord = 20;
                    ajaxPage.totalRecord = 0;
                    ajaxPage.totalPage = 1;
                    ajaxPage.first = true;
                    ajaxPage.last = true;
                    pageFun(ajaxPage,formId);
                }
                
                
                
                function initPage(page,formId){
                    var ajaxPage = new Object();
                    ajaxPage.currentPage = parseInt(page.currentPage);
                    ajaxPage.pageRecord = parseInt(page.pageRecord);
                    ajaxPage.totalPage = parseInt(page.totalPage);
                    ajaxPage.totalRecord = parseInt(page.totalRecord);
                    ajaxPage.first = page.first;
                    ajaxPage.last = page.last;
                    pageFun(ajaxPage,formId);
                };
                
                
                function firstLoadThisPage(formId){
                    if(typeof(_GLO_FORM_PAGE_MAP[formId].currentPage) =="undefined"){
                        return true;
                    }
                    return false;
                }
                
                
                function getFormIdInitChildPage(){
                    var tableCount = $("#tableCount").val();
                    for ( var i = 2; i <= tableCount; i++) {
                        var formId = $("#formId"+i).val();
                        if(isPage(formId)){
                           initChildPage(formId);
                        }
                    }
                }
                
                
                function initTableWidth(){
                    var width = $(window).width() - 2;
                    $(".datagrid-htable,.datagrid-btable").width(width);
                }
                
                
                
                function init(){
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    //initTableWidth();
                    listAjaxTable($("#formId1").val());
                    
                 }
            
                $(function(){
                    var colNo = $("#relColVals").val();
                    var subRelColIds = $("#subRelColIds").val();
                    var subFormIds = $("#subFormIds").val();
                    if(subRelColIds!="null"){
                        var formId1 = $("#formId1").val();
                        $(".isParents tr").live("click",function(){
                            var _this = $(this);
                            var relColVals = "";
                            var abbr = _this.attr("abbr");
                            var arrColNo = colNo.split(",");
                            $(arrColNo).each(function(i,v){
                                relColVals += $("tr[abbr='"+abbr+"']").find("input[name='"+v+"']").val()+",";
                            });
                            setSubData(formId1,subFormIds,subRelColIds,relColVals,"","",true);
                        });
                    };
                });
                
                function getRelColVal(arr,obj,colNo){
                      if(colNo){
                       var arrColNo = colNo.split(",");
                          $(arrColNo).each(function(i,v){
                             if(v!="ID"){
                               arr.push("<input type='hidden' name='"+v+"' value='"+obj[v]+"' />");
                             }
                          });
                      }
                }
            var isFirstSetScroll = 0;
   </script>

    
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
    var uiRaw = ms.uiRaw(formId)==null?[]:ms.uiRaw(formId);
    console.log(uiRaw);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='a62aa1e0249f4e2a8a049e7121acc6ce'){<%--FM-仓库捡货方案配置信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            //arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            //arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID' value='"+v['DATA_AUTH_ID']+"' />")
            //arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")		
	        arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")		
	        arrHtml.push("</td>");
            arrHtml.push("<td colno='WPC_PICK_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'WPC_PICK_TYPE')+"' style='width:100px;"+ms.tdStyle(formId, 'WPC_PICK_TYPE')+"' "+ms.tdEvent(formId, 'WPC_PICK_TYPE')+">")
            arrHtml.push("<span colno='WPC_PICK_TYPE' class='"+ms.uiClass(formId, 'WPC_PICK_TYPE')+"' style='"+ms.uiStyle(formId, 'WPC_PICK_TYPE')+"' "+ms.uiEvent(formId, 'WPC_PICK_TYPE')+" title='"+ms.titleAttr(formId,'WPC_PICK_TYPE','IS_TITLE_ATTR',v)+"' >"+v['WPC_PICK_TYPE']+"</span>")
            arrHtml.push("</td>");
            if(uiRaw[i].WPC_PICK_TYPE==1){
            arrHtml.push("<td colno='WPC_DOC' class='datagrid-cell "+ms.tdClass(formId, 'WPC_DOC')+"' style='width:150px;"+ms.tdStyle(formId, 'WPC_DOC')+"' "+ms.tdEvent(formId, 'WPC_DOC')+">")
            arrHtml.push("<span colno='WPC_DOC' class='"+ms.uiClass(formId, 'WPC_DOC')+"' style='"+ms.uiStyle(formId, 'WPC_DOC')+"' "+ms.uiEvent(formId, 'WPC_DOC')+" title='"+ms.titleAttr(formId,'WPC_DOC','IS_TITLE_ATTR',v)+"' >"+v['WPC_DOC']+"</span>")
            arrHtml.push("</td>");
            }
            if(uiRaw[i].WPC_PICK_TYPE==2){
            arrHtml.push("<td colno='WPC_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WPC_ITEM_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'WPC_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WPC_ITEM_CODE')+">")
            arrHtml.push("<span colno='WPC_ITEM_CODE' class='"+ms.uiClass(formId, 'WPC_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'WPC_ITEM_CODE')+"' "+ms.uiEvent(formId, 'WPC_ITEM_CODE')+" title='"+ms.titleAttr(formId,'WPC_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['WPC_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            }
            if(uiRaw[i].WPC_PICK_TYPE==3){
            arrHtml.push("<td colno='WPC_CUST_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WPC_CUST_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'WPC_CUST_CODE')+"' "+ms.tdEvent(formId, 'WPC_CUST_CODE')+">")
            arrHtml.push("<span colno='WPC_CUST_CODE' class='"+ms.uiClass(formId, 'WPC_CUST_CODE')+"' style='"+ms.uiStyle(formId, 'WPC_CUST_CODE')+"' "+ms.uiEvent(formId, 'WPC_CUST_CODE')+" title='"+ms.titleAttr(formId,'WPC_CUST_CODE','IS_TITLE_ATTR',v)+"' >"+v['WPC_CUST_CODE']+"</span>")
            arrHtml.push("</td>");
            }
            arrHtml.push("<td colno='WPC_SCHEME_SN' class='datagrid-cell "+ms.tdClass(formId, 'WPC_SCHEME_SN')+"' style='width:150px;"+ms.tdStyle(formId, 'WPC_SCHEME_SN')+"' "+ms.tdEvent(formId, 'WPC_SCHEME_SN')+">")
            arrHtml.push("<span colno='WPC_SCHEME_SN' class='"+ms.uiClass(formId, 'WPC_SCHEME_SN')+"' onclick='itemJump1(\""+v['WPC_SCHEME_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WPC_SCHEME_SN')+" title='"+ms.titleAttr(formId,'WPC_SCHEME_SN','IS_TITLE_ATTR',v)+"' >"+v['WPC_SCHEME_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WPC_SCHEME_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'WPC_SCHEME_MEMO')+"' style='width:200px;"+ms.tdStyle(formId, 'WPC_SCHEME_MEMO')+"' "+ms.tdEvent(formId, 'WPC_SCHEME_MEMO')+">")
            arrHtml.push("<span colno='WPC_SCHEME_MEMO' class='"+ms.uiClass(formId, 'WPC_SCHEME_MEMO')+"' style='"+ms.uiStyle(formId, 'WPC_SCHEME_MEMO')+"' "+ms.uiEvent(formId, 'WPC_SCHEME_MEMO')+" title='"+ms.titleAttr(formId,'WPC_SCHEME_MEMO','IS_TITLE_ATTR',v)+"' >"+v['WPC_SCHEME_MEMO']+"</span>")
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
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//拣货方案建档
function itemJump1(obj){
      winOptMethod.jump("67e3a6464bb04ee1a398638bd26006e8","F6590","jumpId",obj);
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
