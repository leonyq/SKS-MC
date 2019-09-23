<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@page import="com.more.fw.core.common.method.StringUtils"%>
<%@page import="com.more.fw.core.common.method.Constants"%>

<%@ taglib prefix="s" uri="/plf/tld/struts-tags.tld"%>
<%@ taglib prefix="dict" uri="/plf/tld/ldg-dict-tags.tld"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
    <title>
		<dict:lang value="仓库存储策略" />
    </title>
    <style type="text/css">
    
	.datagrid-header{
	    width:100% !important;
	}
	.datagrid-body{
	    width:100% !important;
	}
	.datagrid-btable{
	    width:100% !important;
	}
    .group{
        margin-top:-52px!important;
        margin-left:-35px!important;
    }
	</style>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="dhtmlxtree" value="1" />
        <jsp:param name="msData" value="1" />
        <jsp:param name="scroll" value="1" />
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="e517a4b8c2a44f9695a6415348789dac"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    
    <link href="${path}plf/js/zTree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css">
    <!-- head里面 -->
</head>

<body >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="75346e1b1251430e8cec00aa04135218" />
            </div>
            
            
            <div class="bd">
                <div class="search-box" >
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		             <bu:search viewId="75346e1b1251430e8cec00aa04135218" />
                   </form>
                   <!--<a href="javascript:void(0);" class="more"></a>-->
               </div>
               <div style="width: 17%;float: left;height:100%;">
		<div class="block1" id="block1" style="width:92%;float: left;border-style:solid;border-width:1px; border-color:#eaeaea;background:#ffffff;padding:5px;margin-top: 40px;overflow:auto;">
       		<div id="index_tree" class="ztree" >
      		</div>
      		</div>
      		</div>
      		<div style="width: 83%;float: right;" >
      		
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagee517a4b8c2a44f9695a6415348789dac" id="formPagee517a4b8c2a44f9695a6415348789dac" value="${formPagee517a4b8c2a44f9695a6415348789dac}"/>
		<input type="hidden" name="formId" id="formId1" value='e517a4b8c2a44f9695a6415348789dac'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax1 datagrid datagrid-div1"  id="e517a4b8c2a44f9695a6415348789dac">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxe517a4b8c2a44f9695a6415348789dac" style="width:100%;height:92%;overflow-x:hidden;"><!--overflow-x:hidden;-->
		<div class="datagrid-header" style="width:100%;">
		<div class="datagrid-header-inner" id="datagrid-header-innere517a4b8c2a44f9695a6415348789dac" style="width:100%;">
		<bu:table cssClass="datagrid-htable1 fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablee517a4b8c2a44f9695a6415348789dac" style="width:100%;min-width:1048px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="e517a4b8c2a44f9695a6415348789dac" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_e517a4b8c2a44f9695a6415348789dac" onclick="_selectAjaxTableAllData(this,'e517a4b8c2a44f9695a6415348789dac')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WST_CONTRAL_TYPE" formId="e517a4b8c2a44f9695a6415348789dac" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WST_CONTRAL_VALUE" formId="e517a4b8c2a44f9695a6415348789dac" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WST_VALID_FLAG" formId="e517a4b8c2a44f9695a6415348789dac" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WST_EFFECTIVE_FLAG" formId="e517a4b8c2a44f9695a6415348789dac" /></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="WST_BEGIN_TIME" formId="e517a4b8c2a44f9695a6415348789dac" /></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="WST_END_TIME" formId="e517a4b8c2a44f9695a6415348789dac" /></td>
			<td class="datagrid-cell" style=""><bu:uitn colNo="WST_MEMO" formId="e517a4b8c2a44f9695a6415348789dac" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax " id="tableDive517a4b8c2a44f9695a6415348789dac" style="min-width:1048px;" onscroll="ajaxTableScroll(this,'e517a4b8c2a44f9695a6415348789dac')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxe517a4b8c2a44f9695a6415348789dac" style="width:100%;table-layout: fixed;">
		<tbody id="tbody_e517a4b8c2a44f9695a6415348789dac" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagee517a4b8c2a44f9695a6415348789dac==1}">			<div class="center" >
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=e517a4b8c2a44f9695a6415348789dac&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form></div>
            </div>
        </div>
    </div>
		<bu:submit viewId="75346e1b1251430e8cec00aa04135218" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="75346e1b1251430e8cec00aa04135218" />
    <script type = "text/javascript" src = "${path}plf/js/zTree/js/jquery.ztree.core.js"></script>
    <script type="text/javascript">
                
                function listAjaxTable(formId){
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    //var url = "/mes/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
                    var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,WST_CONTRAL_TYPE\"}";
                    var searchParams = $("#searchForm").serialize()+"&"+$("#searchFormTop").serialize();//console.log(searchParams);
                   
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
                    dataAuth = $("#DATA_AUTH").val();
                   // listAjaxTable(formId);
                setting = {
                data: {
                        simpleData : {	
        				    	enable: true,
        				    	pIdKey: "upId"
                        }			
                },
                callback: {
                        onClick: zTreeOnclick,
                        onAsyncSuccess: zTreeOnAsyncSuccess,
                        onAsyncError: zTreeOnAsyncError
                },
                async: {
                    enable: true,
                    url: "${path}buss/bussModel_exeFunc.ms?funcMId=848f9f24f8544ea8a4a1be288cfa9274",
                    autoParam: ["id"],
                    otherParam: {"dataAuth":$("#DATA_AUTH").val()},
                    dataFilter: ajaxDataFilter
                }
            }
                    $.fn.zTree.init($("#index_tree"),setting);
                    util.closeLoading();
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
                
               // function reloadPg(msg,title,width,height,time){
               //     msgPop(msg,"",title,width,height,time);
               // }
                
                
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
                    var url = "${path}buss/bussModel_listMsCasData.ms?exeid=ef46fba99ae34722abbc9868b1938572";
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
                function reloadPg(msg,title,width,height,time,isCloseWin){
    			msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
    		}
    		function reloadPgExe(isCloseWin){
    			/* document.forms.search_form.submit();
    			util.showTopLoading(); */
    		//	util.showTopLoading();
    			query("formId1");
    			if ("0" == isCloseWin || undefined == isCloseWin) {
      				top.$(".dialog-close").click();
    			}
    			var tid = $("#WST_AREA_SN").val();
    			zTreeOnclick(null,tid,null);
    			
    			util.closeLoading();
    			//checkboxAll("joblist");
		}
                
                
                function init(){
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    initTableWidth();
                    /*var idd = '<%=session.getAttribute("firstId")%>';
                  $("#WST_AREA_SN").val(idd);*/
                   // listAjaxTable($("#formId1").val());
                    
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
                   $(document.getElementById('WST_AREA_SN')).closest('.group').attr("style","display:none;");
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
	var dataAuth = $("#DATA_AUTH").val();
	console.log("___________"+dataAuth);  
	var setting = {
                data: {
                        simpleData : {	
        				    	enable: true,
        				    	pIdKey: "upId"
                        }			
                },
                callback: {
                        onClick: zTreeOnclick,
                        onAsyncSuccess: zTreeOnAsyncSuccess,
                        onAsyncError: zTreeOnAsyncError
                },
                async: {
                    enable: true,
                    url: "${path}buss/bussModel_exeFunc.ms?funcMId=848f9f24f8544ea8a4a1be288cfa9274",
                    autoParam: ["id"],
                    otherParam: {"dataAuth":$("#DATA_AUTH").val()},
                    dataFilter: ajaxDataFilter
                }
            }
    function zTreeOnclick(event,treeId,treeNode){		
                $("#WST_AREA_SN").val(treeNode.id);
				listAjaxTable($("#formId1").val());
    }
    function ajaxDataFilter(treeId,parentNode,responseDate){
                var data = responseDate.ajaxList;
                
                return data;
    }
    var firstAsyncSuccessFlag = 0; 
    function zTreeOnAsyncSuccess(event, treeId, msg){
        if (firstAsyncSuccessFlag == 0) { 
    		var zTree = $.fn.zTree.getZTreeObj("index_tree");
    	        var nodes = zTree.getNodes();
    	        zTree.selectNode(nodes[0]);
    	        zTree.setting.callback.onClick(null, zTree.setting.treeId, nodes[0]);//点击第一个节点
    	        
    	    firstAsyncSuccessFlag = 1;
        }
    }
    function zTreeOnAsyncError(event, treeId, treeNode){
        utilsFp.confirmIcon(3,"","","", "数据加载失败",0,"200","");
    }
			
	$(function(){
        	$.fn.zTree.init($("#index_tree"),setting);
        	
        	initHeight();
    		newScroll("block1")
    	});
       
       $(window).resize(function(){
           initHeight();
       })
function initHeight(){
    	$('.block1').height($(parent.window).height() - 95 - 36 - 6);//65-36-10
    	document.getElementById("block1").style.marginTop="0px";
        	$('.panel-ajax1').height($(window).height() - 97)
 }
function newScroll(id){
		
	  $("#"+ id).mCustomScrollbar({
		axis:"yx",
		snapAmount:40,
		theme:"minimal-dark",
		keyboard:{scrollAmount:40},
		mouseWheel:{deltaFactor:40,preventDefault:true},
		scrollInertia:80,
			
	  });
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
    if(formId=='e517a4b8c2a44f9695a6415348789dac'){<%--FM-仓库存储策略信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WST_CONTRAL_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'WST_CONTRAL_TYPE')+"' style='width:90px;"+ms.tdStyle(formId, 'WST_CONTRAL_TYPE')+"' "+ms.tdEvent(formId, 'WST_CONTRAL_TYPE')+">")
            arrHtml.push("<span colno='WST_CONTRAL_TYPE' class='"+ms.uiClass(formId, 'WST_CONTRAL_TYPE')+"' style='"+ms.uiStyle(formId, 'WST_CONTRAL_TYPE')+"' "+ms.uiEvent(formId, 'WST_CONTRAL_TYPE')+" title='"+ms.titleAttr(formId,'WST_CONTRAL_TYPE','IS_TITLE_ATTR',v)+"' >"+v['WST_CONTRAL_TYPE']+"</span>")
            arrHtml.push("</td>");
            if(uiRaw[i].WST_CONTRAL_TYPE==1){
            arrHtml.push("<td colno='WST_CONTRAL_VALUE' class='datagrid-cell "+ms.tdClass(formId, 'WST_CONTRAL_VALUE')+"' style='width:120px;"+ms.tdStyle(formId, 'WST_CONTRAL_VALUE')+"' "+ms.tdEvent(formId, 'WST_CONTRAL_VALUE')+">")
            arrHtml.push("<span colno='WST_CONTRAL_VALUE' class='"+ms.uiClass(formId, 'WST_CONTRAL_VALUE')+"' style='"+ms.uiStyle(formId, 'WST_CONTRAL_VALUE')+"' "+ms.uiEvent(formId, 'WST_CONTRAL_VALUE')+" title='"+ms.titleAttr(formId,'WST_CONTRAL_VALUE','IS_TITLE_ATTR',v)+"' >"+v['WST_CONTRAL_VALUE']+"</span>")
            arrHtml.push("</td>");
            }
            if(uiRaw[i].WST_CONTRAL_TYPE==2){
            arrHtml.push("<td colno='WST_ITEMCODE_CTRL' class='datagrid-cell "+ms.tdClass(formId, 'WST_ITEMCODE_CTRL')+"' style='width:120px;"+ms.tdStyle(formId, 'WST_ITEMCODE_CTRL')+"' "+ms.tdEvent(formId, 'WST_ITEMCODE_CTRL')+">")
            arrHtml.push("<span colno='WST_ITEMCODE_CTRL' class='"+ms.uiClass(formId, 'WST_ITEMCODE_CTRL')+"' style='"+ms.uiStyle(formId, 'WST_ITEMCODE_CTRL')+"' "+ms.uiEvent(formId, 'WST_ITEMCODE_CTRL')+" title='"+ms.titleAttr(formId,'WST_ITEMCODE_CTRL','IS_TITLE_ATTR',v)+"' >"+v['WST_ITEMCODE_CTRL']+"</span>")
            arrHtml.push("</td>");
            }
            if(uiRaw[i].WST_CONTRAL_TYPE==3){
            arrHtml.push("<td colno='WST_SUPCODE_CTRL' class='datagrid-cell "+ms.tdClass(formId, 'WST_SUPCODE_CTRL')+"' style='width:120px;"+ms.tdStyle(formId, 'WST_SUPCODE_CTRL')+"' "+ms.tdEvent(formId, 'WST_SUPCODE_CTRL')+">")
            arrHtml.push("<span colno='WST_SUPCODE_CTRL' class='"+ms.uiClass(formId, 'WST_SUPCODE_CTRL')+"' style='"+ms.uiStyle(formId, 'WST_SUPCODE_CTRL')+"' "+ms.uiEvent(formId, 'WST_SUPCODE_CTRL')+" title='"+ms.titleAttr(formId,'WST_SUPCODE_CTRL','IS_TITLE_ATTR',v)+"' >"+v['WST_SUPCODE_CTRL']+"</span>")
            arrHtml.push("</td>");
            }
            if(uiRaw[i].WST_CONTRAL_TYPE==4){
            arrHtml.push("<td colno='WST_CUST_CTRL' class='datagrid-cell "+ms.tdClass(formId, 'WST_CUST_CTRL')+"' style='width:120px;"+ms.tdStyle(formId, 'WST_CUST_CTRL')+"' "+ms.tdEvent(formId, 'WST_CUST_CTRL')+">")
            arrHtml.push("<span colno='WST_CUST_CTRL' class='"+ms.uiClass(formId, 'WST_CUST_CTRL')+"' style='"+ms.uiStyle(formId, 'WST_CUST_CTRL')+"' "+ms.uiEvent(formId, 'WST_CUST_CTRL')+" title='"+ms.titleAttr(formId,'WST_CUST_CTRL','IS_TITLE_ATTR',v)+"' >"+v['WST_CUST_CTRL']+"</span>")
            arrHtml.push("</td>");
            }
            if(uiRaw[i].WST_CONTRAL_TYPE==5){
            arrHtml.push("<td colno='WST_LOT_CTRL' class='datagrid-cell "+ms.tdClass(formId, 'WST_LOT_CTRL')+"' style='width:120px;"+ms.tdStyle(formId, 'WST_LOT_CTRL')+"' "+ms.tdEvent(formId, 'WST_LOT_CTRL')+">")
            arrHtml.push("<span colno='WST_LOT_CTRL' class='"+ms.uiClass(formId, 'WST_LOT_CTRL')+"' style='"+ms.uiStyle(formId, 'WST_LOT_CTRL')+"' "+ms.uiEvent(formId, 'WST_LOT_CTRL')+" title='"+ms.titleAttr(formId,'WST_LOT_CTRL','IS_TITLE_ATTR',v)+"' >"+v['WST_LOT_CTRL']+"</span>")
            arrHtml.push("</td>");
            }
            arrHtml.push("<td colno='WST_VALID_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WST_VALID_FLAG')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'WST_VALID_FLAG')+"' "+ms.tdEvent(formId, 'WST_VALID_FLAG')+">")
            arrHtml.push("<span colno='WST_VALID_FLAG' class='"+ms.uiClass(formId, 'WST_VALID_FLAG')+"' style='"+ms.uiStyle(formId, 'WST_VALID_FLAG')+"' "+ms.uiEvent(formId, 'WST_VALID_FLAG')+" title='"+ms.titleAttr(formId,'WST_VALID_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WST_VALID_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WST_EFFECTIVE_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WST_EFFECTIVE_FLAG')+"' style='width:120px;text-align:center;"+ms.tdStyle(formId, 'WST_EFFECTIVE_FLAG')+"' "+ms.tdEvent(formId, 'WST_EFFECTIVE_FLAG')+">")
            arrHtml.push("<span colno='WST_EFFECTIVE_FLAG' class='"+ms.uiClass(formId, 'WST_EFFECTIVE_FLAG')+"' style='"+ms.uiStyle(formId, 'WST_EFFECTIVE_FLAG')+"' "+ms.uiEvent(formId, 'WST_EFFECTIVE_FLAG')+" title='"+ms.titleAttr(formId,'WST_EFFECTIVE_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WST_EFFECTIVE_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WST_BEGIN_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WST_BEGIN_TIME')+"' style='width:130px;text-align:center;"+ms.tdStyle(formId, 'WST_BEGIN_TIME')+"' "+ms.tdEvent(formId, 'WST_BEGIN_TIME')+">")
            arrHtml.push("<span colno='WST_BEGIN_TIME' class='"+ms.uiClass(formId, 'WST_BEGIN_TIME')+"' style='"+ms.uiStyle(formId, 'WST_BEGIN_TIME')+"' "+ms.uiEvent(formId, 'WST_BEGIN_TIME')+" title='"+ms.titleAttr(formId,'WST_BEGIN_TIME','IS_TITLE_ATTR',v)+"' >"+v['WST_BEGIN_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WST_END_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WST_END_TIME')+"' style='width:130px;text-align:center;"+ms.tdStyle(formId, 'WST_END_TIME')+"' "+ms.tdEvent(formId, 'WST_END_TIME')+">")
            arrHtml.push("<span colno='WST_END_TIME' class='"+ms.uiClass(formId, 'WST_END_TIME')+"' style='"+ms.uiStyle(formId, 'WST_END_TIME')+"' "+ms.uiEvent(formId, 'WST_END_TIME')+" title='"+ms.titleAttr(formId,'WST_END_TIME','IS_TITLE_ATTR',v)+"' >"+v['WST_END_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WST_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'WST_MEMO')+"' style='"+ms.tdStyle(formId, 'WST_MEMO')+"' "+ms.tdEvent(formId, 'WST_MEMO')+">")
            arrHtml.push("<span colno='WST_MEMO' class='"+ms.uiClass(formId, 'WST_MEMO')+"' style='"+ms.uiStyle(formId, 'WST_MEMO')+"' "+ms.uiEvent(formId, 'WST_MEMO')+" title='"+ms.titleAttr(formId,'WST_MEMO','IS_TITLE_ATTR',v)+"' >"+v['WST_MEMO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        //setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    setNumColWidth(formId);
    clearAllSelect();
    setTableWidth(formId);
    if(isFirstSetScroll == 0){setScroll();}
    isFirstSetScroll++;
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
