<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
   <%-- <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include>--%>
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
			    	        <button type="button" onclick="editCal();"><i class="ico ico-save"></i><dict:lang value="提交" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd" style="height:430px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="07ea397ead0f4ea8ac3eef0e970752cc" type="edit" />
	<table class="basic-table" >
	<input type="hidden" id="packIds" name="packIds" value="" />
	<input type="hidden" id="schemeSn" name="schemeSn" value="" />
	<input type="hidden" id="orderBys" name="orderBys" value="" />
	<input type="hidden" name="formIds" value="07ea397ead0f4ea8ac3eef0e970752cc" />
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<input type="hidden" name="07ea397ead0f4ea8ac3eef0e970752cc" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'b9da38517ee24c6190d67c7247fddb92'" />
		<s:set name="_$formId_1" value="'07ea397ead0f4ea8ac3eef0e970752cc'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WPS_SCHEME_SN" formId="07ea397ead0f4ea8ac3eef0e970752cc" /></td>
			<bu:td cssClass="dec" colNo="WPS_SCHEME_SN" formId="07ea397ead0f4ea8ac3eef0e970752cc" ><bu:ui colNo="WPS_SCHEME_SN" formId="07ea397ead0f4ea8ac3eef0e970752cc" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WPS_SCHEME_NAME" formId="07ea397ead0f4ea8ac3eef0e970752cc" /></td>
			<bu:td cssClass="dec" style="width:230px;" colNo="WPS_SCHEME_NAME" formId="07ea397ead0f4ea8ac3eef0e970752cc" ><bu:ui colNo="WPS_SCHEME_NAME" formId="07ea397ead0f4ea8ac3eef0e970752cc" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WPS_DEFAULT_FLAG" formId="07ea397ead0f4ea8ac3eef0e970752cc" /></td>
			<bu:td cssClass="dec" colNo="WPS_DEFAULT_FLAG" formId="07ea397ead0f4ea8ac3eef0e970752cc" ><bu:ui colNo="WPS_DEFAULT_FLAG" formId="07ea397ead0f4ea8ac3eef0e970752cc" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WPS_MEMO" formId="07ea397ead0f4ea8ac3eef0e970752cc" /></td>
			<bu:td cssClass="dec" colNo="WPS_MEMO" formId="07ea397ead0f4ea8ac3eef0e970752cc" style="height:80px;" colspan="3" ><bu:ui colNo="WPS_MEMO" style="height:100%;width:100%;" formId="07ea397ead0f4ea8ac3eef0e970752cc" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
	<div class="mod">
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="策略信息" /></h3>	
        </div>
        	<div class="mod" >
			<div class="mod-bd" style="margin-top:5px;">
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"   >
						<div class="datagrid-header" >
							<div class="datagrid-header-inner head" id="" >
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"><input type="checkbox" id="allSelect" name="allSelect" onchange="getAllModels();"/></td >
						
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="策略代码" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="发货策略" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="策略顺序" /></td >
										<td class="datagrid-cell" style="width:200px;"><dict:lang value="备注" /></td >
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll"   style="height:155px;max-width:100%">
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="addPackTactics" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>	
	</div>
			<bu:jsVal formId="07ea397ead0f4ea8ac3eef0e970752cc" formIndex="1" />
									
			</div>
	</form>	
	</div>
