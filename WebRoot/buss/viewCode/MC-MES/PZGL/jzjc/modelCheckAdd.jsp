<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />

	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
  
	<!-- head里面 -->
 <script>
function popModelDiv(showId,backId){
    	    var testStep = $("#paraMap1_QMI_TEST_STEP").val();			
            if(testStep==""){
                utilsFp.confirmIcon(1,"","","", "<dict:lang value = "请先选择检测阶别" />",0,"260","");
                return;
            }
            $("#searchDevTypeSelect").val("");
            $("#searchDevTypeSelect").trigger("chosen:updated");
            $("#searchEqSN").val("");	
            $("#searchEqName").val("");				

		        $("#"+showId+",#"+backId).show();
			$("#"+showId).draggable({cancel:'.dialog-bd-div'});
			
			$("#searchDevTypeSelect_chosen").attr("style","width:157px;");
			getModel();
			getModTypeSelect();
}
function hideDiv(showId,backId){
			//$(' .chosen-container').css("width","230px");
			//var value = $("#add_type").val();
			$("#"+showId+",#"+backId).hide();
			$("#role_list_cb").attr("checked",false);
			$("#job_list_cb").attr("checked",false);
			
			closeDivFp(showId+"pop");
		}
function getModel(){
var modelUrl="${path}buss/bussModel_exeFunc.ms?funcMId=aa78b1a6b93149eb8054f6d2c1681c07&formId=%{formId}";//VM-机种检测项目新增页面 操作功能 检测项目弹窗
                        var checkType = $("#paraMap1_QMI_TEST_STEP").val();
                        var dataAuth = $("#deptLs_data_auth").val();
                        var jsondata = { "type": "1","checkType": checkType, "dataAuth":dataAuth};
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url:modelUrl,
			    data: jsondata,
				success: function(data){
						util.closeLoading();
						if(null == data.ajaxPage.dataList){
				                
				                $("#modelTbody").empty();
				              //  pageFun(data.ajaxPage,"formId1");
				                return ;}
						if(null != data.ajaxPage.dataList){
							$(".firstTableClass").show();
							$("#modelTbody").empty();
							for(var i = 0;i < data.ajaxPage.dataList.length; i++){
							          
							           // eqObj= data.ajaxPage.dataList[i];
								$("#modelTbody").append("<tr  style='cursor: pointer;' id='"+data.ajaxPage.dataList[i].ID+"'></tr>");
								$("#modelTbody tr:last").append("<td style='width: 30px;text-align: center;'>"+(i+1)+"</td>");								
								$("#modelTbody tr:last").append("<td style='width: 30px;text-align: center;'><input type='checkbox' id='"+data.ajaxPage.dataList[i].ID+"' name='"+data.ajaxPage.dataList[i].CD_DEVICE_NAME+"' /><input type='hidden' id='DATA_AUTH"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].DEPT+"'/><input type='hidden' id='QTI_TEST_STEP"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].STEP+"'/></td>");
								$("#modelTbody tr:last").append("<td style='width: 120px;text-align: center;'>"+data.ajaxPage.dataList[i].QTI_ITEM_SN+"<input type='hidden' id='QTI_ITEM_SN"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].QTI_ITEM_SN+"' /></td>");
								$("#modelTbody tr:last").append("<td style='width: 120px;text-align: center;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].QTI_ITEM_NAME+"'>"+data.ajaxPage.dataList[i].QTI_ITEM_NAME+"<input type='hidden' id='QTI_ITEM_NAME"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].QTI_ITEM_NAME+"'/></td>");
								$("#modelTbody tr:last").append("<td style='width: 100px;text-align: center;hidden;text-overflow:ellipsis;'title='"+(data.ajaxPage.dataList[i].QTI_ITEM_TYPE==null?"":data.ajaxPage.dataList[i].QTI_ITEM_TYPE)+"' id='TDITEMTYPE"+data.ajaxPage.dataList[i].ID+"' >"+(data.ajaxPage.dataList[i].ITEMTYPE==null?"":data.ajaxPage.dataList[i].ITEMTYPE)+"<input type='hidden' id='QTI_ITEM_TYPE"+data.ajaxPage.dataList[i].ID+"' value='"+(data.ajaxPage.dataList[i].QTI_ITEM_TYPE==null?"":data.ajaxPage.dataList[i].QTI_ITEM_TYPE)+"' /></td>");
								$("#modelTbody tr:last").append("<td style='width: 100px;text-align: center;text-overflow:ellipsis;'title='"+(data.ajaxPage.dataList[i].QTI_ITEM_CLASS==null?"":data.ajaxPage.dataList[i].QTI_ITEM_CLASS)+"' id='TDITEMCLASS"+data.ajaxPage.dataList[i].ID+"' >"+(data.ajaxPage.dataList[i].ITEMCLASS==null?"":data.ajaxPage.dataList[i].ITEMCLASS)+"<input type='hidden' id='QTI_ITEM_CLASS"+data.ajaxPage.dataList[i].ID+"' value='"+(data.ajaxPage.dataList[i].QTI_ITEM_CLASS==null?"":data.ajaxPage.dataList[i].QTI_ITEM_CLASS)+"' /></td>");
								$("#modelTbody tr:last").append("<td style='width: 60px;text-align: center;text-overflow:ellipsis;'title='"+(data.ajaxPage.dataList[i].QTI_ITEM_MAXVALUE==null?"":data.ajaxPage.dataList[i].QTI_ITEM_MAXVALUE)+"'>"+(data.ajaxPage.dataList[i].QTI_ITEM_MAXVALUE==null?"":data.ajaxPage.dataList[i].QTI_ITEM_MAXVALUE)+"<input type='hidden' id='QTI_ITEM_MAXVALUE"+data.ajaxPage.dataList[i].ID+"' value='"+(data.ajaxPage.dataList[i].QTI_ITEM_MAXVALUE==null?"":data.ajaxPage.dataList[i].QTI_ITEM_MAXVALUE)+"' /></td>");
								$("#modelTbody tr:last").append("<td style='width: 60px;text-align: center;text-overflow:ellipsis;'title='"+(data.ajaxPage.dataList[i].QTI_ITEM_MINVALUE==null?"":data.ajaxPage.dataList[i].QTI_ITEM_MINVALUE)+"'>"+(data.ajaxPage.dataList[i].QTI_ITEM_MINVALUE==null?"":data.ajaxPage.dataList[i].QTI_ITEM_MINVALUE)+"<input type='hidden' id='QTI_ITEM_MINVALUE"+data.ajaxPage.dataList[i].ID+"' value='"+(data.ajaxPage.dataList[i].QTI_ITEM_MINVALUE==null?"":data.ajaxPage.dataList[i].QTI_ITEM_MINVALUE)+"' /></td>");
								$("#modelTbody tr:last").append("<td style='width:130px;text-align: center;text-overflow:ellipsis;'title='"+(data.ajaxPage.dataList[i].QTI_ITEM_UNIT==null?"":data.ajaxPage.dataList[i].QTI_ITEM_UNIT)+"'>"+(data.ajaxPage.dataList[i].QTI_ITEM_UNIT==null?"":data.ajaxPage.dataList[i].QTI_ITEM_UNIT)+"<input type='hidden' id='QTI_ITEM_UNIT"+data.ajaxPage.dataList[i].ID+"' value='"+(data.ajaxPage.dataList[i].QTI_ITEM_UNIT==null?"":data.ajaxPage.dataList[i].QTI_ITEM_UNIT)+"' /><input type='hidden' id='QTI_TEST_METHOD"+data.ajaxPage.dataList[i].ID+"' value='"+(data.ajaxPage.dataList[i].QTI_TEST_METHOD==null?"":data.ajaxPage.dataList[i].QTI_TEST_METHOD)+"'/><input type='hidden' id='QTI_TEST_CONTENT"+data.ajaxPage.dataList[i].ID+"' value='"+(data.ajaxPage.dataList[i].QTI_TEST_CONTENT==null?"":data.ajaxPage.dataList[i].QTI_TEST_CONTENT)+"'/><input type='hidden' id='QTI_TEST_SEQ"+data.ajaxPage.dataList[i].ID+"' value='"+(data.ajaxPage.dataList[i].QTI_TEST_SEQ==null?"":data.ajaxPage.dataList[i].QTI_TEST_SEQ)+"'/></td>");
								
							}
							//init();
							pageFun(data.ajaxPage,"formId3");
							var tableTrJs = $("#datagrid-btable-ajax123456 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('modelTbody');
							defTableWidthRewrite("123456");
						}
					},
				error: function(msg){
						util.closeLoading();
						//utilsFp.alert("error:"+msg);
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
				  }
				});

	}
	
	function getModTypeSelect(){
$.ajax({
	type: "POST",
	dataType: "json",
	url: "${path}buss/bussModel_exeFunc.ms?funcMId=0678aba9a2af468da062df5f62a0418f",//VM-机种检测项目新增页面 操作功能 获取项目类型
	data: "",
	success: function(data){
		if(null == data){ return ;}
		if(null != data.ajaxList){
                        
			$("#searchDevTypeSelect").empty();
			$("#searchDevTypeSelect").append("<option value=''>--请选择--</option>");
			for(var i = 0;i < data.ajaxList.length; i++){
			$("#searchDevTypeSelect").append("<option value=\""+data.ajaxList[i].CODE+"\">"+data.ajaxList[i].VALUE+"</option>");
                              }

                        $("#searchDevTypeSelect").trigger("chosen:updated");
			};
                          //init();
			},
		error: function(msg){
			util.closeLoading();
			utilsFp.alert("error:"+msg);
			}
		});

}

	var paginationImpl = {};
