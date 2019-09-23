<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title><dict:lang value="修改工厂日历" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<script src="${path}plf/js/ui/textform/js/jquery.validate.js"></script>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<script>
		
		$(function(){
			$('.dialog-bd',parent.document).css('background-color','#fff');
			
			
		})
		
		//window.scripts = scripts;
		
		function init(){
		$("#tag1").addClass("current");
		var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
		_toClickColor(tableTrJs);
		_tongLineColor(tableTrJs);
		var tableTrJss = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678 tbody tr");
		_toClickColor(tableTrJss);
		_tongLineColor(tableTrJss);	
		var tableTrJss_s = $("#areaTbody_s tbody tr");
		_toClickColor(tableTrJss_s);
		_tongLineColor(tableTrJss_s);	
	}
	</script>
	<style type="text/css">
		.x-fieldset{border:1px solid #B5B8C8;padding:10px;margin-botton:10px;display:block;}
	</style>
	<script language="javascript">
	
	    function wGroup(valwGroup,rStart,rEnd,rowId,valwTime,workId,cid){

			rGroupStr = valwGroup;
			rTimeStr = valwTime;
			rStartStr = rStart;
			rEndStr = rEnd;
			rowIdStr  = rowId;
            rowWorkIdStr= workId;
			calwInterDay = cid;
		//	document.getElementById("calrGroup").value=valwGroup;
		//	document.getElementById("calrTime").value=valwTime;
			$.ajax({
				type: "POST",
			    dataType: "json",
                            url: "${path}buss/bussModel_exeFunc.ms?funcMId=2d302611892c4bde84dfdb3ed361118d",
			     data: "paraMap.workId="+workId,
				success: function(data){
						if(null == data){return ;}
						if(null != data.ajaxList){
                                                  if(data.ajaxList.length == 0){
                                                     $("#ajaxRest").empty();
                                                   }else{
							$("#ajaxRest").empty();
							for(var i = 0;i < data.ajaxList.length; i++){
							$("#ajaxRest").append("<tr align='center'id='"+data.ajaxList[i].ID+"' onclick=\"rGroup('"+data.ajaxList[i].ID+"');\"></tr>");
							$("#ajaxRest tr:last").append("<td align='center' style='width:70px;'>"+valwGroup+"</td>");
							$("#ajaxRest tr:last").append("<td align='center' style='width:70px;'>"+rTimeStr+"</td>");
                                                        $("#ajaxRest tr:last").append("<td align='center' style='width:437px;'>"+data.ajaxList[i].CALR_START+"</td>");
							$("#ajaxRest tr:last").append("<td align='center' style='width:437px;'>"+data.ajaxList[i].CALR_END+"</td>");
							
                                                        }
                                                      }
						}
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr").css("background-color","");
	                init();
	                $("[id='"+valwGroup+"'][shiduan='"+valwTime+"']").css("background-color","#a0c8e5");
                   // checkboxAll("ajaxRest");
					},
				error: function(msg){
     				       if(msg.readyState!=0){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
                                       }
				  }
				});
		}
		
		function getDelAreaId(){
			var area_s = [];
			$("#addArealist :checkbox").each(function(){
				if ($(this).attr("checked")) {
					area_s.push({
					areaId: $(this).attr("id")
					});
				}	 
				});
			return JSON.stringify(area_s);
		}
		
		function getAddAreaId(){
			var area_s = [];
			$("#addArealist :checkbox").each(function(){
					area_s.push({
					areaId: $(this).attr("id")
					});
				});
			return JSON.stringify(area_s);
		}
			
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
				$("#"+trId).css("background-color","#a0c8e5");
			}
		});
		
		  $("#"+tableId+" tr input[type=checkbox]").click(function(e) {
			  e.stopPropagation();
			  var style = $(this).parents("tr").attr("style");
			  if(style && style.indexOf("background-color") > -1){
				  $(this).parents("tr").css("background-color","");
			  }else{
				  $(this).parents("tr").css("background-color","#a0c8e5");
			  }
		  });
		}
		
