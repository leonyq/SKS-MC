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
    
 <script>
 //ajax回填值
 var tempCount = 1;
function setValue(){
var getModelUrl="${path}buss/bussModel_exeFunc.ms?funcMId=1ab9131ced934f0fa1e07a81bea2f920";//VM-机种检测项目修改页面 操作功能 Ajax回填项目信息
    var modelCode = $("#paraMapObj_QMI_MODEL_CODE").val();
    var testStep = $("#paraMapObj_QMI_TEST_STEP").val();
	var itemGenre = $("#paraMapObj_QMI_ITEM_GENRE").val();
	var dataAuth = $("#deptLs_data_auth").val();
	$("#paraModelCode").val(modelCode);
	$("#paraStep").val($("#paraMapObj_QMI_TEST_STEP").val());
	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: getModelUrl,
			    data: {"modelCode":modelCode,"testStep":testStep,"itemGenre":itemGenre, "dataAuth":dataAuth},
				success: function(data){
							var modList=data.ajaxList;
							if(modList!=""){
								for(var i=0;i<modList.length;i++){
									if(modList[i].QMI_ITEM_MAXVALUE==null) modList[i].QMI_ITEM_MAXVALUE="";
									if(modList[i].QMI_ITEM_MINVALUE==null) modList[i].QMI_ITEM_MINVALUE="";
									if(modList[i].QMI_ITEM_UNIT==null) modList[i].QMI_ITEM_UNIT="";
									if(modList[i].QMI_TEST_METHOD==null) modList[i].QMI_TEST_METHOD="";
									if(modList[i].QMI_TEST_CONTENT==null) modList[i].QMI_TEST_CONTENT="";
									if(modList[i].QMI_TEST_SEQ==null) modList[i].QMI_TEST_SEQ="";
									$("#addModelList").append("<tr id='trr"+modList[i].QTI_ID+"' name='trname' ></tr>");
									$("#addModelList tr:last").append("<td id='iptseq"+modList[i].ID+"' style='width: 30px;text-align: center;'>"+(i+1)+"</td>");
									$("#addModelList tr:last").append("<td style='width: 30px;text-align: center;'><input  type='checkbox' /></td>");
														
								    $("#addModelList tr:last").append("<td style='width: 80px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>"+modList[i].MSTEP+"<input  type='hidden' name='testStep' value='"+modList[i].QMI_TEST_STEP+"'/></td>");
                                                        $("#addModelList tr:last").append("<td style='width: 100px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>"+modList[i].QMI_ITEM_SN+"<input  type='hidden' name='qtiSn' value='"+modList[i].QMI_ITEM_SN+"'/></td>");
                                                        $("#addModelList tr:last").append("<td style='width: 100px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>"+modList[i].QMI_ITEM_NAME+"<input  type='hidden' name='qtiName' value='"+modList[i].QMI_ITEM_NAME+"'/></td>");
                                                        $("#addModelList tr:last").append("<td style='width: 100px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>"+modList[i].MTYPE+"<input  type='hidden' name='qtiType' value='"+modList[i].QMI_ITEM_TYPE+"'/></td>");
                                                        $("#addModelList tr:last").append("<td style='width: 80px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>"+modList[i].MCLASS+"<input  type='hidden' name='itemClass' value='"+modList[i].QMI_ITEM_CLASS+"'/></td>");
                                                        if(modList[i].QMI_ITEM_CLASS==0){
                                                            $("#addModelList tr:last").append("<td class='datagrid-cell' style='width: 70px;text-align: center;white-space:nowrap;padding:0;text-overflow:ellipsis;'><input type='text' style='width: 70px;padding:0;' id='maxValue_"+tempCount+"' name='maxValue'  maxlength='9'  class='_VAL_NULL input isSubmit' value='"+modList[i].QMI_ITEM_MAXVALUE+"'/></td>");
                                                            $("#addModelList tr:last").append("<td class='datagrid-cell' style='width: 70px;text-align: center;white-space:nowrap;padding:0;text-overflow:ellipsis;'><input type='text' style='width: 70px;padding:0;' id='minValue_"+tempCount+"' name='minValue'  maxlength='9'  class='_VAL_NULL input isSubmit' value='"+modList[i].QMI_ITEM_MINVALUE+"'/></td>");
                                                        }
                                                        if(modList[i].QMI_ITEM_CLASS==1){
                                                            $("#addModelList tr:last").append("<td class='datagrid-cell' style='width: 70px;text-align: center;white-space:nowrap;padding:0;text-overflow:ellipsis;'><input type='text' style='width: 70px;padding:0;' id='maxValue_"+tempCount+"' name='maxValue'  maxlength='9'  class='_VAL_NULL input isSubmit' value='"+modList[i].QMI_ITEM_MAXVALUE+"'/></td>");
                                                            $("#addModelList tr:last").append("<td class='datagrid-cell' style='width: 70px;text-align: left;white-space:nowrap;padding:0;text-overflow:ellipsis;'><input type='hidden' name='minValue' value='"+modList[i].QMI_ITEM_MINVALUE+"'/></td>");
                                                        }
                                                        if(modList[i].QMI_ITEM_CLASS==2){
                                                            $("#addModelList tr:last").append("<td class='datagrid-cell' style='width: 70px;text-align: left;white-space:nowrap;padding:0;text-overflow:ellipsis;'><input type='hidden' name='maxValue' value='"+modList[i].QMI_ITEM_MAXVALUE+"'/></td>");
                                                            $("#addModelList tr:last").append("<td class='datagrid-cell' style='width: 70px;text-align: left;white-space:nowrap;padding:0;text-overflow:ellipsis;'><input type='hidden' name='minValue' value='"+modList[i].QMI_ITEM_MINVALUE+"'/></td>");
                                                        }
                                                        $("#addModelList tr:last").append("<td style='width: 70px;text-align: center;white-space:nowrap;padding:0;text-overflow:ellipsis;'><input type='text' style='width: 70px;padding:0;' maxlength='30'  class=' input isSubmit' name='itemUnit' value='"+modList[i].QMI_ITEM_UNIT+"'/></td>");
                                                        $("#addModelList tr:last").append("<td style='width: 130px;text-align: center;white-space:nowrap;padding:0;text-overflow:ellipsis;'><input type='text' style='width: 130px;padding:0;' maxlength='50'  class=' input isSubmit' name='testMethod' value='"+modList[i].QMI_TEST_METHOD+"'/></td>");
                                                        $("#addModelList tr:last").append("<td style='width: 130px;text-align: center;white-space:nowrap;padding:0;text-overflow:ellipsis;'><input type='text' style='width: 130px;padding:0;' maxlength='100'  class=' input isSubmit' name='testContent' value='"+modList[i].QMI_TEST_CONTENT+"'/></td>");
                                                        $("#addModelList tr:last").append("<td style='width: 130px;text-align: center;white-space:nowrap;padding:0;text-overflow:ellipsis;'><input  type='text' style='width: 100%;padding:0;' maxlength='9'  class=' input isSubmit' name='testSeq' value='"+modList[i].QMI_TEST_SEQ+"'/></td>");
                                                    
										                    tempCount++;
								}
								var tableTrJs = $("#addModelList tr");
							_tongLineColor(tableTrJs);
							clickTr('addModelList ');
							defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
							}
			},
			error: function(msg){
							if(msg.readyState!=0){
     					util.closeLoading();
			    		utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
     			       }
		  			}
			});
} 

