<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="选择物料" /></title>
	<style type="text/css">
	 .datagrid-header,.datagrid-div3{
	       width:100% !important;
	      }
	</style>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>	

<script src="${path}/plf/js/ui/textform/js/jquery.validate.js"></script>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include> 
</head>
<body style="overflow-x:hidden">
	<div class="content-in" >
	<div class="dlist">
            <div class="hd">
                    <input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a2222'/>
			    	<div class="optn">
			    	        <button type="button" onclick="addCal('<%=request.getParameter("groupSn")%>')"><i class="ico ico-save"></i><dict:lang value="提交" /></button>
        					<button type="button" onclick="clearSel();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button class="botton_img_add" onclick="searchItem('formId1');">
											<i class="ico ico-search-new"></i><dict:lang value="查询" />
										</button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			        </div>
			</div>
			<div class="bd" style="height: 520px;">
					<div class="search-box">
					<form id="searchForm" name="searchForm" action="" method="post">
						<table class="search_table">
								<tr>
									<td>
										<div class="group">
											<div class="name" style="width:80px;">料号
											</div>
											<div class="dec">
												<input type="text" id="itemCode" name="itemCode" class="input" style="width:200px;"/>
											</div>
										</div>
									</td>
									<td>
										<div class="group">
											<div class="name" style="width:80px;">物料名称
											</div>
											<div class="dec">
												<input type="text" id="itemName" name="itemName" class="input" style="width:200px;"/>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="group">
											<div class="name" style="width:80px;">物料规格
											</div>
											<div class="dec">
												<input type="text" id="itemSpec" name="itemSpec" class="input" style="width:200px;"/>
											</div>
										</div>
									</td>
								</tr>
								
							</table>
					</form>
				</div>
			<form id="submitForm" name="submitForm" action="" method="post"
					target="submitFrame">
				
		<div class="panel datagrid datagrid-div1">
	         <div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view" style="">
			<div class="datagrid-header">
				<div class="datagrid-header-inner head1" id="datagrid-header-inner">
				<table  class="datagrid-htable fixedTable  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a2222" >
					<tbody>
					<tr class="datagrid-header-row thcolor">
						<td class="datagrid-cell" style="width:30px;" ></td >
						<td class="datagrid-cell" style="width:30px;" ><input type="checkbox" id="allSelect" name="allSelect"/></td >
						<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料料号" /></td >
						<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料名称" /></td >
						<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料规格" /></td >
						<td class="datagrid-cell" style="width:100px;" ><dict:lang value="供应商" /></td >
						<td class="datagrid-cell" style="width:100px;" ><dict:lang value="类型" /></td >
					</tr>
					</tbody>
	          </table>
	 </div>
</div>
								
							
	<div class="datagrid-body datagrid-div3 scroll1" id="datagrid-body" style="height:356px;">
		<table class="datagrid-btable fixedTable" id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a2222">					
					<tbody id="loadItem">	
					
					</tbody>
	</table>
	</div>
	
</div>
</div>
					
</form>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
			<!--</div>-->
			<div style="background-color: white;">
		     <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchItem&formId=formId1&showLoading=0" />
			</div>	
		</div>
		</div>
