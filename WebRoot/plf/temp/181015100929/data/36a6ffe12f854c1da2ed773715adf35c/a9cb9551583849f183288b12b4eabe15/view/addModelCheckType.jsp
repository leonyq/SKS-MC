<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
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
 function searchModelInfo(paginationImpl){
        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=04874ae67fc6445ea54ac4c9e251cacf";

	SearchModelInfo(paginationImpl,url);
}


function addCal(){
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
        	var type=$("#paraMap1_QMT_ADD_TYPE").val();
        	if(type=="1"){
        	
        	    if($('#paraMap1_QMT_MODEL_CODE_SHOW').val()==""){
        	        _alertValMsg($('#paraMap1_QMT_MODEL_CODE_SHOW'),"<dict:lang value="该项不能为空" />");
        	        return;
        	    }
        	}else if(type=="2"){		
                if($('#paraMap1_QMT_ITEM_GENRE').val()==""){
        	        _alertValMsg($('#paraMap1_QMT_ITEM_GENRE_chosen'),"<dict:lang value="该项不能为空" />");
        	        return;						
        		}
        	}
            if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled","disabled");
                        var len1 = $("#addModelList tr").length;
                        if(len1<=0){
                
                            utilsFp.confirmIcon(1,"","","", "<dict:lang value = "请添加检测类型信息" />",0,"260","");
                           return;
                        }
                        $("#modelCode").val($.trim($("#paraMap1_QMT_MODEL_CODE").val()));
                        $("#itemGenre").val($.trim($("#paraMap1_QMT_ITEM_GENRE").val()));
                        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=902ed7de665c493caa698ceb55b68804";
                        document.forms.addForm.submit();
                        
}
 
function popModelDiv(showId,backId){
            var testStep = $("#paraMap1_QMT_TEST_STEP").val();			
            if(testStep==""){
                utilsFp.confirmIcon(1,"","","", "<dict:lang value = "请先选择检测阶别" />",0,"260","");
                return;
            }
            $("#paraMap1_QMT_ITEM_TYPE").val("");
            $("#paraMap1_QMT_ITEM_TYPE").trigger("chosen:updated");
		        $("#"+showId+",#"+backId).show();
			$("#"+showId).draggable();
			
			//$("#searchDevTypeSelect").attr("class"," input isSubmit  dept_select");
			//$("#searchDevTypeSelect").attr("style","width:157px;display: none;");
			//mySetChosen(); 
			$("#paraMap1_QMT_ITEM_TYPE_chosen").attr("style","width:220px;");
			getModel();
			//getModTypeSelect();
	}
function hideDiv(showId,backId){
			//$(' .chosen-container').css("width","230px");
			//var value = $("#add_type").val();
			$("#"+showId+",#"+backId).hide();
			//$("#role_list_cb").attr("checked",false);
			//$("#job_list_cb").attr("checked",false);
			
			closeDivFp(showId+"pop");
		}
function getModel(){
var modelUrl="${path}buss/bussModel_exeFunc.ms?funcMId=a0dc7811626c42b391ab265406b59f0d";

            var checkType = $("#paraMap1_QMT_TEST_STEP").val();
            var sampleType = $("#paraMap1_QMT_SAMPLE_TYPE").val();
            var dataAuth = $("#deptLs_data_auth").val();
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url:modelUrl+"&type=1",
			    data: "&checkType="+checkType+"&dataAuth="+dataAuth+"&sampleType="+sampleType,
				success: function(data){
						util.closeLoading();
						if(null == data.ajaxPage.dataList){
				                $("#modelTbody").empty();
				                pageFun(data.ajaxPage,"formId1");
				                return ;}
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							$("#modelTbody").empty();
							for(var i = 0;i < rccList.length; i++){
								$("#modelTbody").append("<tr  style='cursor: pointer;' id='tr"+rccList[i].ID+"'></tr>");
								$("#modelTbody tr:last").append("<td style='width: 30px;text-align: center;'>"+(i+1)+"<input type='hidden' id='TEST_STEP_NAME"+rccList[i].ID+"' value='"+rccList[i].TEST_STEP_NAME+"' /></td>");								
								$("#modelTbody tr:last").append("<td style='width: 30px;text-align: center;'><input type='checkbox'  id='"+rccList[i].ID+"' name='isSelect1' /></td>");
								$("#modelTbody tr:last").append("<td style='width: 90px;text-align: center;' title='"+rccList[i].DEPT+"'>"+rccList[i].DEPT+"</td>");
								$("#modelTbody tr:last").append("<td id='ITEM_TYPE_NAME"+rccList[i].ID+"' style='width: 120px;text-align: center;' title='"+rccList[i].ITEM_TYPE_NAME+"'>"+rccList[i].ITEM_TYPE_NAME+"<input type='hidden' id='QST_ITEM_TYPE"+rccList[i].ID+"' value='"+rccList[i].QST_ITEM_TYPE+"' /></td>");
								$("#modelTbody tr:last").append("<td style='width: 112px;text-align: center;' title='"+rccList[i].QSP_PLAN_NAME+"'>"+rccList[i].QSP_PLAN_NAME+"<input type='hidden' id='QSP_PLAN_NAME"+rccList[i].ID+"' value='"+rccList[i].QST_SAMPLE_PLAN+"'/></td>");
								$("#modelTbody tr:last").append("<td style='width: 127px;text-align: center;' title='"+rccList[i].ERROR_GRADE_NAME+"'>"+rccList[i].ERROR_GRADE_NAME+"<input type='hidden' id='QST_ERROR_GRADE"+rccList[i].ID+"' value='"+rccList[i].QST_ERROR_GRADE+"' /></td>");
								$("#modelTbody tr:last").append("<td style='width: 89px;text-align: center;' title='"+rccList[i].TEST_LEVEL_NAME+"'>"+rccList[i].TEST_LEVEL_NAME+"<input type='hidden' id='QST_TEST_LEVEL"+rccList[i].ID+"' value='"+rccList[i].QST_TEST_LEVEL+"' /></td>");
								$("#modelTbody tr:last").append("<td style='width: 57px;text-align: center;' title='"+rccList[i].TEST_GRADE_NAME+"'>"+rccList[i].TEST_GRADE_NAME+"<input type='hidden' id='QST_TEST_GRADE"+rccList[i].ID+"' value='"+rccList[i].QST_TEST_GRADE+"' /></td>");
								$("#modelTbody tr:last").append("<td style='width: 57px;text-align: center;' title='"+rccList[i].QST_ALQ_VALUE+"'>"+rccList[i].QST_ALQ_VALUE+"<input type='hidden' id='QST_ALQ_VALUE"+rccList[i].ID+"' value='"+rccList[i].QST_ALQ_VALUE+"' /></td>");
								$("#modelTbody tr:last").append("<td style='width: 57px;text-align: center;' title='"+rccList[i].QST_FULL_FLAG+"'>"+rccList[i].QST_FULL_FLAG+"<input type='hidden' id='QST_FULL_FLAG"+rccList[i].ID+"' value='"+rccList[i].QST_FULL_FLAG+"' /></td>");
								$("#modelTbody tr:last").append("<td style='text-align: center;' title='"+rccList[i].QST_THRESHOLD+"'>"+rccList[i].QST_THRESHOLD+"<input type='hidden' id='QST_THRESHOLD"+rccList[i].ID+"' value='"+rccList[i].QST_THRESHOLD+"' /></td>");
							}
							//init();
							pageFun(data.ajaxPage,"formId1");
							var tableTrJs = $("#modelTable tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('modelTbody');
						}
					},
				error: function(msg){
						util.closeLoading();
						//utilsFp.alert("error:"+msg);
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
				  }
				});

	}
	//分页
 var paginationImpl = {};
