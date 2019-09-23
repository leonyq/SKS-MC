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
		<dict:lang value="物料作业记录日志信息" />
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
		<bu:header formId ="cd67e8187c6f40b19d71df62d3b872c8"/>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
</head>

<body scroll="auto" style="overflow: auto;" >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="879cfb19cdee417aa921a29839d9bad7" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                        </jsp:include>
		<bu:search viewId="879cfb19cdee417aa921a29839d9bad7" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                   <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                    </jsp:include>
		<input type="hidden" name="formPagecd67e8187c6f40b19d71df62d3b872c8" id="formPagecd67e8187c6f40b19d71df62d3b872c8" value="${formPagecd67e8187c6f40b19d71df62d3b872c8}"/>
		<input type="hidden" name="formId" id="formId1" value='cd67e8187c6f40b19d71df62d3b872c8'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="cd67e8187c6f40b19d71df62d3b872c8">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxcd67e8187c6f40b19d71df62d3b872c8">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innercd67e8187c6f40b19d71df62d3b872c8">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablecd67e8187c6f40b19d71df62d3b872c8"  >
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="cd67e8187c6f40b19d71df62d3b872c8" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_cd67e8187c6f40b19d71df62d3b872c8" onclick="_selectAjaxTableAllData(this,'cd67e8187c6f40b19d71df62d3b872c8')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WSI_MO_NUMBER" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_ACTIONTYPE" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_ITEM_TYPE" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WSI_MODEL_CODE" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_PROCESS_FACE" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WSI_AREA_ID" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WSI_WORKSTATION_SN" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_ONLINE_FLAG" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<td class="datagrid-cell" style="width:180px;"><bu:uitn colNo="WSI_ITEM_SN" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WSI_ITEM_CODE" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_LOT_NO" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_ITEM_COUNT" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_INIT_COUNT" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_POINT" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_POINT_NUM" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WSI_SUPPLIERS" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<td class="datagrid-cell" style="width:180px;"><bu:uitn colNo="WSI_ITEM_SN_OLD" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WSI_ITEM_CODE_OLD" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_LOT_NO_OLD" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_COUNT_OLD" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WSI_DEVICE_SN" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_DEVICE_SEQ" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WSI_TRUCK_NO" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WSI_TABLE_NO" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WSI_LOADPOINT_SN" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WSI_FEEDER_SN" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_CHANEL_NO" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_TRAY_FLAG" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_REPEAT_FLAG" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_EMP" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
			<td class="datagrid-cell"style="width:140px;"><bu:uitn colNo="WSI_LOADTIME" formId="cd67e8187c6f40b19d71df62d3b872c8" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax  scroll1" id="tableDivcd67e8187c6f40b19d71df62d3b872c8" onscroll="ajaxTableScroll(this,'cd67e8187c6f40b19d71df62d3b872c8')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxcd67e8187c6f40b19d71df62d3b872c8" >
		<tbody id="tbody_cd67e8187c6f40b19d71df62d3b872c8" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagecd67e8187c6f40b19d71df62d3b872c8==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=cd67e8187c6f40b19d71df62d3b872c8&showLoading=0" />
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
		<bu:submit viewId="879cfb19cdee417aa921a29839d9bad7" />
		<bu:script viewId="879cfb19cdee417aa921a29839d9bad7" />
	<!--	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        	<jsp:param name="modelName" value="VIEW_TYPE_17" />
        	<jsp:param name="location" value="jsLoading" />
        </jsp:include> -->
          <script type="text/javascript">
                
                function listAjaxTable(formId){
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    //var url = "/N2/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
                    var url = "/N2/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
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
                                console.log(ms);
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
                        	if(msg.readyState!=0){
				              util.closeLoading();
				              utilsFp.confirmIcon(3,"","","", msg,"","260","145");
                            }
                        }
                    });
                }
                
                //打印
                function listAjaxTable_print(formId){
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    //var url = "/N2/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
                    var url = "/N2/buss/bussModel_listMsDataPrint.ms";
                    var searchParams = $("#searchForm").serialize()+"&"+$("#searchFormTop").serialize();
                    if(isPage(formId)){
                        var isFirstLoad = firstLoadThisPage(formId);
                        var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[formId].currentPage;
                        var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[formId].pageRecord;
                    }
                    //util.showLoading("处理中...");
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: url,
                        data:searchParams+"&page.currentPage="+currentPage+"&page.pageRecord=" + pageRecord,
                        success: function(data){
                        	
                           
                            if(data.RES){
                                var ms = new MSdata(data);
                                var page = ms.page(formId);
                                
                                createTableModel_print(ms,formId);
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
                        	if(msg.readyState!=0){
				              util.closeLoading();
				              utilsFp.confirmIcon(3,"","","", msg,"","260","145");
                            }
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
                  // if( getDealSearchMultiTimeSlotBtn())
                  try{
                    chkMsSaveMarkUtils.saveConfig();
                      
                  }catch(err){
                      
                  }
                $('.scroll1').mCustomScrollbar("destroy");
                 listAjaxTable(formId);	
                 setPopScroll('.scroll1','.head1');
                        $('.head1')[0].scrollLeft = 0
                     //listAjaxTable_print(formId);
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
                    var url = "/N2/buss/bussModel_listMsCasData.ms?exeid=adfc3cdd94ca4caa860c7dfbcbbceb83";
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
                        if(msg.readyState!=0){
				             utilsFp.confirmIcon(3,"","","", "后台操作出错!","","260","145");
                         }
                        }
                    });
                }
                
                function setCrossWiseScroll(formId,arrHtml){
                    if(arrHtml.length==0){
                        var tableWidth = $("#datagrid-btable-ajax"+formId).width();  
                        arrHtml.push("<tr  style='width: ");
                        arrHtml.push(tableWidth+"px");
                        arrHtml.push(";");
                        arrHtml.push("height:1000px;'></tr>");
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
                    //var width = $(window).width() - 2;
                    //$(".datagrid-body-ajax >.datagrid-htable,.datagrid-body-ajax >.datagrid-btable").width(width);
                }
                
                
                
                function init(){
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    initTableWidth();
                    listAjaxTable($("#formId1").val());
                    //listAjaxTable_print($("#formId1").val());
                    
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
    if(formId=='cd67e8187c6f40b19d71df62d3b872c8'){<%--物料作业记录日志--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'WSI_MO_NUMBER')+"' style='width:150px;"+ms.tdStyle(formId, 'WSI_MO_NUMBER')+"' "+ms.tdEvent(formId, 'WSI_MO_NUMBER')+">")
            arrHtml.push("<span colno='WSI_MO_NUMBER' class='"+ms.uiClass(formId, 'WSI_MO_NUMBER')+"' style='"+ms.uiStyle(formId, 'WSI_MO_NUMBER')+"' "+ms.uiEvent(formId, 'WSI_MO_NUMBER')+" title='"+v['WSI_MO_NUMBER']+"'>"+v['WSI_MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ACTIONTYPE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ACTIONTYPE')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WSI_ACTIONTYPE')+"' "+ms.tdEvent(formId, 'WSI_ACTIONTYPE')+">")
            arrHtml.push("<span colno='WSI_ACTIONTYPE' class='"+ms.uiClass(formId, 'WSI_ACTIONTYPE')+"' style='"+ms.uiStyle(formId, 'WSI_ACTIONTYPE')+"' "+ms.uiEvent(formId, 'WSI_ACTIONTYPE')+" title='"+v['WSI_ACTIONTYPE']+"'>"+v['WSI_ACTIONTYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_TYPE')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WSI_ITEM_TYPE')+"' "+ms.tdEvent(formId, 'WSI_ITEM_TYPE')+">")
            arrHtml.push("<span colno='WSI_ITEM_TYPE' class='"+ms.uiClass(formId, 'WSI_ITEM_TYPE')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_TYPE')+"' "+ms.uiEvent(formId, 'WSI_ITEM_TYPE')+" title='"+v['WSI_ITEM_TYPE']+"'>"+v['WSI_ITEM_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_MODEL_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'WSI_MODEL_CODE')+"' "+ms.tdEvent(formId, 'WSI_MODEL_CODE')+">")
            arrHtml.push("<span colno='WSI_MODEL_CODE' class='"+ms.uiClass(formId, 'WSI_MODEL_CODE')+"' style='"+ms.uiStyle(formId, 'WSI_MODEL_CODE')+"' "+ms.uiEvent(formId, 'WSI_MODEL_CODE')+" title='"+v['WSI_MODEL_CODE']+"'>"+v['WSI_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_PROCESS_FACE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_PROCESS_FACE')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WSI_PROCESS_FACE')+"' "+ms.tdEvent(formId, 'WSI_PROCESS_FACE')+">")
            arrHtml.push("<span colno='WSI_PROCESS_FACE' class='"+ms.uiClass(formId, 'WSI_PROCESS_FACE')+"' style='"+ms.uiStyle(formId, 'WSI_PROCESS_FACE')+"' "+ms.uiEvent(formId, 'WSI_PROCESS_FACE')+" title='"+v['WSI_PROCESS_FACE']+"'>"+v['WSI_PROCESS_FACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_AREA_ID' class='datagrid-cell "+ms.tdClass(formId, 'WSI_AREA_ID')+"' style='width:100px;"+ms.tdStyle(formId, 'WSI_AREA_ID')+"' "+ms.tdEvent(formId, 'WSI_AREA_ID')+">")
            arrHtml.push("<span colno='WSI_AREA_ID' class='"+ms.uiClass(formId, 'WSI_AREA_ID')+"' style='"+ms.uiStyle(formId, 'WSI_AREA_ID')+"' "+ms.uiEvent(formId, 'WSI_AREA_ID')+" title='"+v['WSI_AREA_ID']+"'>"+v['WSI_AREA_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_WORKSTATION_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_WORKSTATION_SN')+"' style='width:100px;"+ms.tdStyle(formId, 'WSI_WORKSTATION_SN')+"' "+ms.tdEvent(formId, 'WSI_WORKSTATION_SN')+">")
            arrHtml.push("<span colno='WSI_WORKSTATION_SN' class='"+ms.uiClass(formId, 'WSI_WORKSTATION_SN')+"' style='"+ms.uiStyle(formId, 'WSI_WORKSTATION_SN')+"' "+ms.uiEvent(formId, 'WSI_WORKSTATION_SN')+" title='"+v['WSI_WORKSTATION_SN']+"'>"+v['WSI_WORKSTATION_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ONLINE_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ONLINE_FLAG')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WSI_ONLINE_FLAG')+"' "+ms.tdEvent(formId, 'WSI_ONLINE_FLAG')+">")
            arrHtml.push("<span colno='WSI_ONLINE_FLAG' class='"+ms.uiClass(formId, 'WSI_ONLINE_FLAG')+"' style='"+ms.uiStyle(formId, 'WSI_ONLINE_FLAG')+"' "+ms.uiEvent(formId, 'WSI_ONLINE_FLAG')+" title='"+v['WSI_ONLINE_FLAG']+"'>"+v['WSI_ONLINE_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_SN')+"' style='width:180px;"+ms.tdStyle(formId, 'WSI_ITEM_SN')+"' "+ms.tdEvent(formId, 'WSI_ITEM_SN')+">")
            arrHtml.push("<span colno='WSI_ITEM_SN' class='"+ms.uiClass(formId, 'WSI_ITEM_SN')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_SN')+"' "+ms.uiEvent(formId, 'WSI_ITEM_SN')+" title='"+v['WSI_ITEM_SN']+"'>"+v['WSI_ITEM_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_CODE')+"' style='width:120px;"+ms.tdStyle(formId, 'WSI_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WSI_ITEM_CODE')+">")
            arrHtml.push("<span colno='WSI_ITEM_CODE' class='"+ms.uiClass(formId, 'WSI_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_CODE')+"' "+ms.uiEvent(formId, 'WSI_ITEM_CODE')+" title='"+v['WSI_ITEM_CODE']+"'>"+v['WSI_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_LOT_NO' class='datagrid-cell "+ms.tdClass(formId, 'WSI_LOT_NO')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WSI_LOT_NO')+"' "+ms.tdEvent(formId, 'WSI_LOT_NO')+">")
            arrHtml.push("<span colno='WSI_LOT_NO' class='"+ms.uiClass(formId, 'WSI_LOT_NO')+"' style='"+ms.uiStyle(formId, 'WSI_LOT_NO')+"' "+ms.uiEvent(formId, 'WSI_LOT_NO')+" title='"+v['WSI_LOT_NO']+"'>"+v['WSI_LOT_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_COUNT')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'WSI_ITEM_COUNT')+"' "+ms.tdEvent(formId, 'WSI_ITEM_COUNT')+">")
            arrHtml.push("<span colno='WSI_ITEM_COUNT' class='"+ms.uiClass(formId, 'WSI_ITEM_COUNT')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_COUNT')+"' "+ms.uiEvent(formId, 'WSI_ITEM_COUNT')+" title='"+v['WSI_ITEM_COUNT']+"'>"+v['WSI_ITEM_COUNT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_INIT_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'WSI_INIT_COUNT')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'WSI_INIT_COUNT')+"' "+ms.tdEvent(formId, 'WSI_INIT_COUNT')+">")
            arrHtml.push("<span colno='WSI_INIT_COUNT' class='"+ms.uiClass(formId, 'WSI_INIT_COUNT')+"' style='"+ms.uiStyle(formId, 'WSI_INIT_COUNT')+"' "+ms.uiEvent(formId, 'WSI_INIT_COUNT')+" title='"+v['WSI_INIT_COUNT']+"'>"+v['WSI_INIT_COUNT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_POINT' class='datagrid-cell "+ms.tdClass(formId, 'WSI_POINT')+"' style='width:80px;"+ms.tdStyle(formId, 'WSI_POINT')+"' "+ms.tdEvent(formId, 'WSI_POINT')+">")
            arrHtml.push("<span colno='WSI_POINT' class='"+ms.uiClass(formId, 'WSI_POINT')+"' style='"+ms.uiStyle(formId, 'WSI_POINT')+"' "+ms.uiEvent(formId, 'WSI_POINT')+" title='"+v['WSI_POINT']+"'>"+v['WSI_POINT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_POINT_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WSI_POINT_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'WSI_POINT_NUM')+"' "+ms.tdEvent(formId, 'WSI_POINT_NUM')+">")
            arrHtml.push("<span colno='WSI_POINT_NUM' class='"+ms.uiClass(formId, 'WSI_POINT_NUM')+"' style='"+ms.uiStyle(formId, 'WSI_POINT_NUM')+"' "+ms.uiEvent(formId, 'WSI_POINT_NUM')+" title='"+v['WSI_POINT_NUM']+"'>"+v['WSI_POINT_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_SUPPLIERS' class='datagrid-cell "+ms.tdClass(formId, 'WSI_SUPPLIERS')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'WSI_SUPPLIERS')+"' "+ms.tdEvent(formId, 'WSI_SUPPLIERS')+">")
            arrHtml.push("<span colno='WSI_SUPPLIERS' class='"+ms.uiClass(formId, 'WSI_SUPPLIERS')+"' style='"+ms.uiStyle(formId, 'WSI_SUPPLIERS')+"' "+ms.uiEvent(formId, 'WSI_SUPPLIERS')+" title='"+v['WSI_SUPPLIERS']+"'>"+v['WSI_SUPPLIERS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_SN_OLD' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_SN_OLD')+"' style='width:180px;"+ms.tdStyle(formId, 'WSI_ITEM_SN_OLD')+"' "+ms.tdEvent(formId, 'WSI_ITEM_SN_OLD')+">")
            arrHtml.push("<span colno='WSI_ITEM_SN_OLD' class='"+ms.uiClass(formId, 'WSI_ITEM_SN_OLD')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_SN_OLD')+"' "+ms.uiEvent(formId, 'WSI_ITEM_SN_OLD')+" title='"+v['WSI_ITEM_SN_OLD']+"'>"+v['WSI_ITEM_SN_OLD']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_CODE_OLD' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_CODE_OLD')+"' style='width:120px;"+ms.tdStyle(formId, 'WSI_ITEM_CODE_OLD')+"' "+ms.tdEvent(formId, 'WSI_ITEM_CODE_OLD')+">")
            arrHtml.push("<span colno='WSI_ITEM_CODE_OLD' class='"+ms.uiClass(formId, 'WSI_ITEM_CODE_OLD')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_CODE_OLD')+"' "+ms.uiEvent(formId, 'WSI_ITEM_CODE_OLD')+" title='"+v['WSI_ITEM_CODE_OLD']+"'>"+v['WSI_ITEM_CODE_OLD']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_LOT_NO_OLD' class='datagrid-cell "+ms.tdClass(formId, 'WSI_LOT_NO_OLD')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WSI_LOT_NO_OLD')+"' "+ms.tdEvent(formId, 'WSI_LOT_NO_OLD')+">")
            arrHtml.push("<span colno='WSI_LOT_NO_OLD' class='"+ms.uiClass(formId, 'WSI_LOT_NO_OLD')+"' style='"+ms.uiStyle(formId, 'WSI_LOT_NO_OLD')+"' "+ms.uiEvent(formId, 'WSI_LOT_NO_OLD')+" title='"+v['WSI_LOT_NO_OLD']+"'>"+v['WSI_LOT_NO_OLD']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_COUNT_OLD' class='datagrid-cell "+ms.tdClass(formId, 'WSI_COUNT_OLD')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'WSI_COUNT_OLD')+"' "+ms.tdEvent(formId, 'WSI_COUNT_OLD')+">")
            arrHtml.push("<span colno='WSI_COUNT_OLD' class='"+ms.uiClass(formId, 'WSI_COUNT_OLD')+"' style='"+ms.uiStyle(formId, 'WSI_COUNT_OLD')+"' "+ms.uiEvent(formId, 'WSI_COUNT_OLD')+" title='"+v['WSI_COUNT_OLD']+"'>"+v['WSI_COUNT_OLD']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_DEVICE_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_DEVICE_SN')+"' style='width:100px;"+ms.tdStyle(formId, 'WSI_DEVICE_SN')+"' "+ms.tdEvent(formId, 'WSI_DEVICE_SN')+">")
            arrHtml.push("<span colno='WSI_DEVICE_SN' class='"+ms.uiClass(formId, 'WSI_DEVICE_SN')+"' style='"+ms.uiStyle(formId, 'WSI_DEVICE_SN')+"' "+ms.uiEvent(formId, 'WSI_DEVICE_SN')+" title='"+v['WSI_DEVICE_SN']+"'>"+v['WSI_DEVICE_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_DEVICE_SEQ' class='datagrid-cell "+ms.tdClass(formId, 'WSI_DEVICE_SEQ')+"' style='width:80px;"+ms.tdStyle(formId, 'WSI_DEVICE_SEQ')+"' "+ms.tdEvent(formId, 'WSI_DEVICE_SEQ')+">")
            arrHtml.push("<span colno='WSI_DEVICE_SEQ' class='"+ms.uiClass(formId, 'WSI_DEVICE_SEQ')+"' style='"+ms.uiStyle(formId, 'WSI_DEVICE_SEQ')+"' "+ms.uiEvent(formId, 'WSI_DEVICE_SEQ')+" title='"+v['WSI_DEVICE_SEQ']+"'>"+v['WSI_DEVICE_SEQ']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_TRUCK_NO' class='datagrid-cell "+ms.tdClass(formId, 'WSI_TRUCK_NO')+"' style='width:100px;"+ms.tdStyle(formId, 'WSI_TRUCK_NO')+"' "+ms.tdEvent(formId, 'WSI_TRUCK_NO')+">")
            arrHtml.push("<span colno='WSI_TRUCK_NO' class='"+ms.uiClass(formId, 'WSI_TRUCK_NO')+"' style='"+ms.uiStyle(formId, 'WSI_TRUCK_NO')+"' "+ms.uiEvent(formId, 'WSI_TRUCK_NO')+" title='"+v['WSI_TRUCK_NO']+"'>"+v['WSI_TRUCK_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_TABLE_NO' class='datagrid-cell "+ms.tdClass(formId, 'WSI_TABLE_NO')+"' style='width:100px;"+ms.tdStyle(formId, 'WSI_TABLE_NO')+"' "+ms.tdEvent(formId, 'WSI_TABLE_NO')+">")
            arrHtml.push("<span colno='WSI_TABLE_NO' class='"+ms.uiClass(formId, 'WSI_TABLE_NO')+"' style='"+ms.uiStyle(formId, 'WSI_TABLE_NO')+"' "+ms.uiEvent(formId, 'WSI_TABLE_NO')+" title='"+v['WSI_TABLE_NO']+"'>"+v['WSI_TABLE_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_LOADPOINT_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_LOADPOINT_SN')+"' style='width:100px;"+ms.tdStyle(formId, 'WSI_LOADPOINT_SN')+"' "+ms.tdEvent(formId, 'WSI_LOADPOINT_SN')+">")
            arrHtml.push("<span colno='WSI_LOADPOINT_SN' class='"+ms.uiClass(formId, 'WSI_LOADPOINT_SN')+"' style='"+ms.uiStyle(formId, 'WSI_LOADPOINT_SN')+"' "+ms.uiEvent(formId, 'WSI_LOADPOINT_SN')+" title='"+v['WSI_LOADPOINT_SN']+"'>"+v['WSI_LOADPOINT_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_FEEDER_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_FEEDER_SN')+"' style='width:100px;"+ms.tdStyle(formId, 'WSI_FEEDER_SN')+"' "+ms.tdEvent(formId, 'WSI_FEEDER_SN')+">")
            arrHtml.push("<span colno='WSI_FEEDER_SN' class='"+ms.uiClass(formId, 'WSI_FEEDER_SN')+"' style='"+ms.uiStyle(formId, 'WSI_FEEDER_SN')+"' "+ms.uiEvent(formId, 'WSI_FEEDER_SN')+" title='"+v['WSI_FEEDER_SN']+"'>"+v['WSI_FEEDER_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_CHANEL_NO' class='datagrid-cell "+ms.tdClass(formId, 'WSI_CHANEL_NO')+"' style='width:80px;"+ms.tdStyle(formId, 'WSI_CHANEL_NO')+"' "+ms.tdEvent(formId, 'WSI_CHANEL_NO')+">")
            arrHtml.push("<span colno='WSI_CHANEL_NO' class='"+ms.uiClass(formId, 'WSI_CHANEL_NO')+"' style='"+ms.uiStyle(formId, 'WSI_CHANEL_NO')+"' "+ms.uiEvent(formId, 'WSI_CHANEL_NO')+" title='"+v['WSI_CHANEL_NO']+"'>"+v['WSI_CHANEL_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_TRAY_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WSI_TRAY_FLAG')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WSI_TRAY_FLAG')+"' "+ms.tdEvent(formId, 'WSI_TRAY_FLAG')+">")
            arrHtml.push("<span colno='WSI_TRAY_FLAG' class='"+ms.uiClass(formId, 'WSI_TRAY_FLAG')+"' style='"+ms.uiStyle(formId, 'WSI_TRAY_FLAG')+"' "+ms.uiEvent(formId, 'WSI_TRAY_FLAG')+" title='"+v['WSI_TRAY_FLAG']+"'>"+v['WSI_TRAY_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_REPEAT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WSI_REPEAT_FLAG')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WSI_REPEAT_FLAG')+"' "+ms.tdEvent(formId, 'WSI_REPEAT_FLAG')+">")
            arrHtml.push("<span colno='WSI_REPEAT_FLAG' class='"+ms.uiClass(formId, 'WSI_REPEAT_FLAG')+"' style='"+ms.uiStyle(formId, 'WSI_REPEAT_FLAG')+"' "+ms.uiEvent(formId, 'WSI_REPEAT_FLAG')+" title='"+v['WSI_REPEAT_FLAG']+"'>"+v['WSI_REPEAT_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_EMP_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WSI_EMP_NAME')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WSI_EMP_NAME')+"' "+ms.tdEvent(formId, 'WSI_EMP_NAME')+">")
            arrHtml.push("<span colno='WSI_EMP_NAME' class='"+ms.uiClass(formId, 'WSI_EMP_NAME')+"' style='"+ms.uiStyle(formId, 'WSI_EMP_NAME')+"' "+ms.uiEvent(formId, 'WSI_EMP_NAME')+" title='"+v['WSI_EMP_NAME']+"'>"+v['WSI_EMP_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_LOADTIME' class='datagrid-cell "+ms.tdClass(formId, 'WSI_LOADTIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'WSI_LOADTIME')+"' "+ms.tdEvent(formId, 'WSI_LOADTIME')+">")
            arrHtml.push("<span colno='WSI_LOADTIME' class='"+ms.uiClass(formId, 'WSI_LOADTIME')+"' style='"+ms.uiStyle(formId, 'WSI_LOADTIME')+"' "+ms.uiEvent(formId, 'WSI_LOADTIME')+" title='"+v['WSI_LOADTIME']+"'>"+v['WSI_LOADTIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
       // setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    setNumColWidth(formId);
    clearAllSelect();
    setTableWidth(formId);
    setScroll();
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
