<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
 <style>
/*
 .mCSB_scrollTools_horizontal{
     width:0px;
     overflow:hidden;   
 }
*/
.change{
    color:gray;
}
.change:hover
{ 
    color:#5200cc;
}
    

 </style>
<head>
    <title>
		<dict:lang value="X-Ray检测查看" />
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
		<bu:header formId ="7be611b7bd2243afb2905d2bc4b714cf"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <!-- 产品静态资源 -->

</head>
<script>

</script>
<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="d43a150f4a37458f9371250e50c0f77d" />
            </div>
            <div class="bd" style="height:360px;">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="d43a150f4a37458f9371250e50c0f77d" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage7be611b7bd2243afb2905d2bc4b714cf" id="formPage7be611b7bd2243afb2905d2bc4b714cf" value="${formPage7be611b7bd2243afb2905d2bc4b714cf}"/>
		<input type="hidden" name="formId" id="formId1" value='7be611b7bd2243afb2905d2bc4b714cf'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="7be611b7bd2243afb2905d2bc4b714cf">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax7be611b7bd2243afb2905d2bc4b714cf" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner7be611b7bd2243afb2905d2bc4b714cf">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable7be611b7bd2243afb2905d2bc4b714cf">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" style="width:750px" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="7be611b7bd2243afb2905d2bc4b714cf" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_7be611b7bd2243afb2905d2bc4b714cf" onclick="_selectAjaxTableAllData(this,'7be611b7bd2243afb2905d2bc4b714cf')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="XRAY_MO_NUMBER" formId="7be611b7bd2243afb2905d2bc4b714cf" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="XRAY_SN" formId="7be611b7bd2243afb2905d2bc4b714cf" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="XRAY_WORK_STATION" formId="7be611b7bd2243afb2905d2bc4b714cf" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="XRAY_CHECK_TIME" formId="7be611b7bd2243afb2905d2bc4b714cf" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="XRAY_FLAG" formId="7be611b7bd2243afb2905d2bc4b714cf" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="XRAY_EMP" formId="7be611b7bd2243afb2905d2bc4b714cf" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="XRAY_MEMO" formId="7be611b7bd2243afb2905d2bc4b714cf" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv7be611b7bd2243afb2905d2bc4b714cf" onscroll="ajaxTableScroll(this,'7be611b7bd2243afb2905d2bc4b714cf')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax7be611b7bd2243afb2905d2bc4b714cf">
		<tbody id="tbody_7be611b7bd2243afb2905d2bc4b714cf" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage7be611b7bd2243afb2905d2bc4b714cf==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=7be611b7bd2243afb2905d2bc4b714cf&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="d43a150f4a37458f9371250e50c0f77d" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="d43a150f4a37458f9371250e50c0f77d" />