function searchModelInfo(paginationImpl){
var modelUrl="${path}buss/bussModel_exeFunc.ms?funcMId=aa78b1a6b93149eb8054f6d2c1681c07&formId=%{formId}";//VM-机种检测项目新增页面 操作功能 检测项目弹窗
                        var checkType = $("#paraMap1_QMI_TEST_STEP").val();
                        var modelType = $("#searchDevTypeSelect").val();
			var modelCode = $("#searchEqSN").val();
			var modelName = $("#searchEqName").val();
			var dataAuth = $("#deptLs_data_auth").val();
			var isFirstLoad = firstLoadThisPage(paginationImpl);
    	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url:modelUrl,
			    data:{
			        "type":1,
			        "mType":modelType,
			        "mCode":modelCode,
			        "mName":modelName,
			        "checkType":checkType,
			        "dataAuth":dataAuth,
			        "page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
                    "page.pageRecord": _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
			    }, 
				success: function(data){
						util.closeLoading();
						if(null == data.ajaxPage.dataList){
				               
				                $("#modelTbody").empty();
				                //pageFun(data.ajaxPage,"formId1");
				                return ;}
						if(null != data.ajaxPage.dataList){
						     $('.scroll2').mCustomScrollbar("destroy");
                       
                       
                        
							$(".firstTableClass").show();
							$("#modelTbody").empty();
							for(var i = 0;i < data.ajaxPage.dataList.length; i++){
							           
							           // eqObj= data.ajaxPage.dataList[i];
								$("#modelTbody").append("<tr  style='cursor: pointer;' id='"+data.ajaxPage.dataList[i].ID+"'></tr>");
								$("#modelTbody tr:last").append("<td style='width: 30px;text-align: center;'>"+(i+1)+"</td>");								
								$("#modelTbody tr:last").append("<td style='width: 30px;text-align: center;'><input type='checkbox' id='"+data.ajaxPage.dataList[i].ID+"' name='"+data.ajaxPage.dataList[i].CD_DEVICE_NAME+"' /></td>");
								$("#modelTbody tr:last").append("<td style='width: 120px;text-align: center;'>"+data.ajaxPage.dataList[i].QTI_ITEM_SN+"<input type='hidden' id='QTI_ITEM_SN"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].QTI_ITEM_SN+"' /><input type='hidden' id='DATA_AUTH"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].DEPT+"'/><input type='hidden' id='QTI_TEST_STEP"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].STEP+"'/></td>");
								$("#modelTbody tr:last").append("<td style='width: 120px;text-align: center;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].QTI_ITEM_NAME+"'>"+data.ajaxPage.dataList[i].QTI_ITEM_NAME+"<input type='hidden' id='QTI_ITEM_NAME"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].QTI_ITEM_NAME+"'/></td>");
								$("#modelTbody tr:last").append("<td style='width: 100px;text-align: center;text-overflow:ellipsis;'title='"+(data.ajaxPage.dataList[i].QTI_ITEM_TYPE==null?"":data.ajaxPage.dataList[i].QTI_ITEM_TYPE)+"' id='TDITEMTYPE"+data.ajaxPage.dataList[i].ID+"' >"+(data.ajaxPage.dataList[i].ITEMTYPE==null?"":data.ajaxPage.dataList[i].ITEMTYPE)+"<input type='hidden' id='QTI_ITEM_TYPE"+data.ajaxPage.dataList[i].ID+"' value='"+(data.ajaxPage.dataList[i].QTI_ITEM_TYPE==null?"":data.ajaxPage.dataList[i].QTI_ITEM_TYPE)+"' /></td>");
								$("#modelTbody tr:last").append("<td style='width: 100px;text-align: center;text-overflow:ellipsis;'title='"+(data.ajaxPage.dataList[i].QTI_ITEM_CLASS==null?"":data.ajaxPage.dataList[i].QTI_ITEM_CLASS)+"' id='TDITEMCLASS"+data.ajaxPage.dataList[i].ID+"' >"+(data.ajaxPage.dataList[i].ITEMCLASS==null?"":data.ajaxPage.dataList[i].ITEMCLASS)+"<input type='hidden' id='QTI_ITEM_CLASS"+data.ajaxPage.dataList[i].ID+"' value='"+(data.ajaxPage.dataList[i].QTI_ITEM_CLASS==null?"":data.ajaxPage.dataList[i].QTI_ITEM_CLASS)+"' /></td>");
								$("#modelTbody tr:last").append("<td style='width: 60px;text-align: center;text-overflow:ellipsis;'title='"+(data.ajaxPage.dataList[i].QTI_ITEM_MAXVALUE==null?"":data.ajaxPage.dataList[i].QTI_ITEM_MAXVALUE)+"'>"+(data.ajaxPage.dataList[i].QTI_ITEM_MAXVALUE==null?"":data.ajaxPage.dataList[i].QTI_ITEM_MAXVALUE)+"<input type='hidden' id='QTI_ITEM_MAXVALUE"+data.ajaxPage.dataList[i].ID+"' value='"+(data.ajaxPage.dataList[i].QTI_ITEM_MAXVALUE==null?"":data.ajaxPage.dataList[i].QTI_ITEM_MAXVALUE)+"' /></td>");
								$("#modelTbody tr:last").append("<td style='width: 60px;text-align: center;text-overflow:ellipsis;'title='"+(data.ajaxPage.dataList[i].QTI_ITEM_MINVALUE==null?"":data.ajaxPage.dataList[i].QTI_ITEM_MINVALUE)+"'>"+(data.ajaxPage.dataList[i].QTI_ITEM_MINVALUE==null?"":data.ajaxPage.dataList[i].QTI_ITEM_MINVALUE)+"<input type='hidden' id='QTI_ITEM_MINVALUE"+data.ajaxPage.dataList[i].ID+"' value='"+(data.ajaxPage.dataList[i].QTI_ITEM_MINVALUE==null?"":data.ajaxPage.dataList[i].QTI_ITEM_MINVALUE)+"' /></td>");
								$("#modelTbody tr:last").append("<td style='width:130px;text-align: center;text-overflow:ellipsis;'title='"+(data.ajaxPage.dataList[i].QTI_ITEM_UNIT==null?"":data.ajaxPage.dataList[i].QTI_ITEM_UNIT)+"'>"+(data.ajaxPage.dataList[i].QTI_ITEM_UNIT==null?"":data.ajaxPage.dataList[i].QTI_ITEM_UNIT)+"<input type='hidden' id='QTI_ITEM_UNIT"+data.ajaxPage.dataList[i].ID+"' value='"+(data.ajaxPage.dataList[i].QTI_ITEM_UNIT==null?"":data.ajaxPage.dataList[i].QTI_ITEM_UNIT)+"' /><input type='hidden' id='QTI_TEST_METHOD"+data.ajaxPage.dataList[i].ID+"' value='"+(data.ajaxPage.dataList[i].QTI_TEST_METHOD==null?"":data.ajaxPage.dataList[i].QTI_TEST_METHOD)+"'/><input type='hidden' id='QTI_TEST_CONTENT"+data.ajaxPage.dataList[i].ID+"' value='"+(data.ajaxPage.dataList[i].QTI_TEST_CONTENT==null?"":data.ajaxPage.dataList[i].QTI_TEST_CONTENT)+"'/><input type='hidden' id='QTI_TEST_SEQ"+data.ajaxPage.dataList[i].ID+"' value='"+(data.ajaxPage.dataList[i].QTI_TEST_SEQ==null?"":data.ajaxPage.dataList[i].QTI_TEST_SEQ)+"'/></td>");

								
							}
							//init();
							
						}
						pageFun(data.ajaxPage,"formId3");
							var tableTrJs = $("#datagrid-btable-ajax123456 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('modelTbody');
							setPopScroll('.scroll2','.head2');
							defTableWidthRewrite("123456");
					},
				error: function(msg){
						util.closeLoading();
						//utilsFp.alert("error:"+msg);
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
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
		
	 var tempCount = 1;
 	 function addModelList(showId,backId){
	    var len = $("#addModelList tr").length;
	    var itemType;
		var QTI_TEST_STEP;
		var QTI_ITEM_SN;
		var QTI_ITEM_NAME;
		var TDITEMTYPE;
		var TDITEMCLASS;
		var itemClass;
		var QTI_ITEM_MAXVALUE;
		var QTI_ITEM_MINVALUE;
		var QTI_ITEM_UNIT;
		var QTI_TEST_METHOD;
		var QTI_TEST_CONTENT;
		var QTI_TEST_SEQ;
	 	$(".firstTableBack").show();
			 $("#modelTbody :checkbox").each(function(){
					if($(this).attr("checked")){
						
						if (!$("#trr"+$(this).attr("id")).length) {
						itemType = $("#QTI_ITEM_TYPE"+$(this).attr("id")).val();
						QTI_TEST_STEP = $("#QTI_TEST_STEP"+$(this).attr("id")).val();
							QTI_ITEM_SN = $("#QTI_ITEM_SN"+$(this).attr("id")).val();
							QTI_ITEM_NAME = $("#QTI_ITEM_NAME"+$(this).attr("id")).val();
							TDITEMTYPE = $("#TDITEMTYPE"+$(this).attr("id")).text();
							TDITEMCLASS = $("#TDITEMCLASS"+$(this).attr("id")).text();
							itemClass = $("#QTI_ITEM_CLASS"+$(this).attr("id")).val();
							QTI_ITEM_MAXVALUE = $("#QTI_ITEM_MAXVALUE"+$(this).attr("id")).val();
							QTI_ITEM_MINVALUE = $("#QTI_ITEM_MINVALUE"+$(this).attr("id")).val();
							QTI_ITEM_UNIT = $("#QTI_ITEM_UNIT"+$(this).attr("id")).val();
							QTI_TEST_METHOD = $("#QTI_TEST_METHOD"+$(this).attr("id")).val();
							QTI_TEST_CONTENT = $("#QTI_TEST_CONTENT"+$(this).attr("id")).val();
							QTI_TEST_SEQ = $("#QTI_TEST_SEQ"+$(this).attr("id")).val();
						   $("#addModelList").append("<tr id='trr"+$(this).attr("id")+"' name='trname' ></tr>");
							$("#addModelList tr:last").append("<td id='iptseq"+$(this).attr("id")+"' style='width: 30px;text-align: center;'>"+(len+1)+"</td>");
							$("#addModelList tr:last").append("<td style='width: 30px;text-align: center;'><input  type='checkbox' /></td>");
							
                                                        $("#addModelList tr:last").append("<td style='width: 80px;text-align: center;text-overflow:ellipsis;'>"+QTI_TEST_STEP+"<input  type='hidden' name='testStep' value='"+QTI_TEST_STEP+"'/></td>");
                                                        $("#addModelList tr:last").append("<td style='width: 100px;text-align: center;text-overflow:ellipsis;'>"+QTI_ITEM_SN+"<input  type='hidden' name='qtiSn' value='"+QTI_ITEM_SN+"'/></td>");
                                                        $("#addModelList tr:last").append("<td style='width: 100px;text-align: center;text-overflow:ellipsis;'>"+QTI_ITEM_NAME+"<input  type='hidden' name='qtiName' value='"+QTI_ITEM_NAME+"'/></td>");
                                                        $("#addModelList tr:last").append("<td style='width: 100px;text-align: center;text-overflow:ellipsis;'>"+TDITEMTYPE+"<input  type='hidden' name='qtiType' value='"+itemType+"'/></td>");
                                                        $("#addModelList tr:last").append("<td style='width: 80px;text-align: center;text-overflow:ellipsis;'>"+TDITEMCLASS+"<input  type='hidden' name='itemClass' value='"+itemClass+"'/></td>");
                                                        if(itemClass==0){
                                                            $("#addModelList tr:last").append("<td class='datagrid-cell' style='width: 70px;text-align: center;padding:0;text-overflow:ellipsis;'><input type='text' style='width: 70px;padding:0;' id='maxValue_"+tempCount+"' name='maxValue'  maxlength='9'  class='_VAL_NULL input isSubmit' value='"+QTI_ITEM_MAXVALUE+"'/></td>");
                                                            $("#addModelList tr:last").append("<td class='datagrid-cell' style='width: 70px;text-align: center;padding:0;text-overflow:ellipsis;'><input type='text' style='width: 70px;padding:0;' id='minValue_"+tempCount+"' name='minValue'  maxlength='9'  class='_VAL_NULL input isSubmit' value='"+QTI_ITEM_MINVALUE+"'/></td>");
                                                        }
                                                        if(itemClass==1){
                                                            $("#addModelList tr:last").append("<td class='datagrid-cell' style='width: 70px;text-align: center;padding:0;text-overflow:ellipsis;'><input type='text' style='width: 70px;padding:0;' id='maxValue_"+tempCount+"' name='maxValue'  maxlength='9'  class='_VAL_NULL input isSubmit' value='"+QTI_ITEM_MAXVALUE+"'/></td>");
                                                            $("#addModelList tr:last").append("<td class='datagrid-cell' style='width: 70px;text-align: center;padding:0;text-overflow:ellipsis;'>"+QTI_ITEM_MINVALUE+"<input type='hidden' name='minValue' value='"+QTI_ITEM_MINVALUE+"'/></td>");
                                                        }
                                                        if(itemClass==2){
                                                            $("#addModelList tr:last").append("<td class='datagrid-cell' style='width: 70px;text-align: center;padding:0;text-overflow:ellipsis;'>"+QTI_ITEM_MAXVALUE+"<input type='hidden' name='maxValue' value='"+QTI_ITEM_MAXVALUE+"'/></td>");
                                                            $("#addModelList tr:last").append("<td class='datagrid-cell' style='width: 70px;text-align: center;padding:0;text-overflow:ellipsis;'>"+QTI_ITEM_MINVALUE+"<input type='hidden' name='minValue' value='"+QTI_ITEM_MINVALUE+"'/></td>");
                                                        }
                                                        $("#addModelList tr:last").append("<td style='width: 70px;text-align: center;padding:0;text-overflow:ellipsis;'><input type='text' style='width: 70px;padding:0;' maxlength='30'  class=' input isSubmit' name='itemUnit' value='"+QTI_ITEM_UNIT+"'/></td>");
                                                        $("#addModelList tr:last").append("<td style='width: 130px;text-align: center;padding:0;text-overflow:ellipsis;'><input type='text' style='width: 130px;padding:0;' maxlength='50'  class=' input isSubmit' name='testMethod' value='"+QTI_TEST_METHOD+"'/></td>");
                                                        $("#addModelList tr:last").append("<td style='width: 130px;text-align: center;;padding:0;text-overflow:ellipsis;'><input type='text' style='width: 130px;padding:0;' maxlength='100'  class=' input isSubmit' name='testContent' value='"+QTI_TEST_CONTENT+"'/></td>");
                                                        $("#addModelList tr:last").append("<td style='width: 130px;text-align: center;padding:0;text-overflow:ellipsis;'><input  type='text' style='width: 100%;padding:0;' maxlength='9'  class=' input isSubmit' name='testSeq' value='"+QTI_TEST_SEQ+"'/></td>");
                                                        	len = len+1;
										                    tempCount++;
						}
					}
				});

				//init();
						        
				
			
		               				 	var tableTrJs = $("#addModelList tr");
							_tongLineColor(tableTrJs);
						//	clickTr('addModelList');
							defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
				
			
			$("#modelTbody").empty();
			document.getElementById(showId).style.display = 'none';
			document.getElementById(backId).style.display = 'none';
			$("#model_list_cb").attr("checked",false);
			$(' .chosen-container').css("width","230px");
		} 
		
		
		function showItemGenreInfo(itemgenre){
			
    	    var len = $("#addModelList tr").length;
    	    var itemType="";
    		var QTI_TEST_STEP="";
    		var QTI_ITEM_SN="";
    		var QTI_ITEM_NAME="";
    		var TDITEMTYPE="";
    		var TDITEMCLASS="";
    		var itemClass="";
    		var QTI_ITEM_MAXVALUE="";
    		var QTI_ITEM_MINVALUE="";
    		var QTI_ITEM_UNIT="";
    		var QTI_TEST_METHOD="";
    		var QTI_TEST_CONTENT="";
    		var QTI_TEST_SEQ="";
	 	    $(".firstTableBack").show();		
            var modelUrl="${path}buss/bussModel_exeFunc.ms?funcMId=aa78b1a6b93149eb8054f6d2c1681c07&formId=%{formId}";//VM-机种检测项目新增页面 操作功能 检测项目弹窗
            var testStep = $("#paraMap1_QMI_TEST_STEP").val();
    	 	var jsondata={"type":"showItemGenreInfo","itemgenre":itemgenre,"testStep":testStep};
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url:modelUrl,
			    data: jsondata,
				success: function(data){
						util.closeLoading();
						if(null == data.ajaxList){
				                $("#modelTbody").empty();
				                return ;}
						if(null != data.ajaxList){
						    var rccList = eval(data.ajaxList);
							$(".firstTableClass").show();
							$("#modelTbody").empty();
							for(var i = 0;i < data.ajaxList.length; i++){
							    if(rccList[i].QMI_ITEM_TYPE != null) itemType =rccList[i].QMI_ITEM_TYPE ;
    							if(rccList[i].STEP != null) QTI_TEST_STEP =rccList[i].STEP ;
    							if(rccList[i].QMI_ITEM_SN != null) QTI_ITEM_SN=rccList[i].QMI_ITEM_SN ;
    							if(rccList[i].QMI_ITEM_NAME != null) QTI_ITEM_NAME =rccList[i].QMI_ITEM_NAME ;
    							if(rccList[i].ITEMTYPE != null) TDITEMTYPE =rccList[i].ITEMTYPE ;
    							if(rccList[i].ITEMCLASS != null) TDITEMCLASS =rccList[i].ITEMCLASS ;
    							if(rccList[i].QMI_ITEM_CLASS!=null) itemClass =rccList[i].QMI_ITEM_CLASS;
    							if(rccList[i].QMI_ITEM_MAXVALUE!=null) QTI_ITEM_MAXVALUE =rccList[i].QMI_ITEM_MAXVALUE;
    							if(rccList[i].QMI_ITEM_MINVALUE!=null) QTI_ITEM_MINVALUE = rccList[i].QMI_ITEM_MINVALUE;
    							if(rccList[i].QMI_ITEM_UNIT!=null) QTI_ITEM_UNIT =rccList[i].QMI_ITEM_UNIT;	
    							if(rccList[i].QMI_TEST_METHOD!=null) QTI_TEST_METHOD =rccList[i].QMI_TEST_METHOD;
    							if(rccList[i].QMI_TEST_CONTENT!=null) QTI_TEST_CONTENT = rccList[i].QMI_TEST_CONTENT;
    							if(rccList[i].QMI_TEST_SEQ!=null) QTI_TEST_SEQ =rccList[i].QMI_TEST_SEQ;	

				    			$("#addModelList").append("<tr id='trr"+rccList[i].QTI_ID+"' name='trname' ></tr>");
    							$("#addModelList tr:last").append("<td id='iptseq"+$(this).attr("id")+"' style='width: 30px;text-align: center;'>"+(len+1)+"</td>");
    							$("#addModelList tr:last").append("<td style='width: 30px;text-align: center;'><input  type='checkbox' /></td>");
    							
                                $("#addModelList tr:last").append("<td style='width: 80px;text-align: center;text-overflow:ellipsis;'>"+QTI_TEST_STEP+"<input  type='hidden' name='testStep' value='"+QTI_TEST_STEP+"'/></td>");
                                $("#addModelList tr:last").append("<td style='width: 100px;text-align: center;text-overflow:ellipsis;'>"+QTI_ITEM_SN+"<input  type='hidden' name='qtiSn' value='"+QTI_ITEM_SN+"'/></td>");
                                $("#addModelList tr:last").append("<td style='width: 100px;text-align: center;text-overflow:ellipsis;'>"+QTI_ITEM_NAME+"<input  type='hidden' name='qtiName' value='"+QTI_ITEM_NAME+"'/></td>");
                                $("#addModelList tr:last").append("<td style='width: 100px;text-align: center;text-overflow:ellipsis;'>"+TDITEMTYPE+"<input  type='hidden' name='qtiType' value='"+itemType+"'/></td>");
                                $("#addModelList tr:last").append("<td style='width: 80px;text-align: center;text-overflow:ellipsis;'>"+TDITEMCLASS+"<input  type='hidden' name='itemClass' value='"+itemClass+"'/></td>");
                                if(itemClass==0){
                                    $("#addModelList tr:last").append("<td class='datagrid-cell' style='width: 70px;text-align: center;padding:0;text-overflow:ellipsis;'><input type='text' style='width: 70px;padding:0;' id='maxValue_"+tempCount+"' name='maxValue'  maxlength='9'  class='_VAL_NULL input isSubmit' value='"+QTI_ITEM_MAXVALUE+"'/></td>");
                                    $("#addModelList tr:last").append("<td class='datagrid-cell' style='width: 70px;text-align: center;padding:0;text-overflow:ellipsis;'><input type='text' style='width: 70px;padding:0;' id='minValue_"+tempCount+"' name='minValue'  maxlength='9'  class='_VAL_NULL input isSubmit' value='"+QTI_ITEM_MINVALUE+"'/></td>");
                                }
                                if(itemClass==1){
                                    $("#addModelList tr:last").append("<td class='datagrid-cell' style='width: 70px;text-align: center;padding:0;text-overflow:ellipsis;'><input type='text' style='width: 70px;padding:0;' id='maxValue_"+tempCount+"' name='maxValue'  maxlength='9'  class='_VAL_NULL input isSubmit' value='"+QTI_ITEM_MAXVALUE+"'/></td>");
                                    $("#addModelList tr:last").append("<td class='datagrid-cell' style='width: 70px;text-align: center;padding:0;text-overflow:ellipsis;'>"+QTI_ITEM_MINVALUE+"<input type='hidden' name='minValue' value='"+QTI_ITEM_MINVALUE+"'/></td>");
                                }
                                if(itemClass==2){
                                    $("#addModelList tr:last").append("<td class='datagrid-cell' style='width: 70px;text-align: center;padding:0;text-overflow:ellipsis;'>"+QTI_ITEM_MAXVALUE+"<input type='hidden' name='maxValue' value='"+QTI_ITEM_MAXVALUE+"'/></td>");
                                    $("#addModelList tr:last").append("<td class='datagrid-cell' style='width: 70px;text-align: center;padding:0;text-overflow:ellipsis;'>"+QTI_ITEM_MINVALUE+"<input type='hidden' name='minValue' value='"+QTI_ITEM_MINVALUE+"'/></td>");
                                }
                                $("#addModelList tr:last").append("<td style='width: 70px;text-align: center;padding:0;text-overflow:ellipsis;'><input type='text' style='width: 70px;padding:0;' maxlength='30'  class=' input isSubmit' name='itemUnit' value='"+QTI_ITEM_UNIT+"'/></td>");
                                $("#addModelList tr:last").append("<td style='width: 130px;text-align: center;padding:0;text-overflow:ellipsis;'><input type='text' style='width: 130px;padding:0;' maxlength='50'  class=' input isSubmit' name='testMethod' value='"+QTI_TEST_METHOD+"'/></td>");
                                $("#addModelList tr:last").append("<td style='width: 130px;text-align: center;padding:0;text-overflow:ellipsis;'><input type='text' style='width: 130px;padding:0;' maxlength='100'  class=' input isSubmit' name='testContent' value='"+QTI_TEST_CONTENT+"'/></td>");
                                $("#addModelList tr:last").append("<td style='width: 130px;text-align: center;padding:0;text-overflow:ellipsis;'><input  type='text' style='width: 100%;padding:0;' maxlength='9'  class=' input isSubmit' name='testSeq' value='"+QTI_TEST_SEQ+"'/></td>");
                            	len = len+1;
    		                    tempCount++;
							}
							//init();
						//	var tableTrJs = $("#datagrid-btable-ajax123456 tbody tr");
						//	_tongLineColor(tableTrJs);
						//	clickTr('modelTbody');
						//	defTableWidthRewrite("123456");
						
						}
					},
				    error: function(msg){
						util.closeLoading();
						//utilsFp.alert("error:"+msg);
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
				  }
				});

