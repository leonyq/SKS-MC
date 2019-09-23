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
	<title><dict:lang value="确认" /></title>
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
			<div class="bd" style="height:600px;">
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
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<input type="hidden" name="0900df53f0aa452cb6dd0703012fdaef" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" id="id" name="id" value="" />
	<input type="hidden" id="qidDocNum" name="qidDocNum" value="" />
		<s:set name="_$viewId" value="'0c7d1b213a314c5abb5df62888618065'" />
		<s:set name="_$formId_1" value="'0900df53f0aa452cb6dd0703012fdaef'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" /><bu:uitn colNo="QID_DOC_NUM" formId="0900df53f0aa452cb6dd0703012fdaef" /></td>
			<bu:td cssClass="dec" colNo="QID_DOC_NUM" formId="0900df53f0aa452cb6dd0703012fdaef" ><bu:ui colNo="QID_DOC_NUM" formId="0900df53f0aa452cb6dd0703012fdaef" style="width:230px" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="QID_RECORD_EMP" formId="0900df53f0aa452cb6dd0703012fdaef" /></td>
			<bu:td cssClass="dec" style="width:230px" colNo="QID_RECORD_EMP" formId="0900df53f0aa452cb6dd0703012fdaef" ><bu:ui colNo="QID_RECORD_EMP" formId="0900df53f0aa452cb6dd0703012fdaef" style="width:230px;border:1px solid rgb(204,204,204)" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QID_RECORD_DATE" formId="0900df53f0aa452cb6dd0703012fdaef" /></td>
			<bu:td cssClass="dec" colNo="QID_RECORD_DATE" formId="0900df53f0aa452cb6dd0703012fdaef" ><bu:ui colNo="QID_RECORD_DATE" formId="0900df53f0aa452cb6dd0703012fdaef" style="width:230px" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QID_COMMENT" formId="0900df53f0aa452cb6dd0703012fdaef" /></td>
			<bu:td cssClass="dec" colNo="QID_COMMENT" formId="0900df53f0aa452cb6dd0703012fdaef" style="height:80px;" colspan="3"><bu:ui style="width:100%;height:100%" colNo="QID_COMMENT" formId="0900df53f0aa452cb6dd0703012fdaef" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		</div>
        
    		
		    
	</table>
	    	<div class="mod" >
    			    <div class="mod-hd">		
        <h3 class="tit"><dict:lang value="单据明细" /></h3>	
        </div>
    			<div class="mod-bd" style="margin-top:5px;border-bottom: none;">
    				<div class="panel datagrid datagrid-div1">
    					<div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view">
    						<div class="datagrid-header"> <!--min-width:1500px-->
    							<div class="datagrid-header-inner head1" id="datagrid-header-inner1">
    								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
    										<td class="datagrid-cell" style="width:30px;"></td>
    										<td class="datagrid-cell" style="width:30px;">
    										<input type="checkbox" id="allSelects" name="allSelect" onchange="getAllItems();" />
    										</td>
    										<td class="datagrid-cell" style="width:155px;" ><dict:lang value="项目代码" /></td >
    										<td class="datagrid-cell" style="width:155px;" ><dict:lang value="项目名称" /></td >
    										<td class="datagrid-cell" style="width:155px;" ><dict:lang value="项目类型" /></td >
    										<td class="datagrid-cell" style="width:155px;" ><dict:lang value="检测内容" /></td >
                                        	<td class="datagrid-cell" style="width:120px;" ><dict:lang value="确认结果" /></td >
                                        	<td style="display:none;">
    										<dict:selectDict id="isCheck" name="isCheck" dictCode="CQI_RESULT_CHECK" />
    										</td >
    									</tr>
    									</tbody>		
    								</table>
    							</div>
    						</div>
    						<div class="datagrid-body datagrid-div3 scroll1"   style="height:200px;"><!--min-width:1500px;-->
    							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
    								<tbody id="addItemInfo" >
    								</tbody>
    							</table>
    						</div>
    					</div>
    				</div>
    			</div>
    		 </div>	
    		 
			<bu:jsVal formId="0900df53f0aa452cb6dd0703012fdaef" formIndex="1" />
									
			</div>
	</form>	
	</div>

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
	     $("#paraMapObj_QID_RECORD_EMP").attr("style","border-color:#rgb(204,204,204)");
	     $("#paraMapObj_QID_COMMENT").attr("disabled","disabled");
        $("#paraMapObj_QID_COMMENT").attr("class","input isSubmit readonly  _VAL_OjbsData isaddSubmit _VAL_DATABASE");
	     getEditDetailMwssage();
	})
	    var trrCount=0;	
	   function getEditDetailMwssage(){
			util.showLoading("处理中...");
			var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=de44c62702d741eda96b4befea81af1e";
			var id="${dataId}";
			
	       $.ajax({
	           type:"post",
	           dataType:"json",
	            data:"id="+id,
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
                	    var isCheckOpt = $("#isCheck").html();
                	    var isCheckOption = isCheckOpt.substring(isCheckOpt.indexOf('<option'));
                	    var isCheckSel = "<select id='isCheckSel_"+(trrCount+1)+"' name='isCheckSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'><option value=''>--请选择--</option>"+ isCheckOption +"</select>";
                	        if(rccList[i].ID==null) rccList[i].ID="";
                	       if(rccList[i].QID_ITEM_CODE==null) rccList[i].QID_ITEM_CODE="";
                	       if(rccList[i].QID_ITEM_NAME==null) rccList[i].QID_ITEM_NAME="";
                	       if(rccList[i].QID_ITEM_TYPE==null) rccList[i].QID_ITEM_TYPE="";
                	       if(rccList[i].VALUE==null) rccList[i].VALUE="";
                	       if(rccList[i].QID_TEST_CONTENT==null) rccList[i].QID_TEST_CONTENT="";
                	       if(rccList[i].QID_CONFIRM_RESULT==null) rccList[i].QID_CONFIRM_RESULT="";
                	       	   $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='trr"+(trrCount+1)+"' ></tr>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:155px;text-align: center;'>"+rccList[i].QID_ITEM_CODE+"<input type='hidden'  name='QII_ITEM_CODE' value='"+rccList[i].QID_ITEM_CODE+"'/></td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:155px;text-align: center;'>"+rccList[i].QID_ITEM_NAME+"<input type='hidden'  name='QII_ITEM_NAME' value='"+rccList[i].QID_ITEM_NAME+"'/></td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:155px;text-align: center;'>"+rccList[i].VALUE+"<input type='hidden'  name='QII_ITEM_TYPE' value='"+rccList[i].QID_ITEM_TYPE+"'/></td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:155px;text-align: center;padding:0;'><input type='text' style='width: 140px;padding:0;text-align: left;' maxlength='200' class='_VAL_NULL input isSubmit' id='PLAN_NUM_"+(trrCount+1)+"' name='QII_TEST_CONTENT' value='"+rccList[i].QID_TEST_CONTENT+"'/></td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234  tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:120px;padding:0;'>"+isCheckSel+"</td>");
						mySetChosen();//设置下拉框样式
							$("#isCheckSel_"+(trrCount+1)).val(rccList[i].QID_CONFIRM_RESULT);
					$("#isCheckSel_"+(trrCount+1)).trigger("chosen:updated");
					
					$("#isCheckSel_"+(trrCount+1)+"_chosen").attr("style","width:120px;");
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
	//设置下拉框样式
function mySetChosen(){
	var curWinHeight = $(document).height();//当前窗口高度
	
	$(".dept_select").chosen({
		//inherit_select_classes:true,//继承select class
		//width:"100%",
		//disable_search:true,//是否隐藏搜索框
		disable_search_threshold:15//少于15项，隐藏搜索框
	});

	//大于10个选项的，显示搜索框
	var len1 = $(".dept_select").length;
	$(".dept_select").each(function(index,item){
		if(item.id!=""){
		if(item != null && item.length > 10){
			//.chosen-container-single .chosen-search
			$("#"+item.id+"_chosen .chosen-search").css("display","block");
		}

		var offset = $("#"+item.id+"_chosen").offset(); //计算当前下拉框的偏移量
		
		var maxHeight = $("#"+item.id+"_chosen .chosen-drop .chosen-results").css("max-height").replace("px","");//下拉高度
		
		var searchHeight = 0;//下拉搜索框的高度，默认为0
		//如果有显示搜索框，则需多计算搜索框的高度
		if(!$("#"+item.id+"_chosen .chosen-drop .chosen-search").is(":hidden")){
			searchHeight = 35;
		}
		//如果下拉框在窗口位置比窗口高度的一半还往下，则往上拉
		if(offset.top > (curWinHeight/2)){
			$("#"+item.id+"_chosen .chosen-drop").css({"top":"auto","bottom": "100%","border-top":"1px solid #75c4ff","border-bottom": 0,"background-color":"#f8fcff"});
			//console.log($("#"+item.id+"_chosen .chosen-drop .chosen-results").css("max-height"));
			//console.log(itemHeight);
			if(offset.top < (maxHeight+searchHeight) && offset.top < 200){
				$("#"+item.id+"_chosen .chosen-drop .chosen-results").css({"max-height":offset.top-5-searchHeight});
			}
		}else{
			var itemHeight = curWinHeight - offset.top;
			if(itemHeight < (maxHeight+searchHeight) && itemHeight < 200){
				$("#"+item.id+"_chosen .chosen-drop .chosen-results").css({"max-height":itemHeight-32-searchHeight});
			}
		}
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
                        
  document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=a7f7b73c94c74b62b635bb80b9027d60";
  document.forms.editForm.submit();
}
	</script>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_10" />
  	<jsp:param name="location" value="jsLoading" />
</jsp:include>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll1','.head1');
  })
})(jQuery)</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->

