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
		<dict:lang value="理货单列表" />
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
		<bu:header formId ="747171193cf444a784fe3b339285e612"/>

    
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
		if(tag=="tag2"){
			searchItemDetail();
		}
	}
$(function(){
	$("#tag1").addClass("current");
	$(document.getElementById('T2#WOD_DOC_TYPE')).closest('.group').attr("style","display:none;");
	
})
</script>
</head>

<body >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="2eaac7042a4747b4b7305fd485b6179c" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="2eaac7042a4747b4b7305fd485b6179c" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage747171193cf444a784fe3b339285e612" id="formPage747171193cf444a784fe3b339285e612" value="${formPage747171193cf444a784fe3b339285e612}"/>
		<input type="hidden" name="formId" id="formId1" value='747171193cf444a784fe3b339285e612'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" id="itemId" name="itemId" value=''/>
		<div class="js-tab">
			<DIV id="container" style="box-sizing: border-box;">
				<DIV class="hd">
					<UL class="tab-list tab" style="padding-left:12px;">
						
						<LI id="tag1"><A class=""
							onclick="switchTag('tag1','content1','');this.blur();"
							href="javascript:void(0);"> <SPAN><dict:lang value="理货明细" /></SPAN> </A>
						</LI>
						<LI id="tag2"><A class=""
							onclick="switchTag('tag2','content2','');this.blur();"
							href="javascript:void(0);"> <SPAN><dict:lang value="理货总明细" /></SPAN> </A>
						</LI>
						

					</UL>
				</DIV>
			<DIV class="content1" id="content" style="margin-top: 15px;">
				<DIV id="content1" style="margin-top:4px;" data-tab="tag1">
					<!--table1-->
					<div class="panel-ajax datagrid datagrid-div1"  id="747171193cf444a784fe3b339285e612">
					<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax747171193cf444a784fe3b339285e612" style="overflow: hidden;">
					<div class="datagrid-header">
					<div class="datagrid-header-inner" id="datagrid-header-inner747171193cf444a784fe3b339285e612">
					<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable747171193cf444a784fe3b339285e612" style="min-width:2170px;">
					<s:set name="_$type" value="'view'" />
					<tbody class="isParentsTitle">
					<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
						<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="747171193cf444a784fe3b339285e612" i18n="1"/></td>
						<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_747171193cf444a784fe3b339285e612" onclick="_selectAjaxTableAllData(this,'747171193cf444a784fe3b339285e612')" style="cursor: pointer;"title="全选"/></span></td>
						<td class="datagrid-cell" style="width:150px;"><bu:uitn  colNo="WOI_DOC_NUM" formId="747171193cf444a784fe3b339285e612" /></td>
						<td class="datagrid-cell" style="width:150px;"><bu:uitn  colNo="WOI_ITEM_CODE" formId="747171193cf444a784fe3b339285e612" /></td>
						<td class="datagrid-cell" style="width:80px;"><bu:uitn  colNo="T2#WOD_URGENT_FLAG" formId="747171193cf444a784fe3b339285e612" /></td>
						<td class="datagrid-cell" style="width:100px;"><bu:uitn  colNo="WOI_STATUS" formId="747171193cf444a784fe3b339285e612" /></td>
						<td class="datagrid-cell" style="width:80px;"><bu:uitn  colNo="WOI_PLAN_NUM" formId="747171193cf444a784fe3b339285e612" /></td>
						<td class="datagrid-cell" style="width:80px;"><bu:uitn  colNo="WOI_OUT_NUM" formId="747171193cf444a784fe3b339285e612" /></td>
						<td class="datagrid-cell" style="width:120px;"><bu:uitn  colNo="WOI_PACK_NUM" formId="747171193cf444a784fe3b339285e612" /></td>
						<!--<td class="datagrid-cell" style="width:80px;"><bu:uitn  colNo="WOI_ITEM_SEQ" formId="747171193cf444a784fe3b339285e612" /></td>-->
						<td class="datagrid-cell" style="width:150px;"><bu:uitn  colNo="WOI_CONNECT_DOC" formId="747171193cf444a784fe3b339285e612" /></td>
						<td class="datagrid-cell" style="width:120px;"><bu:uitn  colNo="T5#WDT_TYPE_NAME" formId="747171193cf444a784fe3b339285e612" /></td>
						<td class="datagrid-cell" style="width:120px;"><bu:uitn  colNo="T2#WOD_DISPATCH_SN" formId="747171193cf444a784fe3b339285e612" /></td>
						<td class="datagrid-cell" style="width:100px;"><bu:uitn  colNo="WOI_WH_CODE" formId="747171193cf444a784fe3b339285e612" /></td>
						<td class="datagrid-cell" style="width:150px;"><bu:uitn  colNo="WOI_ITEM_NAME" formId="747171193cf444a784fe3b339285e612" /></td>
						<td class="datagrid-cell" style="width:150px;"><bu:uitn  colNo="WOI_ITEM_SPEC" formId="747171193cf444a784fe3b339285e612" /></td>
						<td class="datagrid-cell" style="width:120px;"><bu:uitn  colNo="T2#WOD_SUP_CODE" formId="747171193cf444a784fe3b339285e612" /></td>
						<td class="datagrid-cell" style="width:150px;"><bu:uitn  colNo="WOI_DELIVERY_DATE" formId="747171193cf444a784fe3b339285e612" /></td>
						<td class="datagrid-cell" style="width:80px;"><bu:uitn  colNo="T4#NAME" formId="747171193cf444a784fe3b339285e612" /></td>
						<td class="datagrid-cell" style="width:150px;"><bu:uitn  colNo="T2#WOD_CREATE_TIME" formId="747171193cf444a784fe3b339285e612" /></td>
					</bu:tr>
					</tbody>
					</bu:table>
					</div>
					</div>
					<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv747171193cf444a784fe3b339285e612" onscroll="ajaxTableScroll(this,'747171193cf444a784fe3b339285e612')" style="height: 130px;">
					<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax747171193cf444a784fe3b339285e612" style="min-width:2170px;">
					<tbody id="tbody_747171193cf444a784fe3b339285e612" class="isParents">
					</tbody>
					</table>		</div>
					</div>
					</div>
					<c:if test="${formPage747171193cf444a784fe3b339285e612==1}">			<div class="center">
						<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=747171193cf444a784fe3b339285e612&showLoading=0" />
						</div>
					</c:if>
					<!--table2-->
					<div class="panel-ajax datagrid datagrid-div1" style="margin-top:10px;"><!--143-->
						<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x: hidden;">
							<div class="datagrid-header" style="">
								<div class="datagrid-header-inner head1" id="" >
									<table  class="datagrid-htable fixedTable  " id="itemDetail1"  style="min-width:1860px;">
										<tbody>
										<tr class="thcolor">
											<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
											<td class="datagrid-cell" align="center" style="width:30px;text-align: center"><input type="checkbox" id="allSelect" name="allSelect" onchange="getAllModels();"/></td >
							
											<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料SN" /></td >
											<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料料号" /></td >
											<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料名称" /></td >
											<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料规格" /></td >
											<td class="datagrid-cell" style="width:90px;" ><dict:lang value="理货数量" /></td >
											<!--<td class="datagrid-cell" style="width:70px;" ><dict:lang value="拆分数量" /></td >
											<td class="datagrid-cell" style="width:70px;" ><dict:lang value="项次" /></td >-->
											<td class="datagrid-cell" style="width:150px;" ><dict:lang value="关联单号" /></td >
											<td class="datagrid-cell" style="width:110px;" ><dict:lang value="包装小箱SN" /></td >
											<td class="datagrid-cell" style="width:110px;" ><dict:lang value="包装大箱SN" /></td >
											<td class="datagrid-cell" style="width:110px;" ><dict:lang value="包装栈板SN" /></td >
											<td class="datagrid-cell" style="width:110px;" ><dict:lang value="顶级包装SN" /></td >
											<td class="datagrid-cell" style="width:110px;" ><dict:lang value="仓库" /></td >
											<!--<td class="datagrid-cell" style="width:110px;" ><dict:lang value="库位" /></td >
											<td class="datagrid-cell" style="width:110px;" ><dict:lang value="供应商追溯信息" /></td >-->
											<td class="datagrid-cell" style="width:90px;" ><dict:lang value="操作人" /></td >
											<td class="datagrid-cell" style="width:130px;" ><dict:lang value="操作时间" /></td >
											<td class="datagrid-cell" style="width:70px;" ><dict:lang value="上传标识" /></td >
											<td class="datagrid-cell" style="width:130px;" ><dict:lang value="上传时间" /></td >
											
										</tr>
										</tbody>		
									</table>
								</div>
							</div>
							<div class="datagrid-body datagrid-div3 scroll1" ><!--130-->
								<table class="dlist-table table-line " style="width:1860px;table-layout: fixed;"  id="itemDetail" >
									<tbody id="addItemDetail" >
									</tbody>
								</table>
							</div>
							</div>
					</div>
							<div style="background-color: white;margin-top:0px;" id="pageDiv">
	                 			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchItemInfo&formId=formId2&showLoading=0" />
	                 				</div>	
						
				</DIV>
			</DIV>
			<DIV id="content2" style="display:none" data-tab="tag2">
				<!--table3-->
				<div class="panel1 datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border:0;">
						<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head" id="" >
								<table  class="datagrid-htable fixedTable  " id="secondItemDetail1"  style="min-width:1860px;">
									<tbody>
									<tr class="thcolor">
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"><input type="checkbox" id="allSelect" name="allSelect" onchange="getAllModels();"/></td >
						
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料SN" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料料号" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料名称" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料规格" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="理货数量" /></td >
										<!--<td class="datagrid-cell" style="width:70px;" ><dict:lang value="拆分数量" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="项次" /></td >-->
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="关联单号" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="包装小箱SN" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="包装大箱SN" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="包装栈板SN" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="顶级包装SN" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="仓库" /></td >
										<!--<td class="datagrid-cell" style="width:110px;" ><dict:lang value="库位" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="供应商追溯信息" /></td >-->
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="操作人" /></td >
										<td class="datagrid-cell" style="width:130px;" ><dict:lang value="操作时间" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="上传标识" /></td >
										<td class="datagrid-cell" style="width:130px;" ><dict:lang value="上传时间" /></td >
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll">
							<table class="dlist-table table-line " style="width:1860px; table-layout: fixed;"  id="secondItemDetail" >
								<tbody id="addSecondItemDetail" >
								</tbody>
							</table>
						</div>
						</div>
				</div>
						<div style="background-color: white;margin-top:10px;" id="pageDiv">
                 			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchSecondItem&formId=formId3&showLoading=0" />
                 			</div>	
					
			</DIV>	
		</div>
		
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='2' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="2eaac7042a4747b4b7305fd485b6179c" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="2eaac7042a4747b4b7305fd485b6179c" />
    
      <!--<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>-->
