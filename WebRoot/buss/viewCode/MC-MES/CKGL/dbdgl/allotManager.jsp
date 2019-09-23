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
		<dict:lang value="VM-调拨单管理" />
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
		<bu:header formId ="4f273d714d9544149f34e2d6d7ff9b4a"/>

    
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
			listAjaxTable("4f273d714d9544149f34e2d6d7ff9b4a");
			$("#allSelect").removeAttr("checked");
		}
		if(tag=="tag2"){
			searchItemDetail();
			$("#allSelect1").removeAttr("checked");
		}
	}
$(function(){
	$("#tag1").addClass("current");
	//$(document.getElementById('T2#WRD_DOC_TYPE')).closest('.group').attr("style","display:none;");
	
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
		<bu:func viewId="0085a339802e41748e95c64e0fcf536d" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="0085a339802e41748e95c64e0fcf536d" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage4f273d714d9544149f34e2d6d7ff9b4a" id="formPage4f273d714d9544149f34e2d6d7ff9b4a" value="${formPage4f273d714d9544149f34e2d6d7ff9b4a}"/>
		<input type="hidden" name="formId" id="formId1" value='4f273d714d9544149f34e2d6d7ff9b4a'/>
		<input type="hidden" name="formId" id="formId2" value='4f273d714d9544149f34e2d6d7ff1234'/>
		<input type="hidden" name="formId" id="formId3" value='4f273d714d9544149f34e2d6d7ff5678'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" id="itemId" name="itemId" value=''/>
		<div class="js-tab">
					<DIV id="container" style="box-sizing: border-box;">
						<DIV class="hd">
							<UL class="tab-list tab" style="padding-left:12px;">
								
								<LI id="tag1"><A class=""
									onclick="switchTag('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="调拨明细" /></SPAN> </A>
								</LI>
								<LI id="tag2"><A class=""
									onclick="switchTag('tag2','content2','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="调拨物料明细" /></SPAN> </A>
								</LI>
								

							</UL>
						</DIV>
			<DIV class="content1" id="content" style="margin-top: 15px;">
			<DIV id="content1" style="margin-top:4px;" data-tab="tag1">
		<div class="panel-ajax datagrid datagrid-div1"  id="4f273d714d9544149f34e2d6d7ff9b4a">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax4f273d714d9544149f34e2d6d7ff9b4a" style="overflow-x:hidden;">
		<div class="datagrid-header">
		<div class="datagrid-header-inner head2" id="datagrid-header-inner4f273d714d9544149f34e2d6d7ff9b4a">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable4f273d714d9544149f34e2d6d7ff9b4a" style="min-width:2000px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="4f273d714d9544149f34e2d6d7ff9b4a" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_4f273d714d9544149f34e2d6d7ff9b4a" onclick="_selectAjaxTableAllData(this,'4f273d714d9544149f34e2d6d7ff9b4a')" style="cursor: pointer;"title="全选"/></span></td>
				<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="4f273d714d9544149f34e2d6d7ff9b4a" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WAI_DOC_NUM" formId="4f273d714d9544149f34e2d6d7ff9b4a" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WAI_ITEM_CODE" formId="4f273d714d9544149f34e2d6d7ff9b4a" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="T2#WAD_ERP_FLAG" formId="4f273d714d9544149f34e2d6d7ff9b4a" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="T2#WAD_URGENT_FLAG" formId="4f273d714d9544149f34e2d6d7ff9b4a" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="T2#WAD_OUTSTOCK_FLAG" formId="4f273d714d9544149f34e2d6d7ff9b4a" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WAI_STATUS" formId="4f273d714d9544149f34e2d6d7ff9b4a" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WAI_PLAN_NUM" formId="4f273d714d9544149f34e2d6d7ff9b4a" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WAI_ALLOT_NUM" formId="4f273d714d9544149f34e2d6d7ff9b4a" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WAI_PACK_NUM" formId="4f273d714d9544149f34e2d6d7ff9b4a" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WAI_IN_WH" formId="4f273d714d9544149f34e2d6d7ff9b4a" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WAI_OUT_WH" formId="4f273d714d9544149f34e2d6d7ff9b4a" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="T4#WDT_TYPE_NAME" formId="4f273d714d9544149f34e2d6d7ff9b4a" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="T5#WDO_DISPATCH_NAME" formId="4f273d714d9544149f34e2d6d7ff9b4a" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WAI_ITEM_NAME" formId="4f273d714d9544149f34e2d6d7ff9b4a" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WAI_ITEM_SPEC" formId="4f273d714d9544149f34e2d6d7ff9b4a" /></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="WAI_ALLOT_DATE" formId="4f273d714d9544149f34e2d6d7ff9b4a" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="T3#NAME" formId="4f273d714d9544149f34e2d6d7ff9b4a" /></td>
			<td class="datagrid-cell" style="width:140px;" ><bu:uitn colNo="T2#WAD_CREATE_TIME" formId="4f273d714d9544149f34e2d6d7ff9b4a" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax scroll2" id="tableDiv4f273d714d9544149f34e2d6d7ff9b4a" onscroll="ajaxTableScroll(this,'4f273d714d9544149f34e2d6d7ff9b4a')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff9b4a" style="min-width:2000px;">
		<tbody id="tbody_4f273d714d9544149f34e2d6d7ff9b4a" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage4f273d714d9544149f34e2d6d7ff9b4a==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=4f273d714d9544149f34e2d6d7ff9b4a&showLoading=0" />
			</div>
		</c:if>
		 <!---->
			
				<div class="panel-ajax datagrid datagrid-div1" style="margin-top:10px;"><!--143-->
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
						<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head1"  id="">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz " id="datagrid-htable4f273d714d9544149f34e2d6d7ff1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
									<!--	<td class="datagrid-cell" align="center" style="width:30px;text-align: center"><input type="checkbox" id="allSelect" name="allSelect" onchange="getAllItem();"/></td > -->
						
										<td class="datagrid-cell" style="width:250px;" ><dict:lang value="物料SN" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料料号" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料名称" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料规格" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="调拨数量" /></td >
										
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="包装小箱SN" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="包装大箱SN" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="包装栈板SN" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="顶级包装SN" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="调入仓库" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="调出仓库" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="操作人" /></td >
										<td class="datagrid-cell" style="width:130px;" ><dict:lang value="操作时间" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="上传标识" /></td >
										<td class="datagrid-cell" style="width:200px;"><dict:lang value="上传时间" /></td >
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll1"><!--130-->
							<table class="datagrid-btable fixedTable dblClick "   id="datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234" >
								<tbody id="addItemDetail" >
								</tbody>
							</table>
						</div>
						
					</div>
				</div>
				<div style="background-color: white;margin-top:0px;" id="">
                                 			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchItemInfo&formId=formId2&showLoading=0" />
                                 		</div>	
			</div><!---->
		</DIV>
			<DIV id="content2" style="display:none" data-tab="tag2">
				<div class="panel1 datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border:0;">
						<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head"  id="" >
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz " id="datagrid-htable4f273d714d9544149f34e2d6d7ff5678">
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"><input type="checkbox" id="allSelect1" name="allSelect" onchange="getAllItem1();"/></td >
						                <td class="datagrid-cell" style="width:200px;" ><dict:lang value="组织机构" /></td >
										<td class="datagrid-cell" style="width:250px;" ><dict:lang value="物料SN" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料料号" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料名称" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料规格" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="调拨数量" /></td >
										
										
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="包装小箱SN" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="包装大箱SN" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="包装栈板SN" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="顶级包装SN" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="调入仓库" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="调出仓库" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="操作人" /></td >
										<td class="datagrid-cell" style="width:130px;" ><dict:lang value="操作时间" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="上传标识" /></td >
										<td class="datagrid-cell" style="width:200px;"><dict:lang value="上传时间" /></td >
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll">
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678" >
								<tbody id="addSecondItemDetail" >
								</tbody>
							</table>
						</div>
							
					</div>
				</div>
				<div style="background-color: white;" id="pageDiv">
                                 			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchSecondItem&formId=formId3&showLoading=0" />
                                 		</div>
			</DIV>
		 				

	</DIV>

</DIV>

		<input type="hidden" name="tableCount" id="tableCount" value='2' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="0085a339802e41748e95c64e0fcf536d" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="0085a339802e41748e95c64e0fcf536d" />
    
<script type="text/javascript">
function listAjaxTable(formId){
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    //var url = "/mes/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,T2#WRD_STATUS\"}";
                    //var url = "${path}buss/bussModel_listMsData.ms";
                    var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,DATA_AUTH\"}";
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
                
                
                function init(){
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    initTableWidth();
                     $("#T2#WAD_CREATE_TIME_BEGIN").val(timeBeginString());
                     $("#T2#WAD_CREATE_TIME_END").val(timeEndString());
                    //$(document.getElementById('T2#WPD_DELIVERY_DATE_BEGIN')).val(timeBeginString());
                    //$(document.getElementById('T2#WPD_DELIVERY_DATE_END')).val(timeEndString());
                     //$(document.getElementById('T2#WRD_DOC_TYPE')).val('DJ02');
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
                
                  /*function timeBeginString(){
			var datetime = new Date();
			//datetime.setDate(datetime.getDate()-360);
			var year = datetime.getFullYear();
			var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth()+ 1 ;
			var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
			date =date < 10 ? "0" + date : date;
			if(0>=date<=30){
			  //  console.log(getEndDay());
			    date=getEndDay(date);
			    month = datetime.getMonth()  < 10 ? "0" + (datetime.getMonth() ) : datetime.getMonth() ;
			}
			return year + "-" + month + "-" + date +" 00:00:00";
	}

	function timeEndString(){
		var datetime = new Date();
		//datetime.setDate(datetime.getDate()+360);
		var year = datetime.getFullYear();
		var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
		
		var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
		
		//return year + "-" + month + "-" + date +" 23:59:59";
		return year + "-" + month + "-" + date+" 23:59:59";
	} */
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
                
                function searchItemInfo(paginationImpl){
                     var url = "${path}buss/bussModel_exeFunc.ms?funcMId=4df4b01f45c14cb3b0ab328c16f7fe55";

	                SearchItemInfo(paginationImpl,url);
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

//点击入库信息获取物料信息
var getItemDetailUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=ad46c0fc84cc4cffaea7a0291ee892ca";
function showItemDetail(itemId){  
//var itemCode = $("#ITEM_CODE_"+itemId).val();
	$("#itemId").val(itemId);
	var dataAuth=$("#DATA_AUTH_"+itemId).val();
	//$("#DATA_AUTH").val();
	util.showLoading("处理中...");
	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: getItemDetailUrl,
			    data: {
			        "itemId" : itemId,
			        "dataAuth":dataAuth
			        
			    },
				success: function(data){
						util.closeLoading();
						$("#addItemDetail").empty();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							var tempFlag;
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].CI_ITEM_SPEC==null)  rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].CI_ITEM_NAME==null)  rccList[i].CI_ITEM_NAME="";
								if(rccList[i].WAD_FIRST_SN==null)  rccList[i].WAD_FIRST_SN="";
								if(rccList[i].WAD_SECOND_SN==null)  rccList[i].WAD_SECOND_SN="";
								if(rccList[i].WAD_THIRD_SN==null)  rccList[i].WAD_THIRD_SN="";
								if(rccList[i].WAD_FOURTH_SN==null)  rccList[i].WAD_FOURTH_SN="";
								if(rccList[i].NAME==null)  rccList[i].NAME="";
								if(rccList[i].ALLOT_TIME==null)  rccList[i].ALLOT_TIME="";
								if(rccList[i].WAD_UPLOAD_FLAG==null)  tempFlag="";
								if(rccList[i].WAD_UPLOAD_FLAG=="Y"){
										tempFlag="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
								}else if(rccList[i].WAD_UPLOAD_FLAG=="N"){
										tempFlag="<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
								}
								if(rccList[i].WAD_UPLOAD_TIME==null)  rccList[i].WAD_UPLOAD_TIME="";
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
							//	$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:250px;text-align: center;' title='"+rccList[i].WAD_ITEM_SN+"'><span onclick='itemJump2(\""+rccList[i].WAD_ITEM_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WAD_ITEM_SN+"</span></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;' title='"+rccList[i].WAD_ITEM_CODE+"'><span onclick='itemJump1(\""+rccList[i].WAD_ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WAD_ITEM_CODE+"</span></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: center;' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: center;' title='"+rccList[i].CI_ITEM_SPEC+"'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:90px;text-align: right;' title='"+rccList[i].WAD_ALLOT_NUM+"'>"+rccList[i].WAD_ALLOT_NUM+"</td>");
								
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:110px;' title='"+rccList[i].WAD_FIRST_SN+"'>"+rccList[i].WAD_FIRST_SN+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:110px;' title='"+rccList[i].WAD_SECOND_SN+"'>"+rccList[i].WAD_SECOND_SN+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:110px;' title='"+rccList[i].WAD_THIRD_SN+"'>"+rccList[i].WAD_THIRD_SN+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:110px;' title='"+rccList[i].WAD_FOURTH_SN+"'>"+rccList[i].WAD_FOURTH_SN+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:110px;' title='"+rccList[i].IN_WH_NAME+"'>"+rccList[i].IN_WH_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:110px;' title='"+rccList[i].OUT_WH_NAME+"'>"+rccList[i].OUT_WH_NAME+"</td>");
								
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:90px;text-align: center;' title='"+rccList[i].NAME+"'>"+rccList[i].NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='width:130px;' title='"+rccList[i].ALLOT_TIME+"'>"+rccList[i].ALLOT_TIME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-16' style='width:70px;text-align: center;'>"+tempFlag+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-17'  style='width:200px;' title='"+rccList[i].WAD_UPLOAD_TIME+"'>"+rccList[i].WAD_UPLOAD_TIME+"</td>");
							}
						}
						pageFun(data.ajaxPage,"formId2");
							var tableTrJs = $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tbody tr");
							_tongLineColor(tableTrJs);
							//clickTr('itemDetail');
							defTableWidthRewrite('4f273d714d9544149f34e2d6d7ff1234');
						
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
    	var dataAuth= $("#DATA_AUTH_"+itemId).val();
    	var beginTime =  $("#T2#WAD_CREATE_TIME_BEGIN").val();
        var endTime = $("#T2#WAD_CREATE_TIME_END").val();
    	util.showLoading("处理中...");
    	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: url,
			    data: {
			        "paraMap.type" : 1,
			        "paraMap.itemId" : itemId,
			        "dataAuth":dataAuth,
			        "page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPag,
			        "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
			        "beginTime" : beginTime,
			        "endTime" : endTime
			    },
			    //data: "paraMap.type=1&paraMap.itemId="+itemId+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				success: function(data){
				                 
						util.closeLoading();
						$("#addItemDetail").empty();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							var tempFlag;
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].CI_ITEM_SPEC==null)  rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].CI_ITEM_NAME==null)  rccList[i].CI_ITEM_NAME="";
								if(rccList[i].WAD_FIRST_SN==null)  rccList[i].WAD_FIRST_SN="";
								if(rccList[i].WAD_SECOND_SN==null)  rccList[i].WAD_SECOND_SN="";
								if(rccList[i].WAD_THIRD_SN==null)  rccList[i].WAD_THIRD_SN="";
								if(rccList[i].WAD_FOURTH_SN==null)  rccList[i].WAD_FOURTH_SN="";
								if(rccList[i].NAME==null)  rccList[i].NAME="";
								if(rccList[i].ALLOT_TIME==null)  rccList[i].ALLOT_TIME="";
								if(rccList[i].WAD_UPLOAD_FLAG==null)  tempFlag="";
								if(rccList[i].WAD_UPLOAD_FLAG=="Y"){
										tempFlag="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
								}else if(rccList[i].WAD_UPLOAD_FLAG=="N"){
										tempFlag="<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
								}
								if(rccList[i].WAD_UPLOAD_TIME==null)  rccList[i].WAD_UPLOAD_TIME="";
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
							//	$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:250px;text-align: center;' title='"+rccList[i].WAD_ITEM_SN+"'><span onclick='itemJump2(\""+rccList[i].WAD_ITEM_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WAD_ITEM_SN+"</span></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;' title='"+rccList[i].WAD_ITEM_CODE+"'><span onclick='itemJump1(\""+rccList[i].WAD_ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WAD_ITEM_CODE+"</span></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: center;' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: center;' title='"+rccList[i].CI_ITEM_SPEC+"'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:90px;text-align: right;' title='"+rccList[i].WAD_ALLOT_NUM+"'>"+rccList[i].WAD_ALLOT_NUM+"</td>");
								
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:110px;' title='"+rccList[i].WAD_FIRST_SN+"'>"+rccList[i].WAD_FIRST_SN+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:110px;' title='"+rccList[i].WAD_SECOND_SN+"'>"+rccList[i].WAD_SECOND_SN+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:110px;' title='"+rccList[i].WAD_THIRD_SN+"'>"+rccList[i].WAD_THIRD_SN+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:110px;' title='"+rccList[i].WAD_FOURTH_SN+"'>"+rccList[i].WAD_FOURTH_SN+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:110px;' title='"+rccList[i].IN_WH_NAME+"'>"+rccList[i].IN_WH_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:110px;' title='"+rccList[i].OUT_WH_NAME+"'>"+rccList[i].OUT_WH_NAME+"</td>");
								
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:90px;text-align: center;' title='"+rccList[i].NAME+"'>"+rccList[i].NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='width:130px;' title='"+rccList[i].ALLOT_TIME+"'>"+rccList[i].ALLOT_TIME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-16' style='width:70px;text-align: center;'>"+tempFlag+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tr:last").append("<td class='datagrid-cell datagrid-cell-17' style='width:200px;' title='"+rccList[i].WAD_UPLOAD_TIME+"'>"+rccList[i].WAD_UPLOAD_TIME+"</td>");
							}
						}
						pageFun(data.ajaxPage,"formId2");
							var tableTrJs = $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff1234 tbody tr");
							_tongLineColor(tableTrJs);
							//clickTr('itemDetail');
							defTableWidthRewrite('4f273d714d9544149f34e2d6d7ff1234');
						
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
	var itemCode = $.trim($("#WAI_ITEM_CODE_SHOW").val());
	var docNum = $.trim($("#WAI_DOC_NUM").val());
	var inWh = $("#WAI_IN_WH").val();
	var outWh = $("#WAI_OUT_WH").val();
	var beginTime =  $("#T2#WAD_CREATE_TIME_BEGIN").val();
    var endTime = $("#T2#WAD_CREATE_TIME_END").val();
	
	util.showLoading("处理中...");
	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: getItemDetailUrl,
			    data: {
			        "itemCode" : itemCode,
			        "dataAuth" : dataAuth,
			        "docNum" : docNum,
			        "inWh" : inWh,
			        "outWh" : outWh,
			        "beginTime" : beginTime,
			        "endTime" : endTime
			    },
				success: function(data){
						util.closeLoading();
						$("#addSecondItemDetail").empty();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							$('.scroll').mCustomScrollbar("destroy");
							var tempFlag;
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].CI_ITEM_SPEC==null)  rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].CI_ITEM_NAME==null)  rccList[i].CI_ITEM_NAME="";
								if(rccList[i].WAD_FIRST_SN==null)  rccList[i].WAD_FIRST_SN="";
								if(rccList[i].WAD_SECOND_SN==null)  rccList[i].WAD_SECOND_SN="";
								if(rccList[i].WAD_THIRD_SN==null)  rccList[i].WAD_THIRD_SN="";
								if(rccList[i].WAD_FOURTH_SN==null)  rccList[i].WAD_FOURTH_SN="";
								if(rccList[i].NAME==null)  rccList[i].NAME="";
								if(rccList[i].ALLOT_TIME==null)  rccList[i].ALLOT_TIME="";
								if(rccList[i].WAD_UPLOAD_FLAG==null)  tempFlag="";
								if(rccList[i].WAD_UPLOAD_FLAG=="Y"){
										tempFlag="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
								}else if(rccList[i].WAD_UPLOAD_FLAG=="N"){
										tempFlag="<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
								}
								if(rccList[i].WAD_UPLOAD_TIME==null)  rccList[i].WAD_UPLOAD_TIME="";
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tbody:last").append("<tr id='tr2_"+i+"' ></tr>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-3 TD_DATA_AUTH ' style='width:200px;text-align: center;' title='"+rccList[i].AUTHNAME+"'>"+rccList[i].AUTHNAME+"<input type='hidden' id='DATA_AUTH_ID' value='"+rccList[i].AUTHNAME+"' /></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:250px;text-align: center;' title='"+rccList[i].WAD_ITEM_SN+"'><span onclick='itemJump2(\""+rccList[i].WAD_ITEM_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WAD_ITEM_SN+"</span></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;' title='"+rccList[i].WAD_ITEM_CODE+"'><span onclick='itemJump1(\""+rccList[i].WAD_ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WAD_ITEM_CODE+"</span></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: center;' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: center;' title='"+rccList[i].CI_ITEM_SPEC+"'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678  tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:90px;text-align: right;' title='"+rccList[i].WAD_ALLOT_NUM+"'>"+rccList[i].WAD_ALLOT_NUM+"</td>");
								
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:110px;' title='"+rccList[i].WAD_FIRST_SN+"'>"+rccList[i].WAD_FIRST_SN+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:110px;' title='"+rccList[i].WAD_SECOND_SN+"'>"+rccList[i].WAD_SECOND_SN+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:110px;' title='"+rccList[i].WAD_THIRD_SN+"'>"+rccList[i].WAD_THIRD_SN+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:110px;' title='"+rccList[i].WAD_FOURTH_SN+"'>"+rccList[i].WAD_FOURTH_SN+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:110px;' title='"+rccList[i].IN_WH_NAME+"'>"+rccList[i].IN_WH_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:110px;' title='"+rccList[i].OUT_WH_NAME+"'>"+rccList[i].OUT_WH_NAME+"</td>");
								
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:90px;text-align: center;' title='"+rccList[i].NAME+"'>"+rccList[i].NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='width:130px;' title='"+rccList[i].ALLOT_TIME+"'>"+rccList[i].ALLOT_TIME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-16' style='width:70px;text-align: center;'>"+tempFlag+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-17' style='width:200px;' title='"+rccList[i].WAD_UPLOAD_TIME+"'>"+rccList[i].WAD_UPLOAD_TIME+"</td>");
							}
						}
						setPopScroll('.scroll','.head');
						pageFun(data.ajaxPage,"formId3");
							var tableTrJs = $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tbody tr");
							_tongLineColor(tableTrJs);
							defTableWidthRewrite("4f273d714d9544149f34e2d6d7ff5678");
							//clickTr('itemDetail');
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//详细信息分页  buss/bussModel_exeFunc.ms?FUNC_CODE=F6851&funcMId=4df4b01f45c14cb3b0ab328c16f7fe55
var paginationImpl = {};
function searchSecondItem(paginationImpl){
	var isFirstLoad = firstLoadThisPage(paginationImpl);
    	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
    	var dataAuth = $("#DATA_AUTH").val();
	var itemCode = $.trim($("#WAI_ITEM_CODE_SHOW").val());
	var docNum = $.trim($("#WAI_DOC_NUM").val());
	var inWh = $("#WAI_IN_WH").val();
	var outWh = $("#WAI_OUT_WH").val();
	var beginTime =  $("#T2#WAD_CREATE_TIME_BEGIN").val();
    var endTime = $("#T2#WAD_CREATE_TIME_END").val();
    	util.showLoading("处理中...");
    	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: "buss/bussModel_exeFunc.ms?funcMId=4df4b01f45c14cb3b0ab328c16f7fe55",
			    data: {
			        "paraMap.type" : 1,
			        "paraMap.itemCode" : itemCode,
			        "paraMap.dataAuth" : dataAuth,
			        "paraMap.docNum" : docNum,
			        "paraMap.inWh" : inWh,
			        "paraMap.outWh" : outWh,
			        "page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			        "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
			        "beginTime" : beginTime,
			        "endTime" : endTime
			        
			    },
			    //data: "paraMap.type=1&paraMap.itemCode="+itemCode+"&paraMap.dataAuth="+dataAuth+"&paraMap.docNum="+docNum+"&paraMap.inWh="+inWh+"&paraMap.outWh="+outWh+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				success: function(data){
				                 
						util.closeLoading();
						$("#addSecondItemDetail").empty();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							var tempFlag;
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].CI_ITEM_SPEC==null)  rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].CI_ITEM_NAME==null)  rccList[i].CI_ITEM_NAME="";
								if(rccList[i].WAD_FIRST_SN==null)  rccList[i].WAD_FIRST_SN="";
								if(rccList[i].WAD_SECOND_SN==null)  rccList[i].WAD_SECOND_SN="";
								if(rccList[i].WAD_THIRD_SN==null)  rccList[i].WAD_THIRD_SN="";
								if(rccList[i].WAD_FOURTH_SN==null)  rccList[i].WAD_FOURTH_SN="";
								if(rccList[i].NAME==null)  rccList[i].NAME="";
								if(rccList[i].ALLOT_TIME==null)  rccList[i].ALLOT_TIME="";
								if(rccList[i].WAD_UPLOAD_FLAG==null)  tempFlag="";
								if(rccList[i].WAD_UPLOAD_FLAG=="Y"){
										tempFlag="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
								}else if(rccList[i].WAD_UPLOAD_FLAG=="N"){
										tempFlag="<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
								}
								if(rccList[i].WAD_UPLOAD_TIME==null)  rccList[i].WAD_UPLOAD_TIME="";
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tbody:last").append("<tr id='tr2_"+i+"' ></tr>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-3 TD_DATA_AUTH ' style='width:200px;text-align: center;' title='"+rccList[i].AUTHNAME+"'>"+rccList[i].AUTHNAME+"<input type='hidden' id='DATA_AUTH_ID' value='"+rccList[i].AUTHNAME+"' /></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:250px;text-align: center;' title='"+rccList[i].WAD_ITEM_SN+"'><span onclick='itemJump2(\""+rccList[i].WAD_ITEM_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WAD_ITEM_SN+"</span></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;' title='"+rccList[i].WAD_ITEM_CODE+"'><span onclick='itemJump1(\""+rccList[i].WAD_ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WAD_ITEM_CODE+"</span></td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: center;' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: center;' title='"+rccList[i].CI_ITEM_SPEC+"'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678  tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:90px;text-align: right;' title='"+rccList[i].WAD_ALLOT_NUM+"'>"+rccList[i].WAD_ALLOT_NUM+"</td>");
								
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:110px;' title='"+rccList[i].WAD_FIRST_SN+"'>"+rccList[i].WAD_FIRST_SN+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:110px;' title='"+rccList[i].WAD_SECOND_SN+"'>"+rccList[i].WAD_SECOND_SN+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:110px;' title='"+rccList[i].WAD_THIRD_SN+"'>"+rccList[i].WAD_THIRD_SN+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:110px;' title='"+rccList[i].WAD_FOURTH_SN+"'>"+rccList[i].WAD_FOURTH_SN+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:110px;' title='"+rccList[i].IN_WH_NAME+"'>"+rccList[i].IN_WH_NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:110px;' title='"+rccList[i].OUT_WH_NAME+"'>"+rccList[i].OUT_WH_NAME+"</td>");
								
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:90px;text-align: center;' title='"+rccList[i].NAME+"'>"+rccList[i].NAME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='width:130px;' title='"+rccList[i].ALLOT_TIME+"'>"+rccList[i].ALLOT_TIME+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-16' style='width:70px;'text-align: center;>"+tempFlag+"</td>");
								$("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tr:last").append("<td class='datagrid-cell datagrid-cell-17' style='width:200px;' title='"+rccList[i].WAD_UPLOAD_TIME+"'>"+rccList[i].WAD_UPLOAD_TIME+"</td>");
							}
						}
						pageFun(data.ajaxPage,"formId3");
							var tableTrJs = $("#datagrid-btable-ajax4f273d714d9544149f34e2d6d7ff5678 tbody tr");
							
							_tongLineColor(tableTrJs);
							defTableWidthRewrite("4f273d714d9544149f34e2d6d7ff5678");
							//clickTr('itemDetail');
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
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
    if(formId=='4f273d714d9544149f34e2d6d7ff9b4a'){<%--FM-调拨单物料信息--%>
        $('.scroll2').mCustomScrollbar("destroy");
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' onclick=\"showItemDetail('"+v.ID+"');\" abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /></td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_"+v.ID+"' value='"+uiRaw[i].DATA_AUTH+"' /></td>");
            arrHtml.push("<td colno='WAI_DOC_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WAI_DOC_NUM')+"' style='width:150px;"+ms.tdStyle(formId, 'WAI_DOC_NUM')+"' "+ms.tdEvent(formId, 'WAI_DOC_NUM')+">")
            arrHtml.push("<span colno='WAI_DOC_NUM' class='"+ms.uiClass(formId, 'WAI_DOC_NUM')+"' style='"+ms.uiStyle(formId, 'WAI_DOC_NUM')+"' "+ms.uiEvent(formId, 'WAI_DOC_NUM')+" title='"+ms.titleAttr(formId,'WAI_DOC_NUM','IS_TITLE_ATTR',v)+"' >"+v['WAI_DOC_NUM']+"</span>")
            arrHtml.push("<input type='hidden' id='WAI_DOC_NUM_"+v.ID+"' value='"+v['WAI_DOC_NUM']+"' /></td>");
            arrHtml.push("<td colno='WAI_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WAI_ITEM_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'WAI_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WAI_ITEM_CODE')+">")
            arrHtml.push("<span colno='WAI_ITEM_CODE' class='"+ms.uiClass(formId, 'WAI_ITEM_CODE')+"' onclick='itemJump1(\""+v['WAI_ITEM_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WAI_ITEM_CODE')+" title='"+ms.titleAttr(formId,'WAI_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['WAI_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#WAD_ERP_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'T2#WAD_ERP_FLAG')+"' style='width:120px;text-align:center;"+ms.tdStyle(formId, 'T2#WAD_ERP_FLAG')+"' "+ms.tdEvent(formId, 'T2#WAD_ERP_FLAG')+">")
            arrHtml.push("<span colno='T2#WAD_ERP_FLAG' class='"+ms.uiClass(formId, 'T2#WAD_ERP_FLAG')+"' style='"+ms.uiStyle(formId, 'T2#WAD_ERP_FLAG')+"' "+ms.uiEvent(formId, 'T2#WAD_ERP_FLAG')+" title='"+ms.titleAttr(formId,'T2#WAD_ERP_FLAG','IS_TITLE_ATTR',v)+"' >"+v['T2#WAD_ERP_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#WAD_URGENT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'T2#WAD_URGENT_FLAG')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'T2#WAD_URGENT_FLAG')+"' "+ms.tdEvent(formId, 'T2#WAD_URGENT_FLAG')+">")
            arrHtml.push("<span colno='T2#WAD_URGENT_FLAG' class='"+ms.uiClass(formId, 'T2#WAD_URGENT_FLAG')+"' style='"+ms.uiStyle(formId, 'T2#WAD_URGENT_FLAG')+"' "+ms.uiEvent(formId, 'T2#WAD_URGENT_FLAG')+" title='"+ms.titleAttr(formId,'T2#WAD_URGENT_FLAG','IS_TITLE_ATTR',v)+"' >"+v['T2#WAD_URGENT_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#WAD_OUTSTOCK_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'T2#WAD_OUTSTOCK_FLAG')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'T2#WAD_OUTSTOCK_FLAG')+"' "+ms.tdEvent(formId, 'T2#WAD_OUTSTOCK_FLAG')+">")
            arrHtml.push("<span colno='T2#WAD_OUTSTOCK_FLAG' class='"+ms.uiClass(formId, 'T2#WAD_OUTSTOCK_FLAG')+"' style='"+ms.uiStyle(formId, 'T2#WAD_OUTSTOCK_FLAG')+"' "+ms.uiEvent(formId, 'T2#WAD_OUTSTOCK_FLAG')+" title='"+ms.titleAttr(formId,'T2#WAD_OUTSTOCK_FLAG','IS_TITLE_ATTR',v)+"' >"+v['T2#WAD_OUTSTOCK_FLAG']+"</span>")
            arrHtml.push("</td>");
         
            arrHtml.push("<td colno='WAI_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'WAI_STATUS')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'WAI_STATUS')+"' "+ms.tdEvent(formId, 'WAI_STATUS')+">")
            arrHtml.push("<span colno='WAI_STATUS' class='"+ms.uiClass(formId, 'WAI_STATUS')+"' style='"+ms.uiStyle(formId, 'WAI_STATUS')+"' "+ms.uiEvent(formId, 'WAI_STATUS')+" title='"+ms.titleAttr(formId,'WAI_STATUS','IS_TITLE_ATTR',v)+"' >"+v['WAI_STATUS']+"</span>")
            arrHtml.push("<input type='hidden' id='state_"+v.ID+"' value='"+v['WAD_STATUS']+"'></td>");
            arrHtml.push("<td colno='WAI_PLAN_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WAI_PLAN_NUM')+"' style='width:70px;text-align:right;"+ms.tdStyle(formId, 'WAI_PLAN_NUM')+"' "+ms.tdEvent(formId, 'WAI_PLAN_NUM')+">")
            arrHtml.push("<span colno='WAI_PLAN_NUM' class='"+ms.uiClass(formId, 'WAI_PLAN_NUM')+"' style='"+ms.uiStyle(formId, 'WAI_PLAN_NUM')+"' "+ms.uiEvent(formId, 'WAI_PLAN_NUM')+" title='"+ms.titleAttr(formId,'WAI_PLAN_NUM','IS_TITLE_ATTR',v)+"' >"+v['WAI_PLAN_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WAI_ALLOT_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WAI_ALLOT_NUM')+"' style='width:70px;text-align:right;"+ms.tdStyle(formId, 'WAI_ALLOT_NUM')+"' "+ms.tdEvent(formId, 'WAI_ALLOT_NUM')+">")
            arrHtml.push("<span colno='WAI_ALLOT_NUM' class='"+ms.uiClass(formId, 'WAI_ALLOT_NUM')+"' style='"+ms.uiStyle(formId, 'WAI_ALLOT_NUM')+"' "+ms.uiEvent(formId, 'WAI_ALLOT_NUM')+" title='"+ms.titleAttr(formId,'WAI_ALLOT_NUM','IS_TITLE_ATTR',v)+"' >"+v['WAI_ALLOT_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WAI_PACK_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WAI_PACK_NUM')+"' style='width:120px;text-align:right;"+ms.tdStyle(formId, 'WAI_PACK_NUM')+"' "+ms.tdEvent(formId, 'WAI_PACK_NUM')+">")
            arrHtml.push("<span colno='WAI_PACK_NUM' class='"+ms.uiClass(formId, 'WAI_PACK_NUM')+"' style='"+ms.uiStyle(formId, 'WAI_PACK_NUM')+"' "+ms.uiEvent(formId, 'WAI_PACK_NUM')+" title='"+ms.titleAttr(formId,'WAI_PACK_NUM','IS_TITLE_ATTR',v)+"' >"+v['WAI_PACK_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WAI_IN_WH' class='datagrid-cell "+ms.tdClass(formId, 'WAI_IN_WH')+"' style='width:90px;"+ms.tdStyle(formId, 'WAI_IN_WH')+"' "+ms.tdEvent(formId, 'WAI_IN_WH')+">")
            arrHtml.push("<span colno='WAI_IN_WH' class='"+ms.uiClass(formId, 'WAI_IN_WH')+"' onclick='itemJump3(\""+v['WAI_IN_WH']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WAI_IN_WH')+" title='"+ms.titleAttr(formId,'WAI_IN_WH','IS_TITLE_ATTR',v)+"' >"+v['WAI_IN_WH']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WAI_OUT_WH' class='datagrid-cell "+ms.tdClass(formId, 'WAI_OUT_WH')+"' style='width:90px;"+ms.tdStyle(formId, 'WAI_OUT_WH')+"' "+ms.tdEvent(formId, 'WAI_OUT_WH')+">")
            arrHtml.push("<span colno='WAI_OUT_WH' class='"+ms.uiClass(formId, 'WAI_OUT_WH')+"' onclick='itemJump4(\""+v['WAI_OUT_WH']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WAI_OUT_WH')+" title='"+ms.titleAttr(formId,'WAI_OUT_WH','IS_TITLE_ATTR',v)+"' >"+v['WAI_OUT_WH']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T4#WDT_TYPE_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T4#WDT_TYPE_NAME')+"' style='width:90px;"+ms.tdStyle(formId, 'T4#WDT_TYPE_NAME')+"' "+ms.tdEvent(formId, 'T4#WDT_TYPE_NAME')+">")
            arrHtml.push("<span colno='T4#WDT_TYPE_NAME' class='"+ms.uiClass(formId, 'T4#WDT_TYPE_NAME')+"' style='"+ms.uiStyle(formId, 'T4#WDT_TYPE_NAME')+"' "+ms.uiEvent(formId, 'T4#WDT_TYPE_NAME')+" title='"+ms.titleAttr(formId,'T4#WDT_TYPE_NAME','IS_TITLE_ATTR',v)+"' >"+v['T4#WDT_TYPE_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T5#WDO_DISPATCH_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T5#WDO_DISPATCH_NAME')+"' style='width:90px;"+ms.tdStyle(formId, 'T5#WDO_DISPATCH_NAME')+"' "+ms.tdEvent(formId, 'T5#WDO_DISPATCH_NAME')+">")
            arrHtml.push("<span colno='T5#WDO_DISPATCH_NAME' class='"+ms.uiClass(formId, 'T5#WDO_DISPATCH_NAME')+"' style='"+ms.uiStyle(formId, 'T5#WDO_DISPATCH_NAME')+"' "+ms.uiEvent(formId, 'T5#WDO_DISPATCH_NAME')+" title='"+ms.titleAttr(formId,'T5#WDO_DISPATCH_NAME','IS_TITLE_ATTR',v)+"' >"+v['T5#WDO_DISPATCH_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WAI_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WAI_ITEM_NAME')+"' style='width:150px;"+ms.tdStyle(formId, 'WAI_ITEM_NAME')+"' "+ms.tdEvent(formId, 'WAI_ITEM_NAME')+">")
            arrHtml.push("<span colno='WAI_ITEM_NAME' class='"+ms.uiClass(formId, 'WAI_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'WAI_ITEM_NAME')+"' "+ms.uiEvent(formId, 'WAI_ITEM_NAME')+" title='"+ms.titleAttr(formId,'WAI_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['WAI_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WAI_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'WAI_ITEM_SPEC')+"' style='width:150px;"+ms.tdStyle(formId, 'WAI_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'WAI_ITEM_SPEC')+">")
            arrHtml.push("<span colno='WAI_ITEM_SPEC' class='"+ms.uiClass(formId, 'WAI_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'WAI_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'WAI_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'WAI_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['WAI_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WAI_ALLOT_DATE' class='datagrid-cell "+ms.tdClass(formId, 'WAI_ALLOT_DATE')+"' style='width:130px;text-align:center;"+ms.tdStyle(formId, 'WAI_ALLOT_DATE')+"' "+ms.tdEvent(formId, 'WAI_ALLOT_DATE')+">")
            arrHtml.push("<span colno='WAI_ALLOT_DATE' class='"+ms.uiClass(formId, 'WAI_ALLOT_DATE')+"' style='"+ms.uiStyle(formId, 'WAI_ALLOT_DATE')+"' "+ms.uiEvent(formId, 'WAI_ALLOT_DATE')+" title='"+ms.titleAttr(formId,'WAI_ALLOT_DATE','IS_TITLE_ATTR',v)+"' >"+v['WAI_ALLOT_DATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T3#NAME' class='datagrid-cell "+ms.tdClass(formId, 'T3#NAME')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'T3#NAME')+"' "+ms.tdEvent(formId, 'T3#NAME')+">")
            arrHtml.push("<span colno='T3#NAME' class='"+ms.uiClass(formId, 'T3#NAME')+"' style='"+ms.uiStyle(formId, 'T3#NAME')+"' "+ms.uiEvent(formId, 'T3#NAME')+" title='"+ms.titleAttr(formId,'T3#NAME','IS_TITLE_ATTR',v)+"' >"+v['T3#NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#WAD_CREATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'T2#WAD_CREATE_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'T2#WAD_CREATE_TIME')+"' "+ms.tdEvent(formId, 'T2#WAD_CREATE_TIME')+">")
            arrHtml.push("<span colno='T2#WAD_CREATE_TIME' class='"+ms.uiClass(formId, 'T2#WAD_CREATE_TIME')+"' style='"+ms.uiStyle(formId, 'T2#WAD_CREATE_TIME')+"' "+ms.uiEvent(formId, 'T2#WAD_CREATE_TIME')+" title='"+ms.titleAttr(formId,'T2#WAD_CREATE_TIME','IS_TITLE_ATTR',v)+"' >"+v['T2#WAD_CREATE_TIME']+"</span>")
            arrHtml.push("</td>");
            if(i==0){
		        arrHtml.push("<input type='hidden' id='firstItemId' value='"+v.ID+"' />");
	        }
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
    /*if(isFirstSetScroll == 0){setScroll();}
    isFirstSetScroll++;*/
    setPopScroll('.scroll2','.head2');
    $(".head2").scrollLeft(0);
    showItemDetail($("#firstItemId").val());
}


//单据亮灯
	function docLight(){
	    var isDataAuth = dataAuthentication();
        if(!isDataAuth){return false;};
        var selCount = getNewSelectedCount();
        if(selCount==1){
          var formId = $("#formId1").val();
          var nowId = _selectedEditTr.attr("id");
          var docNum = $("#WAI_DOC_NUM_"+nowId).val();
         
          var createUserId = $.trim($("#state_"+nowId).val());
          if(createUserId=='关结'){
               utilsFp.confirmIcon(3,"","","", "<dict:lang value="单据已关结"/>",0,"260","");
               return false;
          }else{
               	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?FUNC_CODE=F12191&funcMId=05e9683ec94449e68b3c049141912995&docNum="+docNum,
			    data: "",
			    success: function(data){
			                console.log("data.ajaxMap.returnMsg:"+data.ajaxMap.returnMsg);
						    if(null == data){return;}
						    if(null != data){
    							if(data.ajaxMap.returnMsg=="addSucc"){
    								msgPop(data.ajaxMap.alertMsg,"",data.ajaxMap.title,data.ajaxMap.width.ajaxMap,data.height,data.ajaxMap.time,"");
    								query("formId1");
    							}
    							if(data.ajaxMap.returnMsg=="addSucc1"){
    								msgPop(data.ajaxMap.alertMsg,"",data.ajaxMap.title,data.ajaxMap.width.ajaxMap,data.height,data.ajaxMap.time,"");
    								var urlDetail = "${path}buss/bussModel.ms?exeid=51a6d06bcd704474aadfc4886e93e5cb&dataId=&formId=bb156a44e6e242a885b3fde9386fd567&docNum="+docNum;
     	
	                                showPopWinFp(urlDetail , 600, 400,null,"<dict:lang value="缺料信息"/>","add_planDetail");
	                                query("formId1");
    								return;
    							}
    							if(data.ajaxMap.returnMsg=="addError"){
    								/*var urlDetail = "${path}buss/bussModel.ms?exeid=51a6d06bcd704474aadfc4886e93e5cb&dataId=&formId=bb156a44e6e242a885b3fde9386fd567&docNum="+docNum;
     	
	                                showPopWinFp(urlDetail , 600, 400,null,"<dict:lang value="缺料信息"/>","add_planDetail");
	                                query("formId1");*/
	                                utilsFp.confirmIcon(3,"","","", "<dict:lang value="亮灯失败"/>",0,"300","");
    								return;
    							}
    							if(data.ajaxMap.returnMsg=="addErro3"){
    								/*var urlDetail = "${path}buss/bussModel.ms?exeid=51a6d06bcd704474aadfc4886e93e5cb&dataId=&formId=bb156a44e6e242a885b3fde9386fd567&docNum="+docNum;
     	
	                                showPopWinFp(urlDetail , 600, 400,null,"<dict:lang value="缺料信息"/>","add_planDetail");
	                                query("formId1");*/
	                                utilsFp.confirmIcon(3,"","","", "<dict:lang value="仓库无可亮物料"/>",0,"300","");
    								return;
    							}
    							if(data.ajaxMap.returnMsg=="addErro4"){
    								/*var urlDetail = "${path}buss/bussModel.ms?exeid=51a6d06bcd704474aadfc4886e93e5cb&dataId=&formId=bb156a44e6e242a885b3fde9386fd567&docNum="+docNum;
     	
	                                showPopWinFp(urlDetail , 600, 400,null,"<dict:lang value="缺料信息"/>","add_planDetail");
	                                query("formId1");*/
	                                utilsFp.confirmIcon(3,"","","", "<dict:lang value="没有权限对该单据号亮灯"/>",0,"300","");
    								return;
    							}
    							if(data.ajaxMap.returnMsg=="addError2"){
    								utilsFp.confirmIcon(3,"","","", data.ajaxMap.res,0,"300","");
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
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//物料信息
function itemJump1(obj){
      winOptMethod.jump("15e211df6f9d435088ad89c31837ef5f","F3428","jumpId",obj);
}  


//物料追溯
function itemJump2(obj){
    winOptMethod.jump("0b0276d9a6e3422592e30a48ad93b418","F10790","jumpId",obj);
} 

//库存查询
function itemJump3(obj){
    winOptMethod.jump("9b3fc18c9332439ab757650666f022af","F6868","jumpId",obj);
} 

//库存查询
function itemJump4(obj){
  winOptMethod.jump("9b3fc18c9332439ab757650666f022af","F6868","jumpId",obj);
} 


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
