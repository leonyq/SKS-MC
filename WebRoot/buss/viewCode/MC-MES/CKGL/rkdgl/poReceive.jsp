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
		<dict:lang value="采购入库" />
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
		<bu:header formId ="7b5230d9dda44e8cadb18aa7137d1aa4"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
	<script type="text/javascript">
	var loaded = 1;
	var tab_len =3;

	var currentTag;
	var tabs = "";
	function switchTag(tag, content, url) {
		if (currentTag == tag) {
			return false;
		}
		document.getElementById("content2").style.display="";
		document.getElementById("content3").style.display="";
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
			listAjaxTable("7b5230d9dda44e8cadb18aa7137d1aa4");
			$("#allSelect").removeAttr("checked");
		}
		if(tag=="tag2"){
			searchItemDetail();
			$("#allSelect1").removeAttr("checked");
		}
		if(tag=="tag3"){
			searchReceive();
			$("#allSelect1").removeAttr("checked");
		}
	}
$(function(){
        $("#tag3").addClass("current");
	//$("#tag3").addClass("current");
                    switchTag('tag3','content3','');
	
	
	$(document.getElementById('T2#WRD_DOC_TYPE')).closest('.group').attr("style","display:none;");
	
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
	//全选1
     	function getAllItem3(){
		if($("#allSelect3").attr("checked")=="checked"){
			$("#addReceive :checkbox").attr("checked",true);
		}else{
			$("#addReceive :checkbox").each(function(){
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
		<bu:func viewId="db26ac43455245b8a8c60f8d3cc69ac9" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                       
		<bu:search viewId="db26ac43455245b8a8c60f8d3cc69ac9" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage7b5230d9dda44e8cadb18aa7137d1aa4" id="formPage7b5230d9dda44e8cadb18aa7137d1aa4" value="${formPage7b5230d9dda44e8cadb18aa7137d1aa4}"/>
		<input type="hidden" name="formId" id="formId1" value='7b5230d9dda44e8cadb18aa7137d1aa4'/>
		<input type="hidden" name="formId" id="formId2" value='7b5230d9dda44e8cadb18aa7137d1a02'/>
		<input type="hidden" name="formId" id="formId3" value='7b5230d9dda44e8cadb18aa7137d1a03'/>
		<input type="hidden" name="formId" id="formId4" value='7b5230d9dda44e8cadb18aa7137d1a04'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>
		<input type="hidden" id="dataAuth" name="dataAuth" value='${sessionScope.mcDataAuth}'/>
		<input type="hidden" id="itemId" name="itemId" value=''/>
		<div class="js-tab">
					<DIV id="container" style="box-sizing: border-box;">
						<DIV class="hd">
						    
							<UL class="tab-list tab" style="padding-left:12px;">
	                           <LI id="tag3"><A class=""
									onclick="switchTag('tag3','content3','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="入库单信息" /></SPAN> </A>
								</LI>
								
								<LI id="tag1"><A class=""
									onclick="switchTag('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="入库明细" /></SPAN> </A>
								</LI>

								<LI id="tag2"><A class=""
									onclick="switchTag('tag2','content2','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="入库总明细" /></SPAN> </A>
								</LI>
								
							</UL>
						</DIV>
			<DIV class="content1" id="content" style="margin-top: 15px;">
			<DIV id="content1" style="margin-top:4px;" data-tab="tag1">
		<div class="panel-ajax datagrid datagrid-div1"  id="7b5230d9dda44e8cadb18aa7137d1aa4">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax7b5230d9dda44e8cadb18aa7137d1aa4" style="overflow-x:hidden;">
		<div class="datagrid-header">
		<div class="datagrid-header-inner head2" id="datagrid-header-inner7b5230d9dda44e8cadb18aa7137d1aa4">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable7b5230d9dda44e8cadb18aa7137d1aa4" >
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="7b5230d9dda44e8cadb18aa7137d1aa4" i18n="1"/></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WRI_DOC_NUM" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WRI_ITEM_CODE" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="T2#WRD_ERP_FLAG" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="T2#WRD_URGENT_FLAG" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WRI_STATUS" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WRI_PLAN_NUM" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WRI_GIFT_NUM" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WRI_RECEIVE_NUM" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WRI_PACK_NUM" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WRI_ITEM_SEQ" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WRI_CONNECT_DOC" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="T6#WDT_TYPE_NAME" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="T7#WDO_DISPATCH_NAME" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WRI_WH_CODE" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WRI_ITEM_NAME" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WRI_ITEM_SPEC" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="T3#SUPPLIER_NAME" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="WRI_DELIVERY_DATE" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="T4#NAME" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="T2#WRD_CREATE_TIME" formId="7b5230d9dda44e8cadb18aa7137d1aa4" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax scroll2" id="tableDiv7b5230d9dda44e8cadb18aa7137d1aa4" onscroll="ajaxTableScroll(this,'7b5230d9dda44e8cadb18aa7137d1aa4')">
		<table class="datagrid-btable fixedTable "  id="datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1aa4" >
		<tbody id="tbody_7b5230d9dda44e8cadb18aa7137d1aa4" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage7b5230d9dda44e8cadb18aa7137d1aa4==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=7b5230d9dda44e8cadb18aa7137d1aa4&showLoading=0" />
			</div>
		</c:if>
		  <!---->
			
				<div class="panel-ajax datagrid datagrid-div1" style="margin-top:10px; height:50px;"><!--143-->
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
						<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head1"  id="">
								<table  class="datagrid-htable fixedTable  " id="datagrid-htable7b5230d9dda44e8cadb18aa7137d1a02" >
									<tbody>
									<tr class="thcolor datagrid-header-row">
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
									
						           <!--    <td class="datagrid-cell" style="width:200px;" ><dict:lang value="组织机构" /></td >  -->
										<td class="datagrid-cell" style="width:250px;" ><dict:lang value="物料SN" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料料号" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料名称" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料规格" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="入库数量" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="拆分数量" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="项次" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="采购单号" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="包装小箱SN" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="包装大箱SN" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="包装栈板SN" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="顶级包装SN" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="仓库" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="库位" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="供应商追溯信息" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="操作人" /></td >
										<td class="datagrid-cell" style="width:130px;" ><dict:lang value="操作时间" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="上传标识" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="上传时间" /></td >
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll1"><!--130-->
							<table class="datagrid-btable fixedTable" style="table-layout: fixed;"   id="datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02" >
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
								<table  class="datagrid-htable fixedTable  " id="datagrid-htable7b5230d9dda44e8cadb18aa7137d1a03"  >
									<tbody>
									<tr class="thcolor datagrid-header-row">
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
										
						                <td class="datagrid-cell" style="width:200px;" ><dict:lang value="组织机构" /></td >  
										<td class="datagrid-cell" style="width:250px;" ><dict:lang value="物料SN" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料料号" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料名称" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料规格" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="入库数量" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="拆分数量" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="项次" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="采购单号" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="包装小箱SN" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="包装大箱SN" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="包装栈板SN" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="顶级包装SN" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="仓库" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="库位" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="供应商追溯信息" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="操作人" /></td >
										<td class="datagrid-cell" style="width:130px;" ><dict:lang value="操作时间" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="上传标识" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="上传时间" /></td >
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll">
							<table class="datagrid-btable fixedTable" style="table-layout: fixed;" id="datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03" >
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
			
			<DIV id="content3" style="display:none" data-tab="tag3">
				<div class="panel1 datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border:0;">
						<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head3"  id="" >
								<table  class="datagrid-htable fixedTable  " id="datagrid-htable7b5230d9dda44e8cadb18aa7137d1a04" >
									<tbody>
									<tr class="thcolor datagrid-header-row">
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"><input type="checkbox" id="allSelect3" name="allSelec3" onchange="getAllItem3();"/></td >
						                <td class="datagrid-cell" style="width:200px;" ><dict:lang value="组织机构" /></td >
										<td class="datagrid-cell" style="width:140px;" ><dict:lang value="入库单号" /></td >
										
										<td class="datagrid-cell" style="width:100px;" ><dict:lang value="单据类型" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="状态" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="ERP同步标志" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="紧急标志" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="供应商" /></td >
										<td class="datagrid-cell" style="width:140px;" ><dict:lang value="入库日期" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="开单人" /></td >
										<td class="datagrid-cell" style="width:140px;" ><dict:lang value="开单时间" /></td >
										<td class="datagrid-cell" style="width:110px;" ><dict:lang value="关结人" /></td >
										<td class="datagrid-cell" style="width:140px;" ><dict:lang value="关结时间" /></td >
										
										<td class="datagrid-cell" style="width:210px;" ><dict:lang value="备注" /></td >
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll3">
							<table class="datagrid-btable fixedTable" style="table-layout: fixed;"  id="datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a04">
								<tbody id="addReceive" >
								</tbody>
							</table>
						</div>
							
					</div>
				</div>
				<div style="background-color: white;" id="pageDiv">
                                 			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchReceiveItem&formId=formId4&showLoading=0" />
                                 		</div>
			</DIV>
		 				

	</DIV>

</DIV>

		<input type="hidden" name="tableCount" id="tableCount" value='2' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="db26ac43455245b8a8c60f8d3cc69ac9" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="db26ac43455245b8a8c60f8d3cc69ac9" />
 
<script type="text/javascript">

function listAjaxTable(formId){
                    
                    var currentPage="";
                    var pageRecord="";
                    console.log("formId:"+formId+"currentPage:"+currentPage+"pageRecord:"+pageRecord);
                    var isFirstLoad;
                  //  var url = "/mes/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,T2#WRD_STATUS\"}";
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
                                console.log(ms);
                                console.log(page);
                                if(isPage(formId)){
                                    console.log("initPage");
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
                        searchItemDetail();
                    }
                    if($("#tag3").attr("class")=="current"){
                   
                         $('.scroll3').mCustomScrollbar("destroy");
                        searchReceiveItem("formId4");
                       
                        setPopScroll('.scroll3','.head3');
                       
                      
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
                  var jumpId = $("#jumpId").val();  
              		if(jumpId!=""){
              		console.log(jumpId);
              		$("#WRI_CONNECT_DOC").attr('save_mark','0');
              		$("#WRI_CONNECT_DOC_SHOW").val(jumpId)
                  $("#WRI_CONNECT_DOC").val(jumpId);
                  
                  }      
                  if(jumpId==''){
                    $("#T2#WRD_CREATE_TIME_BEGIN").val(timeBeginString());
                    $("#T2#WRD_CREATE_TIME_END").val(timeEndString());
                    }
                     $(document.getElementById('T2#WRD_DOC_TYPE')).val('DJ02');
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
                });
                
             
              /*  function timeBeginString(){
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
	}*/

	/*function timeEndString(){
		var datetime = new Date();
		//datetime.setDate(datetime.getDate()+360);
		var year = datetime.getFullYear();
		var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
		
		var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
		
		return year + "-" + month + "-" + date +" 23:59:59";
		//return year + "-" + month + "-" + date;
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
//点击入库信息获取物料信息
function showItemDetail(itemId){
	var itemCode = $("#ITEM_CODE_"+itemId).val();
	$("#itemId").val(itemId);
	util.showLoading("处理中...");
	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: "buss/bussModel_exeFunc.ms?funcMId=97f0a52fa234453f8e4c430d50081b74",//VM-采购入库管理 操作功能 点击入库信息获取物料信息
			    data: {
			        "itemId":itemId
			    },
				success: function(data){
						util.closeLoading();
						$("#addItemDetail").empty();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							var tempFlag="";
							for(var i = 0;i < rccList.length; i++){
							  //  if(rccList[i].DATAAUTH==null)      rccList[i].DATAAUTH="";
							    if(rccList[i].CI_ITEM_NAME==null)  rccList[i].CI_ITEM_NAME="";
								if(rccList[i].CI_ITEM_SPEC==null)  rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].WRD_SPLIT_NUM==null)  rccList[i].WRD_SPLIT_NUM="";
								if(rccList[i].WRD_CONNECT_DOC==null)  rccList[i].WRD_CONNECT_DOC="";
								if(rccList[i].WRD_FIRST_SN==null)  rccList[i].WRD_FIRST_SN="";
								if(rccList[i].WRD_SECOND_SN==null)  rccList[i].WRD_SECOND_SN="";
								if(rccList[i].WRD_THIRD_SN==null)  rccList[i].WRD_THIRD_SN="";
								if(rccList[i].WRD_FOURTH_SN==null)  rccList[i].WRD_FOURTH_SN="";
								if(rccList[i].WH_NAME==null)  rccList[i].WH_NAME="";
								if(rccList[i].STORAGE_NAME==null)  rccList[i].STORAGE_NAME="";
								if(rccList[i].SUPPLIER_NAME==null)  rccList[i].SUPPLIER_NAME="";
								if(rccList[i].RECEIVE_EMP==null)  rccList[i].RECEIVE_EMP="";
								if(rccList[i].RECEIVE_TIME==null)  rccList[i].RECEIVE_TIME="";
								//if(rccList[i].WRD_UPLOAD_FLAG==null)  rccList[i].WRD_UPLOAD_FLAG="";
								if(rccList[i].WRD_UPLOAD_FLAG=="Y"){
								tempFlag="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
									}else{
										tempFlag="<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
									}
								if(rccList[i].WRD_UPLOAD_TIME==null)  rccList[i].WRD_UPLOAD_TIME="";
								
							
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
							//	$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:250px;text-align: center;' title='"+rccList[i].WRD_ITEM_SN+"'><span onclick='itemJump3(\""+rccList[i].WRD_ITEM_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WRD_ITEM_SN+"</span></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;' title='"+rccList[i].WRD_ITEM_CODE+"'><span onclick='itemJump4(\""+rccList[i].WRD_ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WRD_ITEM_CODE+"</span></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: center;' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: center;' title='"+rccList[i].CI_ITEM_SPEC+"'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:90px;text-align: right;' title='"+rccList[i].WRD_RECEIVE_NUM+"'>"+rccList[i].WRD_RECEIVE_NUM+"</td>");
						    	$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:70px;text-align: right;' title='"+rccList[i].WRD_SPLIT_NUM+"'>"+rccList[i].WRD_SPLIT_NUM+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:70px;text-align: right;' title='"+rccList[i].WRD_ITEM_SEQ+"'>"+rccList[i].WRD_ITEM_SEQ+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:150px;' title='"+rccList[i].WRD_CONNECT_DOC+"'><span onclick='itemJump5(\""+rccList[i].WRD_CONNECT_DOC+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WRD_CONNECT_DOC+"</span></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:110px;' title='"+rccList[i].WRD_FIRST_SN+"'>"+rccList[i].WRD_FIRST_SN+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:110px;' title='"+rccList[i].WRD_SECOND_SN+"'>"+rccList[i].WRD_SECOND_SN+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:110px;' title='"+rccList[i].WRD_THIRD_SN+"'>"+rccList[i].WRD_THIRD_SN+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:110px;' title='"+rccList[i].WRD_FOURTH_SN+"'>"+rccList[i].WRD_FOURTH_SN+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='width:110px;' title='"+rccList[i].WH_NAME+"'>"+rccList[i].WH_NAME+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-16' style='width:110px;' title='"+rccList[i].STORAGE_NAME+"'>"+rccList[i].STORAGE_NAME+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-17' style='width:110px;' title='"+rccList[i].SUPPLIER_NAME+"'>"+rccList[i].SUPPLIER_NAME+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-18' style='width:90px;text-align: center;' title='"+rccList[i].RECEIVE_EMP+"'>"+rccList[i].RECEIVE_EMP+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-19' style='width:130px;' title='"+rccList[i].RECEIVE_TIME+"'>"+rccList[i].RECEIVE_TIME+"</td>");
							//	$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-20' style='width:70px;'>"+rccList[i].WRD_UPLOAD_FLAG+"</td>");
							    $("#datagrid-btable-ajaxbb156a44e6e242a885b3fde9386fd502 tr:last").append("<td class='datagrid-cell datagrid-cell-20' style='width:70px;text-align: center;' title=''>"+tempFlag+"</td>");
                            	$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-21' style='width:150px; title='"+rccList[i].WRD_UPLOAD_TIME+"'>"+rccList[i].WRD_UPLOAD_TIME+"</td>");
							}
						}
						pageFun(data.ajaxPage,"formId2");
							var tableTrJs = $("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tbody tr");
							_tongLineColor(tableTrJs);
							//clickTr('itemDetail');
							defTableWidthRewrite('7b5230d9dda44e8cadb18aa7137d1a02');
						
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
    	util.showLoading("处理中...");
    	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: url,
			    data:{
			        
			        "paraMap.type":"1",
			        "paraMap.itemId":itemId,
			        "paraMap.dataAuth":dataAuth,
			        "page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			        "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord, 
			    },
			    //data: "paraMap.type=1&paraMap.itemId="+itemId+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				success: function(data){
				                 
						util.closeLoading();
						$("#addItemDetail").empty();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							for(var i = 0;i < rccList.length; i++){
							    if(rccList[i].DATAAUTH==null) 	   rccList[i].DATAAUTH="";
							    if(rccList[i].CI_ITEM_NAME==null)  rccList[i].CI_ITEM_NAME="";
								if(rccList[i].CI_ITEM_SPEC==null)  rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].WRD_SPLIT_NUM==null)  rccList[i].WRD_SPLIT_NUM="";
								if(rccList[i].WRD_CONNECT_DOC==null)  rccList[i].WRD_CONNECT_DOC="";
								if(rccList[i].WRD_FIRST_SN==null)  rccList[i].WRD_FIRST_SN="";
								if(rccList[i].WRD_SECOND_SN==null)  rccList[i].WRD_SECOND_SN="";
								if(rccList[i].WRD_THIRD_SN==null)  rccList[i].WRD_THIRD_SN="";
								if(rccList[i].WRD_FOURTH_SN==null)  rccList[i].WRD_FOURTH_SN="";
								if(rccList[i].WH_NAME==null)  rccList[i].WH_NAME="";
								if(rccList[i].STORAGE_NAME==null)  rccList[i].STORAGE_NAME="";
								if(rccList[i].SUPPLIER_NAME==null)  rccList[i].SUPPLIER_NAME="";
								if(rccList[i].RECEIVE_EMP==null)  rccList[i].RECEIVE_EMP="";
								if(rccList[i].RECEIVE_TIME==null)  rccList[i].RECEIVE_TIME="";
							//	if(rccList[i].WRD_UPLOAD_FLAG==null)  rccList[i].WRD_UPLOAD_FLAG="";
									if(rccList[i].WRD_UPLOAD_FLAG=="Y"){
										tempFlag="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
									}else{
									tempFlag="<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
									}
								if(rccList[i].WRD_UPLOAD_TIME==null)  rccList[i].WRD_UPLOAD_TIME="";
								
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								//$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
								//$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:200px;text-align: center;' title='"+rccList[i].DATA_AUTH+"'>"+rccList[i].DATA_AUTH+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='text-align: center;width:200px;' title='"+rccList[i].DATA_AUTH+"'>"+rccList[i].DATA_AUTH+"<input type='hidden' id='DATA_AUTH_ID_"+rccList[i].ID+"' value='"+rccList[i].DATA_AUTH+"' /></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:250px;text-align: center;' title='"+rccList[i].WRD_ITEM_SN+"'><span onclick='itemJump3(\""+rccList[i].WRD_ITEM_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WRD_ITEM_SN+"</span></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;' title='"+rccList[i].WRD_ITEM_CODE+"'><span onclick='itemJump4(\""+rccList[i].WRD_ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WRD_ITEM_CODE+"</span></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: center;' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: center;' title='"+rccList[i].CI_ITEM_SPEC+"'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:90px;text-align: right;' title='"+rccList[i].WRD_RECEIVE_NUM+"'>"+rccList[i].WRD_RECEIVE_NUM+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:70px;text-align: right;' title='"+rccList[i].WRD_SPLIT_NUM+"'>"+rccList[i].WRD_SPLIT_NUM+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:70px;text-align: right;' title='"+rccList[i].WRD_ITEM_SEQ+"'>"+rccList[i].WRD_ITEM_SEQ+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:150px;' title='"+rccList[i].WRD_CONNECT_DOC+"'><span onclick='itemJump5(\""+rccList[i].WRD_CONNECT_DOC+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WRD_CONNECT_DOC+"</span></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:110px;' title='"+rccList[i].WRD_FIRST_SN+"'>"+rccList[i].WRD_FIRST_SN+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:110px;' title='"+rccList[i].WRD_SECOND_SN+"'>"+rccList[i].WRD_SECOND_SN+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:110px;' title='"+rccList[i].WRD_THIRD_SN+"'>"+rccList[i].WRD_THIRD_SN+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:110px;' title='"+rccList[i].WRD_FOURTH_SN+"'>"+rccList[i].WRD_FOURTH_SN+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='width:110px;' title='"+rccList[i].WH_NAME+"'>"+rccList[i].WH_NAME+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-16' style='width:110px;' title='"+rccList[i].STORAGE_NAME+"'>"+rccList[i].STORAGE_NAME+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-17' style='width:110px;' title='"+rccList[i].SUPPLIER_NAME+"'>"+rccList[i].SUPPLIER_NAME+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-18' style='width:90px;text-align: center;' title='"+rccList[i].RECEIVE_EMP+"'>"+rccList[i].RECEIVE_EMP+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-19' style='width:130px;' title='"+rccList[i].RECEIVE_TIME+"'>"+rccList[i].RECEIVE_TIME+"</td>");
							//	$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-20' style='width:70px;'>"+rccList[i].WRD_UPLOAD_FLAG+"</td>");
								$("#datagrid-btable-ajaxbb156a44e6e242a885b3fde9386fd502 tr:last").append("<td class='datagrid-cell datagrid-cell-20' style='width:70px;text-align: center;' title=''>"+tempFlag+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tr:last").append("<td class='datagrid-cell datagrid-cell-21' style='width:150px; title='"+rccList[i].WRD_UPLOAD_TIME+"'>"+rccList[i].WRD_UPLOAD_TIME+"</td>");
							}
						}
						pageFun(data.ajaxPage,"formId2");
							var tableTrJs = $("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a02 tbody tr");
							_tongLineColor(tableTrJs);
							//clickTr('itemDetail');
							defTableWidthRewrite('7b5230d9dda44e8cadb18aa7137d1a02');
						
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
	var itemCode = $.trim($("#WRI_ITEM_CODE_SHOW").val());
	var docNum = $.trim($("#WRI_DOC_NUM").val());
//	var supCode = $(document.getElementById('T2#WRD_SUP_CODE')).val();
    var supCode = $.trim($(document.getElementById('T3#SUPPLIER_NAME')).val());
	var connectDoc = $.trim($("#WRI_CONNECT_DOC").val());
	var itemStatus = $("#WRI_STATUS").val();
var beginTime = $(document.getElementById('T2#WRD_CREATE_TIME_BEGIN')).val();
	// var beginTime = $('T2#WPD_DELIVERY_DATE_BEGIN').val();
	var endTime = $(document.getElementById('T2#WRD_CREATE_TIME_END')).val();
//	var endTime = $('T2#WPD_DELIVERY_DATE_END').val();
	
	/*var beginTime = $(document.getElementById('T2#WPD_DELIVERY_DATE_BEGIN')).val();
	var endTime = $(document.getElementById('T2#WPD_DELIVERY_DATE_END')).val();
	+"&beginTime="+beginTime+"&endTime="+endTime
	*/
	 var getItemDetailUrl="buss/bussModel_exeFunc.ms?funcMId=97f0a52fa234453f8e4c430d50081b74";//VM-采购入库管理 操作功能 点击入库信息获取物料信息
	util.showLoading("处理中...");
	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: getItemDetailUrl,
			    data:{
			        "beginTime":beginTime,
			        "endTime":endTime,
			        "itemStatus":itemStatus,
			        "itemCode":itemCode,
			        "dataAuth":dataAuth,
			        "docNum":docNum,
			        "supCode":supCode,
			        "connectDoc":connectDoc,
			        "docType":"DJ02"
			       
			        
			    },
				success: function(data){
						util.closeLoading();
						$("#addSecondItemDetail").empty();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							for(var i = 0;i < rccList.length; i++){	
							    if(rccList[i].DATAAUTH==null) 	   rccList[i].DATAAUTH="";
                                if(rccList[i].CI_ITEM_NAME==null)  rccList[i].CI_ITEM_NAME="";
								if(rccList[i].CI_ITEM_SPEC==null)  rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].WRD_SPLIT_NUM==null)  rccList[i].WRD_SPLIT_NUM="";
								if(rccList[i].WRD_CONNECT_DOC==null)  rccList[i].WRD_CONNECT_DOC="";
								if(rccList[i].WRD_FIRST_SN==null)  rccList[i].WRD_FIRST_SN="";
								if(rccList[i].WRD_SECOND_SN==null)  rccList[i].WRD_SECOND_SN="";
								if(rccList[i].WRD_THIRD_SN==null)  rccList[i].WRD_THIRD_SN="";
								if(rccList[i].WRD_FOURTH_SN==null)  rccList[i].WRD_FOURTH_SN="";
								if(rccList[i].WH_NAME==null)  rccList[i].WH_NAME="";
								if(rccList[i].STORAGE_NAME==null)  rccList[i].STORAGE_NAME="";
								if(rccList[i].SUPPLIER_NAME==null)  rccList[i].SUPPLIER_NAME="";
								if(rccList[i].RECEIVE_EMP==null)  rccList[i].RECEIVE_EMP="";
								if(rccList[i].RECEIVE_TIME==null)  rccList[i].RECEIVE_TIME="";
								//if(rccList[i].WRD_UPLOAD_FLAG==null)  rccList[i].WRD_UPLOAD_FLAG="";
									if(rccList[i].WRD_UPLOAD_FLAG=="Y"){
										tempFlag="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
									}else{
										tempFlag="<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
									}
								if(rccList[i].WRD_UPLOAD_TIME==null)  rccList[i].WRD_UPLOAD_TIME="";
								
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tbody:last").append("<tr id='tr2_"+i+"' ></tr>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03  tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								//$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
							    //$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:200px;text-align: center;' title='"+rccList[i].DATAAUTH+"'>"+rccList[i].DATAAUTH+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='text-align: center;width:200px;' title='"+rccList[i].DATAAUTH+"'>"+rccList[i].DATAAUTH+"<input type='hidden' id='DATA_AUTH_ID_"+rccList[i].ID+"' value='"+rccList[i].DATAAUTH+"' /></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:250px;text-align: center;' title='"+rccList[i].WRD_ITEM_SN+"'><span onclick='itemJump3(\""+rccList[i].WRD_ITEM_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WRD_ITEM_SN+"</span></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;' title='"+rccList[i].WRD_ITEM_CODE+"'><span onclick='itemJump4(\""+rccList[i].WRD_ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WRD_ITEM_CODE+"</span></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: center;' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: center;' title='"+rccList[i].CI_ITEM_SPEC+"'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:90px;text-align: right;' title='"+rccList[i].WRD_RECEIVE_NUM+"'>"+rccList[i].WRD_RECEIVE_NUM+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:70px;text-align: right;' title='"+rccList[i].WRD_SPLIT_NUM+"'>"+rccList[i].WRD_SPLIT_NUM+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:70px;text-align: right;' title='"+rccList[i].WRD_ITEM_SEQ+"'>"+rccList[i].WRD_ITEM_SEQ+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:150px;' title='"+rccList[i].WRD_CONNECT_DOC+"'><span onclick='itemJump5(\""+rccList[i].WRD_CONNECT_DOC+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WRD_CONNECT_DOC+"</span></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:110px;' title='"+rccList[i].WRD_FIRST_SN+"'>"+rccList[i].WRD_FIRST_SN+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:110px;' title='"+rccList[i].WRD_SECOND_SN+"'>"+rccList[i].WRD_SECOND_SN+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:110px;' title='"+rccList[i].WRD_THIRD_SN+"'>"+rccList[i].WRD_THIRD_SN+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:110px;' title='"+rccList[i].WRD_FOURTH_SN+"'>"+rccList[i].WRD_FOURTH_SN+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='width:110px;' title='"+rccList[i].WH_NAME+"'>"+rccList[i].WH_NAME+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-16' style='width:110px;' title='"+rccList[i].STORAGE_NAME+"'>"+rccList[i].STORAGE_NAME+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-17' style='width:110px;' title='"+rccList[i].SUPPLIER_NAME+"'>"+rccList[i].SUPPLIER_NAME+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-18' style='width:90px;text-align: center;' title='"+rccList[i].RECEIVE_EMP+"'>"+rccList[i].RECEIVE_EMP+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-19' style='width:130px;' title='"+rccList[i].RECEIVE_TIME+"'>"+rccList[i].RECEIVE_TIME+"</td>");
								//$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-20' style='width:70px;'>"+rccList[i].WRD_UPLOAD_FLAG+"</td>");
								$("#datagrid-btable-ajaxbb156a44e6e242a885b3fde9386fd502 tr:last").append("<td class='datagrid-cell datagrid-cell-20' style='width:70px;text-align: center;' title=''>"+tempFlag+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-21' style='width:150px; title='"+rccList[i].WRD_UPLOAD_TIME+"'>"+rccList[i].WRD_UPLOAD_TIME+"</td>");
							}
						}
						pageFun(data.ajaxPage,"formId3");
							var tableTrJs = $("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tbody tr");
							_tongLineColor(tableTrJs);
							//clickTr('itemDetail');
							defTableWidthRewrite('7b5230d9dda44e8cadb18aa7137d1a03');
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//详细信息分页  buss/bussModel_exeFunc.ms?FUNC_CODE=F6723&funcMId=88beb5544f904338978860e84a53dbdd
var paginationImpl = {};
function searchSecondItem(paginationImpl){
	var isFirstLoad = firstLoadThisPage(paginationImpl);
    	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
    	var dataAuth = $("#DATA_AUTH").val();
	var itemCode = $.trim($("#WRI_ITEM_CODE_SHOW").val());
	var docNum = $.trim($("#WRI_DOC_NUM").val());
//	var supCode = $(document.getElementById('T2#WRD_SUP_CODE')).val();
var supCode = $.trim($(document.getElementById('T3#SUPPLIER_NAME')).val());
	var connectDoc = $.trim($("#WRI_CONNECT_DOC").val());
	var itemStatus = $("#WRI_STATUS").val();
var beginTime = $(document.getElementById('T2#WRD_CREATE_TIME_BEGIN')).val();
	// var beginTime = $('T2#WPD_DELIVERY_DATE_BEGIN').val();
	var endTime = $(document.getElementById('T2#WRD_CREATE_TIME_END')).val();
	/*var beginTime = $(document.getElementById('T2#WPD_DELIVERY_DATE_BEGIN')).val();
	var endTime = $(document.getElementById('T2#WPD_DELIVERY_DATE_END')).val();
	+"&paraMap.beginTime="+beginTime+"&paraMap.endTime="+beginTime
	*/
    	util.showLoading("处理中...");
    	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: "buss/bussModel_exeFunc.ms?funcMId=88beb5544f904338978860e84a53dbdd",//VM-采购入库管理 操作功能 物料信息分页
			    data:{
			        "beginTime":beginTime,
			        "endTime":endTime,
			        "paraMap.type":"1",
			        "paraMap.itemStatus":itemStatus,
			        "paraMap.itemCode":itemCode,
			        "paraMap.dataAuth":dataAuth,
			        "paraMap.docNum":docNum,
			        "paraMap.supCode":supCode,
			        "paraMap.connectDoc":connectDoc,
			        "paraMap.docType":"DJ02",
			        "page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			        "page.pageRecord":_GLO_FORM_PAGE_MAP[paginationImpl].pageRecord 
			    },
			    //data: "paraMap.type=1&paraMap.itemStatus="+itemStatus+"&paraMap.itemCode="+itemCode+"&paraMap.dataAuth="+dataAuth+"&paraMap.docNum="+docNum+"&paraMap.supCode="+supCode+"&paraMap.connectDoc="+connectDoc+"&paraMap.docType=DJ02"+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				success: function(data){
				                 
						util.closeLoading();
						$("#addSecondItemDetail").empty();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							for(var i = 0;i < rccList.length; i++){	
							    if(rccList[i].DATAAUTH==null) 	   rccList[i].DATAAUTH="";
                                if(rccList[i].CI_ITEM_NAME==null)  rccList[i].CI_ITEM_NAME="";
								if(rccList[i].CI_ITEM_SPEC==null)  rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].WRD_SPLIT_NUM==null)  rccList[i].WRD_SPLIT_NUM="";
								if(rccList[i].WRD_CONNECT_DOC==null)  rccList[i].WRD_CONNECT_DOC="";
								if(rccList[i].WRD_FIRST_SN==null)  rccList[i].WRD_FIRST_SN="";
								if(rccList[i].WRD_SECOND_SN==null)  rccList[i].WRD_SECOND_SN="";
								if(rccList[i].WRD_THIRD_SN==null)  rccList[i].WRD_THIRD_SN="";
								if(rccList[i].WRD_FOURTH_SN==null)  rccList[i].WRD_FOURTH_SN="";
								if(rccList[i].WH_NAME==null)  rccList[i].WH_NAME="";
								if(rccList[i].STORAGE_NAME==null)  rccList[i].STORAGE_NAME="";
								if(rccList[i].SUPPLIER_NAME==null)  rccList[i].SUPPLIER_NAME="";
								if(rccList[i].RECEIVE_EMP==null)  rccList[i].RECEIVE_EMP="";
								if(rccList[i].RECEIVE_TIME==null)  rccList[i].RECEIVE_TIME="";
								//if(rccList[i].WRD_UPLOAD_FLAG==null)  rccList[i].WRD_UPLOAD_FLAG="";
									if(rccList[i].WRD_UPLOAD_FLAG=="Y"){
										tempFlag="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
									}else{
										tempFlag="<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
									}
								if(rccList[i].WRD_UPLOAD_TIME==null)  rccList[i].WRD_UPLOAD_TIME="";
							
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tbody:last").append("<tr id='tr2_"+i+"' ></tr>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								//$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
								//$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:200px;text-align: center;' title='"+rccList[i].DATAAUTH+"'>"+rccList[i].DATAAUTH+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='text-align: center;width:200px;' title='"+rccList[i].DATAAUTH+"'>"+rccList[i].DATAAUTH+"<input type='hidden' id='DATA_AUTH_ID_"+rccList[i].ID+"' value='"+rccList[i].DATAAUTH+"' /></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:250px;text-align: center;' title='"+rccList[i].WRD_ITEM_SN+"'><span onclick='itemJump3(\""+rccList[i].WRD_ITEM_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WRD_ITEM_SN+"</span></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;' title='"+rccList[i].WRD_ITEM_CODE+"'><span onclick='itemJump4(\""+rccList[i].WRD_ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WRD_ITEM_CODE+"</span></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: center;' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: center;' title='"+rccList[i].CI_ITEM_SPEC+"'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:90px;text-align: right;' title='"+rccList[i].WRD_RECEIVE_NUM+"'>"+rccList[i].WRD_RECEIVE_NUM+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:70px;text-align: right;' title='"+rccList[i].WRD_SPLIT_NUM+"'>"+rccList[i].WRD_SPLIT_NUM+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:70px;text-align: right;' title='"+rccList[i].WRD_ITEM_SEQ+"'>"+rccList[i].WRD_ITEM_SEQ+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:150px;' title='"+rccList[i].WRD_CONNECT_DOC+"'><span onclick='itemJump5(\""+rccList[i].WRD_CONNECT_DOC+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WRD_CONNECT_DOC+"</span></td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:110px;' title='"+rccList[i].WRD_FIRST_SN+"'>"+rccList[i].WRD_FIRST_SN+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:110px;' title='"+rccList[i].WRD_SECOND_SN+"'>"+rccList[i].WRD_SECOND_SN+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width:110px;' title='"+rccList[i].WRD_THIRD_SN+"'>"+rccList[i].WRD_THIRD_SN+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width:110px;' title='"+rccList[i].WRD_FOURTH_SN+"'>"+rccList[i].WRD_FOURTH_SN+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='width:110px;' title='"+rccList[i].WH_NAME+"'>"+rccList[i].WH_NAME+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-16' style='width:110px;' title='"+rccList[i].STORAGE_NAME+"'>"+rccList[i].STORAGE_NAME+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-17' style='width:110px;' title='"+rccList[i].SUPPLIER_NAME+"'>"+rccList[i].SUPPLIER_NAME+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-18' style='width:90px;text-align: center;' title='"+rccList[i].RECEIVE_EMP+"'>"+rccList[i].RECEIVE_EMP+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-19' style='width:130px;' title='"+rccList[i].RECEIVE_TIME+"'>"+rccList[i].RECEIVE_TIME+"</td>");
								//$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-20' style='width:70px;'>"+rccList[i].WRD_UPLOAD_FLAG+"</td>");
								$("#datagrid-btable-ajaxbb156a44e6e242a885b3fde9386fd502 tr:last").append("<td class='datagrid-cell datagrid-cell-20' style='width:70px;text-align: center;' title=''>"+tempFlag+"</td>");
								$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-21' style='width:150px;  title='"+rccList[i].WRD_UPLOAD_TIME+"'>"+rccList[i].WRD_UPLOAD_TIME+"</td>");
							}
						}
						pageFun(data.ajaxPage,"formId3");
							var tableTrJs = $("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tbody tr");
							_tongLineColor(tableTrJs);
							//clickTr('itemDetail');
							defTableWidthRewrite('7b5230d9dda44e8cadb18aa7137d1a03');
						
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

    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='7b5230d9dda44e8cadb18aa7137d1aa4'){<%--FM-入库单物料信息--%>
    $('.scroll2').mCustomScrollbar("destroy");

        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' onclick=\"showItemDetail('"+v.ID+"');\"  style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            //getRelColVal(arrHtml,v,colNo);
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
           // arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
          //  arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
          //  arrHtml.push("</td>");
            //arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")		
	        //arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID' value='"+v['DATA_AUTH_ID']+"' />")		
	        //arrHtml.push("</td>");
	        //arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")		
	        //arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")		
	       // arrHtml.push("</td>");
	       //arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
           // arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID' value='"+v['DATA_AUTH_ID']+"' />")
           // arrHtml.push("</td>");
           arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /> ");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_DOC_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WRI_DOC_NUM')+"' style='width:150px;"+ms.tdStyle(formId, 'WRI_DOC_NUM')+"' "+ms.tdEvent(formId, 'WRI_DOC_NUM')+">")
            arrHtml.push("<span colno='WRI_DOC_NUM' class='"+ms.uiClass(formId, 'WRI_DOC_NUM')+"' style='"+ms.uiStyle(formId, 'WRI_DOC_NUM')+"' "+ms.uiEvent(formId, 'WRI_DOC_NUM')+" title='"+ms.titleAttr(formId,'WRI_DOC_NUM','IS_TITLE_ATTR',v)+"' >"+v['WRI_DOC_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WRI_ITEM_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'WRI_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WRI_ITEM_CODE')+">")
            arrHtml.push("<span colno='WRI_ITEM_CODE' class='"+ms.uiClass(formId, 'WRI_ITEM_CODE')+"' onclick='itemJump4(\""+v['WRI_ITEM_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WRI_ITEM_CODE')+" title='"+ms.titleAttr(formId,'WRI_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['WRI_ITEM_CODE']+"</span>")
            arrHtml.push("<input type='hidden' id='ITEM_CODE_"+v.ID+"' value='"+v['WRI_ITEM_CODE']+"' /></td>");
            arrHtml.push("<td colno='T2#WRD_ERP_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'T2#WRD_ERP_FLAG')+"' style='width:110px;text-align:center;"+ms.tdStyle(formId, 'T2#WRD_ERP_FLAG')+"' "+ms.tdEvent(formId, 'T2#WRD_ERP_FLAG')+">")
            arrHtml.push("<span colno='T2#WRD_ERP_FLAG' class='"+ms.uiClass(formId, 'T2#WRD_ERP_FLAG')+"' style='"+ms.uiStyle(formId, 'T2#WRD_ERP_FLAG')+"' "+ms.uiEvent(formId, 'T2#WRD_ERP_FLAG')+" title='"+ms.titleAttr(formId,'T2#WRD_ERP_FLAG','IS_TITLE_ATTR',v)+"' >"+v['T2#WRD_ERP_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#WRD_URGENT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'T2#WRD_URGENT_FLAG')+"' style='width:110px;text-align:center;"+ms.tdStyle(formId, 'T2#WRD_URGENT_FLAG')+"' "+ms.tdEvent(formId, 'T2#WRD_URGENT_FLAG')+">")
            arrHtml.push("<span colno='T2#WRD_URGENT_FLAG' class='"+ms.uiClass(formId, 'T2#WRD_URGENT_FLAG')+"' style='"+ms.uiStyle(formId, 'T2#WRD_URGENT_FLAG')+"' "+ms.uiEvent(formId, 'T2#WRD_URGENT_FLAG')+" title='"+ms.titleAttr(formId,'T2#WRD_URGENT_FLAG','IS_TITLE_ATTR',v)+"' >"+v['T2#WRD_URGENT_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'WRI_STATUS')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'WRI_STATUS')+"' "+ms.tdEvent(formId, 'WRI_STATUS')+">")
            arrHtml.push("<span colno='WRI_STATUS' class='"+ms.uiClass(formId, 'WRI_STATUS')+"' style='"+ms.uiStyle(formId, 'WRI_STATUS')+"' "+ms.uiEvent(formId, 'WRI_STATUS')+" title='"+ms.titleAttr(formId,'WRI_STATUS','IS_TITLE_ATTR',v)+"' >"+v['WRI_STATUS']+"</span>")
            arrHtml.push("<input type='hidden' id='state_"+v.ID+"' value='"+v['WRD_STATUS']+"'></td>");
            arrHtml.push("<td colno='WRI_PLAN_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WRI_PLAN_NUM')+"' style='width:70px;text-align:right;"+ms.tdStyle(formId, 'WRI_PLAN_NUM')+"' "+ms.tdEvent(formId, 'WRI_PLAN_NUM')+">")
            arrHtml.push("<span colno='WRI_PLAN_NUM' class='"+ms.uiClass(formId, 'WRI_PLAN_NUM')+"' style='"+ms.uiStyle(formId, 'WRI_PLAN_NUM')+"' "+ms.uiEvent(formId, 'WRI_PLAN_NUM')+" title='"+ms.titleAttr(formId,'WRI_PLAN_NUM','IS_TITLE_ATTR',v)+"' >"+v['WRI_PLAN_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_GIFT_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WRI_GIFT_NUM')+"' style='width:70px;text-align:right;"+ms.tdStyle(formId, 'WRI_GIFT_NUM')+"' "+ms.tdEvent(formId, 'WRI_GIFT_NUM')+">")
            arrHtml.push("<span colno='WRI_GIFT_NUM' class='"+ms.uiClass(formId, 'WRI_GIFT_NUM')+"' style='"+ms.uiStyle(formId, 'WRI_GIFT_NUM')+"' "+ms.uiEvent(formId, 'WRI_GIFT_NUM')+" title='"+ms.titleAttr(formId,'WRI_GIFT_NUM','IS_TITLE_ATTR',v)+"' >"+v['WRI_GIFT_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_RECEIVE_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WRI_RECEIVE_NUM')+"' style='width:70px;text-align:right;"+ms.tdStyle(formId, 'WRI_RECEIVE_NUM')+"' "+ms.tdEvent(formId, 'WRI_RECEIVE_NUM')+">")
            arrHtml.push("<span colno='WRI_RECEIVE_NUM' class='"+ms.uiClass(formId, 'WRI_RECEIVE_NUM')+"' style='"+ms.uiStyle(formId, 'WRI_RECEIVE_NUM')+"' "+ms.uiEvent(formId, 'WRI_RECEIVE_NUM')+" title='"+ms.titleAttr(formId,'WRI_RECEIVE_NUM','IS_TITLE_ATTR',v)+"' >"+v['WRI_RECEIVE_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_PACK_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WRI_PACK_NUM')+"' style='width:90px;text-align:right;"+ms.tdStyle(formId, 'WRI_PACK_NUM')+"' "+ms.tdEvent(formId, 'WRI_PACK_NUM')+">")
            arrHtml.push("<span colno='WRI_PACK_NUM' class='"+ms.uiClass(formId, 'WRI_PACK_NUM')+"' style='"+ms.uiStyle(formId, 'WRI_PACK_NUM')+"' "+ms.uiEvent(formId, 'WRI_PACK_NUM')+" title='"+ms.titleAttr(formId,'WRI_PACK_NUM','IS_TITLE_ATTR',v)+"' >"+v['WRI_PACK_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_ITEM_SEQ' class='datagrid-cell "+ms.tdClass(formId, 'WRI_ITEM_SEQ')+"' style='width:70px;text-align:right;"+ms.tdStyle(formId, 'WRI_ITEM_SEQ')+"' "+ms.tdEvent(formId, 'WRI_ITEM_SEQ')+">")
            arrHtml.push("<span colno='WRI_ITEM_SEQ' class='"+ms.uiClass(formId, 'WRI_ITEM_SEQ')+"' style='"+ms.uiStyle(formId, 'WRI_ITEM_SEQ')+"' "+ms.uiEvent(formId, 'WRI_ITEM_SEQ')+" title='"+ms.titleAttr(formId,'WRI_ITEM_SEQ','IS_TITLE_ATTR',v)+"' >"+v['WRI_ITEM_SEQ']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_CONNECT_DOC' class='datagrid-cell "+ms.tdClass(formId, 'WRI_CONNECT_DOC')+"' style='width:150px;"+ms.tdStyle(formId, 'WRI_CONNECT_DOC')+"' "+ms.tdEvent(formId, 'WRI_CONNECT_DOC')+">")
            arrHtml.push("<span colno='WRI_CONNECT_DOC' class='"+ms.uiClass(formId, 'WRI_CONNECT_DOC')+"' style='"+ms.uiStyle(formId, 'WRI_CONNECT_DOC')+"' "+ms.uiEvent(formId, 'WRI_CONNECT_DOC')+" title='"+ms.titleAttr(formId,'WRI_CONNECT_DOC','IS_TITLE_ATTR',v)+"' >"+v['WRI_CONNECT_DOC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T6#WDT_TYPE_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T6#WDT_TYPE_NAME')+"' style='width:90px;"+ms.tdStyle(formId, 'T6#WDT_TYPE_NAME')+"' "+ms.tdEvent(formId, 'T6#WDT_TYPE_NAME')+">")
            arrHtml.push("<span colno='T6#WDT_TYPE_NAME' class='"+ms.uiClass(formId, 'T6#WDT_TYPE_NAME')+"' onclick='itemJump1(\""+v['T6#WDT_TYPE_NAME']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'T6#WDT_TYPE_NAME')+" title='"+ms.titleAttr(formId,'T6#WDT_TYPE_NAME','IS_TITLE_ATTR',v)+"' >"+v['T6#WDT_TYPE_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T7#WDO_DISPATCH_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T7#WDO_DISPATCH_NAME')+"' style='width:90px;"+ms.tdStyle(formId, 'T7#WDO_DISPATCH_NAME')+"' "+ms.tdEvent(formId, 'T7#WDO_DISPATCH_NAME')+">")
            arrHtml.push("<span colno='T7#WDO_DISPATCH_NAME' class='"+ms.uiClass(formId, 'T7#WDO_DISPATCH_NAME')+"' style='"+ms.uiStyle(formId, 'T7#WDO_DISPATCH_NAME')+"'  "+ms.uiEvent(formId, 'T7#WDO_DISPATCH_NAME')+" title='"+ms.titleAttr(formId,'T7#WDO_DISPATCH_NAME','IS_TITLE_ATTR',v)+"' >"+v['T7#WDO_DISPATCH_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_WH_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WRI_WH_CODE')+"' style='width:90px;"+ms.tdStyle(formId, 'WRI_WH_CODE')+"' "+ms.tdEvent(formId, 'WRI_WH_CODE')+">")
            arrHtml.push("<span colno='WRI_WH_CODE' class='"+ms.uiClass(formId, 'WRI_WH_CODE')+"' style='"+ms.uiStyle(formId, 'WRI_WH_CODE')+"' "+ms.uiEvent(formId, 'WRI_WH_CODE')+" title='"+ms.titleAttr(formId,'WRI_WH_CODE','IS_TITLE_ATTR',v)+"' >"+v['WRI_WH_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WRI_ITEM_NAME')+"' style='width:150px;"+ms.tdStyle(formId, 'WRI_ITEM_NAME')+"' "+ms.tdEvent(formId, 'WRI_ITEM_NAME')+">")
            arrHtml.push("<span colno='WRI_ITEM_NAME' class='"+ms.uiClass(formId, 'WRI_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'WRI_ITEM_NAME')+"' "+ms.uiEvent(formId, 'WRI_ITEM_NAME')+" title='"+ms.titleAttr(formId,'WRI_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['WRI_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'WRI_ITEM_SPEC')+"' style='width:150px;"+ms.tdStyle(formId, 'WRI_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'WRI_ITEM_SPEC')+">")
            arrHtml.push("<span colno='WRI_ITEM_SPEC' class='"+ms.uiClass(formId, 'WRI_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'WRI_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'WRI_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'WRI_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['WRI_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T3#SUPPLIER_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T3#SUPPLIER_NAME')+"' style='width:150px;"+ms.tdStyle(formId, 'T3#SUPPLIER_NAME')+"' "+ms.tdEvent(formId, 'T3#SUPPLIER_NAME')+">")
            arrHtml.push("<span colno='T3#SUPPLIER_NAME' class='"+ms.uiClass(formId, 'T3#SUPPLIER_NAME')+"' style='"+ms.uiStyle(formId, 'T3#SUPPLIER_NAME')+"' "+ms.uiEvent(formId, 'T3#SUPPLIER_NAME')+" title='"+ms.titleAttr(formId,'T3#SUPPLIER_NAME','IS_TITLE_ATTR',v)+"' >"+v['T3#SUPPLIER_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_DELIVERY_DATE' class='datagrid-cell "+ms.tdClass(formId, 'WRI_DELIVERY_DATE')+"' style='width:110px;text-align:center;"+ms.tdStyle(formId, 'WRI_DELIVERY_DATE')+"' "+ms.tdEvent(formId, 'WRI_DELIVERY_DATE')+">")
            arrHtml.push("<span colno='WRI_DELIVERY_DATE' class='"+ms.uiClass(formId, 'WRI_DELIVERY_DATE')+"' style='"+ms.uiStyle(formId, 'WRI_DELIVERY_DATE')+"' "+ms.uiEvent(formId, 'WRI_DELIVERY_DATE')+" title='"+ms.titleAttr(formId,'WRI_DELIVERY_DATE','IS_TITLE_ATTR',v)+"' >"+v['WRI_DELIVERY_DATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T4#NAME' class='datagrid-cell "+ms.tdClass(formId, 'T4#NAME')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'T4#NAME')+"' "+ms.tdEvent(formId, 'T4#NAME')+">")
            arrHtml.push("<span colno='T4#NAME' class='"+ms.uiClass(formId, 'T4#NAME')+"' style='"+ms.uiStyle(formId, 'T4#NAME')+"' "+ms.uiEvent(formId, 'T4#NAME')+" title='"+ms.titleAttr(formId,'T4#NAME','IS_TITLE_ATTR',v)+"' >"+v['T4#NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#WRD_CREATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'T2#WRD_CREATE_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'T2#WRD_CREATE_TIME')+"' "+ms.tdEvent(formId, 'T2#WRD_CREATE_TIME')+">")
            arrHtml.push("<span colno='T2#WRD_CREATE_TIME' class='"+ms.uiClass(formId, 'T2#WRD_CREATE_TIME')+"' style='"+ms.uiStyle(formId, 'T2#WRD_CREATE_TIME')+"' "+ms.uiEvent(formId, 'T2#WRD_CREATE_TIME')+" title='"+ms.titleAttr(formId,'T2#WRD_CREATE_TIME','IS_TITLE_ATTR',v)+"' >"+v['T2#WRD_CREATE_TIME']+"</span>")
            arrHtml.push("</td>");
            if(i==0){
		        arrHtml.push("<input type='hidden' id='firstItemId' value='"+v.ID+"' />");
	        }
            arrHtml.push("</tr>");
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



function searchReceive(){
    var url = "${path}buss/bussModel_exeFunc.ms?funcMId=8757d5235ac54762b3f57ddfbcedbd3f";//VM-采购入库管理 操作功能 入库信息
    var dataAuth = $("#DATA_AUTH").val();
	var itemCode = $.trim($("#WRI_ITEM_CODE_SHOW").val());
	var docNum = $.trim($("#WRI_DOC_NUM").val());
	//var supCode = $(document.getElementById('T2#WRD_SUP_CODE')).val();
	var supCode = $.trim($(document.getElementById('T3#SUPPLIER_NAME')).val());
	var connectDoc = $.trim($("#WRI_CONNECT_DOC").val());
	var itemStatus = $("#WRI_STATUS").val();
	var beginTime = $(document.getElementById('T2#WRD_CREATE_TIME_BEGIN')).val();
	// var beginTime = $('T2#WPD_DELIVERY_DATE_BEGIN').val();
	var endTime = $(document.getElementById('T2#WRD_CREATE_TIME_END')).val();
	//var endTime = $('T2#WPD_DELIVERY_DATE_END').val();
	
    $.ajax({
        type:"post",
        dataType:"json",
        url:url,
        data:{
            "beginTime":beginTime,
            "endTime":endTime,
            "type":"1",
            "itemStatus":itemStatus,
            "itemCode":itemCode,
            "dataAuth":dataAuth,
            "docNum":docNum,
            "supCode":supCode,
            "connectDoc":connectDoc,
            "docType":"DJ14"
        },
         //data: "beginTime="+beginTime+"&endTime="+endTime+"&type=1&itemStatus="+itemStatus+"&itemCode="+itemCode+"&dataAuth="+dataAuth+"&docNum="+docNum+"&supCode="+supCode+"&connectDoc="+connectDoc+"&docType=DJ14",
		success:function(data){
            if(null==data){
                return;
            }
            var tempType;
            var tempCheck;
            var tempFreeze;
            $("#addReceive").empty();
            if(null!=data.ajaxPage.dataList){
                var list = eval(data.ajaxPage.dataList);
                    for(var i=0; i<list.length;i++){
                        if(list[i].DATA_AUTH==null) list[i].DATA_AUTH="";
                        if(list[i].WRD_DOC_NUM==null) list[i].WRD_DOC_NUM="";
                        if(list[i].WRD_DOC_TYPE==null) list[i].WRD_DOC_TYPE="";
                        if(list[i].WRD_STATUS==null) tempType="";
                        if(list[i].WRD_STATUS==1) {tempType="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:60px'>开立</span>";}
						if(list[i].WRD_STATUS==2) {tempType="<span class='state' style='background-color:#00a0e9;color:#FFFFFF;width:60px'>操作中</span>";}
					    if(list[i].WRD_STATUS==3) {tempType="<span class='state' style='background-color:#aeaeae;color:#FFFFFF;width:60px'>关结</span>";}
					    if(list[i].WRD_ERP_FLAG==null) tempCheck="";
						if(list[i].WRD_ERP_FLAG=='Y') tempCheck="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
						if(list[i].WRD_ERP_FLAG=='N') tempCheck="<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
						if(list[i].WRD_URGENT_FLAG==null) tempFreeze="";
						if(list[i].WRD_URGENT_FLAG=='Y') tempFreeze="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
						if(list[i].WRD_URGENT_FLAG=='N') tempFreeze="<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
                        if(list[i].WRD_ERP_SYN_TIMES==null) list[i].WRD_ERP_SYN_TIMES="";
                        if(list[i].CUSTOMER==null) list[i].CUSTOMER="";
                        if(list[i].SUPPLIER_NAME==null) list[i].SUPPLIER_NAME="";
                        if(list[i].DELIVERY_DATE==null) list[i].DELIVERY_DATE="";
                        if(list[i].RECEIVE_TIME==null) list[i].RECEIVE_TIME="";
                        if(list[i].CREATE_MAN==null) list[i].CREATE_MAN="";
                        if(list[i].CREATE_TIME==null) list[i].CREATE_TIME="";
                        if(list[i].CLOSE_MAN==null) list[i].CLOSE_MAN="";
                        if(list[i].CLOSE_TIME==null) list[i].CLOSE_TIME="";
                        if(list[i].WRD_CLOSE_REASON==null) list[i].WRD_CLOSE_REASON="";
                        if(list[i].WRD_MEMO==null) list[i].WRD_MEMO="";
                          if(list[i].WDT_TYPE_NAME==null) list[i].WDT_TYPE_NAME="";
                        //$("#addReceive ").append("<tr id='trr"+(i+1)+"' ></tr>");
                       // if(i!=0 && list[i].WRD_DOC_NUM!=list[i-1].WRD_DOC_NUM ){
                        $("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a04 tbody").append("<tr id='"+list[i].WRD_DOC_NUM+"' ondblclick='dblClickShowDetail(this.id)' ></tr>");
                        $("#addReceive  tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
						$("#addReceive tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' class='_selectdata' value='"+list[i].ID+"' name='isSelect3'/></td>");
						$("#addReceive tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='text-align: center;width:200px;' title='"+list[i].DATA_AUTH+"'>"+list[i].DATA_AUTH+"<input type='hidden' id='DATA_AUTH_ID_"+list[i].ID+"' value='"+list[i].DATA_AUTH2+"' /></td>");
						$("#addReceive tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='text-align: left;width:140px;' title='"+list[i].WRD_DOC_NUM+"'>"+list[i].WRD_DOC_NUM+"</td>");
						$("#addReceive tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='text-align: center;width:100px;' title='"+list[i].WDT_TYPE_NAME+"'><span onclick='itemJump1(\""+list[i].WDT_TYPE_NAME+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+list[i].WDT_TYPE_NAME+"</span></td>");
						$("#addReceive tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='text-align: center;width:90px;' >"+tempType+"<input type='hidden' id='state_"+list[i].WRD_DOC_NUM+"' value='"+list[i].WRD_STATUS+"'></td>");
						$("#addReceive tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='text-align: center;width:90px;' >"+tempCheck+"</td>");
						$("#addReceive tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='text-align: center;width:90px;' >"+tempFreeze+"</td>");
                        $("#addReceive tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='text-align: left;width:110px;' >"+list[i].SUPPLIER_NAME+"</td>");
						$("#addReceive tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='text-align: center;width:140px;' >"+list[i].DELIVERY_DATE+"</td>");
						$("#addReceive tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='text-align: center;width:110px;' >"+list[i].CREATE_MAN+"</td>");
						$("#addReceive tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='text-align: center;width:140px;' >"+list[i].CREATE_TIME+"</td>");
						$("#addReceive tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='text-align: center;width:110px;' >"+list[i].CLOSE_MAN+"</td>");
						$("#addReceive tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='text-align: center;width:140px;' >"+list[i].CLOSE_TIME+"</td>");
						
					
						$("#addReceive tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='text-align: left;width:210px;' >"+list[i].WRD_MEMO+"</td>");
                      //  }
                        
                    }
            }
            pageFun(data.ajaxPage,"formId4");
							var tableTrJs = $("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a04 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('addReceive');
							defTableWidthRewrite('7b5230d9dda44e8cadb18aa7137d1a04');
        },
        error:function(msg){
            	utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
        }
    })
	
}
var paginationImpl = {};
function SearchReceiveItem(paginationImpl,url){
    var isFirstLoad = firstLoadThisPage(paginationImpl);
    	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
    	var dataAuth = $("#DATA_AUTH").val();
	var itemCode = $.trim($("#WRI_ITEM_CODE_SHOW").val());
	var docNum = $.trim($("#WRI_DOC_NUM").val());
	//var supCode = $(document.getElementById('T2#WRD_SUP_CODE')).val();
	var supCode = $.trim($(document.getElementById('T3#SUPPLIER_NAME')).val());
	var connectDoc = $.trim($("#WRI_CONNECT_DOC").val());
	var itemStatus = $("#WRI_STATUS").val();
var beginTime = $(document.getElementById('T2#WRD_CREATE_TIME_BEGIN')).val();
	// var beginTime = $('T2#WPD_DELIVERY_DATE_BEGIN').val();
	var endTime = $(document.getElementById('T2#WRD_CREATE_TIME_END')).val();

    $.ajax({
        type:"post",
        dataType:"json",
        url:url,
        data:{
            "beginTime":beginTime,
            "endTime":endTime,
            "type":"1",
            "itemStatus":itemStatus,
            "itemCode":itemCode,
            "dataAuth":dataAuth,
            "docNum":docNum,
            "supCode":supCode,
            "connectDoc":connectDoc,
            "docType":"DJ14",
            "page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
            "page.pageRecord": _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
        },
        //data: "beginTime="+beginTime+"&endTime="+endTime+"&type=1&itemStatus="+itemStatus+"&itemCode="+itemCode+"&dataAuth="+dataAuth+"&docNum="+docNum+"&supCode="+supCode+"&connectDoc="+connectDoc+"&docType=DJ14"+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
		success:function(data){
            if(null==data){
                return;
            }
            var tempType;
            var tempCheck;
            var tempFreeze;
            $("#addReceive").empty();
            if(null!=data.ajaxPage.dataList){
                var list = eval(data.ajaxPage.dataList);
                    for(var i=0; i<list.length;i++){
                        if(list[i].DATA_AUTH==null) list[i].DATA_AUTH="";
                        if(list[i].WRD_DOC_NUM==null) list[i].WRD_DOC_NUM="";
                        if(list[i].WRD_DOC_TYPE==null) list[i].WRD_DOC_TYPE="";
                        if(list[i].WRD_STATUS==null) tempType="";
                        if(list[i].WRD_STATUS==1) {tempType="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:60px'>开立</span>";}
						if(list[i].WRD_STATUS==2) {tempType="<span class='state' style='background-color:#00a0e9;color:#FFFFFF;width:60px'>操作中</span>";}
					    if(list[i].WRD_STATUS==3) {tempType="<span class='state' style='background-color:#aeaeae;color:#FFFFFF;width:60px'>关结</span>";}
					    if(list[i].WRD_ERP_FLAG==null) tempCheck="";
						if(list[i].WRD_ERP_FLAG=='Y') tempCheck="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
						if(list[i].WRD_ERP_FLAG=='N') tempCheck="<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
						if(list[i].WRD_URGENT_FLAG==null) tempFreeze="";
						if(list[i].WRD_URGENT_FLAG=='Y') tempFreeze="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
						if(list[i].WRD_URGENT_FLAG=='N') tempFreeze="<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
                        if(list[i].WRD_ERP_SYN_TIMES==null) list[i].WRD_ERP_SYN_TIMES="";
                        if(list[i].CUSTOMER==null) list[i].CUSTOMER="";
                        if(list[i].SUPPLIER_NAME==null) list[i].SUPPLIER_NAME="";
                        if(list[i].DELIVERY_DATE==null) list[i].DELIVERY_DATE="";
                        if(list[i].RECEIVE_TIME==null) list[i].RECEIVE_TIME="";
                        if(list[i].CREATE_MAN==null) list[i].CREATE_MAN="";
                        if(list[i].CREATE_TIME==null) list[i].CREATE_TIME="";
                        if(list[i].CLOSE_MAN==null) list[i].CLOSE_MAN="";
                        if(list[i].CLOSE_TIME==null) list[i].CLOSE_TIME="";
                        if(list[i].WRD_CLOSE_REASON==null) list[i].WRD_CLOSE_REASON="";
                        if(list[i].WRD_MEMO==null) list[i].WRD_MEMO="";
                         if(list[i].WDT_TYPE_NAME==null) list[i].WDT_TYPE_NAME="";
                        //$("#addReceive ").append("<tr id='trr"+(i+1)+"' ></tr>");
                       // if(i!=0 && list[i].WRD_DOC_NUM!=list[i-1].WRD_DOC_NUM ){
                        $("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a04 tbody").append("<tr id='"+list[i].WRD_DOC_NUM+"' ondblclick='dblClickShowDetail(this.id)'  ></tr>");
                        $("#addReceive  tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
						$("#addReceive tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' class='_selectdata' value='"+list[i].ID+"' name='isSelect3'/></td>");
						//$("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a03 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:200px;text-align: center;' title='"+rccList[i].DATA_AUTH+"'>"+rccList[i].DATA_AUTH+"</td>");
						$("#addReceive tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='text-align: center;width:200px;' title='"+list[i].DATA_AUTH+"'>"+list[i].DATA_AUTH+"<input type='hidden' id='DATA_AUTH_ID_"+list[i].ID+"' value='"+list[i].DATA_AUTH2+"' /></td>");
						$("#addReceive tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='text-align: left;width:140px;' title='"+list[i].WRD_DOC_NUM+"'>"+list[i].WRD_DOC_NUM+"</td>");
						$("#addReceive tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='text-align: center;width:100px;' title='"+list[i].WDT_TYPE_NAME+"'><span onclick='itemJump1(\""+list[i].WDT_TYPE_NAME+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+list[i].WDT_TYPE_NAME+"</span></td>");
						$("#addReceive tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='text-align: center;width:110px;' >"+tempType+"<input type='hidden' id='state_"+list[i].WRD_DOC_NUM+"' value='"+list[i].WRD_STATUS+"'></td>");
						$("#addReceive tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='text-align: center;width:110px;' >"+tempCheck+"</td>");
						$("#addReceive tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='text-align: center;width:90px;' >"+tempFreeze+"</td>");
						$("#addReceive tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='text-align: left;width:110px;' >"+list[i].SUPPLIER_NAME+"</td>");
						$("#addReceive tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='text-align: center;width:140px;' >"+list[i].DELIVERY_DATE+"</td>");
						$("#addReceive tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='text-align: center;width:110px;' >"+list[i].CREATE_MAN+"</td>");
						$("#addReceive tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='text-align: center;width:140px;' >"+list[i].CREATE_TIME+"</td>");
						$("#addReceive tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='text-align: center;width:110px;' >"+list[i].CLOSE_MAN+"</td>");
						$("#addReceive tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='text-align: center;width:140px;' >"+list[i].CLOSE_TIME+"</td>");
						
						
						$("#addReceive tr:last").append("<td class='datagrid-cell datagrid-cell-16' style='text-align: left;width:210px;' >"+list[i].WRD_MEMO+"</td>");
                  //  }
                            
                        }
            }
            pageFun(data.ajaxPage,"formId4");
							var tableTrJs = $("#datagrid-btable-ajax7b5230d9dda44e8cadb18aa7137d1a04 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('addReceive');
							defTableWidthRewrite('7b5230d9dda44e8cadb18aa7137d1a04');
							$(".head3").scrollLeft(0);
        },
        error:function(msg){
            	utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
        }
    })
	
}



 var  dateId;
function getNumId(docNum,type){
    
    var url = "${path}buss/bussModel_exeFunc.ms?funcMId=1f59dd5e0ac64dab8856d174fa8c2fd7";//VM-其他入库管理 操作功能 获取id
     var trDataAuth=null;
    
    $("#addReceive tr").each(function(seq) {
			if($(this).find(":checkbox").prop("checked")){
			    var trId = $(this).find(":checkbox._selectdata").val();
				console.log("trId:"+trId);
				trDataAuth = $("#DATA_AUTH_ID_"+trId).val();
				console.log("trDataAuth:"+trDataAuth);
			}
		});
    $.ajax({
        type:"post",
        dataType:"json",
        url:url,
        data:{
           "docNum":docNum,
        },
        success:function(data){
            if(null==data){
                return;
            }
            if(null!=data.ajaxList){
                var list = eval(data.ajaxList);
                dateId= list[0].ID;
            }
            if(type==1){
                 var url = "${path}buss/bussModel_exeFunc.ms?FUNC_CODE=F6714&funcMId=0234b134718147d6bec4476ec2858190&formId=7b5230d9dda44e8cadb18aa7137d1aa4&dataId="+dateId+"&iframeId="+_currentFrame;			
            
                showPopWinFp(url, 1200, 550,null,document.title+ "<dict:lang value="修改" />"); 
            }else if(type==3){
                var url = "${path}buss/bussModel_exeFunc.ms?FUNC_CODE=F6733&funcMId=e3900a62efbf439b888a523e47c94ddf&formId=7b5230d9dda44e8cadb18aa7137d1aa4&dataId="+dateId+"&trDataAuth="+trDataAuth+"&iframeId="+_currentFrame;			
            
               // var url = "${path}buss/bussModel_exeFunc.ms?FUNC_CODE=F6775&funcMId=9a18e622bd6a46d4909c47bcc683227f&formId=9a18e622bd6a46d4909c47bcc683227f&dataId="dateId+"&iframeId="+_currentFrame;
                showPopWinFp(url, 1200, 550,null,document.title+"<dict:lang value="查看" />");    

            }
           
              //  showPopWinFp(url, 900, 600,null,document.title+"%{getText("修改")}");
        },
        error:function(msg){
            	utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
        }
    })
    
}
function searchReceiveItem(paginationImpl){
    var url = "${path}buss/bussModel_exeFunc.ms?funcMId=8757d5235ac54762b3f57ddfbcedbd3f";//VM-采购入库管理 操作功能 入库信息
	SearchReceiveItem(paginationImpl,url);
	//SearchItemInfo(paginationImpl,url);
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

function searchItemInfo(paginationImpl){
    var url = "${path}buss/bussModel_exeFunc.ms?funcMId=88beb5544f904338978860e84a53dbdd";//VM-采购入库管理 操作功能 物料信息分页
	SearchItemInfo(paginationImpl,url);
	SearchItemInfo(paginationImpl,url);
}
var checkedIds= [];//保存选中的id，亦适用于分页

	        
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
				$("#"+trId).css("background-color","#a0c8e5");
			}
		});
		
		  $("#"+tableId+" tr input[type=checkbox]").click(function(e) {
			  e.stopPropagation();
			  var style = $(this).parents("tr").attr("style");
			  if(style && style.indexOf("background-color") > -1){
				  $(this).parents("tr").css("background-color","");
			  }else{
				  $(this).parents("tr").css("background-color","#a0c8e5");
			  }
		  });
		}
		
</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//单据配置
function itemJump1(obj){
      winOptMethod.jump("5ae9940df103418ea8badc0d07d006f6","F6529","jumpId",obj);
}  


//仓库单据信息
function itemJump2(obj){
    winOptMethod.jump("f4c3cfb840234a24b5ac7135d783b7e3","F7011","jumpId",obj);
} 

//物料追溯
function itemJump3(obj){
    winOptMethod.jump("0b0276d9a6e3422592e30a48ad93b418","F10790","jumpId",obj);
} 
//物料信息
function itemJump4(obj){
  winOptMethod.jump("15e211df6f9d435088ad89c31837ef5f","F3428","jumpId",obj);
} 

//采购管理
function itemJump5(obj){
  winOptMethod.jump("3465c822bb554b43af180b6def3cd860","F6646","jumpId",obj);
} 



</script>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll','.head');
    //setPopScroll('.scroll2','.head2');
    setPopScroll('.scroll1','.head1');
    setPopScroll('.scroll3','.head3');
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
