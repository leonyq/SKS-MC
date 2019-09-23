<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="修改" /></title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
 
    <!-- 产品静态资源 -->

</head>
<body>
	<div class="edit">
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
                <div style="margin-left:40px;">
	               <s:if test="${isDataAuth == '1'}">
		               <span class="dot">*</span><dict:lang value="组织机构" />
		               <s:if test="${fn:length(deptLs)==1}">
		                   	<s:select list="deptLs" listKey="id" listValue="name" name="paraMapObj._DATA_AUTH" 
							id="deptLs_data_auth"  cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
		               </s:if>
		               <s:else>
		                	<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
							listKey="id" listValue="name"   name="paraMapObj._DATA_AUTH"
							id="deptLs_data_auth"  cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
				  		</s:else>
     				</s:if>	
               </div>
			    	<div class="optn">
			    	        <button type="button" onclick="editCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        				
			    </div>

			</div>
			<div class="bd" style="height:534px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="0900df53f0aa452cb6dd0703012fdaef" type="edit" />
	<div class="mod">
        <div class="mod-hd">		
          <h3 class="tit"><dict:lang value="基本信息" /></h3>	
          </div>	
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="0900df53f0aa452cb6dd0703012fdaef" />
	<input type="hidden" name="formId" id="formId3" value='123456'/>
	<input type="hidden" name="0900df53f0aa452cb6dd0703012fdaef" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" id="id" name="id" value="" />
	<input type="hidden" id="qidDocNum" name="qidDocNum" value="" />
		<s:set name="_$viewId" value="'0c4e2e1903ca40ef8535697de3fa37c1'" />
		<s:set name="_$formId_1" value="'0900df53f0aa452cb6dd0703012fdaef'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" /><bu:uitn colNo="QID_DOC_NUM" formId="0900df53f0aa452cb6dd0703012fdaef" /></td>
			<bu:td cssClass="dec" colNo="QID_DOC_NUM" formId="0900df53f0aa452cb6dd0703012fdaef" ><bu:ui colNo="QID_DOC_NUM" formId="0900df53f0aa452cb6dd0703012fdaef" dataId="${dataId}" formIndex="1" style="width:230px" /></bu:td>
			<td class="name" /><bu:uitn colNo="QID_RECORD_EMP" formId="0900df53f0aa452cb6dd0703012fdaef" /></td>
			<bu:td cssClass="dec" colNo="QID_RECORD_EMP" style="width:230px;" formId="0900df53f0aa452cb6dd0703012fdaef" ><bu:ui colNo="QID_RECORD_EMP" formId="0900df53f0aa452cb6dd0703012fdaef" style="width:230px;border:1px solid rgb(204,204,204)" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QID_COMMENT" formId="0900df53f0aa452cb6dd0703012fdaef" /></td>
			<bu:td cssClass="dec" colNo="QID_COMMENT" formId="0900df53f0aa452cb6dd0703012fdaef"  style="height:80px;" colspan="3" ><bu:ui colNo="QID_COMMENT" style="width:100%;height:100%" formId="0900df53f0aa452cb6dd0703012fdaef" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	    <div class="mod-hd">		
        <h3 class="tit"><dict:lang value="单据明细" /></h3>	
            <div class="extend-btn" id="addDel" style="float: right;margin-top:5px;margin-bottom:5px;">
            	<button type="button" onclick="popPoInfoDiv('addPoInfo','backPoInfo');" style="padding:0;" title="选择IPQC明细">
            		<i class="ico ico-kl-new-add ico-small"></i>
            	</button>
            	<button type="button" onclick="delRow();" style="padding:0" title="删除">
            		<i class="ico ico-sc-new-add ico-small"></i>
            	</button>
            </div>
        </div>
		    
    			<div class="mod" >
    			<div class="mod-bd" style="margin-top:5px;border-bottom: none;">
    				<div class="panel datagrid datagrid-div1">
    					<div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view">
    						<div class="datagrid-header"> <!--min-width:1500px-->
    							<div class="datagrid-header-inner head1"  id="datagrid-header-inner1">
    								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
    										<td class="datagrid-cell" style="width:30px;"></td>
    										<td class="datagrid-cell" style="width:30px;">
    										<input type="checkbox" id="allSelects" name="allSelect" onchange="getAllItems();" />
    										</td>
    										<td class="datagrid-cell" style="width:185px;" ><dict:lang value="项目代码" /></td >
    										<td class="datagrid-cell" style="width:185px;" ><dict:lang value="项目名称" /></td >
    										<td class="datagrid-cell" style="width:185px;" ><dict:lang value="项目类型" /></td >
    										<td class="datagrid-cell" style="width:185px;" ><dict:lang value="检测内容" /></td >
    									</tr>
    									</tbody>		
    								</table>
    							</div>
    						</div>
    						<div class="datagrid-body datagrid-div3 scroll1"   style="height:280px;"><!--min-width:1500px;-->
    								<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
    								<tbody id="addItemInfo" >
    								</tbody>
    							</table>
    						</div>
    					</div>
    				</div>
    			</div>
    		 </div>	
		    </div>
		        <div id="backPoInfo" class="dialog-mask" style="z-index:1029px;"/></div>
		<div class="dialog dialog-s1" id="addPoInfo" style="display:none;z-index:1030;margin-left:10px;left:16px;top:20px;width:750px;height:560px;">
			<div class="dialog-hd">
			<h3 class="tit">
			<dict:lang value="选择IPQC明细" />
			</h3>
			</div>
				<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addPoInfo','backPoInfo');"></a>
				<div class="dialog-bd-div" style="width:100%;height:calc(100% - 37px);">
					<div class="optn optn_div">
      					
			    <button type="button" onclick="addPoInfoList('addPoInfo','backPoInfo');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv1('addPoInfo','backPoInfo');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				<button type="button" onclick="SearchPoInfo('formId3');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
				         </div>
				      
				<table class="basic-table">
				 <tr>
			    		<td class="name" style="text-align:center;width:100px;"/><dict:lang value="项目代码"/></td>
					<td class="dec"><input type="text" id="qiditemCode" name="poCode" class=" input isSubmit isaddSubmit"/></td>
					<td class="name" style="text-align:center;width:100px;"/><dict:lang value="项目名称"/></td>
					<td class="dec"><input type="text" id="qidItemName" name="itemCode1" class=" input isSubmit isaddSubmit"/></td>
					
			    	</tr>
			    	<tr>
					<td class="name" style="width: 100px;text-align: right;"/>
					<dict:lang value="项目类型" />
					</td>
					<bu:td cssClass="dec" colNo="QII_ITEM_TYPE" formId="6c618bbd5f12409f8ebf3e8ffee81395" >
						<bu:ui colNo="QII_ITEM_TYPE" formId="6c618bbd5f12409f8ebf3e8ffee81395" value="%{QII_ITEM_TYPE}" formIndex="1" />
					</bu:td>
				    </tr>
			    	</table>
				<div class="panel-ajax1 datagrid datagrid-div1" style="margin-top:10px;"><!--143-->
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
							<div class="datagrid-header">
							<div class="datagrid-header-inner head2"  id="">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable123456">
									<tbody>
									<tr class="datagrid-header-row thcolor">
									<td style="width: 30px;text-align: center;"></td>
									<td style="width: 30px;text-align: center;"><input type="checkbox" id="po_list_cb"  onchange="getAllPo();" /></td>
									<td style="width: 170px;text-align: center;"><dict:lang value="项目代码" /></td>
									<td style="width: 170px;text-align: center;"><dict:lang value="项目名称" /></td>
									<td style="width: 170px;text-align: center;"><dict:lang value="项目类型" /></td>
									<td style="width: 180px;text-align: center;"><dict:lang value="检测内容" /></td>					
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll2" style="height:350px;"><!--130-->
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax123456" >
								<tbody id="poInfoTbody" >
								</tbody>
							</table>
						</div>
						
					</div>
				</div>
				    <div style="background-color: white;" id="pageDiv1">
                        <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=SearchPoInfo&formId=formId3&showLoading=0" />
                                 </div>		
				</div>
				

	        </div>
			<bu:jsVal formId="0900df53f0aa452cb6dd0703012fdaef" formIndex="1" />
									
			</div>
	</form>	
	</div>
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_11" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<!-- js初始化方法 -->


	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<script type="text/javascript">
	    	$(function(){
	    	    getEditDetailMwssage();
	    	    //addOption();
	    	    $("#paraMapObj_QID_RECORD_EMP").attr("style","border-color:#rgb(204,204,204)");
	    	    $("#paraMapObj_QII_ITEM_TYPE_chosen").attr("style","width:230px;");
	    	    $("#paraMapObj_QII_ITEM_TYPE").attr("class"," input isSubmit _VAL_OjbsData _VAL_DATABASE dept_select");
	    	})
	     function popPoInfoDiv(showId,backId){
           /*if($("#paraMap1_WRD_SUP_CODE").val()==""){
           	utilsFp.confirmIcon(3,"","","", "<dict:lang value="请先选择供应商" />",0,"260","");
           	return;
           }*/		
            addPoInfo();
            $("#qiditemCode").val("");
        	$("#qidItemName").val("");	
            $("#paraMapObj_QII_ITEM_TYPE").val("");	
            $("#paraMap1_QII_ITEM_TYPE").trigger("chosen:updated");
		    $("#"+showId+",#"+backId).show();
			$("#"+showId).draggable({cancel:'.dialog-bd-div'});
			$("#paraMapObj_QII_ITEM_TYPE_chosen").attr("style","width:230px;");
			
        }
        function hideDiv1(showId,backId){
        			$("#"+showId+",#"+backId).hide();
        			closeDivFp(showId+"pop");
        }
    	function hideDiv(showId,backId){
    			$("#"+showId+",#"+backId).hide();
    			closeDivFp(showId+"pop");
        }
        /*
        function addOption(){
	    	    $("#qidItemType").prepend("<option value>--请选择--</option>");
	    	    $("#qidItemType").each(function(){
	    	        $(this).find("Option").eq("").prop("selected",true);
	    	    })
	    	}*/
	    var trCount=0;	
	   function addPoInfo(){
	        var dataAuth=$("#deptLs_data_auth").val();
	        var jsondata = { "dataAuth": dataAuth};
			util.showLoading("处理中...");
			var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=c0971f60979e40159e28196bc5db19b5";//VM-IPQC单据信息-新增 操作功能 获取明细信息
	       $.ajax({
	           type:"post",
	           dataType:"json",
	            data:jsondata,
	           url:loadItemUrl,
	           success:function(data){		
                	util.closeLoading();
                	$("#poInfoTbody").empty();
                	if(null==data){
                	    return;
                	}
                
                	if(null!=data.ajaxPage.dataList){
                	   var rccList = eval(data.ajaxPage.dataList);
                	   for(var i=0;i<rccList.length;i++){
                	        if(rccList[i].ID==null) rccList[i].ID="";
                	       if(rccList[i].QII_ITEM_CODE==null) rccList[i].QII_ITEM_CODE="";
                	       if(rccList[i].QII_ITEM_NAME==null) rccList[i].QII_ITEM_NAME="";
                	       if(rccList[i].QII_ITEM_TYPE==null) rccList[i].QII_ITEM_TYPE="";
                	       if(rccList[i].QII_TEST_CONTENT==null) rccList[i].QII_TEST_CONTENT="";
                	       	    $("#poInfoTbody").append("<tr id='tr2_"+i+"' ></tr>");
								$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"<input type='hidden' id='ID"+(trCount+1)+"' value='"+rccList[i].ID+"'/></td>");
								$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+rccList[i].ID+"' type='checkbox' name='isSelect1'/><input type='hidden' id='QII_ITEM_TYPE"+rccList[i].ID+"' value='"+rccList[i].QII_ITEM_TYPE+"'/></td>");
								$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:170px;text-align: center;' title='"+rccList[i].QII_ITEM_CODE+"'>"+rccList[i].QII_ITEM_CODE+"<input type='hidden' id='QII_ITEM_CODE"+rccList[i].ID+"' value='"+rccList[i].QII_ITEM_CODE+"'/></td>");
								$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:170px;text-align: center;' title='"+rccList[i].QII_ITEM_NAME+"'>"+rccList[i].QII_ITEM_NAME+"<input type='hidden' id='QII_ITEM_NAME"+rccList[i].ID+"' value='"+rccList[i].QII_ITEM_NAME+"'/></td>");
							$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:170px;text-align: center;' title='"+rccList[i].VALUE+"'>"+rccList[i].VALUE+"<input type='hidden' id='VALUE"+rccList[i].ID+"' value='"+rccList[i].VALUE+"'/></td>");
								$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:180px;text-align: center;' title='"+rccList[i].QII_TEST_CONTENT+"'>"+rccList[i].QII_TEST_CONTENT+"<input type='hidden' id='QII_TEST_CONTENT"+rccList[i].ID+"' value='"+rccList[i].QII_TEST_CONTENT+"'/></td>");
								trCount++;
                	   }
                	}
                		pageFun(data.ajaxPage,"formId3");
							var tableTrJs = $("#datagrid-btable-ajax123456 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax123456');
							defTableWidthRewrite("123456");
						
	               
	           },
	           error:function(msg){
	                	util.closeLoading();
	               utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
	           }
	       })
	   }
	   var paginationImpl = {};
	   function SearchPoInfo(paginationImpl,url){
	        var dataAuth=$("#deptLs_data_auth").val();
	        util.showLoading("处理中...");
	       	var isFirstLoad = firstLoadThisPage(paginationImpl);
        	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
        	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
        	var qiditemCode=$("#qiditemCode").val();
        	var qidItemName=$("#qidItemName").val();
        	var qidItemType=$("#paraMapObj_QII_ITEM_TYPE").val();
        	 var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=7320a33b826847198d35d2421462bee0";//VM-IPQC单据信息-新增 操作功能 获取明细信息分页
        	 var jsondata = { "dataAuth": dataAuth,"qiditemCode": qiditemCode, "qidItemName": qidItemName,"qidItemType":qidItemType, "page.currentPage": _GLO_FORM_PAGE_MAP[paginationImpl].currentPage, "page.pageRecord": _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord };
        	 $.ajax({
	           type:"post",
	           dataType:"json",
	            data:jsondata,
	           url:loadItemUrl,
	           success:function(data){		
                	util.closeLoading();
                	$("#poInfoTbody").empty();
                	if(null==data){
                	    return;
                	}
                	
                	if(null!=data.ajaxPage.dataList){
                	   var rccList = eval(data.ajaxPage.dataList);
                	   for(var i=0;i<rccList.length;i++){
                	        if(rccList[i].ID==null) rccList[i].ID="";
                	       if(rccList[i].QII_ITEM_CODE==null) rccList[i].QII_ITEM_CODE="";
                	       if(rccList[i].QII_ITEM_NAME==null) rccList[i].QII_ITEM_NAME="";
                	       if(rccList[i].QII_ITEM_TYPE==null) rccList[i].QII_ITEM_TYPE="";
                	       if(rccList[i].QII_TEST_CONTENT==null) rccList[i].QII_TEST_CONTENT="";
                	       	    $("#poInfoTbody").append("<tr id='tr2_"+((currentPage-1)*pageRecord+(i+1))+"' ></tr>");
								$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"<input type='hidden' id='ID"+(trCount+1)+"' value='"+rccList[i].ID+"'/></td>");
								$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+rccList[i].ID+"' type='checkbox' name='isSelect1'/><input type='hidden' id='QII_ITEM_TYPE"+rccList[i].ID+"' value='"+rccList[i].QII_ITEM_TYPE+"'/></td>");
								$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:170px;text-align: center;' title='"+rccList[i].QII_ITEM_CODE+"'>"+rccList[i].QII_ITEM_CODE+"<input type='hidden' id='QII_ITEM_CODE"+rccList[i].ID+"' value='"+rccList[i].QII_ITEM_CODE+"'/></td>");
								$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:170px;text-align: center;' title='"+rccList[i].QII_ITEM_NAME+"'>"+rccList[i].QII_ITEM_NAME+"<input type='hidden' id='QII_ITEM_NAME"+rccList[i].ID+"' value='"+rccList[i].QII_ITEM_NAME+"'/></td>");
								$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:170px;text-align: center;' title='"+rccList[i].VALUE+"'>"+rccList[i].VALUE+"<input type='hidden' id='VALUE"+rccList[i].ID+"' value='"+rccList[i].VALUE+"'/></td>");
								$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:180px;text-align: center;' title='"+rccList[i].QII_TEST_CONTENT+"'>"+rccList[i].QII_TEST_CONTENT+"<input type='hidden' id='QII_TEST_CONTENT"+rccList[i].ID+"' value='"+rccList[i].QII_TEST_CONTENT+"'/></td>");
								trCount++;
                	   }
                	}
                		pageFun(data.ajaxPage,"formId3");
							var tableTrJs = $("#datagrid-btable-ajax123456 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax123456');
							defTableWidthRewrite("123456");
						
	               
	           },
	           error:function(msg){
	                	util.closeLoading();
	               utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
	           }
	       })
        	
        	
	   }
	   var trrCount=0;
	   //保存选择的采购单