//var tableTrJs = $("#datagrid-btable-ajax123456 tbody tr");
//							_tongLineColor(tableTrJs);
//							clickTr('modelTbody');
//							defTableWidthRewrite("123456");
		//	var tableTrJs = $("#addModelList tr");
				//			_tongLineColor(tableTrJs);
				//			clickTr('addModelList');
					//			defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
		}
 		//设备信息关联删除
		function delRow(){
			$("#addModelList :checkbox").each(function(){
				if($(this).attr("checked")){
					var trid = $(this).parent().parent().attr("id");
					console.log(trid);
					$("#"+trid).remove();
					//$("#"+trid).remove();
				}
			});
			reSort("addModelList");
		//	var tableTrJs = $("#addModelList tr");
		//	_tongLineColor(tableTrJs);
		//	clickTr('addModelList');
		//		defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
		}
		//重新排序
    function reSort(objid){
         
         var i = 1;
         $("#"+objid+" tr").each(function(){
         
         $(this).find("td").eq(0).text(i);
         
         i++;
      });
     }
     
             //全选
     	function getAllModel(){
		if($("#model_list_cb").attr("checked")=="checked"){
			$("#modelTbody :checkbox").attr("checked",true);
		}else{
			$("#modelTbody :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	}   
	       //全选2
     	function getAllModels(){
		if($("#allSelect").attr("checked")=="checked"){
			$("#addModelList :checkbox").attr("checked",true);
		}else{
			$("#addModelList :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	}
	function emptyStep(){
	  $("#addModelList").empty();
	}
	
	function checkVal(){
	    var tempVal1;
	    var tempVal2;
		var tempId;
		var tempFlag1;
		var tempFlag2;
		var tempFlag3;
		for(var i=1;i<=tempCount;i++){
		    tempVal1 = $("#maxValue_"+i).val();
		    if(tempVal1!=undefined){ 
		        tempId = document.getElementById("maxValue_"+i);
		        tempFlag1 = checkNum(tempVal1,tempId);
		        if(tempFlag1=="0") break;
		    }
		    tempVal2 = $("#minValue_"+i).val();
		    if(tempVal2!=undefined){    
		        tempId = document.getElementById("minValue_"+i);
		        tempFlag2 = checkNum(tempVal2,tempId);
		        if(tempFlag2=="0") break;
		    }
		    if(tempVal1!=undefined&&tempVal2!=undefined){
		        tempId = document.getElementById("maxValue_"+i);
		        tempFlag3 = checkNum1(tempVal1,tempVal2,tempId);
		        if(tempFlag3=="0") break;
		    }
		}
		if(tempFlag1=="0"||tempFlag2=="0"||tempFlag3=="0"){
		    return "0";
		}
	}
	
	
	function checkNum(tempVal,tempId){
		if(!(/^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/.test( tempVal )) || parseInt(tempVal) < 0){
			    _alertValMsg(tempId,"<dict:lang value="该项必须为正数" />");
			    return "0";  
		}else 
		return "1"; 
	}
	
	function checkNum1(tempVal1,tempVal2,tempId){
	    tempVal1=parseInt(tempVal1);
	    tempVal2=parseInt(tempVal2);
		if(tempVal1 < tempVal2){ 
			    _alertValMsg(tempId,"<dict:lang value="上限值不能小于下限值" />");
			    return "0";  
		}else 
		return "1"; 
	}
	
	function addModel(){
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
                        var tempT = checkVal();
                        if(tempT=="0"){
				return ;
			}
			var type=$("#paraMap1_QMI_ADD_TYPE").val();
        	if(type=="1"){
        	
        	    if($('#paraMap1_QMI_MODEL_CODE_SHOW').val()==""){
        	        _alertValMsg($('#paraMap1_QMI_MODEL_CODE_SHOW'),"<dict:lang value="该项不能为空" />");
        	        return;
        	    }
        	}else if(type=="2"){		
                if($('#paraMap1_QMI_ITEM_GENRE').val()==""){
        	        _alertValMsg($('#paraMap1_QMI_ITEM_GENRE_chosen'),"<dict:lang value="该项不能为空" />");
        	        return;						
        		}
        	}
        	$("#modelCode").val($.trim($("#paraMap1_QMI_MODEL_CODE").val()));
            $("#itemGenre").val($.trim($("#paraMap1_QMI_ITEM_GENRE").val()));
  document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=d9ce1f881f8645f699097ed91590d179";
  document.forms.addForm.submit();
}
	
 </script>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="inHead" />
    </jsp:include> 
</head>
<body>
<div class="mod">
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
					target="submitFrame">
            <div class="hd" style="background-color:#f6f5f7;padding-bottom:10px;">
            	
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;">
                <div class="save-close" <dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
                <s:if test="${isDataAuth == '1'}">
                		<span class="dot">*</span><dict:lang value="组织机构" />
                		<s:if test="${fn:length(deptLs)==1}">
                   			<s:select list="deptLs" listKey="id" listValue="name"  name="_DATA_AUTH"
								id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
                   		</s:if>
                   		<s:else>
                			<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
								listKey="id" listValue="name"  name="_DATA_AUTH"
								id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
		   				</s:else>
                	</s:if>	
                </div>
			    <div class="optn">
			        <button type="button" onclick="addModel();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd"  style="height:534px;border:0;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="39d36d92711a4c7789582bf04f5a16e3" type="add" />
	<div class="mod-hd">
		<h3 class="tit"><dict:lang value="基本信息" /></h3>
        </div>
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="39d36d92711a4c7789582bf04f5a16e3" />
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<input type="hidden" name="formId" id="formId3" value='123456'/>
	<input type="hidden" name="39d36d92711a4c7789582bf04f5a16e3" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="modelCode" id="modelCode" value="" />
	<input type="hidden" name="itemGenre" id="itemGenre" value="" />
		<s:set name="_$viewId" value="'de08d5d6abea4d42bcaf9e34dbfd4a5e'" />
		<s:set name="_$formId_1" value="'39d36d92711a4c7789582bf04f5a16e3'" />
		<s:set name="_$type" value="'add'" />
		<tr>
		    <td class="name" /><span class="dot">*</span><bu:uitn colNo="QMI_ADD_TYPE" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<bu:td cssClass="dec" colNo="QMI_ADD_TYPE" formId="39d36d92711a4c7789582bf04f5a16e3" ><bu:ui colNo="QMI_ADD_TYPE" formId="39d36d92711a4c7789582bf04f5a16e3" value="%{QMI_ADD_TYPE}" formIndex="1"/></bu:td>	

			<td class="name" /><span class="dot">*</span><bu:uitn colNo="QMI_TEST_STEP" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<bu:td cssClass="dec" colNo="QMI_TEST_STEP" formId="39d36d92711a4c7789582bf04f5a16e3" ><bu:ui colNo="QMI_TEST_STEP" formId="39d36d92711a4c7789582bf04f5a16e3"  value="%{QMI_TEST_STEP}" formIndex="1"  onchange="emptyStep()" /></bu:td>
		</tr>
		<tr>
		    <td class="name" /><span class="dot">*</span><bu:uitn colNo="QMI_MODEL_CODE" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<bu:td cssClass="dec" colNo="QMI_MODEL_CODE" formId="39d36d92711a4c7789582bf04f5a16e3" ><bu:ui colNo="QMI_MODEL_CODE" formId="39d36d92711a4c7789582bf04f5a16e3"  disabled="disabled" value="%{QMI_MODEL_CODE}" formIndex="1"/></bu:td>	

			<td class="name" /><span class="dot">*</span><bu:uitn colNo="QMI_ITEM_GENRE" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<bu:td cssClass="dec" colNo="QMI_ITEM_GENRE" formId="39d36d92711a4c7789582bf04f5a16e3" ><bu:ui colNo="QMI_ITEM_GENRE" formId="39d36d92711a4c7789582bf04f5a16e3"  disabled="disabled" value="%{QMI_ITEM_GENRE}" formIndex="1"/></bu:td>	
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QMI_MODEL_NAME" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<bu:td cssClass="dec" colNo="QMI_MODEL_NAME" formId="39d36d92711a4c7789582bf04f5a16e3" ><bu:ui colNo="QMI_MODEL_NAME" formId="39d36d92711a4c7789582bf04f5a16e3" value="%{QMI_MODEL_NAME}" formIndex="1" /></bu:td>			
			<td class="name" /><bu:uitn colNo="QMI_MODEL_SPEC" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<bu:td cssClass="dec" colNo="QMI_MODEL_SPEC" formId="39d36d92711a4c7789582bf04f5a16e3" ><bu:ui colNo="QMI_MODEL_SPEC" formId="39d36d92711a4c7789582bf04f5a16e3" value="%{QMI_MODEL_SPEC}" formIndex="1" /></bu:td>
		</tr>
	</table>
	<div class="mod-hd">
		<h3 class="tit"><dict:lang value="检测项目信息" /></h3>
		<div class="extend-btn" id="addDel" style="float: right;margin-top:5px;margin-bottom:5px;">
        	<button type="button" onclick="popModelDiv('addModel','backModel');" style="padding:0;" title="新增">
        		<i class="ico ico-kl-new-add ico-small"></i>
        	</button>
        	<button type="button" onclick="delRow();" style="padding:0" title="删除">
        		<i class="ico ico-sc-new-add ico-small"></i>
        	</button>
        </div>
        </div>	
        
			<bu:jsVal formId="39d36d92711a4c7789582bf04f5a16e3" formIndex="1" />
			<div class="mod" >
<div class="mod-bd" style="margin-top:5px;border-bottom: none;">
  <div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"
						id="datagrid-view" style="">
						<div class="datagrid-header">
							<div class="datagrid-header-inner head1" id="datagrid-header-inner1"
								>
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
											<td class="datagrid-cell" style="width:30px;"></td>
											<td class="datagrid-cell" style="width:30px;"><input
												type="checkbox" id="allSelect" name="allSelect" onchange="getAllModels();" />
											</td>
											
											<td class="datagrid-cell" style="width:80px;"><dict:lang
													value="检测阶别" />
											</td>
											<td class="datagrid-cell" style="width:100px;"><dict:lang
													value="项目代码" />
											</td>
											<td class="datagrid-cell" style="width:100px;"><dict:lang
													value="项目名称" />
											</td>
											<td class="datagrid-cell" style="width:100px;"><dict:lang
													value="项目类型" />
											</td>
											<td class="datagrid-cell" style="width:80px;"><dict:lang
													value="值域" />
											</td>
											<td class="datagrid-cell" style="width:70px;"><dict:lang
													value="上限值" />
											</td>
											<td class="datagrid-cell" style="width:70px;"><dict:lang
													value="下限值" />
											</td>
											<td class="datagrid-cell" style="width:70px;"><dict:lang
													value="单位" />
											</td>
											<td class="datagrid-cell" style="width:130px;"><dict:lang
													value="检测方法" />
											</td>
											<td class="datagrid-cell" style="width:130px;"><dict:lang
													value="检测说明" />
											</td>																						
											<td class="datagrid-cell" style="width:130px;"><dict:lang value="顺序" />
											</td>	
										</tr>
									</tbody>
								</table>
							</div>
						</div>


						<div class="datagrid-body datagrid-div3 scroll1" id="datagrid-body"
							style="height:305px;" >
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="addModelList">
								
								</tbody>
							</table>
						</div>

					</div>
				</div>

</div>
	
									
			</div>
	<div >
		<div id="backModel" class="dialog-mask" style="z-index:1029px;"/></div>
		<div class="dialog dialog-s1" id="addModel" style="display:none;z-index:1030;margin-left:0px;left:16px;top:10px;width:780px;height:560px;">
			<div class="dialog-hd">
			<h3 class="tit">
			<dict:lang value="选择物料" />
			</h3>
			</div>
				<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addModel','backModel');"></a>
				<div class="dialog-bd-div" style="width:100%;height:calc(100% - 37px);">
					<div class="optn optn_div">
			        <button type="button" onclick="addModelList('addModel','backModel');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv('addModel','backModel');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				<button type="button" onclick="searchModelInfo('formId3');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
				         </div>
				      
				<table class="basic-table">
				 <tr style="height: 35px;">
			    		<td style="width: 90px;text-align: right;" ><dict:lang value="项目类型"/>&nbsp;</td>
			    		<td style="width: 162px;text-align: left;"><select id="searchDevTypeSelect" name="searchDevTypeSelect" class=" input isSubmit  dept_select"> <option  value="">--请选择--</option> </select></td>
			    		<td  style="width: 90px;text-align: right;" ><dict:lang value="项目代码"/>&nbsp;</td>
			    		<td  style="width: 162px;text-align: left;"><input  type="text" id="searchEqSN" class="input" style="width:157px;"/></td>
			    		<td  style="width: 90px;text-align: right;"><dict:lang value="项目名称"/>&nbsp;</td>
			    		<td  style="width: 162px;text-align: left;"><input  type="text" id="searchEqName" class="input" style="width:157px;"/></td>
			    		
			    	</tr>
			    	</table>
			    	
			    	<div class="panel datagrid datagrid-div1">
    					<div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view">
    						<div class="datagrid-header" style="width:100%;">
    							<div class="datagrid-header-inner head2" style="width:100%;" id="datagrid-header-inner2">
    								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz " id="datagrid-htable123456">
    									<tbody>
    									<tr class="datagrid-header-row datagrid-title-ajax">
    										<td style="width: 30px;text-align: center;"></td >
        									<td style="width: 30px;text-align: center;"><input type="checkbox" id="model_list_cb"  onchange="getAllModel();" /></td >
        									<td style="width: 120px;text-align: center;"><dict:lang value="项目代码" /></td >
        									<td style="width: 120px;text-align: center;"><dict:lang value="项目名称" /></td >
        									<td style="width: 100px;text-align: center;"><dict:lang value="项目类型" /></td >
        									<td style="width: 100px;text-align: center;"><dict:lang value="值域" /></td >
        									<td style="width: 60px;text-align: center;"><dict:lang value="上限值" /></td >
        									<td style="width: 60px;text-align: center;"><dict:lang value="下限值" /></td >
        									<td style="width: 90px;text-align: center;"><dict:lang value="单位" /></td >		
    									</tr>
    									</tbody>		
    								</table>
    							</div>
    						</div>
    						<div class="datagrid-body datagrid-div3 scroll2"   style="height:380px;">
    							<table class="datagrid-btable fixedTable " style="table-layout:fixed;"  id="datagrid-btable-ajax123456" >
    								<tbody id="modelTbody" >
    								</tbody>
    							</table>
    						</div>
    					</div>
    				</div>
				<div style="background-color: white;" id="pageDiv">
                                 <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchModelInfo&formId=formId3&showLoading=0" />
                                 </div>		
				</div>
				

	</div>
            </div>
		 </form>
	</div>
   
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll1','.head1');
    setPopScroll('.scroll2','.head2');
    //setPopScroll('.scroll')
    defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
  })
})(jQuery)</script>	 
<script>
  $("#paraMap1_QMI_ADD_TYPE").change(function(){
      var type=$(this).val();
      if(type=="1"){
          //机种
        $("#paraMap1_QMI_MODEL_CODE_SHOW").attr("disabled",false);
        $("#paraMap1_QMI_ITEM_GENRE").attr("disabled",true);
        $("#paraMap1_QMI_MODEL_CODE_SHOW").val("");
    	$("#paraMap1_QMI_MODEL_CODE").val("");
    	$("#paraMap1_QMI_MODEL_NAME").val("");
    	$("#paraMap1_QMI_MODEL_SPEC").val("");
	    $("#paraMap1_QMI_ITEM_GENRE option:eq(0)").attr("selected","selected");
		$("#paraMap1_QMI_ITEM_GENRE").trigger("chosen:updated");
		$("#addModelList").empty();
      }else if(type=="2"){
          //物料类别
        $("#paraMap1_QMI_MODEL_CODE_SHOW").attr("disabled",true);
        $("#paraMap1_QMI_ITEM_GENRE").attr("disabled", false);
        $("#paraMap1_QMI_MODEL_CODE_SHOW").val("");
    	$("#paraMap1_QMI_MODEL_CODE").val("");
    	$("#paraMap1_QMI_MODEL_NAME").val("");
    	$("#paraMap1_QMI_MODEL_SPEC").val("");
	    $("#paraMap1_QMI_ITEM_GENRE option:eq(0)").attr("selected","selected");
		$("#paraMap1_QMI_ITEM_GENRE").trigger("chosen:updated");
		$("#addModelList").empty();
      }else{
        $("#paraMap1_QMI_MODEL_CODE_SHOW").attr("disabled",true);
        $("#paraMap1_QMI_ITEM_GENRE").attr("disabled", true);
        $("#paraMap1_QMI_MODEL_CODE_SHOW").val("");
    	$("#paraMap1_QMI_MODEL_CODE").val("");
    	$("#paraMap1_QMI_MODEL_NAME").val("");
    	$("#paraMap1_QMI_MODEL_SPEC").val("");
	    $("#paraMap1_QMI_ITEM_GENRE option:eq(0)").attr("selected","selected");
		$("#paraMap1_QMI_ITEM_GENRE").trigger("chosen:updated");  
		$("#addModelList").empty();
      }
  });
      
</script>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
</div>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
<bu:submit viewId="de08d5d6abea4d42bcaf9e34dbfd4a5e" />
<bu:script viewId="de08d5d6abea4d42bcaf9e34dbfd4a5e" />
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 