</div>
	<script type="text/javascript">
		//var _resObj = new Object();
		var parentWindow=top.$("#popupFrameFpId")[0].contentWindow;
		
	
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
		
	function query(thisObj){
		_pageCurrentPageObj.value="1";
		document.forms.searchForm.submit();
		thisObj.onclick = function(){util.alert(util.submit_default_info);}
		util.showTopLoading();
	}
	
	/*function add(){
		setSelectValue();
		if(!temp)
		parent.closePopWinFp('add_itemIdpop');
	}*/
	
	function clearSel(){
	//parent.$(".dialog-close").click();
		//setSelectValue(null);
		parent.closePopWinFp('add_itemIdpop');
	}
	
	
	<%-- 回填选择的值 --%>
	function setSelectValue(url,groupSn){
	    var dataAuth = $("#deptLs_data_auth").val();
	    var k=$("input[name='isSelect1']:checked").length;
	    if(k!=0){
	    util.showTopLoading();
		$("input[name='isSelect1']:checked").each(function(i) { // 遍历选中的checkbox
		
	            var tablerow = $(this).parents("#loadItem tr");  // 获取checkbox所在行
	            var ci_item_code = tablerow.find("[name='ci_item_code']").val();
					$.ajax({
						url:url,
						type:"post",
						data:{"ITEM_CODE":ci_item_code,"groupSn":groupSn,"dataAuth":dataAuth},
						success:function(data){
													
							if(k==i+1){
							   util.closeLoading();
							   parentWindow.location.reload();
							
							   parent.closePopWinFp('add_itemIdpop');
							}
							
							
						},
						error: function(msg){
							util.closeLoading();
							util.alert("error:"+msg);
		  				}
					});
	            
	               
        	 });
            }else{
            	utilsFp.confirmIcon(1,"","","", "<dict:lang value="请至少选择一条数据" />",0,"260","");
            }
	}
	

		//重置	
		function resetForm(){
			$("#searchForm")[0].reset();
		}
				
		
		
		function init(){
		var groups = '<%=request.getParameter("groupSn")%>';
	    var  type = '<%=request.getParameter("type")%>';
	    var dataAuth = $("#deptLs_data_auth").val();


		var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=1d1e690916c34d78b8b9cfe9140bffdf"; 
		util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: loadItemUrl,
			    data: {
                "groups" : groups,
				"type" : type,
				"dataAuth" : dataAuth
                },
			    //"groups="+groups+"&type="+type,
				success: function(data){
						util.closeLoading();
						if(null == data){return ;}
						if(null != data.ajaxPage.dataList){
							var tempType;	
							var rccList = eval(data.ajaxPage.dataList);
							$("#loadItem").empty();
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].SUPPLIER_NAME==null) rccList[i].SUPPLIER_NAME="";
			 					if(rccList[i].CI_ITEM_TYPE!=null){
			 					if(rccList[i].CI_ITEM_TYPE==1){		
			 					        tempType="原料"		;
			 					    
			 					}else if(rccList[i].CI_ITEM_TYPE==2){		
			 					            tempType="半成品";			
                                }else if(rccList[i].CI_ITEM_TYPE==3){		
                                        tempType="成品";
			 							}else{
			 							    tempType="";
			 							}
			 					}else tempType="";
								$("#loadItem").append("<tr id='"+rccList[i].ROWNUM+"' name='"+rccList[i].ROWNUM+"' ></tr>");
								$("#loadItem tr:last").append("<td class='datagrid-cell datagrid-cell-0' style='width: 30px;text-align: center;'>"+(i+1)+"</td>");
								$("#loadItem tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width: 30px;text-align: center;'><input type='checkbox' name='isSelect1' value='"+rccList[i].ROWNUM+"'/></td>");
								$("#loadItem tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width: 150px;'>"+rccList[i].CI_ITEM_CODE+"</td>");
								$("#loadItem tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width: 150px;'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#loadItem tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width: 150px;'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								$("#loadItem tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width: 100px;'>"+rccList[i].SUPPLIER_NAME+"</td>");
								$("#loadItem tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:100px;'>"+tempType+"<input type='hidden' name='ci_item_code' value='"+rccList[i].CI_ITEM_CODE+"'></td>");
							
							}
							pageFun(data.ajaxPage,"formId1");
							var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a2222 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a2222');
								defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a2222");
						}
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
		
		
		$("#allSelect").click(function(){
    			if($("#allSelect").attr("checked") == "checked"){
        			$("input[name='isSelect1']").attr("checked","checked");
        			$('#loadItem input:checkbox').parents("tr").css("background-color","#d3eafc")
    			}else{
        			$("input[name='isSelect1']").removeAttr("checked","checked");
        			$('#loadItem input:checkbox').parents("tr").css("background-color","")
    			}
			});
			<s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
		}
		
		var paginationImpl = {};
		function SearchItem(paginationImpl,url){
		var isFirstLoad = firstLoadThisPage(paginationImpl);
			var currentPage = isFirstLoad ? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
			var pageRecord = isFirstLoad ? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
		var groups = '<%=request.getParameter("groupSn")%>';
		var  type = '<%=request.getParameter("type")%>';
		var itemCode = $.trim($("#itemCode").val());
		var itemName = $.trim($("#itemName").val());
		var itemSpec = $.trim($("#itemSpec").val());
		var dataAuth = $("#deptLs_data_auth").val();
		util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: url,
			    data:{
                "type" : type,	
                "groups" : groups,	
                "paraMap.itemCode" : itemCode,	
                "paraMap.itemName" : itemName,	
                "paraMap.itemSpec" : itemSpec,	
                "page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,	
                "page.pageRecord"  : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
                "dataAuth" :dataAuth
                },
			    //"type="+type+"&groups="+groups+"&paraMap.itemCode="+itemCode+"&paraMap.itemName="+itemName+"&paraMap.itemSpec="+itemSpec+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				success: function(data){
						util.closeLoading();
						$("#loadItem").empty();
						if(null == data){return ;}
						if(null != data.ajaxPage.dataList){
							var tempType;	
							var rccList = eval(data.ajaxPage.dataList);
							
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].SUPPLIER_NAME==null) rccList[i].SUPPLIER_NAME="";
			 					if(rccList[i].CI_ITEM_TYPE!=null){
			 				    if(rccList[i].CI_ITEM_TYPE==1){		
			 					        tempType="原料"		;
			 					    
			 					}else if(rccList[i].CI_ITEM_TYPE==2){		
			 					            tempType="半成品";			
                                }else if(rccList[i].CI_ITEM_TYPE==3){		
                                        tempType="成品";
			 							}else{
			 							    tempType="";
			 							}
			 					}else tempType="";
								$("#loadItem").append("<tr id='"+rccList[i].ROWNUM+"' name='"+rccList[i].ROWNUM+"' ></tr>");
								$("#loadItem tr:last").append("<td class='datagrid-cell datagrid-cell-0' style='width: 30px;text-align: center;'>"+((currentPage - 1) * pageRecord + (i + 1))+"</td>");
								$("#loadItem tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width: 30px;text-align: center;'><input type='checkbox' name='isSelect1' value='"+rccList[i].CI_ITEM_CODE+"'/></td>");
								$("#loadItem tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width: 150px;'>"+rccList[i].CI_ITEM_CODE+"</td>");
								$("#loadItem tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width: 150px;'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#loadItem tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width: 150px;'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								$("#loadItem tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width: 100px;'>"+rccList[i].SUPPLIER_NAME+"</td>");
								$("#loadItem tr:last").append("<td class='datagrid-cell datagrid-cell-6'>"+tempType+"<input type='hidden' name='ci_item_code' value='"+rccList[i].CI_ITEM_CODE+"'></td>");
								
							}
							
							var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a2222 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a2222');
							
						}
						pageFun(data.ajaxPage,"formId1");
							defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a2222");
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
		}
		function searchItem(paginationImpl){
        var url = "	${path}buss/bussModel_exeFunc.ms?funcMId=58f51bed9aba48269aa52133553bac1d"; 
    	SearchItem(paginationImpl,url);
}
function addCal(groupSn){
      var urlDetail = "${path}buss/bussModel_exeFunc.ms?funcMId=0b9a426787ec48c5bed0cdd40814f36f"; 
      setSelectValue(urlDetail,groupSn);
      //parent.closePopWinFp('add_itemIdpop');
}
		
</script>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll1','.head1');
   
  })
})(jQuery)</script>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
<bu:script viewId="d325cb3419504c1b93e2320e336a6cbc" />
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