function SearchModelInfo(paginationImpl,url){
			var isFirstLoad = firstLoadThisPage(paginationImpl);
    	 	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	 	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
            var checkType = $("#paraMap1_QMT_TEST_STEP").val();//alert(checkType);
            var sampleType = $("#paraMap1_QMT_SAMPLE_TYPE").val();
            var modelType = $("#paraMap1_QMT_ITEM_TYPE").val();
			var dataAuth = $("#deptLs_data_auth").val();
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url:url+"&type=1",
			    data: "paraMap.checkType="+checkType+"&paraMap.sampleType="+sampleType+"&paraMap.modelType="+modelType+"&paraMap.dataAuth="+dataAuth+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				success: function(data){
						util.closeLoading();
						if(null == data.ajaxPage.dataList){
				               
				                $("#modelTbody").empty();
				                pageFun(data.ajaxPage,"formId1");
				                return ;}
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							$("#modelTbody").empty();
							for(var i = 0;i < rccList.length; i++){

								$("#modelTbody").append("<tr  style='cursor: pointer;' id='tr"+rccList[i].ID+"'></tr>");
								$("#modelTbody tr:last").append("<td style='width: 30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"<input type='hidden' id='TEST_STEP_NAME"+rccList[i].ID+"' value='"+rccList[i].TEST_STEP_NAME+"' /></td>");								
								$("#modelTbody tr:last").append("<td style='width: 30px;text-align: center;'><input type='checkbox'  id='"+rccList[i].ID+"' name='isSelect1' /></td>");
								$("#modelTbody tr:last").append("<td style='width: 90px;text-align: center;' title='"+rccList[i].DEPT+"'>"+rccList[i].DEPT+"</td>");
								$("#modelTbody tr:last").append("<td id='ITEM_TYPE_NAME"+rccList[i].ID+"' style='width: 120px;text-align: center;' title='"+rccList[i].ITEM_TYPE_NAME+"'>"+rccList[i].ITEM_TYPE_NAME+"<input type='hidden' id='QST_ITEM_TYPE"+rccList[i].ID+"' value='"+rccList[i].QST_ITEM_TYPE+"' /></td>");
								$("#modelTbody tr:last").append("<td style='width: 112px;text-align: center;' title='"+rccList[i].QSP_PLAN_NAME+"'>"+rccList[i].QSP_PLAN_NAME+"<input type='hidden' id='QSP_PLAN_NAME"+rccList[i].ID+"' value='"+rccList[i].QST_SAMPLE_PLAN+"'/></td>");
								$("#modelTbody tr:last").append("<td style='width: 127px;text-align: center;' title='"+rccList[i].ERROR_GRADE_NAME+"'>"+rccList[i].ERROR_GRADE_NAME+"<input type='hidden' id='QST_ERROR_GRADE"+rccList[i].ID+"' value='"+rccList[i].QST_ERROR_GRADE+"' /></td>");
								$("#modelTbody tr:last").append("<td style='width: 89px;text-align: center;' title='"+rccList[i].TEST_LEVEL_NAME+"'>"+rccList[i].TEST_LEVEL_NAME+"<input type='hidden' id='QST_TEST_LEVEL"+rccList[i].ID+"' value='"+rccList[i].QST_TEST_LEVEL+"' /></td>");
								$("#modelTbody tr:last").append("<td style='width: 57px;text-align: center;' title='"+rccList[i].TEST_GRADE_NAME+"'>"+rccList[i].TEST_GRADE_NAME+"<input type='hidden' id='QST_TEST_GRADE"+rccList[i].ID+"' value='"+rccList[i].QST_TEST_GRADE+"' /></td>");
								$("#modelTbody tr:last").append("<td style='width: 57px;text-align: center;' title='"+rccList[i].QST_ALQ_VALUE+"'>"+rccList[i].QST_ALQ_VALUE+"<input type='hidden' id='QST_ALQ_VALUE"+rccList[i].ID+"' value='"+rccList[i].QST_ALQ_VALUE+"' /></td>");
								$("#modelTbody tr:last").append("<td style='width: 57px;text-align: center;' title='"+rccList[i].QST_FULL_FLAG+"'>"+rccList[i].QST_FULL_FLAG+"<input type='hidden' id='QST_FULL_FLAG"+rccList[i].ID+"' value='"+rccList[i].QST_FULL_FLAG+"' /></td>");
								$("#modelTbody tr:last").append("<td style='text-align: center;' title='"+rccList[i].QST_THRESHOLD+"'>"+rccList[i].QST_THRESHOLD+"<input type='hidden' id='QST_THRESHOLD"+rccList[i].ID+"' value='"+rccList[i].QST_THRESHOLD+"' /></td>");
			
							}
							//init();
							pageFun(data.ajaxPage,"formId1");
							var tableTrJs = $("#modelTable tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('modelTbody');
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
		var trCount=0;
 	 function addModelList(showId,backId){
	    var len = $("#addModelList tr").length;
	    var itemType;
		var itemTypeName;
		var TEST_STEP_NAME;
		var QST_SAMPLE_PLAN;
		var QST_ERROR_GRADE;
		var QST_TEST_LEVEL;
		var QST_TEST_GRADE;
		var QST_ALQ_VALUE;
		var QST_FULL_FLAG;
		var QST_THRESHOLD;
	 	$(".firstTableBack").show();
			 $("#modelTbody :checkbox").each(function(){
					if($(this).attr("checked")){
						if (!$("#trr"+$(this).attr("id")).length) {
							itemType = $("#QST_ITEM_TYPE"+$(this).attr("id")).val();
							itemTypeName = $("#ITEM_TYPE_NAME"+$(this).attr("id")).text();
							TEST_STEP_NAME= $("#TEST_STEP_NAME"+$(this).attr("id")).val();
							QST_SAMPLE_PLAN = $("#QSP_PLAN_NAME"+$(this).attr("id")).val();
							QST_ERROR_GRADE = $("#QST_ERROR_GRADE"+$(this).attr("id")).val();
							QST_TEST_LEVEL = $("#QST_TEST_LEVEL"+$(this).attr("id")).val();
							QST_TEST_GRADE = $("#QST_TEST_GRADE"+$(this).attr("id")).val();
							QST_ALQ_VALUE = $("#QST_ALQ_VALUE"+$(this).attr("id")).val();
							QST_FULL_FLAG = $("#QST_FULL_FLAG"+$(this).attr("id")).val();
							QST_THRESHOLD = $("#QST_THRESHOLD"+$(this).attr("id")).val();

							var samplSel;
							var errorSel;
							var testLevelSel;
							var testGradeSel;
							var fullSel;
							samplSel = "<select id='samplSel_"+(trCount+1)+"' name='samplSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'>"+ samplOption +"</select>";			
							errorSel = "<select id='errorSel_"+(trCount+1)+"' name='errorSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'>"+ errorOption +"</select>";
							testLevelSel = "<select id='testLevelSel_"+(trCount+1)+"' onchange='getTestGrade("+(trCount+1)+");' name='testLevelSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'>"+ testLevelOption +"</select>";
							getTestGrade1(QST_TEST_LEVEL);
							testGradeSel = "<select id='testGradeSel_"+(trCount+1)+"' name='testGradeSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'>"+ testGradeOption +"</select>";
							fullSel = "<select id='fullSel_"+(trCount+1)+"' name='fullSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'>"+ fullOption +"</select>";

						    $("#addModelList").append("<tr id='trr"+$(this).attr("id")+"' name='trname' ></tr>");
							$("#addModelList tr:last").append("<td id='iptseq"+$(this).attr("id")+"' style='width: 30px;text-align: center;'>"+(len+1)+"</td>");
							$("#addModelList tr:last").append("<td style='width: 30px;text-align: center;'><input  type='checkbox' /></td>");
							
                            $("#addModelList tr:last").append("<td style='width: 80px;text-align: center;' title='"+TEST_STEP_NAME+"'>"+TEST_STEP_NAME+"<input  type='hidden' name='testStep' value='"+$("#paraMap1_QMT_TEST_STEP").val()+"'/></td>");
                            $("#addModelList tr:last").append("<td style='width: 100px;text-align: center;' title='"+itemTypeName+"'>"+itemTypeName+"<input  type='hidden' name='itemType' value='"+itemType+"'/></td>");
                            $("#addModelList tr:last").append("<td style='width: 120px;overflow: visible;padding:0;' >"+samplSel+"<input  type='hidden' name='samplePlan' value='"+QST_SAMPLE_PLAN+"'/></td>");
                            $("#addModelList tr:last").append("<td style='width: 120px;overflow: visible;padding:0;' >"+errorSel+"<input  type='hidden' name='errorGrade' value='"+QST_ERROR_GRADE+"'/></td>");
                            $("#addModelList tr:last").append("<td style='width: 120px;overflow: visible;padding:0;' >"+testLevelSel+"<input  type='hidden' name='testLevel' value='"+QST_TEST_LEVEL+"'/></td>");
                            $("#addModelList tr:last").append("<td class='datagrid-cell' style='width: 120px;' '>"+testGradeSel+"<input  type='hidden' name='testGrade' value='"+QST_TEST_GRADE+"'/></td>");
                            $("#addModelList tr:last").append("<td class='datagrid-cell' style='width: 70px;text-align: center;padding:0;'><input type='text' style='width: 70px;padding:0;' name='AQLValue' maxlength='9'  class=' input isSubmit'  value='"+QST_ALQ_VALUE+"'  onkeyup='value=value.replace(/[^\\d.]/g,\"\")'/></td>");
                            $("#addModelList tr:last").append("<td style='width: 120px;overflow: visible;padding:0;' >"+fullSel+"<input  type='hidden' name='fullFlag' value='"+QST_FULL_FLAG+"'/></td>");
                            $("#addModelList tr:last").append("<td style='text-align: center;padding:0;'><input type='text' style='width: 100%;padding:0;' maxlength='9' class=' input isSubmit' name='threshold' value='"+QST_THRESHOLD+"' onkeyup='value=value.replace(/[^\\d.]/g,\"\")'/></td>");
               
							mySetChosen();//设置下拉框样式
							//$(".chosen-container").css("width","100%;");
							
							$("#samplSel_"+(trCount+1)).val(QST_SAMPLE_PLAN);
							$("#samplSel_"+(trCount+1)).trigger("chosen:updated");
							$("#errorSel_"+(trCount+1)).val(QST_ERROR_GRADE);
							$("#errorSel_"+(trCount+1)).trigger("chosen:updated");
							$("#testLevelSel_"+(trCount+1)).val(QST_TEST_LEVEL);
							$("#testLevelSel_"+(trCount+1)).trigger("chosen:updated");
						        $("#testGradeSel_"+(trCount+1)).val(QST_TEST_GRADE);
							$("#testGradeSel_"+(trCount+1)).trigger("chosen:updated");
							$("#fullSel_"+(trCount+1)).val(QST_FULL_FLAG);
							$("#fullSel_"+(trCount+1)).trigger("chosen:updated");
							$("#samplSel_"+(trCount+1)+"_chosen").attr("style","width:120px;");
							$("#errorSel_"+(trCount+1)+"_chosen").attr("style","width:120px;");
							$("#testLevelSel_"+(trCount+1)+"_chosen").attr("style","width:120px;");
							$("#testGradeSel_"+(trCount+1)+"_chosen").attr("style","width:120px;");
							$("#fullSel_"+(trCount+1)+"_chosen").attr("style","width:120px;");
							len = len+1;
							trCount++
										
						}
					}
				});

				//init();
						        
				
			
			var tableTrJs = $("#addModelList tr");
							_tongLineColor(tableTrJs);
							clickTr('addModelList');
				
			
			$("#modelTbody").empty();
			document.getElementById(showId).style.display = 'none';
			document.getElementById(backId).style.display = 'none';
			$("#model_list_cb").attr("checked",false);
			//$(' .chosen-container').css("width","230px");
		}
		//var trrCount=0;
		function showItemGenreInfo(itemgenre){
    	    var len = $("#addModelList tr").length;
    	    var itemType="";
    		var itemTypeName="";
    		var TEST_STEP_NAME="";
    		var QST_SAMPLE_PLAN="";
    		var QST_ERROR_GRADE="";
    		var QST_TEST_LEVEL="";
    		var QST_TEST_GRADE="";
    		var QST_ALQ_VALUE="";
    		var QST_FULL_FLAG="";
    		var QST_THRESHOLD="";
    	 	$(".firstTableBack").show();
    	 	getSelVal();
    	 	var modelUrl="${path}buss/bussModel_exeFunc.ms?funcMId=a0dc7811626c42b391ab265406b59f0d";
    	 	var testStep = $("#paraMap1_QMT_TEST_STEP").val();
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
				                $("#addModelList").empty();
				                pageFun(data.ajaxPage,"formId1");
				                return ;}
						if(null != data.ajaxList){
							var rccList = eval(data.ajaxList);
							$("#modelTbody").empty();
							for(var i = 0;i < rccList.length; i++){
					
							    if(rccList[i].QMT_ITEM_TYPE != null) itemType =rccList[i].QMT_ITEM_TYPE ;
    							if(rccList[i].ITEM_TYPE_NAME != null) itemTypeName =rccList[i].ITEM_TYPE_NAME ;
    							if(rccList[i].TEST_STEP_NAME != null) TEST_STEP_NAME=rccList[i].TEST_STEP_NAME ;
    							if(rccList[i].QMT_SAMPLE_PLAN != null) QST_SAMPLE_PLAN =rccList[i].QMT_SAMPLE_PLAN ;
    							if(rccList[i].QMT_ERROR_GRADE != null) QST_ERROR_GRADE =rccList[i].QMT_ERROR_GRADE ;
    							if(rccList[i].QMT_TEST_LEVEL != null) QST_TEST_LEVEL =rccList[i].QMT_TEST_LEVEL ;
    							if(rccList[i].QMT_TEST_GRADE!=null) QST_TEST_GRADE =rccList[i].QMT_TEST_GRADE;
    							if(rccList[i].QMT_ALQ_VALUE!=null) QST_ALQ_VALUE =rccList[i].QMT_ALQ_VALUE;
    							if(rccList[i].QMT_FULL_FLAG!=null) QST_FULL_FLAG = rccList[i].QMT_FULL_FLAG;
    							if(rccList[i].QMT_THRESHOLD!=null) QST_THRESHOLD =rccList[i].QMT_THRESHOLD;

    							var samplSel;
    							var errorSel;
    							var testLevelSel;
    							var testGradeSel;
    							var fullSel;
    							samplSel = "<select id='samplSel_"+(trCount+1)+"' name='samplSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'>"+ samplOption +"</select>";			
    							errorSel = "<select id='errorSel_"+(trCount+1)+"' name='errorSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'>"+ errorOption +"</select>";
    							testLevelSel = "<select id='testLevelSel_"+(trCount+1)+"' onchange='getTestGrade("+(trCount+1)+");' name='testLevelSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'>"+ testLevelOption +"</select>";
    							getTestGrade1(QST_TEST_LEVEL);
    							testGradeSel = "<select id='testGradeSel_"+(trCount+1)+"' name='testGradeSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'>"+ testGradeOption +"</select>";
    							fullSel = "<select id='fullSel_"+(trCount+1)+"' name='fullSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='display: none;'>"+ fullOption +"</select>";
    
    						    $("#addModelList").append("<tr id='trr"+rccList[i].QST_ID+"' name='trname' ></tr>");
    							$("#addModelList tr:last").append("<td id='iptseq"+$(this).attr("id")+"' style='width: 30px;text-align: center;'>"+(len+1)+"</td>");
    							$("#addModelList tr:last").append("<td style='width: 30px;text-align: center;'><input  type='checkbox' /></td>");
    							
                                $("#addModelList tr:last").append("<td style='width: 80px;text-align: center;' title='"+TEST_STEP_NAME+"'>"+TEST_STEP_NAME+"<input  type='hidden' name='testStep' value='"+$("#paraMap1_QMT_TEST_STEP").val()+"'/></td>");
                                $("#addModelList tr:last").append("<td style='width: 100px;text-align: center;' title='"+itemTypeName+"'>"+itemTypeName+"<input  type='hidden' name='itemType' value='"+itemType+"'/></td>");
                                $("#addModelList tr:last").append("<td style='width: 120px;overflow: visible;padding:0;' >"+samplSel+"<input  type='hidden' name='samplePlan' value='"+QST_SAMPLE_PLAN+"'/></td>");
                                $("#addModelList tr:last").append("<td style='width: 120px;overflow: visible;padding:0;' >"+errorSel+"<input  type='hidden' name='errorGrade' value='"+QST_ERROR_GRADE+"'/></td>");
                                $("#addModelList tr:last").append("<td style='width: 120px;overflow: visible;padding:0;' >"+testLevelSel+"<input  type='hidden' name='testLevel' value='"+QST_TEST_LEVEL+"'/></td>");
                                $("#addModelList tr:last").append("<td class='datagrid-cell' style='width: 120px;' '>"+testGradeSel+"<input  type='hidden' name='testGrade' value='"+QST_TEST_GRADE+"'/></td>");
                                $("#addModelList tr:last").append("<td class='datagrid-cell' style='width: 70px;text-align: center;padding:0;'><input type='text' style='width: 70px;padding:0;' name='AQLValue' maxlength='9'  class=' input isSubmit'  value='"+QST_ALQ_VALUE+"'  onkeyup='value=value.replace(/[^\\d.]/g,\"\")'/></td>");
                                $("#addModelList tr:last").append("<td style='width: 120px;overflow: visible;padding:0;' >"+fullSel+"<input  type='hidden' name='fullFlag' value='"+QST_FULL_FLAG+"'/></td>");
                                $("#addModelList tr:last").append("<td style='text-align: center;padding:0;'><input type='text' style='width: 100%;padding:0;' maxlength='9' class=' input isSubmit' name='threshold' value='"+QST_THRESHOLD+"' onkeyup='value=value.replace(/[^\\d.]/g,\"\")'/></td>");
                   
    							mySetChosen();//设置下拉框样式
    							//$(".chosen-container").css("width","100%;");
    							
    							$("#samplSel_"+(trCount+1)).val(QST_SAMPLE_PLAN);
    							$("#samplSel_"+(trCount+1)).trigger("chosen:updated");
    							$("#errorSel_"+(trCount+1)).val(QST_ERROR_GRADE);
    							$("#errorSel_"+(trCount+1)).trigger("chosen:updated");
    							$("#testLevelSel_"+(trCount+1)).val(QST_TEST_LEVEL);
    							$("#testLevelSel_"+(trCount+1)).trigger("chosen:updated");
						        $("#testGradeSel_"+(trCount+1)).val(QST_TEST_GRADE);
    							$("#testGradeSel_"+(trCount+1)).trigger("chosen:updated");
    							$("#fullSel_"+(trCount+1)).val(QST_FULL_FLAG);
    							$("#fullSel_"+(trCount+1)).trigger("chosen:updated");
    							$("#samplSel_"+(trCount+1)+"_chosen").attr("style","width:120px;");
    							$("#errorSel_"+(trCount+1)+"_chosen").attr("style","width:120px;");
    							$("#testLevelSel_"+(trCount+1)+"_chosen").attr("style","width:120px;");
    							$("#testGradeSel_"+(trCount+1)+"_chosen").attr("style","width:120px;");
    							$("#fullSel_"+(trCount+1)+"_chosen").attr("style","width:120px;");
    							len = len+1;
    							trCount++
								
							}
							//init();
							var tableTrJs = $("#modelTable tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('modelTbody');
						}
					},
				    error: function(msg){
						util.closeLoading();
						//utilsFp.alert("error:"+msg);
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
				  }
				});
			
			var tableTrJs = $("#addModelList tr");
							_tongLineColor(tableTrJs);
							clickTr('addModelList');
		}
		
 		//设备信息关联删除
		function delRow(){
			$("#addModelList :checkbox").each(function(){
				if($(this).attr("checked")){
					var trid = $(this).parent().parent().attr("id");
					//console.log(trid);
					$("#"+trid).remove();
					//$("#"+trid).remove();
				}
			});
			reSort("addModelList");
			var tableTrJs = $("#addModelList tr");
			_tongLineColor(tableTrJs);
			clickTr('addModelList');		        
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
	
	$(function(){
		$("#paraMap1_QMT_TEST_STEP").attr("onchange","changeVal();");
		//getSelVal();
	})

	function changeVal(){
		emptyStep();
		getSelVal();
	}
	
	var samplOption;
	var errorOption;
	var testLevelOption;
	var testGradeOption;
	var fullOption;
	//根据检测阶别获取相关下拉框
	function getSelVal(){
	
	var getNeedSelUrl="${path}buss/bussModel_exeFunc.ms?funcMId=e0dc5bed321f4bdeac4c96c76dfd0a75";

		var testStep = $("#paraMap1_QMT_TEST_STEP").val();
		$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: getNeedSelUrl+"&testStep="+testStep,
			    data: "",
				success: function(data){
						//console.log(data.ajaxMap.samplList);
						samplOption = "<option value=''>--请选择--</option>";
						errorOption = "<option value=''>--请选择--</option>";
						testLevelOption = "<option value=''>--请选择--</option>";
						//testGradeOption = "<option value=''>--请选择--</option>";
						fullOption = "<option value=''>--请选择--</option>";
						if(null == data){return ;}
						if(null != data.ajaxMap){
							var samplList =data.ajaxMap.samplList;
							var errorList =data.ajaxMap.errorList;
							var testLevelList =data.ajaxMap.testLevelList;
							var testGradeList =data.ajaxMap.testGradeList;
							var fullList =data.ajaxMap.fullList;
							//console.log(samplList);
							for(var i = 0;i < samplList.length; i++){
								samplOption = samplOption + "<option value='"+samplList[i].ID+"'>"+samplList[i].QSP_PLAN_NAME+"</option>";
							}
							for(var j = 0;j < errorList.length; j++){
								errorOption = errorOption + "<option value='"+errorList[j].CODE+"'>"+errorList[j].VALUE+"</option>";
							}
							for(var k = 0;k < testLevelList.length; k++){
								testLevelOption = testLevelOption + "<option value='"+testLevelList[k].CODE+"'>"+testLevelList[k].VALUE+"</option>";
							}
							/*for(var l = 0;l < testGradeList.length; l++){
								testGradeOption = testGradeOption + "<option value='"+testGradeList[l].CODE+"'>"+testGradeList[l].VALUE+"</option>";
							}*/
							for(var m = 0;m < fullList.length; m++){
								fullOption = fullOption + "<option value='"+fullList[m].CODE+"'>"+fullList[m].VALUE+"</option>";
							}
						}
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
	}
	//根据检查水平改变水平等级
	function getTestGrade(num){
		var testLeave = $("#testLevelSel_"+num).val();
		$("#testGradeSel_"+num).empty();
		if(testLeave==1){
			testGradeOption = "<option value=''>--请选择--</option><option value='1'>Ⅰ</option><option value='2'>Ⅱ</option><option value='3'>Ⅲ</option>";
		}else if(testLeave==2){
			testGradeOption = "<option value=''>--请选择--</option><option value='4'>S-1</option><option value='5'>S-2</option><option value='6'>S-3</option><option value='7'>S-4</option>";
		}else{
			testGradeOption = "<option value=''>--请选择--</option>";
		}
		$("#testGradeSel_"+num).append(testGradeOption);
		$("#testGradeSel_"+num).trigger("chosen:updated");
	}
	//根据检查水平获取水平等级
	function getTestGrade1(num){
		var testLeave = num;
		if(testLeave==1){
			testGradeOption = "<option value=''>--请选择--</option><option value='1'>Ⅰ</option><option value='2'>Ⅱ</option><option value='3'>Ⅲ</option>";
		}else if(testLeave==2){
			testGradeOption = "<option value=''>--请选择--</option><option value='4'>S-1</option><option value='5'>S-2</option><option value='6'>S-3</option><option value='7'>S-4</option>";
		}else{
			testGradeOption = "<option value=''>--请选择--</option>";
		}
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
		if(index!=len1-1){
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
 </script>
</head>
<body>
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
					target="submitFrame">
            <div class="hd">
            	
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
			        <button type="button" onclick="addCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd" style="height: 534px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="95f9041534d84ce2ab92935d2ade0945" type="add" />
<div class="mod">
<div class="mod-hd">		
  <h3 class="tit"><dict:lang value="基本信息" /></h3>	
  </div>
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="95f9041534d84ce2ab92935d2ade0945" />
	<input type="hidden" name="95f9041534d84ce2ab92935d2ade0945" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="modelCode" id="modelCode" value="" />
	<input type="hidden" name="itemGenre" id="itemGenre" value="" />
		<s:set name="_$viewId" value="'a9cb9551583849f183288b12b4eabe15'" />
		<s:set name="_$formId_1" value="'95f9041534d84ce2ab92935d2ade0945'" />
		<s:set name="_$type" value="'add'" />
		<tr>
		    <td class="name" /><span class="dot">*</span><bu:uitn colNo="QMT_ADD_TYPE" formId="95f9041534d84ce2ab92935d2ade0945" /></td>
			<bu:td cssClass="dec-self" colNo="QMT_ADD_TYPE" formId="95f9041534d84ce2ab92935d2ade0945" ><bu:ui colNo="QMT_ADD_TYPE" style="width:200px;" formId="95f9041534d84ce2ab92935d2ade0945" value="%{QMT_ADD_TYPE}" formIndex="1" /></bu:td>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="QMT_MODEL_CODE" formId="95f9041534d84ce2ab92935d2ade0945" /></td>
			<bu:td cssClass="dec" colNo="QMT_MODEL_CODE" formId="95f9041534d84ce2ab92935d2ade0945" ><bu:ui colNo="QMT_MODEL_CODE" style="width:200px;" disabled="disabled" formId="95f9041534d84ce2ab92935d2ade0945" value="%{QMT_MODEL_CODE}" formIndex="1" /></bu:td>
		    <td class="name" /><span class="dot">*</span><bu:uitn colNo="QMT_ITEM_GENRE" formId="95f9041534d84ce2ab92935d2ade0945" /></td>
			<bu:td cssClass="dec" colNo="QMT_ITEM_GENRE" formId="95f9041534d84ce2ab92935d2ade0945" ><bu:ui colNo="QMT_ITEM_GENRE" style="width:200px;"  disabled="disabled" formId="95f9041534d84ce2ab92935d2ade0945" value="%{QMT_ITEM_GENRE}" formIndex="1" /></bu:td>
		</tr>
		<tr>	
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="QMT_TEST_STEP" formId="95f9041534d84ce2ab92935d2ade0945" /></td>
			<bu:td cssClass="dec" colNo="QMT_TEST_STEP" formId="95f9041534d84ce2ab92935d2ade0945" ><bu:ui colNo="QMT_TEST_STEP" style="width:200px;" formId="95f9041534d84ce2ab92935d2ade0945" value="%{QMT_TEST_STEP}" formIndex="1" /></bu:td>
            <td class="name" /><bu:uitn colNo="QMT_SAMPLE_TYPE" formId="95f9041534d84ce2ab92935d2ade0945" /></td>
			<bu:td cssClass="dec" colNo="QMT_SAMPLE_TYPE" formId="95f9041534d84ce2ab92935d2ade0945" ><bu:ui colNo="QMT_SAMPLE_TYPE" style="width:200px;" formId="95f9041534d84ce2ab92935d2ade0945" value="%{QMT_SAMPLE_TYPE}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="MODEL_CODE_NAME" formId="95f9041534d84ce2ab92935d2ade0945" /></td>
			<bu:td cssClass="dec" colNo="MODEL_CODE_NAME" formId="95f9041534d84ce2ab92935d2ade0945" ><bu:ui colNo="MODEL_CODE_NAME" style="width:200px;" formId="95f9041534d84ce2ab92935d2ade0945" value="%{MODEL_CODE_NAME}" formIndex="1" /></bu:td>
		</tr>
		<tr>	
            <td class="name" /><bu:uitn colNo="MODEL_CODE_SPEC" formId="95f9041534d84ce2ab92935d2ade0945" /></td>
			<bu:td cssClass="dec" colNo="MODEL_CODE_SPEC" formId="95f9041534d84ce2ab92935d2ade0945" ><bu:ui colNo="MODEL_CODE_SPEC" style="width:200px;" formId="95f9041534d84ce2ab92935d2ade0945" value="%{MODEL_CODE_SPEC}" formIndex="1" /></bu:td>
		</tr>
	</table>
<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="检测类型信息" /></h3>	
        <div class="extend-btn" id="addDel" style="float: right;margin-top:5px;margin-bottom:5px;">
        	<button type="button" onclick="popModelDiv('addModel','backModel');" style="padding:0;" title="新增">
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
						<div class="datagrid-header" style="width:100%;">
							<div class="datagrid-header-inner" style="width:100%;" id="datagrid-header-inner1">
								<table  class="datagrid-htable fixedTable  " id="datagrid-htable" style="width:1000px;">
									<tbody>
									<tr class="datagrid-header-row datagrid-title-ajax">
										<td class="datagrid-cell" style="width:30px;"></td>
										<td class="datagrid-cell" style="width:30px;">
										<input type="checkbox" id="allSelect" name="allSelect" onchange="getAllModels();" />
										</td>
										<td class="datagrid-cell" style="width:80px;" ><dict:lang value="检测阶别" /></td >
										<td class="datagrid-cell" style="width:100px;" ><dict:lang value="项目类型" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="抽样方案" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="缺陷等级" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="检查水平" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="水平等级" /></td >
										<td class="datagrid-cell" style="width:70px;"><dict:lang value="AQL值" /></td>
										<td class="datagrid-cell" style="width:120px;"><dict:lang value="全检标志" /></td>
										<td class="datagrid-cell"><dict:lang value="全检阈值" /></td>
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3"   style="height:320px;">
							<table class="dlist-table table-line" style="width:1000px;table-layout:fixed;"  id="checkTypeInfo" >
								<tbody id="addModelList" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>	
</div>
			<div id="backModel" class="dialog-mask" style="z-index:1029px;"/></div>
		<div class="dialog dialog-s1" id="addModel" style="display:none;z-index:1030;margin-left:0px;left:10px;top:20px;width:870px;height:560px;">
			<div class="dialog-hd">
			<h3 class="tit">
			<dict:lang value="选择检测类型" />
			</h3>
			</div>
				<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addModel','backModel');"></a>
				<div class="dialog-bd-div" style="width:100%;height:calc(100% - 37px);">
					<div class="optn optn_div">
			        <button type="button" onclick="addModelList('addModel','backModel');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv('addModel','backModel');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				<button type="button" onclick="searchModelInfo('formId1');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
				         </div>
				      
				<table class="basic-table">
				 <tr>
			    		<td class="name-four" /><bu:uitn colNo="QMT_ITEM_TYPE" formId="95f9041534d84ce2ab92935d2ade0945" /></td>
						<bu:td cssClass="dec-self" colNo="QMT_ITEM_TYPE" formId="95f9041534d84ce2ab92935d2ade0945" ><bu:ui colNo="QMT_ITEM_TYPE" formId="95f9041534d84ce2ab92935d2ade0945" value="%{QMT_ITEM_TYPE}" formIndex="1" /></bu:td>
			    	</tr>
			    	</table>
			    	<div style="width:870px;">  
			    	<table  width="870px" class="dlist-table table-line " >
						<thead>
						<tr>
			    			<th style="width: 30px;text-align: center;"></th>
							<th style="width: 30px;text-align: center;"><input type="checkbox" id="model_list_cb"  onchange="getAllModel();" /></th>
							<th style="width: 90px;text-align: center;"><dict:lang value="组织机构" /></th>
							<th style="width: 120px;text-align: center;"><dict:lang value="项目类型" /></th>
							<th style="width: 112px;text-align: center;"><dict:lang value="抽样方案" /></th>
							<th style="width: 127px;text-align: center;"><dict:lang value="缺陷等级" /></th>
							<th style="width: 89px;text-align: center;"><dict:lang value="检查水平" /></th>
							<th style="width: 57px;text-align: center;"><dict:lang value="水平等级" /></th>
							<th style="width: 57px;text-align: center;"><dict:lang value="AQL值" /></th>
							<th style="width: 57px;text-align: center;"><dict:lang value="全检标志" /></th>
							<th style="text-align: center;"><dict:lang value="全检阈值" /></th>
						</tr>
			    	</thead>
			    	</table>
			    	</div>
			    	<div style="width:870px;height:calc(100% - 136px);overflow-y: auto;overflow-x: hidden;" class="scroll">  
			    	<table style="table-layout:fixed;width:100%;" class="dlist-table table-line " id="modelTable">
			    	<tbody id="modelTbody">
		                </tbody>
				
				</table>

				</div>
				<div style="background-color: white;" id="pageDiv">
                                 <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchModelInfo&formId=formId1&showLoading=0" />
                                 </div>		
				</div>
				

</div>

			<bu:jsVal formId="95f9041534d84ce2ab92935d2ade0945" formIndex="1" />
				
			</div>
		 </form>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	 <script>(function($){
  $(window).on('load',function(){
    setPopScroll('.datagrid-body','.datagrid-header-inner');
    setPopScroll('.scroll')
  })
})(jQuery)</script>

<script>
  $("#paraMap1_QMT_ADD_TYPE").change(function(){
      var type=$(this).val();
      if(type=="1"){
          //机种
        $("#paraMap1_QMT_MODEL_CODE_SHOW").attr("disabled",false);
        $("#paraMap1_QMT_ITEM_GENRE").attr("disabled",true);
        $("#paraMap1_QMT_MODEL_CODE_SHOW").val("");
    	$("#paraMap1_QMT_MODEL_CODE").val("");
    	$("#paraMap1_MODEL_CODE_NAME").val("");
    	$("#paraMap1_MODEL_CODE_SPEC").val("");
	    $("#paraMap1_QMT_ITEM_GENRE option:eq(0)").attr("selected","selected");
		$("#paraMap1_QMT_ITEM_GENRE").trigger("chosen:updated");
		$("#addModelList").empty();
      }else if(type=="2"){
          //物料类别
        $("#paraMap1_QMT_MODEL_CODE_SHOW").attr("disabled",true);
        $("#paraMap1_QMT_ITEM_GENRE").attr("disabled", false);
        $("#paraMap1_QMT_MODEL_CODE_SHOW").val("");
    	$("#paraMap1_QMT_MODEL_CODE").val("");
    	$("#paraMap1_MODEL_CODE_NAME").val("");
    	$("#paraMap1_MODEL_CODE_SPEC").val("");
	    $("#paraMap1_QMT_ITEM_GENRE option:eq(0)").attr("selected","selected");
		$("#paraMap1_QMT_ITEM_GENRE").trigger("chosen:updated");
		$("#addModelList").empty();
      }else{
        $("#paraMap1_QMT_MODEL_CODE_SHOW").attr("disabled",true);
        $("#paraMap1_QMT_ITEM_GENRE").attr("disabled", true);
        $("#paraMap1_QMT_MODEL_CODE_SHOW").val("");
    	$("#paraMap1_QMT_MODEL_CODE").val("");
    	$("#paraMap1_MODEL_CODE_NAME").val("");
    	$("#paraMap1_MODEL_CODE_SPEC").val("");
	    $("#paraMap1_QMT_ITEM_GENRE option:eq(0)").attr("selected","selected");
		$("#paraMap1_QMT_ITEM_GENRE").trigger("chosen:updated");  
		$("#addModelList").empty();
      }
  });
      
</script>
  	<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
<bu:submit viewId="a9cb9551583849f183288b12b4eabe15" />
<bu:script viewId="a9cb9551583849f183288b12b4eabe15" />
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 
