<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
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
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- 产品静态资源 -->

</head>
<body>
	<div class="edit">
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
                
			    	<div class="optn">
			    	        
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        				
			    </div>

			</div>
			<div class="bd">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="65324c73fb4340eab7fcd1a57edfee4f" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="65324c73fb4340eab7fcd1a57edfee4f" />
	<input type="hidden" name="65324c73fb4340eab7fcd1a57edfee4f" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'d29ba408ffab44b3ae2521e6b8d9304e'" />
		<s:set name="_$formId_1" value="'65324c73fb4340eab7fcd1a57edfee4f'" />
		<s:set name="_$type" value="'edit'"/>
		
	</table>
	<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view1">
						<div class="datagrid-header" style="width:100%;">
							<div class="datagrid-header-inner head1" style="width:100%;">
								<table  class="datagrid-htable fixedTable  " id="lackInfo1" style="width:100%;">
									<tbody>
									<tr class="datagrid-header-row datagrid-title-ajax">
										<td class="datagrid-cell" style="width:30px;"></td>
										
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料料号" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="需求数量" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="普通货架数量" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="电子货架数量" /></td >
										<td class="datagrid-cell"><dict:lang value="缺料数量" /></td >
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
					<div class="datagrid-body datagrid-div3 scroll2" style="height:250px;">
							<table class="dlist-table table-line" style="width:100%;table-layout:fixed;"  id="lackInfo" >
								<tbody id="addLackInfo" >
								</tbody>
							</table>
						</div>
					</div>
					
				</div>
			<bu:jsVal formId="65324c73fb4340eab7fcd1a57edfee4f" formIndex="1" />
									
			</div>
	</form>	
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<script type="text/javascript">
    var docNum = '${param.docNum}';
    $(function(){
    getLackInfo();
    })
    //获取缺料信息
    function getLackInfo(){
   
        $.ajax({
            type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=8446613b791b4ac3ae1609d51b262072",//&docNum="+docNum,
			    data: {
			        "docNum" : docNum,
			    },
			    success: function(data){
						    if(null == data){return;}
						    if(null != data.ajaxList){
							    var lackList =data.ajaxList;
							    for(var i=0;i<lackList.length;i++){
							        $("#lackInfo tbody:last").append("<tr id='tr2_"+i+"' ></tr>");
    								$("#lackInfo tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
    								$("#lackInfo tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;'>"+lackList[i].itemCode+"</td>");
    								$("#lackInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:90px;text-align: right;'>"+lackList[i].needNum+"</td>");
    								$("#lackInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:90px;text-align: right;'>"+lackList[i].eleNum+"</td>");
    								$("#lackInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:90px;text-align: right;'>"+lackList[i].comNum+"</td>");
    								$("#lackInfo tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='text-align: right;'>"+lackList[i].lackNum+"</td>");
							
							    }
							    var tableTrJs1 = $("#lackInfo tbody tr");
							    _tongLineColor(tableTrJs1);
						    }
							    
						    }
					},
			    error: function(msg){
						
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
        });
    }
    
</script>
	<!-- js初始化方法 -->
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_11" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
