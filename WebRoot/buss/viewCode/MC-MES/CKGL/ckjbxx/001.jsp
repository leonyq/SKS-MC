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
		<dict:lang value="仓库作业日志" />
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
		<bu:header formId ="50b5c3a590074086a6e3b4edf04cb005"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <script type="text/javascript">
	var loaded = 1;
	var tab_len = 2;

	var currentTag;
	var tabs = "";
	function switchTag(tag, content, url) {
		if (currentTag == tag) {
			return false;
		}
		document.getElementById("content2").style.display="";
		//document.getElementById("content3").style.display="";
		//document.getElementById("content4").style.display="";
		for (i = 1; i < (tab_len + 1); i++) {
			if ("tag" + i == tag) {
				document.getElementById(tag).getElementsByTagName("a")[0].className = "selectli1";
				document.getElementById(tag).getElementsByTagName("a")[0]
						.getElementsByTagName("span")[0].className = "selectspan1";
			} else {
				document.getElementById("tag" + i).getElementsByTagName("a")[0].className = "";
				document.getElementById("tag" + i).getElementsByTagName("a")[0]
						.getElementsByTagName("span")[0].className = "";
			}
			$("#" + tag).addClass("current").siblings().removeClass("current");
			if ("content" + i == content) {
				currentTag = tag;
				document.getElementById(content).className = "";
			} else {
				document.getElementById("content" + i).className = "hidecontent";
			}
			document.getElementById("content").className = content;
		}
		if(tag=="tag1"){
			listAjaxTable("50b5c3a590074086a6e3b4edf04cb005");
			$("#allSelect").removeAttr("checked");
		}
		if(tag=="tag2"){
		    
			searchItemDetail();
			$("#allSelect1").removeAttr("checked");
		
		}
	}
$(function(){
	$("#tag1").addClass("current");

	
})

