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
		<dict:lang value="货架多色灯列表" />
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
		<bu:header formId ="e5b14e462ec74fa49c5694fe412b4071"/>

    
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
		        <bu:func viewId="0c7a5517826f453a9ebb1e24b0888aca" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     

  <table class="search_table">
      <bu:search deal_mark="1" viewId="0c7a5517826f453a9ebb1e24b0888aca" /> 

  </table>

                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagee5b14e462ec74fa49c5694fe412b4071" id="formPagee5b14e462ec74fa49c5694fe412b4071" value="${formPagee5b14e462ec74fa49c5694fe412b4071}"/>
		<input type="hidden" name="formId" id="formId1" value='e5b14e462ec74fa49c5694fe412b4071'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="e5b14e462ec74fa49c5694fe412b4071">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxe5b14e462ec74fa49c5694fe412b4071" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innere5b14e462ec74fa49c5694fe412b4071">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablee5b14e462ec74fa49c5694fe412b4071">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="e5b14e462ec74fa49c5694fe412b4071" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_e5b14e462ec74fa49c5694fe412b4071" onclick="_selectAjaxTableAllData(this,'e5b14e462ec74fa49c5694fe412b4071')" style="cursor: pointer;"title="全选"/></span></td>
			<td name="noprintset_DATA_AUTH" style="width:200px;" class="datagrid-cell"><bu:uitn colNo="DATA_AUTH" formId="e5b14e462ec74fa49c5694fe412b4071" /></td>
			<td name="noprintset_WML_COLOR_SN" style="width:100px;" class="datagrid-cell"><bu:uitn colNo="WML_COLOR_SN" formId="e5b14e462ec74fa49c5694fe412b4071" /></td>
			<td name="noprintset_WML_COLOR" style="width:100px;" class="datagrid-cell"><bu:uitn colNo="WML_COLOR" formId="e5b14e462ec74fa49c5694fe412b4071" /></td>
		    <td name="noprintset_WML_DOC_NUM" style="width:150px;" class="datagrid-cell"><bu:uitn colNo="WML_DOC_NUM" formId="e5b14e462ec74fa49c5694fe412b4071" /></td>
			<td name="noprintset_WML_DOC_TYPE" style="width:100px;" class="datagrid-cell"><bu:uitn colNo="WML_DOC_TYPE" formId="e5b14e462ec74fa49c5694fe412b4071" /></td>
			<td name="noprintset_WML_STATUS" style="width:70px;" class="datagrid-cell"><bu:uitn colNo="WML_STATUS" formId="e5b14e462ec74fa49c5694fe412b4071" /></td>
			<td name="noprintset_WML_DISABLE_FLAG" style="width:70px;" class="datagrid-cell"><bu:uitn colNo="WML_DISABLE_FLAG" formId="e5b14e462ec74fa49c5694fe412b4071" /></td>
		    <td name="noprintset_WML_TIME" style="width:140px;" class="datagrid-cell"><bu:uitn colNo="WML_TIME" formId="e5b14e462ec74fa49c5694fe412b4071" /></td>
	        <td name="noprintset_WML_MEMO" style="width:200px;" class="datagrid-cell"><bu:uitn colNo="WML_MEMO" formId="e5b14e462ec74fa49c5694fe412b4071" /></td>
		
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDive5b14e462ec74fa49c5694fe412b4071" onscroll="ajaxTableScroll(this,'e5b14e462ec74fa49c5694fe412b4071')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxe5b14e462ec74fa49c5694fe412b4071">
		<tbody id="tbody_e5b14e462ec74fa49c5694fe412b4071" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagee5b14e462ec74fa49c5694fe412b4071==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=e5b14e462ec74fa49c5694fe412b4071&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('e5b14e462ec74fa49c5694fe412b4071','1');">打印</button>
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
 <td style="width: 100px;text-align: right;"><span>?颜色编码</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WML_COLOR_SN" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WML_COLOR_SN" value="" title_name="?颜色编码" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?灯颜色</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WML_COLOR" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WML_COLOR" value="" title_name="?灯颜色" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>单据类型</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WML_DOC_TYPE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WML_DOC_TYPE" value="" title_name="单据类型" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>备注</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WML_MEMO" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WML_MEMO" value="" title_name="备注" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?状态（0-空闲，1-使用中）</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WML_STATUS" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WML_STATUS" value="" title_name="?状态（0-空闲，1-使用中）" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?是否禁用（Y/N）</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WML_DISABLE_FLAG" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WML_DISABLE_FLAG" value="" title_name="?是否禁用（Y/N）" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>关联单号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WML_DOC_NUM" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WML_DOC_NUM" value="" title_name="关联单号" />px
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
		<bu:submit viewId="0c7a5517826f453a9ebb1e24b0888aca" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="0c7a5517826f453a9ebb1e24b0888aca" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
   
   
   <script type="text/javascript">
                
                function listAjaxTable(formId){
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    //var url = "/N2/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
                    var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,WML_STATUS\"}";
                    //var url = "/N2/buss/bussModel_listMsData.ms";
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
                    //utilsFp.alert(msg);
                    utilsFp.confirmIcon(3,"","","", msg,"","350","");
                    
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
                    var url = "${path}buss/bussModel_listMsCasData.ms?exeid=2168596ab39a42fab6b43fafbed16bdd";
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
                        arrHtml.push("<tr>");
                        var tableWidth = 0;
                        var matchReg =/.*width\s*:\s*(\d*\.?\d*)px/;
						var widthDisplay =/.*display\s*:\s*(\d+)e/;
                        $("#datagrid-htable"+formId+" .datagrid-header-row>td").each(function (i,v) {
                        	var styleTd = $(this).attr("style");
                    		if(styleTd && styleTd.indexOf("display")>-1&&styleTd.match(widthDisplay)!=null&&styleTd.match(widthDisplay)=="non"){
                        		return true;
                        	}
                    		if(styleTd && styleTd.indexOf("width")>-1){
                    			arrHtml.push("<td  style='visibility:hidden;width:"+parseFloat(styleTd.match(matchReg)[1])+"px;'></td>");
                        	};
                    	});
                        arrHtml.push("</tr>");
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
                    initTableWidth();
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
    var uiRaw = ms.uiRaw(formId)==null?[]:ms.uiRaw(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='e5b14e462ec74fa49c5694fe412b4071'){<%--仓库多色灯信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            
            //arrHtml.push("<td colno='DATA_AUTH' name='noprintset_DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            //arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"'  >"+v['DATA_AUTH']+"</span>")
            //arrHtml.push("<input type='hidden' id='DATA_AUTH_ID' value='"+v['DATA_AUTH_ID']+"' />");
            //arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")		
	        arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")		
	        arrHtml.push("</td>");
            
            arrHtml.push("<td colno='WML_COLOR_SN' name='noprintset_WML_COLOR_SN' class='datagrid-cell "+ms.tdClass(formId, 'WML_COLOR_SN')+"' style='"+ms.tdStyle(formId, 'WML_COLOR_SN')+"' "+ms.tdEvent(formId, 'WML_COLOR_SN')+">")
            arrHtml.push("<span colno='WML_COLOR_SN' class='"+ms.uiClass(formId, 'WML_COLOR_SN')+"' style='width:100px;text-align:center;'"+ms.uiEvent(formId, 'WML_COLOR_SN')+" title='"+ms.titleAttr(formId,'WML_COLOR_SN','IS_TITLE_ATTR',v)+"' >"+v['WML_COLOR_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WML_COLOR' name='noprintset_WML_COLOR' class='datagrid-cell "+ms.tdClass(formId, 'WML_COLOR')+"' style='"+ms.tdStyle(formId, 'WML_COLOR')+"' "+ms.tdEvent(formId, 'WML_COLOR')+">")
            arrHtml.push("<span colno='WML_COLOR' class='"+ms.uiClass(formId, 'WML_COLOR')+"' style='width:100px;text-align:center;'"+ms.uiEvent(formId, 'WML_COLOR')+" title='"+ms.titleAttr(formId,'WML_COLOR','IS_TITLE_ATTR',v)+"' >"+v['WML_COLOR']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WML_DOC_NUM' name='noprintset_WML_DOC_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WML_DOC_NUM')+"' style='"+ms.tdStyle(formId, 'WML_DOC_NUM')+"' "+ms.tdEvent(formId, 'WML_DOC_NUM')+">")
            arrHtml.push("<span colno='WML_DOC_NUM' class='"+ms.uiClass(formId, 'WML_DOC_NUM')+"' style='width:150px;text-align:center;'"+ms.uiEvent(formId, 'WML_DOC_NUM')+" title='"+ms.titleAttr(formId,'WML_DOC_NUM','IS_TITLE_ATTR',v)+"' >"+v['WML_DOC_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WML_DOC_TYPE' name='noprintset_WML_DOC_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'WML_DOC_TYPE')+"' style='"+ms.tdStyle(formId, 'WML_DOC_TYPE')+"' "+ms.tdEvent(formId, 'WML_DOC_TYPE')+">")
            arrHtml.push("<span colno='WML_DOC_TYPE' class='"+ms.uiClass(formId, 'WML_DOC_TYPE')+"' style='width:100px;text-align:center;'"+ms.uiEvent(formId, 'WML_DOC_TYPE')+" title='"+ms.titleAttr(formId,'WML_DOC_TYPE','IS_TITLE_ATTR',v)+"' >"+v['WML_DOC_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WML_STATUS' name='noprintset_WML_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'WML_STATUS')+"' style='"+ms.tdStyle(formId, 'WML_STATUS')+"' "+ms.tdEvent(formId, 'WML_STATUS')+">")
            arrHtml.push("<span colno='WML_STATUS' class='"+ms.uiClass(formId, 'WML_STATUS')+"' style='width:70px;text-align:center;'"+ms.uiEvent(formId, 'WML_STATUS')+" title='"+ms.titleAttr(formId,'WML_STATUS','IS_TITLE_ATTR',v)+"' >"+v['WML_STATUS']+"</span>")
            arrHtml.push("<input type='hidden' id='id"+v.ID+"' name='WML_STATUS' value='"+uiRaw[i].WML_STATUS+"' /></td>");
            arrHtml.push("<td colno='WML_DISABLE_FLAG' name='noprintset_WML_DISABLE_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WML_DISABLE_FLAG')+"' style='"+ms.tdStyle(formId, 'WML_DISABLE_FLAG')+"' "+ms.tdEvent(formId, 'WML_DISABLE_FLAG')+">")
            arrHtml.push("<span colno='WML_DISABLE_FLAG' class='"+ms.uiClass(formId, 'WML_DISABLE_FLAG')+"' style='width:70px;text-align:center;'"+ms.uiEvent(formId, 'WML_DISABLE_FLAG')+" title='"+ms.titleAttr(formId,'WML_DISABLE_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WML_DISABLE_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WML_TIME' name='noprintset_WML_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WML_TIME')+"' style='"+ms.tdStyle(formId, 'WML_TIME')+"' "+ms.tdEvent(formId, 'WML_TIME')+">")
            arrHtml.push("<span colno='WML_TIME' class='"+ms.uiClass(formId, 'WML_TIME')+"' style='width:140px;text-align:center;'"+ms.uiEvent(formId, 'WML_TIME')+" title='"+ms.titleAttr(formId,'WML_TIME','IS_TITLE_ATTR',v)+"' >"+v['WML_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WML_MEMO' name='noprintset_WML_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'WML_MEMO')+"' style='"+ms.tdStyle(formId, 'WML_MEMO')+"' "+ms.tdEvent(formId, 'WML_MEMO')+">")
            arrHtml.push("<span colno='WML_MEMO' class='"+ms.uiClass(formId, 'WML_MEMO')+"' style='width:200px;' "+ms.uiEvent(formId, 'WML_MEMO')+" title='"+ms.titleAttr(formId,'WML_MEMO','IS_TITLE_ATTR',v)+"' >"+v['WML_MEMO']+"</span>")
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
<%--生成异步表格--%>
function createTableModel_print(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='e5b14e462ec74fa49c5694fe412b4071'){<%--仓库多色灯信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
   
            arrHtml.push("<td colno='DATA_AUTH' name='noprintset_DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"'  >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID' value='"+v['DATA_AUTH_ID']+"' />");
            arrHtml.push("</td>");
            
            arrHtml.push("<td colno='WML_COLOR_SN' name='noprintset_WML_COLOR_SN' class='datagrid-cell "+ms.tdClass(formId, 'WML_COLOR_SN')+"' style='"+ms.tdStyle(formId, 'WML_COLOR_SN')+"' "+ms.tdEvent(formId, 'WML_COLOR_SN')+">")
            arrHtml.push("<span colno='WML_COLOR_SN' class='"+ms.uiClass(formId, 'WML_COLOR_SN')+"' style='width:100px;text-align:center;'"+ms.uiEvent(formId, 'WML_COLOR_SN')+" title='"+ms.titleAttr(formId,'WML_COLOR_SN','IS_TITLE_ATTR',v)+"' >"+v['WML_COLOR_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WML_COLOR' name='noprintset_WML_COLOR' class='datagrid-cell "+ms.tdClass(formId, 'WML_COLOR')+"' style='"+ms.tdStyle(formId, 'WML_COLOR')+"' "+ms.tdEvent(formId, 'WML_COLOR')+">")
            arrHtml.push("<span colno='WML_COLOR' class='"+ms.uiClass(formId, 'WML_COLOR')+"' style='width:100px;text-align:center;'"+ms.uiEvent(formId, 'WML_COLOR')+" title='"+ms.titleAttr(formId,'WML_COLOR','IS_TITLE_ATTR',v)+"' >"+v['WML_COLOR']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WML_DOC_NUM' name='noprintset_WML_DOC_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WML_DOC_NUM')+"' style='"+ms.tdStyle(formId, 'WML_DOC_NUM')+"' "+ms.tdEvent(formId, 'WML_DOC_NUM')+">")
            arrHtml.push("<span colno='WML_DOC_NUM' class='"+ms.uiClass(formId, 'WML_DOC_NUM')+"' style='width:150px;text-align:center;'"+ms.uiEvent(formId, 'WML_DOC_NUM')+" title='"+ms.titleAttr(formId,'WML_DOC_NUM','IS_TITLE_ATTR',v)+"' >"+v['WML_DOC_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WML_DOC_TYPE' name='noprintset_WML_DOC_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'WML_DOC_TYPE')+"' style='"+ms.tdStyle(formId, 'WML_DOC_TYPE')+"' "+ms.tdEvent(formId, 'WML_DOC_TYPE')+">")
            arrHtml.push("<span colno='WML_DOC_TYPE' class='"+ms.uiClass(formId, 'WML_DOC_TYPE')+"' style='width:100px;text-align:center;'"+ms.uiEvent(formId, 'WML_DOC_TYPE')+" title='"+ms.titleAttr(formId,'WML_DOC_TYPE','IS_TITLE_ATTR',v)+"' >"+v['WML_DOC_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WML_STATUS' name='noprintset_WML_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'WML_STATUS')+"' style='"+ms.tdStyle(formId, 'WML_STATUS')+"' "+ms.tdEvent(formId, 'WML_STATUS')+">")
            arrHtml.push("<span colno='WML_STATUS' class='"+ms.uiClass(formId, 'WML_STATUS')+"' style='width:70px;text-align:center;'"+ms.uiEvent(formId, 'WML_STATUS')+" title='"+ms.titleAttr(formId,'WML_STATUS','IS_TITLE_ATTR',v)+"' >"+v['WML_STATUS']+"</span>")
            arrHtml.push("<input type='hidden' id='id"+v.ID+"' name='WML_STATUS' value='"+uiRaw[i].WML_STATUS+"' /></td>");
            arrHtml.push("<td colno='WML_DISABLE_FLAG' name='noprintset_WML_DISABLE_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WML_DISABLE_FLAG')+"' style='"+ms.tdStyle(formId, 'WML_DISABLE_FLAG')+"' "+ms.tdEvent(formId, 'WML_DISABLE_FLAG')+">")
            arrHtml.push("<span colno='WML_DISABLE_FLAG' class='"+ms.uiClass(formId, 'WML_DISABLE_FLAG')+"' style='width:70px;text-align:center;'"+ms.uiEvent(formId, 'WML_DISABLE_FLAG')+" title='"+ms.titleAttr(formId,'WML_DISABLE_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WML_DISABLE_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WML_TIME' name='noprintset_WML_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WML_TIME')+"' style='"+ms.tdStyle(formId, 'WML_TIME')+"' "+ms.tdEvent(formId, 'WML_TIME')+">")
            arrHtml.push("<span colno='WML_TIME' class='"+ms.uiClass(formId, 'WML_TIME')+"' style='width:140px;text-align:center;'"+ms.uiEvent(formId, 'WML_TIME')+" title='"+ms.titleAttr(formId,'WML_TIME','IS_TITLE_ATTR',v)+"' >"+v['WML_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WML_MEMO' name='noprintset_WML_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'WML_MEMO')+"' style='"+ms.tdStyle(formId, 'WML_MEMO')+"' "+ms.tdEvent(formId, 'WML_MEMO')+">")
            arrHtml.push("<span colno='WML_MEMO' class='"+ms.uiClass(formId, 'WML_MEMO')+"' style='width:200px;' "+ms.uiEvent(formId, 'WML_MEMO')+" title='"+ms.titleAttr(formId,'WML_MEMO','IS_TITLE_ATTR',v)+"' >"+v['WML_MEMO']+"</span>")
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
    setScroll(formId);
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