<bu:script viewId="b9da38517ee24c6190d67c7247fddb92" />
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<script type="text/javascript">
$(function(){
	
	setPickTactics();
})
function setPickTactics(){
	util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=899d17111b8a4024b79b7ecad1803ce1",//VM-仓库捡货方案-修改 操作功能 回填策略信息
			    data:{
			        "schemeSn":$("#paraMapObj_WPS_SCHEME_SN").val()
			    },
			    success: function(data){
				                 $("#addPackTactics").empty();
						util.closeLoading();
						if(null == data){return ;}
						if(null != data.ajaxList){
							var rccList = eval(data.ajaxList);
							var tempCount = 0;
							for(var i=0;i<rccList.length;i++){
							    	if(rccList[i].PCD_ORDER_BY==undefined) rccList[i].PCD_ORDER_BY="";
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='trr_"+rccList[i].ID+"' ></tr>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								if(rccList[i].checkFlag=='Y'){
									$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+rccList[i].ID+"' name='isSelect1' checked='checked' type='checkbox' value='"+rccList[i].ID+"'/></td>");
                                    tempCount++;								
								}else{
									$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+rccList[i].ID+"' name='isSelect1' type='checkbox' value='"+rccList[i].ID+"'/></td>");
								}
								
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;'>"+rccList[i].WPT_TACTICS_SN+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;'>"+rccList[i].WPT_TACTICS_NAME+"</td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:90px;text-align: center;;padding:0;'><input type='text' id='PCD_ORDER_BY"+rccList[i].ID+"' style='width:90px' maxlength='2' class=' input isSubmit' value='"+rccList[i].PCD_ORDER_BY+"' name='PCD_ORDER_BY'/></td>");
								$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:200px;text-align: center;'>"+rccList[i].WPT_DESC+"</td>");
							}
							if(tempCount==rccList.length){
							    $("#allSelect").attr("checked","checked");
							}
							var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
							defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
						}
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
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
     	function getAllModels(){
		if($("#allSelect").attr("checked")=="checked"){
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 :checkbox").attr("checked",true);
		}else{
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	}
	//校验输入的是否为数字
	function checkNum(tempVal){
		if(!(/^(\+|-)?\d+$/.test( tempVal )) || tempVal < 0){
			    //_alertValMsg(tempId,"<dict:lang value="该项必须为正整数或0" />");
			    return "0";  
		}else 
		return "1"; 
	}
	function checkOrder(){
	//判断选择的数据是否为数字或空	
    	var tempF = "0";
	    $("input[name='isSelect1']:checked").each(function(i) { // 遍历选中的checkbox
    			if($.trim($("#PCD_ORDER_BY"+$(this).val()).val())==""){
    				utilsFp.confirmIcon(1,"","","", "<dict:lang value="策略顺序不能为空" />",0,"260","");
    				tempF = "0";
    				return false;
    			}else{
    				var tFlag = checkNum($.trim($("#PCD_ORDER_BY"+$(this).val()).val()));
    				if(tFlag=="0"){
    				    utilsFp.confirmIcon(1,"","","", "<dict:lang value="策略顺序必须为正整数或0" />",0,"260","");
    				    tempF = "0";
    				    return false;
    				}else{
    				     tempF = "1";
    				}
    			}
	               
            });	
         
        return tempF;
	}
	//获取选中的值
	function getSelectSn(){
	    $("#schemeSn").val($("#paraMapObj_WPS_SCHEME_SN").val());
	    //$("input[name='isSelect1']").removeAttr("checked");
	    var k=$("input[name='isSelect1']:checked").length;
	    if(k!=0){
	        var packIds;
		$("input[name='isSelect1']:checked").each(function(i) { // 遍历选中的checkbox
			if(i==0){
				packIds = $(this).val();
				orderBys = $.trim($("#PCD_ORDER_BY"+$(this).val()).val());
			}else{
				packIds = packIds + "," +$(this).val();
				orderBys = orderBys + "," + $.trim($("#PCD_ORDER_BY"+$(this).val()).val());
			}
	               
        	 });
        	 $("#packIds").val(packIds);
        	 $("#orderBys").val(orderBys);
        	 return "1";
            }else{
            	utilsFp.confirmIcon(1,"","","", "<dict:lang value="请至少选择一条数据" />",0,"260","");
            	return "0";
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
                        var flag = getSelectSn();
                        if(flag=="0"){
                            return ;
                        }
                        var flag1 = checkOrder();
                        if(flag1=="0"){
                            return ;
                        }
  document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=657cb9b23fdc4af4b7ebd1a7eac60a6a";
  document.forms.editForm.submit();
}
</script>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll','.head');
   // setPopScroll('.scroll1','.head1');
  })
})(jQuery)</script>
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
