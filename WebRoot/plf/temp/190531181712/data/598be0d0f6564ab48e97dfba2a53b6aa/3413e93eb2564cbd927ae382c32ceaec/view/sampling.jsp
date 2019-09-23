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
		<dict:lang value="抽样方案" />
    </title>
     <style type="text/css">
	.datagrid-header,.datagrid-body{
		width:100% !important;
	}
	.datagrid-body td{
		border-width: 0 1px 1px 0;
    		border-style: solid;
    		margin:0;
    		border-color: #ccc;
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
	
	
	.block1 .datagrid-header,.block1 .datagrid-htable,.block1 .datagrid-btable{
		width:400px !important;
	}
	
	.block1{
		height:calc(100% - 39px);
	}
	
	.block2{
		height:calc(100% - 39px - 10px);
	}
	.datagrid-htable{
	    width:520px !important;
	}
	.datagrid-btable{
	    width:600px !important;
	}
	.acss{
	    width:30px !important;
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
		<bu:header formId ="eec4f10d65b0411eb66da26fd2b55837"/>

    
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
		<bu:func viewId="3413e93eb2564cbd927ae382c32ceaec" />
            </div>
            <div class="bd" id="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="3413e93eb2564cbd927ae382c32ceaec" />
                   </form>
               </div>
               <div class="block1" style="float:left;width:400px;">
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post" style="height:100%;">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPageeec4f10d65b0411eb66da26fd2b55837" id="formPageeec4f10d65b0411eb66da26fd2b55837" value="${formPageeec4f10d65b0411eb66da26fd2b55837}"/>
		<input type="hidden" name="formId" id="formId1" value='eec4f10d65b0411eb66da26fd2b55837'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="eec4f10d65b0411eb66da26fd2b55837" style="height:calc(100% - 30px);">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxeec4f10d65b0411eb66da26fd2b55837" style="">
		<div class="datagrid-header" >
		<div class="datagrid-header-inner head1" id="datagrid-header-innereec4f10d65b0411eb66da26fd2b55837">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableeec4f10d65b0411eb66da26fd2b55837" >
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell acss" style="width:30px; text-align:center;" ><bu:thSeq  formId="eec4f10d65b0411eb66da26fd2b55837" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_eec4f10d65b0411eb66da26fd2b55837" onclick="_selectAjaxTableAllData(this,'eec4f10d65b0411eb66da26fd2b55837')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px"><bu:uitn colNo="DATA_AUTH" formId="eec4f10d65b0411eb66da26fd2b55837" /></td>
			<td class="datagrid-cell" style="width:150px"><bu:uitn colNo="QSP_PLAN_NAME" formId="eec4f10d65b0411eb66da26fd2b55837" /></td>
			<td class="datagrid-cell" style="width:80px" ><bu:uitn colNo="QSP_TEST_STEP" formId="eec4f10d65b0411eb66da26fd2b55837" /></td>
			<td class="datagrid-cell" style="width:80px"><bu:uitn colNo="QSP_PLAN_TYPE" formId="eec4f10d65b0411eb66da26fd2b55837" /></td>
			<td class="datagrid-cell" style="width:80px"><bu:uitn colNo="QSP_DEFAULT_FLAG" formId="eec4f10d65b0411eb66da26fd2b55837" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax scroll1" id="tableDiveec4f10d65b0411eb66da26fd2b55837"  onscroll="ajaxTableScroll(this,'eec4f10d65b0411eb66da26fd2b55837')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxeec4f10d65b0411eb66da26fd2b55837" >
		<tbody id="tbody_eec4f10d65b0411eb66da26fd2b55837" class="isParents">
		</tbody>
		</table>		</div>
		</div>
	
		
		</div>
		<c:if test="${formPageeec4f10d65b0411eb66da26fd2b55837==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=eec4f10d65b0411eb66da26fd2b55837&showLoading=0" />
			</div>
		</c:if>
		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
               </div>
               
               
               <div class="block2" style="width:calc(100% - 410px);float:right;">
                 <iframe id="sampleDetail" name="sampleDetail" frameBorder="0" src="" scrolling="auto" style="width:calc(100% - 10px);height:100%">  </iframe>
               
               </div>
               
            </div>
        </div>
    </div>
		<bu:submit viewId="3413e93eb2564cbd927ae382c32ceaec" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="3413e93eb2564cbd927ae382c32ceaec" />
		              <script type="text/javascript">
                
                function listAjaxTable(formId){
                 
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    //var url = "/mc/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
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
                    	console.log("Sssw");
                    var formId = $("#formId1").val();
                    listAjaxTable(formId);
                    showSampleDetail($("#firstId").val());
                    
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
                    var url = "${path}buss/bussModel_listMsCasData.ms?exeid=3413e93eb2564cbd927ae382c32ceaec";
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
<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='eec4f10d65b0411eb66da26fd2b55837'){<%--品质抽样方案表--%>
    //$('.scroll2').mCustomScrollbar("destroy");
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"'  onclick=\"showSampleDetail('"+v.ID+"');\"  id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
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
            arrHtml.push("<td colno='QSP_PLAN_NAME' class='datagrid-cell "+ms.tdClass(formId, 'QSP_PLAN_NAME')+"' style='width:150px;"+ms.tdStyle(formId, 'QSP_PLAN_NAME')+"' "+ms.tdEvent(formId, 'QSP_PLAN_NAME')+">")
            arrHtml.push("<span colno='QSP_PLAN_NAME' class='"+ms.uiClass(formId, 'QSP_PLAN_NAME')+"' style='"+ms.uiStyle(formId, 'QSP_PLAN_NAME')+"' "+ms.uiEvent(formId, 'QSP_PLAN_NAME')+" title='"+ms.titleAttr(formId,'QSP_PLAN_NAME','IS_TITLE_ATTR',v)+"' >"+v['QSP_PLAN_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSP_TEST_STEP' class='datagrid-cell "+ms.tdClass(formId, 'QSP_TEST_STEP')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QSP_TEST_STEP')+"' "+ms.tdEvent(formId, 'QSP_TEST_STEP')+">")
            arrHtml.push("<span colno='QSP_TEST_STEP' class='"+ms.uiClass(formId, 'QSP_TEST_STEP')+"' style='"+ms.uiStyle(formId, 'QSP_TEST_STEP')+"' "+ms.uiEvent(formId, 'QSP_TEST_STEP')+" title='"+ms.titleAttr(formId,'QSP_TEST_STEP','IS_TITLE_ATTR',v)+"' >"+v['QSP_TEST_STEP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSP_PLAN_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'QSP_PLAN_TYPE')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QSP_PLAN_TYPE')+"' "+ms.tdEvent(formId, 'QSP_PLAN_TYPE')+">")
            arrHtml.push("<span colno='QSP_PLAN_TYPE' class='"+ms.uiClass(formId, 'QSP_PLAN_TYPE')+"' style='"+ms.uiStyle(formId, 'QSP_PLAN_TYPE')+"' "+ms.uiEvent(formId, 'QSP_PLAN_TYPE')+" title='"+ms.titleAttr(formId,'QSP_PLAN_TYPE','IS_TITLE_ATTR',v)+"' >"+v['QSP_PLAN_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSP_DEFAULT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'QSP_DEFAULT_FLAG')+"' style='width:80px;pxtext-align:center;"+ms.tdStyle(formId, 'QSP_DEFAULT_FLAG')+"' "+ms.tdEvent(formId, 'QSP_DEFAULT_FLAG')+">")
            arrHtml.push("<span colno='QSP_DEFAULT_FLAG' class='"+ms.uiClass(formId, 'QSP_DEFAULT_FLAG')+"' style='"+ms.uiStyle(formId, 'QSP_DEFAULT_FLAG')+"' "+ms.uiEvent(formId, 'QSP_DEFAULT_FLAG')+" title='"+ms.titleAttr(formId,'QSP_DEFAULT_FLAG','IS_TITLE_ATTR',v)+"' >"+v['QSP_DEFAULT_FLAG']+"</span>")
            arrHtml.push("</td>");
            
            if(i==0){
                arrHtml.push("<input type='hidden' id='firstId' value='"+v.ID+"' />");
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
    setPopScroll('.scroll2','.head2');
    showSampleDetail($("#firstId").val());
}

function showSampleDetail(id){
    var dataAuth = $("#DATA_AUTH_ID_"+id).val();
    var sampleDetailUrl="${path}buss/bussModel_exeFunc.ms?funcMId=d2f7baf0fe1944578ba4c1149bd1bb4e&dataId="+id;
   var url = "${path}buss/bussModel.ms?exeid=f487313eb9ad4f55b73542c2929b8e0a&dataId="+id+"&iframeid="+window.name+"&dataAuth="+dataAuth;
   //parentWindow=$("#sampleDetail")[0].contentWindow;
   //parentWindow.frameElement.src=sampleDetailUrl+"&dataId="+id;
 //  document.getElementById('sampleDetail').src=sampleDetailUrl;
   parentWindow = $("#sampleDetail")[0].contentWindow;
	parentWindow.frameElement.src= url;
}


function initHeight(){
	     	
     //	$(".block2 .datagrid-header").width($('.block2').width());
     	
     	$(".block2 .datagrid-body2").height($(window).height() - 269)
     	
     	$('.block2 #datagrid-view').height($(window).height() - 230)
}



$(function(){
	initHeight();
})

$(window).resize(function(){
        initHeight();     		 
});
</script>
<script>(function($){
  $(window).on('load',function(){
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