$(function(){
    setValue();
})

function getModTypeSelect(){
$.ajax({
	type: "POST",
	dataType: "json",
	url: "buss/bussModel_exeFunc.ms?funcMId=0678aba9a2af468da062df5f62a0418f",//VM-机种检测项目修改页面 操作功能 获取项目类型
	data: "",
	success: function(data){
		if(null == data){ return ;}
		if(null != data.ajaxList){
                        
			$("#searchDevTypeSelect").empty();
			$("#searchDevTypeSelect").append("<option value=''><dict:lang value="--请选择--" /></option>");
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
function popModelDiv(showId,backId){
		    $("#searchDevTypeSelect").val("");
            $("#searchDevTypeSelect").trigger("chosen:updated");
            $("#searchEqSN").val("");	
            $("#searchEqName").val("");			

		        $("#"+showId+",#"+backId).show();
			$("#"+showId).draggable({cancel:'.dialog-bd-div'});
			$('.chosen-container').css("width","157px");
			getModel();
			getModTypeSelect();
	}
function hideDiv(showId,backId){
			$(' .chosen-container').css("width","230px");
			//var value = $("#add_type").val();
			$("#"+showId+",#"+backId).hide();
			$("#role_list_cb").attr("checked",false);
			$("#job_list_cb").attr("checked",false);
			closeDivFp(showId+"pop");
		}
function getModel(){
                        var checkType = $("#paraMapObj_QMI_TEST_STEP").val();
                        var modelCode = $("#paraModelCode").val();
                        var dataAuth = $("#deptLs_data_auth").val();
			util.showLoading("处理中...");
			var jsondata = { "type": "2","checkType": checkType, "paraModelCode":modelCode, "dataAuth":dataAuth};
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url:"buss/bussModel_exeFunc.ms?funcMId=aa78b1a6b93149eb8054f6d2c1681c07",//VM-机种检测项目新增页面 操作功能 检测项目弹窗
			    data: jsondata,
				success: function(data){
						util.closeLoading();
						if(null == data.ajaxPage.dataList){
				                
				                $("#modelTbody").empty();
				                pageFun(data.ajaxPage,"formId3");
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
								$("#modelTbody tr:last").append("<td style='width: 112px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].QTI_ITEM_NAME+"'>"+data.ajaxPage.dataList[i].QTI_ITEM_NAME+"<input type='hidden' id='QTI_ITEM_NAME"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].QTI_ITEM_NAME+"'/></td>");
								$("#modelTbody tr:last").append("<td style='width: 127px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+(data.ajaxPage.dataList[i].QTI_ITEM_TYPE==null?"":data.ajaxPage.dataList[i].QTI_ITEM_TYPE)+"' id='TDITEMTYPE"+data.ajaxPage.dataList[i].ID+"' >"+(data.ajaxPage.dataList[i].ITEMTYPE==null?"":data.ajaxPage.dataList[i].ITEMTYPE)+"<input type='hidden' id='QTI_ITEM_TYPE"+data.ajaxPage.dataList[i].ID+"' value='"+(data.ajaxPage.dataList[i].QTI_ITEM_TYPE==null?"":data.ajaxPage.dataList[i].QTI_ITEM_TYPE)+"' /></td>");
								$("#modelTbody tr:last").append("<td style='width: 89px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+(data.ajaxPage.dataList[i].QTI_ITEM_CLASS==null?"":data.ajaxPage.dataList[i].QTI_ITEM_CLASS)+"' id='TDITEMCLASS"+data.ajaxPage.dataList[i].ID+"' >"+(data.ajaxPage.dataList[i].ITEMCLASS==null?"":data.ajaxPage.dataList[i].ITEMCLASS)+"<input type='hidden' id='QTI_ITEM_CLASS"+data.ajaxPage.dataList[i].ID+"' value='"+(data.ajaxPage.dataList[i].QTI_ITEM_CLASS==null?"":data.ajaxPage.dataList[i].QTI_ITEM_CLASS)+"' /></td>");
								$("#modelTbody tr:last").append("<td style='width: 57px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+(data.ajaxPage.dataList[i].QTI_ITEM_MAXVALUE==null?"":data.ajaxPage.dataList[i].QTI_ITEM_MAXVALUE)+"'>"+(data.ajaxPage.dataList[i].QTI_ITEM_MAXVALUE==null?"":data.ajaxPage.dataList[i].QTI_ITEM_MAXVALUE)+"<input type='hidden' id='QTI_ITEM_MAXVALUE"+data.ajaxPage.dataList[i].ID+"' value='"+(data.ajaxPage.dataList[i].QTI_ITEM_MAXVALUE==null?"":data.ajaxPage.dataList[i].QTI_ITEM_MAXVALUE)+"' /></td>");
								$("#modelTbody tr:last").append("<td style='width: 57px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+(data.ajaxPage.dataList[i].QTI_ITEM_MINVALUE==null?"":data.ajaxPage.dataList[i].QTI_ITEM_MINVALUE)+"'>"+(data.ajaxPage.dataList[i].QTI_ITEM_MINVALUE==null?"":data.ajaxPage.dataList[i].QTI_ITEM_MINVALUE)+"<input type='hidden' id='QTI_ITEM_MINVALUE"+data.ajaxPage.dataList[i].ID+"' value='"+(data.ajaxPage.dataList[i].QTI_ITEM_MINVALUE==null?"":data.ajaxPage.dataList[i].QTI_ITEM_MINVALUE)+"' /></td>");
								$("#modelTbody tr:last").append("<td style='width: 127px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+(data.ajaxPage.dataList[i].QTI_ITEM_UNIT==null?"":data.ajaxPage.dataList[i].QTI_ITEM_UNIT)+"'>"+(data.ajaxPage.dataList[i].QTI_ITEM_UNIT==null?"":data.ajaxPage.dataList[i].QTI_ITEM_UNIT)+"<input type='hidden' id='QTI_ITEM_UNIT"+data.ajaxPage.dataList[i].ID+"' value='"+(data.ajaxPage.dataList[i].QTI_ITEM_UNIT==null?"":data.ajaxPage.dataList[i].QTI_ITEM_UNIT)+"' /><input type='hidden' id='QTI_TEST_METHOD"+data.ajaxPage.dataList[i].ID+"' value='"+(data.ajaxPage.dataList[i].QTI_TEST_METHOD==null?"":data.ajaxPage.dataList[i].QTI_TEST_METHOD)+"'/><input type='hidden' id='QTI_TEST_CONTENT"+data.ajaxPage.dataList[i].ID+"' value='"+(data.ajaxPage.dataList[i].QTI_TEST_CONTENT==null?"":data.ajaxPage.dataList[i].QTI_TEST_CONTENT)+"'/><input type='hidden' id='QTI_TEST_SEQ"+data.ajaxPage.dataList[i].ID+"' value='"+(data.ajaxPage.dataList[i].QTI_TEST_SEQ==null?"":data.ajaxPage.dataList[i].QTI_TEST_SEQ)+"'/></td>");

								
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
var paginationImpl = {};	
function searchModelInfo(form1){
            var isFirstLoad = firstLoadThisPage(form1);
			var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[form1].currentPage;
			var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[form1].pageRecord;
			
            var checkType = $("#paraMapObj_QMI_TEST_STEP").val();
            var modelType = $("#searchDevTypeSelect").val();
			var modelCode = $("#searchEqSN").val();
			var modelName = $("#searchEqName").val();
			var paramodelCode = $("#paraModelCode").val();
			var dataAuth = $("#deptLs_data_auth").val();
			var jsondata = { 			
                    "type": "2",					
                    "mType": modelType, 					
                    "mCode":modelCode, 						
                    "mName":modelName,					
                    "checkType":checkType,					
                    "paraModelCode":paramodelCode, 					
                    "dataAuth":dataAuth,				
                    "&page.currentPage":currentPage,
                    "&page.pageRecord":pageRecord
			};
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url:"buss/bussModel_exeFunc.ms?funcMId=aa78b1a6b93149eb8054f6d2c1681c07",//VM-机种检测项目新增页面 操作功能 检测项目弹窗
			    data: jsondata,
				success: function(data){
						util.closeLoading();
						if(null == data.ajaxPage.dataList){
				             
				                $("#modelTbody").empty();
				                pageFun(data.ajaxPage,"formId3");
				                
				                return ;}
						if(null != data.ajaxPage.dataList){
						 $('.scroll2').mCustomScrollbar("destroy");
							$(".firstTableClass").show();
							$("#modelTbody").empty();
							for(var i = 0;i < data.ajaxPage.dataList.length; i++){
							           
							           // eqObj= data.ajaxPage.dataList[i];
								$("#modelTbody").append("<tr  style='cursor: pointer;' id='"+data.ajaxPage.dataList[i].ID+"'></tr>");
								$("#modelTbody tr:last").append("<td style='width: 30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");								
								$("#modelTbody tr:last").append("<td style='width: 30px;text-align: center;'><input type='checkbox' id='"+data.ajaxPage.dataList[i].ID+"' name='"+data.ajaxPage.dataList[i].CD_DEVICE_NAME+"' /></td>");
								$("#modelTbody tr:last").append("<td style='width: 120px;text-align: center;'>"+data.ajaxPage.dataList[i].QTI_ITEM_SN+"<input type='hidden' id='QTI_ITEM_SN"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].QTI_ITEM_SN+"' /><input type='hidden' id='DATA_AUTH"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].DEPT+"'/><input type='hidden' id='QTI_TEST_STEP"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].STEP+"'/></td>");
								$("#modelTbody tr:last").append("<td style='width: 112px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].QTI_ITEM_NAME+"'>"+data.ajaxPage.dataList[i].QTI_ITEM_NAME+"<input type='hidden' id='QTI_ITEM_NAME"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].QTI_ITEM_NAME+"'/></td>");
								$("#modelTbody tr:last").append("<td style='width: 127px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+(data.ajaxPage.dataList[i].QTI_ITEM_TYPE==null?"":data.ajaxPage.dataList[i].QTI_ITEM_TYPE)+"' id='TDITEMTYPE"+data.ajaxPage.dataList[i].ID+"' >"+(data.ajaxPage.dataList[i].QTI_ITEM_TYPE==null?"":data.ajaxPage.dataList[i].QTI_ITEM_TYPE)+"<input type='hidden' id='QTI_ITEM_TYPE"+data.ajaxPage.dataList[i].ID+"' value='"+(data.ajaxPage.dataList[i].QTI_ITEM_TYPE==null?"":data.ajaxPage.dataList[i].QTI_ITEM_TYPE)+"' /></td>");
								$("#modelTbody tr:last").append("<td style='width: 89px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+(data.ajaxPage.dataList[i].QTI_ITEM_CLASS==null?"":data.ajaxPage.dataList[i].QTI_ITEM_CLASS)+"' id='TDITEMCLASS"+data.ajaxPage.dataList[i].ID+"' >"+(data.ajaxPage.dataList[i].QTI_ITEM_CLASS==null?"":data.ajaxPage.dataList[i].QTI_ITEM_CLASS)+"<input type='hidden' id='QTI_ITEM_CLASS"+data.ajaxPage.dataList[i].ID+"' value='"+(data.ajaxPage.dataList[i].QTI_ITEM_CLASS==null?"":data.ajaxPage.dataList[i].QTI_ITEM_CLASS)+"' /></td>");
								$("#modelTbody tr:last").append("<td style='width: 57px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+(data.ajaxPage.dataList[i].QTI_ITEM_MAXVALUE==null?"":data.ajaxPage.dataList[i].QTI_ITEM_MAXVALUE)+"'>"+(data.ajaxPage.dataList[i].QTI_ITEM_MAXVALUE==null?"":data.ajaxPage.dataList[i].QTI_ITEM_MAXVALUE)+"<input type='hidden' id='QTI_ITEM_MAXVALUE"+data.ajaxPage.dataList[i].ID+"' value='"+(data.ajaxPage.dataList[i].QTI_ITEM_MAXVALUE==null?"":data.ajaxPage.dataList[i].QTI_ITEM_MAXVALUE)+"' /></td>");
								$("#modelTbody tr:last").append("<td style='width: 57px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+(data.ajaxPage.dataList[i].QTI_ITEM_MINVALUE==null?"":data.ajaxPage.dataList[i].QTI_ITEM_MINVALUE)+"'>"+(data.ajaxPage.dataList[i].QTI_ITEM_MINVALUE==null?"":data.ajaxPage.dataList[i].QTI_ITEM_MINVALUE)+"<input type='hidden' id='QTI_ITEM_MINVALUE"+data.ajaxPage.dataList[i].ID+"' value='"+(data.ajaxPage.dataList[i].QTI_ITEM_MINVALUE==null?"":data.ajaxPage.dataList[i].QTI_ITEM_MINVALUE)+"' /></td>");
								$("#modelTbody tr:last").append("<td style='width: 127px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+(data.ajaxPage.dataList[i].QTI_ITEM_UNIT==null?"":data.ajaxPage.dataList[i].QTI_ITEM_UNIT)+"'>"+(data.ajaxPage.dataList[i].QTI_ITEM_UNIT==null?"":data.ajaxPage.dataList[i].QTI_ITEM_UNIT)+"<input type='hidden' id='QTI_ITEM_UNIT"+data.ajaxPage.dataList[i].ID+"' value='"+(data.ajaxPage.dataList[i].QTI_ITEM_UNIT==null?"":data.ajaxPage.dataList[i].QTI_ITEM_UNIT)+"' /><input type='hidden' id='QTI_TEST_METHOD"+data.ajaxPage.dataList[i].ID+"' value='"+(data.ajaxPage.dataList[i].QTI_TEST_METHOD==null?"":data.ajaxPage.dataList[i].QTI_TEST_METHOD)+"'/><input type='hidden' id='QTI_TEST_CONTENT"+data.ajaxPage.dataList[i].ID+"' value='"+(data.ajaxPage.dataList[i].QTI_TEST_CONTENT==null?"":data.ajaxPage.dataList[i].QTI_TEST_CONTENT)+"'/><input type='hidden' id='QTI_TEST_SEQ"+data.ajaxPage.dataList[i].ID+"' value='"+(data.ajaxPage.dataList[i].QTI_TEST_SEQ==null?"":data.ajaxPage.dataList[i].QTI_TEST_SEQ)+"'/></td>");

								
							}
							//init();
								pageFun(data.ajaxPage,"formId3");
							var tableTrJs = $("#datagrid-btable-ajax123456 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('modelTbody');
							setPopScroll('.scroll2','.head2');
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
 	 function addModelListSave(showId,backId){
	    var len = $("#addModelList tr").length;
	   
	 	$(".firstTableBack").show();
			 $("#modelTbody :checkbox").each(function(){
					if($(this).attr("checked")){
						if (!$("#trr"+$(this).attr("id")).length) {
							$("#addModelList").append("<tr id='trr"+$(this).attr("id")+"' name='trname' ></tr>");
							//$("#addModelList").append("<tr id='trr"+$(this).attr("id")+"' name='trname' "><input  type='hidden' name='deviceName' value='"+$(this).attr("id")+"'/><input id='iptseq"+$(this).attr("id")+"' type='hidden' name='deviceSeq' value='"+(len+1)+"' /></tr>");
							$("#addModelList tr:last").append("<td id='tdseq"+$(this).attr("id")+"' style='width: 30px;text-align: center;'>"+(len+1)+"</td>");
							$("#addModelList tr:last").append("<td style='width: 30px;text-align: center;'><input  type='checkbox' /></td>");
							
                                                        $("#addModelList tr:last").append("<td style='width: 80px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>"+$("#QTI_TEST_STEP"+$(this).attr("id")).val()+"</td>");
                                                        $("#addModelList tr:last").append("<td style='width: 100px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>"+$("#QTI_ITEM_SN"+$(this).attr("id")).val()+"<input  type='hidden' name='qtiSn' value='"+$("#QTI_ITEM_SN"+$(this).attr("id")).val()+"'/></td>");
                                                        $("#addModelList tr:last").append("<td style='width: 100px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>"+$("#QTI_ITEM_NAME"+$(this).attr("id")).val()+"<input  type='hidden' name='qtiName' value='"+$("#QTI_ITEM_NAME"+$(this).attr("id")).val()+"'/></td>");
                                                        $("#addModelList tr:last").append("<td style='width: 100px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>"+$("#TDITEMTYPE"+$(this).attr("id")).text()+"<input  type='hidden' name='qtiType' value='"+$("#QTI_ITEM_TYPE"+$(this).attr("id")).val()+"'/></td>");
                                                        $("#addModelList tr:last").append("<td style='width: 80px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>"+$("#TDITEMCLASS"+$(this).attr("id")).text()+"<input  type='hidden' name='itemClass' value='"+$("#QTI_ITEM_CLASS"+$(this).attr("id")).val()+"'/></td>");
                                                        if($("#QTI_ITEM_CLASS"+$(this).attr("id")).val()==0){
                                                            $("#addModelList tr:last").append("<td class='datagrid-cell' style='width: 70px;text-align: center;white-space:nowrap;padding:0;text-overflow:ellipsis;'><input type='text' style='width: 70px;padding:0;' id='maxValue_"+tempCount+"' name='maxValue'  maxlength='9'  class='_VAL_NULL input isSubmit' value='"+$("#QTI_ITEM_MAXVALUE"+$(this).attr("id")).val()+"'/></td>");
                                                            $("#addModelList tr:last").append("<td class='datagrid-cell' style='width: 70px;text-align: center;white-space:nowrap;padding:0;text-overflow:ellipsis;'><input type='text' style='width: 70px;padding:0;' id='minValue_"+tempCount+"' name='minValue'  maxlength='9'  class='_VAL_NULL input isSubmit' value='"+$("#QTI_ITEM_MINVALUE"+$(this).attr("id")).val()+"'/></td>");
                                                        }
                                                        if($("#QTI_ITEM_CLASS"+$(this).attr("id")).val()==1){
                                                            $("#addModelList tr:last").append("<td class='datagrid-cell' style='width: 70px;text-align: center;white-space:nowrap;padding:0;text-overflow:ellipsis;'><input type='text' style='width: 70px;padding:0;' id='maxValue_"+tempCount+"' name='maxValue'  maxlength='9'  class='_VAL_NULL input isSubmit' value='"+$("#QTI_ITEM_MAXVALUE"+$(this).attr("id")).val()+"'/></td>");
                                                            $("#addModelList tr:last").append("<td class='datagrid-cell' style='width: 70px;white-space:nowrap;padding:0;text-overflow:ellipsis;'>"+$("#QTI_ITEM_MINVALUE"+$(this).attr("id")).val()+"<input type='hidden' name='minValue' value='"+$("#QTI_ITEM_MINVALUE"+$(this).attr("id")).val()+"'/></td>");
                                                        }
                                                        if($("#QTI_ITEM_CLASS"+$(this).attr("id")).val()==2){
                                                            $("#addModelList tr:last").append("<td class='datagrid-cell' style='width: 70px;white-space:nowrap;padding:0;text-overflow:ellipsis;'>"+$("#QTI_ITEM_MAXVALUE"+$(this).attr("id")).val()+"<input type='hidden' name='maxValue' value='"+$("#QTI_ITEM_MAXVALUE"+$(this).attr("id")).val()+"'/></td>");
                                                            $("#addModelList tr:last").append("<td class='datagrid-cell' style='width: 70px;white-space:nowrap;padding:0;text-overflow:ellipsis;'>"+$("#QTI_ITEM_MINVALUE"+$(this).attr("id")).val()+"<input type='hidden' name='minValue' value='"+$("#QTI_ITEM_MINVALUE"+$(this).attr("id")).val()+"'/></td>");
                                                        }
                                                        $("#addModelList tr:last").append("<td style='width: 70px;text-align: center;white-space:nowrap;padding:0;text-overflow:ellipsis;'><input type='text' style='width: 70px;padding:0;' maxlength='30'  class=' input isSubmit' name='itemUnit' value='"+$("#QTI_ITEM_UNIT"+$(this).attr("id")).val()+"'/></td>");
                                                        $("#addModelList tr:last").append("<td style='width: 130px;text-align: center;white-space:nowrap;padding:0;text-overflow:ellipsis;'><input type='text' style='width: 130px;padding:0;' maxlength='30'  class=' input isSubmit' name='testMethod' value='"+$("#QTI_TEST_METHOD"+$(this).attr("id")).val()+"'/></td>");
                                                        $("#addModelList tr:last").append("<td style='width: 130px;text-align: center;white-space:nowrap;padding:0;text-overflow:ellipsis;'><input type='text' style='width:130px;padding:0;' maxlength='30'  class=' input isSubmit' name='testContent' value='"+$("#QTI_TEST_CONTENT"+$(this).attr("id")).val()+"'/></td>");
                                                        $("#addModelList tr:last").append("<td style='width: 130px;text-align: center;padding:0;'><input  type='text' style='width: 100%;padding:0;' maxlength='9'  class=' input isSubmit' name='testSeq' value='"+$("#QTI_TEST_SEQ"+$(this).attr("id")).val()+"'/></td>");
								len = len+1;
								tempCount++;
						}
					}
				});

				//init();
						        var tableTrJs = $("#addModelList tr");
							_tongLineColor(tableTrJs);
							clickTr('addModelList ');
							defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
				
			
			$("#modelTbody").empty();
			document.getElementById(showId).style.display = 'none';
			document.getElementById(backId).style.display = 'none';
			$("#model_list_cb").attr("checked",false);
			$(' .chosen-container').css("width","230px");
		} 
 		//设备信息关联删除
		function delRow(){
			$("#addModelList :checkbox").each(function(){
				if($(this).attr("checked")){
					var trid = $(this).parent().parent().attr("id");
					
					$("#"+trid).remove();
					//$("#"+trid).remove();
				}
			});
			reSort("addModelList");
			var tableTrJs = $("#addModelList tr");
			_tongLineColor(tableTrJs);
			clickTr('addModelList');
			defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
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
		if( tempVal1 < tempVal2){
			    _alertValMsg(tempId,"<dict:lang value="上限值不能小于下限值" />");
			    return "0";  
		}else 
		return "1"; 
	}
	function editModel(){
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
			$("#itemGenre").val($("#paraMapObj_QMI_ITEM_GENRE").val());
			$("#modelCode").val($("#paraMapObj_QMI_MODEL_CODE").val());
			$("#testStep").val($("#paraMapObj_QMI_TEST_STEP").val());
  document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=8725d188b3b64fcab37cff5a326ef991";
  document.forms.editForm.submit();
}
 </script>
</head>
<body>
<div class="mod">
	<div class="edit">
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
            <div class="hd" style="background-color:#f6f5f7;padding-bottom:10px;">
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
			    	        <button type="button" onclick="editModel(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					
			    </div>

			</div>
			<div class="bd" style="height:534px;border:0;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="39d36d92711a4c7789582bf04f5a16e3" type="edit" />
	<div class="mod-hd">
		<h3 class="tit"><dict:lang value="基本信息" /></h3>
        </div>		
	<table class="basic-table" >
	<input type="hidden" id="modelCode" name="modelCode" value="" />
	<input type="hidden" id="paraStep" name="paraStep" value="" />
	<input type="hidden" id="itemGenre" name="itemGenre" value="" />
	<input type="hidden" name="formIds" value="39d36d92711a4c7789582bf04f5a16e3" />
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<input type="hidden" name="formId" id="formId3" value='123456'/>
	<input type="hidden" name="39d36d92711a4c7789582bf04f5a16e3" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	
		<s:set name="_$viewId" value="'a11c80d3679040b087da0da481764cc6'" />
		<s:set name="_$formId_1" value="'39d36d92711a4c7789582bf04f5a16e3'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
		    <td class="name" /><bu:uitn colNo="QMI_TEST_STEP" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<bu:td cssClass="dec" colNo="QMI_TEST_STEP" formId="39d36d92711a4c7789582bf04f5a16e3" ><bu:ui colNo="QMI_TEST_STEP" formId="39d36d92711a4c7789582bf04f5a16e3" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QMI_MODEL_CODE" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<bu:td cssClass="dec" colNo="QMI_MODEL_CODE" formId="39d36d92711a4c7789582bf04f5a16e3" ><bu:ui colNo="QMI_MODEL_CODE" formId="39d36d92711a4c7789582bf04f5a16e3" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>			

		<tr>		
            <td class="name" /><bu:uitn colNo="QMI_ITEM_GENRE" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<bu:td cssClass="dec" colNo="QMI_ITEM_GENRE" formId="39d36d92711a4c7789582bf04f5a16e3" ><bu:ui colNo="QMI_ITEM_GENRE" formId="39d36d92711a4c7789582bf04f5a16e3" dataId="${dataId}" formIndex="1" /></bu:td>
	
			<td class="name" /><bu:uitn colNo="QMI_MODEL_NAME" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<bu:td cssClass="dec" colNo="QMI_MODEL_NAME" formId="39d36d92711a4c7789582bf04f5a16e3" ><bu:ui colNo="QMI_MODEL_NAME" formId="39d36d92711a4c7789582bf04f5a16e3" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>			

		<tr>				
        	<td class="name" /><bu:uitn colNo="QMI_MODEL_SPEC" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<bu:td cssClass="dec" colNo="QMI_MODEL_SPEC" formId="39d36d92711a4c7789582bf04f5a16e3" ><bu:ui colNo="QMI_MODEL_SPEC" formId="39d36d92711a4c7789582bf04f5a16e3" dataId="${dataId}" formIndex="1" /></bu:td>
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
												type="checkbox" id="allSelect" name="allSelect" />
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
						
						<div class="datagrid-body datagrid-div3 scroll1" id="datagrid-body" style="height:305px;" >
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="addModelList">

								</tbody>
							</table>
						</div>



					</div>
				</div>

</div>									
			
		<div >
		<div id="backModel" class="dialog-mask" style="z-index:1029px;"/></div>
		<div class="dialog dialog-s1" id="addModel" style="display:none;z-index:1030;margin-left:0px;left:10px;top:20px;width:780px;height:560px;">
			<div class="dialog-hd">
			<h3 class="tit">
			<dict:lang value="选择检测项目" />
			</h3>
			</div>
				<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addModel','backModel');"></a>
				<div class="dialog-bd-div" style="width:100%;height:calc(100% - 37px);">
					<div class="optn optn_div">
			        <button type="button" onclick="addModelListSave('addModel','backModel');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv('addModel','backModel');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				<button type="button" onclick="searchModelInfo('formId3');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
				         </div>
				      
				<table>
				 <tr style="height:35px;">
			    		<td style="width: 90px;text-align: right;" ><dict:lang value="项目类型"/>&nbsp;</td>
			    		<td style="width: 162px;text-align: left;"><select id="searchDevTypeSelect" name="searchDevTypeSelect" class=" input isSubmit dept_select" style="width: 157px;"> <option  value="">--请选择--</option> </select></td>
			    		<td  style="width: 90px;text-align: right;" ><dict:lang value="项目代码"/>&nbsp;</td>
			    		<td  style="width: 162px;text-align: left;"><input  type="text" id="searchEqSN" class="input" style="width:157px;"/></td>
			    		<td  style="width: 90px;text-align: right;"><dict:lang value="项目名称"/>&nbsp;</td>
			    		<td  style="width: 162px;text-align: left;"><input  type="text" id="searchEqName" class="input" style="width:157px;"/></td>
			    		
			    	</tr>
			    	</table>
				<div class="panel-ajax1 datagrid datagrid-div1" style="margin-top:10px;"><!--143-->
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
							<div class="datagrid-header">
							<div class="datagrid-header-inner head2"  id="">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable123456">
									<tbody>
									<tr class="datagrid-header-row thcolor">
									<td style="width: 30px;text-align: center;"></td >
									<td style="width: 30px;text-align: center;"><input type="checkbox" id="model_list_cb"  onchange="getAllModel();" /></td >
									<td style="width: 120px;text-align: center;"><dict:lang value="项目代码" /></td >
									<td style="width: 112px;text-align: center;"><dict:lang value="项目名称" /></td >
									<td style="width: 127px;text-align: center;"><dict:lang value="项目类型" /></td >
									<td style="width: 89px;text-align: center;"><dict:lang value="值域" /></td >
									<td style="width: 57px;text-align: center;"><dict:lang value="上限值" /></td >
									<td style="width: 57px;text-align: center;"><dict:lang value="下限值" /></td >
									<td style="width: 127px;text-align: center;"><dict:lang value="单位" /></td >						
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll2" style="height:340px;"><!--130-->
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax123456" >
								<tbody id="modelTbody" >
								</tbody>
							</table>
						</div>
						
					</div>
				</div>
				<div style="background-color: white;">
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

	<!-- js初始化方法 -->
    <script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll1','.head1');
    setPopScroll('.scroll2','.head2');
  })
})(jQuery)</script>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
</div>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
  <jsp:param name="modelName" value="VIEW_TYPE_11" />
   <jsp:param name="location" value="jsLoading" />
</jsp:include>
<bu:submit viewId="a11c80d3679040b087da0da481764cc6" />
<bu:script viewId="a11c80d3679040b087da0da481764cc6" />
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 
