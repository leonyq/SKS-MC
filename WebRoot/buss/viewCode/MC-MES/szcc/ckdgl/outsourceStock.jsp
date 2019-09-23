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
		<dict:lang value="委外发料管理" />
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
		<bu:header formId ="ba1fc70eef83416c878e187b59b7882f"/>

    
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
			listAjaxTable("ba1fc70eef83416c878e187b59b7882f");//*根据表单模型改
			$("#allSelect").removeAttr("checked");
		}
		if(tag=="tag2"){
			searchItemDetail();
			$("#allSelect1").removeAttr("checked");
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
		<bu:func viewId="2cc16e5ae7c04c14a7f9b654e54b0768" />
            </div>
            <div class="bd" style="height: 130px;">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="2cc16e5ae7c04c14a7f9b654e54b0768" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPageba1fc70eef83416c878e187b59b7882f" id="formPageba1fc70eef83416c878e187b59b7882f" value="${formPageba1fc70eef83416c878e187b59b7882f}"/>
		<input type="hidden" name="formId" id="formId1" value='ba1fc70eef83416c878e187b59b7882f'/>
		<input type="hidden" name="formId" id="formId1" value='ba1fc70eef83416c878e187b59b78802'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" id="itemId" name="itemId" value=''/>
		<div class="js-tab">
			<DIV id="container" style="box-sizing: border-box;">
				<DIV class="hd">
					<UL class="tab-list tab" style="padding-left:12px;">
						
						<LI id="tag1"><A class=""
							onclick="switchTag('tag1','content1','');this.blur();"
							href="javascript:void(0);"> <SPAN><dict:lang value="委外明细" /></SPAN> </A>
						</LI>
						<LI id="tag2"><A class=""
							onclick="switchTag('tag2','content2','');this.blur();"
							href="javascript:void(0);"> <SPAN><dict:lang value="委外总明细" /></SPAN> </A>
						</LI>
						

					</UL>
				</DIV>
			<DIV class="content1" id="content" style="margin-top: 15px;">
				<DIV id="content1" style="margin-top:4px;" data-tab="tag1">
					<!--table1-->
					<div class="panel-ajax datagrid datagrid-div1"  id="ba1fc70eef83416c878e187b59b7882f"  >
					<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxba1fc70eef83416c878e187b59b7882f" style="overflow: hidden;">
					<div class="datagrid-header">
					<div class="datagrid-header-inner head2" id="datagrid-header-innerba1fc70eef83416c878e187b59b7882f">
					<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableba1fc70eef83416c878e187b59b7882f"  style="width:1810px;height: 100%;">
					<s:set name="_$type" value="'view'" />
					<tbody class="isParentsTitle">
					<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
						<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="ba1fc70eef83416c878e187b59b7882f" i18n="1"/></td>
						<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_ba1fc70eef83416c878e187b59b7882f" onclick="_selectAjaxTableAllData(this,'ba1fc70eef83416c878e187b59b7882f')" style="cursor: pointer;"title="全选"/></span></td>
					
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="DATA_AUTH" formId="ba1fc70eef83416c878e187b59b7882f" /></td>		
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WOS_ITEM_CO" formId="ba1fc70eef83416c878e187b59b7882f" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="T3#CI_ITEM_NAME" formId="ba1fc70eef83416c878e187b59b7882f" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="T3#CI_ITEM_SPEC" formId="ba1fc70eef83416c878e187b59b7882f" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WOS_SUP_CO" formId="ba1fc70eef83416c878e187b59b7882f" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="T2#SUPPLIER_NAME" formId="ba1fc70eef83416c878e187b59b7882f" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="T2#SUPPLIER_SHORTNAME" formId="ba1fc70eef83416c878e187b59b7882f" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WOS_ITEM_N" formId="ba1fc70eef83416c878e187b59b7882f" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WOS_ITEM_RN" formId="ba1fc70eef83416c878e187b59b7882f" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WOS_WH_CO" formId="ba1fc70eef83416c878e187b59b7882f" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WOS_DISTRIC" formId="ba1fc70eef83416c878e187b59b7882f" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WOS_STORAF" formId="ba1fc70eef83416c878e187b59b7882f" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="T3#CI_MIN_PACK" formId="ba1fc70eef83416c878e187b59b7882f" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WOS_MEMO" formId="ba1fc70eef83416c878e187b59b7882f" /></td>
			
					</bu:tr>
					</tbody>
					</bu:table>
					</div>
					</div>
					<div class="datagrid-body datagrid-div3 datagrid-body-ajax scroll2" id="tableDivba1fc70eef83416c878e187b59b7882f" onscroll="ajaxTableScroll(this,'ba1fc70eef83416c878e187b59b7882f')" style="height: 130px;">
					<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxba1fc70eef83416c878e187b59b7882f" style="width:1810px;">
					<tbody id="tbody_ba1fc70eef83416c878e187b59b7882f" class="isParents">
					</tbody>
					</table>		</div>
					</div>
					</div>
					<c:if test="${formPageba1fc70eef83416c878e187b59b7882f==1}">			<div class="center">
						<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=ba1fc70eef83416c878e187b59b7882f&showLoading=0" />
						</div>
					</c:if>
					<!--table2-->
				
							<div style="background-color: white;" id="pageDiv">
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
								<table  class="datagrid-htable fixedTable  " id="datagrid-htableba1fc70eef83416c878e187b59b78802" >
									<tbody>
									<tr class=" datagrid-header-row thcolor">
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"><input type="checkbox" id="allSelect" name="allSelect" onchange="getAllModels();"/></td >
						                <td class="datagrid-cell"><dict:lang value="组织机构" /></td >
										<td class="datagrid-cell"><dict:lang value="物料料号" /></td >
										<td class="datagrid-cell"><dict:lang value="物料名称" /></td >
										<td class="datagrid-cell"><dict:lang value="物料规格" /></td >
										<td class="datagrid-cell"><dict:lang value="库存数量" /></td >
										<!--<td class="datagrid-cell" style="width:80px;" ><dict:lang value="占用数量" /></td >-->

										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll">
							<table class="datagrid-btable fixedTable " style="table-layout: fixed;" id="datagrid-btable-ajaxba1fc70eef83416c878e187b59b78802">
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
    </div>
		<bu:submit viewId="2cc16e5ae7c04c14a7f9b654e54b0768" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="2cc16e5ae7c04c14a7f9b654e54b0768" />
    
      <!--<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>-->
<script type="text/javascript">
				function listAjaxTable(formId){
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
//                  $(document.getElementById('T2#WOD_DOC_TYPE')).val('DJ27');
                    var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,WOI_DOC_NUM,WOI_STATUS\"}";
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
                
                
                function query(thisObj){//同时查询两处
                    var formId = $("#formId1").val();
                    listAjaxTable(formId);
                    searchItemDetail();
                   //defTableWidthRewrite("ba1fc70eef83416c878e187b59b7882f");
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
                
                
                
                function init(){
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    initTableWidth();
                    //$(document.getElementById('T2#WOD_DOC_TYPE')).val('DJ27');
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
	//物料汇总url
	var getItemDetailUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=efe6dcf2a6a44ccb9e662380fa5d65d4";//7e41af834f244915be1aaf602b51940c";//普通查询
	
	
	
	//根据查询条件获取详细信息
	function searchItemDetail(){
		console.log(1);
		var itemCode = $.trim($("#WOS_ITEM_CO_SHOW").val()); 
		var supCode =$.trim($("#WOS_SUP_CO").val());
		console.log(itemCode);
		util.showLoading("处理中...");
				console.log(1.1);
		$.ajax({
				    type: "POST",
				    dataType: "json",
				    url: getItemDetailUrl+"&paraMap.itemCode="+itemCode+"&paraMap.supCode="+supCode,
				    data: "",
					success: function(data){
							util.closeLoading();
							console.log(1.2);
							$("#addSecondItemDetail").empty();
							if(null != data.ajaxPage.dataList){
								var rccList = eval(data.ajaxPage.dataList);
								$('.scroll').mCustomScrollbar("destroy");
								for(var i = 0;i < rccList.length; i++){
									
									$("#datagrid-btable-ajaxba1fc70eef83416c878e187b59b78802 tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
									$("#datagrid-btable-ajaxba1fc70eef83416c878e187b59b78802 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
									$("#datagrid-btable-ajaxba1fc70eef83416c878e187b59b78802 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
								//	$("#datagrid-btable-ajaxba1fc70eef83416c878e187b59b78802 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='text-align: center;' title='"+rccList[i].DATA_AUTH+"'>"+rccList[i].DATA_AUTH+"</td>");
									$("#datagrid-btable-ajaxba1fc70eef83416c878e187b59b78802 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='text-align: center;width:200px;' title='"+rccList[i].DATA_AUTH+"'>"+rccList[i].DATA_AUTH+"<input type='hidden' id='DATA_AUTH_ID_"+rccList[i].ID+"' value='"+rccList[i].DATA_AUTH2+"' /></td>");
									$("#datagrid-btable-ajaxba1fc70eef83416c878e187b59b78802 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='text-align: left;' title='"+rccList[i].ITEM_CODE+"'>"+rccList[i].ITEM_CODE+"</td>");
									$("#datagrid-btable-ajaxba1fc70eef83416c878e187b59b78802 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='text-align: left;' title='"+nullToEmpty(rccList[i].ITEM_NAME)+"'>"+nullToEmpty(rccList[i].ITEM_NAME)+"</td>");
									$("#datagrid-btable-ajaxba1fc70eef83416c878e187b59b78802 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='text-align: left;' title='"+nullToEmpty(rccList[i].ITEM_SPEC)+"'>"+nullToEmpty(rccList[i].ITEM_SPEC)+"</td>");
									$("#datagrid-btable-ajaxba1fc70eef83416c878e187b59b78802 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='text-align: right;' title='"+nullToZero(rccList[i].WOS_ITEM_N)+"'>"+nullToZero(rccList[i].WOS_ITEM_N)+"</td>");
//									$("#secondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:80px;text-align: left;' title='"+rccList[i].WOS_ITEM_RN+"'>"+rccList[i].WOS_ITEM_RN+"</td>");
								}
							}
							setPopScroll('.scroll','.head');
							pageFun(data.ajaxPage,"formId3");
								var tableTrJs = $("#datagrid-btable-ajaxba1fc70eef83416c878e187b59b78802 tbody tr");
								_tongLineColor(tableTrJs);
								//clickTr('secondItemDetail');
								defTableWidthRewrite("ba1fc70eef83416c878e187b59b78802");
							
						},
					error: function(msg){
						  console.log(msg);
							util.closeLoading();
							utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
					  }
					});
	}
	//详细信息分页  
	var paginationImpl = {};
	function searchSecondItem(paginationImpl){
		console.log(2);
		var isFirstLoad = firstLoadThisPage(paginationImpl);
    	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
		var itemCode =$.trim($("#WOS_ITEM_CO_SHOW").val());
		var supCode =$.trim($("#WOS_SUP_CO").val());
	    	util.showLoading("处理中...");
	    	$.ajax({
				    type: "POST",
				    dataType: "json",
				    url: "buss/bussModel_exeFunc.ms?funcMId=efe6dcf2a6a44ccb9e662380fa5d65d4",
				    data: "paraMap.type=1&paraMap.itemCode="+itemCode+"&paraMap.supCode="+supCode+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
					success: function(data){
					                 
							util.closeLoading();
							$("#addSecondItemDetail").empty();
							if(null != data.ajaxPage.dataList){
								var rccList = eval(data.ajaxPage.dataList);
								for(var i = 0;i < rccList.length; i++){
									
									$("#datagrid-btable-ajaxba1fc70eef83416c878e187b59b78802 tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
									$("#datagrid-btable-ajaxba1fc70eef83416c878e187b59b78802 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage - 1) * pageRecord + (i + 1))+"</td>");
									$("#datagrid-btable-ajaxba1fc70eef83416c878e187b59b78802 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
								//	$("#datagrid-btable-ajaxba1fc70eef83416c878e187b59b78802 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='text-align: center;' title='"+rccList[i].DATA_AUTH+"'>"+rccList[i].DATA_AUTH+"</td>");
								    $("#datagrid-btable-ajaxba1fc70eef83416c878e187b59b78802 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='text-align: center;width:200px;' title='"+rccList[i].DATA_AUTH+"'>"+rccList[i].DATA_AUTH+"<input type='hidden' id='DATA_AUTH_ID_"+rccList[i].ID+"' value='"+rccList[i].DATA_AUTH2+"' /></td>");
									$("#datagrid-btable-ajaxba1fc70eef83416c878e187b59b78802 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='text-align: left;' title='"+rccList[i].ITEM_CODE+"'>"+rccList[i].ITEM_CODE+"</td>");
									$("#datagrid-btable-ajaxba1fc70eef83416c878e187b59b78802 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='text-align: left;' title='"+nullToEmpty(rccList[i].ITEM_NAME)+"'>"+nullToEmpty(rccList[i].ITEM_NAME)+"</td>");
									$("#datagrid-btable-ajaxba1fc70eef83416c878e187b59b78802 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='text-align: left;' title='"+nullToEmpty(rccList[i].ITEM_SPEC)+"'>"+nullToEmpty(rccList[i].ITEM_SPEC)+"</td>");
									$("#datagrid-btable-ajaxba1fc70eef83416c878e187b59b78802 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='text-align: right;' title='"+nullToZero(rccList[i].WOS_ITEM_N)+"'>"+nullToZero(rccList[i].WOS_ITEM_N)+"</td>");
//									$("#secondItemDetail tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:80px;text-align: left;' title='"+rccList[i].WOS_ITEM_RN+"'>"+rccList[i].WOS_ITEM_RN+"</td>");

								}
							}
							pageFun(data.ajaxPage,"formId3");
								var tableTrJs = $("#datagrid-btable-ajaxba1fc70eef83416c878e187b59b78802 tbody tr");
								_tongLineColor(tableTrJs);
								//clickTr('secondItemDetail');
								defTableWidthRewrite("ba1fc70eef83416c878e187b59b78802");
							
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
function showItemDetail(){
	return 1;
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
    if(formId=='ba1fc70eef83416c878e187b59b7882f'){<%--出库单物料信息--%>
        $('.scroll2').mCustomScrollbar("destroy");
        $.each(uiTxt,function(i,v){
            
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")		
	        arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")		
	        arrHtml.push("</td>");
            //arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            //arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
           // arrHtml.push("</td>");
            arrHtml.push("<td colno='WOS_ITEM_CO' class='datagrid-cell "+ms.tdClass(formId, 'WOS_ITEM_CO')+"' style='width:150px;"+ms.tdStyle(formId, 'WOS_ITEM_CO')+"' "+ms.tdEvent(formId, 'WOS_ITEM_CO')+">")
            arrHtml.push("<span colno='WOS_ITEM_CO' class='"+ms.uiClass(formId, 'WOS_ITEM_CO')+"' onclick='itemJump1(\""+v['WOS_ITEM_CO']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WOS_ITEM_CO')+" title='"+ms.titleAttr(formId,'WOS_ITEM_CO','IS_TITLE_ATTR',v)+"' >"+v['WOS_ITEM_CO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T3#CI_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T3#CI_ITEM_NAME')+"' style='width:150px;"+ms.tdStyle(formId, 'T3#CI_ITEM_NAME')+"' "+ms.tdEvent(formId, 'T3#CI_ITEM_NAME')+">")
            arrHtml.push("<span colno='T3#CI_ITEM_NAME' class='"+ms.uiClass(formId, 'T3#CI_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'T3#CI_ITEM_NAME')+"' "+ms.uiEvent(formId, 'T3#CI_ITEM_NAME')+" title='"+ms.titleAttr(formId,'T3#CI_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['T3#CI_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T3#CI_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'T3#CI_ITEM_SPEC')+"' style='width:150px;"+ms.tdStyle(formId, 'T3#CI_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'T3#CI_ITEM_SPEC')+">")
            arrHtml.push("<span colno='T3#CI_ITEM_SPEC' class='"+ms.uiClass(formId, 'T3#CI_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'T3#CI_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'T3#CI_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'T3#CI_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['T3#CI_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOS_SUP_CO' class='datagrid-cell "+ms.tdClass(formId, 'WOS_SUP_CO')+"' style='width:120px;"+ms.tdStyle(formId, 'WOS_SUP_CO')+"' "+ms.tdEvent(formId, 'WOS_SUP_CO')+">")
            arrHtml.push("<span colno='WOS_SUP_CO' class='"+ms.uiClass(formId, 'WOS_SUP_CO')+"' style='"+ms.uiStyle(formId, 'WOS_SUP_CO')+"' "+ms.uiEvent(formId, 'WOS_SUP_CO')+" title='"+ms.titleAttr(formId,'WOS_SUP_CO','IS_TITLE_ATTR',v)+"' >"+v['WOS_SUP_CO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#SUPPLIER_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T2#SUPPLIER_NAME')+"' style='width:120px;"+ms.tdStyle(formId, 'T2#SUPPLIER_NAME')+"' "+ms.tdEvent(formId, 'T2#SUPPLIER_NAME')+">")
            arrHtml.push("<span colno='T2#SUPPLIER_NAME' class='"+ms.uiClass(formId, 'T2#SUPPLIER_NAME')+"' onclick='itemJump2(\""+v['T2#SUPPLIER_NAME']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'T2#SUPPLIER_NAME')+" title='"+ms.titleAttr(formId,'T2#SUPPLIER_NAME','IS_TITLE_ATTR',v)+"' >"+v['T2#SUPPLIER_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#SUPPLIER_SHORTNAME' class='datagrid-cell "+ms.tdClass(formId, 'T2#SUPPLIER_SHORTNAME')+"' style='width:120px;"+ms.tdStyle(formId, 'T2#SUPPLIER_SHORTNAME')+"' "+ms.tdEvent(formId, 'T2#SUPPLIER_SHORTNAME')+">")
            arrHtml.push("<span colno='T2#SUPPLIER_SHORTNAME' class='"+ms.uiClass(formId, 'T2#SUPPLIER_SHORTNAME')+"' style='"+ms.uiStyle(formId, 'T2#SUPPLIER_SHORTNAME')+"' "+ms.uiEvent(formId, 'T2#SUPPLIER_SHORTNAME')+" title='"+ms.titleAttr(formId,'T2#SUPPLIER_SHORTNAME','IS_TITLE_ATTR',v)+"' >"+v['T2#SUPPLIER_SHORTNAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOS_ITEM_N' class='datagrid-cell "+ms.tdClass(formId, 'WOS_ITEM_N')+"' style='width:150px;"+ms.tdStyle(formId, 'WOS_ITEM_N')+"' "+ms.tdEvent(formId, 'WOS_ITEM_N')+">")
            arrHtml.push("<span colno='WOS_ITEM_N' class='"+ms.uiClass(formId, 'WOS_ITEM_N')+"' style='"+ms.uiStyle(formId, 'WOS_ITEM_N')+"' "+ms.uiEvent(formId, 'WOS_ITEM_N')+" title='"+ms.titleAttr(formId,'WOS_ITEM_N','IS_TITLE_ATTR',v)+"' >"+v['WOS_ITEM_N']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOS_ITEM_RN' class='datagrid-cell "+ms.tdClass(formId, 'WOS_ITEM_RN')+"' style='width:150px;"+ms.tdStyle(formId, 'WOS_ITEM_RN')+"' "+ms.tdEvent(formId, 'WOS_ITEM_RN')+">")
            arrHtml.push("<span colno='WOS_ITEM_RN' class='"+ms.uiClass(formId, 'WOS_ITEM_RN')+"' style='"+ms.uiStyle(formId, 'WOS_ITEM_RN')+"' "+ms.uiEvent(formId, 'WOS_ITEM_RN')+" title='"+ms.titleAttr(formId,'WOS_ITEM_RN','IS_TITLE_ATTR',v)+"' >"+v['WOS_ITEM_RN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOS_WH_CO' class='datagrid-cell "+ms.tdClass(formId, 'WOS_WH_CO')+"' style='width:100px;"+ms.tdStyle(formId, 'WOS_WH_CO')+"' "+ms.tdEvent(formId, 'WOS_WH_CO')+">")
            arrHtml.push("<span colno='WOS_WH_CO' class='"+ms.uiClass(formId, 'WOS_WH_CO')+"' style='"+ms.uiStyle(formId, 'WOS_WH_CO')+"' "+ms.uiEvent(formId, 'WOS_WH_CO')+" title='"+ms.titleAttr(formId,'WOS_WH_CO','IS_TITLE_ATTR',v)+"' >"+v['WOS_WH_CO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOS_DISTRIC' class='datagrid-cell "+ms.tdClass(formId, 'WOS_DISTRIC')+"' style='width:100px;"+ms.tdStyle(formId, 'WOS_DISTRIC')+"' "+ms.tdEvent(formId, 'WOS_DISTRIC')+">")
            arrHtml.push("<span colno='WOS_DISTRIC' class='"+ms.uiClass(formId, 'WOS_DISTRIC')+"' style='"+ms.uiStyle(formId, 'WOS_DISTRIC')+"' "+ms.uiEvent(formId, 'WOS_DISTRIC')+" title='"+ms.titleAttr(formId,'WOS_DISTRIC','IS_TITLE_ATTR',v)+"' >"+v['WOS_DISTRIC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOS_STORAF' class='datagrid-cell "+ms.tdClass(formId, 'WOS_STORAF')+"' style='width:100px;"+ms.tdStyle(formId, 'WOS_STORAF')+"' "+ms.tdEvent(formId, 'WOS_STORAF')+">")
            arrHtml.push("<span colno='WOS_STORAF' class='"+ms.uiClass(formId, 'WOS_STORAF')+"' style='"+ms.uiStyle(formId, 'WOS_STORAF')+"' "+ms.uiEvent(formId, 'WOS_STORAF')+" title='"+ms.titleAttr(formId,'WOS_STORAF','IS_TITLE_ATTR',v)+"' >"+v['WOS_STORAF']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T3#CI_MIN_PACK' class='datagrid-cell "+ms.tdClass(formId, 'T3#CI_MIN_PACK')+"' style='width:100px;"+ms.tdStyle(formId, 'T3#CI_MIN_PACK')+"' "+ms.tdEvent(formId, 'T3#CI_MIN_PACK')+">")
            arrHtml.push("<span colno='T3#CI_MIN_PACK' class='"+ms.uiClass(formId, 'T3#CI_MIN_PACK')+"' style='"+ms.uiStyle(formId, 'T3#CI_MIN_PACK')+"' "+ms.uiEvent(formId, 'T3#CI_MIN_PACK')+" title='"+ms.titleAttr(formId,'T3#CI_MIN_PACK','IS_TITLE_ATTR',v)+"' >"+v['T3#CI_MIN_PACK']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOS_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'WOS_MEMO')+"' style='width:150px;"+ms.tdStyle(formId, 'WOS_MEMO')+"' "+ms.tdEvent(formId, 'WOS_MEMO')+">")
            arrHtml.push("<span colno='WOS_MEMO' class='"+ms.uiClass(formId, 'WOS_MEMO')+"' style='"+ms.uiStyle(formId, 'WOS_MEMO')+"' "+ms.uiEvent(formId, 'WOS_MEMO')+" title='"+ms.titleAttr(formId,'WOS_MEMO','IS_TITLE_ATTR',v)+"' >"+v['WOS_MEMO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>");
            if(i==0){
		        arrHtml.push("<input type='hidden' id='firstItemId' value='"+v.ID+"' />");
	        }
        });	
        //setPopScroll('.scroll','.head');
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        //setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    setNumColWidth(formId);
    clearAllSelect();
    setTableWidth(formId);
    setPopScroll('.scroll2','.head2');
    $('.head2').scrollLeft(0);
    //if(isFirstSetScroll == 0){setScroll();}
    //isFirstSetScroll++;
    showItemDetail($("#firstItemId").val());
    //defTableWidthRewrite("ba1fc70eef83416c878e187b59b7882f");
   // initHeight();
}

function initHeight(){
    	/*
	$('.panel-ajax').height(($(window).height() - 56 - 78 - 10 - 45  - 10)/2 - 30);
	$('.datagrid-body').css('height','calc(100% - 32px)');
	$('.panel1').height($(window).height() - 56 - 78 - 10 - 45 - 30);
	*/
	$('.panel-ajax').height(($(window).height() - 26 - 110 - 15  - 10) - 60);
//	$('.datagrid-body1').css('height','calc(100% - 80px)');//32
	$('.datagrid-body').css('height','calc(100% - 32px)');//32
	$('.panel1').height(($(window).height() - 56 - 110 - 15  - 10) - 60);
	//$('.panel1').height($(window).height() - 56 - 195 - 15 - 70);
	
}
$(function(){
	initHeight();
})

$(window).resize(function(){
	initHeight();
})



function searchItemInfo(paginationImpl){
        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=efe6dcf2a6a44ccb9e662380fa5d65d4";//* 被统一
        //console.log(url);
	SearchItemInfo(paginationImpl,url);
}


	//空处理		
	function nullToEmpty(str){
	 if(str){
	 	if(str==null||str=='null'){
	   	return '';
	 	}
	 	return str;
	 }else{
	 	return "";
	 }
	}
	
	function nullToOne(str){
		if(str){
			if(str==null||str=='null'){
	   			return 1;
	 			}
	 	  return str;
		}else{
			return 1;
		}
	}
   
   function nullToZero(str){
   	if(str){
	 if(str==null||str=='null'){
	    return 0;
	  }
	 return str;
	}else{
		return 0;
	}
	}

</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//委外发料管理
function itemJump1(obj){
      winOptMethod.jump("85bcf4f3d3384f5aa6ea1c5593edc958","F10290","jumpId",obj);
}  


//委外发料管理
function itemJump2(obj){
    winOptMethod.jump("85bcf4f3d3384f5aa6ea1c5593edc958","F10290","jumpId2",obj);
} 



</script>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll','.head');
    setPopScroll('.scroll1','.head1');
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