//全选
     	function getAllItem(){
		if($("#allSelect").attr("checked")=="checked"){
			$("#addItemDetail :checkbox").attr("checked",true);
		}else{
			$("#addItemDetail :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	} 
	//全选1
     	function getAllItem1(){
		if($("#allSelect1").attr("checked")=="checked"){
			$("#addSecondItemDetail :checkbox").attr("checked",true);
		}else{
			$("#addSecondItemDetail :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	} 
</script>
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="6c35b229d90b483c90542ca341d70f2d" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="6c35b229d90b483c90542ca341d70f2d" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage50b5c3a590074086a6e3b4edf04cb005" id="formPage50b5c3a590074086a6e3b4edf04cb005" value="${formPage50b5c3a590074086a6e3b4edf04cb005}"/>
		<input type="hidden" name="formId" id="formId1" value='50b5c3a590074086a6e3b4edf04cb005'/>
		<input type="hidden" name="formId" id="formId3" value='50b5c3a590074086a6e3b4edf04c1111'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>
		<div class="js-tab">
					<DIV id="container" style="box-sizing: border-box;">
						<DIV class="hd">
							<UL class="tab-list tab" style="padding-left:12px;">
								
								<LI id="tag1"><A class=""
									onclick="switchTag('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="物料作业明细" /></SPAN> </A>
								</LI>
								<LI id="tag2"><A class=""
									onclick="switchTag('tag2','content2','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="物料作业汇总" /></SPAN> </A>
								</LI>
								

							</UL>
						</DIV>
			<DIV class="content1" id="content" style="margin-top: 15px;">
			<DIV id="content1" style="margin-top:4px;" data-tab="tag1">
		<div class="panel-ajax datagrid datagrid-div1"  id="50b5c3a590074086a6e3b4edf04cb005">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax50b5c3a590074086a6e3b4edf04cb005" >
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner50b5c3a590074086a6e3b4edf04cb005">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable50b5c3a590074086a6e3b4edf04cb005">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="50b5c3a590074086a6e3b4edf04cb005" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_50b5c3a590074086a6e3b4edf04cb005" onclick="_selectAjaxTableAllData(this,'50b5c3a590074086a6e3b4edf04cb005')" style="cursor: pointer;"title="全选"/></span></td>
    			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="50b5c3a590074086a6e3b4edf04cb005" /></td>
    			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WTI_ITEM_SN" formId="50b5c3a590074086a6e3b4edf04cb005" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WTI_OPERATE_TYPE" formId="50b5c3a590074086a6e3b4edf04cb005" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WTI_ITEM_CODE" formId="50b5c3a590074086a6e3b4edf04cb005" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="T2#CI_ITEM_NAME" formId="50b5c3a590074086a6e3b4edf04cb005" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="T2#CI_ITEM_SPEC" formId="50b5c3a590074086a6e3b4edf04cb005" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WTI_ITEM_NUM" formId="50b5c3a590074086a6e3b4edf04cb005" /></td>
		    <td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WTI_LOT_NO" formId="50b5c3a590074086a6e3b4edf04cb005" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WTI_DOC_NUM" formId="50b5c3a590074086a6e3b4edf04cb005" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WTI_DOC_TYPE" formId="50b5c3a590074086a6e3b4edf04cb005" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WTI_SUP_CODE" formId="50b5c3a590074086a6e3b4edf04cb005" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WTI_CUST_CODE" formId="50b5c3a590074086a6e3b4edf04cb005" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WTI_WH_CODE" formId="50b5c3a590074086a6e3b4edf04cb005" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WTI_STORAGE_CODE" formId="50b5c3a590074086a6e3b4edf04cb005" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="WTI_OPERATE_TIME" formId="50b5c3a590074086a6e3b4edf04cb005" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WTI_OPERATE_EMP" formId="50b5c3a590074086a6e3b4edf04cb005" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv50b5c3a590074086a6e3b4edf04cb005" onscroll="ajaxTableScroll(this,'50b5c3a590074086a6e3b4edf04cb005')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax50b5c3a590074086a6e3b4edf04cb005" >
		<tbody id="tbody_50b5c3a590074086a6e3b4edf04cb005" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage50b5c3a590074086a6e3b4edf04cb005==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=50b5c3a590074086a6e3b4edf04cb005&showLoading=0" />
			</div>
		</c:if>
		</div>
        </DIV>
	    <DIV id="content2" style="display:none" data-tab="tag2">
				<div class="panel1 datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border:0;">
						<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head1"  id="" >
								<table Class="datagrid-htable fixedTable" id="datagrid-htable50b5c3a590074086a6e3b4edf04c1111">
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"><input type="checkbox" id="allSelect1" name="allSelect" onchange="getAllItem1();"/></td >
						                <td class="datagrid-cell" style="width:200px;"  ><dict:lang value="组织机构" /></td >
										<td class="datagrid-cell" style="width:220px;" ><dict:lang value="作业类型" /></td >
										<td class="datagrid-cell" style="width:220px;" ><dict:lang value="物料料号" /></td >
										<td class="datagrid-cell" style="width:220px;" ><dict:lang value="物料名称" /></td >
										<td class="datagrid-cell" style="width:220px;"  ><dict:lang value="物料规格" /></td >
										<td class="datagrid-cell" style="width:80px;"  ><dict:lang value="数量" /></td >
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll1">
							<table class="datagrid-btable fixedTable dblClick " style="table-layout: fixed;" id="datagrid-btable-ajax50b5c3a590074086a6e3b4edf04c1111"   >
								<tbody id="addSecondItemDetail" >
								</tbody>
							</table>
						</div>
							
					</div>
				</div>
				<div style="background-color: white;" id="pageDiv">
                                 			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchItemDetailPage&formId=formId3&showLoading=0" />
                                 		</div>
			</DIV>
		</DIV>

</DIV>	
		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="6c35b229d90b483c90542ca341d70f2d" />
		<!--
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
      -->
		<bu:script viewId="6c35b229d90b483c90542ca341d70f2d" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
    <script type="text/javascript">
                
                function listAjaxTable(formId){
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    //var url = "/mes/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
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
                    
                    if($("#tag1").attr("class")=="current"){
                        listAjaxTable(formId);
                        
                    }
                    if($("#tag2").attr("class")=="current"){
                        $('.scroll1').mCustomScrollbar("destroy");
                      searchItemDetail() ;
                        setPopScroll('.scroll1','.head1');
                        
                    }
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
                    var url = "${path}buss/bussModel_listMsCasData.ms?exeid=8544b7afc2434f8babc718059f1c8135";
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
    	//checkboxAll("joblist");
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
    if(formId=='50b5c3a590074086a6e3b4edf04cb005'){<%--仓库作业日志--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WTI_ITEM_SN' class='datagrid-cell "+ms.tdClass(formId, 'WTI_ITEM_SN')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'WTI_ITEM_SN')+"' "+ms.tdEvent(formId, 'WTI_ITEM_SN')+">")
            arrHtml.push("<span colno='WTI_ITEM_SN' class='"+ms.uiClass(formId, 'WTI_ITEM_SN')+"' onclick='itemJump1(\""+v['WTI_ITEM_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WTI_ITEM_SN')+" title='"+ms.titleAttr(formId,'WTI_ITEM_SN','IS_TITLE_ATTR',v)+"' >"+v['WTI_ITEM_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WTI_OPERATE_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'WTI_OPERATE_TYPE')+"' style='width:100px;text-align:left;"+ms.tdStyle(formId, 'WTI_OPERATE_TYPE')+"' "+ms.tdEvent(formId, 'WTI_OPERATE_TYPE')+">")
            arrHtml.push("<span colno='WTI_OPERATE_TYPE' class='"+ms.uiClass(formId, 'WTI_OPERATE_TYPE')+"' style='"+ms.uiStyle(formId, 'WTI_OPERATE_TYPE')+"' "+ms.uiEvent(formId, 'WTI_OPERATE_TYPE')+" title='"+ms.titleAttr(formId,'WTI_OPERATE_TYPE','IS_TITLE_ATTR',v)+"' >"+v['WTI_OPERATE_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WTI_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WTI_ITEM_CODE')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'WTI_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WTI_ITEM_CODE')+">")
            arrHtml.push("<span colno='WTI_ITEM_CODE' class='"+ms.uiClass(formId, 'WTI_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'WTI_ITEM_CODE')+"' "+ms.uiEvent(formId, 'WTI_ITEM_CODE')+" title='"+ms.titleAttr(formId,'WTI_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['WTI_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#CI_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T2#CI_ITEM_NAME')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'T2#CI_ITEM_NAME')+"' "+ms.tdEvent(formId, 'T2#CI_ITEM_NAME')+">")
            arrHtml.push("<span colno='T2#CI_ITEM_NAME' class='"+ms.uiClass(formId, 'T2#CI_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'T2#CI_ITEM_NAME')+"' "+ms.uiEvent(formId, 'T2#CI_ITEM_NAME')+" title='"+ms.titleAttr(formId,'T2#CI_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['T2#CI_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#CI_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'T2#CI_ITEM_SPEC')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'T2#CI_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'T2#CI_ITEM_SPEC')+">")
            arrHtml.push("<span colno='T2#CI_ITEM_SPEC' class='"+ms.uiClass(formId, 'T2#CI_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'T2#CI_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'T2#CI_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'T2#CI_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['T2#CI_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WTI_ITEM_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WTI_ITEM_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'WTI_ITEM_NUM')+"' "+ms.tdEvent(formId, 'WTI_ITEM_NUM')+">")
            arrHtml.push("<span colno='WTI_ITEM_NUM' class='"+ms.uiClass(formId, 'WTI_ITEM_NUM')+"' style='"+ms.uiStyle(formId, 'WTI_ITEM_NUM')+"' "+ms.uiEvent(formId, 'WTI_ITEM_NUM')+" title='"+ms.titleAttr(formId,'WTI_ITEM_NUM','IS_TITLE_ATTR',v)+"' >"+v['WTI_ITEM_NUM']+"</span>")
            arrHtml.push("</td>");
           	arrHtml.push("<td colno='WTI_LOT_NO' class='datagrid-cell "+ms.tdClass(formId, 'WTI_LOT_NO')+"' style='width:100px;text-align:left;"+ms.tdStyle(formId, 'WTI_LOT_NO')+"' "+ms.tdEvent(formId, 'WTI_LOT_NO')+">")
            arrHtml.push("<span colno='WTI_LOT_NO' class='"+ms.uiClass(formId, 'WTI_LOT_NO')+"' style='"+ms.uiStyle(formId, 'WTI_LOT_NO')+"' "+ms.uiEvent(formId, 'WTI_LOT_NO')+" title='"+ms.titleAttr(formId,'WTI_LOT_NO','IS_TITLE_ATTR',v)+"' >"+v['WTI_LOT_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WTI_DOC_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WTI_DOC_NUM')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'WTI_DOC_NUM')+"' "+ms.tdEvent(formId, 'WTI_DOC_NUM')+">")
            arrHtml.push("<span colno='WTI_DOC_NUM' class='"+ms.uiClass(formId, 'WTI_DOC_NUM')+"' onclick='itemJump2(\""+v['WTI_DOC_NUM']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WTI_DOC_NUM')+" title='"+ms.titleAttr(formId,'WTI_DOC_NUM','IS_TITLE_ATTR',v)+"' >"+v['WTI_DOC_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WTI_DOC_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'WTI_DOC_TYPE')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'WTI_DOC_TYPE')+"' "+ms.tdEvent(formId, 'WTI_DOC_TYPE')+">")
            arrHtml.push("<span colno='WTI_DOC_TYPE' class='"+ms.uiClass(formId, 'WTI_DOC_TYPE')+"' style='"+ms.uiStyle(formId, 'WTI_DOC_TYPE')+"' "+ms.uiEvent(formId, 'WTI_DOC_TYPE')+" title='"+ms.titleAttr(formId,'WTI_DOC_TYPE','IS_TITLE_ATTR',v)+"' >"+v['WTI_DOC_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WTI_SUP_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WTI_SUP_CODE')+"' style='width:120px;text-align:left;"+ms.tdStyle(formId, 'WTI_SUP_CODE')+"' "+ms.tdEvent(formId, 'WTI_SUP_CODE')+">")
            arrHtml.push("<span colno='WTI_SUP_CODE' class='"+ms.uiClass(formId, 'WTI_SUP_CODE')+"' style='"+ms.uiStyle(formId, 'WTI_SUP_CODE')+"' "+ms.uiEvent(formId, 'WTI_SUP_CODE')+" title='"+ms.titleAttr(formId,'WTI_SUP_CODE','IS_TITLE_ATTR',v)+"' >"+v['WTI_SUP_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WTI_CUST_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WTI_CUST_CODE')+"' style='width:120px;text-align:left;"+ms.tdStyle(formId, 'WTI_CUST_CODE')+"' "+ms.tdEvent(formId, 'WTI_CUST_CODE')+">")
            arrHtml.push("<span colno='WTI_CUST_CODE' class='"+ms.uiClass(formId, 'WTI_CUST_CODE')+"' style='"+ms.uiStyle(formId, 'WTI_CUST_CODE')+"' "+ms.uiEvent(formId, 'WTI_CUST_CODE')+" title='"+ms.titleAttr(formId,'WTI_CUST_CODE','IS_TITLE_ATTR',v)+"' >"+v['WTI_CUST_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WTI_WH_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WTI_WH_CODE')+"' style='width:100px;text-align:left;"+ms.tdStyle(formId, 'WTI_WH_CODE')+"' "+ms.tdEvent(formId, 'WTI_WH_CODE')+">")
            arrHtml.push("<span colno='WTI_WH_CODE' class='"+ms.uiClass(formId, 'WTI_WH_CODE')+"' style='"+ms.uiStyle(formId, 'WTI_WH_CODE')+"' "+ms.uiEvent(formId, 'WTI_WH_CODE')+" title='"+ms.titleAttr(formId,'WTI_WH_CODE','IS_TITLE_ATTR',v)+"' >"+v['WTI_WH_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WTI_STORAGE_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WTI_STORAGE_CODE')+"' style='width:100px;text-align:left;"+ms.tdStyle(formId, 'WTI_STORAGE_CODE')+"' "+ms.tdEvent(formId, 'WTI_STORAGE_CODE')+">")
            arrHtml.push("<span colno='WTI_STORAGE_CODE' class='"+ms.uiClass(formId, 'WTI_STORAGE_CODE')+"' style='"+ms.uiStyle(formId, 'WTI_STORAGE_CODE')+"' "+ms.uiEvent(formId, 'WTI_STORAGE_CODE')+" title='"+ms.titleAttr(formId,'WTI_STORAGE_CODE','IS_TITLE_ATTR',v)+"' >"+v['WTI_STORAGE_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WTI_OPERATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WTI_OPERATE_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'WTI_OPERATE_TIME')+"' "+ms.tdEvent(formId, 'WTI_OPERATE_TIME')+">")
            arrHtml.push("<span colno='WTI_OPERATE_TIME' class='"+ms.uiClass(formId, 'WTI_OPERATE_TIME')+"' style='"+ms.uiStyle(formId, 'WTI_OPERATE_TIME')+"' "+ms.uiEvent(formId, 'WTI_OPERATE_TIME')+" title='"+ms.titleAttr(formId,'WTI_OPERATE_TIME','IS_TITLE_ATTR',v)+"' >"+v['WTI_OPERATE_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WTI_OPERATE_EMP' class='datagrid-cell "+ms.tdClass(formId, 'WTI_OPERATE_EMP')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WTI_OPERATE_EMP')+"' "+ms.tdEvent(formId, 'WTI_OPERATE_EMP')+">")
            arrHtml.push("<span colno='WTI_OPERATE_EMP' class='"+ms.uiClass(formId, 'WTI_OPERATE_EMP')+"' style='"+ms.uiStyle(formId, 'WTI_OPERATE_EMP')+"' "+ms.uiEvent(formId, 'WTI_OPERATE_EMP')+" title='"+ms.titleAttr(formId,'WTI_OPERATE_EMP','IS_TITLE_ATTR',v)+"' >"+v['WTI_OPERATE_EMP']+"</span>")
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
    	function searchItemDetail(){
    	    console.log("Ssssss");
    	    $('.scroll1').mCustomScrollbar("destroy");
    	     var url = "${path}buss/bussModel_exeFunc.ms?funcMId=637ebd92065e45f4ae110dff94595021";
    	    var begin = $("#WTI_OPERATE_TIME_BEGIN").val();
    	    var end = $("#WTI_OPERATE_TIME_END").val();
    	    var dataAuth = $("#DATA_AUTH").val();
    	    var itemSn = $.trim($("#WTI_ITEM_SN").val());
    	    var itemCode = $.trim($("#WTI_ITEM_CODE_SHOW").val());
    	    var itemName = $.trim($(document.getElementById('T2#CI_ITEM_NAME')).val());
    	    var operateType = $.trim($("#WTI_OPERATE_TYPE").val());
	    	util.showLoading("处理中...");
    	    $.ajax({
    	        type:"post",
    	        datatType:"json",
    	        data:{
    	            "begin":begin,
    	            "end":end,
    	            "dataAuth":dataAuth,
    	            "itemSn":itemSn,
    	            "itemCode":itemCode,
    	            "itemName":itemName,
    	            "operateType":operateType,
    	        },
    	        url:url,
    	        success:function(data){	
                    util.closeLoading();
    	            if(null==data){
    	                return;
    	            }
    	            $("#addSecondItemDetail").empty();
    	           
    	            if(null!= data.ajaxPage.dataList){
    	                var list = eval(data.ajaxPage.dataList);
    	                for(var i=0; i<list.length;i++){
    	                    if(list[i].NAME==null) list[i].NAME="";
    	                    if(list[i].WTI_OPERATE_TYPE==null) list[i].WTI_OPERATE_TYPE="";
    	                    if(list[i].WTI_ITEM_CODE==null) list[i].WTI_ITEM_CODE="";
    	                    if(list[i].CI_ITEM_NAME==null) list[i].CI_ITEM_NAME="";
    	                    if(list[i].CI_ITEM_SPEC==null) list[i].CI_ITEM_SPEC="";
    	                    if(list[i].WTI_ITEM_NUM==null) list[i].WTI_ITEM_NUM="";
    	                $("#datagrid-btable-ajax50b5c3a590074086a6e3b4edf04c1111 tbody:last").append("<tr id='trr"+(i+1)+"' ></tr>");
                        $("#datagrid-btable-ajax50b5c3a590074086a6e3b4edf04c1111  tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
						$("#datagrid-btable-ajax50b5c3a590074086a6e3b4edf04c1111 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect3'/></td>");
						$("#datagrid-btable-ajax50b5c3a590074086a6e3b4edf04c1111 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:205px;text-align: left;' title='"+list[i].NAME+"'>"+list[i].NAME+"</td>");
						$("#datagrid-btable-ajax50b5c3a590074086a6e3b4edf04c1111 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='text-align: center;width:200px;' title='"+list[i].WTI_OPERATE_TYPE+"'>"+list[i].WTI_OPERATE_TYPE+"</td>");
						$("#datagrid-btable-ajax50b5c3a590074086a6e3b4edf04c1111 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='text-align: left;width:220px;' title='"+list[i].WTI_ITEM_CODE+"'>"+list[i].WTI_ITEM_CODE+"</td>");
						$("#datagrid-btable-ajax50b5c3a590074086a6e3b4edf04c1111 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='text-align: left;width:220px;' title='"+list[i].CI_ITEM_NAME+"'>"+list[i].CI_ITEM_NAME+"</td>");
						$("#datagrid-btable-ajax50b5c3a590074086a6e3b4edf04c1111 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='text-align: left;width:220px;' title='"+list[i].CI_ITEM_SPEC+"'>"+list[i].CI_ITEM_SPEC+"</td>");
						$("#datagrid-btable-ajax50b5c3a590074086a6e3b4edf04c1111 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='text-align: right;width:80px;' >"+list[i].WTI_ITEM_NUM+"</td>");
						
    	                }
    	            }
				 pageFun(data.ajaxPage,"formId3");
    			var tableTrJs = $("#datagrid-btable-ajax50b5c3a590074086a6e3b4edf04c1111 tbody tr");
    			_tongLineColor(tableTrJs);
    			clickTr('datagrid-btable-ajax50b5c3a590074086a6e3b4edf04c1111');
    		
    			 $(".head1").scrollLeft(0);
               defTableWidthRewrite("50b5c3a590074086a6e3b4edf04c1111");
                setPopScroll('.scroll1','.head1');
                //        $('.head1')[0].scrollLeft = 0;
    	        },
    	        error:function(msg){
    	             util.closeLoading();
			        utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
    	        }
    	    })
    	    
    	}
    	var paginationImpl = {};
    	function searchItemDetailPage(paginationImpl,url){
    	     var url = "${path}buss/bussModel_exeFunc.ms?funcMId=637ebd92065e45f4ae110dff94595021";
    	    var begin = $("#WTI_OPERATE_TIME_BEGIN").val();
    	    var end = $("#WTI_OPERATE_TIME_END").val();
    	    var dataAuth = $("#DATA_AUTH").val();
    	    var itemSn = $.trim($("#WTI_ITEM_SN").val());
    	    var itemCode = $.trim($("#WTI_ITEM_CODE_SHOW").val());
    	    var itemName = $.trim($(document.getElementById('T2#CI_ITEM_NAME')).val());
    	    var operateType = $.trim($("#WTI_OPERATE_TYPE").val());
    	    var isFirstLoad = firstLoadThisPage(paginationImpl);
        	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
        	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
	    	util.showLoading("处理中...");
    	    $.ajax({
    	        type:"post",
    	        datatType:"json",
    	        data:{
    	            "begin":begin,
    	            "end":end,
    	            "dataAuth":dataAuth,
    	            "itemSn":itemSn,
    	            "itemCode":itemCode,
    	            "itemName":itemName,
    	            "operateType":operateType,
    	            "page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
                    "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
    	        },
    	        url:url,
    	        success:function(data){	
                    util.closeLoading();
    	            if(null==data){
    	                return;
    	            }
    	            $("#addSecondItemDetail").empty();
    	            
    	            if(null!= data.ajaxPage.dataList){
    	                var list = eval(data.ajaxPage.dataList);
    	                for(var i=0; i<list.length;i++){
    	                    if(list[i].NAME==null) list[i].NAME="";
    	                    if(list[i].WTI_OPERATE_TYPE==null) list[i].WTI_OPERATE_TYPE="";
    	                    if(list[i].WTI_ITEM_CODE==null) list[i].WTI_ITEM_CODE="";
    	                    if(list[i].CI_ITEM_NAME==null) list[i].CI_ITEM_NAME="";
    	                    if(list[i].CI_ITEM_SPEC==null) list[i].CI_ITEM_SPEC="";
    	                    if(list[i].WTI_ITEM_NUM==null) list[i].WTI_ITEM_NUM="";
    	                $("#addSecondItemDetail ").append("<tr id='trr"+(i+1)+"' ></tr>");
                        $("#addSecondItemDetail  tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
						$("#addSecondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect3'/></td>");
						$("#addSecondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:200px;text-align: left;' title='"+list[i].NAME+"'>"+list[i].NAME+"</td>");
						$("#addSecondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='text-align: center;width:220px;' title='"+list[i].WTI_OPERATE_TYPE+"'>"+list[i].WTI_OPERATE_TYPE+"</td>");
						$("#addSecondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='text-align: left;width:220px;' title='"+list[i].WTI_ITEM_CODE+"'>"+list[i].WTI_ITEM_CODE+"</td>");
						$("#addSecondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='text-align: left;width:220px;' title='"+list[i].CI_ITEM_NAME+"'>"+list[i].CI_ITEM_NAME+"</td>");
						$("#addSecondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='text-align: left;width:220px;' title='"+list[i].CI_ITEM_SPEC+"'>"+list[i].CI_ITEM_SPEC+"</td>");
						$("#addSecondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='text-align: right;width:80px;' >"+list[i].WTI_ITEM_NUM+"</td>");
						
    	                }
    	            }
				 pageFun(data.ajaxPage,"formId3");
    			var tableTrJs = $("#datagrid-btable-ajax50b5c3a590074086a6e3b4edf04c1111 tbody tr");
    			_tongLineColor(tableTrJs);
    			clickTr('datagrid-btable-ajax50b5c3a590074086a6e3b4edf04c1111');
    			defTableWidthRewrite("50b5c3a590074086a6e3b4edf04c1111");
    	        },
    	        error:function(msg){
    	             util.closeLoading();
			        utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
    	        }
    	    })
    	    
    	}
    	//点击行寄选中该行
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
				$("#"+trId).css("background-color","#d3eafc");
			}
		});
		
		  $("#"+tableId+" tr input[type=checkbox]").click(function(e) {
			  e.stopPropagation();
			  var style = $(this).parents("tr").attr("style");
			  if(style && style.indexOf("background-color") > -1){
				  $(this).parents("tr").css("background-color","");
			  }else{
				  $(this).parents("tr").css("background-color","#d3eafc");
			  }
		  });
}


function init(){
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    initTableWidth();
                    var jumpId = $("#jumpId").val();  
              		if(jumpId!=""){
                  $("#WTI_ITEM_SN").val(jumpId);
                  
                  }   
                  if(jumpId==""){
                     $("#WTI_OPERATE_TIME_BEGIN").val(timeBeginString());
    
                     $("#WTI_OPERATE_TIME_END").val(timeEndString());
                     }
                    listAjaxTable($("#formId1").val());
                   // listAjaxTable($("#formId1").val());
                    //listAjaxTable_print($("#formId1").val());
                    
                 }
function timeBeginString(){
			var datetime = new Date();
			//datetime.setDate(datetime.getDate()-360);
			var year = datetime.getFullYear();
			var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth()+ 1 ;
			var date = datetime.getDate();
			if(date-7<=0){
			    date=1;
			}
			date =date < 10 ? "0" + date : date;
			return year + "-" + month + "-" + date +" 00:00:00";
	}

	function timeEndString(){
		var datetime = new Date();
		//datetime.setDate(datetime.getDate()+360);
		var year = datetime.getFullYear();
		var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
		
		var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
		return year + "-" + month + "-" + date +" 23:59:59";
	} 


function initHeight(){
	$('.panel-ajax').height(($(window).height() - 56 - 80 - 15  - 10) - 60);

	$('.datagrid-body').css('height','calc(100% - 32px)');//32
	//	$('.scroll1').css('height','calc(100% - 80px)');//32
	$('.panel1').height(($(window).height() - 56 - 80 - 15  - 10) - 60);
	//$('.panel1').height($(window).height() - 56 - 195 - 15 - 70);
}
$(function(){
	initHeight();
})

$(window).resize(function(){
	initHeight();
})
</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//物料追溯
function itemJump1(obj){
      winOptMethod.jump("0b0276d9a6e3422592e30a48ad93b418","F10790","jumpId",obj);
}  


//仓库单据信息
function itemJump2(obj){
    winOptMethod.jump("f4c3cfb840234a24b5ac7135d783b7e3","F7011","jumpId",obj);
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
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