function addPoInfoList(showId,backId){
	var len = $("#addItemInfo tr").length;	
    var tempf = 0;
    var itemCode;
    var itemCode;
    
    
    
	//$("#paraMap1_WRD_SUP_CODE").val(supCode);
	//$("#paraMap1_WRD_SUP_CODE_SHOW").val(supName);
	$("#poInfoTbody :checkbox").each(function(){
			if($(this).attr("checked")){
			       
					if (!$("#trr"+$(this).attr("id")).length) {
				
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='trr"+$(this).attr("id")+"' ></tr>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(len+1)+"</td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:185px;text-align: center;'>"+$("#QII_ITEM_CODE"+$(this).attr("id")).val()+"<input type='hidden'  name='QII_ITEM_CODE' value='"+$("#QII_ITEM_CODE"+$(this).attr("id")).val()+"'/></td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:185px;text-align: center;'>"+$("#QII_ITEM_NAME"+$(this).attr("id")).val()+"<input type='hidden'  name='QII_ITEM_NAME' value='"+$("#QII_ITEM_NAME"+$(this).attr("id")).val()+"'/></td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:185px;text-align: center;'>"+$("#VALUE"+$(this).attr("id")).val()+"<input type='hidden'  name='QII_ITEM_TYPE' value='"+$("#QII_ITEM_TYPE"+$(this).attr("id")).val()+"'/></td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:185px;text-align: center;padding:0;'><input type='text' style='width: 180px;padding:0;text-align: left;' maxlength='200' class='_VAL_NULL input isSubmit' id='PLAN_NUM_"+(trrCount+1)+"' name='QII_TEST_CONTENT' value='"+$("#QII_TEST_CONTENT"+$(this).attr("id")).val()+"'/></td>");
						len = len+1;
						trrCount++;
					var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
					_tongLineColor(tableTrJs);
					clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
					defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
				}
			}
	})
	$("#poInfoTbody").empty();
	
	hideDiv(showId,backId);
	trCount=0;
	$("#po_list_cb").attr("checked",false);
}
	   function getEditDetailMwssage(){
			util.showLoading("处理中...");
			var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=de44c62702d741eda96b4befea81af1e";//VM-IPQC单据信息-修改 操作功能 获取相应的IPQC明细
			var id="${dataId}";
			var dataAuth=$("#deptLs_data_auth").val();
			var jsondata = { "id": id,"dataAuth": dataAuth};
			
	       $.ajax({
	           type:"post",
	           dataType:"json",
	            data:jsondata,
	           url:loadItemUrl,
	           success:function(data){		
                	util.closeLoading();
                	$("#addItemInfo").empty();
                	if(null==data){
                	    return;
                	}
                	
                	if(null!=data.ajaxList){
                	   var rccList = eval(data.ajaxList);
                	   for(var i=0;i<rccList.length;i++){
                	        if(rccList[i].ID==null) rccList[i].ID="";
                	       if(rccList[i].QID_ITEM_CODE==null) rccList[i].QID_ITEM_CODE="";
                	       if(rccList[i].QID_ITEM_NAME==null) rccList[i].QID_ITEM_NAME="";
                	       if(rccList[i].QID_ITEM_TYPE==null) rccList[i].QID_ITEM_TYPE="";
                	       if(rccList[i].VALUE==null) rccList[i].VALUE="";
                	       if(rccList[i].QID_TEST_CONTENT==null) rccList[i].QID_TEST_CONTENT="";
                	       	   $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='trr"+rccList[i].ITEMID+"' ></tr>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:185px;text-align: center;' title='"+rccList[i].QID_ITEM_CODE+"'>"+rccList[i].QID_ITEM_CODE+"<input type='hidden'  name='QII_ITEM_CODE' value='"+rccList[i].QID_ITEM_CODE+"'/></td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:185px;text-align: center;' title='"+rccList[i].QID_ITEM_NAME+"'>"+rccList[i].QID_ITEM_NAME+"<input type='hidden'  name='QII_ITEM_NAME' value='"+rccList[i].QID_ITEM_NAME+"'/></td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:185px;text-align: center;' title='"+rccList[i].VALUE+"'>"+rccList[i].VALUE+"<input type='hidden'  name='QII_ITEM_TYPE' value='"+rccList[i].QID_ITEM_TYPE+"'/></td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:185px;text-align: center;padding:0;' title='"+rccList[i].QID_TEST_CONTENT+"'><input type='text' style='width: 180px;padding:0;text-align: left;' maxlength='200' class='_VAL_NULL input isSubmit' id='PLAN_NUM_"+(trrCount+1)+"' name='QII_TEST_CONTENT' value='"+rccList[i].QID_TEST_CONTENT+"'/></td>");
								trrCount++;
                	   }
                	}
                		
							var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
					_tongLineColor(tableTrJs);
					clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
					defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
						
	               
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
        			//全选
	    function getAllPo(){
		if($("#po_list_cb").attr("checked")=="checked"){
			$("#poInfoTbody :checkbox").attr("checked",true);
		}else{
			$("#poInfoTbody :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	} 	
	function delRow(){
	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 :checkbox").each(function(){
		if($(this).attr("checked")){
			var trid = $(this).parent().parent().attr("id");
			
			$("#"+trid).remove();
		}
	});
	reSort("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
	var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
	_tongLineColor(tableTrJs);
	clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');		        
}
//重新排序
function reSort(objid){
         
         var i = 1;
         $("#"+objid+" tbody tr").each(function(){
         
         $(this).find("td").eq(0).text(i);
         
         i++;
      });
}
	//全选2
     	function getAllItems(){
		if($("#allSelects").attr("checked")=="checked"){
			$("#addItemInfo :checkbox").attr("checked",true);
		}else{
			$("#addItemInfo :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	} 
	function editCal(){
                    if(!val.valNullData()){
				return ;
			}
			if(!valData()){
				return ;
			}
			if(!val.valOjbsData()){
				return ;
			}
				if(!val.valDataBaseSetData()){
                        return ;
                    }
                     
                        var len = $("#addItemInfo tr").length;
                        if(len<=0){
                           //utilsFp.confirmIcon(1,"","","", "%{getText("请至少添加一条物料信息")}",0,"260","");
                           utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少添加一条物料信息" />",0,"260","");
                           return;
                        }
                        $("#qidDocNum").val($("#paraMapObj_QID_DOC_NUM").val());
                        var id="${dataId}";
                        $("#id").val(id);
                        
  document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=37b47b8f8daa4a9bb8385a50106a8af5";
  document.forms.editForm.submit();
}

	</script>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll1','.head1');
    setPopScroll('.scroll2','.head2');
  })
})(jQuery)</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->