<%--
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
--%>
<script type="text/javascript">
function listAjaxTable(formId){
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    //var url = "/mes/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,T2#WRD_STATUS\"}";
                    var url = "${path}buss/bussModel_listMsData.ms";
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
                    searchItemDetail();
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
                    utilsFp.confirmIcon(1,"","","", msg,"","260","145");
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
                    var url = "${path}buss/bussModel_listMsCasData.ms?exeid=db26ac43455245b8a8c60f8d3cc69ac9";
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
                
                function timeBeginString(){
    			var datetime = new Date();
    			datetime.setDate(datetime.getDate()-7);
    			var year = datetime.getFullYear();
    			var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
    			var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
    			return year + "-" + month + "-" + date;
    		}
    
    		function timeEndString(){
    			var datetime = new Date();
    			
    			var year = datetime.getFullYear();
    			var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
    			var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
    			
    			return year + "-" + month + "-" + date;
    		}
                
                
                function init(){
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    initTableWidth();
                    //$(document.getElementById('T2#WPD_DELIVERY_DATE_BEGIN')).val(timeBeginString());
                    //$(document.getElementById('T2#WPD_DELIVERY_DATE_END')).val(timeEndString());
                    var k = $(document.getElementById('XRAY_MO_NUMBER'))
                    k.parent().parent().css("display","none");//必须先在视图模型添加条件，然后把搜索框隐藏 达到不可告人得目的
                    k.val('<c:out value="${param.mo}"/>');//经测试
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
   function memoShow(obj){//f1
                			//	console.log(obj.innerHTML);
                var msg = encodeURIComponent($(obj).next()[0].innerHTML);
            	var piframeId = window.frameElement.id;//当前的ifid
				var url = "${path}buss/bussModel.ms?exeid=1b919eeffb244a158dff50d4de05fbe1&piframeId="+piframeId+"&msg="+ msg;
				//console.log(url);
                //弹窗方法
				showPopWinFp(url, 600, 450, "", "X-Ray检测详情",
						"add", "");//显示自定义检测详情窗口
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
    if(formId=='7be611b7bd2243afb2905d2bc4b714cf'){<%--XRay检测查看--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"'  id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='XRAY_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'XRAY_MO_NUMBER')+"' style='width:120px;"+ms.tdStyle(formId, 'XRAY_MO_NUMBER')+"' "+ms.tdEvent(formId, 'XRAY_MO_NUMBER')+">")
            arrHtml.push("<span colno='XRAY_MO_NUMBER' class='"+ms.uiClass(formId, 'XRAY_MO_NUMBER')+"' style='"+ms.uiStyle(formId, 'XRAY_MO_NUMBER')+"' "+ms.uiEvent(formId, 'XRAY_MO_NUMBER')+" title='"+ms.titleAttr(formId,'XRAY_MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['XRAY_MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='XRAY_SN' class='datagrid-cell "+ms.tdClass(formId, 'XRAY_SN')+"' style='width:110px;"+ms.tdStyle(formId, 'XRAY_SN')+"' "+ms.tdEvent(formId, 'XRAY_SN')+">")
            arrHtml.push("<span colno='XRAY_SN' class='"+ms.uiClass(formId, 'XRAY_SN')+"' style='"+ms.uiStyle(formId, 'XRAY_SN')+"' "+ms.uiEvent(formId, 'XRAY_SN')+" title='"+ms.titleAttr(formId,'XRAY_SN','IS_TITLE_ATTR',v)+"' >"+v['XRAY_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='XRAY_WORK_STATION' class='datagrid-cell "+ms.tdClass(formId, 'XRAY_WORK_STATION')+"' style='width:110px;"+ms.tdStyle(formId, 'XRAY_WORK_STATION')+"' "+ms.tdEvent(formId, 'XRAY_WORK_STATION')+">")
            arrHtml.push("<span colno='XRAY_WORK_STATION' class='"+ms.uiClass(formId, 'XRAY_WORK_STATION')+"' style='"+ms.uiStyle(formId, 'XRAY_WORK_STATION')+"' "+ms.uiEvent(formId, 'XRAY_WORK_STATION')+" title='"+ms.titleAttr(formId,'XRAY_WORK_STATION','IS_TITLE_ATTR',v)+"' >"+v['XRAY_WORK_STATION']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='XRAY_CHECK_TIME' class='datagrid-cell "+ms.tdClass(formId, 'XRAY_CHECK_TIME')+"' style='width:140px;"+ms.tdStyle(formId, 'XRAY_CHECK_TIME')+"' "+ms.tdEvent(formId, 'XRAY_CHECK_TIME')+">")
            arrHtml.push("<span colno='XRAY_CHECK_TIME' class='"+ms.uiClass(formId, 'XRAY_CHECK_TIME')+"' style='"+ms.uiStyle(formId, 'XRAY_CHECK_TIME')+"' "+ms.uiEvent(formId, 'XRAY_CHECK_TIME')+" title='"+ms.titleAttr(formId,'XRAY_CHECK_TIME','IS_TITLE_ATTR',v)+"' >"+v['XRAY_CHECK_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='XRAY_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'XRAY_FLAG')+"' style='width:90px;"+ms.tdStyle(formId, 'XRAY_FLAG')+"' "+ms.tdEvent(formId, 'XRAY_FLAG')+">")
            arrHtml.push("<span colno='XRAY_FLAG' class='"+ms.uiClass(formId, 'XRAY_FLAG')+"' style='"+ms.uiStyle(formId, 'XRAY_FLAG')+"' "+ms.uiEvent(formId, 'XRAY_FLAG')+" title='"+ms.titleAttr(formId,'XRAY_FLAG','IS_TITLE_ATTR',v)+"' >"+v['XRAY_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='XRAY_EMP' class='datagrid-cell "+ms.tdClass(formId, 'XRAY_EMP')+"' style='width:90px;"+ms.tdStyle(formId, 'XRAY_EMP')+"' "+ms.tdEvent(formId, 'XRAY_EMP')+">")
            arrHtml.push("<span colno='XRAY_EMP' class='"+ms.uiClass(formId, 'XRAY_EMP')+"' style='"+ms.uiStyle(formId, 'XRAY_EMP')+"' "+ms.uiEvent(formId, 'XRAY_EMP')+" title='"+ms.titleAttr(formId,'XRAY_EMP','IS_TITLE_ATTR',v)+"' >"+v['XRAY_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='XRAY_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'XRAY_MEMO')+"' style='width:90px;"+ms.tdStyle(formId, 'XRAY_MEMO')+"' "+ms.tdEvent(formId, 'XRAY_MEMO')+">")
            arrHtml.push("<div class='change'  style='float:left;width:90px;text-align:center;text-decoration:underline;' onclick='memoShow(this)'>"+magic(v['XRAY_MEMO'])+"</div><span colno='XRAY_MEMO' class='"+ms.uiClass(formId, 'XRAY_MEMO')+"' onclick='memoShow(this)';  style='opacity:0; "+ms.uiStyle(formId, 'XRAY_MEMO')+"' "+ms.uiEvent(formId, 'XRAY_MEMO')+" title='"+ms.titleAttr(formId,'XRAY_MEMO','IS_TITLE_ATTR',v)+"' >"+v['XRAY_MEMO']+"</span>")
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
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
 <script>
 //mCSB_1_scrollbar_horizontal
 function sett(){//三秒和移除表格横向滚动--页面加载完才找得到它
        		var popupFrameFpIdpop = 'popupFrameFpIdpop';
     console.log($("div[id='mCSB_1_scrollbar_horizontal']").remove());
     $("#searchFormTop").next().append('<button type="button" onclick="closeBtn()"><i class="ico ico-cancel"></i><dict:lang value="关闭" /></button>');
     
 }
 function closeBtn(){
    parent.closePopWinFp('popupFrameFpIdpop');
 }
$(function (){
window.setTimeout(sett,100);
});  

  	//备注格式处理		
	function magic(str){
	 if(str==null||str==''){
	   return '';
	 }
	 return '查看'
	}
 </script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
