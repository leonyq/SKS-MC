<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
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
	
			<!-- head里面 -->

  <!-- 产品静态资源 -->

</head>
<body>
	<div class="edit">
			<div class="bd" style="border: none;height:600px;">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
			
		<bu:set name="paraMapObj" value="${dataId}" formId="0900df53f0aa452cb6dd0703012fdaef" type="edit" />
		<div class="mod">
        <div class="mod-hd">		
          <h3 class="tit"><dict:lang value="基本信息" /></h3>	
          </div>
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="0900df53f0aa452cb6dd0703012fdaef" />
	<input type="hidden" name="0900df53f0aa452cb6dd0703012fdaef" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="dataAuth" id="dataAuth" value="${param.dataAuth}" />
		<s:set name="_$viewId" value="'049ef919f1a44c96ac40cda36d989595'" />
		<s:set name="_$formId_1" value="'0900df53f0aa452cb6dd0703012fdaef'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td class="name" /><bu:uitn colNo="QID_DOC_NUM" formId="0900df53f0aa452cb6dd0703012fdaef" /></td>
			<bu:td cssClass="dec" colNo="QID_DOC_NUM" formId="0900df53f0aa452cb6dd0703012fdaef" ><bu:ui colNo="QID_DOC_NUM" formId="0900df53f0aa452cb6dd0703012fdaef" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="QID_RECORD_EMP" formId="0900df53f0aa452cb6dd0703012fdaef" /></td>
			<bu:td cssClass="dec" colNo="QID_RECORD_EMP" formId="0900df53f0aa452cb6dd0703012fdaef" ><bu:ui colNo="QID_RECORD_EMP" formId="0900df53f0aa452cb6dd0703012fdaef" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QID_RECORD_DATE" formId="0900df53f0aa452cb6dd0703012fdaef" /></td>
			<bu:td cssClass="dec" colNo="QID_RECORD_DATE" formId="0900df53f0aa452cb6dd0703012fdaef" ><bu:ui colNo="QID_RECORD_DATE" formId="0900df53f0aa452cb6dd0703012fdaef" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="QID_CONFIRM_EMP" formId="0900df53f0aa452cb6dd0703012fdaef" /></td>
			<bu:td cssClass="dec" colNo="QID_CONFIRM_EMP" formId="0900df53f0aa452cb6dd0703012fdaef" ><bu:ui colNo="QID_CONFIRM_EMP" formId="0900df53f0aa452cb6dd0703012fdaef" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QID_CONFIRM_DATE" formId="0900df53f0aa452cb6dd0703012fdaef" /></td>
			<bu:td cssClass="dec" colNo="QID_CONFIRM_DATE" formId="0900df53f0aa452cb6dd0703012fdaef" ><bu:ui colNo="QID_CONFIRM_DATE" formId="0900df53f0aa452cb6dd0703012fdaef" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QID_COMMENT" formId="0900df53f0aa452cb6dd0703012fdaef" /></td>
			<bu:td cssClass="dec" colNo="QID_COMMENT" formId="0900df53f0aa452cb6dd0703012fdaef" style="height:80px;" colspan="3"><bu:ui style="width:100%;height:100%" colNo="QID_COMMENT" formId="0900df53f0aa452cb6dd0703012fdaef" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>

		
		
	</table>
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	        <div class="mod" >
    			    <div class="mod-hd">		
        <h3 class="tit"><dict:lang value="单据明细" /></h3>	
        </div>
    			<div class="mod-bd" style="margin-top:5px;border-bottom: none;">
    				<div class="panel datagrid datagrid-div1">
    					<div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view">
    						<div class="datagrid-header"> <!--min-width:1500px-->
    							<div class="datagrid-header-inner" id="datagrid-header-inner1">
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
                                        	<td style="width:120px;display:none;">
    										<dict:selectDict id="isCheck" name="isCheck" dictCode="CQI_RESULT_CHECK" />
    										</td >
    									</tr>
    									</tbody>		
    								</table>
    							</div>
    						</div>
    						<div class="datagrid-body datagrid-div3 scroll"   style="height:210px;"><!--min-width:1500px;-->
    							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
    								<tbody id="addItemInfo" >
    								</tbody>
    							</table>
    						</div>
    					</div>
    				</div>
    			</div>
    		 </div>	
			<bu:jsVal formId="0900df53f0aa452cb6dd0703012fdaef" formIndex="1" />		<div style="padding:1px;"></div>

		


				</form>	
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>


  	
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
    	<script type="text/javascript">
    	$(function(){
	     $("#paraMapObj_QID_COMMENT").attr("disabled","disabled");
        $("#paraMapObj_QID_COMMENT").attr("class","input isSubmit readonly  _VAL_OjbsData isaddSubmit _VAL_DATABASE");
	     getEditDetailMwssage();
	})
	    var trrCount=0;	
	   function getEditDetailMwssage(){
	        var dataAuth=$("#dataAuth").val();
			util.showLoading("处理中...");
			var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=de44c62702d741eda96b4befea81af1e";
			var id="${dataId}";
			var jsondata = { "id": id,"type":"detail","dataAuth":dataAuth};
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
                	    var isCheckOpt = $("#isCheck").html();
                	    var isCheckOption = isCheckOpt.substring(isCheckOpt.indexOf('<option'));
                	    var isCheckSel = "<select disabled='disabled' id='isCheckSel_"+(trrCount+1)+"' name='isCheckSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'><option value=''>--请选择--</option>"+ isCheckOption +"</select>";
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
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:155px;text-align: center;' title='"+rccList[i].QID_ITEM_CODE+"'>"+rccList[i].QID_ITEM_CODE+"<input type='hidden'  name='QII_ITEM_CODE' value='"+rccList[i].QID_ITEM_CODE+"'/></td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:155px;text-align: center;' title='"+rccList[i].QID_ITEM_NAME+"'>"+rccList[i].QID_ITEM_NAME+"<input type='hidden'  name='QII_ITEM_NAME' value='"+rccList[i].QID_ITEM_NAME+"'/></td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:155px;text-align: center;' title='"+rccList[i].VALUE+"'>"+rccList[i].VALUE+"<input type='hidden'  name='QII_ITEM_TYPE' value='"+rccList[i].QID_ITEM_TYPE+"'/></td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:155px;text-align: center;padding:0;' title='"+rccList[i].QID_TEST_CONTENT+"'>"+rccList[i].QID_TEST_CONTENT+"</td>");
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
    	</script>
    	<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll','.datagrid-header-inner');
  })
})(jQuery)</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 