<script type="text/javascript">
				function listAjaxTable(formId){
				$(document.getElementById('T2#WOD_DOC_TYPE')).val('DJ15');
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,WOI_DOC_NUM,WOI_STATUS,WOI_WH_CODE\"}";
                    //var url = "/mes/buss/bussModel_listMsData.ms";
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
                        data: {
			        "searchParams" : $("#searchForm").serialize()+"&"+$("#searchFormTop").serialize(),
			        "page.currentPage" : _GLO_FORM_PAGE_MAP[formId].currentPage,
			        "page.pageRecord" :_GLO_FORM_PAGE_MAP[formId].pageRecord,
			    },
                        
                       // searchParams+"&page.currentPage="+currentPage+"&page.pageRecord=" + pageRecord,
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
                
                //function reloadPg(msg,title,width,height,time){
                    //msgPop(msg,"",title,width,height,time);
                //}
                
                
                function listChildAjaxTable(formId,paramList){
                   
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
                        data:{
                        "paraMap.formidFirstId":_GLO_FORM_PAGE_MAP[formId].formidFirstId,
                        "paraMap.subFormId":_GLO_FORM_PAGE_MAP[formId].subFormId,
                        "paraMap.subRelColId":_GLO_FORM_PAGE_MAP[formId].subRelColId,
                        "paraMap.relColVal":_GLO_FORM_PAGE_MAP[formId].relColVal,
                        "paraMap.subSortCol":_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColStr,
                        "paraMap.subSortColOrder":_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColOrderStr
                    };
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
                    $(document.getElementById('T2#WOD_DOC_TYPE')).val('DJ15');
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
<script type="text/javascript">
	//点击入库信息获取物料信息
	function showItemDetail(itemId){ 
	    var showDetailInfo =  "${path}buss/bussModel_exeFunc.ms?funcMId=9373d092dd704f0dbdc3026faad20db4";
		//var itemCode = $("#ITEM_CODE_"+itemId).val();
		$("#itemId").val(itemId);
		util.showLoading("处理中...");
		$.ajax({
				    type: "POST",
				    dataType: "json",
				    url: s"buss/bussModel_exeFunc.ms?funcMId=9373d092dd704f0dbdc3026faad20db4",//+"&itemId="+itemId,
				    data:{
			        "itemId" : itemId,
			    },
				
					success: function(data){
							util.closeLoading();
							$("#addItemDetail").empty();
							if(null != data.ajaxPage.dataList){
								var rccList = eval(data.ajaxPage.dataList);
								var tempFlag="";
								for(var i = 0;i < rccList.length; i++){
									if(rccList[i].ITEM_SN==null)  rccList[i].ITEM_SN="";
									//if(rccList[i].WRD_SPLIT_NUM==null)  rccList[i].WRD_SPLIT_NUM="";
									if(rccList[i].ITEM_CODE==null)  rccList[i].ITEM_CODE="";
									if(rccList[i].ITEM_NAME==null)  rccList[i].ITEM_NAME="";
									if(rccList[i].ITEM_SPEC==null)  rccList[i].ITEM_SPEC="";
									if(rccList[i].OUTSTOCK_NUM==null)  rccList[i].OUTSTOCK_NUM="";
									if(rccList[i].DOC_NUM==null)  rccList[i].DOC_NUM="";
									if(rccList[i].FIRST_SN==null)  rccList[i].FIRST_SN="";
									//if(rccList[i].STORAGE_NAME==null)  rccList[i].STORAGE_NAME="";
									//if(rccList[i].SUPPLIER_NAME==null)  rccList[i].SUPPLIER_NAME="";
									if(rccList[i].SECOND_SN==null)  rccList[i].SECOND_SN="";
									if(rccList[i].THIRD_SN==null)  rccList[i].THIRD_SN="";
									if(rccList[i].FOURTH_SN==null)  rccList[i].FOURTH_SN="";
									if(rccList[i].WH_NAME==null)  rccList[i].WH_NAME="";
									if(rccList[i].OUTSTOCK_EMP==null)  rccList[i].OUTSTOCK_EMP="";
									if(rccList[i].OUTSTOCK_TIME==null)  rccList[i].OUTSTOCK_TIME="";
									if(rccList[i].UPLOAD_FLAG=="Y"){
										tempFlag="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
									}else{
										tempFlag="<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
									}
									if(rccList[i].UPLOAD_TIME==null)  rccList[i].UPLOAD_TIME="";
									$("#itemDetail tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
									$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
									$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
									$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: left;' title=''>"+rccList[i].ITEM_SN+"</td>");
									$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: left;' title=''>"+rccList[i].ITEM_CODE+"</td>");
									$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: left;' title=''>"+rccList[i].ITEM_NAME+"</td>");
									$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: left;' title=''>"+rccList[i].ITEM_SPEC+"</td>");
									$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:90px;text-align: right;' title=''>"+rccList[i].OUTSTOCK_NUM+"</td>");
									//$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:70px;text-align: right;'>"+rccList[i].WRD_SPLIT_NUM+"</td>");
									//$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:70px;text-align: right;'>"+rccList[i].WRD_ITEM_SEQ+"</td>");
									$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:150px;text-align: left;' title=''>"+rccList[i].DOC_NUM+"</td>");
									$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:110px;text-align: left;' title=''>"+rccList[i].FIRST_SN+"</td>");
									$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:110px;text-align: left;' title=''>"+rccList[i].SECOND_SN+"</td>");
									$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:110px;text-align: left;' title=''>"+rccList[i].THIRD_SN+"</td>");
									$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:110px;text-align: left;' title=''>"+rccList[i].FOURTH_SN+"</td>");
									$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='width:110px;text-align: left;' title=''>"+rccList[i].WH_NAME+"</td>");
									//$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-16' style='width:110px;'>"+rccList[i].STORAGE_NAME+"</td>");
									//$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-17' style='width:110px;'>"+rccList[i].SUPPLIER_NAME+"</td>");
									$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-18' style='width:90px;text-align: center;' title=''>"+rccList[i].OUTSTOCK_EMP+"</td>");
									$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-19' style='width:130px;text-align: center;' title=''>"+rccList[i].OUTSTOCK_TIME+"</td>");
									$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-20' style='width:70px;text-align: center;' title=''>"+tempFlag+"</td>");
									$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-21' style='text-align: center;' title=''>"+rccList[i].UPLOAD_TIME+"</td>");
								}
							}
							pageFun(data.ajaxPage,"formId2");
								var tableTrJs = $("#itemDetail tbody tr");
								_tongLineColor(tableTrJs);
								//clickTr('itemDetail');
							
						},
					error: function(msg){
							util.closeLoading();
							utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
					  }
					});
	}
	//物料信息分页
	var paginationImpl = {};
	function SearchItemInfo(paginationImpl,url){ 
	  
		var isFirstLoad = firstLoadThisPage(paginationImpl);
	    	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
	    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
	    	var itemId = $("#itemId").val();
	    	util.showLoading("处理中...");
	    	$.ajax({
				    type: "POST",
				    dataType: "json",
				    url: "buss/bussModel_exeFunc.ms?funcMId=bef7e3e81a4a400db34d65b2ebdad5e4",
				    data:{
			        "paraMap.type" : "1",
			        "paraMap.itemId" : itemId,
			        "page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			        "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
			    }, 
				    
				    
				    
				    
				    
				    
				    //"paraMap.type=1&paraMap.itemId="+itemId+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
					success: function(data){
					                 
							util.closeLoading();
							$("#addItemDetail").empty();
							if(null != data.ajaxPage.dataList){
								var rccList = eval(data.ajaxPage.dataList);
								for(var i = 0;i < rccList.length; i++){
									if(rccList[i].ITEM_SN==null)  rccList[i].ITEM_SN="";
									//if(rccList[i].WRD_SPLIT_NUM==null)  rccList[i].WRD_SPLIT_NUM="";
									if(rccList[i].ITEM_CODE==null)  rccList[i].ITEM_CODE="";
									if(rccList[i].ITEM_NAME==null)  rccList[i].ITEM_NAME="";
									if(rccList[i].ITEM_SPEC==null)  rccList[i].ITEM_SPEC="";
									if(rccList[i].OUTSTOCK_NUM==null)  rccList[i].OUTSTOCK_NUM="";
									if(rccList[i].DOC_NUM==null)  rccList[i].DOC_NUM="";
									if(rccList[i].FIRST_SN==null)  rccList[i].FIRST_SN="";
									//if(rccList[i].STORAGE_NAME==null)  rccList[i].STORAGE_NAME="";
									//if(rccList[i].SUPPLIER_NAME==null)  rccList[i].SUPPLIER_NAME="";
									if(rccList[i].SECOND_SN==null)  rccList[i].SECOND_SN="";
									if(rccList[i].THIRD_SN==null)  rccList[i].THIRD_SN="";
									if(rccList[i].FOURTH_SN==null)  rccList[i].FOURTH_SN="";
									if(rccList[i].WH_NAME==null)  rccList[i].WH_NAME="";
									if(rccList[i].OUTSTOCK_EMP==null)  rccList[i].OUTSTOCK_EMP="";
									if(rccList[i].OUTSTOCK_TIME==null)  rccList[i].OUTSTOCK_TIME="";
									if(rccList[i].UPLOAD_FLAG=="Y"){
										tempFlag="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
									}else{
										tempFlag="<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
									}
									if(rccList[i].UPLOAD_TIME==null)  rccList[i].UPLOAD_TIME="";
									$("#itemDetail tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
									$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage - 1) * pageRecord + (i + 1))+"</td>");
									$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
									$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: left;' title='"+rccList[i].ITEM_SN+"'>"+rccList[i].ITEM_SN+"</td>");
									$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: left;' title='"+rccList[i].ITEM_CODE+"'>"+rccList[i].ITEM_CODE+"</td>");
									$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: left;' title='"+rccList[i].ITEM_NAME+"'>"+rccList[i].ITEM_NAME+"</td>");
									$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: left;' title='"+rccList[i].ITEM_SPEC+"'>"+rccList[i].ITEM_SPEC+"</td>");
									$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:90px;text-align: right;' title='"+rccList[i].OUTSTOCK_NUM+"'>"+rccList[i].OUTSTOCK_NUM+"</td>");
									//$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:70px;text-align: right;'>"+rccList[i].WRD_SPLIT_NUM+"</td>");
									//$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:70px;text-align: right;'>"+rccList[i].WRD_ITEM_SEQ+"</td>");
									$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:150px;text-align: left;' title='"+rccList[i].DOC_NUM+"'>"+rccList[i].DOC_NUM+"</td>");
									$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:110px;text-align: left;' title='"+rccList[i].FIRST_SN+"'>"+rccList[i].FIRST_SN+"</td>");
									$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:110px;text-align: left;' title='"+rccList[i].SECOND_SN+"'>"+rccList[i].SECOND_SN+"</td>");
									$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:110px;text-align: left;' title='"+rccList[i].THIRD_SN+"'>"+rccList[i].THIRD_SN+"</td>");
									$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:110px;text-align: left;' title='"+rccList[i].FOURTH_SN+"'>"+rccList[i].FOURTH_SN+"</td>");
									$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='width:110px;text-align: left;' title='"+rccList[i].WH_NAME+"'>"+rccList[i].WH_NAME+"</td>");
									//$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-16' style='width:110px;'>"+rccList[i].STORAGE_NAME+"</td>");
									//$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-17' style='width:110px;'>"+rccList[i].SUPPLIER_NAME+"</td>");
									$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-18' style='width:90px;text-align: center;' title='"+rccList[i].OUTSTOCK_EMP+"'>"+rccList[i].OUTSTOCK_EMP+"</td>");
									$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-19' style='width:130px;text-align: center;' title='"+rccList[i].OUTSTOCK_TIME+"'>"+rccList[i].OUTSTOCK_TIME+"</td>");
									$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-20' style='width:70px;text-align: center;' title=''>"+tempFlag+"</td>");
									$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-21' style='text-align: center;' title='"+rccList[i].UPLOAD_TIME+"'>"+rccList[i].UPLOAD_TIME+"</td>");
								}
							}
							pageFun(data.ajaxPage,"formId2");
								var tableTrJs = $("#itemDetail tbody tr");
								_tongLineColor(tableTrJs);
								//clickTr('itemDetail');
							
						},
					error: function(msg){
							util.closeLoading();
							utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
					  }
					});
	}
	
	//根据查询条件获取详细信息
	function searchItemDetail(){
		var dataAuth = $("#DATA_AUTH").val();
		var itemCode = $("#WOI_ITEM_CODE").val();
		var docNum = $.trim($("#WOI_DOC_NUM").val());
		var supCode = $(document.getElementById('T2#WOD_SUP_CODE')).val();
		var connectDoc = $.trim($("#WOI_CONNECT_DOC").val());
		var dispatchSn = $(document.getElementById('T2#WOD_DISPATCH_SN')).val();
		util.showLoading("处理中...");
		$.ajax({
				    type: "POST",
				    dataType: "json",
				    url: "buss/bussModel_exeFunc.ms?funcMId=9373d092dd704f0dbdc3026faad20db4",//+"&itemCode="+itemCode+"&dataAuth="+dataAuth+"&docNum="+docNum+"&supCode="+supCode+"&connectDoc="+connectDoc+"&dispatchSn="+dispatchSn+"&docType=DJ15",
				    data: {
			        "paraMap.dataAuth" : dataAuth,
			        "paraMap.itemCode" : itemCode,
			        "paraMap.docNum" : docNum,
			        "paraMap.supCode" : supCode,
			        "paraMap.connectDoc" : connectDoc,
			        "paraMap.dispatchSn" : dispatchSn,
			    },
					success: function(data){
							util.closeLoading();
							$("#addSecondItemDetail").empty();
							if(null != data.ajaxPage.dataList){
								var rccList = eval(data.ajaxPage.dataList);
								for(var i = 0;i < rccList.length; i++){
									if(rccList[i].ITEM_SN==null)  rccList[i].ITEM_SN="";
									//if(rccList[i].WRD_SPLIT_NUM==null)  rccList[i].WRD_SPLIT_NUM="";
									if(rccList[i].ITEM_CODE==null)  rccList[i].ITEM_CODE="";
									if(rccList[i].ITEM_NAME==null)  rccList[i].ITEM_NAME="";
									if(rccList[i].ITEM_SPEC==null)  rccList[i].ITEM_SPEC="";
									if(rccList[i].OUTSTOCK_NUM==null)  rccList[i].OUTSTOCK_NUM="";
									if(rccList[i].DOC_NUM==null)  rccList[i].DOC_NUM="";
									if(rccList[i].FIRST_SN==null)  rccList[i].FIRST_SN="";
									//if(rccList[i].STORAGE_NAME==null)  rccList[i].STORAGE_NAME="";
									//if(rccList[i].SUPPLIER_NAME==null)  rccList[i].SUPPLIER_NAME="";
									if(rccList[i].SECOND_SN==null)  rccList[i].SECOND_SN="";
									if(rccList[i].THIRD_SN==null)  rccList[i].THIRD_SN="";
									if(rccList[i].FOURTH_SN==null)  rccList[i].FOURTH_SN="";
									if(rccList[i].WH_NAME==null)  rccList[i].WH_NAME="";
									if(rccList[i].OUTSTOCK_EMP==null)  rccList[i].OUTSTOCK_EMP="";
									if(rccList[i].OUTSTOCK_TIME==null)  rccList[i].OUTSTOCK_TIME="";
									if(rccList[i].UPLOAD_FLAG=="Y"){
										tempFlag="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
									}else{
										tempFlag="<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
									}
									if(rccList[i].UPLOAD_TIME==null)  rccList[i].UPLOAD_TIME="";
									$("#secondItemDetail tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
									$("#secondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
									$("#secondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
									$("#secondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: left;' title='"+rccList[i].ITEM_SN+"'>"+rccList[i].ITEM_SN+"</td>");
									$("#secondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: left;' title='"+rccList[i].ITEM_CODE+"'>"+rccList[i].ITEM_CODE+"</td>");
									$("#secondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: left;' title='"+rccList[i].ITEM_NAME+"'>"+rccList[i].ITEM_NAME+"</td>");
									$("#secondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: left;' title='"+rccList[i].ITEM_SPEC+"'>"+rccList[i].ITEM_SPEC+"</td>");
									$("#secondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:90px;text-align: right;' title='"+rccList[i].OUTSTOCK_NUM+"'>"+rccList[i].OUTSTOCK_NUM+"</td>");
									//$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:70px;text-align: right;'>"+rccList[i].WRD_SPLIT_NUM+"</td>");
									//$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:70px;text-align: right;'>"+rccList[i].WRD_ITEM_SEQ+"</td>");
									$("#secondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:150px;text-align: left;' title='"+rccList[i].DOC_NUM+"'>"+rccList[i].DOC_NUM+"</td>");
									$("#secondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:110px;text-align: left;' title='"+rccList[i].FIRST_SN+"'>"+rccList[i].FIRST_SN+"</td>");
									$("#secondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:110px;text-align: left;' title='"+rccList[i].SECOND_SN+"'>"+rccList[i].SECOND_SN+"</td>");
									$("#secondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:110px;text-align: left;' title='"+rccList[i].THIRD_SN+"'>"+rccList[i].THIRD_SN+"</td>");
									$("#secondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:110px;text-align: left;' title='"+rccList[i].FOURTH_SN+"'>"+rccList[i].FOURTH_SN+"</td>");
									$("#secondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='width:110px;text-align: left;' title='"+rccList[i].WH_NAME+"'>"+rccList[i].WH_NAME+"</td>");
									//$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-16' style='width:110px;'>"+rccList[i].STORAGE_NAME+"</td>");
									//$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-17' style='width:110px;'>"+rccList[i].SUPPLIER_NAME+"</td>");
									$("#secondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-18' style='width:90px;text-align: center;' title='"+rccList[i].OUTSTOCK_EMP+"'>"+rccList[i].OUTSTOCK_EMP+"</td>");
									$("#secondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-19' style='width:130px;text-align: center;' title='"+rccList[i].OUTSTOCK_TIME+"'>"+rccList[i].OUTSTOCK_TIME+"</td>");
									$("#secondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-20' style='width:70px;text-align: center;' title=''>"+tempFlag+"</td>");
									$("#secondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-21' style='text-align: center;' title='"+rccList[i].UPLOAD_TIME+"'>"+rccList[i].UPLOAD_TIME+"</td>");
								}
							}
							pageFun(data.ajaxPage,"formId3");
								var tableTrJs = $("#secondItemDetail tbody tr");
								_tongLineColor(tableTrJs);
								//clickTr('secondItemDetail');
							
						},
					error: function(msg){
							util.closeLoading();
							utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
					  }
					});
	}
	//详细信息分页  
	var paginationImpl = {};
	function searchSecondItem(paginationImpl){
		var isFirstLoad = firstLoadThisPage(paginationImpl);
    	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
    	var dataAuth = $("#DATA_AUTH").val();
		var itemCode = $("#WOI_ITEM_CODE").val();
		var docNum = $.trim($("#WOI_DOC_NUM").val());
		var supCode = $(document.getElementById('T2#WOD_SUP_CODE')).val();
		var connectDoc = $.trim($("#WOI_CONNECT_DOC").val());
		var dispatchSn = $(document.getElementById('T2#WOD_DISPATCH_SN')).val();
	    	util.showLoading("处理中...");
	    	$.ajax({
				    type: "POST",
				    dataType: "json",
				    url: "buss/bussModel_exeFunc.ms?funcMId=bef7e3e81a4a400db34d65b2ebdad5e4",
				    data: {
			        "paraMap.dataAuth" : dataAuth,
			        "paraMap.itemCode" : itemCode,
			        "page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			        "page.pageRecord" :_GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
			        "paraMap.itemCode" : itemCode,
			        "paraMap.docNum" : docNum,
			        "paraMap.supCode" : supCode,
			        "paraMap.connectDoc" : connectDoc,
			        "paraMap.dispatchSn" : dispatchSn,
			        "docType" : "DJ15",
			        
			    },
				    
				   // "paraMap.type=1&paraMap.itemCode="+itemCode+"&paraMap.dataAuth="+dataAuth+"&paraMap.docNum="+docNum+"&paraMap.supCode="+supCode+"&paraMap.connectDoc="+connectDoc+"&paraMap.dispatchSn="+dispatchSn+"&docType=DJ15"+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
					success: function(data){
					                 
							util.closeLoading();
							$("#addSecondItemDetail").empty();
							if(null != data.ajaxPage.dataList){
								var rccList = eval(data.ajaxPage.dataList);
								for(var i = 0;i < rccList.length; i++){
									if(rccList[i].ITEM_SN==null)  rccList[i].ITEM_SN="";
									//if(rccList[i].WRD_SPLIT_NUM==null)  rccList[i].WRD_SPLIT_NUM="";
									if(rccList[i].ITEM_CODE==null)  rccList[i].ITEM_CODE="";
									if(rccList[i].ITEM_NAME==null)  rccList[i].ITEM_NAME="";
									if(rccList[i].ITEM_SPEC==null)  rccList[i].ITEM_SPEC="";
									if(rccList[i].OUTSTOCK_NUM==null)  rccList[i].OUTSTOCK_NUM="";
									if(rccList[i].DOC_NUM==null)  rccList[i].DOC_NUM="";
									if(rccList[i].FIRST_SN==null)  rccList[i].FIRST_SN="";
									//if(rccList[i].STORAGE_NAME==null)  rccList[i].STORAGE_NAME="";
									//if(rccList[i].SUPPLIER_NAME==null)  rccList[i].SUPPLIER_NAME="";
									if(rccList[i].SECOND_SN==null)  rccList[i].SECOND_SN="";
									if(rccList[i].THIRD_SN==null)  rccList[i].THIRD_SN="";
									if(rccList[i].FOURTH_SN==null)  rccList[i].FOURTH_SN="";
									if(rccList[i].WH_NAME==null)  rccList[i].WH_NAME="";
									if(rccList[i].OUTSTOCK_EMP==null)  rccList[i].OUTSTOCK_EMP="";
									if(rccList[i].OUTSTOCK_TIME==null)  rccList[i].OUTSTOCK_TIME="";
									if(rccList[i].UPLOAD_FLAG=="Y"){
										tempFlag="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
									}else{
										tempFlag="<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
									}
									if(rccList[i].UPLOAD_TIME==null)  rccList[i].UPLOAD_TIME="";
									$("#secondItemDetail tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
									$("#secondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage - 1) * pageRecord + (i + 1))+"</td>");
									$("#secondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
									$("#secondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: left;' title='"+rccList[i].ITEM_SN+"'>"+rccList[i].ITEM_SN+"</td>");
									$("#secondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: left;' title='"+rccList[i].ITEM_CODE+"'>"+rccList[i].ITEM_CODE+"</td>");
									$("#secondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: left;' title='"+rccList[i].ITEM_NAME+"'>"+rccList[i].ITEM_NAME+"</td>");
									$("#secondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: left;' title='"+rccList[i].ITEM_SPEC+"'>"+rccList[i].ITEM_SPEC+"</td>");
									$("#secondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:90px;text-align: right;' title='"+rccList[i].OUTSTOCK_NUM+"'>"+rccList[i].OUTSTOCK_NUM+"</td>");
									//$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:70px;text-align: right;'>"+rccList[i].WRD_SPLIT_NUM+"</td>");
									//$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:70px;text-align: right;'>"+rccList[i].WRD_ITEM_SEQ+"</td>");
									$("#secondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:150px;text-align: left;' title='"+rccList[i].DOC_NUM+"'>"+rccList[i].DOC_NUM+"</td>");
									$("#secondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:110px;text-align: left;' title='"+rccList[i].FIRST_SN+"'>"+rccList[i].FIRST_SN+"</td>");
									$("#secondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:110px;text-align: left;' title='"+rccList[i].SECOND_SN+"'>"+rccList[i].SECOND_SN+"</td>");
									$("#secondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:110px;text-align: left;' title='"+rccList[i].THIRD_SN+"'>"+rccList[i].THIRD_SN+"</td>");
									$("#secondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:110px;text-align: left;' title='"+rccList[i].FOURTH_SN+"'>"+rccList[i].FOURTH_SN+"</td>");
									$("#secondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='width:110px;text-align: left;' title='"+rccList[i].WH_NAME+"'>"+rccList[i].WH_NAME+"</td>");
									//$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-16' style='width:110px;'>"+rccList[i].STORAGE_NAME+"</td>");
									//$("#itemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-17' style='width:110px;'>"+rccList[i].SUPPLIER_NAME+"</td>");
									$("#secondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-18' style='width:90px;text-align: center;' title='"+rccList[i].OUTSTOCK_EMP+"'>"+rccList[i].OUTSTOCK_EMP+"</td>");
									$("#secondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-19' style='width:130px;text-align: center;' title='"+rccList[i].OUTSTOCK_TIME+"'>"+rccList[i].OUTSTOCK_TIME+"</td>");
									$("#secondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-20' style='width:70px;text-align: center;' title=''>"+tempFlag+"</td>");
									$("#secondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-21' style='text-align: center;' title='"+rccList[i].UPLOAD_TIME+"'>"+rccList[i].UPLOAD_TIME+"</td>");
								}
							}
							pageFun(data.ajaxPage,"formId3");
								var tableTrJs = $("#secondItemDetail tbody tr");
								_tongLineColor(tableTrJs);
								//clickTr('secondItemDetail');
							
						},
					error: function(msg){
							util.closeLoading();
							utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
					  }
					});
	}
	
	//单据亮灯
	function docLight(){
	    var	 docLightInfo = "${path}buss/bussModel_exeFunc.ms?FUNC_CODE=F7390&funcMId=aa91d24a57464693bbd4795e8a701dd1";
        var selCount = getNewSelectedCount();
        if(selCount==1){
          var formId = $("#formId1").val();
          var nowId = _selectedEditTr.attr("id");
          var docNum = $("#WOI_DOC_NUM"+nowId).val();
          var createUserId = $.trim($("#state_"+nowId).val());
          if(createUserId=='关结'){
               utilsFp.confirmIcon(3,"","","", "<dict:lang value="单据已关结"/>",0,"260","");
               return false;
          }else{
               	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url:  docLightInfo    //"${path}buss/bussModel_exeFunc.ms?FUNC_CODE=F7390&funcMId=aa91d24a57464693bbd4795e8a701dd1&docNum="+docNum,
			    data: {
			        "paraMap.formId" : formId,
			         "paraMap.nowId" : nowId,
			          "paraMap.docNum" : docNum,
			           "paraMap.createUserId" : createUserId,
			       
			    },
			    success: function(data){
						    if(null == data){return;}
						    if(null != data){
    							if(data.ajaxMap.returnMsg=="addSucc"){
    								msgPop(data.ajaxMap.alertMsg,"",data.ajaxMap.title.ajaxMap,data.ajaxMap.width.ajaxMap,data.height,data.ajaxMap.time,"");
    							}
    							if(data.ajaxMap.returnMsg=="addSucc1"){
    								msgPop(data.ajaxMap.alertMsg,"",data.ajaxMap.title.ajaxMap,data.ajaxMap.width.ajaxMap,data.height,data.ajaxMap.time,"");
    								var urlDetail = "${path}buss/bussModel.ms?exeid=51a6d06bcd704474aadfc4886e93e5cb&formId=747171193cf444a784fe3b339285e612&docNum="+docNum;
     	
	                                showPopWinFp(urlDetail , 600, 400,null,"<dict:lang value="缺料信息"/>","add_planDetail");
    								return;
    							}
    							if(data.ajaxMap.returnMsg=="addError"){
    								var urlDetail = "${path}buss/bussModel.ms?exeid=51a6d06bcd704474aadfc4886e93e5cb&formId=747171193cf444a784fe3b339285e612&docNum="+docNum;
     	
	                                showPopWinFp(urlDetail , 600, 400,null,"<dict:lang value="缺料信息"/>","add_planDetail");
    								return;
    							}
						    }
					},
			    error: function(msg){
						
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
			    });
          }
      }else{
          return false;
      }
}

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
    var uiRaw = ms.uiRaw(formId)==null?[]:ms.uiRaw(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='747171193cf444a784fe3b339285e612'){<%--出库单物料信息--%>
        $.each(uiTxt,function(i,v){
        
	            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
	            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' onclick=\"showItemDetail('"+v.ID+"');\" abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
	            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
	            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
	            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
	            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
	            arrHtml.push("</td>");
	            arrHtml.push("<td colno='WOI_DOC_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WOI_DOC_NUM')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'WOI_DOC_NUM')+"' "+ms.tdEvent(formId, 'WOI_DOC_NUM')+">")
	            arrHtml.push("<span colno='WOI_DOC_NUM' class='"+ms.uiClass(formId, 'WOI_DOC_NUM')+"' style='"+ms.uiStyle(formId, 'WOI_DOC_NUM')+"' "+ms.uiEvent(formId, 'WOI_DOC_NUM')+" title='"+v['WOI_DOC_NUM']+"' >"+v['WOI_DOC_NUM']+"</span>")
	            arrHtml.push("<input type='hidden' id='WOI_DOC_NUM"+v.ID+"' value='"+v['WOI_DOC_NUM']+"' /></td>");
	            arrHtml.push("<td colno='WOI_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WOI_ITEM_CODE')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'WOI_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WOI_ITEM_CODE')+">")
	            arrHtml.push("<span colno='WOI_ITEM_CODE' class='"+ms.uiClass(formId, 'WOI_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'WOI_ITEM_CODE')+"' "+ms.uiEvent(formId, 'WOI_ITEM_CODE')+" title='"+v['WOI_ITEM_CODE']+"' >"+v['WOI_ITEM_CODE']+"</span>")
	            arrHtml.push("</td>");
	            arrHtml.push("<td colno='T2#WOD_URGENT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'T2#WOD_URGENT_FLAG')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'T2#WOD_URGENT_FLAG')+"' "+ms.tdEvent(formId, 'T2#WOD_URGENT_FLAG')+">")
	            arrHtml.push("<span colno='T2#WOD_URGENT_FLAG' class='"+ms.uiClass(formId, 'T2#WOD_URGENT_FLAG')+"' style='"+ms.uiStyle(formId, 'T2#WOD_URGENT_FLAG')+"' "+ms.uiEvent(formId, 'T2#WOD_URGENT_FLAG')+" title='"+ms.titleAttr(formId,'T2#WOD_URGENT_FLAG','IS_TITLE_ATTR',v)+"' >"+v['T2#WOD_URGENT_FLAG']+"</span>")
	            arrHtml.push("</td>");
	            arrHtml.push("<td colno='WOI_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'WOI_STATUS')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'WOI_STATUS')+"' "+ms.tdEvent(formId, 'WOI_STATUS')+">")
	            arrHtml.push("<span colno='WOI_STATUS' class='"+ms.uiClass(formId, 'WOI_STATUS')+"' style='"+ms.uiStyle(formId, 'WOI_STATUS')+"' "+ms.uiEvent(formId, 'WOI_STATUS')+" title='"+ms.titleAttr(formId,'WOI_STATUS','IS_TITLE_ATTR',v)+"' >"+v['WOI_STATUS']+"</span>")
	            arrHtml.push("</td>");
	            arrHtml.push("<td colno='T2#WOD_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'T2#WOD_STATUS')+"' style='display:none;width:100px;text-align:center;"+ms.tdStyle(formId, 'T2#WOD_STATUS')+"' "+ms.tdEvent(formId, 'T2#WOD_STATUS')+">")
	            arrHtml.push("<span colno='T2#WOD_STATUS' class='"+ms.uiClass(formId, 'T2#WOD_STATUS')+"' style='"+ms.uiStyle(formId, 'T2#WOD_STATUS')+"' "+ms.uiEvent(formId, 'T2#WOD_STATUS')+" title='"+ms.titleAttr(formId,'T2#WOD_STATUS','IS_TITLE_ATTR',v)+"' >"+v['T2#WOD_STATUS']+"</span>")
	            arrHtml.push("<input type='hidden' id='state_"+v.ID+"' value='"+v['T2#WOD_STATUS']+"'></td>");
	            arrHtml.push("<td colno='WOI_PLAN_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WOI_PLAN_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'WOI_PLAN_NUM')+"' "+ms.tdEvent(formId, 'WOI_PLAN_NUM')+">")
	            arrHtml.push("<span colno='WOI_PLAN_NUM' class='"+ms.uiClass(formId, 'WOI_PLAN_NUM')+"' style='"+ms.uiStyle(formId, 'WOI_PLAN_NUM')+"' "+ms.uiEvent(formId, 'WOI_PLAN_NUM')+" title='"+v['WOI_PLAN_NUM']+"' >"+v['WOI_PLAN_NUM']+"</span>")
	            arrHtml.push("</td>");
	            arrHtml.push("<td colno='WOI_OUT_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WOI_OUT_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'WOI_OUT_NUM')+"' "+ms.tdEvent(formId, 'WOI_OUT_NUM')+">")
	            arrHtml.push("<span colno='WOI_OUT_NUM' class='"+ms.uiClass(formId, 'WOI_OUT_NUM')+"' style='"+ms.uiStyle(formId, 'WOI_OUT_NUM')+"' "+ms.uiEvent(formId, 'WOI_OUT_NUM')+" title='"+v['WOI_OUT_NUM']+"' >"+v['WOI_OUT_NUM']+"</span>")
	            arrHtml.push("</td>");
	            arrHtml.push("<td colno='WOI_PACK_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WOI_PACK_NUM')+"' style='width:120px;text-align:right;"+ms.tdStyle(formId, 'WOI_PACK_NUM')+"' "+ms.tdEvent(formId, 'WOI_PACK_NUM')+">")
	            arrHtml.push("<span colno='WOI_PACK_NUM' class='"+ms.uiClass(formId, 'WOI_PACK_NUM')+"' style='"+ms.uiStyle(formId, 'WOI_PACK_NUM')+"' "+ms.uiEvent(formId, 'WOI_PACK_NUM')+" title='"+v['WOI_PACK_NUM']+"' >"+v['WOI_PACK_NUM']+"</span>")
	            arrHtml.push("</td>");
	            //arrHtml.push("<td colno='WOI_ITEM_SEQ' class='datagrid-cell "+ms.tdClass(formId, 'WOI_ITEM_SEQ')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'WOI_ITEM_SEQ')+"' "+ms.tdEvent(formId, 'WOI_ITEM_SEQ')+">")
	            //arrHtml.push("<span colno='WOI_ITEM_SEQ' class='"+ms.uiClass(formId, 'WOI_ITEM_SEQ')+"' style='"+ms.uiStyle(formId, 'WOI_ITEM_SEQ')+"' "+ms.uiEvent(formId, 'WOI_ITEM_SEQ')+" title='"+v['WOI_ITEM_SEQ']+"' >"+v['WOI_ITEM_SEQ']+"</span>")
	            //arrHtml.push("</td>");
	            arrHtml.push("<td colno='WOI_CONNECT_DOC' class='datagrid-cell "+ms.tdClass(formId, 'WOI_CONNECT_DOC')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'WOI_CONNECT_DOC')+"' "+ms.tdEvent(formId, 'WOI_CONNECT_DOC')+">")
	            arrHtml.push("<span colno='WOI_CONNECT_DOC' class='"+ms.uiClass(formId, 'WOI_CONNECT_DOC')+"' style='"+ms.uiStyle(formId, 'WOI_CONNECT_DOC')+"' "+ms.uiEvent(formId, 'WOI_CONNECT_DOC')+" title='"+v['WOI_CONNECT_DOC']+"' >"+v['WOI_CONNECT_DOC']+"</span>")
	            arrHtml.push("</td>");
	            arrHtml.push("<td colno='T5#WDT_TYPE_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T5#WDT_TYPE_NAME')+"' style='width:120px;text-align:center;"+ms.tdStyle(formId, 'T5#WDT_TYPE_NAME')+"' "+ms.tdEvent(formId, 'T5#WDT_TYPE_NAME')+">")
	            arrHtml.push("<span colno='T5#WDT_TYPE_NAME' class='"+ms.uiClass(formId, 'T5#WDT_TYPE_NAME')+"' style='"+ms.uiStyle(formId, 'T5#WDT_TYPE_NAME')+"' "+ms.uiEvent(formId, 'T5#WDT_TYPE_NAME')+" title='"+v['T5#WDT_TYPE_NAME']+"' >"+v['T5#WDT_TYPE_NAME']+"</span>")
	            arrHtml.push("</td>");
	            arrHtml.push("<td colno='T9#WDO_DISPATCH_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T9#WDO_DISPATCH_NAME')+"' style='width:120px;text-align:center;"+ms.tdStyle(formId, 'T9#WDO_DISPATCH_NAME')+"' "+ms.tdEvent(formId, 'T9#WDO_DISPATCH_NAME')+">")
	            arrHtml.push("<span colno='T9#WDO_DISPATCH_NAME' class='"+ms.uiClass(formId, 'T9#WDO_DISPATCH_NAME')+"' style='"+ms.uiStyle(formId, 'T9#WDO_DISPATCH_NAME')+"' "+ms.uiEvent(formId, 'T9#WDO_DISPATCH_NAME')+" title='"+v['T9#WDO_DISPATCH_NAME']+"' >"+v['T9#WDO_DISPATCH_NAME']+"</span>")
	            arrHtml.push("</td>");
	            arrHtml.push("<td colno='T2#WOD_DISPATCH_SN' class='datagrid-cell "+ms.tdClass(formId, 'T2#WOD_DISPATCH_SN')+"' style='display:none;width:120px;text-align:center;"+ms.tdStyle(formId, 'T2#WOD_DISPATCH_SN')+"' "+ms.tdEvent(formId, 'T2#WOD_DISPATCH_SN')+">")
	            arrHtml.push("<span colno='T2#WOD_DISPATCH_SN' class='"+ms.uiClass(formId, 'T2#WOD_DISPATCH_SN')+"' style='"+ms.uiStyle(formId, 'T2#WOD_DISPATCH_SN')+"' "+ms.uiEvent(formId, 'T2#WOD_DISPATCH_SN')+" title='"+v['T2#WOD_DISPATCH_SN']+"' >"+v['T2#WOD_DISPATCH_SN']+"</span>")
	            arrHtml.push("</td>");
	            arrHtml.push("<td colno='WOI_WH_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WOI_WH_CODE')+"' style='width:100px;text-align:left;"+ms.tdStyle(formId, 'WOI_WH_CODE')+"' "+ms.tdEvent(formId, 'WOI_WH_CODE')+">")
	            arrHtml.push("<span colno='WOI_WH_CODE' class='"+ms.uiClass(formId, 'WOI_WH_CODE')+"' style='"+ms.uiStyle(formId, 'WOI_WH_CODE')+"' "+ms.uiEvent(formId, 'WOI_WH_CODE')+" title='"+v['WOI_WH_CODE']+"' >"+v['WOI_WH_CODE']+"</span>")
	            arrHtml.push("<input type='hidden' id='WH_CODE_"+v.ID+"' value='"+uiRaw[i].WOI_WH_CODE+"'></td></td>");
	            arrHtml.push("<td colno='WOI_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WOI_ITEM_NAME')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'WOI_ITEM_NAME')+"' "+ms.tdEvent(formId, 'WOI_ITEM_NAME')+">")
	            arrHtml.push("<span colno='WOI_ITEM_NAME' class='"+ms.uiClass(formId, 'WOI_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'WOI_ITEM_NAME')+"' "+ms.uiEvent(formId, 'WOI_ITEM_NAME')+" title='"+v['WOI_ITEM_NAME']+"' >"+v['WOI_ITEM_NAME']+"</span>")
	            arrHtml.push("</td>");
	            arrHtml.push("<td colno='WOI_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'WOI_ITEM_SPEC')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'WOI_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'WOI_ITEM_SPEC')+">")
	            arrHtml.push("<span colno='WOI_ITEM_SPEC' class='"+ms.uiClass(formId, 'WOI_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'WOI_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'WOI_ITEM_SPEC')+" title='"+v['WOI_ITEM_SPEC']+"' >"+v['WOI_ITEM_SPEC']+"</span>")
	            arrHtml.push("</td>");
	            arrHtml.push("<td colno='T8#SUPPLIER_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T8#SUPPLIER_NAME')+"' style='width:120px;text-align:left;"+ms.tdStyle(formId, 'T8#SUPPLIER_NAME')+"' "+ms.tdEvent(formId, 'T8#SUPPLIER_NAME')+">")
	            arrHtml.push("<span colno='T8#SUPPLIER_NAME' class='"+ms.uiClass(formId, 'T8#SUPPLIER_NAME')+"' style='"+ms.uiStyle(formId, 'T8#SUPPLIER_NAME')+"' "+ms.uiEvent(formId, 'T8#SUPPLIER_NAME')+" title='"+v['T8#SUPPLIER_NAME']+"' >"+v['T8#SUPPLIER_NAME']+"</span>")
	            arrHtml.push("</td>");
	            arrHtml.push("<td colno='WOI_DELIVERY_DATE' class='datagrid-cell "+ms.tdClass(formId, 'WOI_DELIVERY_DATE')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'WOI_DELIVERY_DATE')+"' "+ms.tdEvent(formId, 'WOI_DELIVERY_DATE')+">")
	            arrHtml.push("<span colno='WOI_DELIVERY_DATE' class='"+ms.uiClass(formId, 'WOI_DELIVERY_DATE')+"' style='"+ms.uiStyle(formId, 'WOI_DELIVERY_DATE')+"' "+ms.uiEvent(formId, 'WOI_DELIVERY_DATE')+" title='"+v['WOI_DELIVERY_DATE']+"' >"+v['WOI_DELIVERY_DATE']+"</span>")
	            arrHtml.push("</td>");
	            arrHtml.push("<td colno='T4#NAME' class='datagrid-cell "+ms.tdClass(formId, 'T4#NAME')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'T4#NAME')+"' "+ms.tdEvent(formId, 'T4#NAME')+">")
	            arrHtml.push("<span colno='T4#NAME' class='"+ms.uiClass(formId, 'T4#NAME')+"' style='"+ms.uiStyle(formId, 'T4#NAME')+"' "+ms.uiEvent(formId, 'T4#NAME')+" title='"+v['T4#NAME']+"' >"+v['T4#NAME']+"</span>")
	            arrHtml.push("</td>");
	            arrHtml.push("<td colno='T2#WOD_CREATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'T2#WOD_CREATE_TIME')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'T2#WOD_CREATE_TIME')+"' "+ms.tdEvent(formId, 'T2#WOD_CREATE_TIME')+">")
	            arrHtml.push("<span colno='T2#WOD_CREATE_TIME' class='"+ms.uiClass(formId, 'T2#WOD_CREATE_TIME')+"' style='"+ms.uiStyle(formId, 'T2#WOD_CREATE_TIME')+"' "+ms.uiEvent(formId, 'T2#WOD_CREATE_TIME')+" title='"+v['T2#WOD_CREATE_TIME']+"' >"+v['T2#WOD_CREATE_TIME']+"</span>")
	            arrHtml.push("</td>");
	            arrHtml.push("<td colno='T2#WOD_DOC_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'T2#WOD_DOC_TYPE')+"' style='width:0px;text-align:center;padding:0;"+ms.tdStyle(formId, 'T2#WOD_DOC_TYPE')+"' "+ms.tdEvent(formId, 'T2#WOD_DOC_TYPE')+">")
	            arrHtml.push("<span colno='T2#WOD_DOC_TYPE' class='"+ms.uiClass(formId, 'T2#WOD_DOC_TYPE')+"' style='"+ms.uiStyle(formId, 'T2#WOD_DOC_TYPE')+"' "+ms.uiEvent(formId, 'T2#WOD_DOC_TYPE')+" title='"+v['T2#WOD_DOC_TYPE']+"' >"+v['T2#WOD_DOC_TYPE']+"</span>")
	            arrHtml.push("</td>");
	            arrHtml.push("<td colno='T2#WOD_OUTSTOCK_DATE' class='datagrid-cell "+ms.tdClass(formId, 'T2#WOD_OUTSTOCK_DATE')+"' style='width:0px;text-align:center;padding:0;"+ms.tdStyle(formId, 'T2#WOD_OUTSTOCK_DATE')+"' "+ms.tdEvent(formId, 'T2#WOD_OUTSTOCK_DATE')+">")
	            arrHtml.push("<span colno='T2#WOD_OUTSTOCK_DATE' class='"+ms.uiClass(formId, 'T2#WOD_OUTSTOCK_DATE')+"' style='"+ms.uiStyle(formId, 'T2#WOD_OUTSTOCK_DATE')+"' "+ms.uiEvent(formId, 'T2#WOD_OUTSTOCK_DATE')+" title='"+v['T2#WOD_OUTSTOCK_DATE']+"' >"+v['T2#WOD_OUTSTOCK_DATE']+"</span>")
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

function initHeight(){
	$('.panel-ajax').height(($(window).height() - 56 - 78 - 10 - 45  - 10)/2 - 30);
	$('.datagrid-body').css('height','calc(100% - 32px)');
	$('.panel1').height($(window).height() - 56 - 78 - 10 - 45 - 30);
}

$(function(){
	initHeight();
})

$(window).resize(function(){
	initHeight();
})
</script>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll','.head');
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


