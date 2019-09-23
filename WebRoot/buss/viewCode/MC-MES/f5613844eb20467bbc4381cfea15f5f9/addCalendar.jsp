<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<title><dict:lang value="新增工厂日历" /></title>
<%@ include file="/plf/common/pub_meta.jsp"%>
<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="popDivWinFp" value="1" />
	<jsp:param name="datePicker" value="1" />
	<jsp:param name="chosen" value="1" />
</jsp:include>
<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
	<jsp:param name="needValidate" value="1" />
</jsp:include>
<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
<script src="${path}plf/js/ui/textform/js/jquery.validate.js"></script>
<script>
$(function(){
    $("#tag1").addClass("current");;
})
        function getArea(showId,backId){
            $("#"+showId+",#"+backId).show();
        	$("#"+showId).draggable({cancel:'.dialog-bd-div'});
        	$('#_select .chosen-container').css("width","157px");
            $.ajax({
            	type: "POST",
            	dataType: "json",
                    //url: "@{funcUrl}",
            	url: "${path}buss/bussModel_exeFunc.ms?funcMId=728d1b9fc35643eb9ae3bde843eeb005",
            	data: "",
            	success: function(data){
            		if(null == data){return ;}
            		if(null != data.ajaxList){
            			$("#searchArea").empty();
            			$("#searchArea").append("<option value=''>--请选择--</option>");
            			for(var i = 0;i < data.ajaxList.length; i++){
            			$("#searchArea").append("<option value=\""+data.ajaxList[i].CAID+"\">"+data.ajaxList[i].AREANAME+"</option>");
                                          }
                                    $("#searchArea").trigger("chosen:updated");
            			};
                                      init();
            			},
            		error: function(msg){
            			util.closeLoading();
            			utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
            			}
            		});
            getAreaList(paginationImpl);
        }
        function searchArea(paginationImpl){
	var searchArea = $("#searchArea").val();
	var areaId = $("#areaId").val();
	var areaName = $("#areaName").val();
	$("#areaTbody").empty();
	var flag = true;
    	 var isFirstLoad = firstLoadThisPage(paginationImpl);
    	 var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	 var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
	$.ajax({
	type: "POST",
	dataType: "json",
	url: "${path}buss/bussModel_exeFunc.ms?funcMId=fda357cb89e7408ba215087ab6270835",
	data:{
	    "paraMap.searchArea":searchArea,
	    "paraMap.areaId":areaId,
	    "paraMap.areaName":areaName,
	    "page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
	    "page.pageRecord": _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
	},
	//data: "paraMap.searchArea="+searchArea+"&paraMap.areaId="+areaId +"&paraMap.areaName="+areaName+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
	success: function(data){
	if(null == data){return ;}
	if(null != data.ajaxPage.dataList){
	for(var i = 0;i < data.ajaxPage.dataList.length; i++){
		$("#addArealist").find("tr").each(function(){
					if(("tr_"+data.ajaxPage.dataList[i].AREAID)==$(this).attr("id")){
						flag = false;
					}
		});
		$("#areaTbody").append("<tr id='"+data.ajaxPage.dataList[i].AREAID+"'></tr>");
		$("#areaTbody tr:last").append("<td style='width: 30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
		if(!flag){
			$("#areaTbody tr:last").append("<td style='width: 30px;text-align: center;'><input type='checkbox' id=\""+data.ajaxPage.dataList[i].AREAID+"\" name=\""+data.ajaxPage.dataList[i].AREANAME+"\" disabled='disabled' /></td>");
		}else{
			$("#areaTbody tr:last").append("<td style='width: 30px;text-align: center;'><input type='checkbox' id=\""+data.ajaxPage.dataList[i].AREAID+"\" name=\""+data.ajaxPage.dataList[i].AREANAME+"\" /></td>");
		}
		$("#areaTbody tr:last").append("<td style='width: 290px;text-align: center;'>"+data.ajaxPage.dataList[i].AREAID+"</td>");
		$("#areaTbody tr:last").append("<td style='width: 290px;text-align: center;'>"+data.ajaxPage.dataList[i].AREANAME+"</td>");
		if(data.ajaxPage.dataList[i].PRANTAREANAME == null){
		  $("#areaTbody tr:last").append("<td style='width:290px;text-align: center;'> </td>");
		}else{
			$("#areaTbody tr:last").append("<td style='width:290px;text-align: center;'>"+data.ajaxPage.dataList[i].PRANTAREANAME+"</td>");
		} 
		flag = true;
		}
	}init();checkboxAll("areaTbody");
	pageFun(data.ajaxPage,"formId1");
		defTableWidthRewrite('831b2dbf0dfb494695b7ce66538a0000');
	},
	error: function(msg){if(msg.readyState!=0){util.closeLoading();
	utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
}
	}});
}

function getAreaList(paginationImpl){
	var flag = true;
	util.initLangMap('["该线别已存在"]');
	$.ajax({
	type: "POST",dataType: "json",url: "${path}buss/bussModel_exeFunc.ms?funcMId=173876dda31f43128343e6d11ddece6c",data:{"paraMap.flag":"getArea"},
success: function(data){
if(null == data){return ;}
if(null != data.ajaxPage.dataList){
 for(var i = 0;i < data.ajaxPage.dataList.length; i++){
	$("#addArealist").find("tr").each(function(){
					if(("tr_"+data.ajaxPage.dataList[i].AREAID)==$(this).attr("id")){
						flag = false;
					}
				});
$("#areaTbody").append("<tr id='"+data.ajaxPage.dataList[i].AREAID+"'></tr>");
$("#areaTbody tr:last").append("<td style='width: 30px;text-align: center;'>"+(i+1)+"</td>");
	if(!flag){
$("#areaTbody tr:last").append("<td style='width: 30px;text-align: center;'><input type='checkbox' id=\""+data.ajaxPage.dataList[i].AREAID+"\" name=\""+data.ajaxPage.dataList[i].AREANAME+"\" disabled='disabled'/></td>");
	}else{
		$("#areaTbody tr:last").append("<td style='width: 30px;text-align: center;'><input type='checkbox' id=\""+data.ajaxPage.dataList[i].AREAID+"\" name=\""+data.ajaxPage.dataList[i].AREANAME+"\" /></td>");
	}
$("#areaTbody tr:last").append("<td style='width: 290px;text-align: center;'>"+data.ajaxPage.dataList[i].AREAID+"</td>");
$("#areaTbody tr:last").append("<td style='width: 290px;text-align: center;'>"+data.ajaxPage.dataList[i].AREANAME+"</td>");
if(data.ajaxPage.dataList[i].PRANTAREANAME == null){
$("#areaTbody tr:last").append("<td style='width:290px;text-align: center;'> </td>");
 }else{$("#areaTbody tr:last").append("<td style='width:290px;text-align: center;'>"+data.ajaxPage.dataList[i].PRANTAREANAME+"</td>");
} flag = true;}}
$('#_select .chosen-container').css("width","157px");
init();checkboxAll("areaTbody");
pageFun(data.ajaxPage,"formId1");
	defTableWidthRewrite('831b2dbf0dfb494695b7ce66538a0000');
},
error: function(msg){
util.closeLoading();
utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
	}
});
}
function addCal(){
  if(!valData()){
      return ;
  }
$("#iframeId").val(window.name);
if ($("#isCloseWin").attr("checked")) {
	$("#isCloseWin_s").val("1");
}else{
	$("#isCloseWin_s").val("0");
}
getAddArea();
addWRT();
  //$("#saveBtn").prop("disabled","disabled");
  document.forms.addCalForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=3cdce5220ccc44c3ab4fcb4a794f9446";
  document.forms.addCalForm.submit();
}
 function valData(){
  var calName = document.getElementById("calName");
  if($("#calName").val() == null || $("#calName").val() ==""){
   	//_alertValMsg(calName,"%{getText('日历名称不能为空')}");
   	_alertValMsg($('#calName'), "<dict:lang value="该项不能为空" />");
     return false;
  }  
  var calStartMonth = document.getElementById("calStartMonth");
   if(parseInt($("#calStartMonth").val())> parseInt($("#calEndMonth").val())){
   		//_alertValMsg(calStartMonth,"%{getText('开始月份需小于结束月份')}");
   		_alertValMsg($('#calStartMonth_chosen'), "<dict:lang value="开始月份需小于结束月份" />");
        return false;
    } 
   if(document.getElementById("calSatFlag").checked){
      $("#calSatFlag").val("Y");
    }else{
       $("#calSatFlag").val("N");
    }
   if(document.getElementById("calSunFlag").checked){
      $("#calSunFlag").val("Y");
    }else{
       $("#calSunFlag").val("N");
    }
   if(document.getElementById("calDefaultFlag").checked){
      $("#calDefaultFlag").val("Y");
    }else{
       $("#calDefaultFlag").val("N");
    }
   
    	return true;
}

	
		

		
		function init(){
		$("#tag1").addClass("current");
		var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
		_toClickColor(tableTrJs);
		_tongLineColor(tableTrJs);
		var tableTrJss = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tbody tr");
		_toClickColor(tableTrJss);
		_tongLineColor(tableTrJss);	
		var tableTrJss_s = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a0000 tbody tr");
		_toClickColor(tableTrJss_s);
		_tongLineColor(tableTrJss_s);	
		
	}
	</script>
<style type="text/css">
.x-fieldset {
	border: 1px solid #B5B8C8;
	padding: 10px;
	margin-botton: 10px;
	display: block;
}
</style>
<script language="javascript">


//线别列表全选
function getAllArea(){
		if($("#all_addArealist").attr("checked")=="checked"){
			$("#addArealist :checkbox").attr("checked",true);
			$("#addArealist :checkbox").parents("tr").css("background-color","#d3eafc");
		}else{
			$("#addArealist :checkbox").each(function(){
				$(this).attr("checked",false);
				$("#addArealist :checkbox").parents("tr").css("background-color","");
			});
		}
	}	
function getAllArea_s(){
		if($("#all_areaTbody").attr("checked")=="checked"){
			$("#areaTbody :checkbox").attr("checked",true);
			$("#areaTbody :checkbox").parents("tr").css("background-color","#d3eafc");
		}else{
			$("#areaTbody :checkbox").each(function(){
				$(this).attr("checked",false);
				$("#areaTbody :checkbox").parents("tr").css("background-color","");
			});
		}
	}	


var paginationImpl = {};
var loaded = 1;
var tab_len = 2;

	var currentTag;
	var tabs = "";
	function switchTag(tag, content,url) {
			if(currentTag == tag){
				return false;
			}
			document.getElementById("content2").style.display="";
			for (i = 1; i < (tab_len+1); i++) {
				if ("tag" + i == tag) {
					document.getElementById(tag).getElementsByTagName("a")[0].className = "selectli1";
					document.getElementById(tag).getElementsByTagName("a")[0].getElementsByTagName("span")[0].className = "selectspan1";
				} else {
					document.getElementById("tag" + i).getElementsByTagName("a")[0].className = "";
					document.getElementById("tag" + i).getElementsByTagName("a")[0].getElementsByTagName("span")[0].className = "";
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
		}

         function addWRT(){
			var table1 = document.getElementById("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
			var table2 = document.getElementById("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678");
			var count1 = table1 .rows.length;
			var count2 = table2 .rows.length;
			var workTime = new Array();
			var valwGroup = "";
            var calwStart = "";
            var calwEnd = "";
            var calwOverFalg = "";
			var valrGroup = "";
            var calrStart = "";
           	var calrEnd = "";
           	var calRestStr = "";
			for ( var i = 2; i < count1; i++) {
				valwGroup = valwGroup+"&"+table1.rows[i].cells[0].innerHTML;
				calwStart = calwStart+"&"+table1.rows[i].cells[1].innerHTML;
				calwEnd = calwEnd+"&"+table1.rows[i].cells[2].innerHTML;
				calwOverFalg = calwOverFalg+"&"+table1.rows[i].cells[3].innerHTML;
			}
			for ( var i = 2; i < count2; i++) {
				valrGroup = valrGroup+"&"+table2.rows[i].cells[0].innerHTML;
				calrStart = calrStart+"&"+table2.rows[i].cells[1].innerHTML;
				calrEnd = calrEnd+"&"+table2.rows[i].cells[2].innerHTML;
			}
         document.getElementById("wGroup").value = valwGroup;
         document.getElementById("wStart").value = calwStart;
         document.getElementById("wEnd").value = calwEnd;
         document.getElementById("wOverFalg").value = calwOverFalg;
         document.getElementById("rGroup").value = valrGroup;
         document.getElementById("rStart").value = calrStart;
         document.getElementById("rEnd").value = calrEnd;
         document.getElementById("cal_rest_str").value ="";
         document.getElementById("workTime_count").value = workTimeCount ;
         document.getElementById("restTime_count").value = restTimeCount ;
         document.getElementById("areaCount").value = areaCount ;
         for( var y = 0; y <=count1-2; y++){
          document.getElementById("cal_rest_str").value = $("#cal_rest_str").val()+"%"+$("#sr"+y).val();}
	}
	var isQuery = false; 
	function query(thisObj){
		if(isQuery){//utilsFp.alert("<dict:lang value="数据正在提交，请稍候" />...");
		utilsFp.confirmIcon(1,"","","", "<dict:lang value="数据正在提交，请稍候" />...",0,"","");}
		document.forms.searchForm.submit();
		util.showTopLoading();
		isQuery=true;
	}
	
	
	
	</script>
<script type="text/javascript">
		
		//点击行寄选中该行
		function checkboxAll(tableId){
			$("#"+tableId+" tr").unbind("click");
			$("#"+tableId+" tr input[type=checkbox]").unbind("click");
			$("#"+tableId+" tr").on("click",function(e){
			var trId = $(this).attr("id");
			if ($("#"+trId+" :checkbox").attr("checked")) {
				$("#"+trId+" :checkbox").attr("checked",false);
				$("#"+trId).css("background-color","");
				$("#all_"+tableId).attr("checked",false);
			}else{
				$("#"+tableId+" input[type='checkbox']").each(function(){
					if ($(this).attr("checked")) {
						$(this).attr("checked",false);
						$(this).parents("tr").css("background-color","");
					}
				});
				$("#"+trId+" :checkbox").attr("checked",true);
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
		
		function delRow(){
				$("#"+rowIdStr).remove();
				$("#work_time_n"+rowIdStr).remove();
				$("#work_time_t"+rowIdStr).remove();
				$("#work_time_s"+rowIdStr).remove();
				$("#work_time_e"+rowIdStr).remove();
				$("#work_time_0"+rowIdStr).remove();
				rGroupStr = "";
			}
			function delRestRow(){
			//alert("1");
			var restTimeS = $("#sr"+rowIdStr).val();
				$("#rest_time_s"+workTimeNameStr+rowRestIdStr).remove(); 
				$("#rest_time_e"+workTimeNameStr+rowRestIdStr).remove(); 
				$("#"+workTimeNameStr+rTimeStr+rowRestIdStr).remove();
				//alert(rTimeStr+":"+workTimeNameStr+":"+rowRestIdStr);
				rGroupStr = "";
			}
		function popWorkDiv(showId,backId){
			/* $(".dept_select").chosen("destroy");
			showDivFp(422,322,"","班别","addFCWT",$("#addFCWT").html());
			
			setChosen(); */
			/*document.getElementById(showId).style.display = 'block';
			document.getElementById(backId).style.display = 'block';
			*/
			$("#"+showId+",#"+backId).show();
			$("#"+showId).draggable();
			$('.chosen-container').css("width","230px");
		}
		function popRestDiv(showId,backId){
			if(rGroupStr == ""){
				//utilsFp.alert("<dict:lang value="请选择一条工作时间！" />");
				utilsFp.confirmIcon(1,"","","", "<dict:lang value="请选择一条工作时间" />",0,"270","");
				return ;
			}
			//document.getElementById(showId).style.display = 'block';
			//document.getElementById(backId).style.display = 'block';
			popWorkDiv(showId,backId);
		}
		var TrId = 0;
		var AreaCount = 0;
		function getTrId(trId,areaCount){
			TrId = trId;
			AreaCount = areaCount;
		}
		function delAreaRow(){
			 $("#addArealist :checkbox").each(function(){
					if($(this).attr("checked")){
						$("#tr_"+$(this).attr("id")).remove();
					}
				});
			var len = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a9999 tr").length;
			for(var i=0;i<len;i++){
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a9999 tr:eq("+i+") td:first").text(i+1);
			}
			$("#all_addArealist").attr("checked",false);
		
		}
		var areaCount = 0;
		/* onclick=\"getTrId('"+$(this).attr("id")+"','"+areaCount+"')\" */
		
		function getAddAreaId(){
			var area_s = [];
			$("#areaTbody :checkbox").each(function(){
				if ($(this).attr("checked")) {
					area_s.push({
					areaId: $(this).attr("id")
					});
				}
			});
			return JSON.stringify(area_s);
		}
		
		 function addArea(showId,backId){
		 var  calStartMonth=$("#calStartMonth").val();
		 var calEndMonth= $("#calEndMonth").val()
		 	util.showTopLoading();
		 	$.ajax({
				type: "POST",
					dataType: "json",
					url: "${path}buss/bussModel_exeFunc.ms?funcMId=173876dda31f43128343e6d11ddece6c",
					data:{
					    "paraMap.flag":"checkArea",
					    "paraMap.areaId":getAddAreaId(),
					    "paraMap.calStartMonth":calStartMonth,
					    "paraMap.calEndMonth":calEndMonth
					},
					//data: "&paraMap.flag=checkArea&paraMap.areaId="+getAddAreaId()+"&paraMap.calStartMonth="+$("#calStartMonth").val()+"&paraMap.calEndMonth="+$("#calEndMonth").val(),
					success: function(data){
     					util.closeLoading();
				          if(null == data){return ;}
				          if(null != data.ajaxString){
				            utilsFp.confirmIcon(1,"","","",data.ajaxString,0,"","");
						$('.chosen-container').css("width","230px");
				            }else{
				            	$("#areaTbody :checkbox").each(function(){
								if($(this).attr("checked")){
								if (!$("#tr"+$(this).attr("id")).length) {
									$("#addArealist").append("<tr id='tr_"+$(this).attr("id")+"' ></tr>");
									$("#addArealist tr:last").append("<td style='width: 30px;text-align: center;'></td>");
									$("#addArealist tr:last").append("<td style='width: 30px;text-align: center;box-sizing: border-box;'><input type='checkbox' id='"+$(this).attr("id")+"' style='margin:0;'/></td>");
									$("#addArealist tr:last").append("<td style='width: 437px;text-align: center;'>"+$(this).attr("id")+"</td>");
									$("#addArealist tr:last").append("<td style='width:437px;text-align: center;'>"+$(this).attr("name")+"</td>");
								}
							}
						});
					var len = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a9999 tr").length;
					for(var i=0;i<len;i++){
						$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a9999 tr:eq("+i+") td:first").text(i+1);
					}
					$("#tag1").removeClass();
					$("#areaTbody").empty();
					$("#areaId").val("");
					$("#areaName").val("");
					$("#searchArea").find("option[value='']").attr("selected",true);
			        $("#searchArea").trigger("chosen:updated");
					$("#all_areaTbody").attr("checked",false);
					document.getElementById(showId).style.display = 'none';
					document.getElementById(backId).style.display = 'none';
					checkboxAll("addArealist");
					            }
					},
					error: function(msg){
     				if(msg.readyState!=0){
     					util.closeLoading();
					utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");}
					}
					});
		} 
		
		function getAddArea(){
			$("#addArealist :checkbox").each(function(){
					$("#addCalForm").append("<input type='hidden' id='areaID"+areaCount+"' name='areaID"+areaCount+"' value='"+$(this).attr("id")+"'>");
  					areaCount++;
				});
		}
		
		
		$(function(){
			var len = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a9999 tr").length;
			for(var i=1;i<len;i++){
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a9999 tr:eq("+i+") td:first").text(i);
			}
			newScroll("workTime_div")
			newScroll("restTime_div")
			newScroll("areatb_div")
		});
		
		function hideDiv(showId,backId){
			document.getElementById("calwGroup_err").innerHTML = "";
			document.getElementById("calwTime_err").innerHTML = "";
			document.getElementById("calwStart_err").innerHTML = "";
			$("#calwInterDay").attr("checked",false);
			$("#calwInterDay").val("0");
			$("#calwGroup").find("option[value='']").attr("selected",true);
			$("#calwTime").find("option[value='']").attr("selected",true);
			$("#calwGroup").trigger("chosen:updated");
			$("#calwTime").trigger("chosen:updated");
			//document.getElementById(showId).style.display = 'none';
			//document.getElementById(backId).style.display = 'none';
			$("#"+showId+",#"+backId).hide();
			document.getElementById("calwGroup").value="";
			document.getElementById("calwTime").value="";
			document.getElementById("calwStartH").value="";
			document.getElementById("calwStartM").value="";
			document.getElementById("calwEndH").value="";
			document.getElementById("calwEndM").value="";
			closeDivFp(showId+"pop");
		}
		function hideDivr(showId,backId){
			document.getElementById("calrStart_err").innerHTML = "";
			$("#"+showId+",#"+backId).hide();
			document.getElementById("calrStartH").value="";
			document.getElementById("calrStartM").value="";
			document.getElementById("calrEndH").value="";
			document.getElementById("calrEndM").value="";
			rGroupStr = "";
		}
		function hideDivrs(showId,backId){
			$("#tag1").removeClass();
			$("#areaTbody").empty();
			$("#areaId").val("");
			$("#areaName").val("");
			$("#areaName").val("");
	        $("#searchArea").trigger("chosen:updated");
			$("#all_areaTbody").attr("checked",false);
			$("#"+showId+",#"+backId).hide();
		}
		var rGroupStr = "";
		var rTimeStr = "";
		var rStartHStr = "";
		var rStartMStr = "";
		var rEndHStr = "";
		var rEndMStr = "";
		var rowIdStr = "";
		var calwInterDay = "";
		var STARTTIME = "";
		var ENDTIME = "";
		function wGroup(valwGroup,rStartH,rStartM,rEndH,rEndM,valwTime,rowId,cid){
			rGroupStr = valwGroup;
			rTimeStr = valwTime;
			rStartHStr = rStartH;
			rStartMStr = rStartM;
			rEndHStr = rEndH;
			rEndMStr = rEndM;
			rowIdStr  = rowId;
			calwInterDay = cid;
			STARTTIME = $("#"+rowId).attr("startTime");
			ENDTIME = $("#"+rowId).attr("endTime");
			document.getElementById("calrGroup").value=valwGroup;
			document.getElementById("calrTime").value=valwTime;
			$('tr[name="restTimeTr"]').hide();
			for(var a=0;a<=restTimeCount;a++){
				if($("#"+valwGroup+rTimeStr+a).length>0){
					$("#"+valwGroup+rTimeStr+a).show();
				}
			}
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr").css("background-color","");
	        init();
	        $("[id='"+valwGroup+"'][shiduan='"+valwTime+"']").css("background-color","#a0c8e5");
		}
		var rowRestIdStr = "";
		var workTimeNameStr = "";
		function rGroup(rowRestId,workTimeName){
			rowRestIdStr  = rowRestId;
			workTimeNameStr = workTimeName;
			//alert(rowRestIdStr+","+workTimeNameStr);
			$("#addRestTime tr").css("background-color","");
	        init();
	        $("#"+rowRestId).css("background-color","#a0c8e5");
		}
  			var workTimeCount = 0;
		function addWorkTime(showId,backId){
			
			if(!checkWData()){
      				return ;
  			}
  			$("#addCalForm").append("<input type='hidden' id='work_time_n"+workTimeCount+"' name='work_time_n"+workTimeCount+"' value='"+$("#calwGroup").val()+"'>");
  			$("#addCalForm").append("<input type='hidden' id='work_time_t"+workTimeCount+"' name='work_time_t"+workTimeCount+"' value='"+$("#calwTime").val()+"'>");
  			$("#addCalForm").append("<input type='hidden' id='work_time_s"+workTimeCount+"' name='work_time_s"+workTimeCount+"' value='"+$("#calwStartH").val()+":"+$("#calwStartM").val()+"'>");
  			$("#addCalForm").append("<input type='hidden' id='work_time_e"+workTimeCount+"' name='work_time_e"+workTimeCount+"' value='"+$("#calwEndH").val()+":"+$("#calwEndM").val()+"'>");
  			$("#addCalForm").append("<input type='hidden' id='work_time_o"+workTimeCount+"' name='work_time_o"+workTimeCount+"' value='"+$("#calwOverFalg").val()+"'>");
  			$("#addCalForm").append("<input type='hidden' id='work_time_i"+workTimeCount+"' name='work_time_i"+workTimeCount+"' value='"+$("#calwInterDay").val()+"'>");
  		//	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<input type='hidden' id='sr"+workTimeCount+"' value=''>");
  			if ($("#calwInterDay").val()=="Y") {
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='"+workTimeCount+"' "+"startTime='2017-01-01 "+$("#calwStartH").val()+":"+$("#calwStartM").val()+":00' "+"endTime='2017-01-02 "+$("#calwEndH").val()+":"+$("#calwEndM").val()+":00' "+
					" onclick=\"wGroup('"+$("#calwGroup").val()+"','"+$("#calwStartH").val()+"','"+$("#calwStartM").val()+"','"+$("#calwEndH").val()+"','"+$("#calwEndM").val()+"','"+$("#calwTime").val()+"','"+workTimeCount+"','"+$("#calwInterDay").val()+"');\"></tr>");
			}else{
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='"+workTimeCount+"' "+"startTime='2017-01-01 "+$("#calwStartH").val()+":"+$("#calwStartM").val()+":00' "+"endTime='2017-01-01 "+$("#calwEndH").val()+":"+$("#calwEndM").val()+":00' "+
					" onclick=\"wGroup('"+$("#calwGroup").val()+"','"+$("#calwStartH").val()+"','"+$("#calwStartM").val()+"','"+$("#calwEndH").val()+"','"+$("#calwEndM").val()+"','"+$("#calwTime").val()+"','"+workTimeCount+"','"+$("#calwInterDay").val()+"');\"></tr>");
			}
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td name='calwGroup' align='center' style='width:150px;'>"+$("#calwGroup").val()+"</td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td name='calwGroup' align='center' style='width:150px;'>"+$("#calwTime").val()+"</td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td name='calwStart' align='center' style='width:218px;'>"+$("#calwStartH").val()+":"+$("#calwStartM").val()+"</td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td name='calwEnd' align='center' style='width:218px;'>"+$("#calwEndH").val()+":"+$("#calwEndM").val()+"</td>");
			if($("#calwInterDay").val()=="Y"){
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td name='calwInterDay' align='center' style='width:218px;'><dict:lang value='是'/></td>");
			}else{
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td name='calwInterDay' align='center' style='width:218px;'><dict:lang value='否'/></td>");
			}
			if($("#calwOverFalg").val()=="Y"){
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td name='calwOverFalg' align='center' style='width:218px;'><dict:lang value='是'/></td>");
			}else{
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td name='calwOverFalg' align='center' style='width:218px;'><dict:lang value='否'/></td>");
			}
		
			workTimeCount++;
			init();
			document.getElementById("calwGroup").value="";
			document.getElementById("calwTime").value="";
			document.getElementById("calwStartH").value="";
			document.getElementById("calwStartM").value="";
			document.getElementById("calwEndH").value="";
			document.getElementById("calwEndM").value="";
			$("#calwInterDay").attr("checked",false);
			$("#calwInterDay").val("0");
			$("#calwGroup").find("option[value='']").attr("selected",true);
			$("#calwTime").find("option[value='']").attr("selected",true);
			$("#calwGroup").trigger("chosen:updated");
			$("#calwTime").trigger("chosen:updated");
			document.getElementById(showId).style.display = 'none';
			document.getElementById(backId).style.display = 'none';
		}
    
    function closeValMsg(objthis){
    	document.getElementById(objthis).innerHTML = "";
    }
		function checkWData(){
			
			var calwGroup = document.getElementById("calwGroup_chosen");
			if($("#calwGroup").val() == null || $("#calwGroup").val() ==""){
			switchTag('tag1','content1','${path}buss/bussModel.ms?exeid=e8381c90ac7143a3b1ec4ac8ac8e91d2');
   				_alertValMsg(calwGroup,"<dict:lang value="班别名称不能为空" />");
       			return false;
  			} 
			var calwTime = document.getElementById("calwTime");
			if($("#calwTime").val() == null || $("#calwTime").val() ==""){
   				_alertValMsg(calwTime,"<dict:lang value="班别时段不能为空" />");
       			return false;
  			} 
			document.getElementById("calwGroup_err").innerHTML = "";
			document.getElementById("calwTime_err").innerHTML = "";
			document.getElementById("calwStart_err").innerHTML = "";
			if($("#calwStartH").val() == null || $("#calwStartH").val() ==""){
     			document.getElementById("calwStartH").value = "00";
  			} 
  			
			if($("#calwStartM").val() == null || $("#calwStartM").val() ==""){
     			document.getElementById("calwStartM").value = "00";
  			} 
			if($("#calwEndH").val() == null || $("#calwEndH").val() ==""){
     			document.getElementById("calwEndH").value = "00";
  			} 
			if($("#calwEndM").val() == null || $("#calwEndM").val() ==""){
     			document.getElementById("calwEndM").value = "00";
  			} 
			if (parseInt($("#calwStartH").val())!=0&&$("#calwStartH").val().length==1) {
				$("#calwStartH").val("0"+$("#calwStartH").val());
			}
			if (parseInt($("#calwStartM").val())!=0&&$("#calwStartM").val().length==1) {
				$("#calwStartM").val("0"+$("#calwStartM").val());
			}
			if (parseInt($("#calwEndH").val())!=0&&$("#calwEndH").val().length==1) {
				$("#calwEndH").val("0"+$("#calwEndH").val());
			}
			if (parseInt($("#calwEndM").val())!=0&&$("#calwEndM").val().length==1) {
				$("#calwEndM").val("0"+$("#calwEndM").val());
			}
			if (document.getElementById("calwOverFalg").checked==true) {
				document.getElementById("calwOverFalg").value = "Y";
			}else{
				document.getElementById("calwOverFalg").value = "N";
			}
			if (document.getElementById("calwInterDay").checked==true) {
				document.getElementById("calwInterDay").value = "Y";
			}else{
				document.getElementById("calwInterDay").value = "N";
			} 
			var calwStart_err = document.getElementById("calwStartH");
			if (parseInt($("#calwStartH").val())<0 || parseInt($("#calwStartH").val())>23 
					|| parseInt($("#calwStartM").val())<0 || parseInt($("#calwStartM").val())>60
					|| parseInt($("#calwEndH").val())<0 || parseInt($("#calwEndH").val())>23
					|| parseInt($("#calwEndM").val())<0 || parseInt($("#calwEndM").val())>60) {
   				_alertValMsg(calwStart_err,"<dict:lang value="请输入正确的时间" />");
       				return false;
			}
			var w_startTime = null;
			var w_endTime = null;
			var w_startTime_table = null;
			var w_endTime_table = null;
			w_startTime = "2017-01-01 "+$("#calwStartH").val()+":"+$("#calwStartM").val()+":00";
			if ($("#calwInterDay").val()!="Y") {
				w_endTime = "2017-01-01 "+$("#calwEndH").val()+":"+$("#calwEndM").val()+":00";
				if (parseInt($("#calwStartH").val())>parseInt($("#calwEndH").val())) {
	   				_alertValMsg(calwStart_err,"<dict:lang value="开始时间不能晚于结束时间" />");
	       				return false;
				}else if (parseInt($("#calwStartH").val())==parseInt($("#calwEndH").val())) {
					if (parseInt($("#calwStartM").val())>=parseInt($("#calwEndM").val())) {
	   						_alertValMsg(calwStart_err,"<dict:lang value="开始时间不能晚于或等于结束时间" />");
	       					return false;
					}
				}
			}else{
				w_endTime = "2017-01-02 "+$("#calwEndH").val()+":"+$("#calwEndM").val()+":00";
				if (parseInt($("#calwStartH").val())>parseInt("12")) {
					if (parseInt($("#calwEndH").val())>parseInt("12")) {
   						_alertValMsg(calwStart_err,"<dict:lang value="请输入跨天时间" />");
       					return false;
					}
				}else{
					if (parseInt($("#calwStartH").val())<parseInt($("#calwEndH").val())) {
   						_alertValMsg(calwStart_err,"<dict:lang value="请输入跨天时间" />");
       						return false;
       					}
				}
			}
			var tableWork = document.getElementById("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
			var count = tableWork.rows.length;
			var calwStart,calwStarts,calwEnd,calwEnds;
			var interDay = 0;
			if (count>0) {
				var w_stdt = new Date(w_startTime.replace("-","/"));
				var w_etdt = new Date(w_endTime.replace("-","/"));
				var tablestdt,tableetdt;
				for ( var i = 0; i < count; i++) {
					w_startTime_table = "2017-01-01 "+tableWork.rows[i].cells[2].innerHTML+":00";
					if (tableWork.rows[i].cells[4].innerHTML == "<dict:lang value='是'/>") {
						w_endTime_table = "2017-01-02 "+tableWork.rows[i].cells[3].innerHTML+":00";
						interDay ++;
					}else{
							w_endTime_table = "2017-01-01 "+tableWork.rows[i].cells[3].innerHTML+":00";
						}
					var calwGroup = document.getElementById("calwGroup");
					if ($("#calwGroup").val() == tableWork.rows[i].cells[0].innerHTML) {
							if ($("#calwTime").val() == tableWork.rows[i].cells[1].innerHTML) {
	   							_alertValMsg(calwGroup,"<dict:lang value="同班别下已存在该时段" />");
	       						return false;
							}
					}
					tablestdt = new Date(w_startTime_table.replace("-","/"));
					tableetdt = new Date(w_endTime_table.replace("-","/")); 
					if (tablestdt<=w_stdt) {
						if (w_stdt<tableetdt) {
							_alertValMsg(calwStart_err,"<dict:lang value="时间不能交叉" />");
       						return false;
						}
					}else{
					    if (w_etdt>tablestdt) {
							_alertValMsg(calwStart_err,"<dict:lang value="时间不能交叉" />");
       						return false;
						}
					}
					if (tablestdt<w_etdt ) {
						if (w_etdt<tableetdt) {
							_alertValMsg(calwStart_err,"<dict:lang value="时间不能交叉" />");
	       					return false;
						}
					}else{
					    
					}
					
			}
			if ($("#calwInterDay").val()=="Y" && interDay > 0) {
				//utilsFp.alert("<dict:lang value="已存在跨天工作时间" />");
				utilsFp.confirmIcon(1,"","","", "<dict:lang value="已存在跨天工作时间" />",0,"","");
				interDay = 0;
				return false;
			}
			}
			if (document.getElementById("calwOverFalg").checked==true) {
				document.getElementById("calwOverFalg").value = "Y";
			}else{
             	document.getElementById("calwOverFalg").value = "N";
       			 }
			if (document.getElementById("calwInterDay").checked==true) {
				document.getElementById("calwInterDay").value = "Y";
			}else{
             	document.getElementById("calwInterDay").value = "N";
       			 }
    			return true;
		}
			var restTimeCount = 0;
		function addRestTime(showId,backId,wGroupName){
			if(!checkRData()){
      			return ;
  			}
  			$("#addCalForm").append("<input type='hidden' id='rest_time_n"+rGroupStr+"r"+restTimeCount +"' name='rest_time_n"+rGroupStr+rTimeStr+restTimeCount +"' value='"+rGroupStr+"'>");
  			$("#addCalForm").append("<input type='hidden' id='rest_time_s"+rGroupStr+"r"+restTimeCount +"' name='rest_time_s"+rGroupStr+rTimeStr+restTimeCount +"' value='"+$("#calrStartH").val()+":"+$("#calrStartM").val()+"'>");
  			$("#addCalForm").append("<input type='hidden' id='rest_time_e"+rGroupStr+"r"+restTimeCount +"' name='rest_time_e"+rGroupStr+rTimeStr+restTimeCount +"' value='"+$("#calrEndH").val()+":"+$("#calrEndM").val()+"'>");
  			if (calwInterDay == "Y") {
				if (parseInt($("#calrStartH").val()) <= parseInt($("#calrEndH").val())) {
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tbody:last").append("<tr align='center' name='restTimeTr' id='"+rGroupStr+rTimeStr+restTimeCount+"' onclick=rGroup('"+restTimeCount+"','"+rGroupStr+"') "+
						"startTime='2017-01-01 "+$("#calrStartH").val()+":"+$("#calrStartM").val()+":00' "+"endTime='2017-01-01 "+$("#calrEndH").val()+":"+$("#calrEndM").val()+":00' "+" ></tr>");
				}else{
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tbody:last").append("<tr align='center' name='restTimeTr' id='"+rGroupStr+restTimeCount+"' onclick=rGroup('"+restTimeCount+"','"+rGroupStr+"') "+
						"startTime='2017-01-01 "+$("#calrStartH").val()+":"+$("#calrStartM").val()+":00' "+"endTime='2017-01-02 "+$("#calrEndH").val()+":"+$("#calrEndM").val()+":00' "+" ></tr>");
				}
			}else{
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tbody:last").append("<tr align='center' name='restTimeTr' id='"+rGroupStr+rTimeStr+restTimeCount+"' onclick=rGroup('"+restTimeCount+"','"+rGroupStr+"') "+
					"startTime='2017-01-01 "+$("#calrStartH").val()+":"+$("#calrStartM").val()+":00' "+"endTime='2017-01-01 "+$("#calrEndH").val()+":"+$("#calrEndM").val()+":00' "+" ></tr>");
			}
  			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td align='center' style='width:70px;' name='calrGroup'>"+rGroupStr+"</td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td align='center' style='width:70px;' name='calrGroup'>"+rTimeStr+"</td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td align='center' style='width:437px; name='calrStart'>"+$("#calrStartH").val()+":"+$("#calrStartM").val()+"</td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tr:last").append("<td align='center' style='width:437px;'name='calrEnd'>"+$("#calrEndH").val()+":"+$("#calrEndM").val()+"</td>");
			$("#sr"+rowIdStr).val($("#sr"+rowIdStr).val()+"@"+"r"+restTimeCount+"&"+rGroupStr+"&"+$("#calrStartH").val()+":"+$("#calrStartM").val()+"&"+$("#calrEndH").val()+":"+$("#calrEndM").val());
			restTimeCount++;
				defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a5678");
			init();
			document.getElementById("calrStartH").value="";
			document.getElementById("calrStartM").value="";
			document.getElementById("calrEndH").value="";
			document.getElementById("calrEndM").value="";
			document.getElementById(showId).style.display = 'none';
			document.getElementById(backId).style.display = 'none';
		}
		function checkRData(){
			document.getElementById("calrStart_err").innerHTML = "";
			if($("#calrStartH").val() == null || $("#calrStartH").val() ==""){
     			document.getElementById("calrStartH").value = "00";
  			} 
			if($("#calrStartM").val() == null || $("#calrStartM").val() ==""){
     			document.getElementById("calrStartM").value = "00";
  			} 
			if($("#calrEndH").val() == null || $("#calrEndH").val() ==""){
     			document.getElementById("calrEndH").value = "00";
  			} 
			if($("#calrEndM").val() == null || $("#calrEndM").val() ==""){
     			document.getElementById("calrEndM").value = "00";
  			} 
			if (parseInt($("#calrStartH").val())!=0&&$("#calrStartH").val().length==1) {
				$("#calrStartH").val("0"+$("#calrStartH").val());
			}
			if (parseInt($("#calrStartM").val())!=0&&$("#calrStartM").val().length==1) {
				$("#calrStartM").val("0"+$("#calrStartM").val());
			}
			if (parseInt($("#calrEndH").val())!=0&&$("#calrEndH").val().length==1) {
				$("#calrEndH").val("0"+$("#calrEndH").val());
			}
			if (parseInt($("#calrEndM").val())!=0&&$("#calrEndM").val().length==1) {
				$("#calrEndM").val("0"+$("#calrEndM").val());
			}
			var calrGroup = document.getElementById("calwGroup");
			if($("#calrGroup").val() == null || $("#calrGroup").val() ==""){
   				_alertValMsg(calrGroup,"<dict:lang value="班别名称不能为空" />");
       			return false;
  			}  
			var calrStart_err = document.getElementById("calrStartH");
			if (parseInt($("#calrStartH").val())<0 || parseInt($("#calrStartH").val())>23 
					|| parseInt($("#calrStartM").val())<0 || parseInt($("#calrStartM").val())>60
					|| parseInt($("#calrEndH").val())<0 || parseInt($("#calrEndH").val())>23
					|| parseInt($("#calrEndM").val())<0 || parseInt($("#calrEndM").val())>60) {
   					_alertValMsg(calrStart_err,"<dict:lang value="请输入正确的时间" />");
       				return false;
			}
			if (calwInterDay != "Y") {
				if (parseInt($("#calrStartH").val())>parseInt($("#calrEndH").val())) {
   						_alertValMsg(calrStart_err,"<dict:lang value="开始时间不能晚于结束时间" />");
	       				return false;
				}else if (parseInt($("#calrStartH").val())==parseInt($("#calrEndH").val())) {
					if (parseInt($("#calrStartM").val())>=parseInt($("#calrEndM").val())) {
   							_alertValMsg(calrStart_err,"<dict:lang value="开始时间不能晚于或等于结束时间" />");
	       					return false;
					}
				}
				if (parseInt($("#calrStartH").val())<parseInt(rStartHStr) || parseInt($("#calrStartH").val())>parseInt(rEndHStr)
						||parseInt($("#calrEndH").val())<parseInt(rStartHStr) || parseInt($("#calrEndH").val())>parseInt(rEndHStr)) {
   						_alertValMsg(calrStart_err,"<dict:lang value="休息时间不在工作时间内" />");
       					return false;
				}else if (parseInt($("#calrStartH").val())==parseInt(rStartHStr) || parseInt($("#calrEndH").val())==parseInt(rEndHStr)) {
						if(parseInt(rStartMStr)!=0){
						if (parseInt($("#calrStartH").val())==parseInt(rStartHStr)&&parseInt($("#calrStartM").val())<parseInt(rStartMStr)) {
   								_alertValMsg(calrStart_err,"<dict:lang value="休息时间不在工作时间内" />");
       							return false;
						}}
						if(parseInt(rEndMStr)!=0){
						if (parseInt($("#calrEndH").val())==parseInt(rEndHStr)&&parseInt($("#calrEndM").val())>parseInt(rEndMStr)) {
   								_alertValMsg(calrStart_err,"<dict:lang value="休息时间不在工作时间内" />");
       							return false;
						}}
					}
				}else{
					if (parseInt(rEndHStr)<parseInt(rStartHStr)) {
					    startTime = "2017-01-01 "+rStartHStr+":"+rStartMStr+":00";
						endTime = "2017-01-02 "+rEndHStr+":"+rEndMStr+":00";
						if (parseInt($("#calrStartH").val())<=parseInt(rEndHStr)) {
							inst = "2017-01-02 "+$("#calrStartH").val()+":"+$("#calrStartM").val()+":00";
							inet = "2017-01-02 "+$("#calrEndH").val()+":"+$("#calrEndM").val()+":00";
						}else{
							inst = "2017-01-01 "+$("#calrStartH").val()+":"+$("#calrStartM").val()+":00";
							if (parseInt($("#calrEndH").val())<=parseInt(rEndHStr)) {
								inet = "2017-01-02 "+$("#calrEndH").val()+":"+$("#calrEndM").val()+":00";
							}else{
								inet = "2017-01-01 "+$("#calrEndH").val()+":"+$("#calrEndM").val()+":00";
							}
						}
						stdt = new Date(startTime.replace("-","/"));
						etdt = new Date(endTime.replace("-","/"));
						instdt = new Date(inst.replace("-","/"));
						inetdt = new Date(inet.replace("-","/"));
						if (instdt<stdt || inetdt>etdt) {
							_alertValMsg(calrStart_err,"<dict:lang value="休息时间不在工作时间内" />");
	       					return false;
						}
						if (instdt>=inetdt) {
							_alertValMsg(calrStart_err,"<dict:lang value="开始时间不能晚于或等于结束时间" />");
	       					return false;
						}
					var flag = true;
					$("#addRestTime").find("tr").each(function(i,item){
						var start = $(item).attr("startTime");
						var end = $(item).attr("endTime");
						var tablestdt = new Date(start.replace("-","/"));
						var tableetdt = new Date(end.replace("-","/")); 
					if (tablestdt<=instdt) {
						if (instdt<tableetdt) {
							_alertValMsg(calrStart_err,"<dict:lang value="时间不能交叉" />");
	       					flag = false;
       						return flag;
						}
					}else{
					    if (inetdt>tablestdt) {
							_alertValMsg(calwStart_err,"<dict:lang value="时间不能交叉" />");
	       					flag = false;
       						return flag;
						}
					}
					if (tablestdt<inetdt ) {
						if (inetdt<tableetdt) {
							_alertValMsg(calrStart_err,"<dict:lang value="时间不能交叉" />");
	       					flag = false;
	       					return flag;
						}
					}
						/*if (instdt>=tablestdt && instdt<tableetdt) {
							_alertValMsg(calrStart_err,"<dict:lang value="休息时间不能交叉" />");
	       					flag = false;
	       					return false;
						}
						if (inetdt>=tablestdt && inetdt<tableetdt) {
							_alertValMsg(calrStart_err,"<dict:lang value="休息时间不能交叉" />");
	       					flag = false;
	       					return false;
						}*/
					});
					if (!flag) {
						return false;
					}
						
					}
				}
				
			var table2 = document.getElementById("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678");
			var count = table2 .rows.length;
			var calrStart,calrStarts,calrEnd,calrEnds;
			var startTime,endTime,stdt,etdt,instdt,inetdt;
			var inst="";
			var inet="";
			var st="";
			var et="";
			if (count>0) {
				for ( var i = 0; i < count; i++) {
				calrStart = table2.rows[i].cells[2].innerHTML;
				calrEnd = table2.rows[i].cells[3].innerHTML;
				calrStarts = new Array();
				calrEnds= new Array();
				calrStarts = calrStart.split(":");
				calrEnds= calrEnd.split(":");
				
				st = "2017-01-01 "+calrStart+":00";
				if ("Y" == calwInterDay) {
					if (parseInt($("#calrEndH").val())<parseInt($("#calrStartH").val())) {
						inst = "2017-01-01 "+$("#calrStartH").val()+":"+$("#calrStartM").val()+":00";
						inet = "2017-01-02 "+$("#calrEndH").val()+":"+$("#calrEndM").val()+":00";
					}else{
						inst = "2017-01-01 "+$("#calrStartH").val()+":"+$("#calrStartM").val()+":00";
						inet = "2017-01-01 "+$("#calrEndH").val()+":"+$("#calrEndM").val()+":00";
					}
					if (parseInt(calrEnds[0])<parseInt(calrStarts[0])) {
						et = "2017-01-02 "+calrEnd+":00";
					}else{
						et = "2017-01-01 "+calrEnd+":00";
					}
				}else{
					inst = "2017-01-01 "+$("#calrStartH").val()+":"+$("#calrStartM").val()+":00";
					inet = "2017-01-01 "+$("#calrEndH").val()+":"+$("#calrEndM").val()+":00";
					et = "2017-01-01 "+calrEnd+":00";
				}
				stdt = new Date(st.replace("-","/"));
				etdt = new Date(et.replace("-","/"));
				instdt = new Date(inst.replace("-","/"));
				inetdt = new Date(inet.replace("-","/"));
					if (stdt<=instdt) {
						if (instdt<etdt) {
							_alertValMsg(calrStart_err,"<dict:lang value="时间不能交叉" />");
	       					flag = false;
       						return flag;
						}
					}else{
					    if (instdt<etdt) {
							_alertValMsg(calrStart_err,"<dict:lang value="时间不能交叉" />");
	       					flag = false;
       						return flag;
						}
					}
					if (stdt<inetdt ) {
						if (inetdt<etdt) {
							_alertValMsg(calrStart_err,"<dict:lang value="时间不能交叉" />");
	       					flag = false;
	       					return flag;
						}
					}
				/*if (instdt>stdt && instdt<=etdt) {
					_alertValMsg(calrStart_err,"<dict:lang value="时间不能交叉" />");
       				return false;
				}
				if (inetdt>stdt && inetdt<=etdt) {
					_alertValMsg(calrStart_err,"<dict:lang value="时间不能交叉" />");
       				return false;
				}*/
				
				
				
				/* if (parseInt($("#calrStartH").val())>parseInt(calrStarts[0])) {
						if (parseInt($("#calrStartH").val())<parseInt(calrEnds[0])) {
   								_alertValMsg(calrStart_err,"<dict:lang value="时间不能交叉" />");
       							return false;
						}	
				}
				if (parseInt($("#calrEndH").val())>parseInt(calrStarts[0])) {
					if (parseInt($("#calrEndH").val())<parseInt(calrEnds[0])) {
   							_alertValMsg(calrStart_err,"<dict:lang value="时间不能交叉" />");
       						return false;
					}
				}
				if(parseInt($("#calrStartH").val()) == parseInt(calrStarts[0])){
						if (parseInt($("#calrEndH").val())==parseInt(calrEnds[0])) {
							if (parseInt($("#calrStartM").val())>=parseInt(calrStarts[1])&&parseInt($("#calrStartM").val())<=parseInt(calrEnds[1])) {
								_alertValMsg(calrStart_err,"<dict:lang value="时间不能交叉" />");
       							return false;
							}
						}else{
							if (parseInt($("#calrStartM").val())>=parseInt(calrStarts[1])||parseInt($("#calrStartM").val())<=parseInt(calrEnds[1])) {
								_alertValMsg(calrStart_err,"<dict:lang value="时间不能交叉" />");
       							return false;
							}
						}
						} */
			}
			}
    			return true;
		}
    
    function closeValMsg(objthis){
    	document.getElementById(objthis).innerHTML = "";
    }
function newScroll(id){

	$("#"+ id).mCustomScrollbar({
		axis:"yx",
		snapAmount:40,
		theme:"minimal-dark",
		keyboard:{scrollAmount:40},
		mouseWheel:{deltaFactor:40,preventDefault:true},
		scrollInertia:80,
			
	  });
}	
</script>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
<style type="text/css">
.black_overlay {
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: #f8fcff;
	z-index: 1001;
	opacity: 0.5;
	filter: alpha(opacity = 88);
}

.white_content {
	display: none;
	position: absolute;
	top: 25%;
	left: 25%;
	width: 50%;
	height: 60%;
	padding: 10px;
	border: 1px solid #cbe9ff;
	background-color: #f8fcff;
	z-index: 1002;
	overflow: auto;
}

.white_contents {
	display: none;
	position: absolute;
	top: 15%;
	left: 2%;
	width: 94%;
	height: 65%;
	padding: 10px;
	border: 1px solid #cbe9ff;
	background-color: #f8fcff;
	z-index: 1002;
	overflow: auto;
}
.aaa{
  width:70px !important;
}

.mCSB_inside>.mCSB_container{
	margin-right:0;
}
.mCustomScrollBox>.mCSB_scrollTools{
	right:-5px;
}
</style>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="inHead" />
    </jsp:include> 
</head>
<body scroll="no"
	style="overflow-x:hidden;overflow-y:hidden;height:800px">
	<div class="mod" style="margin-top: 37px;">
		<div>
			<div class="hd" style="height:0;">
			<div style="margin-left:10px;margin-top: -35px;">
				<div class="save-close" title="<dict:lang value='保存并关闭窗口' />" onclick="saveClose(this)"></div>
				<input type="checkbox" checked id="isCloseWin" value="0" style="display:none;"/>
				
			</div>
				<div class="optn" style="right:5px;">
					<button type="button" onclick="addCal();;">
						<i class="ico ico-save"></i>
						<dict:lang value="保存" />
					</button>
					<button type="button" onclick="closeWindow();">
						<i class="ico ico-cancel"></i>
						<dict:lang value="取消" />
					</button>
				</div>
			</div>
			<div style="height: 460px;padding:0 20px;">
				<form id="addCalForm" name="addForm"
					action="${path}buss/bussModel.ms" method="post"
					<bu:formet exeid="%{exeid}" /> target="submitFrame">
					<input type="hidden" id="isCloseWin_s" name="isCloseWin"/>
					<input type="hidden" name="exeid" value="${exeid}"> <input
						type="hidden" name="wGroup" id="wGroup" value=""> <input
						type="hidden" name="wStart" id="wStart" value="}"> <input
						type="hidden" name="wEnd" id="wEnd" value=""> <input
						type="hidden" name="wOverFalg" id="wOverFalg" value=""> <input
						type="hidden" name="rGroup" id="rGroup" value=""> <input
						type="hidden" name="rStart" id="rStart" value="}"> <input
						type="hidden" name="rEnd" id="rEnd" value=""> <input
						type="hidden" name="cal_rest_str" id="cal_rest_str" value="">
					<input type="hidden" name="workTime_count" id="workTime_count"
						value=""> <input type="hidden" name="restTime_count"
						id="restTime_count" value=""> <input type="hidden"
						name="areaCount" id="areaCount" value=""> <input
						type="hidden" name="iframeId" id="iframeId" />
						<input type="hidden" name="formId" value="53702b48b70f436ca1f2252894d37c09">
						<input type="hidden" name="formId" id="formId1" value='831b2dbf0dfb494695b7ce66538a9999'/>
		                <input type="hidden" name="formId" id="formId4" value='831b2dbf0dfb494695b7ce66538a0000'/>
		                <input type="hidden" name="formId" id="formId3" value='831b2dbf0dfb494695b7ce66538a5678'/>
				
					<table class="basic-table">
						<tr>
							<td class="name" style="width:93px;"><span class="dot">*</span>
							<dict:lang value="日历名称" />
							</td>
							<td class="dec"><input class="input" name="calName"
								id="calName" maxlength="100" /> <span class="Eng"><span
									id="calName_err"></span>
							</span>
							</td>


							<td class="name" style="width:52px;"><dict:lang value="周六上班" />
							</td>

							<td class="dec" style="width:260px;"><input type="checkbox"
								id="calSatFlag" name="calSatFlag" value="N" maxlength="2">
								&#x3000; <dict:lang value="周天上班" /> <input type="checkbox"
								id="calSunFlag" name="calSunFlag" value="N" maxlength="2">
								&#x3000; <dict:lang value="默认标识" /> <input type="checkbox"
								id="calDefaultFlag" name="calDefaultFlag" value="0"
								maxlength="2"></td>



						</tr>
						<tr>
							<td class="name"><dict:lang value="开始月份" />
							</td>
							<td class="dec"><select id="calStartMonth"
								name="calStartMonth" class="dept_select" style="width: 230px;">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
							</select> <span class="Eng"><span id="calStartMonth_err"></span>
							</span>
							</td>
							<td class="name"><dict:lang value="结束月份" />
							</td>
							<td class="dec"><select id="calEndMonth" name="calEndMonth"
								class="dept_select" style="width: 230px;">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
							</select>
							</td>
						</tr>
						<tr>
							<td class="name"><dict:lang value="周起始" /></td>
							<td class="dec">
								<dict:selectDict name="calWeekBegin" id="calWeekBegin" dictCode="WEEK_BEGIN" style="cursor: pointer;width:230px;" cssClass="dept_select" />
							</td>
						</tr>
					</table>
					<%-- <bu:form viewId="7c413e16ba004221b215aaf7e0ad6cd7"
						formId="40dc55c074cf4093926c8adc4d236ec7" list="dataList "
						formidFirstId="53702b48b70f436ca1f2252894d37c09" relColIds=""
						subFormIds="" subRelColIds="" />  --%>
					<div class="js-tab">
						<DIV id="container">
							<DIV id="hd">
								<UL class="tab-list tab">
									<LI id="tag1"><A class="selectli1"
										onclick="switchTag('tag1','content1','${path}buss/bussModel.ms?exeid=e8381c90ac7143a3b1ec4ac8ac8e91d2');this.blur();"
										href="javascript:void(0);"> <SPAN class="selectspan1"><dict:lang
													value="班别信息" />
										</SPAN> </A></LI>
									<LI id="tag2"><A class=""
										onclick="switchTag('tag2','content2','${path}buss/bussModel.ms?exeid=f72a754bd2af4246a79dd94a1b271a8a');this.blur();"
										href="javascript:void(0);"> <SPAN><dict:lang
													value="线别设置" />
										</SPAN> </A></LI>
								</UL>
							</DIV>
							<DIV class="content1" id="content" data-tab="tag1">
								<DIV id="content1" data-tab="tag1">
									<div data-tab="tag1">
										<bu:funcsi viewId="7c413e16ba004221b215aaf7e0ad6cd7"
											funcId="ed334aadf26347b78c1dcaa1b677691a" isHidden="1" />
										<div id="back" class="black_overlay" /></div>
										<!-- addFCWTpop begin -->
										<div class="dialog dialog-s1" id="addFCWTpop"
											style="display:none;z-index:1030;margin-left:0px;left:214px;top:89px;width:391px;height:240px;">
											<div class="dialog-hd">
												<h3 class="tit">
													<dict:lang value="班别信息" />
												</h3>
											</div>
											<a class="dialog-close" href="javascript:void(0);"
												onclick="hideDiv('addFCWTpop','addFCWTshadow');"></a>
											<div class="dialog-bd-div" style="width:100%;height:240px;">
												<div class="optn optn_div">
													<button type="button"
														onclick="addWorkTime('addFCWTpop','addFCWTshadow');">
														<i class="ico ico-save"></i>
														<dict:lang value="保存" />
													</button>
													<button type="button" onclick="hideDiv('addFCWTpop','addFCWTshadow');">
														<i class="ico ico-cancel"></i>
														<dict:lang value="取消" />
													</button>
												</div>
												<table class="basic-table" style="margin-top: 5px;background-color: white;">
													<tr>
														<td style="width: 106px;text-align: right;"><dict:lang
																value="班别" /></td>
														<td class="dec"><dict:selectDict id="calwGroup"
																name="calwGroup" dictCode="CALW_GROUP" dictValue=""
																style="width:157px;"
																custom_option="<option value=''>--请选择--</option>"
																cssClass="dept_select" /> <!-- <input type="text" name="calwGroup" id="calwGroup" maxlength="20"/> -->
															<br /> <span class="Eng"><span id="calwGroup_err"></span>
														</span></td>
													</tr>
													<tr>
														<td style="width: 106px;text-align: right;"><dict:lang
																value="时段" /></td>
														<td class="dec"><dict:selectDict id="calwTime"
																name="calwTime" dictCode="CALW_TIME" dictValue=""
																style="width:157px;"
																custom_option="<option value=''>--请选择--</option>"
																cssClass="dept_select" /> <!-- <input type="text" name="calwTime" id="calwTime" maxlength="20"/> -->
															<br /> <span class="Eng"><span id="calwTime_err"></span>
														</span></td>
													</tr>
													<tr>
														<td style="width: 106px;text-align: right;"><dict:lang
																value="加班标识" /></td>
														<td class="dec"><input type="checkbox"
															id="calwOverFalg" name="calwOverFalg" value="0" /> <span
															style="margin-left: 102px;"> <dict:lang
																	value="跨天标识" /> <input type="checkbox"
																id="calwInterDay" name="calwInterDay" value="0" /> </span>
														</td>
													</tr>
													<tr>
														<td style="width: 106px;text-align: right;"><dict:lang
																value="开始时间" /></td>
														<td class="dec"><input class="input" type="text"
															name="calwStartH" id="calwStartH" maxlength="2"
															style="width: 104px"
															onkeyup="value=value.replace(/[^\d]/g,'')" />&nbsp;&nbsp;:&nbsp;&nbsp;<input
															class="input" type="text" name="calwStartM"
															id="calwStartM" maxlength="2" style="width: 104px"
															onkeyup="value=value.replace(/[^\d]/g,'')" /> <br /> <span
															class="Eng"><span id="calwStart_err"></span> </span></td>
													</tr>
													<tr>
														<td style="width: 106px;text-align: right;"><dict:lang
																value="结束时间" /></td>
														<td class="dec"><input class="input" type="text"
															name="calwEndH" id="calwEndH" maxlength="2"
															style="width: 104px"
															onkeyup="value=value.replace(/[^\d]/g,'')" />&nbsp;&nbsp;:&nbsp;&nbsp;<input
															class="input" type="text" name="calwEndM" id="calwEndM"
															maxlength="2" style="width: 104px"
															onkeyup="value=value.replace(/[^\d]/g,'')" /></td>
													</tr>
													<%-- <tr>
														<td width="60%"colspan="2"><span style="margin-left: 145px;"><dict:lang
																value="时间范围：00：00--23：59" /></span></td>
													</tr> --%>
												</table>
											</div>
										</div>
										<div class="dialog-mask" id="addFCWTshadow" style="z-index:1029"></div>
										<!-- addFCWTpop end -->

											<div style="margin-top:1px;">
												<div style="width:55%;float: left;">
													<div class="mod-hd"
														style="border: none;height: auto;margin: 5px 0;">
														<h3 class="tit"
															style="border-bottom: none;line-height:21px;">
															<dict:lang value="工作时间" />
														</h3>
														<div class="extend-btn" style="float: right;">
															<button type="button"
																onclick="popWorkDiv('addFCWTpop','addFCWTshadow');"
																style="padding:0;" title="新增">
																<i class="ico ico-kl-new-add ico-small"></i>
															</button>
															<button type="button" onclick="delRow();"
																style="padding:0" title="删除">
																<i class="ico ico-sc-new-add ico-small"></i>
															</button>
														</div>
													</div>
													<form id="worktimeForm" name="worktimeForm"
														action="${path}buss/bussModel.ms" method="post">
														<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
			<div class="panel-ajax1 datagrid datagrid-div1" style="margin-top:10px;"><!--143-->
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
							<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head1"  id="">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
								<tr class="datagrid-header-row thcolor">
								<td align="center" style="width:150px;"><dict:lang
													value="班别" /></td>
								<td align="center" style="width:150px;"><dict:lang
													value="时段" /></td>
								<td align="center" style="width:218px;"><dict:lang
													value="开始时间" /></td>
								<td align="center" style="width:218px;"><dict:lang
													value="结束时间" /></td>
								<td align="center" style="width:218px;"><dict:lang
													value="跨天标识" /></td>
								<td align="center" style="width:218px;"><dict:lang
													value="加班标识" /></td>
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll1" style="height:200px;"><!--130-->
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="addworkTime" >
								</tbody>
							</table>
						</div>
						
					</div>
				</div>
									
													</form>
												</div>
												<div style="width:40%;float: right; position: absolute;right: 20px;">
													<div class="mod-hd"
														style="border: none;height: auto;margin: 5px 0;">
														<h3 class="tit"
															style="border-bottom: none;line-height:21px;">
															<dict:lang value="休息时间" />
														</h3>
														<div class="extend-btn" style="float: right;">
															<button type="button"
																onclick="popRestDiv('addFCRTpop','addFCWTshadow');"
																style="padding:0;" title="新增">
																<i class="ico ico-kl-new-add ico-small"></i>
															</button>
															<button type="button" onclick="delRestRow();"
																style="padding:0;" title="删除">
																<i class="ico ico-sc-new-add ico-small"></i>
															</button>
														</div>
													</div>
													<form id="resttimeForm" name="resttimeForm"
														action="${path}buss/bussModel.ms" method="post">
																	<div class="panel-ajax1 datagrid datagrid-div1" style="margin-top:10px;"><!--143-->
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
							<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head2"  id="">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a5678">
									<tbody>
								<tr class="datagrid-header-row thcolor">
								<td class="datagrid-cell" style="text-align: center;width:70px;" class="aaa"><dict:lang
															value="班别" /></td>
								<td class="datagrid-cell" style="text-align: center;width:70px;"><dict:lang value="时段" /></td >
								<td class="datagrid-cell" style="text-align: center;width:437px;"><dict:lang
															value="开始时间" /></td>
								<td class="datagrid-cell" style="text-align: center;width:437px;"><dict:lang
															value="结束时间" /></td>
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll2" style="height:200px;"><!--130-->
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678" >
								<tbody id="addRestTime" >
								</tbody>
							</table>
						</div>
						
					</div>
				</div>
														<br />
													</form>
												</div>
											</div>


											<div>
												<bu:funcsi viewId="7c413e16ba004221b215aaf7e0ad6cd7"
													funcId="40dc55c074cf4093926c8adc4d236ec7" isHidden="1" />

											<div class="dialog dialog-s1" id="addFCRTpop" style="display:none;z-index:1030;margin-left:0px;left:214px;top:89px;width:391px;height:207px;" >
											 <div class="dialog-hd">
												 <h3 class="tit"><dict:lang value="休息时间"/></h3>
											 </div>	
											 <a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addFCRTpop','addFCWTshadow');"></a>
											  <div class="dialog-bd-div" style="width:100%;height:207px;">
													<div class="optn optn_div">
														<button type="button"
															onclick="addRestTime('addFCRTpop','addFCWTshadow');">
															<i class="ico ico-save"></i>
															<dict:lang value="保存" />
														</button>
														<button type="button"
															onclick="hideDivr('addFCRTpop','addFCWTshadow');">
															<i class="ico ico-cancel"></i>
															<dict:lang value="取消" />
														</button>
													</div>
													<table class="basic-table" style="margin-top:5px; background-color: white;">
														<tr>
															<td style="width: 106px;text-align: right;"><dict:lang
																	value="班 别" /></td>
															<td class="dec"><input class="input"
																style="width: 230px;" type="text" name="calrGroup"
																id="calrGroup" disabled="disabled" /></td>
														</tr>
														<tr>
															<td style="width: 106px;text-align: right;"><dict:lang
																	value="时段" /></td>
															<td class="dec"><input class="input"
																style="width: 230px;" type="text" name="calrTime"
																id="calrTime" disabled="disabled" /></td>
														</tr>
														<tr>
															<td style="width: 106px;text-align: right;"><dict:lang
																	value="开始时间" /></td>
															<td class="dec"><input class="input" type="text"
																name="calrStartH" id="calrStartH" maxlength="2"
																style="width: 104px"
																onkeyup="value=value.replace(/[^\d]/g,'')" />&nbsp;&nbsp;:&nbsp;&nbsp;<input
																class="input" type="text" name="calrStartM"
																id="calrStartM" maxlength="2" style="width: 104px"
																onkeyup="value=value.replace(/[^\d]/g,'')" /> <br /> <span
																class="Eng"><span id="calrStart_err"></span> </span></td>
														</tr>
														<tr>
															<td style="width: 106px;text-align: right;"><dict:lang
																	value="结束时间" /></td>
															<td class="dec"><input class="input" type="text"
																name="calrEndH" id="calrEndH" maxlength="2"
																style="width: 104px"
																onkeyup="value=value.replace(/[^\d]/g,'')" />&nbsp;&nbsp;:&nbsp;&nbsp;<input
																class="input" type="text" name="calrEndM" id="calrEndM"
																maxlength="2" style="width: 104px"
																onkeyup="value=value.replace(/[^\d]/g,'')" /></td>
														</tr>
														<%-- <tr>
															<td colspan="2"><span style="margin-left: 145px;"><dict:lang
																	value="时间范围：00：00--23：59" /></span></td>
														</tr> --%>
													</table>
												</div>
												</div>
												<!-- addFCRTpop end -->
											</div>

											
											
											<div>
												<br />
											</div>


										</DIV>
									</DIV>
							</DIV>
						</DIV>
					</DIV>

					<DIV id="content2" style="display:none">
						<div data-tab="tag2">
							<bu:funcsi viewId="7c413e16ba004221b215aaf7e0ad6cd7"
								funcId="40dc55c074cf4093926c8adc4d236ec7" isHidden="1" />
						</div>		
						<div class="dialog-mask" id="addAreashadow" style="z-index:1029"></div>	
							

							<div class="mod-hd"
								style="margin-top:1px;border:none;height:21px;">
								<div class="extend-btn" style="float: right;margin: 5px 0;">
									<button type="button" onclick="getArea('addAreapop','addAreashadow');"
										style="padding:0;" title="新增">
										<i class="ico ico-kl-new-add ico-small"></i>
									</button>
									<button type="button" onclick="delAreaRow();"
										style="padding:0;" title="删除">
										<i class="ico ico-sc-new-add ico-small"></i>
									</button>
								</div>
							</div>
			<div class="panel-ajax1 datagrid datagrid-div1" style="margin-top:10px;"><!--143-->
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
							<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head3"  id="">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a9999">
									<tbody>
								<tr class="datagrid-header-row thcolor">
								<td class="datagrid-cell" style="text-align: center;width: 30px;">
								</td>
								<td class="datagrid-cell" style="width: 30px;text-align: center;box-sizing: border-box;">
									<input type="checkbox" id="all_addArealist" onchange="getAllArea();" style="margin:0;" />
								</td >
								<td class="datagrid-cell" style="width: 437px;"><dict:lang value="线别编号" />
								</td>
								<td class="datagrid-cell" style="width:437px;"><dict:lang value="线别名称" />
								</td>
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll3" style="height:200px;"><!--130-->
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a9999" >
								<tbody id="addArealist" >
								</tbody>
							</table>
						</div>
						
					</div>
				</div>
							
						</div>
				</form>
			</DIV>
		</DIV>
	</div>
	
	<div class="dialog dialog-s1" id="addAreapop" style="display:none;z-index:1030;margin-left:0px;left:60px;top:30px;width:804px;height:350px;" >
							 <div class="dialog-hd">
								 <h3 class="tit"><dict:lang value="线别设置"/></h3>
							 </div>	
							 <a class="dialog-close" href="javascript:void(0);" onclick="hideDivrs('addAreapop','addAreashadow');"></a>
							  <div class="dialog-bd-div" style="width:100%;height:350px;">
								<div class="optn optn_div">
									<button type="button" onclick="addArea('addAreapop','addAreashadow');">
										<i class="ico ico-save"></i>
										<dict:lang value="保存" />
									</button>
									<button type="button" onclick="hideDivrs('addAreapop','addAreashadow');">
										<i class="ico ico-cancel"></i>
										<dict:lang value="取消" />
									</button>
									<button type="button" onclick="searchArea('formId1');">
										<i class="ico ico-search-new"></i>
										<dict:lang value="查询" />
									</button>
								</div>
								<div style="background-color: white;margin-top: 10px;">
									<table>
										<tr>
											<td style="width: 106px;text-align: right;padding-right: 5px;"><dict:lang
													value="所属车间" />
											</td>
											<td style="width: 162px;text-align: left;" id="_select"><select
												id="searchArea" name="searchArea"
												class=" input isSubmit dept_select" style="width: 157px;">
													<option >--请选择--</option>
											</select>
											</td>
											<td style="width: 106px;text-align: right;padding-right: 5px;"><dict:lang
													value="线别代码" />
											</td>
											<td style="width: 162px;text-align: left;"><input
												type="text" id="areaId" class="input"  style="width:157px;"/>
											</td>
											<td style="width: 106px;text-align: right;padding-right: 5px;"><dict:lang
													value="线别名称" />
											</td>
											<td style="width: 162px;text-align: left;"><input
												type="text" id="areaName"  class="input" style="width:157px;"/>
											</td><!-- 
											<td style="width: 10%;"></td> -->
										</tr>
									</table>
								</div>
			<div class="panel-ajax1 datagrid datagrid-div1" style="margin-top:10px;"><!--143-->
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
							<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head4"  id="datagrid-header-inner4">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a0000">
									<tbody>
								<tr class="datagrid-header-row thcolor">
								<td style="width: 30px;text-align: center;">&nbsp;</td>
								<td style="width: 30px;text-align: center;box-sizing: border-box;">
									<input type="checkbox" id="all_areaTbody" onchange="getAllArea_s();" style="margin:0;" />
								</td >
								<td style="width: 290px;text-align: center;"><dict:lang
										value="线别代码" />
								</td>
								<td style="width: 290px;text-align: center;"><dict:lang
										value="线别名称" />
								</td>
								<td style="width: 290px;text-align: center;"><dict:lang
										value="所属车间" />
								</td>
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll4" style="height:200px;"><!--130-->
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a0000" >
								<tbody id="areaTbody" >
								</tbody>
							</table>
						</div>
						
					</div>
				</div>
				            <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>

								<div style="background-color: white;">
									<s:include value="/plf/page/fp/paginationPopAx.jsp?listDataFn=searchArea&formId=formId1&showLoading=0" />
								</div>
								
							</div>
								</div>
	<bu:submit viewId="7c413e16ba004221b215aaf7e0ad6cd7" />
	<bu:script viewId="7c413e16ba004221b215aaf7e0ad6cd7" />
	<script>(function($){
        $(window).on('load',function(){
        setPopScroll('.scroll1','.head1');
        setPopScroll('.scroll2','.head2');
        setPopScroll('.scroll3','.head3');
        setPopScroll('.scroll4','.head4');
            newScroll('scroll');							
        })
    })(jQuery)</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
