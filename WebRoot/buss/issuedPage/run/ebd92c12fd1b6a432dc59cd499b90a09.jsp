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
		<dict:lang value="VM-盘点管理" />
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
		<bu:header formId ="831b2dbf0dfb494695b7ce66538a8536"/>

    
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
			listAjaxTable("831b2dbf0dfb494695b7ce66538a8536");
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
		<bu:func viewId="d9d426c5b4604ce1a973aee0337d781a" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="d9d426c5b4604ce1a973aee0337d781a" />
		            
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage831b2dbf0dfb494695b7ce66538a8536" id="formPage831b2dbf0dfb494695b7ce66538a8536" value="${formPage831b2dbf0dfb494695b7ce66538a8536}"/>
		<input type="hidden" name="formId" id="formId1" value='831b2dbf0dfb494695b7ce66538a8536'/>
		<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
		<input type="hidden" name="formId" id="formId3" value='831b2dbf0dfb494695b7ce66538a5678'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" id="itemId" name="itemId" value=''/>
		<div class="js-tab">
					<DIV id="container" style="box-sizing: border-box;">
						<DIV class="hd">
							<UL class="tab-list tab" style="padding-left:12px;">
								
								<LI id="tag1"><A class=""
									onclick="switchTag('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="盘点明细" /></SPAN> </A>
								</LI>
								<LI id="tag2"><A class=""
									onclick="switchTag('tag2','content2','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="盘点总明细" /></SPAN> </A>
								</LI>
								

							</UL>
						</DIV>
			<DIV class="content1" id="content" style="margin-top: 15px;">
			<DIV id="content1"  data-tab="tag1">
		<div class="panel-ajax1 datagrid datagrid-div1"  id="831b2dbf0dfb494695b7ce66538a8536">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax831b2dbf0dfb494695b7ce66538a8536" style="overflow-x:hidden;">
		<div class="datagrid-header">
		<div class="datagrid-header-inner head2" id="datagrid-header-inner831b2dbf0dfb494695b7ce66538a8536">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable831b2dbf0dfb494695b7ce66538a8536" style="min-width:1540px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="831b2dbf0dfb494695b7ce66538a8536" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_831b2dbf0dfb494695b7ce66538a8536" onclick="_selectAjaxTableAllData(this,'831b2dbf0dfb494695b7ce66538a8536')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="831b2dbf0dfb494695b7ce66538a8536" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WII_DOC_NUM" formId="831b2dbf0dfb494695b7ce66538a8536" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WII_ITEM_CODE" formId="831b2dbf0dfb494695b7ce66538a8536" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="T2#WID_ERP_FLAG" formId="831b2dbf0dfb494695b7ce66538a8536" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="T4#WDI_LIGHT_FLAG" formId="831b2dbf0dfb494695b7ce66538a8536" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="T2#WID_STATUS" formId="831b2dbf0dfb494695b7ce66538a8536" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WII_STOCK_NUM" formId="831b2dbf0dfb494695b7ce66538a8536" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WII_INVENTORY_NUM" formId="831b2dbf0dfb494695b7ce66538a8536" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WII_PROFIT_NUM" formId="831b2dbf0dfb494695b7ce66538a8536" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WII_ITEM_NAME" formId="831b2dbf0dfb494695b7ce66538a8536" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WII_ITEM_SPEC" formId="831b2dbf0dfb494695b7ce66538a8536" /></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="T2#WID_INVENTORY_DATE" formId="831b2dbf0dfb494695b7ce66538a8536" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="T3#NAME" formId="831b2dbf0dfb494695b7ce66538a8536" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="T2#WID_CREATE_TIME" formId="831b2dbf0dfb494695b7ce66538a8536" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax scroll2" id="tableDiv831b2dbf0dfb494695b7ce66538a8536" onscroll="ajaxTableScroll(this,'831b2dbf0dfb494695b7ce66538a8536')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a8536" style="min-width:1540px;">
		<tbody id="tbody_831b2dbf0dfb494695b7ce66538a8536" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage831b2dbf0dfb494695b7ce66538a8536==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=831b2dbf0dfb494695b7ce66538a8536&showLoading=0" />
			</div>
		</c:if>
		<!---->
			
				<div class="panel-ajax1 datagrid datagrid-div1" style="margin-top:10px;"><!--143-->
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
							<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head1"  id="">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"><input type="checkbox" id="allSelect" name="allSelect" onchange="getAllItem();"/></td >
						
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="盘点单号" /></td >
										<td class="datagrid-cell" style="width:250px;" ><dict:lang value="物料SN" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料料号" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="物料状态" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="库存数量" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="盘点数量" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="盈亏数量" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="仓库" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="库区" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="库位" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="供应商" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="客户" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料名称" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料规格" /></td >
							
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
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="addItemDetail" >
								</tbody>
							</table>
						</div>
						
					</div>
				</div>
						<div style="background-color: white;" id="pageDiv">
                                 			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchSecondItem&formId=formId2&showLoading=0" />
                                 		</div>		 
			<!--</div>-->
		</DIV>
			<DIV id="content2" style="display:none" data-tab="tag2">
				<div class="panel1 datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border:0;">
						<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head"  id="" >
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a5678">
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"><input type="checkbox" id="allSelect1" name="allSelect" onchange="getAllItem1();"/></td >
						                <td class="datagrid-cell" style="width:200px;" ><dict:lang value="组织机构" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="盘点单号" /></td >
										<td class="datagrid-cell" style="width:250px;" ><dict:lang value="物料SN" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料料号" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="物料状态" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="库存数量" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="盘点数量" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="盈亏数量" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="仓库" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="库区" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="库位" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="供应商" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="客户" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料名称" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料规格" /></td >
							
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
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678" >
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
		<bu:submit viewId="d9d426c5b4604ce1a973aee0337d781a" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="d9d426c5b4604ce1a973aee0337d781a" />

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
                    $("#WII_WH_CODE").val("");
                    $("#WII_WH_CODE").trigger("chosen:updated");
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
                    //initTableWidth();
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
var getItemDetailUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=b39fe74cde7d4222b7dbbd641af7cd74";
function showItemDetail(itemId){  
	$("#itemId").val(itemId);
	var dataAuth=$("#DATA_AUTH_"+itemId).val();
	var docStatus = $("#state_"+itemId).val();
	util.showLoading("处理中...");
	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: getItemDetailUrl,
			    data: {
			        "itemId" : itemId,
			        "docStatus" : docStatus,
			        "dataAuth":dataAuth
			    },
				success: function(data){
						util.closeLoading();
						$("#addItemDetail").empty();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							var tempType;
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].CI_ITEM_SPEC==null)  rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].CI_ITEM_NAME==null)  rccList[i].CI_ITEM_NAME="";
								if(rccList[i].WH_NAME==null)  rccList[i].WH_NAME="";
								if(rccList[i].NAME==null)  rccList[i].NAME="";
								if(rccList[i].DISTRICT_NAME==null)  rccList[i].DISTRICT_NAME="";
								if(rccList[i].STORAGE_NAME==null)  rccList[i].STORAGE_NAME="";
								if(rccList[i].SUPPLIER_NAME==null)  rccList[i].SUPPLIER_NAME="";
								if(rccList[i].CUSTOMER==null)  rccList[i].CUSTOMER="";
								if(rccList[i].INVENTORY_TIME==null)  rccList[i].INVENTORY_TIME="";
								if(rccList[i].WID_UPLOAD_FLAG==null)  rccList[i].WID_UPLOAD_FLAG="";
								if(rccList[i].WID_UPLOAD_TIME==null)  rccList[i].WID_UPLOAD_TIME="";
								if(rccList[i].WID_ITEM_STATUS==null) tempType="";
							  	if(rccList[i].WID_ITEM_STATUS==1) {tempType="<span class='state' style='background-color:#aeaeae;color:#FFFFFF;width:50px'>待盘点</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==2) {tempType="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:50px'>已盘点</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==3) {tempType="<span class='state' style='background-color:#4350f2;color:#FFFFFF;width:50px'>盘0</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==4) {tempType="<span class='state' style='background-color:#00a0e9;color:#FFFFFF;width:50px'>已审核</span>";}
							  	
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;' title='"+rccList[i].WID_DOC_NUM+"'>"+rccList[i].WID_DOC_NUM+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:250px;text-align: center;' title='"+rccList[i].WID_ITEM_SN+"'>"+rccList[i].WID_ITEM_SN+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: center;' title='"+rccList[i].WID_ITEM_CODE+"'>"+rccList[i].WID_ITEM_CODE+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:70px;text-align: center;'>"+tempType+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:90px;text-align: right;' title='"+rccList[i].WID_STOCK_NUM+"'>"+rccList[i].WID_STOCK_NUM+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:90px;text-align: right;' title='"+rccList[i].WID_INVENTORY_NUM+"'>"+rccList[i].WID_INVENTORY_NUM+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:90px;text-align: right;' title='"+rccList[i].WID_PROFIT_NUM+"'>"+rccList[i].WID_PROFIT_NUM+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:110px;' title='"+rccList[i].WH_NAME+"'>"+rccList[i].WH_NAME+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:110px;' title='"+rccList[i].DISTRICT_NAME+"'>"+rccList[i].DISTRICT_NAME+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:110px;' title='"+rccList[i].STORAGE_NAME+"'>"+rccList[i].STORAGE_NAME+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:150px;' title='"+rccList[i].SUPPLIER_NAME+"'>"+rccList[i].SUPPLIER_NAME+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:150px;' title='"+rccList[i].CUSTOMER+"'>"+rccList[i].CUSTOMER+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='width:150px;' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-16' style='width:150px;' title='"+rccList[i].CI_ITEM_SPEC+"'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								
								
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-17' style='width:90px;text-align: center;' title='"+rccList[i].NAME+"'>"+rccList[i].NAME+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-18' style='width:130px;' title='"+rccList[i].INVENTORY_TIME+"'>"+rccList[i].INVENTORY_TIME+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-19' style='width:70px;'>"+rccList[i].WID_UPLOAD_FLAG+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-20' style='width:200px;' title='"+rccList[i].WID_UPLOAD_TIME+"'>"+rccList[i].WID_UPLOAD_TIME+"</td>");
							}
						}
						pageFun(data.ajaxPage,"formId2");
							var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
							_tongLineColor(tableTrJs);
							defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
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
    	var dataAuth=$("#DATA_AUTH_"+itemId).val();
    	var docStatus = $("#state_"+itemId).val();
    	util.showLoading("处理中...");
    	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: url,
			    data: {
			      "paraMap.docStatus" : docStatus,
			      "paraMap.itemId" : itemId,
			      "paraMap.dataAuth":dataAuth,
			      "page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			      "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
			    },
			    //data: "paraMap.docStatus="+docStatus+"&paraMap.itemId="+itemId+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				success: function(data){
				                 
						util.closeLoading();
						$("#addItemDetail").empty();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							var tempType;
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].CI_ITEM_SPEC==null)  rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].CI_ITEM_NAME==null)  rccList[i].CI_ITEM_NAME="";
								if(rccList[i].WH_NAME==null)  rccList[i].WH_NAME="";
								if(rccList[i].NAME==null)  rccList[i].NAME="";
								if(rccList[i].DISTRICT_NAME==null)  rccList[i].DISTRICT_NAME="";
								if(rccList[i].STORAGE_NAME==null)  rccList[i].STORAGE_NAME="";
								if(rccList[i].SUPPLIER_NAME==null)  rccList[i].SUPPLIER_NAME="";
								if(rccList[i].CUSTOMER==null)  rccList[i].CUSTOMER="";
								if(rccList[i].INVENTORY_TIME==null)  rccList[i].INVENTORY_TIME="";
								if(rccList[i].WID_UPLOAD_FLAG==null)  rccList[i].WID_UPLOAD_FLAG="";
								if(rccList[i].WID_UPLOAD_TIME==null)  rccList[i].WID_UPLOAD_TIME="";
								if(rccList[i].WID_ITEM_STATUS==null) tempType="";
							  	if(rccList[i].WID_ITEM_STATUS==1) {tempType="<span class='state' style='background-color:#aeaeae;color:#FFFFFF;width:60px'>待盘点</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==2) {tempType="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:60px'>已盘点</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==3) {tempType="<span class='state' style='background-color:#4350f2;color:#FFFFFF;width:60px'>盘0</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==4) {tempType="<span class='state' style='background-color:#00a0e9;color:#FFFFFF;width:60px'>已审核</span>";}
							  	
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='tr1_"+((currentPage-1)*pageRecord+(i+1))+"' ></tr>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;' title='"+rccList[i].WID_DOC_NUM+"'>"+rccList[i].WID_DOC_NUM+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:250px;text-align: center;' title='"+rccList[i].WID_ITEM_SN+"'>"+rccList[i].WID_ITEM_SN+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: center;' title='"+rccList[i].WID_ITEM_CODE+"'>"+rccList[i].WID_ITEM_CODE+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:70px;text-align: center;'>"+tempType+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:90px;text-align: right;' title='"+rccList[i].WID_STOCK_NUM+"'>"+rccList[i].WID_STOCK_NUM+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:90px;text-align: right;' title='"+rccList[i].WID_INVENTORY_NUM+"'>"+rccList[i].WID_INVENTORY_NUM+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:90px;text-align: right;' title='"+rccList[i].WID_PROFIT_NUM+"'>"+rccList[i].WID_PROFIT_NUM+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:110px;' title='"+rccList[i].WH_NAME+"'>"+rccList[i].WH_NAME+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:110px;' title='"+rccList[i].DISTRICT_NAME+"'>"+rccList[i].DISTRICT_NAME+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:110px;' title='"+rccList[i].STORAGE_NAME+"'>"+rccList[i].STORAGE_NAME+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:150px;' title='"+rccList[i].SUPPLIER_NAME+"'>"+rccList[i].SUPPLIER_NAME+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:150px;' title='"+rccList[i].CUSTOMER+"'>"+rccList[i].CUSTOMER+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='width:150px;' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-16' style='width:150px;' title='"+rccList[i].CI_ITEM_SPEC+"'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								
								
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-17' style='width:90px;text-align: center;' title='"+rccList[i].NAME+"'>"+rccList[i].NAME+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-18' style='width:130px;' title='"+rccList[i].INVENTORY_TIME+"'>"+rccList[i].INVENTORY_TIME+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-19' style='width:70px;'>"+rccList[i].WID_UPLOAD_FLAG+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-20' style='width:200px;' title='"+rccList[i].WID_UPLOAD_TIME+"'>"+rccList[i].WID_UPLOAD_TIME+"</td>");
							}
						}
						pageFun(data.ajaxPage,"formId2");
							var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
							_tongLineColor(tableTrJs);
							//clickTr('itemDetail');
							defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
						
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
	var itemCode = $.trim($("#WII_ITEM_CODE_SHOW").val());
	var docNum = $.trim($("#WII_DOC_NUM").val());
	var status = $(document.getElementById('T2#WID_STATUS')).val();
	
	util.showLoading("处理中...");
	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: getItemDetailUrl,
			    data: {
			        "itemCode" : itemCode,
			        "dataAuth" : dataAuth,
			        "docNum" : docNum,
			        "status" : status,
			    },
				success: function(data){
						util.closeLoading();
						$("#addSecondItemDetail").empty();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							var tempType;
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].CI_ITEM_SPEC==null)  rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].CI_ITEM_NAME==null)  rccList[i].CI_ITEM_NAME="";
								if(rccList[i].WH_NAME==null)  rccList[i].WH_NAME="";
								if(rccList[i].NAME==null)  rccList[i].NAME="";
								if(rccList[i].DISTRICT_NAME==null)  rccList[i].DISTRICT_NAME="";
								if(rccList[i].STORAGE_NAME==null)  rccList[i].STORAGE_NAME="";
								if(rccList[i].SUPPLIER_NAME==null)  rccList[i].SUPPLIER_NAME="";
								if(rccList[i].CUSTOMER==null)  rccList[i].CUSTOMER="";
								if(rccList[i].INVENTORY_TIME==null)  rccList[i].INVENTORY_TIME="";
								if(rccList[i].WID_UPLOAD_FLAG==null)  rccList[i].WID_UPLOAD_FLAG="";
								if(rccList[i].WID_UPLOAD_TIME==null)  rccList[i].WID_UPLOAD_TIME="";
								if(rccList[i].WID_ITEM_STATUS==null) tempType="";
								if(rccList[i].DATANAME==null) rccList[i].DATANAME="";
							  	if(rccList[i].WID_ITEM_STATUS==1) {tempType="<span class='state' style='background-color:#aeaeae;color:#FFFFFF;width:60px'>待盘点</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==2) {tempType="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:60px'>已盘点</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==3) {tempType="<span class='state' style='background-color:#00a0e9;color:#FFFFFF;width:60px'>盘0</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==4) {tempType="<span class='state' style='background-color:#fdab36;color:#FFFFFF;width:60px'>已审核</span>";}
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-3 TD_DATA_AUTH' style='width:200px;text-align: center;' title='"+rccList[i].DATANAME+"'>"+rccList[i].DATANAME+"<input type='hidden' id='DATA_AUTH_ID' value='"+rccList[i].DATANAME+"' /></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;' title='"+rccList[i].WID_DOC_NUM+"'>"+rccList[i].WID_DOC_NUM+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:250px;text-align: center;' title='"+rccList[i].WID_ITEM_SN+"'>"+rccList[i].WID_ITEM_SN+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: center;' title='"+rccList[i].WID_ITEM_CODE+"'>"+rccList[i].WID_ITEM_CODE+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:70px;text-align: center;'>"+tempType+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:90px;text-align: right;' title='"+rccList[i].WID_STOCK_NUM+"'>"+rccList[i].WID_STOCK_NUM+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:90px;text-align: right;' title='"+rccList[i].WID_INVENTORY_NUM+"'>"+rccList[i].WID_INVENTORY_NUM+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:90px;text-align: right;' title='"+rccList[i].WID_PROFIT_NUM+"'>"+rccList[i].WID_PROFIT_NUM+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:110px;' title='"+rccList[i].WH_NAME+"'>"+rccList[i].WH_NAME+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:110px;' title='"+rccList[i].DISTRICT_NAME+"'>"+rccList[i].DISTRICT_NAME+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:110px;' title='"+rccList[i].STORAGE_NAME+"'>"+rccList[i].STORAGE_NAME+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:150px;' title='"+rccList[i].SUPPLIER_NAME+"'>"+rccList[i].SUPPLIER_NAME+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:150px;' title='"+rccList[i].CUSTOMER+"'>"+rccList[i].CUSTOMER+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='width:150px;' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-16' style='width:150px;' title='"+rccList[i].CI_ITEM_SPEC+"'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								
								
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-17' style='width:90px;text-align: center;' title='"+rccList[i].NAME+"'>"+rccList[i].NAME+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-18' style='width:130px;' title='"+rccList[i].INVENTORY_TIME+"'>"+rccList[i].INVENTORY_TIME+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-19' style='width:70px;'>"+rccList[i].WID_UPLOAD_FLAG+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-20' style='width:200px;' title='"+rccList[i].WID_UPLOAD_TIME+"'>"+rccList[i].WID_UPLOAD_TIME+"</td>");
							}
						}
						pageFun(data.ajaxPage,"formId3");
							var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tbody tr");
							_tongLineColor(tableTrJs);
							defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a5678");
							//clickTr('itemDetail');
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//详细信息分页  buss/bussModel_exeFunc.ms?FUNC_CODE=F6961&funcMId=1de1eb121f36484598f744f0d2413150
var paginationImpl = {};
function searchSecondItem(paginationImpl){
	var isFirstLoad = firstLoadThisPage(paginationImpl);
    	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
    	var dataAuth = $("#DATA_AUTH").val();
	var itemCode = $.trim($("#WII_ITEM_CODE_SHOW").val());
	var docNum = $.trim($("#WII_DOC_NUM").val());
	var status = $(document.getElementById('T2#WID_STATUS')).val();
    	util.showLoading("处理中...");
    	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=1de1eb121f36484598f744f0d2413150",
			    data: {
			        "paraMap.type" : 1,
			        "paraMap.itemCode" : itemCode,
			        "paraMap.dataAuth" : dataAuth,
			        "paraMap.docNum" : docNum,
			        "paraMap.status" : status,
			        "page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			        "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
			    },
			    //data: "paraMap.type=1&paraMap.itemCode="+itemCode+"&paraMap.dataAuth="+dataAuth+"&paraMap.docNum="+docNum+"&paraMap.status="+status+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				success: function(data){
				                 
						util.closeLoading();
						$("#addSecondItemDetail").empty();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							var tempType;
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].CI_ITEM_SPEC==null)  rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].CI_ITEM_NAME==null)  rccList[i].CI_ITEM_NAME="";
								if(rccList[i].WH_NAME==null)  rccList[i].WH_NAME="";
								if(rccList[i].NAME==null)  rccList[i].NAME="";
								if(rccList[i].DISTRICT_NAME==null)  rccList[i].DISTRICT_NAME="";
								if(rccList[i].STORAGE_NAME==null)  rccList[i].STORAGE_NAME="";
								if(rccList[i].SUPPLIER_NAME==null)  rccList[i].SUPPLIER_NAME="";
								if(rccList[i].CUSTOMER==null)  rccList[i].CUSTOMER="";
								if(rccList[i].INVENTORY_TIME==null)  rccList[i].INVENTORY_TIME="";
								if(rccList[i].WID_UPLOAD_FLAG==null)  rccList[i].WID_UPLOAD_FLAG="";
								if(rccList[i].WID_UPLOAD_TIME==null)  rccList[i].WID_UPLOAD_TIME="";
								if(rccList[i].WID_ITEM_STATUS==null) tempType="";
							  	if(rccList[i].WID_ITEM_STATUS==1) {tempType="<span class='state' style='background-color:#aeaeae;color:#FFFFFF;width:50px'>待盘点</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==2) {tempType="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:50px'>已盘点</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==3) {tempType="<span class='state' style='background-color:#00a0e9;color:#FFFFFF;width:50px'>盘0</span>";}
							  	if(rccList[i].WID_ITEM_STATUS==4) {tempType="<span class='state' style='background-color:#fdab36;color:#FFFFFF;width:50px'>已审核</span>";}
							  	
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tbody:last").append("<tr id='tr1_"+((currentPage-1)*pageRecord+(i+1))+"' ></tr>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-3 TD_DATA_AUTH' style='width:200px;text-align: center;' title='"+rccList[i].DATANAME+"'>"+rccList[i].DATANAME+"<input type='hidden' id='DATA_AUTH_ID' value='"+rccList[i].DATANAME+"' /></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;' title='"+rccList[i].WID_DOC_NUM+"'>"+rccList[i].WID_DOC_NUM+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:250px;text-align: center;' title='"+rccList[i].WID_ITEM_SN+"'>"+rccList[i].WID_ITEM_SN+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: center;' title='"+rccList[i].WID_ITEM_CODE+"'>"+rccList[i].WID_ITEM_CODE+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:70px;text-align: center;'>"+tempType+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:90px;text-align: right;' title='"+rccList[i].WID_STOCK_NUM+"'>"+rccList[i].WID_STOCK_NUM+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:90px;text-align: right;' title='"+rccList[i].WID_INVENTORY_NUM+"'>"+rccList[i].WID_INVENTORY_NUM+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:90px;text-align: right;' title='"+rccList[i].WID_PROFIT_NUM+"'>"+rccList[i].WID_PROFIT_NUM+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:110px;' title='"+rccList[i].WH_NAME+"'>"+rccList[i].WH_NAME+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:110px;' title='"+rccList[i].DISTRICT_NAME+"'>"+rccList[i].DISTRICT_NAME+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:110px;' title='"+rccList[i].STORAGE_NAME+"'>"+rccList[i].STORAGE_NAME+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:150px;' title='"+rccList[i].SUPPLIER_NAME+"'>"+rccList[i].SUPPLIER_NAME+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:150px;' title='"+rccList[i].CUSTOMER+"'>"+rccList[i].CUSTOMER+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='width:150px;' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-16' style='width:150px;' title='"+rccList[i].CI_ITEM_SPEC+"'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								
								
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-17' style='width:90px;text-align: center;' title='"+rccList[i].NAME+"'>"+rccList[i].NAME+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-18' style='width:130px;' title='"+rccList[i].INVENTORY_TIME+"'>"+rccList[i].INVENTORY_TIME+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-19' style='width:70px;'>"+rccList[i].WID_UPLOAD_FLAG+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td class='datagrid-cell datagrid-cell-20' style='width:200px;' title='"+rccList[i].WID_UPLOAD_TIME+"'>"+rccList[i].WID_UPLOAD_TIME+"</td>");
							}
						}
						pageFun(data.ajaxPage,"formId3");
							var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tbody tr");
							_tongLineColor(tableTrJs);
							//clickTr('itemDetail');
							defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a5678");
						
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
    if(formId=='831b2dbf0dfb494695b7ce66538a8536'){<%--FM-盘点单物料信息--%>
        $('.scroll2').mCustomScrollbar("destroy");
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' onclick=\"showItemDetail('"+v.ID+"');\" abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_"+v.ID+"' value='"+uiRaw[i].DATA_AUTH+"' /></td>");
            arrHtml.push("<td colno='WII_DOC_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WII_DOC_NUM')+"' style='width:150px;"+ms.tdStyle(formId, 'WII_DOC_NUM')+"' "+ms.tdEvent(formId, 'WII_DOC_NUM')+">")
            arrHtml.push("<span colno='WII_DOC_NUM' class='"+ms.uiClass(formId, 'WII_DOC_NUM')+"' style='"+ms.uiStyle(formId, 'WII_DOC_NUM')+"' "+ms.uiEvent(formId, 'WII_DOC_NUM')+" title='"+ms.titleAttr(formId,'WII_DOC_NUM','IS_TITLE_ATTR',v)+"' >"+v['WII_DOC_NUM']+"</span>")
            arrHtml.push("<input type='hidden' id='WII_DOC_NUM"+v.ID+"' value='"+v['WII_DOC_NUM']+"' /></td>");
            arrHtml.push("<td colno='WII_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WII_ITEM_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'WII_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WII_ITEM_CODE')+">")
            arrHtml.push("<span colno='WII_ITEM_CODE' class='"+ms.uiClass(formId, 'WII_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'WII_ITEM_CODE')+"' "+ms.uiEvent(formId, 'WII_ITEM_CODE')+" title='"+ms.titleAttr(formId,'WII_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['WII_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#WID_ERP_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'T2#WID_ERP_FLAG')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'T2#WID_ERP_FLAG')+"' "+ms.tdEvent(formId, 'T2#WID_ERP_FLAG')+">")
            arrHtml.push("<span colno='T2#WID_ERP_FLAG' class='"+ms.uiClass(formId, 'T2#WID_ERP_FLAG')+"' style='"+ms.uiStyle(formId, 'T2#WID_ERP_FLAG')+"' "+ms.uiEvent(formId, 'T2#WID_ERP_FLAG')+" title='"+ms.titleAttr(formId,'T2#WID_ERP_FLAG','IS_TITLE_ATTR',v)+"' >"+v['T2#WID_ERP_FLAG']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID' value='"+v['DATA_AUTH_ID']+"' /></td>");
            arrHtml.push("<td colno='T4#WDI_LIGHT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'T4#WDI_LIGHT_FLAG')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'T4#WDI_LIGHT_FLAG')+"' "+ms.tdEvent(formId, 'T4#WDI_LIGHT_FLAG')+">")
            arrHtml.push("<span colno='T4#WDI_LIGHT_FLAG' class='"+ms.uiClass(formId, 'T4#WDI_LIGHT_FLAG')+"' style='"+ms.uiStyle(formId, 'T4#WDI_LIGHT_FLAG')+"' "+ms.uiEvent(formId, 'T4#WDI_LIGHT_FLAG')+" title='"+ms.titleAttr(formId,'T4#WDI_LIGHT_FLAG','IS_TITLE_ATTR',v)+"' >"+v['T4#WDI_LIGHT_FLAG']+"</span>")
            arrHtml.push("</td>");
            
            arrHtml.push("<td colno='T2#WID_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'T2#WID_STATUS')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'T2#WID_STATUS')+"' "+ms.tdEvent(formId, 'T2#WID_STATUS')+">")
            arrHtml.push("<span colno='T2#WID_STATUS' class='"+ms.uiClass(formId, 'T2#WID_STATUS')+"' style='"+ms.uiStyle(formId, 'T2#WID_STATUS')+"' "+ms.uiEvent(formId, 'T2#WID_STATUS')+" title='"+ms.titleAttr(formId,'T2#WID_STATUS','IS_TITLE_ATTR',v)+"' >"+v['T2#WID_STATUS']+"</span>")
            arrHtml.push("<input type='hidden' id='state_"+v.ID+"' value='"+v['WID_STATUS']+"'></td>");
            arrHtml.push("<td colno='WII_STOCK_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WII_STOCK_NUM')+"' style='width:90px;text-align:right;"+ms.tdStyle(formId, 'WII_STOCK_NUM')+"' "+ms.tdEvent(formId, 'WII_STOCK_NUM')+">")
            arrHtml.push("<span colno='WII_STOCK_NUM' class='"+ms.uiClass(formId, 'WII_STOCK_NUM')+"' style='"+ms.uiStyle(formId, 'WII_STOCK_NUM')+"' "+ms.uiEvent(formId, 'WII_STOCK_NUM')+" title='"+ms.titleAttr(formId,'WII_STOCK_NUM','IS_TITLE_ATTR',v)+"' >"+v['WII_STOCK_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WII_INVENTORY_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WII_INVENTORY_NUM')+"' style='width:90px;text-align:right;"+ms.tdStyle(formId, 'WII_INVENTORY_NUM')+"' "+ms.tdEvent(formId, 'WII_INVENTORY_NUM')+">")
            arrHtml.push("<span colno='WII_INVENTORY_NUM' class='"+ms.uiClass(formId, 'WII_INVENTORY_NUM')+"' style='"+ms.uiStyle(formId, 'WII_INVENTORY_NUM')+"' "+ms.uiEvent(formId, 'WII_INVENTORY_NUM')+" title='"+ms.titleAttr(formId,'WII_INVENTORY_NUM','IS_TITLE_ATTR',v)+"' >"+v['WII_INVENTORY_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WII_PROFIT_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WII_PROFIT_NUM')+"' style='width:90px;text-align:right;"+ms.tdStyle(formId, 'WII_PROFIT_NUM')+"' "+ms.tdEvent(formId, 'WII_PROFIT_NUM')+">")
            arrHtml.push("<span colno='WII_PROFIT_NUM' class='"+ms.uiClass(formId, 'WII_PROFIT_NUM')+"' style='"+ms.uiStyle(formId, 'WII_PROFIT_NUM')+"' "+ms.uiEvent(formId, 'WII_PROFIT_NUM')+" title='"+ms.titleAttr(formId,'WII_PROFIT_NUM','IS_TITLE_ATTR',v)+"' >"+v['WII_PROFIT_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WII_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WII_ITEM_NAME')+"' style='width:150px;"+ms.tdStyle(formId, 'WII_ITEM_NAME')+"' "+ms.tdEvent(formId, 'WII_ITEM_NAME')+">")
            arrHtml.push("<span colno='WII_ITEM_NAME' class='"+ms.uiClass(formId, 'WII_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'WII_ITEM_NAME')+"' "+ms.uiEvent(formId, 'WII_ITEM_NAME')+" title='"+ms.titleAttr(formId,'WII_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['WII_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WII_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'WII_ITEM_SPEC')+"' style='width:150px;"+ms.tdStyle(formId, 'WII_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'WII_ITEM_SPEC')+">")
            arrHtml.push("<span colno='WII_ITEM_SPEC' class='"+ms.uiClass(formId, 'WII_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'WII_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'WII_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'WII_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['WII_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#WID_INVENTORY_DATE' class='datagrid-cell "+ms.tdClass(formId, 'T2#WID_INVENTORY_DATE')+"' style='width:130px;text-align:center;"+ms.tdStyle(formId, 'T2#WID_INVENTORY_DATE')+"' "+ms.tdEvent(formId, 'T2#WID_INVENTORY_DATE')+">")
            arrHtml.push("<span colno='T2#WID_INVENTORY_DATE' class='"+ms.uiClass(formId, 'T2#WID_INVENTORY_DATE')+"' style='"+ms.uiStyle(formId, 'T2#WID_INVENTORY_DATE')+"' "+ms.uiEvent(formId, 'T2#WID_INVENTORY_DATE')+" title='"+ms.titleAttr(formId,'T2#WID_INVENTORY_DATE','IS_TITLE_ATTR',v)+"' >"+v['T2#WID_INVENTORY_DATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T3#NAME' class='datagrid-cell "+ms.tdClass(formId, 'T3#NAME')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'T3#NAME')+"' "+ms.tdEvent(formId, 'T3#NAME')+">")
            arrHtml.push("<span colno='T3#NAME' class='"+ms.uiClass(formId, 'T3#NAME')+"' style='"+ms.uiStyle(formId, 'T3#NAME')+"' "+ms.uiEvent(formId, 'T3#NAME')+" title='"+ms.titleAttr(formId,'T3#NAME','IS_TITLE_ATTR',v)+"' >"+v['T3#NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#WID_CREATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'T2#WID_CREATE_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'T2#WID_CREATE_TIME')+"' "+ms.tdEvent(formId, 'T2#WID_CREATE_TIME')+">")
            arrHtml.push("<span colno='T2#WID_CREATE_TIME' class='"+ms.uiClass(formId, 'T2#WID_CREATE_TIME')+"' style='"+ms.uiStyle(formId, 'T2#WID_CREATE_TIME')+"' "+ms.uiEvent(formId, 'T2#WID_CREATE_TIME')+" title='"+ms.titleAttr(formId,'T2#WID_CREATE_TIME','IS_TITLE_ATTR',v)+"' >"+v['T2#WID_CREATE_TIME']+"</span>")
            arrHtml.push("</td>");
            if(i==0){
		        arrHtml.push("<input type='hidden' id='firstItemId' value='"+v.ID+"' />");
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
    //setScroll();
    setPopScroll('.scroll2','.head2');
    $(".head2").scrollLeft(0);
    showItemDetail($("#firstItemId").val());
}

function initHeight(){
	$('.panel-ajax1').height(($(window).height() - 56 - 78 - 10 - 45  - 10)/2 - 30);
	$('.datagrid-body').css('height','calc(100% - 32px)');
	$('.panel1').height($(window).height() - 56 - 78 - 10 - 45 - 30);
}

$(function(){
	initHeight();
})

$(window).resize(function(){
	initHeight();
})
function searchItemInfo(paginationImpl){
        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=1de1eb121f36484598f744f0d2413150";

	SearchItemInfo(paginationImpl,url);
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
