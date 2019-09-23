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
	//加载父ifream中的js\css文件

		var linkList = window.parent.document.getElementsByTagName("link");
		var scriptList = window.parent.document.getElementsByTagName("script");
		var head = document.getElementsByTagName("head").item(0);
		//外联样式
		for(var i=0;i<linkList.length;i++)
		{
			var l = document.createElement("link");
			l.rel = 'stylesheet';
			l.type = 'text/css';
			l.href = linkList[i].href;
			head.appendChild(l);
		}
		
		//去除重复的js引用
		var json = {};
		var scripts = new Array();
		var j = 0;
		for(var i=0;i<scriptList.length;i++)
		{
			if(scriptList[i].src != null && '' != scriptList[i].src && !json[scriptList[i].src])
			{
				json[scriptList[i].src] = 1;
				var script = document.createElement("script");
				script.type = 'text/javascript';
				script.src = scriptList[i].src;
				head.appendChild(script);
				scripts[j] = script;
				j++;
			}
		}
		
		window.scripts = scripts;
		
		function init(){
		$("#tag1").addClass("current");
		var tableTrJs = $("#workTime tbody tr");
		_toClickColor(tableTrJs);
		_tongLineColor(tableTrJs);
		var tableTrJss = $("#restTime tbody tr");
		_toClickColor(tableTrJss);
		_tongLineColor(tableTrJss);	
		var tableTrJss_s = $("#areaTbody_s tbody tr");
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
			var table1 = document.getElementById("workTime");
			var table2 = document.getElementById("restTime");
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
		utilsFp.confirmIcon(3,"","","", "<dict:lang value="数据正在提交，请稍候" />...",0,"","");}
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
			var restTimeS = $("#sr"+rowIdStr).val();
				$("#rest_time_s"+workTimeNameStr+rowRestIdStr).remove(); 
				$("#rest_time_e"+workTimeNameStr+rowRestIdStr).remove(); 
				$("#"+workTimeNameStr+rowRestIdStr).remove();
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
				utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择一条工作时间！" />",0,"270","");
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
			var len = $("#areatb tr").length;
			for(var i=1;i<len;i++){
				$("#areatb tr:eq("+i+") td:first").text(i);
			}
			$("#all_addArealist").attr("checked",false);
		
		}
		var areaCount = 0;
		/* onclick=\"getTrId('"+$(this).attr("id")+"','"+areaCount+"')\" */
		 function addArea(showId,backId){
			 $("#areaTbody :checkbox").each(function(){
					if($(this).attr("checked")){
						if (!$("#tr"+$(this).attr("id")).length) {
							$("#addArealist").append("<tr id='tr_"+$(this).attr("id")+"' ></tr>");
							$("#addArealist tr:last").append("<td style='width: 30px;text-align: center;'></td>");
							$("#addArealist tr:last").append("<td style='width: 30px;text-align: center;box-sizing: border-box;'><input type='checkbox' id='"+$(this).attr("id")+"' style='margin:0;'/></td>");
							$("#addArealist tr:last").append("<td style='width: 410px;text-align: center;'>"+$(this).attr("id")+"</td>");
							$("#addArealist tr:last").append("<td style='text-align: center;'>"+$(this).attr("name")+"</td>");
						}
					}
				});
			var len = $("#areatb tr").length;
			for(var i=1;i<len;i++){
				$("#areatb tr:eq("+i+") td:first").text(i);
			}
			$("#tag1").removeClass();
			$("#areaTbody").empty();
			$("#areaId").val("");
			$("#areaName").val("");
			$("#areaName").val("");
	        $("#searchArea").trigger("chosen:updated");
			$("#all_areaTbody").attr("checked",false);
			document.getElementById(showId).style.display = 'none';
			document.getElementById(backId).style.display = 'none';
			checkboxAll("addArealist");
		} 
		
		function getAddArea(){
			$("#addArealist :checkbox").each(function(){
					$("#addCalForm").append("<input type='hidden' id='areaID"+areaCount+"' name='areaID"+areaCount+"' value='"+$(this).attr("id")+"'>");
  					areaCount++;
				});
		}
		
		
		$(function(){
			var len = $("#areatb tr").length;
			for(var i=1;i<len;i++){alert(len);
				$("#areatb tr:eq("+i+") td:first").text(i);
			}
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
		function wGroup(valwGroup,rStartH,rStartM,rEndH,rEndM,valwTime,rowId,cid){
			rGroupStr = valwGroup;
			rTimeStr = valwTime;
			rStartHStr = rStartH;
			rStartMStr = rStartM;
			rEndHStr = rEndH;
			rEndMStr = rEndM;
			rowIdStr  = rowId;
			calwInterDay = cid;
			document.getElementById("calrGroup").value=valwGroup;
			document.getElementById("calrTime").value=valwTime;
			$('tr[name="restTimeTr"]').hide();
			for(var a=0;a<=restTimeCount;a++){
				if($("#"+valwGroup+a).length>0){
					$("#"+valwGroup+a).show();
				}
			}
		}
		var rowRestIdStr = "";
		var workTimeNameStr = "";
		function rGroup(rowRestId,workTimeName){
			rowRestIdStr  = rowRestId;
			workTimeNameStr = workTimeName;
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
  			$("#workTime tbody:last").append("<input type='hidden' id='sr"+workTimeCount+"' value=''>");
			$("#workTime tbody:last").append("<tr id='"+workTimeCount+"' onclick=\"wGroup('"+$("#calwGroup").val()+"','"+$("#calwStartH").val()+"','"+$("#calwStartM").val()+"','"+$("#calwEndH").val()+"','"+$("#calwEndM").val()+"','"+$("#calwTime").val()+"','"+workTimeCount+"','"+$("#calwInterDay").val()+"');\"></tr>");
			$("#workTime tr:last").append("<td name='calwGroup' align='center' style='width:176px;'>"+$("#calwGroup").val()+"</td>");
			$("#workTime tr:last").append("<td name='calwGroup' align='center' style='width:176px;'>"+$("#calwTime").val()+"</td>");
			$("#workTime tr:last").append("<td name='calwStart' align='center' style='width:178px;'>"+$("#calwStartH").val()+":"+$("#calwStartM").val()+"</td>");
			$("#workTime tr:last").append("<td name='calwEnd' align='center' style='width:178px;'>"+$("#calwEndH").val()+":"+$("#calwEndM").val()+"</td>");
			if($("#calwInterDay").val()=="Y"){
				$("#workTime tr:last").append("<td name='calwInterDay' align='center' style='width:178px;'>是</td>");
			}else{
				$("#workTime tr:last").append("<td name='calwInterDay' align='center' style='width:178px;'>否</td>");
			}
			if($("#calwOverFalg").val()=="Y"){
				$("#workTime tr:last").append("<td name='calwOverFalg' align='center' style='width:178px;'>是</td>");
			}else{
				$("#workTime tr:last").append("<td name='calwOverFalg' align='center' style='width:178px;'>否</td>");
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
			var tableWork = document.getElementById("workTime");
			var count = tableWork.rows.length;
			var calwStart,calwStarts,calwEnd,calwEnds;
			var interDay = 0;
			if (count>1) {
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
			var restTimeCount = 0;
		function addRestTime(showId,backId,wGroupName){
			if(!checkRData()){
      			return ;
  			}
  			$("#addCalForm").append("<input type='hidden' id='rest_time_n"+rGroupStr+"r"+restTimeCount +"' name='rest_time_n"+rGroupStr+restTimeCount +"' value='"+rGroupStr+"'>");
  			$("#addCalForm").append("<input type='hidden' id='rest_time_s"+rGroupStr+"r"+restTimeCount +"' name='rest_time_s"+rGroupStr+restTimeCount +"' value='"+$("#calrStartH").val()+":"+$("#calrStartM").val()+"'>");
  			$("#addCalForm").append("<input type='hidden' id='rest_time_e"+rGroupStr+"r"+restTimeCount +"' name='rest_time_e"+rGroupStr+restTimeCount +"' value='"+$("#calrEndH").val()+":"+$("#calrEndM").val()+"'>");
  			$("#restTime tbody:last").append("<tr align='center' name='restTimeTr' id='"+rGroupStr+restTimeCount+"' onclick=rGroup('"+restTimeCount+"','"+rGroupStr+"')></tr>");
			$("#restTime tr:last").append("<td align='center' width='200px;' name='calrGroup'>"+rGroupStr+"</td>");
			$("#restTime tr:last").append("<td align='center' width='200px;' name='calrGroup'>"+rTimeStr+"</td>");
			$("#restTime tr:last").append("<td align='center' width='200px;' name='calrStart'>"+$("#calrStartH").val()+":"+$("#calrStartM").val()+"</td>");
			$("#restTime tr:last").append("<td align='center' width='200px;' name='calrEnd'>"+$("#calrEndH").val()+":"+$("#calrEndM").val()+"</td>");
			$("#sr"+rowIdStr).val($("#sr"+rowIdStr).val()+"@"+"r"+restTimeCount+"&"+rGroupStr+"&"+$("#calrStartH").val()+":"+$("#calrStartM").val()+"&"+$("#calrEndH").val()+":"+$("#calrEndM").val());
			restTimeCount++;
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
				}else if (parseInt($("#calrStartH").val())==parseInt($("#calrEndH").val())) {
					if (parseInt($("#calrStartM").val())>=parseInt($("#calrEndM").val())) {
   							_alertValMsg(calrStart,"<dict:lang value="开始时间不能晚于或等于结束时间" />");
	       					return false;
					}
				}
			}
			if (calwInterDay != "Y") {
				if (parseInt($("#calrStartH").val())<parseInt(rStartHStr) || parseInt($("#calrStartH").val())>parseInt(rEndHStr)
						||parseInt($("#calrEndH").val())<parseInt(rStartHStr) || parseInt($("#calrEndH").val())>parseInt(rEndHStr)) {
   						_alertValMsg(calrStart,"<dict:lang value="休息时间不在工作时间内" />");
       					return false;
				}else if (parseInt($("#calrStartH").val())==parseInt(rStartHStr) || parseInt($("#calrEndH").val())==parseInt(rEndHStr)) {
						if(parseInt(rStartMStr)!=0){
						if (parseInt($("#calrStartH").val())==parseInt(rStartHStr)&&parseInt($("#calrStartM").val())<parseInt(rStartMStr)) {
   								_alertValMsg(calrStart,"<dict:lang value="休息时间不在工作时间内" />");
       							return false;
						}}
						if(parseInt(rEndMStr)!=0){
						if (parseInt($("#calrEndH").val())==parseInt(rEndHStr)&&parseInt($("#calrEndM").val())>parseInt(rEndMStr)) {
   								_alertValMsg(calrStart,"<dict:lang value="休息时间不在工作时间内" />");
       							return false;
						}}
					}
				}
				
			var table2 = document.getElementById("restTime");
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
				if (parseInt($("#calrStartH").val())>parseInt(calrStarts[0])) {
						if (parseInt($("#calrStartH").val())<parseInt(calrEnds[0])) {
   								_alertValMsg(calrStart,"<dict:lang value="时间不能交叉" />");
       							return false;
						}	
				}
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
    
    function closeValMsg(objthis){
    	document.getElementById(objthis).innerHTML = "";
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

.extend-btn button .ico-kl-new-add {
	width: 15px;
	height: 15px;
	margin-right: 5px;
	margin-bottom: 3px;
	background: url(${path}plf/page/fp/img/ico-kl.png) no-repeat;
}

.extend-btn button:hover .ico-kl-new-add {
	width: 15px;
	height: 15px;
	margin-right: 5px;
	margin-bottom: 3px;
	background: url(${path}plf/page/fp/img/ico-kl-h.png) no-repeat;
}

.extend-btn button .ico-sc-new-add {
	width: 15px;
	height: 15px;
	margin-right: 5px;
	margin-bottom: 3px;
	background: url(${path}plf/page/fp/img/ico-sc.png) no-repeat;
}

.extend-btn button:hover .ico-sc-new-add {
	width: 15px;
	height: 15px;
	margin-right: 5px;
	margin-bottom: 3px;
	background: url(${path}plf/page/fp/img/ico-sc-h.png) no-repeat;
}
</style>
</head>
<body scroll="no"
	style="overflow-x:hidden;overflow-y:hidden;height:800px">
	<div class="mod" style="margin-top: 37px;">
		<div>
			<div class="hd" style="height:0;">
			<div style="margin-left:10px;margin-top: -35px;">
				<input type="checkbox" checked="" id="isCloseWin_s"value="0">
				<dict:lang value="保存并关闭窗口" />
			</div>
				<div class="optn">
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
					<input type="hidden" id="isCloseWin" name="isCloseWin"/>
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
					<s:hidden
						name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}"
						value="%{FUNC_CODE_2}" />
					<s:token />
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
					</table>
					<bu:form viewId="7c413e16ba004221b215aaf7e0ad6cd7"
						formId="40dc55c074cf4093926c8adc4d236ec7" list="dataList "
						formidFirstId="53702b48b70f436ca1f2252894d37c09" relColIds=""
						subFormIds="" subRelColIds="" />
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
																value="班 别" /></td>
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
														<table class="dlist-table table-line " id="workTime">
															<thead>
																<tr class="thcolor">
																	<th align="center" width="150px;"><dict:lang
																			value="班别" /></th>
																	<th align="center" width="150px;"><dict:lang
																			value="时段" /></th>
																	<th align="center" width="150px;"><dict:lang
																			value="开始时间" /></th>
																	<th align="center" width="150px;"><dict:lang
																			value="结束时间" /></th>
																	<th align="center" width="100px;"><dict:lang
																			value="跨天标识" /></th>
																	<th align="center" width="100px;"><dict:lang
																			value="加班标识" /></th>
																</tr>
															</thead>
															<tbody id="addworkTime">

															</tbody>
														</table>
														<br />
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
														<table class="dlist-table table-line " id="restTime" style="width: 100%;">
															<thead>
																<tr align="center">
																	<th style="text-align: center;"><dict:lang
																			value="班别" /></th>
																	<th style="text-align: center;"><dict:lang value="时段" /></th >
																	<th style="text-align: center;"><dict:lang
																			value="开始时间" /></th>
																	<th style="text-align: center;"><dict:lang
																			value="结束时间" /></th>
																</tr>
															</thead>
															<tbody id="addRestTime"></tbody>
														</table>
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
							<table class="dlist-table table-line " id="areatb" width="100%;">
								<thead>
									<tr class="thcolor">
										<th style="text-align: center;width: 30px;">
										</th>
										<th style="width: 30px;text-align: center;box-sizing: border-box;">
											<input type="checkbox" id="all_addArealist" onchange="getAllArea();" style="margin:0;" />
										</th >
										<th style="width: 410px;"><dict:lang value="线别编号" />
										</th>
										<th style=""><dict:lang value="线别名称" />
										</th>
									</tr>
								</thead>
								<tbody id="addArealist">
								</tbody>
							</table>
							<br />
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
											<td style="width: 106px;text-align: right;"><dict:lang
													value="所属车间" />
											</td>
											<td style="width: 162px;text-align: left;"><select
												id="searchArea" name="searchArea"
												class=" input isSubmit dept_select" style="width: 157px;">
													<option >--请选择--</option>
											</select>
											</td>
											<td style="width: 106px;text-align: right;"><dict:lang
													value="线别代码" />
											</td>
											<td style="width: 162px;text-align: left;"><input
												type="text" id="areaId" />
											</td>
											<td style="width: 106px;text-align: right;"><dict:lang
													value="线别名称" />
											</td>
											<td style="width: 162px;text-align: left;"><input
												type="text" id="areaName" />
											</td><!-- 
											<td style="width: 10%;"></td> -->
										</tr>
									</table>
								</div>
								<table class="dlist-table table-line " style="width: 100%;background-color: white;margin-top: 5px;">
									<thead>
										<tr align="center">
											<th style="width: 30px;text-align: center;">&nbsp;</th>
											<th style="width: 30px;text-align: center;box-sizing: border-box;">
												<input type="checkbox" id="all_areaTbody" onchange="getAllArea_s();" style="margin:0;" />
											</th >
											<th style="width: 230px;text-align: center;"><dict:lang
													value="线别代码" />
											</th>
											<th style="width: 230px;text-align: center;"><dict:lang
													value="线别名称" />
											</th>
											<th style="text-align: center;"><dict:lang
													value="所属车间" />
											</th>
										</tr>
									</thead>
								</table>
								<div style="background-color: white;max-height: 190px;overflow: auto;height: 190px;">
								<table id="areaTbody_s" class="dlist-table table-line " style="width: 100%;background-color: white;">
									<tbody id="areaTbody">

									</tbody>

								</table>
								</div>
								<div style="background-color: white;">
									<s:include value="/plf/page/fp/paginationPopAx.jsp?listDataFn=searchArea&formId=formId1&showLoading=0" />
								</div>
								
							</div>
								</div>
	<bu:submit viewId="7c413e16ba004221b215aaf7e0ad6cd7" />
	<bu:script viewId="7c413e16ba004221b215aaf7e0ad6cd7" />
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
