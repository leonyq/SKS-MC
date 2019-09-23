<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="修改流程" /></title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />		
		<jsp:param name="html5" value="1" />
		<jsp:param name="workFlow" value="1" />
		<jsp:param name="spectrum" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    
    <script src="${path}plf/js/jsPlumb/newWorkflowchart.js"></script>   
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
		<link href="${path}plf/page/fp/css/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${path}plf/page/fp/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<style type="text/css">
	.x-fieldset{border:1px solid #00bfff;padding:10px;margin-bottom:10px;display:block;height: 100%}
	</style>
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
	</script>
		<script type="text/javascript">
	var loaded = 1;
	var tab_len = 2;

	var currentTag;
	var tabs = "";
	var orderfalg = false;
	function switchTag(tag, content,url) {
			if(currentTag == tag){
				return false;
			}
			if("tag2" == tag){
				/* $("#right .icon").each(function (idx, elem) {
				var $elem = $(elem);
					if ("Y"==$("#type_"+$elem.attr('id')).val()) {
						orderfalg = true;
					}
				});
				if (orderfalg) { */
					getBlocks();
					getOrder();
					getSelect();
					$("#paraMapObj_CR_MO_OUTPUT_chosen").css("width","157px");
					$("#paraMapObj_CR_MO_INPUT_chosen").css("width","157px");
					$("#paraMapObj_CR_PO_INPUT_chosen").css("width","157px");
					$("#paraMapObj_CR_PO_OUTPUT_chosen").css("width","157px");
				/* }else{
					utilsFp.alert("<dict:lang value="请选择一个工序作为开始工序" />");
					return ;
				} */
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
		
		window.onload=function(){
			$("#MO_INPUT_S").val($("#paraMapObj_CR_MO_INPUT").val());
			$("#MO_OUTPUT_S").val($("#paraMapObj_CR_MO_OUTPUT").val());
			$("#PO_INPUT_S").val($("#paraMapObj_CR_PO_INPUT").val());
			$("#PO_OUTPUT_S").val($("#paraMapObj_CR_PO_OUTPUT").val());
			$("#tag1").addClass("current");
			getGroup();
			$("#paraMapObj_CR_MO_OUTPUT_chosen").css("width","157px");
			$("#paraMapObj_CR_MO_INPUT_chosen").css("width","157px");
			$("#paraMapObj_CR_PO_INPUT_chosen").css("width","157px");
			$("#paraMapObj_CR_PO_OUTPUT_chosen").css("width","157px");
			$.ajax({
        			type: "POST",
        		    dataType: "json",
        		    url: "buss/bussModel_exeFunc.ms?FUNC_CODE=F2377&funcMId=1d9be9ef4b99480d8d96c6d2a5dd2127&formId=",
        		    data: "dataId="+$("#dataId").val()+"&routeCode="+$("#paraMapObj_CR_ROUTE_ID").val()+"&falg=routeLs",
        			success: function(data){
     						if(data.ajaxList != null && data.ajaxList != ""){
     							for ( var i = 0; i < data.ajaxList.length; i++) {
        							$("#addRoutelist").append("<tr id='tr_"+data.ajaxList[i].ID+"'></tr>");
						        	$("#addRoutelist tr:last").append("<td style='text-align: center;width: 10%;'><input type='checkbox' onclick='' /></td>");
						        	$("#addRoutelist tr:last").append("<td style='width: 30%;text-align: left;'>"+data.ajaxList[i].CRCO_STEP+"</td>");
						        	$("#addRoutelist tr:last").append("<td style='width: 30%;text-align: left;'>"+data.ajaxList[i].STARTNAME+"</td>");
						        	$("#addRoutelist tr:last").append("<td style='width: 30%;text-align: left;'>"+data.ajaxList[i].ENDNAME+"</td>");
						        	$("#addRoutelist").append("<input type='hidden' id='crcoStec_tr_"+data.ajaxList[i].ID+"' name='crcoStec_s' value='"+data.ajaxList[i].CRCO_STEP+"' />");
						        	$("#addRoutelist").append("<input type='hidden' id='crcoStartGroup_tr_"+data.ajaxList[i].ID+"' name='crcoStartGroup_s' value='"+data.ajaxList[i].CRCO_START_GROUP+"' />");
						        	$("#addRoutelist").append("<input type='hidden' id='crcoEndGroup_tr_"+data.ajaxList[i].ID+"' name='crcoEndGroup_s' value='"+data.ajaxList[i].CRCO_END_GROUP+"' />");
        						}
							}
	     					if(data.ajaxString != null && data.ajaxString != ""){
	     						$("#group_falg").val(data.ajaxString);
							}
							yanse();
        				},
        			error: function(msg){
        					util.closeLoading();
        					util.alert("error:"+msg);
        			  }
        			});
        		
		};
		function yanse(){
			$("#right .icon").each(function (idx, elem) {
				var $elem = $(elem);
				if ($.trim($("#start_"+$elem.attr("id")).val())==$.trim("Y")) {
					$("#"+$elem.attr("id")).find("img:first").css("border","2px solid #f00");
				}
				if ($.trim($("#type_"+$elem.attr("id")).val())==$.trim("0")) {
					$("#"+$elem.attr("id")).find("p").css("background-color","#ffd700");
				}else if ($.trim($("#type_"+$elem.attr("id")).val())==$.trim("1")) {
						$("#"+$elem.attr("id")).find("p").css("background-color","#32cd32");
				}else if ($.trim($("#type_"+$elem.attr("id")).val())==$.trim("2")) {
						$("#"+$elem.attr("id")).find("p").css("background-color","#4682b4");
					}
			});
		}
		var addTableTrMap;
        var blockIcon;
        var blackConn;
        var id = "";
        var paraMapModel = "${paraMap.model}";
        var group_falg = "";
        var line_falg = "";
		//var order ;
        var orderfalg ;
        var orderfalg_s ;
       
		var order_count_s;
       function orderCountSS(id,order){
       		var str_s ;
       		for ( var key in order) {
				str_s = key.split("%^");
       			if (id==str_s[0]) {
					if (order_count_s[id] == undefined) {
						order_count_s[id] = orderCount;
						$("#editForm").append("<input type='hidden' name='order_count' id='order_"+id+"' value='"+orderCount+"'/>");
						orderCount ++;
					}
					orderCountSS(order[key],order);
					
				}
       		}
       }
       
        var orderCount ;
       //获取连接线上下级Id,用于排列工序顺序
		function getOrder(){
			var order = {};
			var eq ;
			orderCount = 1;
			$.each(jsPlumb.getAllConnections(), function (idx, connection) {
				order[connection.sourceId]=connection.targetId;
			});
			$("#right .icon").each(function (idx, elem) {
				var $elem = $(elem);
				if (!$("#select_"+$elem.attr("id")).length) {
					$("#select_id").append("<tr id='select_"+$elem.attr("id")+"'><td>"+$("#groupID_"+$elem.attr("id")).val()+"</td><td>"+$("#groupName_"+$("#groupID_"+$elem.attr("id")).val()).val()+"</td><td>"+$elem.attr("id")+"</td></tr>");
				}
				if ($("#start_"+$elem.attr('id')).val()=="Y") {
					$("#group_falg").val($elem.attr('id'));
				}
			}); 
			orderfalg = $("#group_falg").val();
			var order_count = document.getElementsByName("order_count");
			for(var i=0;i<order_count.length;i++){
				order_count[i].remove();
			}
			
			var gxflag = true;
			var orderfalg_s_s ;
			var fc = 0;  //区别各个连接线
			var str = "";  //连接线 key
			$.each(jsPlumb.getAllConnections(), function (idx, connection) {
				order[connection.sourceId+"%^fc_"+fc]=connection.targetId;
				fc ++;
			});
			var blocks = {};
			var gx = 0;  //各个工序
			$("#right .icon").each(function (idx, elem) {
				var $elem = $(elem);
				blocks[gx]=$elem.attr('id');
				gx ++;
			});
			for ( var key_s in blocks) {
				for ( var key in order) {
					str = key.split("%^");
					if (str[0] == blocks[key_s]) {
						gxflag = false;
					}
				}
				if (gxflag) {
					order[blocks[key_s]+"%^fc_"+fc]="-1";
					fc ++;
				}
				gxflag = true;
			}
			var order_count = document.getElementsByName("order_count");
			for(var i=0;i<order_count.length;i++){
				order_count[i].remove();
			}
			order_count_s = {};
			$("input[name='order_count']").remove();
			orderCountSS(orderfalg,order);
			
			/* for ( var key in order) {
				if (key == orderfalg) {
					$("#editForm").append("<input type='hidden' name='order_count' id='order_"+orderfalg+"' value='"+orderCount+"'/>");
					orderfalg_s = order[key];
					orderCount ++;
					eq = 0;
							for( var key_s_t in order) {
								if (key_s_t != orderfalg_s) {
									eq ++;
								}
							}
							if(eq==Object.keys(order).length){
								$("#editForm").append("<input type='hidden' name='order_count' id='order_"+orderfalg_s+"' value='"+orderCount+"'/>");
								orderCount ++;
							}else{
					for ( var key_s in order) {
						if (key_s == orderfalg_s) {
							$("#editForm").append("<input type='hidden' name='order_count' id='order_"+orderfalg_s+"' value='"+orderCount+"'/>");
							orderfalg_s = order[key_s];
							orderCount ++;
							eq = 0;
							for( var key_s_s in order) {
								if (key_s_s != orderfalg_s) {
									eq ++;
								}
							}
							if(eq==Object.keys(order).length){
								$("#editForm").append("<input type='hidden' name='order_count' id='order_"+orderfalg_s+"' value='"+orderCount+"'/>");
								orderCount ++;
							}
						}
				}
			}
			order = 1;
		}
		} */
		}
        
        function groupType(){
        	group_falg = $("#group_falg").val();
		    $("#type_"+group_falg).val($("#paraMap_group_type").val());
		    if ($.trim($("#paraMap_group_type").val())==$.trim("0")) {
			$("#"+group_falg).find("p").css("background-color","#ffd700");
			}else if ($.trim($("#paraMap_group_type").val())==$.trim("1")) {
						$("#"+group_falg).find("p").css("background-color","#32cd32");
					}else if ($.trim($("#paraMap_group_type").val())==$.trim("2")) {
						$("#"+group_falg).find("p").css("background-color","#4682b4");
					}
        }
        
        function groupstart(){
        	group_falg = $("#group_falg").val();
        			if($("#groupStart").attr("checked")=="checked"){
						$("#groupStart").val("Y");
						$("#"+group_falg).find("img:first").css("border","2px solid #f00");
					}else{
						$("#groupStart").val("N");
						$("#"+group_falg).find("img:first").css("border","");
					}
        			orderfalg = group_falg;
		        	$("#start_"+group_falg).val($("#groupStart").val());
        }
        
        
        $(function(){
        	$("#paraMap_group_type_chosen").bind({
        		blur:function(){
        			group_falg = $("#group_falg").val();
		        	$("#type_"+group_falg).val($("#paraMap_group_type").val());
		        }
        	});
        	/* $("#groupStart").bind({
        		blur:function(){
        			group_falg = $("#group_falg").val();
        			if($("#groupStart").attr("checked")=="checked"){
						$("#groupStart").val("Y");
						$("#"+group_falg).find("img").css("border","2px solid #f00");
					}else{
						$("#groupStart").val("N");
						$("#"+group_falg).find("img").css("border","");
					}
        			orderfalg = group_falg;
		        	$("#start_"+group_falg).val($("#groupStart").val());
		        }
        	}); */
        	$("#paraMap_connection").bind({
        		blur:function(){
        			if($("#paraMap_connection").attr("checked")=="checked"){
						$("#paraMap_connection").val("Y");
					}else{
						$("#paraMap_connection").val("N");
					}
        			line_falg = $("#line_falg").val();
		        	$("#"+line_falg+"_line").val($("#paraMap_connection").val());
		        	$("#line_"+line_falg).val($("#paraMap_connection").val());
		        }
        	});
        });
        
        function getSelect(){
        	$(".select_name").remove();
        	$("#paraMapObj_CR_MO_OUTPUT").empty();
        	$("#paraMapObj_CR_MO_INPUT").empty();
        	$("#paraMapObj_CR_PO_OUTPUT").empty();
        	$("#paraMapObj_CR_PO_INPUT").empty();
        	$("#crcoStartGroup").empty();
        	$("#crcoEndGroup").empty();
        	$("#paraMapObj_CR_MO_OUTPUT").append("<option value='' class='select_name'>--<dict:lang value="请选择" />--</option>");
        	$("#paraMapObj_CR_MO_INPUT").append("<option value='' class='select_name'>--<dict:lang value="请选择" />--</option>");
        	$("#paraMapObj_CR_PO_OUTPUT").append("<option value='' class='select_name'>--<dict:lang value="请选择" />--</option>");
        	$("#paraMapObj_CR_PO_INPUT").append("<option value='' class='select_name'>--<dict:lang value="请选择" />--</option>");
        	$("#crcoStartGroup").append("<option value='' class='select_name'>--<dict:lang value="请选择" />--</option>");
        	$("#crcoEndGroup").append("<option value='' class='select_name'>--<dict:lang value="请选择" />--</option>");
        	$("#select_id").find("tr").each(function(){
        		var tdArr = $(this).children();
        		var group_id = tdArr.eq(0).text();
        		var group_name = tdArr.eq(1).text();
        		var group_order = $("#order_"+tdArr.eq(2).text()).val();
        		if (group_order==null || group_order == "") {
					group_order = -1;
				}
        		$("#paraMapObj_CR_MO_OUTPUT").append("<option value='"+group_id+"' class='select_name'>"+group_order+"--"+group_name+"</option>");
				$("#editForm").append("<input type='hidden' id='mo_output_"+group_id+"' class='select_name' value='"+group_order+"'/>");
        		$("#paraMapObj_CR_MO_INPUT").append("<option value='"+group_id+"' class='select_name'>"+group_order+"--"+group_name+"</option>");
				$("#editForm").append("<input type='hidden' id='mo_input_"+group_id+"' class='select_name' value='"+group_order+"'/>");
        		$("#paraMapObj_CR_PO_INPUT").append("<option value='"+group_id+"' class='select_name'>"+group_order+"--"+group_name+"</option>");
				$("#editForm").append("<input type='hidden' id='po_output_"+group_id+"' class='select_name' value='"+group_order+"'/>");
        		$("#paraMapObj_CR_PO_OUTPUT").append("<option value='"+group_id+"' class='select_name'>"+group_order+"--"+group_name+"</option>");
				$("#editForm").append("<input type='hidden' id='po_output_"+group_id+"' class='select_name' value='"+group_order+"'/>");
        		$("#crcoStartGroup").append("<option value='"+group_id+"' class='select_name'>"+group_order+"--"+group_name+"</option>");
				$("#editForm").append("<input type='hidden' id='startGroup_"+group_id+"' class='select_name' value='"+group_order+"'/>");
        		$("#crcoEndGroup").append("<option value='"+group_id+"' class='select_name'>"+group_order+"--"+group_name+"</option>");
				$("#editForm").append("<input type='hidden' id='endGroup_"+group_id+"' class='select_name' value='"+group_order+"'/>");
        	});
        		$("#paraMapObj_CR_MO_INPUT").find("option[value="+$("#MO_INPUT_S").val()+"]").attr("selected",true);
        		$("#paraMapObj_CR_MO_OUTPUT").find("option[value="+$("#MO_OUTPUT_S").val()+"]").attr("selected",true);
        		$("#paraMapObj_CR_PO_INPUT").find("option[value="+$("#PO_INPUT_S").val()+"]").attr("selected",true);
        		$("#paraMapObj_CR_PO_OUTPUT").find("option[value="+$("#PO_OUTPUT_S").val()+"]").attr("selected",true);
        		$("#paraMapObj_CR_MO_OUTPUT").trigger("chosen:updated");
        		$("#paraMapObj_CR_MO_INPUT").trigger("chosen:updated");
        		$("#paraMapObj_CR_PO_INPUT").trigger("chosen:updated");
        		$("#paraMapObj_CR_PO_OUTPUT").trigger("chosen:updated");
        		$("#crcoStartGroup").trigger("chosen:updated");
        		$("#crcoEndGroup").trigger("chosen:updated");
        }
        
         function compareMO(){
        	var start = $("#mo_output_"+$("#paraMapObj_CR_MO_INPUT").val()).val();
        	var end = $("#mo_output_"+$("#paraMapObj_CR_MO_OUTPUT").val()).val();
        	if (parseInt(start)>parseInt(end)||parseInt(start)==parseInt(end)) {
				utilsFp.alert("<dict:lang value="制令单产出工序不能早于等于制令单投入工序" />");
				$("#paraMapObj_CR_MO_INPUT").find("option[value='']").attr("selected",true);
				$("#paraMapObj_CR_MO_OUTPUT").find("option[value='']").attr("selected",true);
				$("#paraMapObj_CR_MO_INPUT").trigger("chosen:updated");
				$("#paraMapObj_CR_MO_OUTPUT").trigger("chosen:updated");
			}
        } 
        
         function comparePO(){
        	var start = $("#po_output_"+$("#paraMapObj_CR_PO_INPUT").val()).val();
        	var end = $("#po_output_"+$("#paraMapObj_CR_PO_OUTPUT").val()).val();
        	if (parseInt(start)>parseInt(end)||parseInt(start)==parseInt(end)) {
				utilsFp.alert("<dict:lang value="工单产出工序不能早于等于工单投入工序" />");
				$("#paraMapObj_CR_PO_OUTPUT").find("option[value='']").attr("selected",true);
				$("#paraMapObj_CR_PO_INPUT").find("option[value='']").attr("selected",true);
				$("#paraMapObj_CR_PO_OUTPUT").trigger("chosen:updated");
				$("#paraMapObj_CR_PO_INPUT").trigger("chosen:updated");
			}
        } 
        
         function compareEG(){
        	var start = $("#startGroup_"+$("#crcoStartGroup").val()).val();
        	var end = $("#endGroup_"+$("#crcoEndGroup").val()).val();
        	if (parseInt(start)>parseInt(end)||parseInt(start)==parseInt(end)) {
				utilsFp.alert("<dict:lang value="结束工序不能早于等于开始工序" />");
				$("#crcoEndGroup").find("option[value='']").attr("selected",true);
				$("#crcoStartGroup").find("option[value='']").attr("selected",true);
				$("#crcoStartGroup").trigger("chosen:updated");
				$("#crcoEndGroup").trigger("chosen:updated");
			}
        } 
        
        function getGroup(){
        	//var groupUrl = "";
        	url = "buss/bussModel_exeFunc.ms?FUNC_CODE=F2377&funcMId=1d9be9ef4b99480d8d96c6d2a5dd2127&formId=";
        	var top = 5;
        	$.ajax({
     			type: "POST",
     		    dataType: "json",
     		    url:url,
     		    data: "routeStep="+$("#paraMapObj_CR_ROUTE_STEP").val()+"&falg=getGroup",
     			success: function(data){
     					util.closeLoading();
     					if(data.ajaxList != null && data.ajaxList != ""){
     						$("#left").empty();
     						for ( var i = 0; i < data.ajaxList.length; i++) {
     							$("#left").append("<div class='icon' id='"+data.ajaxList[i].GROUP_CODE+"' style='left: 15px;top: "+top+"px;'> <input type='hidden' id='groupID_"+data.ajaxList[i].GROUP_CODE+"' value='"+data.ajaxList[i].GROUP_CODE+"'/><input type='hidden' id='groupName_"+data.ajaxList[i].GROUP_CODE+"' value='"+data.ajaxList[i].GROUP_NAME+"'/> <div class='icon_font'><img class='img_cls' src='${path}up_load/comm/"+data.ajaxList[i].PHOTO_PATH+"'/><p><dict:lang value='"+data.ajaxList[i].GROUP_NAME+"'/></p></div></div>");
     							$("#editForm").append("<input type='hidden' id='color_"+data.ajaxList[i].GROUP_CODE+"' value='"+data.ajaxList[i].GROUP_COLOR+"'/>");
     							//$("#editForm").append("<input type='hidden' id='type_"+data.ajaxList[i].GROUP_CODE+"' value=''/>");
     							top += 60;
							}	
							top = 5;
							$("#left").children().draggable({
								helper: "clone",
								scope: "ss",
								//containment:"#right",
								revert:"invalid",
								appendTo:"#right",
								sroll:false,
								drag:function(event,ui){
								},
								start:function(event,ui){
									//$("#left").removeClass("left");
								},
								stop:function(event,ui){
									//$("#left").addClass("left");
								}
								
							});					
     					}

     				},
     			error: function(msg){
     					util.closeLoading();
     					utilsFp.alert("error:"+msg);
     			  }
     			});		
        }
        
         $(function(){

        	 id = $("#dataId").val();
        	 
        	 if(id != null && id != "" && paraMapModel == "view"){
        		 $("input[type='button']").hide();
        		 $("#left").hide();
        		 $("#right").width("85%");
        		 $("#right").css("left","5px");
        		 $("#paraMap_title").prop("readonly","readonly");
        		 $("#paraMap_memo").prop("readonly","readonly");
        		 document.title = "<dict:lang value="工作流" /> <dict:lang value="查看" />";
         	 } 
        	 if(id != null && id != ""){
        	 $.ajax({
        			type: "POST",
        		    dataType: "json",
        		    url: "buss/bussModel_exeFunc.ms?FUNC_CODE=F2377&funcMId=1d9be9ef4b99480d8d96c6d2a5dd2127&formId=",
        		    data: "dataId="+id+"&falg=list",
        			success: function(data){
        					util.closeLoading();
        					if(data.ajaxList != null && data.ajaxList != ""){
        						id = data.ajaxList[0].ID;
        						blockIcon = JSON.parse(data.ajaxList[0].CR_BLOCKS_MSG);
        						blackConn = JSON.parse(data.ajaxList[0].CR_CONN_MSG);
        						initJsPlumb();
        						//if(paraMapModel != "view"){
        							showCon();
        						//}
        					}
        				},
        			error: function(msg){
        					util.closeLoading();
        					util.alert("error:"+msg);
        			  }
        			});
        	 }
        	 
         }); 
         
        var url = "";
        function editRoute(){
        	//url = editRouteService();
        	if($("#paraMapObj_CR_ROUTE_FLAG_1").attr("checked")=="checked"){
				$("#paraMapObj_CR_ROUTE_FLAG_1").val("Y");
			}else{
				$("#paraMapObj_CR_ROUTE_FLAG_1").val("N");
			}
        	if($.trim($("#paraMapObj_CR_ROUTE_ID").val()) == null || $.trim($("#paraMapObj_CR_ROUTE_ID").val()) == ""){
        		utilsFp.alert("<dict:lang value="流程编码不能为空" />");
        		$("#paraMapObj_CR_ROUTE_ID").focus();
        		return false;
        	}else if($("#paraMapObj_CR_ROUTE_ID").val().length > 50){
        		utilsFp.alert("<dict:lang value="流程编码不能大于20个字" />");
        		$("#paraMapObj_CR_ROUTE_ID").focus();
        		return false;        		
        	}
        	else if($.trim($("#paraMapObj_CR_ROUTE_NAME").val()) == null || $.trim($("#paraMapObj_CR_ROUTE_NAME").val()) == ""){
        		utilsFp.alert("<dict:lang value="流程名称不能为空" />");
        		$("#paraMapObj_CR_ROUTE_NAME").focus();
        		return false;
        	}else if($("#paraMapObj_CR_ROUTE_NAME").val().length > 50){
        		utilsFp.alert("<dict:lang value="流程名称不能大于50个字" />");
        		$("#paraMapObj_CR_ROUTE_ID").focus();
        		return false;        		
        	}
        	 $.ajax({
     			type: "POST",
     		    dataType: "json",
     		    url:"buss/bussModel_exeFunc.ms?FUNC_CODE=F2377&funcMId=1d9be9ef4b99480d8d96c6d2a5dd2127&formId=",
     		    data: "blocks_msg="+getBlocks()+"&conn_msg="+getConn()+"&route_count="+getRouteCount()+
	     		    "&paraMap1@0#CR_ROUTE_STEP="+$("#paraMapObj_CR_ROUTE_STEP").val()+
	     		    "&paraMap1@0#CR_ROUTE_ID="+$("#paraMapObj_CR_ROUTE_ID").val()+
	     		    "&paraMap1@0#CR_ROUTE_NAME="+$("#paraMapObj_CR_ROUTE_NAME").val()+
	     		    "&paraMap1@0#CR_MO_OUTPUT="+$("#paraMapObj_CR_MO_OUTPUT").val()+
	     		    "&paraMap1@0#CR_MO_INPUT="+$("#paraMapObj_CR_MO_INPUT").val()+
	     		    "&paraMap1@0#CR_ROUTE_FLAG="+$("#paraMapObj_CR_ROUTE_FLAG_1").val()+
	     		    "&paraMap1@0#CR_PO_INPUT="+$("#paraMapObj_CR_PO_INPUT").val()+
	     		    "&paraMap1@0#CR_PO_OUTPUT="+$("#paraMapObj_CR_PO_OUTPUT").val()+"&dataId="+$("#dataId").val()+"&falg=addRoute",
     			success: function(data){
     					util.closeLoading();
     					if(data.ajaxString!= null && data.ajaxString!= ""){
							if (data.ajaxString=="-2") {
					          //utilsFp.alert("<dict:lang value="修改成功" />");
					          closeAndRefreshTab();
					        }else if (data.ajaxString=="0") {
					          utilsFp.alert("<dict:lang value="请选择一个工序作为开始工序" />");
					        }else if (data.ajaxString=="1") {
					          utilsFp.alert("<dict:lang value="存在多个开始工序" />");
					        }else if (data.ajaxString=="2") {
					          utilsFp.alert("<dict:lang value="工序存在空值属性" />");
					        }else if (data.ajaxString=="3") {
					          utilsFp.alert("<dict:lang value="请完善工序流程" />");
					        }else if (data.ajaxString=="4") {
					          utilsFp.alert("<dict:lang value="工序流程不能为空" />");
					        }else if (data.ajaxString=="5") {
					          utilsFp.alert("<dict:lang value="流程编码已存在" />");
					        }else if (data.ajaxString=="6") {
					          utilsFp.alert("<dict:lang value="流程关联关系字符长度过长" />");
					        }else{
					          utilsFp.alert("<dict:lang value="修改出错" />");
					        }
														
     					}

     				},
     			error: function(msg){
     					util.closeLoading();
     					utilsFp.alert("error:"+msg);
     			  }
     			});			

        }
                //关闭当前页并刷新列表
        function closeAndRefreshTab(){
        	var iframeId = "${iframeId}";
        	top.$("#"+iframeId)[0].contentWindow.reloadPg("<dict:lang value="修改成功" />","<dict:lang value="提示信息" />",200,150,3000);
  			parent.switchTabWithoutReload(iframeId.replace("iframe",""));
			parent.closeTab(window.frameElement.name.replace("iframe",""));
        }
        function popRouteDiv(showId,backId){
			document.getElementById(showId).style.display = 'block';
			document.getElementById(backId).style.display = 'block';
			$('.chosen-container').css("width","234px");
		}
		function hideDiv(showId,backId){
			document.getElementById(showId).style.display = 'none';
			document.getElementById(backId).style.display = 'none';
        	$("#paraMapObj_CR_MO_INPUT_chosen").css("width","157px");
        	$("#paraMapObj_CR_MO_OUTPUT_chosen").css("width","157px");
        	$("#paraMapObj_CR_PO_INPUT_chosen").css("width","157px");
        	$("#paraMapObj_CR_PO_OUTPUT_chosen").css("width","157px");
			$("#crcoStec").find("option[value='SMT']").attr("selected",true);
			$("#crcoStartGroup").find("option[value='']").attr("selected",true);
			$("#crcoEndGroup").find("option[value='']").attr("selected",true);
			$("#crcoStec").trigger("chosen:updated");
			$("#crcoStartGroup").trigger("chosen:updated");
			$("#crcoEndGroup").trigger("chosen:updated");
		} 
		var id = "";
        function addRoute(showId,backId){
        	if ($("#crcoStartGroup").val()==null || $("#crcoStartGroup").val()=="") {
				utilsFp.alert("<dict:lang value="开始工序不能为空" />");
				return false;
			}else if($("#crcoEndGroup").val()==null || $("#crcoEndGroup").val()==""){
				utilsFp.alert("<dict:lang value="结束工序不能为空" />");
				return false;
			}
				var routetable = document.getElementById("routetb");
				var count = routetable .rows.length;
				var crcoStecStr,routeStart,routeEnd;
				var crcoStec = $("#crcoStec").val();
				var startCount = $("#crcoStartGroup").find("option:selected").text().split("--");
				var endCount = $("#crcoEndGroup").find("option:selected").text().split("--");
				var falg = true;
				for ( var i = 1; i < count; i++) {
					crcoStecStr = routetable.rows[i].cells[1].innerHTML;
					routeStart = routetable.rows[i].cells[2].innerHTML.split("--");
					routeEnd = routetable.rows[i].cells[3].innerHTML.split("--");
					if (crcoStecStr == crcoStec) {
						if (parseInt(startCount[0])>=parseInt(routeStart[0]) && parseInt(startCount[0])<parseInt(routeEnd[0])) {
							falg = false;
						}
						if (parseInt(endCount[0])>=parseInt(routeStart[0]) && parseInt(endCount[0])<parseInt(routeEnd[0])) {
							falg = false;
						}
					}
				}
				if (falg) {
				id = util.getUUID();
	        	$("#addRoutelist").append("<tr id='tr_"+id+"'></tr>");
	        	$("#addRoutelist tr:last").append("<td style='text-align: center;width: 10%;'><input type='checkbox' onclick='' /></td>");
	        	$("#addRoutelist tr:last").append("<td style='width: 30%;text-align: left;'>"+$("#crcoStec").find("option:selected").text()+"</td>");
	        	$("#addRoutelist tr:last").append("<td style='width: 30%;text-align: left;'>"+$("#crcoStartGroup").find("option:selected").text()+"</td>");
	        	$("#addRoutelist tr:last").append("<td style='width: 30%;text-align: left;'>"+$("#crcoEndGroup").find("option:selected").text()+"</td>");
	        	$("#addRoutelist").append("<input type='hidden' id='crcoStec_tr_"+id+"' name='crcoStec_s' value='"+$("#crcoStec").val()+"' />");
	        	$("#addRoutelist").append("<input type='hidden' id='crcoStartGroup_tr_"+id+"' name='crcoStartGroup_s' value='"+$("#crcoStartGroup").val()+"' />");
	        	$("#addRoutelist").append("<input type='hidden' id='crcoEndGroup_tr_"+id+"' name='crcoEndGroup_s' value='"+$("#crcoEndGroup").val()+"' />");
	        	$("#crcoStec").val("");
	        	$("#crcoStartGroup").val("");
	        	$("#crcoEndGroup").val("");
				document.getElementById(showId).style.display = 'none';
				document.getElementById(backId).style.display = 'none';
	        	$("#paraMapObj_CR_MO_INPUT_chosen").css("width","157px");
	        	$("#paraMapObj_CR_MO_OUTPUT_chosen").css("width","157px");
	        	$("#paraMapObj_CR_PO_INPUT_chosen").css("width","157px");
	        	$("#paraMapObj_CR_PO_OUTPUT_chosen").css("width","157px");
	        	}else{
					utilsFp.alert("<dict:lang value="统计工序不能交叉" />");
				}
			
			$("#crcoStec").find("option[value='SMT']").attr("selected",true);
			$("#crcoStartGroup").find("option[value='']").attr("selected",true);
			$("#crcoEndGroup").find("option[value='']").attr("selected",true);
			$("#crcoStec").trigger("chosen:updated");
			$("#crcoStartGroup").trigger("chosen:updated");
			$("#crcoEndGroup").trigger("chosen:updated");
        }
        
      	function getAllRoute(){
			if($("#route_list_cb").attr("checked")=="checked"){
				$("#addRoutelist :checkbox").attr("checked",true);
			}else{
				$("#addRoutelist :checkbox").each(function(){
					$(this).attr("checked",false);
				});
			}
		}
        
        function delRouteRow(){
        	$("#addRoutelist :checkbox").each(function(){
				if($(this).attr("checked")){
					var trid = $(this).parent().parent().attr("id");
					$("#"+trid).remove();
					$("#crcoStec_"+trid).remove();
					$("#crcoStartGroup_"+trid).remove();
					$("#crcoEndGroup_"+trid).remove();
				}
			});
			$("#route_list_cb").attr("checked",false);
        }
        
        function getRouteCount(){
        	var routeCountArray = [];
        	var crcoStecStr = document.getElementsByName("crcoStec_s");
        	var crcoStartGroupStr = document.getElementsByName("crcoStartGroup_s");
        	var crcoEndGroupStr = document.getElementsByName("crcoEndGroup_s");
        	for ( var i = 0; i < crcoStecStr.length; i++) {
				routeCountArray.push({
					CrcoStecCount: crcoStecStr[i].value,
					CrcoStartGroupCount: crcoStartGroupStr[i].value,
					CrcoEndGroupCount: crcoEndGroupStr[i].value
				});
			}
				return JSON.stringify(routeCountArray);
        }
        
        
        </script>
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
			width: 30%;
			height: 34%;
			padding: 10px;
			border: 1px solid #cbe9ff;
			background-color: #f8fcff;
			z-index: 1002;
			overflow: auto;
		}
				.extend-btn button .ico-kl-new-add{
				 width: 15px;
				 height: 15px;
				 margin-right: 5px;
				 margin-bottom: 3px; 
				 background: url(${path}plf/page/fp/img/ico-kl.png) no-repeat; 
				}
				.extend-btn button:hover .ico-kl-new-add{
				 width: 15px;
				 height: 15px;
				 margin-right: 5px;
				 margin-bottom: 3px; 
				 background: url(${path}plf/page/fp/img/ico-kl-h.png) no-repeat; 
				}
				.extend-btn button .ico-sc-new-add{
				 width: 15px;
				 height: 15px;
				 margin-right: 5px;
				 margin-bottom: 3px; 
				 background: url(${path}plf/page/fp/img/ico-sc.png) no-repeat; 
				}
				.extend-btn button:hover .ico-sc-new-add{
				 width: 15px;
				 height: 15px;
				 margin-right: 5px;
				 margin-bottom: 3px; 
				 background: url(${path}plf/page/fp/img/ico-sc-h.png) no-repeat; 
				}
				.section{
					width:280px;
				}
	</style>
</head>
<body>
  <div class="mod" style="margin-top: 37px;">
	<div class="dlist">
			    	<div class="optn">
			    	        <button type="button" onclick="editRoute();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    	</div>
			<div class="bd" id="bd" style="padding:10px 20px;">
					<form id="editForm" name="editForm" action="${path}buss/bussModel_editComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
								<input type="hidden" name="exeid" value="${exeid}">
								<input type="hidden" name="definedMsg" value="${definedMsg}">
								<input type="hidden" id="group_falg" value="">
								<input type="hidden" id="line_falg" value="">
								<input type="hidden" name="formId" value="${formId}">
								<input type="hidden" name="dataId" id="dataId" value="${dataId}">
								<input type="hidden" id="MO_OUTPUT_S" value="">
								<input type="hidden" id="MO_INPUT_S" value="">
								<input type="hidden" id="PO_OUTPUT_S" value="">
								<input type="hidden" id="PO_INPUT_S" value="">
										<table class="func_table">
											
										</table>
								
										<table id="select_id" style="display: none;">
											
										</table>		
		<bu:set name="paraMapObj" value="${dataId}" formId="4930de89023b451385f973aed9882309" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="4930de89023b451385f973aed9882309" />
	<input type="hidden" name="4930de89023b451385f973aed9882309" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'ec6e4b847ce44f7387e3484d57502f30'" />
		<s:set name="_$formId_1" value="'4930de89023b451385f973aed9882309'" />
		<s:set name="_$type" value="'edit'" />
		<tr>	
			<td style="text-align: right;line-height: 25px;width: 8%;"/>
				<div class="section">
					<span class="dot">*</span><bu:uitn colNo="CR_ROUTE_ID" formId="4930de89023b451385f973aed9882309" />
					<bu:ui colNo="CR_ROUTE_ID" formId="4930de89023b451385f973aed9882309" dataId="${dataId}" formIndex="1" style="width: 200px;" disabled="disabled" />
				</div>
				
			</td>

			<td style="text-align: right;line-height: 25px;width: 8%;"/>
				<div class="section">
					<span class="dot">*</span><bu:uitn colNo="CR_ROUTE_NAME" formId="4930de89023b451385f973aed9882309" />
					<bu:ui colNo="CR_ROUTE_NAME" formId="4930de89023b451385f973aed9882309" dataId="${dataId}" formIndex="1" style="width: 200px;" />
				</div>
				
			
			</td>
			<td style="text-align: right;line-height: 25px;width: 8%;"/>
				<div class="section"  style="text-align:left;">
					<bu:uitn colNo="CR_ROUTE_STEP" formId="4930de89023b451385f973aed9882309" />
					<bu:ui colNo="CR_ROUTE_STEP" formId="4930de89023b451385f973aed9882309" dataId="${dataId}" formIndex="1" style="width: 200px;" />
				</div>
				
			</td>
			
			<td style="text-align: right;line-height: 25px;width: 8%;"/>
				<div class="section" style="text-align:left;">
					<bu:uitn colNo="CR_ROUTE_FLAG" formId="4930de89023b451385f973aed9882309" />
					<bu:ui colNo="CR_ROUTE_FLAG" formId="4930de89023b451385f973aed9882309" dataId="${dataId}" formIndex="1" />
				</div>
				
			
			</td>
			
		</tr>
	</table>
			<bu:jsVal formId="4930de89023b451385f973aed9882309" formIndex="1" />
	<div class="js-tab">
		<DIV id="container">
			<DIV id="hd">
				<UL class="tab-list tab">
					<%-- <LI id="tag1">
		 				<A class="selectli1" onclick="switchTag('tag1','content1','${path}buss/bussModel.ms?exeid=e8381c90ac7143a3b1ec4ac8ac8e91d2');this.blur();" href="javascript:void(0);"> <SPAN class="selectspan1"><dict:lang value="基本信息" /></SPAN> </A>
					</LI> --%>
					<LI id="tag1">
		 				<A class="selectli1" onclick="switchTag('tag1','content1','${path}buss/bussModel.ms?exeid=f72a754bd2af4246a79dd94a1b271a8a');this.blur();" href="javascript:void(0);"> <SPAN ><dict:lang value="流程编辑" /></SPAN> </A>
					</LI>
					<LI id="tag2">
		 				<A class="" onclick="switchTag('tag2','content2','${path}buss/bussModel.ms?exeid=f72a754bd2af4246a79dd94a1b271a8a');this.blur();" href="javascript:void(0);"> <SPAN ><dict:lang value="统计设置" /></SPAN> </A>
					</LI>
				</UL>
			</DIV>
	<!-- tab1 -->	
<DIV class="content1" id="content">	
		<%-- <DIV id="content1" >
	<table class="basic-table" style="width: 50%;">
		<tr><td class="name-three" /><span class="dot">*</span><bu:uitn colNo="CR_ROUTE_ID" formId="4930de89023b451385f973aed9882309" /></td>
			<bu:td cssClass="dec-self" colNo="CR_ROUTE_ID" formId="4930de89023b451385f973aed9882309" ><bu:ui colNo="CR_ROUTE_ID" formId="4930de89023b451385f973aed9882309" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
			<td class="name-three" /><span class="dot">*</span><bu:uitn colNo="CR_ROUTE_NAME" formId="4930de89023b451385f973aed9882309" /></td>
			<bu:td cssClass="dec-self" colNo="CR_ROUTE_NAME" formId="4930de89023b451385f973aed9882309" ><bu:ui colNo="CR_ROUTE_NAME" formId="4930de89023b451385f973aed9882309" dataId="${dataId}" formIndex="1" /></bu:td>
		<tr>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="CR_ROUTE_STEP" formId="4930de89023b451385f973aed9882309" /></td>
			<bu:td cssClass="dec-self" colNo="CR_ROUTE_STEP" formId="4930de89023b451385f973aed9882309" ><bu:ui colNo="CR_ROUTE_STEP" formId="4930de89023b451385f973aed9882309" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="CR_ROUTE_FLAG" formId="4930de89023b451385f973aed9882309" /></td>
			<bu:td cssClass="dec-self" colNo="CR_ROUTE_FLAG" formId="4930de89023b451385f973aed9882309" ><bu:ui colNo="CR_ROUTE_FLAG" formId="4930de89023b451385f973aed9882309" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>	 

		</DIV> --%>
		
			<DIV id="content1">
					<div class="content-container">
						<div id="block1" style="border: 0px solid #00bfff;width: 170px;position: absolute;">
							<fieldset class="x-fieldset">
								<legend><dict:lang value="工序信息" /></legend>
								<div id="left" style="overflow-y: auto;overflow-x: hidden;">
								</div>
							</fieldset>
						</div>
						
				
						<div id="right">
						<fieldset class="x-fieldset">
						<legend><dict:lang value="流程编辑" /></legend>
							<p style="color:#ccc;"><dict:lang value="拖拽到此区域" /></p>
						</fieldset>
						</div>
						<div id="save">
						<fieldset class="x-fieldset">
						<legend><dict:lang value="流程工序属性" /></legend>
							<%-- <div style="margin:10px 0 5px 0;">
								<span id="icon_name"></span><dict:lang value="工序属性" />
								<dict:lang value="工序类型" />：
								<dict:selectDict id="crcGroupType" name="crcGroupType" dictCode="CRC_GROUP_TYPE" style="width:157px;"
											 cssClass="dept_select"/><br/>
								<dict:lang value="工序顺序" />：
								<input type="text" id="paraMap_title" style="margin-top:5px;width:157px;" title="<dict:lang value="工序顺序" />" class="input"/><br/>
								<dict:lang value="工序颜色" />：
								<input type="text" id="paraMap_title" style="margin-top:5px;width:157px;" title="<dict:lang value="工序颜色" />" class="input"/><br/>
								<div style="margin:5px 0 0 0;">
									<dict:lang value="备注" />：
									<textarea rows="5" style="margin-top:5px" id="paraMap_memo" cols="17"></textarea>
								</div>
							</div> --%>
							<!-- <input type="button" id="edit_mode" value="<dict:lang value="编辑模式" />" style="width:70px;" class="botton_img_add" onclick="showCon()" />
							<input type="button" id="finish_edit" value="<dict:lang value="完成编辑" />" style="width:70px;display:none;" class="botton_img_search" onclick="hideCon()" /><br/><br/> -->
							<%-- <input type="button" value="<dict:lang value="提交" />" class="botton_img_add" onclick="saveFlow()" />&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" value="<dict:lang value="清除" />" class="botton_img_search" onclick="reset()" /> --%>
							
							<div id="icon_box" style="margin:5px 0 5px 0; display:none;">
								<%-- <span id="icon_name"></span><dict:lang value="模块属性" />
								<input type="hidden" id="paraMap_icon_id" name="" value=""/>
								<hr style="margin:5px 0 5px -5px;border:none;border-top:1px dotted #00bfff;"> --%>
								<dict:lang value="开始工序" />
									<input type="checkbox" id="groupStart" name="groupStart" value="Y" maxlength="2" onchange="groupstart();"><br/><br/>
								<dict:lang value="工序类型" />
								<dict:selectDict id="paraMap_group_type" name="crcGroupType" dictCode="CRC_GROUP_TYPE" dictValue="0" style="width:157px;"
											 cssClass="dept_select" onchange="groupType();"/><br/>
								<%-- <dict:lang value="工序颜色" />：
								<input type="text" id="paraMap_group_color" name="" value="" readOnly class="input_sh" disabled="disabled"/> --%>
							</div>
							<div id="color_box" style="margin:5px 0 5px 0; display:none;">
								<dict:lang value="线" /><span id="line_name"></span><dict:lang value="属性" />
								<input type="hidden" id="paraMap_line_id" name="" value=""/>
								<hr style="margin:5px 0 5px -5px;border:none;border-top:1px dotted #00bfff;">
								<dict:lang value="颜色" />：
								<input type="text" id="paraMap_line_color" name="" value="" readOnly class="input" style="width:89px;"/><br/><br/>
								<dict:lang value="宽度" />：
								<input type="text" id="paraMap_line_width" name="" value="" class="input" style="width:131px;"/><br/><br/>
								<!-- <dict:lang value="关联关系" />：
									<input type="checkbox" id="paraMap_connection" name="paraMap_connection" value="Y" maxlength="2"><br/>
								<input type="text" id="paraMap_connection" name="" value="" class="input" style="width:157px;"/> -->
							</div>
							<br/><br/>
							<input type="hidden" id="colorPickerCancle" name="" value="<dict:lang value="取消" />"/>
							<input type="hidden" id="colorPickerChoose" name="" value="<dict:lang value="选择" />"/>
							<input type="hidden" id="colorPickerLineWidthMsg" name="" value="<dict:lang value="请输入大于零的整数!" />"/>
							<input type="hidden" id="togglePaletteMoreText" name="" value="<dict:lang value="更多" />"/>
							<input type="hidden" id="togglePaletteLessText" name="" value="<dict:lang value="收缩" />"/>
							<input type="hidden" id="iconFontSize" name="" value="<dict:lang value="最多只能8个汉字"/>"/>
						</div>
					</fieldset>	
					</div>
			</DIV>
		</DIV>
	<!-- tab3 -->		
<DIV id="content2"  style="display:none">
		<div class="mod-hd" style="width: 50%;margin-top: 1px;">		
		   <h3 class="tit"><dict:lang value="工序统计" /></h3>	
		</div>
	<table class="basic-table" style="margin-top:5px;">
		<tr><td style="text-align: right;line-height: 25px;width: 10%;"/><bu:uitn colNo="CR_MO_INPUT" formId="4930de89023b451385f973aed9882309" /></td>
			<bu:td style="padding-left: 5px;position: relative;width: 15%;" colNo="CR_MO_INPUT" formId="4930de89023b451385f973aed9882309" ><bu:ui colNo="CR_MO_INPUT" formId="4930de89023b451385f973aed9882309" dataId="${dataId}" formIndex="1" onchange="compareMO();" /></bu:td>
		 	<td style="text-align: right;line-height: 25px;width: 11%;"/><bu:uitn colNo="CR_MO_OUTPUT" formId="4930de89023b451385f973aed9882309" /></td>
			<bu:td style="padding-left: 5px;position: relative;" colNo="CR_MO_OUTPUT" formId="4930de89023b451385f973aed9882309" ><bu:ui colNo="CR_MO_OUTPUT" formId="4930de89023b451385f973aed9882309" dataId="${dataId}" formIndex="1" onchange="compareMO();" /></bu:td>
			
			<%-- <td class="name" /><bu:uitn colNo="CR_MO_INPUT" formId="4930de89023b451385f973aed9882309" /></td>
			<td class="dec"><select id="paraMapObj_CR_MO_INPUT" name="paraMapObj.CR_MO_INPUT" style="width: 234px;" class="dept_select">
								<option value=''>--请选择--</option></select></td>
			<td class="name" /><bu:uitn colNo="CR_MO_OUTPUT" formId="4930de89023b451385f973aed9882309" /></td>
			<td class="dec">
			<select id="paraMapObj_CR_MO_OUTPUT" name="paraMapObj.CR_MO_OUTPUT" style="width: 234px;" class="dept_select">
								<option value=''>--请选择--</option></select></td>
 --%>
		</tr>
		<tr>
			<%-- <td class="name" /><bu:uitn colNo="CR_PO_INPUT" formId="4930de89023b451385f973aed9882309" /></td>
			<td class="dec"><select id="paraMapObj_CR_PO_INPUT" name="paraMapObj.CR_PO_INPUT" style="width: 234px;" class="dept_select">
								<option value=''>--请选择--</option></select></td>
			<td class="name" /><bu:uitn colNo="CR_PO_OUTPUT" formId="4930de89023b451385f973aed9882309" /></td>
			<td class="dec"><select id="paraMapObj_CR_PO_OUTPUT" name="paraMapObj.CR_PO_OUTPUT" style="width: 234px;" class="dept_select">
								<option value=''>--请选择--</option></select></td> --%>
			<td style="text-align: right;line-height: 25px;width: 10%;"/><bu:uitn colNo="CR_PO_INPUT" formId="4930de89023b451385f973aed9882309" /></td>
			<bu:td style="padding-left: 5px;position: relative;width: 15%;" colNo="CR_PO_INPUT" formId="4930de89023b451385f973aed9882309" ><bu:ui colNo="CR_PO_INPUT" formId="4930de89023b451385f973aed9882309" dataId="${dataId}" formIndex="1" onchange="comparePO();" /></bu:td>
			<td style="text-align: right;line-height: 25px;width: 11%;"/><bu:uitn colNo="CR_PO_OUTPUT" formId="4930de89023b451385f973aed9882309" /></td>
			<bu:td style="padding-left: 5px;position: relative;" colNo="CR_PO_OUTPUT" formId="4930de89023b451385f973aed9882309" ><bu:ui colNo="CR_PO_OUTPUT" formId="4930de89023b451385f973aed9882309" dataId="${dataId}" formIndex="1" onchange="comparePO();"/></bu:td>
		</tr>
	</table>	
		
				 <div>
					<div id="backi" class="black_overlay"/></div>
						<div id="addRoute" class="white_content"><br />
							<div class="optn" style="margin-top: 10px;">
					        	<button type="button" onclick="addRoute('addRoute','backi');"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
					        	<button type="button" onclick="hideDiv('addRoute','backi');"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
					    	</div>
		<div class="mod-hd">		
		   <h3 class="tit"><dict:lang value="阶别统计" /></h3>	
		</div>
							<table class="basic-table" style="width: 100%;">
								
								<tbody id="routeTbody">
									<tr >
										<td style="width: 18%;text-align: right"><span class="dot">*</span><dict:lang value="统计阶别"/></td>
									
										<td class="dec"><dict:selectDict id="crcoStec" name="crcoStec" dictCode="CRCO_STEC" style="width:230px;"
											 cssClass="dept_select"/></td>
									</tr>
									<tr>
										<td style="width: 18%;text-align: right"><span class="dot">*</span><dict:lang value="开始工序"/></td>
										<td class="dec"><select id="crcoStartGroup" name="crcoStartGroup" style="width: 230px;" class="dept_select" onchange="compareEG();">
															<option value=''>--请选择--</option></select></td>
									</tr>
									<tr>
										<td style="width: 18%;text-align: right"><span class="dot">*</span><dict:lang value="结束工序"/></td>
										<td class="dec"><select id="crcoEndGroup" name="crcoEndGroup" style="width: 230px;" class="dept_select" onchange="compareEG();">
															<option value=''>--请选择--</option></select></td>
									</tr>
								</tbody>
								
							</table>
					</div>
	<div style="width: 50%;">
		<div class="mod-hd">		
		   <h3 class="tit"><dict:lang value="阶别统计" /></h3>	
		   <div class="extend-btn" style="float: right;margin-top:15px;">
				<button type="button" onclick="popRouteDiv('addRoute','backi');"><i class="ico ico-kl-new-add ico-small" title="新增"></i></button>
				<button type="button" onclick="delRouteRow();"><i class="ico ico-sc-new-add ico-small" title="删除"></i></button>	        
			</div>
		</div>
		<table class="dlist-table table-line " id="routetb" width="100%;" style="margin-top:5px;">
							<thead>
								<tr class="thcolor">
									<th style="text-align: center;width: 10%;"><input type="checkbox" id="route_list_cb" onchange="getAllRoute();"  /></th >
									<th style="width: 30%;text-align: center;"><dict:lang value="统计阶别" /></th >
									<th style="width: 30%;text-align: center;"><dict:lang value="开始工序" /></th >
									<th style="width: 30%;text-align: center;"><dict:lang value="结束工序" /></th >
								</tr>
							</thead>
							<tbody id="addRoutelist">
							</tbody>
						</table><br/>
	</div>
		</div>
		</DIV>
		
		
			
		</DIV>
	</div>
			
			
									</form>
			</div>
		</div>
	</div>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<script type="text/javascript">
			var parentWindow;
			
			function initHeight(){
		 		$('.dlist #bd').height($(parent.window).height() - 65 -36 - 30); 
		 		$('.dlist #bd').width($(window).width() - 2);
				$('#block1').css('height',$('#bd').height()-102 + 'px');
				$('#left').css('height',$('#bd').height()-122 + 'px');	
				$('#right').css('height',$('#bd').height()-102 + 'px').css('width',$(window).width()-430 + 'px');
				$('#save').css('height',$('#bd').height()-102 + 'px');
			}
			
			$(function(){
				parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow; 
				initHeight();
			});
			
			$(window).resize(function(){
				initHeight();
			});
		var isQuery = false;
		function edit(thisObj){
			if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
			if(!val.valNullData()){
				return ;
			}
			if(!valData()){
				return ;
			}
			if(!val.valOjbsData()){
				return ;
			}
			//解决附件清空时，无法传到后台的问题;解决checkbox清空时，无法传到后台的问题	
			emptyValToHide();
			document.forms.editForm.submit();
			isQuery = true;
		}
		
		function alertInfo(msg){
			isQuery = false;
			utilsFp.alert(msg);
		}
		
		function reloadPg(msg){
			isQuery = false;
			parentWindow.reloadPg(msg);;
		}

		//重置	
		function resetForm(){
			$("#editForm")[0].reset();
		}
				
		var FORM_COL_ID_D=null;
		function getEditRows(tableId,formIndex,formidFirstId,subFormId,subRelColId,relColVal){
			util.showLoading();
			var url ="${path}buss/bussModel_editSubDataAx.ms";
			var addTtable = $('#addTable_'+tableId);
			var tableTrJq = addTtable.find("tbody tr");
			var row_count = tableTrJq.length;
			if(row_count == 0){
				curRowSeq=0;
			}
			var FORM_COL_ID_D = $('#addTable_FORM_COL_ID_D'+tableId).val();// <%-- 该值应该等于subRelColId --%>
		  jQuery.ajax({
				type: "POST",
		    dataType: "json",
		    url: url,
		    data:{'paraMap.FORMID':tableId,'paraMap.formIndex':formIndex,'paraMap.FORM_COL_ID_D':FORM_COL_ID_D,'paraMap.trIndex':curRowSeq,'paraMap.formidFirstId':formidFirstId,'paraMap.subFormId':subFormId,'paraMap.subRelColId':subRelColId,'paraMap.relColVal':relColVal},
				success: function(data){
					util.closeLoading();
					if("" == $("#aaaa").val()){
					$("#aaaa").val(data.ajaxPage.tableData);
					}else{
					$("#bbbb").val(data.ajaxPage.tableData);
					}
					var row = $(data.ajaxPage.tableData);
					_toClickColor(row);// <%-- 行点击着色 --%>
					addTtable.append(row);
					var dataCountObj = $("input[name='paraMap"+formIndex+formSplit+FORM_PAGE_DATA_COUNT_FLAG+"']");
					dataCountObj.val(row_count+ 1);
					curRowSeq=curRowSeq+row.length;
				},
				error: function(XMLHttpRequest, textStatus, errorThrown){
					util.closeLoading();
					var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
					if (null != sessionstatus && sessionstatus == "noAuthority") {
					}else{
						util.alert("error:"+errorThrown);
					}
			   }
			});
		}
		
		function init(){
			if($("#leftTable-kz").length>0){
				$("#leftTable-kz").show();
			}
			
			if($("#leftTable").length>0){
				$("#leftTable").show();
			}
			initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
			/*
			var formIds = $("input[type='hidden'][name='formIds']").val();
			var formIdLs = formIds.split(",");
			for(var i=0,j=formIdLs.length;i<j;i++){
				getEditRows(formIdLs[i],"0");
			}
			*/
		}
		

	<%-- //自定义每个字段的有效性验证方法体(默认入参thisObj为字段的DOM表单对象，title为该字段的名称)
	var maxLen =5;
	if(thisObj.value.length < maxLen ){
		_alertValMsg(thisObj,title + " %{getText("字段长度不能小于")}" + maxLen);
		return false;
	}else{
		return true;
	}
	 --%>

</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
