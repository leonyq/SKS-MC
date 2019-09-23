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
		<dict:lang value="产品在制信息" />
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
		<bu:header formId ="b80d6492859243b498458c992ab04063"/>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="adfc3cdd94ca4caa860c7dfbcbbceb83" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                        </jsp:include>
		<bu:search viewId="adfc3cdd94ca4caa860c7dfbcbbceb83" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                   <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                    </jsp:include>
		<input type="hidden" name="formPageb80d6492859243b498458c992ab04063" id="formPageb80d6492859243b498458c992ab04063" value="${formPageb80d6492859243b498458c992ab04063}"/>
		<input type="hidden" name="formId" id="formId1" value='b80d6492859243b498458c992ab04063'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="b80d6492859243b498458c992ab04063">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxb80d6492859243b498458c992ab04063" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner head1" id="datagrid-header-innerb80d6492859243b498458c992ab04063">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableb80d6492859243b498458c992ab04063" >
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="b80d6492859243b498458c992ab04063" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_b80d6492859243b498458c992ab04063" onclick="_selectAjaxTableAllData(this,'b80d6492859243b498458c992ab04063')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;" ><bu:uitn colNo="DATA_AUTH" formId="b80d6492859243b498458c992ab04063" /></td>
			<td class="datagrid-cell" style="width:110px;" ><bu:uitn colNo="WT_SN" formId="b80d6492859243b498458c992ab04063" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WT_FINISH_FLAG" formId="b80d6492859243b498458c992ab04063" /></td>
			<td class="datagrid-cell" style="width:110px;" ><bu:uitn colNo="WT_AREA_SN" formId="b80d6492859243b498458c992ab04063" /></td>
			<td class="datagrid-cell" style="width:150px;" ><bu:uitn colNo="WT_PROJECT_ID" formId="b80d6492859243b498458c992ab04063" /></td>
			<td class="datagrid-cell" style="width:150px;" ><bu:uitn colNo="WT_MO_NUMBER" formId="b80d6492859243b498458c992ab04063" /></td>
			<td class="datagrid-cell" style="width:150px;" ><bu:uitn colNo="WT_MODEL_CODE" formId="b80d6492859243b498458c992ab04063" /></td>
			<td class="datagrid-cell" style="width:70px;" ><bu:uitn colNo="WT_PROCESS_FACE" formId="b80d6492859243b498458c992ab04063" /></td>
			
			<td class="datagrid-cell" style="width:110px;" ><bu:uitn colNo="WT_TECH_SN" formId="b80d6492859243b498458c992ab04063" /></td>
			<td class="datagrid-cell" style="width:60px;"><bu:uitn colNo="WT_NUM" formId="b80d6492859243b498458c992ab04063" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WT_LOT" formId="b80d6492859243b498458c992ab04063" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WT_SN_TYPE" formId="b80d6492859243b498458c992ab04063" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WT_CUST_CODE" formId="b80d6492859243b498458c992ab04063" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WT_GROUP_CODE" formId="b80d6492859243b498458c992ab04063" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WT_EMP" formId="b80d6492859243b498458c992ab04063" /></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="WT_IN_TIME" formId="b80d6492859243b498458c992ab04063" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WT_NG_NUM" formId="b80d6492859243b498458c992ab04063" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WT_SCRAP_NUM" formId="b80d6492859243b498458c992ab04063" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WT_MISJUDGE_NUM" formId="b80d6492859243b498458c992ab04063" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WT_ERROR_FLAG" formId="b80d6492859243b498458c992ab04063" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WT_REFLUX_FLAG" formId="b80d6492859243b498458c992ab04063" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WT_REWORK_FLAG" formId="b80d6492859243b498458c992ab04063" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WT_BACK_GROUP" formId="b80d6492859243b498458c992ab04063" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WT_NEXT_GROUP" formId="b80d6492859243b498458c992ab04063" /></td>
			<!--<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WT_SN_RELID" formId="b80d6492859243b498458c992ab04063" /></td>-->
			
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WT_SC_FINISH_FLAG" formId="b80d6492859243b498458c992ab04063" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WT_WORK_STATION" formId="b80d6492859243b498458c992ab04063" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WT_LINK_NUM" formId="b80d6492859243b498458c992ab04063" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WT_SCRAP_FLAG" formId="b80d6492859243b498458c992ab04063" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax scroll1" id="tableDivb80d6492859243b498458c992ab04063" onscroll="ajaxTableScroll(this,'b80d6492859243b498458c992ab04063')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxb80d6492859243b498458c992ab04063" >
		<tbody id="tbody_b80d6492859243b498458c992ab04063" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPageb80d6492859243b498458c992ab04063==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=b80d6492859243b498458c992ab04063&showLoading=0" />
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
		<bu:submit viewId="adfc3cdd94ca4caa860c7dfbcbbceb83" />
		<bu:script viewId="adfc3cdd94ca4caa860c7dfbcbbceb83" />
	<!--	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        	<jsp:param name="modelName" value="VIEW_TYPE_17" />
        	<jsp:param name="location" value="jsLoading" />
        </jsp:include>-->
    <script type="text/javascript">
                
                function listAjaxTable(formId){
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    //var url = "/N2/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
                    var url = "${path}/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
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
                    var url = "${path}/buss/bussModel_listMsDataPrint.ms";
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
                    var url = "${path}/buss/bussModel_listMsCasData.ms?exeid=adfc3cdd94ca4caa860c7dfbcbbceb83";
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
                     $("#WT_IN_TIME_BEGIN").val(timeBeginString());
                    $("#WT_IN_TIME_END").val(timeEndString());
                    
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
function timeBeginString(){
    			var datetime = new Date();
    			datetime.setDate(datetime.getDate()-30);
    			var year = datetime.getFullYear();
    			var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
    			var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
    			return year + "-" + month + "-" + date+" 00:00:00";
    		}
    
    		function timeEndString(){
    			var datetime = new Date();
    			
    			var year = datetime.getFullYear();
    			var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
    			var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
    			
    			return year + "-" + month + "-" + date+" 23:59:59";
    		}
		function getEndDay(date1){
             //构造当前日期对象
           var date = new Date();
           var year = date.getFullYear();
            //获取当前月份
           var mouth = date.getMonth();
           var days;
           if (mouth == 2) {
               days = year %4 == 0 ? 29: 28;
           }else if(mouth == 1 || mouth == 3 || mouth == 5 || mouth == 7 ||mouth == 8 ||mouth == 8 ||mouth == 12){
               days = 31;
           }else{
               days = 30;
           }
           return Number(days)+Number(date1)-30;
        }
               
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
    if(formId=='b80d6492859243b498458c992ab04063'){<%--产品在制信息表--%>
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
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID' value='"+v['DATA_AUTH_ID']+"' /></td>");
            arrHtml.push("<td colno='WT_SN' class='datagrid-cell "+ms.tdClass(formId, 'WT_SN')+"' style='width:110px;"+ms.tdStyle(formId, 'WT_SN')+"' "+ms.tdEvent(formId, 'WT_SN')+">")
            arrHtml.push("<span colno='WT_SN' class='"+ms.uiClass(formId, 'WT_SN')+"' onclick='itemJump1(\""+v['WT_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WT_SN')+" title='"+ms.titleAttr(formId,'WT_SN','IS_TITLE_ATTR',v)+"' >"+v['WT_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WT_FINISH_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WT_FINISH_FLAG')+"' style='width:100px; text-align:center;"+ms.tdStyle(formId, 'WT_FINISH_FLAG')+"' "+ms.tdEvent(formId, 'WT_FINISH_FLAG')+">")
            arrHtml.push("<span colno='WT_FINISH_FLAG' class='"+ms.uiClass(formId, 'WT_FINISH_FLAG')+"' style='"+ms.uiStyle(formId, 'WT_FINISH_FLAG')+"' "+ms.uiEvent(formId, 'WT_FINISH_FLAG')+" title='"+ms.titleAttr(formId,'WT_FINISH_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WT_FINISH_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WT_AREA_SN' class='datagrid-cell "+ms.tdClass(formId, 'WT_AREA_SN')+"' style='width:110px;"+ms.tdStyle(formId, 'WT_AREA_SN')+"' "+ms.tdEvent(formId, 'WT_AREA_SN')+">")
            arrHtml.push("<span colno='WT_AREA_SN' class='"+ms.uiClass(formId, 'WT_AREA_SN')+"' style='"+ms.uiStyle(formId, 'WT_AREA_SN')+"' "+ms.uiEvent(formId, 'WT_AREA_SN')+" title='"+ms.titleAttr(formId,'WT_AREA_SN','IS_TITLE_ATTR',v)+"' >"+v['WT_AREA_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WT_PROJECT_ID' class='datagrid-cell "+ms.tdClass(formId, 'WT_PROJECT_ID')+"' style='width:150px;"+ms.tdStyle(formId, 'WT_PROJECT_ID')+"' "+ms.tdEvent(formId, 'WT_PROJECT_ID')+">")
            arrHtml.push("<span colno='WT_PROJECT_ID' class='"+ms.uiClass(formId, 'WT_PROJECT_ID')+"' onclick='itemJump2(\""+v['WT_PROJECT_ID']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WT_PROJECT_ID')+" title='"+ms.titleAttr(formId,'WT_PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['WT_PROJECT_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WT_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'WT_MO_NUMBER')+"' style='width:150px;"+ms.tdStyle(formId, 'WT_MO_NUMBER')+"' "+ms.tdEvent(formId, 'WT_MO_NUMBER')+">")
            arrHtml.push("<span colno='WT_MO_NUMBER' class='"+ms.uiClass(formId, 'WT_MO_NUMBER')+"' onclick='itemJump3(\""+v['WT_MO_NUMBER']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WT_MO_NUMBER')+" title='"+ms.titleAttr(formId,'WT_MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['WT_MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WT_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WT_MODEL_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'WT_MODEL_CODE')+"' "+ms.tdEvent(formId, 'WT_MODEL_CODE')+">")
            arrHtml.push("<span colno='WT_MODEL_CODE' class='"+ms.uiClass(formId, 'WT_MODEL_CODE')+"' onclick='itemJump4(\""+v['WT_MODEL_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WT_MODEL_CODE')+" title='"+ms.titleAttr(formId,'WT_MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['WT_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WT_PROCESS_FACE' class='datagrid-cell "+ms.tdClass(formId, 'WT_PROCESS_FACE')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'WT_PROCESS_FACE')+"' "+ms.tdEvent(formId, 'WT_PROCESS_FACE')+">")
            arrHtml.push("<span colno='WT_PROCESS_FACE' class='"+ms.uiClass(formId, 'WT_PROCESS_FACE')+"' style='"+ms.uiStyle(formId, 'WT_PROCESS_FACE')+"' "+ms.uiEvent(formId, 'WT_PROCESS_FACE')+" title='"+ms.titleAttr(formId,'WT_PROCESS_FACE','IS_TITLE_ATTR',v)+"' >"+v['WT_PROCESS_FACE']+"</span>")
            arrHtml.push("</td>");
            
            arrHtml.push("<td colno='WT_TECH_SN' class='datagrid-cell "+ms.tdClass(formId, 'WT_TECH_SN')+"' style='width:110px;"+ms.tdStyle(formId, 'WT_TECH_SN')+"' "+ms.tdEvent(formId, 'WT_TECH_SN')+">")
            arrHtml.push("<span colno='WT_TECH_SN' class='"+ms.uiClass(formId, 'WT_TECH_SN')+"' onclick='itemJump5(\""+v['WT_TECH_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WT_TECH_SN')+" title='"+ms.titleAttr(formId,'WT_TECH_SN','IS_TITLE_ATTR',v)+"' >"+v['WT_TECH_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WT_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WT_NUM')+"' style='width:60px; text-align:right"+ms.tdStyle(formId, 'WT_NUM')+"' "+ms.tdEvent(formId, 'WT_NUM')+">")
            arrHtml.push("<span colno='WT_NUM' class='"+ms.uiClass(formId, 'WT_NUM')+"' style='"+ms.uiStyle(formId, 'WT_NUM')+"' "+ms.uiEvent(formId, 'WT_NUM')+" title='"+ms.titleAttr(formId,'WT_NUM','IS_TITLE_ATTR',v)+"' >"+v['WT_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WT_LOT' class='datagrid-cell "+ms.tdClass(formId, 'WT_LOT')+"' style='width:70px;"+ms.tdStyle(formId, 'WT_LOT')+"' "+ms.tdEvent(formId, 'WT_LOT')+">")
            arrHtml.push("<span colno='WT_LOT' class='"+ms.uiClass(formId, 'WT_LOT')+"' style='"+ms.uiStyle(formId, 'WT_LOT')+"' "+ms.uiEvent(formId, 'WT_LOT')+" title='"+ms.titleAttr(formId,'WT_LOT','IS_TITLE_ATTR',v)+"' >"+v['WT_LOT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WT_SN_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'WT_SN_TYPE')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'WT_SN_TYPE')+"' "+ms.tdEvent(formId, 'WT_SN_TYPE')+">")
            arrHtml.push("<span colno='WT_SN_TYPE' class='"+ms.uiClass(formId, 'WT_SN_TYPE')+"' style='"+ms.uiStyle(formId, 'WT_SN_TYPE')+"' "+ms.uiEvent(formId, 'WT_SN_TYPE')+" title='"+ms.titleAttr(formId,'WT_SN_TYPE','IS_TITLE_ATTR',v)+"' >"+v['WT_SN_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WT_CUST_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WT_CUST_CODE')+"' style='width:90px;"+ms.tdStyle(formId, 'WT_CUST_CODE')+"' "+ms.tdEvent(formId, 'WT_CUST_CODE')+">")
            arrHtml.push("<span colno='WT_CUST_CODE' class='"+ms.uiClass(formId, 'WT_CUST_CODE')+"' style='"+ms.uiStyle(formId, 'WT_CUST_CODE')+"' "+ms.uiEvent(formId, 'WT_CUST_CODE')+" title='"+ms.titleAttr(formId,'WT_CUST_CODE','IS_TITLE_ATTR',v)+"' >"+v['WT_CUST_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WT_GROUP_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WT_GROUP_CODE')+"' style='width:90px;"+ms.tdStyle(formId, 'WT_GROUP_CODE')+"' "+ms.tdEvent(formId, 'WT_GROUP_CODE')+">")
            arrHtml.push("<span colno='WT_GROUP_CODE' class='"+ms.uiClass(formId, 'WT_GROUP_CODE')+"' style='"+ms.uiStyle(formId, 'WT_GROUP_CODE')+"' "+ms.uiEvent(formId, 'WT_GROUP_CODE')+" title='"+ms.titleAttr(formId,'WT_GROUP_CODE','IS_TITLE_ATTR',v)+"' >"+v['WT_GROUP_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WT_EMP' class='datagrid-cell "+ms.tdClass(formId, 'WT_EMP')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'WT_EMP')+"' "+ms.tdEvent(formId, 'WT_EMP')+">")
            arrHtml.push("<span colno='WT_EMP' class='"+ms.uiClass(formId, 'WT_EMP')+"' style='"+ms.uiStyle(formId, 'WT_EMP')+"' "+ms.uiEvent(formId, 'WT_EMP')+" title='"+ms.titleAttr(formId,'WT_EMP','IS_TITLE_ATTR',v)+"' >"+v['WT_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WT_IN_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WT_IN_TIME')+"' style='width:130px;"+ms.tdStyle(formId, 'WT_IN_TIME')+"' "+ms.tdEvent(formId, 'WT_IN_TIME')+">")
            arrHtml.push("<span colno='WT_IN_TIME' class='"+ms.uiClass(formId, 'WT_IN_TIME')+"' style='"+ms.uiStyle(formId, 'WT_IN_TIME')+"' "+ms.uiEvent(formId, 'WT_IN_TIME')+" title='"+ms.titleAttr(formId,'WT_IN_TIME','IS_TITLE_ATTR',v)+"' >"+v['WT_IN_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WT_NG_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WT_NG_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'WT_NG_NUM')+"' "+ms.tdEvent(formId, 'WT_NG_NUM')+">")
            arrHtml.push("<span colno='WT_NG_NUM' class='"+ms.uiClass(formId, 'WT_NG_NUM')+"' style='"+ms.uiStyle(formId, 'WT_NG_NUM')+"' "+ms.uiEvent(formId, 'WT_NG_NUM')+" title='"+ms.titleAttr(formId,'WT_NG_NUM','IS_TITLE_ATTR',v)+"' >"+v['WT_NG_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WT_SCRAP_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WT_SCRAP_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'WT_SCRAP_NUM')+"' "+ms.tdEvent(formId, 'WT_SCRAP_NUM')+">")
            arrHtml.push("<span colno='WT_SCRAP_NUM' class='"+ms.uiClass(formId, 'WT_SCRAP_NUM')+"' style='"+ms.uiStyle(formId, 'WT_SCRAP_NUM')+"' "+ms.uiEvent(formId, 'WT_SCRAP_NUM')+" title='"+ms.titleAttr(formId,'WT_SCRAP_NUM','IS_TITLE_ATTR',v)+"' >"+v['WT_SCRAP_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WT_MISJUDGE_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WT_MISJUDGE_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'WT_MISJUDGE_NUM')+"' "+ms.tdEvent(formId, 'WT_MISJUDGE_NUM')+">")
            arrHtml.push("<span colno='WT_MISJUDGE_NUM' class='"+ms.uiClass(formId, 'WT_MISJUDGE_NUM')+"' style='"+ms.uiStyle(formId, 'WT_MISJUDGE_NUM')+"' "+ms.uiEvent(formId, 'WT_MISJUDGE_NUM')+" title='"+ms.titleAttr(formId,'WT_MISJUDGE_NUM','IS_TITLE_ATTR',v)+"' >"+v['WT_MISJUDGE_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WT_ERROR_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WT_ERROR_FLAG')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'WT_ERROR_FLAG')+"' "+ms.tdEvent(formId, 'WT_ERROR_FLAG')+">")
            arrHtml.push("<span colno='WT_ERROR_FLAG' class='"+ms.uiClass(formId, 'WT_ERROR_FLAG')+"' style='"+ms.uiStyle(formId, 'WT_ERROR_FLAG')+"' "+ms.uiEvent(formId, 'WT_ERROR_FLAG')+" title='"+ms.titleAttr(formId,'WT_ERROR_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WT_ERROR_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WT_REFLUX_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WT_REFLUX_FLAG')+"' style='width:100px; text-align:center;"+ms.tdStyle(formId, 'WT_REFLUX_FLAG')+"' "+ms.tdEvent(formId, 'WT_REFLUX_FLAG')+">")
            arrHtml.push("<span colno='WT_REFLUX_FLAG' class='"+ms.uiClass(formId, 'WT_REFLUX_FLAG')+"' style='"+ms.uiStyle(formId, 'WT_REFLUX_FLAG')+"' "+ms.uiEvent(formId, 'WT_REFLUX_FLAG')+" title='"+ms.titleAttr(formId,'WT_REFLUX_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WT_REFLUX_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WT_REWORK_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WT_REWORK_FLAG')+"' style='width:70px; text-align:center;"+ms.tdStyle(formId, 'WT_REWORK_FLAG')+"' "+ms.tdEvent(formId, 'WT_REWORK_FLAG')+">")
            arrHtml.push("<span colno='WT_REWORK_FLAG' class='"+ms.uiClass(formId, 'WT_REWORK_FLAG')+"' style='"+ms.uiStyle(formId, 'WT_REWORK_FLAG')+"' "+ms.uiEvent(formId, 'WT_REWORK_FLAG')+" title='"+ms.titleAttr(formId,'WT_REWORK_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WT_REWORK_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WT_BACK_GROUP' class='datagrid-cell "+ms.tdClass(formId, 'WT_BACK_GROUP')+"' style='width:70px;"+ms.tdStyle(formId, 'WT_BACK_GROUP')+"' "+ms.tdEvent(formId, 'WT_BACK_GROUP')+">")
            arrHtml.push("<span colno='WT_BACK_GROUP' class='"+ms.uiClass(formId, 'WT_BACK_GROUP')+"' style='"+ms.uiStyle(formId, 'WT_BACK_GROUP')+"' "+ms.uiEvent(formId, 'WT_BACK_GROUP')+" title='"+ms.titleAttr(formId,'WT_BACK_GROUP','IS_TITLE_ATTR',v)+"' >"+v['WT_BACK_GROUP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WT_NEXT_GROUP' class='datagrid-cell "+ms.tdClass(formId, 'WT_NEXT_GROUP')+"' style='width:70px;"+ms.tdStyle(formId, 'WT_NEXT_GROUP')+"' "+ms.tdEvent(formId, 'WT_NEXT_GROUP')+">")
            arrHtml.push("<span colno='WT_NEXT_GROUP' class='"+ms.uiClass(formId, 'WT_NEXT_GROUP')+"' style='"+ms.uiStyle(formId, 'WT_NEXT_GROUP')+"' "+ms.uiEvent(formId, 'WT_NEXT_GROUP')+" title='"+ms.titleAttr(formId,'WT_NEXT_GROUP','IS_TITLE_ATTR',v)+"' >"+v['WT_NEXT_GROUP']+"</span>")
            arrHtml.push("</td>");
            
            
            arrHtml.push("<td colno='WT_SC_FINISH_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WT_SC_FINISH_FLAG')+"' style='width:100px; text-align:center;"+ms.tdStyle(formId, 'WT_SC_FINISH_FLAG')+"' "+ms.tdEvent(formId, 'WT_SC_FINISH_FLAG')+">")
            arrHtml.push("<span colno='WT_SC_FINISH_FLAG' class='"+ms.uiClass(formId, 'WT_SC_FINISH_FLAG')+"' style='"+ms.uiStyle(formId, 'WT_SC_FINISH_FLAG')+"' "+ms.uiEvent(formId, 'WT_SC_FINISH_FLAG')+" title='"+ms.titleAttr(formId,'WT_SC_FINISH_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WT_SC_FINISH_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WT_WORK_STATION' class='datagrid-cell "+ms.tdClass(formId, 'WT_WORK_STATION')+"' style='width:90px;"+ms.tdStyle(formId, 'WT_WORK_STATION')+"' "+ms.tdEvent(formId, 'WT_WORK_STATION')+">")
            arrHtml.push("<span colno='WT_WORK_STATION' class='"+ms.uiClass(formId, 'WT_WORK_STATION')+"' style='"+ms.uiStyle(formId, 'WT_WORK_STATION')+"' "+ms.uiEvent(formId, 'WT_WORK_STATION')+" title='"+ms.titleAttr(formId,'WT_WORK_STATION','IS_TITLE_ATTR',v)+"' >"+v['WT_WORK_STATION']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WT_LINK_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WT_LINK_NUM')+"' style='width:70px; text-align:right;"+ms.tdStyle(formId, 'WT_LINK_NUM')+"' "+ms.tdEvent(formId, 'WT_LINK_NUM')+">")
            arrHtml.push("<span colno='WT_LINK_NUM' class='"+ms.uiClass(formId, 'WT_LINK_NUM')+"' style='"+ms.uiStyle(formId, 'WT_LINK_NUM')+"' "+ms.uiEvent(formId, 'WT_LINK_NUM')+" title='"+ms.titleAttr(formId,'WT_LINK_NUM','IS_TITLE_ATTR',v)+"' >"+v['WT_LINK_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WT_SCRAP_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WT_SCRAP_FLAG')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'WT_SCRAP_FLAG')+"' "+ms.tdEvent(formId, 'WT_SCRAP_FLAG')+">")
            arrHtml.push("<span colno='WT_SCRAP_FLAG' class='"+ms.uiClass(formId, 'WT_SCRAP_FLAG')+"' style='"+ms.uiStyle(formId, 'WT_SCRAP_FLAG')+"' "+ms.uiEvent(formId, 'WT_SCRAP_FLAG')+" title='"+ms.titleAttr(formId,'WT_SCRAP_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WT_SCRAP_FLAG']+"</span>")
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
   // if(isFirstSetScroll == 0){
      //  setScroll();
    //}
     

    //isFirstSetScroll++;
    
}
</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//产品追溯
function itemJump1(obj){
      winOptMethod.jump("aec0089e4d69487cbe28b4b70b1ffa21","F10630","jumpId",obj);
}  


//工单信息
function itemJump2(obj){
    winOptMethod.jump("53745dab58e344cdb6e278900138763f","F3466","jumpId",obj);
} 

//制令单信息
function itemJump3(obj){
    winOptMethod.jump("7d0349f7a60b405299af347205b1d92f","F3454","jumpId",obj);
} 

//BOM管理
function itemJump4(obj){
  winOptMethod.jump("64d40315e7ae489a8bb8e0d1871234ae","F3811","jumpId",obj);
} 


//工艺信息
function itemJump5(obj){
  winOptMethod.jump("ab7fd048ac884ead9706952262e9c496","F11130","jumpId",obj);
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
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
