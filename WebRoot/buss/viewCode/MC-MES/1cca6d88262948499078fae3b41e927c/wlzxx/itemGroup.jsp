<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
    <title>
		<dict:lang value="物料组信息" />
    </title>
     <style type="text/css">
    
	.datagrid-header,.datagrid-body{
		width:100% !important;
	}

	.datagrid-view{
		height:calc(100% - 30px) !important;
	}
	.datagrid-body1 td{
		border-width: 0 1px 1px 0;
    		border-style: solid;
    		margin:0;
    		border-color: #dbe1ef;
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
	.block2 {
	    height:384px!important;
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
		<bu:header formId ="4e26051dfc65446098d440a56f1c41f8"/>

</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="4b5ee57b70894125b850ca5ca9bdbbef" />
            </div>
            <div class="bd" id="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <input type="hidden" name="exeid" value="${exeid}" />
                       <input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
                       <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="4b5ee57b70894125b850ca5ca9bdbbef" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
         <div class="block1" style="float:left;width:33%;">
		
		<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
		<input type="hidden" name="formId" id="formId3" value='4e26051dfc65446098d440a56f1c41f8'/>         
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                   <input type="hidden" name="exeid" value="${exeid}" />
                   <input type="hidden" name="formId" id="formId1" value='4e26051dfc65446098d440a56f1c41f8'/>
		<input type="hidden" name="formPage4e26051dfc65446098d440a56f1c41f8" id="formPage4e26051dfc65446098d440a56f1c41f8" value="${formPage4e26051dfc65446098d440a56f1c41f8}"/>

		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="4e26051dfc65446098d440a56f1c41f8">
		<div class="datagrid-div datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax4e26051dfc65446098d440a56f1c41f8">
		<div class="datagrid-header" >
		<div class="datagrid-header-inner" id="datagrid-header-inner4e26051dfc65446098d440a56f1c41f8" >
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable4e26051dfc65446098d440a56f1c41f8" >
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="4e26051dfc65446098d440a56f1c41f8" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_4e26051dfc65446098d440a56f1c41f8" onclick="_selectAjaxTableAllData(this,'4e26051dfc65446098d440a56f1c41f8')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<td class="datagrid-cell" style="width:118px;"><bu:uitn colNo="CIG_SN" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<td class="datagrid-cell" style="width:118px;"><bu:uitn colNo="CIG_NAME" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<td class="datagrid-cell" style="width:118px;"><bu:uitn colNo="CIG_TYPE" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class=" datagrid-body  datagrid-div3  datagrid-body-ajax" id="tableDiv4e26051dfc65446098d440a56f1c41f8" onscroll="ajaxTableScroll(this,'4e26051dfc65446098d440a56f1c41f8')" style="overflow-x:hidden;" >
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax4e26051dfc65446098d440a56f1c41f8" >
		<tbody id="tbody_4e26051dfc65446098d440a56f1c41f8" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage4e26051dfc65446098d440a56f1c41f8==1}">			<div class="center" >
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchItemGroup&formId=4e26051dfc65446098d440a56f1c41f8&showLoading=0" />
			
			</div>
		</c:if>
		</div>
			<div class="block2" style="width:65%;float:right;">
					<div style="height:100%;">
				   		<div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view" style="border-bottom:none;">
			<div class="datagrid-header">
			<div class="datagrid-header-inner head1" id="datagrid-header-inner">
				<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable4e26051dfc65446098d440a56f1c41f8">
						<tbody>
						<tr class="datagrid-header-row thcolor">
						<td class="datagrid-cell" style="width:30px; text-align:center;" ></td>
						<td class="datagrid-cell" style="width:198px;"align="center"><dict:lang value="物料料号" /></th >
						<td class="datagrid-cell" style="width:198px;"align="center"><dict:lang value="物料名称" /></th >
						<td class="datagrid-cell" style="width:198px;"align="center"><dict:lang value="物料规格" /></th >
						<td class="datagrid-cell" style="width:198px;"align="center"><dict:lang value="物料类型" /></th >
					</tr>
					</tbody>
				</table>
			</div>
			</div>
		<div class="datagrid-body2 datagrid-div3 scroll1" id="datagrid-body" style="height:calc(100% - 32px)">
				<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax4e26051dfc65446098d440a56f1c41f8" >
					<tbody id="addLoadItem">
					
					</tbody>
				</table>
		</div>	
		
						</div> 
						<div style="background-color: white;">
							<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchItem&formId=formId4&showLoading=0" />
					</div>	
		</div>
					</div>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
               
            </div>
        </div>
    </div>
		<bu:submit viewId="4b5ee57b70894125b850ca5ca9bdbbef" />
		<bu:script viewId="4b5ee57b70894125b850ca5ca9bdbbef" />
    <script type="text/javascript">
    
    function searchItem(paginationImpl){
        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=02ef8a71d249404d9f9153c70a35f3ec"; 
	SearchItem(paginationImpl,url);
}
    
    function searchItemGroup(paginationImpl){
        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=9a9ca43a3abd4a85a3ed552195f91a09"; 
	SearchItemGroup(paginationImpl,url);
}
    
    function findItemAndGroup(paginationImpl){
        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=a9a4d5656d6748f0b22eba6cf4701191"; 
	FindItemAndGroup(paginationImpl,url);
        }
    
    function trchoose(groupId){
        var cbox = $("#"+groupId).find("input[type='checkbox']");
        if(cbox.prop("checked")){

            cbox.attr("checked", false);
        }else{
            cbox.attr("checked", true);
        }
    }
    
    function showItem(groupId){
    trchoose(groupId);
    var getItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=897d806286e3486187e6e9675fe69671";
    util.showLoading("处理中...");
    var groupSn = $("#groupSn_"+groupId).val();
    var dataAuth = $("#auth_"+groupId).val();
   
			$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: getItemUrl,
			    data: {"groupSn":groupSn,"groupId":groupId},
				success: function(data){
						util.closeLoading();
						$("#addLoadItem").empty();
						//console.log(data.ajaxPage.dataList);
						//if(null == data){return ;}
						if(null != data.ajaxPage.dataList){
							var tempType;	
							var rccList = eval(data.ajaxPage.dataList);
							$("#addLoadItem").empty();
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
			 					if(rccList[i].CI_ITEM_TYPE!=null){
			 					if(rccList[i].CI_ITEM_TYPE==1)		tempType="原料";
			 					if(rccList[i].CI_ITEM_TYPE==2)		tempType="半成品";
			 					if(rccList[i].CI_ITEM_TYPE==3)		tempType="成品";
			 					}else tempType="";
								$("#addLoadItem  ").append("<tr id='"+rccList[i].ROWNUM+"' name='"+rccList[i].ROWNUM+"' ></tr>");
								$("#addLoadItem tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px; text-align:center;'>"+rccList[i].ROWNUM+"</td>");

								$("#addLoadItem tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:198px;'><span onclick='itemJump1(\""+rccList[i].CI_ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].CI_ITEM_CODE+"</span></td>");
								$("#addLoadItem tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:198px;'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#addLoadItem tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:198px;'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								$("#addLoadItem tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:198px;'>"+tempType+"</td>");
								$("#addLoadItem tr:last").append("<input type='hidden' id='myGroupSn' name='myGroupSn' value='"+groupSn+"'>");
							}
							
							//clickTr('loadItem');
						}
						pageFun(data.ajaxPage,"formId4");
							var tableTrJs = $("#addLoadItem tr");
							_tongLineColor(tableTrJs);
							defTableWidthRewrite("4e26051dfc65446098d440a56f1c41f8");
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
    }
    var paginationImpl = {};
    //物料查询
		function SearchItem(paginationImpl,url){
		
		var myGroupSn = $("#myGroupSn").val();
		util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: url,
			    data: {"paraMap.myGroupSn":myGroupSn,"page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,"page.pageRecord":_GLO_FORM_PAGE_MAP[paginationImpl].pageRecord},
				success: function(data){
						util.closeLoading();
						$("#addLoadItem").empty();
						//if(null == data){return ;}
						if(null != data.ajaxPage.dataList){
							var tempType;	
							var rccList = eval(data.ajaxPage.dataList);
							//$("#loadItem").empty();
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
			 					if(rccList[i].CI_ITEM_TYPE!=null){
			 					if(rccList[i].CI_ITEM_TYPE==1)		tempType="原料";
			 					if(rccList[i].CI_ITEM_TYPE==2)		tempType="半成品";
			 					if(rccList[i].CI_ITEM_TYPE==3)		tempType="成品";
			 					}else tempType="";
								$("#addLoadItem").append("<tr id='"+rccList[i].ROWNUM+"' name='"+rccList[i].ROWNUM+"' ></tr>");
								$("#addLoadItem tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px; text-align:center;'>"+rccList[i].ROWNUM+"</td>");
								$("#addLoadItem tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:198px;'><span onclick='itemJump1(\""+rccList[i].CI_ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].CI_ITEM_CODE+"</span></td>");
								$("#addLoadItem tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:198px;'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#addLoadItem tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:198px;'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								$("#addLoadItem tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:198px;'>"+tempType+"</td>");
								$("#addLoadItem tr:last").append("<input type='hidden' id='myGroupSn' name='myGroupSn' value='"+myGroupSn+"'>");
							}
							
						}
						pageFun(data.ajaxPage,"formId4");
							var tableTrJs = $("#addLoadItem tr");
							_tongLineColor(tableTrJs);
							defTableWidthRewrite("4e26051dfc65446098d440a56f1c41f8");
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
		}
	//物料组查询
		function SearchItemGroup(paginationImpl,url){
		var data_auth = $("#DATA_AUTH").val();
		var cigName = $.trim($("#CIG_NAME").val());
		var cigType = $("#CIG_TYPE").val();
		var formId = $("#formId1").val();
		util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: url,
			    data: {"paraMap.cigName":cigName,
			           "paraMap.cigType":cigType,
			           "page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			           "page.pageRecord":_GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
			           "data_auth":data_auth
			    },
				success: function(data){
						util.closeLoading();
						//if(null == data){return ;}
						$("#tbody_4e26051dfc65446098d440a56f1c41f8").empty();
						if(null != data.ajaxPage.dataList){
							var tempType;	
							var rccList = eval(data.ajaxPage.dataList);
							//$("#tbody_4e26051dfc65446098d440a56f1c41f8").empty();
							for(var i = 0;i < rccList.length; i++){
								var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
			 					if(rccList[i].CIG_TYPE!=null){
			 					if(rccList[i].CIG_TYPE==1)		tempType="物料";
			 					if(rccList[i].CIG_TYPE==2)		tempType="产品";
			 					
			 					}else tempType="";
			 					var trHtml = "<tr class='datagrid-row "+backgroudColor+"' id='"+rccList[i].ID+"' onclick=\"showItem('"+rccList[i].ID+"');\" abbr='"+rccList[i].ID+"' style='cursor: pointer;' >"
			 					+"<input type='hidden' name='ID' value='"+rccList[i].ID+"' />"
			 					+"<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+rccList[i].ROWNUM+"</span></td>"
			 					+"<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"
			 					+"<input type='checkbox' name='"+formId+"$ID' value='"+rccList[i].ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'></td>"
			 					+"<td colno='DATA_AUTH'  style='width:200px;text-align:center;' class='datagrid-cell' >"
			 					+"<span>"+rccList[i].DATA_AUTH2+"</span>"
			 					+"<input type='hidden' id='auth_"+rccList[i].ID+"' value='"+rccList[i].DATA_AUTH+"'><input type='hidden' id='DATA_AUTH_ID_"+rccList[i].ID+"' value='"+rccList[i].DATA_AUTH+"' /> </td>"			 				
			 					+"<td colno='CIG_SN' style='width:118px;' class='datagrid-cell' >"
			 					+"<span colno='CIG_SN'>"+rccList[i].CIG_SN+"</span>"
			 					+"<input type='hidden' id='groupSn_"+rccList[i].ID+"' value='"+rccList[i].CIG_SN+"'></td>"
			 					+"<td colno='CIG_NAME' style='width:118px;' class='datagrid-cell' >"
			 					+"<span colno='CIG_NAME'>"+rccList[i].CIG_NAME+"</span>"
			 					+"</td>"
			 					+"<td colno='CIG_TYPE' style='width:118px;' class='datagrid-cell' "
			 					+"<span colno='CIG_TYPE' onchange='wuchan(this.value)'>"+tempType+"</span>"
			 					+"</td></tr>";
			 					if(i==0){
			 					trHtml = trHtml + "<input type='hidden' id='firstGroup' value='"+rccList[i].CIG_SN+"' /><input type='hidden' id='firstGroupId' value='"+rccList[i].ID+"' />";
			 					}
								$("#tbody_4e26051dfc65446098d440a56f1c41f8").append(trHtml);
								/*$("#loadItemGroup").append("<tr id='"+rccList[i].ROWNUM+"' name='"+rccList[i].ROWNUM+"' ></tr>");
								$("#loadItemGroup tr:last").append("<td class='datagrid-cell datagrid-cell-1'><span onclick='itemJump1(\""+rccList[i].CI_ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].CI_ITEM_CODE+"</span></td>");
								$("#loadItemGroup tr:last").append("<td class='datagrid-cell datagrid-cell-2' >"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#loadItemGroup tr:last").append("<td class='datagrid-cell datagrid-cell-3'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								$("#loadItemGroup tr:last").append("<td class='datagrid-cell datagrid-cell-4' >"+tempType+"</td>");
								$("#loadItemGroup tr:last").append("<input type='hidden' id='myGroupSn' name='myGroupSn' value='"+myGroupSn+"'>");*/
							}
							pageFun(data.ajaxPage,"4e26051dfc65446098d440a56f1c41f8");
							getFirstItem();
							defTableWidthRewrite("4e26051dfc65446098d440a56f1c41f8");
							
						}
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
		}
		
	//根据物料组、物料条件进行查询
		function FindItemAndGroup(paginationImpl,url){
		var cigName = $.trim($("#CIG_NAME").val());
		var cigType = $("#CIG_TYPE").val();
		var itemCode = $.trim($("#CI_ITEM_CODE").val());
		var itemName = $.trim($("#CI_ITEM_NAME").val());
		var itemSpec = $.trim($("#CI_ITEM_SPEC").val());
		var itemType = $("#CI_ITEM_TYPE").val();
		var formId = $("#formId1").val();
		var dataAuth = $("#DATA_AUTH").val();
		util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: url,
			    data: {"paraMap.cigName":cigName,
			           "paraMap.cigType":cigType,
			           "paraMap.itemCode":itemCode,
			           "paraMap.itemName":itemName,
			           "paraMap.itemSpec":itemSpec,
			           "paraMap.itemType":itemType,
			           "page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			           "page.pageRecord": _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
			           "data_auth":dataAuth
			          },
				success: function(data){
						util.closeLoading();
						//if(null == data){return ;}
						$("#tbody_4e26051dfc65446098d440a56f1c41f8").empty();
						if(null != data.ajaxPage.dataList){
							var tempType;	
							var rccList = eval(data.ajaxPage.dataList);
							//$("#tbody_4e26051dfc65446098d440a56f1c41f8").empty();
							for(var i = 0;i < rccList.length; i++){
								var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
			 					if(rccList[i].CIG_TYPE!=null){
			 					if(rccList[i].CIG_TYPE==1)		tempType="物料";
			 					if(rccList[i].CIG_TYPE==2)		tempType="产品";
			 					
			 					}else tempType="";
			 					var trHtml = "<tr class='datagrid-row "+backgroudColor+"' id='"+rccList[i].ID+"' onclick=\"showItem('"+rccList[i].ID+"');\" abbr='"+rccList[i].ID+"' style='cursor: pointer;' >"
			 					+"<input type='hidden' name='ID' value='"+rccList[i].ID+"' />"
			 					+"<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+rccList[i].ROWNUM+"</span></td>"
			 					+"<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"
			 					+"<input type='checkbox' name='"+formId+"$ID' value='"+rccList[i].ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'></td>"
			 					+"<td  colno='DATA_AUTH' class='datagrid-cell' style='width:200px;text-align:center;'>"
			 					+"<span>"+rccList[i].DATA_AUTH2+"</span>"
			 					+"<input type='hidden' id='auth_"+rccList[i].ID+"' value='"+rccList[i].DATA_AUTH+"'><input type='hidden' id='DATA_AUTH_ID_"+rccList[i].ID+"' value='"+rccList[i].DATA_AUTH+"' /> </td>"			 					
			 					+"<td colno='CIG_SN' class='datagrid-cell' style='width:120px;'>"
			 					+"<span colno='CIG_SN'>"+rccList[i].CIG_SN+"</span>"
			 					+"<input type='hidden' id='groupSn_"+rccList[i].ID+"' value='"+rccList[i].CIG_SN+"'></td>"
			 					+"<td colno='CIG_NAME' class='datagrid-cell' style='width:120px;'>"
			 					+"<span colno='CIG_NAME'>"+rccList[i].CIG_NAME+"</span>"
			 					+"</td>"
			 					+"<td colno='CIG_TYPE' class='datagrid-cell' style='width:120px;'"
			 					+"<span colno='CIG_TYPE' onchange='wuchan(this.value)'>"+tempType+"</span>"
			 					+"</td></tr>";
			 					if(rccList[i].ROWNUM==1){
			 					trHtml = trHtml + "<input type='hidden' id='firstGroup' value='"+rccList[i].CIG_SN+"' /><input type='hidden' id='firstGroupId' value='"+rccList[i].ID+"' />";
			 					}
								$("#tbody_4e26051dfc65446098d440a56f1c41f8").append(trHtml);
								}
							
						}
						pageFun(data.ajaxPage,"4e26051dfc65446098d440a56f1c41f8");
							getFirstItem();
							defTableWidthRewrite("4e26051dfc65446098d440a56f1c41f8");
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
			
			
		}
    <%--主列表--%>
    function listAjaxTable(formId){
        /*	alert("res");
        var currentPage="";
        var pageRecord="";
        var isFirstLoad;
        //var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,CIG_SN\"}";
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
                    clearChildTable();
                }else{
                    utilsFp.confirmIcon(3,"","","", data.RES_MSG,"","260","145");
                }
            },
            error: function(msg){
                utilsFp.confirmIcon(3,"","","", msg,"","260","145");
            }
        });
        */
    }
    
    function listAjaxTables(formId){
        	
        var currentPage="";
        var pageRecord="";
        var isFirstLoad;
        //var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,CIG_SN\"}";
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
                    clearChildTable();
                }else{
                    utilsFp.confirmIcon(3,"","","", data.RES_MSG,"","260","145");
                }
            },
            error: function(msg){
                utilsFp.confirmIcon(3,"","","", msg,"","260","145");
            }
        });
    }
    
    <%--判断是否分页--%>
    function isPage(formId){
        var isPageVal =  $("#formPage"+formId).val();
        if(isPageVal =="1"){    
           return true;
        }
        return false;
    }
    
    <%--查询--%>
    function query(thisObj){

        $("#addLoadItem").empty();
        var formId = $("#formId1").val();
        var itemCode = $("#CI_ITEM_CODE").val();
		var itemName = $("#CI_ITEM_NAME").val();
		var itemSpec = $("#CI_ITEM_SPEC").val();
		var itemType = $("#CI_ITEM_TYPE").val();
		if(itemCode!="" ||itemName!="" ||itemSpec!="" ||itemType!=""){
			findItemAndGroup(formId);
		}else{
			searchItemGroup(formId);
		}
        
    }
    
    <%--清空表格--%>
    function clearChildTable(){
        $(".isChilds").empty();
        getFormIdInitChildPage();
    }
    
   <%--当出现滚动条时动态设置表格宽度 --%>
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
        utilsFp.alert(msg);
    }
    
    <%--清空全选 --%>
    function clearAllSelect(){
        $(".left-datagrid-title-ajax,.datagrid-title-ajax").find("input[type='checkbox']").prop("checked",false);
    }
    
    <%--子列表 --%>
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
        var url = "${path}buss/bussModel_listMsCasData.ms?exeid=${exeid}";
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
    <%-- 数据为空时设置横向滚动条 --%>
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
    
    <%-- 初始化子分页 --%>
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
    
    
    <%-- 初始化分页插件 --%>
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
    
    <%-- 判断是否首次异步访问 --%>
    function firstLoadThisPage(formId){
        if(typeof(_GLO_FORM_PAGE_MAP[formId].currentPage) =="undefined"){
            return true;
        }
        return false;
    }
    
    <%-- 初始化子表单 --%>
    function getFormIdInitChildPage(){
        var tableCount = $("#tableCount").val();
        for ( var i = 2; i <= tableCount; i++) {
            var formId = $("#formId"+i).val();
            if(isPage(formId)){
               initChildPage(formId);
            }
        }
    }
    
    
    
    function init(){
        $("#addLoadItem").empty();
        if($(".leftTable-ajax").length>0){
            $(".leftTable-ajax").show();
        };
        getFormIdInitChildPage();
       
        listAjaxTables($("#formId1").val());
        //createMyTable(itemGroupUrl);
       // <s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
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
    function reloadPg(msg,title,width,height,time,isCloseWin){
    msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
}
function reloadPgExeAx(isCloseWin){

    
    query("");
    if ("0" == isCloseWin   ) {
        top.$(".dialog-close").click();
    }
     //checkboxAll("joblist");
}
function reloadPgExe(isCloseWin){
   
    query("");
    if ("0" == isCloseWin   ) {
        top.$(".dialog-close").click();
    }
     
}
</script>
<script>
var isFirstSetScroll=0;
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
    if(formId=='4e26051dfc65446098d440a56f1c41f8'){<%--物料组信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' onclick=\"showItem('"+v.ID+"');\" abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            if(v._SEQ==1){
            arrHtml.push("<input type='hidden' id='firstGroup' value='"+v['CIG_SN']+"' />");
            arrHtml.push("<input type='hidden' id='firstGroupId' value='"+v['ID']+"' />");
            }
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
           arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='auth_"+v.ID+"' value='"+v['ID']+"'><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /> </td>");            
            arrHtml.push("<td colno='CIG_SN' class='datagrid-cell "+ms.tdClass(formId, 'CIG_SN')+"' style='"+ms.tdStyle(formId, 'CIG_SN')+"' "+ms.tdEvent(formId, 'CIG_SN')+">")
            arrHtml.push("<span colno='CIG_SN' class='"+ms.uiClass(formId, 'CIG_SN')+"' style='"+ms.uiStyle(formId, 'CIG_SN')+"' "+ms.uiEvent(formId, 'CIG_SN')+" title='"+ms.titleAttr(formId,'CIG_SN','IS_TITLE_ATTR',v)+"' >"+v['CIG_SN']+"</span>")
            arrHtml.push("<input type='hidden' id='groupSn_"+v.ID+"' value='"+v['CIG_SN']+"'></td>");
            arrHtml.push("<td colno='CIG_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CIG_NAME')+"' style='"+ms.tdStyle(formId, 'CIG_NAME')+"' "+ms.tdEvent(formId, 'CIG_NAME')+">")
            arrHtml.push("<span colno='CIG_NAME' class='"+ms.uiClass(formId, 'CIG_NAME')+"' style='"+ms.uiStyle(formId, 'CIG_NAME')+"' "+ms.uiEvent(formId, 'CIG_NAME')+" title='"+ms.titleAttr(formId,'CIG_NAME','IS_TITLE_ATTR',v)+"' >"+v['CIG_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CIG_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CIG_TYPE')+"' style='"+ms.tdStyle(formId, 'CIG_TYPE')+"' "+ms.tdEvent(formId, 'CIG_TYPE')+">")
            arrHtml.push("<span colno='CIG_TYPE' class='"+ms.uiClass(formId, 'CIG_TYPE')+"' style='"+ms.uiStyle(formId, 'CIG_TYPE')+"' "+ms.uiEvent(formId, 'CIG_TYPE')+" title='"+ms.titleAttr(formId,'CIG_TYPE','IS_TITLE_ATTR',v)+"' >"+v['CIG_TYPE']+"</span>")
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
    //setTableWidth(formId);
     if(isFirstSetScroll == 0){
    	isFirstSetScroll =1;
    	setScroll();
    }
    var getItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=897d806286e3486187e6e9675fe69671";
    //加载第一个物料组里面的物料
    util.showLoading("处理中...");
    var groupSn = $("#firstGroup").val();
    var groupId = $("#firstGroupId").val(); 
			$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: getItemUrl,
			    data: {"groupSn":groupSn,"groupId":groupId},
				success: function(data){
						util.closeLoading();
						//console.log(data.ajaxPage.dataList);
						$("#addLoadItem").empty();
						//if(null == data){return ;}
						if(null != data.ajaxPage.dataList){
							var tempType;	
							var rccList = eval(data.ajaxPage.dataList);
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
			 					if(rccList[i].CI_ITEM_TYPE!=null){
			 					if(rccList[i].CI_ITEM_TYPE==1)		tempType="原料";
			 					if(rccList[i].CI_ITEM_TYPE==2)		tempType="半成品";
			 					if(rccList[i].CI_ITEM_TYPE==3)		tempType="成品";
			 					}else tempType="";
								$("#addLoadItem").append("<tr id='"+rccList[i].ROWNUM+"' name='"+rccList[i].ROWNUM+"' ></tr>");
								$("#addLoadItem tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px; text-align:center;'>"+rccList[i].ROWNUM+"</td>");
								$("#addLoadItem tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:198px;'><span onclick='itemJump1(\""+rccList[i].CI_ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].CI_ITEM_CODE+"</span></td>");
								$("#addLoadItem tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:198px;'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#addLoadItem tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:198px;'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								$("#addLoadItem tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:198px;'>"+tempType+"</td>");
								$("#addLoadItem tr:last").append("<input type='hidden' id='myGroupSn' name='myGroupSn' value='"+groupSn+"'>");
							}
							
							//clickTr('loadItem');
						}
						pageFun(data.ajaxPage,"formId4");
							var tableTrJs = $("#addLoadItem tr");
							_tongLineColor(tableTrJs);
							defTableWidthRewrite("4e26051dfc65446098d440a56f1c41f8");
						newScroll(".datagrid-body2")
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//加载查询出来的第一个物料组里面的物料
function getFirstItem(){
var getItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=897d806286e3486187e6e9675fe69671";
//加载第一个物料组里面的物料

    util.showLoading("处理中...");
    var groupSn = $("#firstGroup").val();
    var groupId = $("#firstGroupId").val();
			$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: getItemUrl,
			    data: {"groupSn":groupSn,"groupId":groupId},
				success: function(data){
						util.closeLoading();
						//console.log(data.ajaxPage.dataList);
						$("#addLoadItem").empty();
						//if(null == data){return ;}
						if(null != data.ajaxPage.dataList){
							var tempType;	
							var rccList = eval(data.ajaxPage.dataList);
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
			 					if(rccList[i].CI_ITEM_TYPE!=null){
			 					if(rccList[i].CI_ITEM_TYPE==1)		tempType="原料";
			 					if(rccList[i].CI_ITEM_TYPE==2)		tempType="半成品";
			 					if(rccList[i].CI_ITEM_TYPE==3)		tempType="成品";
			 					}else tempType="";
								$("#addLoadItem").append("<tr id='"+rccList[i].ROWNUM+"' name='"+rccList[i].ROWNUM+"' ></tr>");
								$("#addLoadItem tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px; text-align:center;'>"+rccList[i].ROWNUM+"</td>");
								$("#addLoadItem tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:198px;'><span onclick='itemJump1(\""+rccList[i].CI_ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].CI_ITEM_CODE+"</span></td>");
								$("#addLoadItem tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:198px;'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#addLoadItem tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:198px;'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								$("#addLoadItem tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:198px;'>"+tempType+"</td>");
								$("#addLoadItem tr:last").append("<input type='hidden' id='myGroupSn' name='myGroupSn' value='"+groupSn+"'>");
							}
							
							//clickTr('loadItem');
						}
						pageFun(data.ajaxPage,"formId4");
							var tableTrJs = $("#addLoadItem tr");
							_tongLineColor(tableTrJs);
							defTableWidthRewrite("4e26051dfc65446098d440a56f1c41f8");
						newScroll(".datagrid-body2")
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}

function newScroll(item){
	$(item).mCustomScrollbar({
		axis:"yx",
		snapAmount:40,
		theme:"minimal-dark",
		keyboard:{scrollAmount:40},
		mouseWheel:{deltaFactor:40,preventDefault:true},
		scrollInertia:80,
			
	  });
}

function initHeight(){
    	$('.block2').height($(window).height() - 56 - 78 - 10)
    
}

$(function(){
	initHeight()

})

$(window).resize(function(){
        initHeight()     		 
});

</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//物料信息
function itemJump1(obj){
      winOptMethod.jump("15e211df6f9d435088ad89c31837ef5f","F3428","jumpId",obj);
}  


</script>
<script>(function($){
  $(window).on('load',function(){
   
    setPopScroll('.scroll1','.head1');
  
  })
})(jQuery)</script>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>

<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>