//线别列表全选
function getAllArea(){
		if($("#all_addArealist").attr("checked")=="checked"){
			$("#addArealist :checkbox").attr("checked",true);
			$("#addArealist :checkbox").parents("tr").css("background-color","#a0c8e5");
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
			$("#areaTbody :checkbox").parents("tr").css("background-color","#a0c8e5");
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
			newScroll("areatb_div");
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
			var valrTime = "";
            var calrStart = "";
            var calrEnd = "";
			for ( var i = 2; i < count1; i++) {
				valwGroup = valwGroup+"&"+table1.rows[i].cells[0].innerHTML;
				calwStart = calwStart+"&"+table1.rows[i].cells[1].innerHTML;
				calwEnd = calwEnd+"&"+table1.rows[i].cells[2].innerHTML;
				calwOverFalg = calwOverFalg+"&"+table1.rows[i].cells[4].innerHTML;
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
	}
	
		function popWorkDiv(showId,backId){
			$("#"+showId+",#"+backId).show();
			$("#"+showId).draggable();
			$('.chosen-container').css("width","230px");
		}
		function popRestDiv(showId,backId){
			if(rGroupStr == ""){
				//utilsFp.alert("请选择一条工作时间");
				utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择一条工作时间" />",0,"","");
				return ;
			}
			popWorkDiv(showId,backId);
		}
		var TrId = 0;
		function getTrId(trId){
			TrId = trId;
		}
		var areaCount = 0;
		 function addArea_edit(showId,backId){
		 var lens = $("#addArealist tr").length;
		 var falg = false;
			 $("#areaTbody :checkbox").each(function(){
					if($(this).attr("checked")){
						if (!$("#tr_"+$(this).attr("id")).length) {
									$("#addCalForm").append("<input type='hidden' id='areaID"+areaCount+"' name='areaID"+areaCount+"' value='"+$(this).attr("id")+"'>");
		  							$("#addArealist").append("<tr id='tr_"+$(this).attr("id")+"'></tr>");
									$("#addArealist tr:last").append("<td style='width: 30px;text-align: center;'></td>");
									$("#addArealist tr:last").append("<td style='width: 30px;text-align: center;box-sizing: border-box;'><input type='checkbox' id='"+$(this).attr("id")+"' style='margin:0;'/></td>");
									$("#addArealist tr:last").append("<td style='width: 437px;text-align: center;'>"+$(this).attr("id")+"</td>");
									$("#addArealist tr:last").append("<td style='width: 437px;text-align: center;'>"+$(this).attr("name")+"</td>");
			  						areaCount++;
						}
					}
				});
				
				addArea();
			
			var len = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a9999 tr").length;
			for(var i=1;i<len;i++){
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a9999 tr:eq("+i+") td:first").text(i);
			}
			$("#tag1").removeClass();
			$("#areaTbody").empty();
			$("#all_areaTbody").attr("checked",false);
			document.getElementById(showId).style.display = 'none';
			document.getElementById(backId).style.display = 'none';
			
		} 
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
			$("#"+showId+",#"+backId).hide();
			document.getElementById("calwGroup").value="";
			document.getElementById("calwTime").value="";
			document.getElementById("calwStartH").value="";
			document.getElementById("calwStartM").value="";
			document.getElementById("calwEndH").value="";
			document.getElementById("calwEndM").value="";
			document.getElementById("calwTime").value="";
		}
		function hideDivr(showId,backId){
			document.getElementById("calrStart_err").innerHTML = "";
			$("#"+showId+",#"+backId).hide();
			document.getElementById("calrStartH").value="";
			document.getElementById("calrStartM").value="";
			document.getElementById("calrEndH").value="";
			document.getElementById("calrEndM").value="";
			//rGroupStr = "";
		}
		function hideDivrs(showId,backId){
			$("#tag1").removeClass();
			$("#areaTbody").empty();
			$("#"+showId+",#"+backId).hide();
			$("#areaId").val("");
			$("#areaName").val("");
			$("#areaName").val("");
	        $("#searchArea").trigger("chosen:updated");
		}
		var rGroupStr = "";
		var rStartHStr = "";
		var rStartMStr = "";
		var rEndHStr = "";
		var rEndMStr = "";
		var rowIdStr = "";
		var rowWorkIdStr = "";
		var rowRestIdStr = "";
		var calwInterDay = "";
		var rTimeStr = "";
		var rStartStr = "";
		var rEndStr = "";
		function rGroup(rowRestId){
			rowRestIdStr  = rowRestId;
		}
		function addWTtoTr(){
		 $.ajax({
			    type: "POST",
			    dataType: "json",
			    url: "@{funcUrl}&funcMId=cc906ae56c3c4790999123a2370deb8f",
			    data: "paraMap.dataId="+$("#calId").val()+"&paraMap.calwGroup="+$("#calwGroup").val()+"&paraMap.calwOverFalg="+$("#calwOverFalg").val()+"&paraMap.calwStartH="+$("#calwStartH").val()+"&paraMap.calwStartM="+$("#calwStartM").val()+"&paraMap.calwEndH="+$("#calwEndH").val()+"&paraMap.calwEndM="+$("#calwEndM").val(),
				success: function(data){
					},
				error: function(msg){
     				if(msg.readyState!=0){
						util.closeLoading();
						//utilsFp.alert("error:"+msg);
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");}
				  }
				  
				});
				console.log("ss:"+$("#calwGroup").val())
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr align='center' onclick=\"wGroup('"+$("#calwGroup").val()+"','"+$("#calwStartH").val()+"','"+$("#calwStartM").val()+"','"+$("#calwEndH").val()+"','"+$("#calwEndM").val()+"','','"+$("#calwInterDay").val()+"');\"></tr>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td align='center' style='width:127px;' name='calwGroup'>"+$("#calwGroup").val()+"</td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td align='center' style='width:127px;' name='calwTime'>"+$("#calwTime").val()+"</td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td align='center' style='width:142px;' name='calwStart'>"+$("#calwStartH").val()+":"+$("#calwStartM").val()+"</td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td align='center' style='width:142px;' name='calwEnd'>"+$("#calwEndH").val()+":"+$("#calwEndM").val()+"</td>");
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td align='center' style='width:52px;' name=''></td>");
			if($("#calwOverFalg").val()=="Y"){
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td align='center' style='width:142px;' name='calwOverFalg'><dict:lang value="是" /></td>");
				}else{
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td align='center' style='width:142px;' name='calwOverFalg'><dict:lang value="否" /></td>");
				}
			init();
			document.getElementById("calwGroup").value="";
			document.getElementById("calwStartH").value="";
			document.getElementById("calwStartM").value="";
			document.getElementById("calwEndH").value="";
			document.getElementById("calwEndM").value="";
			document.getElementById("calwTime").value="";
		}
    
    function closeValMsg(objthis){
    	document.getElementById(objthis).innerHTML = "";
    }
		function checkWData(){
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
			
			var calwGroup = document.getElementById("calwGroup");
			if($("#calwGroup").val() == null || $("#calwGroup").val() ==""){
   				_alertValMsg(calwGroup,"<dict:lang value="班别名称不能为空" />");
       			return false;
  			} 
			var calwTime = document.getElementById("calwTime");
			if($("#calwTime").val() == null || $("#calwTime").val() ==""){
   				_alertValMsg(calwTime,"<dict:lang value="班别时段不能为空" />");
       			return false;
  			}  
			var calwStart = document.getElementById("calwStartH");
			if (parseInt($("#calwStartH").val())<0 || parseInt($("#calwStartH").val())>23 
					|| parseInt($("#calwStartM").val())<0 || parseInt($("#calwStartM").val())>60
					|| parseInt($("#calwEndH").val())<0 || parseInt($("#calwEndH").val())>23
					|| parseInt($("#calwEndM").val())<0 || parseInt($("#calwEndM").val())>60) {
   				_alertValMsg(calwStart,"<dict:lang value="请输入正确的时间" />");
       				return false;
			}
			if ($("#calwInterDay").val()!="Y") {
			if (parseInt($("#calwStartH").val())>parseInt($("#calwEndH").val())) {
   				_alertValMsg(calwStart,"<dict:lang value="开始时间不能晚于结束时间" />");
       				return false;
			}else if (parseInt($("#calwStartH").val())==parseInt($("#calwEndH").val())) {
				if (parseInt($("#calwStartM").val())>=parseInt($("#calwEndM").val())) {
   						_alertValMsg(calwStart,"<dict:lang value="开始时间不能晚于或等于结束时间" />");
       					return false;
				}
			}
			}else{
				if (parseInt($("#calwStartH").val())>parseInt("12")) {
					if (parseInt($("#calwStartM").val())>parseInt("12")) {
   						_alertValMsg(calwStart,"<dict:lang value="请输入跨天时间" />");
       					return false;
					}
				}else{
   					_alertValMsg(calwStart,"<dict:lang value="请输入跨天时间" />");
       				return false;
				}
			}
			var tableWork = document.getElementById("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
			var count = tableWork.rows.length;
			var calwStart,calwStarts,calwEnd,calwEnds;
			var interDay = 0;
			if (count>1) {
				/* for ( var i = 2; i < count; i++) {
				if ($("#calwGroup").val() == tableWork.rows[i].cells[0].innerHTML) {
       					document.getElementById("calwGroup_err").innerHTML = "<dict:lang value="班别名称已存在" />";
       					return false;
				} */
				for ( var i = 0; i < count; i++) {
				if (tableWork.rows[i].cells[4].innerHTML == "是") {
					interDay ++;
				}
				var calwGroup = document.getElementById("calwGroup");
				if ($("#calwGroup").val() == tableWork.rows[i].cells[0].innerHTML) {
						if ($("#calwTime").val() == tableWork.rows[i].cells[1].innerHTML) {
   							_alertValMsg(calwGroup,"<dict:lang value="同班别下已存在该时段" />");
       						return false;
						}
				}
				calwStart = tableWork.rows[i].cells[2].innerHTML;
				calwEnd = tableWork.rows[i].cells[3].innerHTML;
				calwStarts = new Array();
				calwEnds= new Array();
				calwStarts = calwStart.split(":");
				calwEnds= calwEnd.split(":");
				if (parseInt($("#calwStartH").val())>parseInt(calwStarts[0])) {
						if (parseInt($("#calwStartH").val())<parseInt(calwEnds[0])) {
   							_alertValMsg(calwStart,"<dict:lang value="时间不能交叉" />");
       							return false;
						}	
				}
				if (parseInt($("#calwEndH").val())>parseInt(calwStarts[0])) {
					if (parseInt($("#calwEndH").val())<parseInt(calwEnds[0])) {
   							_alertValMsg(calwStart,"<dict:lang value="时间不能交叉" />");
       						return false;
					}
				}
				if(parseInt($("#calwStartH").val()) == parseInt(calwStarts[0])){
						if (parseInt($("#calwStartM").val())<parseInt(calwStarts[1])) {
   							_alertValMsg(calwStart,"<dict:lang value="时间不能交叉" />");
       							return false;
						}
				}
				if (parseInt($("#calwEndH").val())==parseInt(calwEnds[0])) {
					if (parseInt($("#calwEndM").val())<parseInt(calwEnds[1])) {
   							_alertValMsg(calwStart,"<dict:lang value="时间不能交叉" />");
       							return false;
						}
				}
			}
			if ($("#calwInterDay").val()=="Y" && interDay > 0) {
				//utilsFp.alert("<dict:lang value="已存在跨天工作时间" />");
				utilsFp.confirmIcon(3,"","","", "<dict:lang value="已存在跨天工作时间" />",0,"","");
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
		function checkRData(){
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
			var calrGroup = document.getElementById("calwGroup");
			if($("#calrGroup").val() == null || $("#calrGroup").val() ==""){
   				_alertValMsg(calrGroup,"<dict:lang value="班别名称不能为空" />");
       			return false;
  			}  
			var calrTime = document.getElementById("calrTime");
			if($("#calrTime").val() == null || $("#calrTime").val() ==""){
   				_alertValMsg(calrTime,"<dict:lang value="时段不能为空" />");
       			return false;
  			} 
			var calrStart = document.getElementById("calrStartH");
			if (parseInt($("#calrStartH").val())<0 || parseInt($("#calrStartH").val())>23 
					|| parseInt($("#calrStartM").val())<0 || parseInt($("#calrStartM").val())>60
					|| parseInt($("#calrEndH").val())<0 || parseInt($("#calrEndH").val())>23
					|| parseInt($("#calrEndM").val())<0 || parseInt($("#calrEndM").val())>60) {
   					_alertValMsg(calrStart,"<dict:lang value="请输入正确的时间" />");
       				return false;
			}
			if (calwInterDay != "Y") {
			if (parseInt($("#calrStartH").val())>parseInt($("#calrEndH").val())) {
   					_alertValMsg(calrStart,"<dict:lang value="开始时间不能晚于结束时间" />");
       				return false;
			}else if (parseInt($("#calrStartH").val())==parseInt($("#calrEndH").val())){
				if (parseInt($("#calrStartM").val())>=parseInt($("#calrEndM").val())) {
   					_alertValMsg(calrStart,"<dict:lang value="开始时间不能晚于或等于结束时间" />");
       				return false;
				}
			}
			}
			var calWStarts = new Array();
				var calWEnds = new Array();
				calWStarts = rStartStr.split(":");
				calWEnds = rEndStr.split(":");
				if (parseInt($("#calrStartH").val())<parseInt(calWStarts[0]) || parseInt($("#calrEndH").val())>parseInt(calWEnds[0])) {
   					_alertValMsg(calrStart,"<dict:lang value="休息时间不在工作时间内" />");
       				return false;
				}else if (parseInt($("#calrStartH").val())==parseInt(calWStarts[0]) || parseInt($("#calrEndH").val())==parseInt(calWEnds[0])){
						if(parseInt(calWStarts[1])!=0){
						if (parseInt($("#calrStartH").val())==parseInt(calWStarts[0])&&parseInt($("#calrStartM").val())<parseInt(calWStarts[1])) {
       							_alertValMsg(calrStart,"<dict:lang value="休息时间不在工作时间内" />");
       							return false;
						}}
						if(parseInt(calWEnds[1])!=0){
						if (parseInt($("#calrEndH").val())==parseInt(calWEnds[0])&&parseInt($("#calrEndM").val())>parseInt(calWEnds[1])) {
       							_alertValMsg(calrStart,"<dict:lang value="休息时间不在工作时间内" />");
       							return false;
						}}
				}
			var table2 = document.getElementById("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678");
			var count = table2 .rows.length;
			var calrStart,calrStarts,calrEnd,calrEnds;
			if (count>1) {
				for ( var i = 1; i < count; i++) {
				calrStart = table2.rows[i].cells[1].innerHTML;
				calrEnd = table2.rows[i].cells[2].innerHTML;
				calrStarts = new Array();
				calrEnds= new Array();
				calrStarts = calrStart.split(":");
				calrEnds= calrEnd.split(":");
				if (parseInt($("#calrEndH").val())>parseInt(calrStarts[0])) {
					if (parseInt($("#calrEndH").val())<parseInt(calrEnds[0])) {
       						_alertValMsg(calrStart,"<dict:lang value="时间不能交叉" />");
       						return false;
					}
				}
				if(parseInt($("#calrStartH").val()) == parseInt(calrStarts[0])){
						if (parseInt($("#calrStartM").val())<=parseInt(calrStarts[1])) {
       						_alertValMsg(calrStart,"<dict:lang value="时间不能交叉" />");
       						return false;
							}
				}
				if (parseInt($("#calrEndH").val())==parseInt(calrEnds[0])) {
					if (parseInt($("#calrEndM").val())<=parseInt(calrEnds[1])) {
       						_alertValMsg(calrStart,"<dict:lang value="时间不能交叉" />");
       						return false;
					}
				}
			}
			}
    			return true;
		}
		
	var len = 0;
		window.onload=function(){
			if ($("#calSatFlag").val()=="Y") {
					$("#calSatFlag").attr("checked",true);
				}else{
					$("#calSatFlag").attr("checked",false);
				}
			if ($("#calSunFlag").val()=="Y") {
					$("#calSunFlag").attr("checked",true);
				}else{
					$("#calSunFlag").attr("checked",false);
				}
			if ($("#calDefaultFlag").val()=="Y") {
					$("#calDefaultFlag").attr("checked",true);
				}else{
					$("#calDefaultFlag").attr("checked",false);
				}
		len = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a9999 tr").length;
			for(var i=1;i<len;i++){
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a9999 tr:eq("+i+") td:first").text(i);
			}
		checkboxAll("addArealist");
		newScroll("workTime_div");
		newScroll("restTime_div");
		
		
		};
		
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
		.black_overlay{
			display: none;
			position: absolute;
			top: 0%;
			left: 0%;
			width: 100%;
			height: 100%;
			background-color: #f8fcff;
			 
			z-index: 1001;
			opacity:0.5;
			filter:alpha(opacity=88);	
		}
		.white_content{
			display: none;
			position: absolute;
			top: 25%;
			left: 25%;
			width: 50%;
			height: 54%;
			padding: 10px;
			border: 2px solid #cbe9ff;
			background-color: #f8fcff;
			z-index: 1002;
			overflow: auto;
		}
		.white_contents{
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
		.mCSB_container{
			margin-right:0px !important;
		}
		.mCustomScrollBox>.mCSB_scrollTools{
			right:-5px;
		}
		.mCSB_inside{
			max-height:10000px !important;
		}
	</style>
</head>
<body scroll="no" style="overflow-x:hidden;overflow-y:hidden;height:800px;background-color: #fff;">
  <div class="mod">
	<div>
			<div  style="height: 400px;padding:0 20px;">
			<form id="addCalForm" name="addForm" action="${path}buss/bussModel.ms" method="post" <bu:formet exeid="%{exeid}" />
				target="submitFrame">
				<input type="hidden" name="exeid" value="${exeid}">
				<input type="hidden" name="calId" id="calId" value="${dataId}">
				<input type="hidden" name="wGroup" id="wGroup" value="">
				<input type="hidden" name="wStart" id="wStart" value="}">
				<input type="hidden" name="wEnd" id="wEnd" value="">
				<input type="hidden" name="wOverFalg" id="wOverFalg" value="">
				<input type="hidden" name="rGroup" id="rGroup" value="">
				<input type="hidden" name="rStart" id="rStart" value="}">
				<input type="hidden" name="rEnd" id="rEnd" value="">
				<input type="hidden" name="areaCount" id="areaCount" value="">
				<input type="hidden" name="iframeId" value="${iframeId}" />
				<input type="hidden" name="formId" value="53702b48b70f436ca1f2252894d37c09">
				<input type="hidden" name="formId" id="formId1" value='831b2dbf0dfb494695b7ce66538a9999'/>
		        <input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
		        <input type="hidden" name="formId" id="formId3" value='831b2dbf0dfb494695b7ce66538a5678'/>
				<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
				<s:set name="_$type" value="'detail'"/>
				<s:token />
				<table class="basic-table" style="margin-right: 20px;">
					
					<tr>
						<td class="name" style="width:93px;"><span class="dot">*</span><dict:lang value="日历名称" /></td>
						<td class="dec"><input class="input" type="text" name="calName" id="calName" maxlength="100" value="${dataMap["CAL_NAME"]}" disabled="disabled"/></td>
										<span class="Eng"><span id="calName_err"></span></span></td>
										
						<td class="name"><dict:lang value="周六上班" /></td>
						<td class="dec"  style="width:260px;">
					        	<input type="checkbox" id="calSatFlag" name="calSatFlag" value="${dataMap["CAL_SAT_FLAG"]}" maxlength="2" disabled="disabled">
					        	&#x3000;
					        	<dict:lang value="周天上班" />
					        	<input type="checkbox" id="calSunFlag" name="calSunFlag" value="${dataMap["CAL_SUN_FLAG"]}" maxlength="2" disabled="disabled">
					        	&#x3000;
					        	<dict:lang value="默认标识" />
					        	<input type="checkbox" id="calDefaultFlag" name="calDefaultFlag" value="${dataMap["CAL_DEFAULT_FLAG"]}" maxlength="2" disabled="disabled">
					        	
					        </td>
						
													
						
					</tr>
					<tr>
						<td class="name"><dict:lang value="开始月份" /></td>
						<td class="dec"><select id="calStartMonth" name="calStartMonth"  class="dept_select" style="width:230px;" disabled="disabled">
					          <option value="1" ${dataMap["CAL_START_MONTH"] == 1?"selected='selected'" : ""}>1</option>
					          <option value="2" ${dataMap["CAL_START_MONTH"] == 2?"selected='selected'" : ""}>2</option>
					          <option value="3" ${dataMap["CAL_START_MONTH"] == 3?"selected='selected'" :""}>3</option>
					          <option value="4" ${dataMap["CAL_START_MONTH"] == 4?"selected='selected'" : ""}>4</option>
					          <option value="5" ${dataMap["CAL_START_MONTH"] == 5?"selected='selected'" : ""}>5</option>
					          <option value="6" ${dataMap["CAL_START_MONTH"] == 6?"selected='selected'" : ""}>6</option>
					          <option value="7" ${dataMap["CAL_START_MONTH"] == 7?"selected='selected'" :  ""}>7</option>
					          <option value="8" ${dataMap["CAL_START_MONTH"] == 8?"selected='selected'" : ""}>8</option>
					          <option value="9" ${dataMap["CAL_START_MONTH"] == 9?"selected='selected'" : ""}>9</option>
					          <option value="10" ${dataMap["CAL_START_MONTH"] == 10?"selected='selected'" : ""}>10</option>
					          <option value="11" ${dataMap["CAL_START_MONTH"] == 11?"selected='selected'" : ""}>11</option>
					          <option value="12" ${dataMap["CAL_START_MONTH"] == 12?"selected='selected'" : ""}>12</option>
					        </select>
						<span class="Eng"><span id="calStartMonth_err"></span></span></td>
						<td class="name"><dict:lang value="结束月份" /></td>
						<td class="dec"><select id="calEndMonth" name="calEndMonth"  class="dept_select"  style="width:230px;" disabled="disabled">
					          <option value="1" ${dataMap["CAL_END_MONTH"] == 1?"selected='selected'" : ""}>1</option>
					          <option value="2" ${dataMap["CAL_END_MONTH"] == 2?"selected='selected'" : ""}>2</option>
					          <option value="3" ${dataMap["CAL_END_MONTH"] == 3?"selected='selected'" :""}>3</option>
					          <option value="4" ${dataMap["CAL_END_MONTH"] == 4?"selected='selected'" : ""}>4</option>
					          <option value="5" ${dataMap["CAL_END_MONTH"] == 5?"selected='selected'" : ""}>5</option>
					          <option value="6" ${dataMap["CAL_END_MONTH"] == 6?"selected='selected'" : ""}>6</option>
					          <option value="7" ${dataMap["CAL_END_MONTH"] == 7?"selected='selected'" :  ""}>7</option>
					          <option value="8" ${dataMap["CAL_END_MONTH"] == 8?"selected='selected'" : ""}>8</option>
					          <option value="9" ${dataMap["CAL_END_MONTH"] == 9?"selected='selected'" : ""}>9</option>
					          <option value="10" ${dataMap["CAL_END_MONTH"] == 10?"selected='selected'" : ""}>10</option>
					          <option value="11" ${dataMap["CAL_END_MONTH"] == 11?"selected='selected'" : ""}>11</option>
					          <option value="12" ${dataMap["CAL_END_MONTH"] == 12?"selected='selected'" : ""}>12</option>
					        </select></td>
					</tr>
						<tr>
							<td class="name"><dict:lang value="周起始" /></td>
							<td class="dec">
								<dict:selectDict id="calWeekBegin" name="calWeekBegin" dictCode="WEEK_BEGIN" dictValue="%{dataMap['CAL_WEEK_BEGIN']}" style="cursor: pointer;width:230px;" cssClass="dept_select"  disabled="disabled"/>
							</td>
						</tr>
				</table>
<div class="js-tab">
<DIV id="container">
	<DIV id="hd">
		<UL class="tab-list tab" >
			<LI id="tag1">
 				<A class="selectli1" onclick="switchTag('tag1','content1','${path}buss/bussModel.ms?exeid=e8381c90ac7143a3b1ec4ac8ac8e91d2');this.blur();" href="javascript:void(0);"> <SPAN class="selectspan1"><dict:lang value="班别信息" /></SPAN> </A>
			</LI>
			<LI id="tag2">
 				<A class="" onclick="switchTag('tag2','content2','${path}buss/bussModel.ms?exeid=f72a754bd2af4246a79dd94a1b271a8a');this.blur();" href="javascript:void(0);"> <SPAN ><dict:lang value="线别设置" /></SPAN> </A>
			</LI>
		</UL>
	</DIV>
	<DIV   id="content"  >
		<DIV id="content1">
			<div align="right">
			    <bu:funcsi viewId="241d19bcae644399a49ff9fe5c12f179" funcId="ed334aadf26347b78c1dcaa1b677691a" isHidden="1"/>
			</div>
			<div class="dialog-mask" id="addFCWTshadow" style="z-index:1029"></div>
			
			<div class="dialog dialog-s1" id="addFCWTpop"style="display:none;z-index:1030;margin-left:0px;left:214px;top:89px;width:391px;height:240px;">
				<div class="dialog-hd">
					<h3 class="tit">
						<dict:lang value="班别信息" />
						</h3>
					</div>
					<a class="dialog-close" href="javascript:void(0);"onclick="hideDiv('addFCWTpop','addFCWTshadow');"></a>
			    <div class="dialog-bd-div" style="width:100%;height:240px;">
				<div class="optn optn_div" >
			        	
			    	</div>
				<table class="basic-table" style="margin-top:5px;background-color: white;">
				
				
					<tr>
						<td style="width: 106px;text-align: right;"><dict:lang value="班 别" />&nbsp;&nbsp;</td>
						<td class="dec"><dict:selectDict id="calwGroup" name="calwGroup" dictCode="CALW_GROUP" style="width:157px;"
								 dictValue="" custom_option="<option value=''>--请选择--</option>"  cssClass="dept_select"/>
								<!-- <input type="text" name="calwGroup" id="calwGroup" maxlength="20"/> -->
										<br/><span class="Eng"><span id="calwGroup_err"></span></span></td>
					</tr>
					<tr>
						<td style="width: 106px;text-align: right;"><dict:lang value="时段" />&nbsp;&nbsp;</td>
						<td class="dec"><dict:selectDict id="calwTime" name="calwTime" dictCode="CALW_TIME" dictValue="" style="width:157px;"
								custom_option="<option value=''>--请选择--</option>"  cssClass="dept_select"/>
								<!-- <input type="text" name="calwTime" id="calwTime" maxlength="20"/> -->
										<br/><span class="Eng"><span id="calwTime_err"></span></span></td>
					</tr>
					<tr>
						<td style="width: 106px;text-align: right;"><dict:lang value="加班标识" /></td>
						<td class="dec"><input type="checkbox" id="calwOverFalg" name="calwOverFalg" value="N"/>
										<span style="margin-left: 102px;">
										<dict:lang value="跨天标识" />
										<input type="checkbox" id="calwInterDay" name="calwInterDay" value="N"/></span>
						</td>
					</tr>
					<tr>
						<td style="width: 106px;text-align: right;"><dict:lang value="开始时间" /></td>
						<td class="dec"><input class="input" type="text" name="calwStartH" id="calwStartH" maxlength="2" style="width: 104px" onkeyup="value=value.replace(/[^\d]/g,'')"/>&nbsp;&nbsp;:&nbsp;&nbsp;<input class="input" type="text" name="calwStartM" id="calwStartM" maxlength="2" style="width: 104px" onkeyup="value=value.replace(/[^\d]/g,'')"/>
										<br/><span class="Eng"><span id="calwStart_err"></span></span></td>
					</tr>
					<tr>
						<td style="width: 106px;text-align: right;"><dict:lang value="结束时间" /></td>
						<td class="dec"><input class="input" type="text" name="calwEndH" id="calwEndH" maxlength="2" style="width: 104px"  onkeyup="value=value.replace(/[^\d]/g,'')"/>&nbsp;&nbsp;:&nbsp;&nbsp;<input class="input" type="text" name="calwEndM" id="calwEndM" maxlength="2" style="width: 104px" onkeyup="value=value.replace(/[^\d]/g,'')"/></td>
					</tr>
					
				</table>
				</div>
			    </div>
<div style="margin-top:1px;">
<div style="width:55%;float: left;">
<div class="mod-hd" style="border: none;height: auto;margin: 5px 0;">		
  <h3 class="tit" style="border-bottom: none;line-height:21px;"><dict:lang value="工作时间" /></h3>
  	
</div>	
		<form id="worktimeForm" name="worktimeForm" action="${path}buss/bussModel.ms" method="post">
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
								<td align="center" style="width:200px;"><dict:lang
													value="开始时间" /></td>
								<td align="center" style="width:200px;"><dict:lang
													value="结束时间" /></td>
								<td style="text-align:center;width: 85px;"><dict:lang value="休息时长(m)" /></td >
								<td align="center" style="width:200px;"><dict:lang
													value="跨天标识" /></td>
								<td align="center" style="width:192px;"><dict:lang
													value="加班标识" /></td>
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll1" style="height:200px;"><!--130-->
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody>
		<c:forEach items="${dataList}" var="workls" >
			<tr align="left" id="${workls.CALW_GROUP}" onclick="wGroup('${workls.CALW_GROUP}','${workls.CALW_START}','${workls.CALW_END}','${workls.CALW_GROUP}','${workls.CALW_TIME}','${workls.ID}','${workls.CALW_INTER_DAY}')">
				<td style="text-align: center;width: 150px;">${workls.CALW_GROUP}</td>
				<td style="text-align: center;width: 150px;">${workls.CALW_TIME}</td>
				<td style="text-align: center;width: 200px;">${workls.CALW_START}</td>
				<td style="text-align: center;width: 200px;">${workls.CALW_END}</td>
			    <td style="text-align: center;width: 85px;">${workls.CALW_REST_TOTAL}</td>
				<td style="text-align: center;width: 200px;">${workls.CALW_INTER_DAY == "Y"?"是" : "否"}</td>
				<td style="text-align: center;width: 192px;">${workls.CALW_OVER_FALG == "Y"?"是" : "否"}</td>
			</tr>
		</c:forEach>
								</tbody>
							</table>
						</div>
						
					</div>
				</div>
			</form>
</div>
<div style="width:40%;float: right;position: absolute;right: 20px;">
<div class="mod-hd" style="border: none;height: auto;margin: 5px 0;">		
  <h3 class="tit" style="border-bottom: none;line-height:21px;"><dict:lang value="休息时间" /></h3>
  	
</div>	
<form id="resttimeForm" name="resttimeForm" action="${path}buss/bussModel.ms" method="post">
				<div class="panel-ajax1 datagrid datagrid-div1" style="margin-top:10px;"><!--143-->
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
							<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head2"  id="">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a5678">
									<tbody>
								<tr class="datagrid-header-row thcolor">
								<td class="datagrid-cell" style="text-align: center;width:70px;"><dict:lang
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
								<tbody id="ajaxRest" >
							   <c:forEach items="${dataList0}" var="restls" >
								<tr align="left"id="${restls.ID}" onclick="rGroup('${restls.ID}')">
									<td style="text-align: center;width:70px;">${restls.CALW_GROUP}</td>
									<td style="text-align: center;width:70px;">${restls.CALW_TIME}</td>
									<td style="text-align: center;width:437px;">${restls.CALR_START}</td>
									<td style="text-align: center;width:437px;">${restls.CALR_END}</td>
								</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
						
					</div>
				</div>
				<br/>
			</form> 
</div>
</div>

		
			<br />
			<div align="right" style="background-color: white;">
				<bu:funcsi viewId="241d19bcae644399a49ff9fe5c12f179" funcId="40dc55c074cf4093926c8adc4d236ec7" isHidden="1"/>
			</div>
			
  
 			
		</DIV>
		<DIV id="content2"  style="display:none;">
	 <div>
			<bu:funcsi viewId="7c413e16ba004221b215aaf7e0ad6cd7" funcId="40dc55c074cf4093926c8adc4d236ec7" isHidden="1"/>
	</div>
		
<div class="mod-hd"  style="margin-top:4px;height: 28px;border: none;">	
  
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
								<c:forEach items="${dataList1}" var="areals" varStatus="vs">
								<tr id="tr_${areals.AREAID}" name="${areals.AREAID}" >
									<td style="width: 30px;text-align: center;">${vs.count}</td>
									<td style="width: 30px;text-align: center;">
										<input type="checkbox" id="${areals.AREAID}" style="margin:0;"/>
									</td>
									<td style="width: 437px;text-align: center;" >
										<input type="hidden" id="count${vs.count}" value="${areals.AREAID}"/>
										${areals.AREAID}</td>
									<td style="width:437px;text-align: center;">${areals.AREANAME}</td>
								</tr>
							</c:forEach>
								</tbody>
							</table>
						</div>
						
					</div>
				</div>			
	
	</div>
	</div>
	</div>
			</form>
</DIV>
	</div>
	</div>
	

			
	
<bu:submit viewId="241d19bcae644399a49ff9fe5c12f179" />
<bu:script viewId="241d19bcae644399a49ff9fe5c12f179" />
	<script>(function($){
        $(window).on('load',function(){
        setPopScroll('.scroll1','.head1');
        setPopScroll('.scroll2','.head2');
        setPopScroll('.scroll3','.head3');
        })
    })(jQuery)</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
