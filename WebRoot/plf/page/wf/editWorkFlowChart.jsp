<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<html>
<head>
	<title><dict:lang value="工作流" /> <dict:lang value="编辑" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="html5" value="1" />
		<jsp:param name="workFlow" value="1" />
		<jsp:param name="spectrum" value="1" />
	</jsp:include>	        
        <script type="text/javascript">
        var blockIcon;
        var blackConn;
        var id = ""
        var paraMapModel = "<c:out value='${paraMap.model}'/>";
        
         $(function(){

        	 id = "<c:out value='${paraMap.id}'/>";
        	 
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
        		    url: "${path}comm/WorkFlowAction_listWorkFlowChartAx.ms",
        		    data: "paraMap.id="+id,
        			success: function(data){
        					//alert(JSON.stringify(data));
        					//util.alert(data.ajaxMap.nextselectId);
        					util.closeLoading();
        					if(data.ajaxList != null && data.ajaxList != ""){
        						id = data.ajaxList[0].ID;
        						blockIcon = JSON.parse(data.ajaxList[0].BLOCKS_MSG);
        						blackConn = JSON.parse(data.ajaxList[0].CONN_MSG);
        						$("#paraMap_title").val(data.ajaxList[0].TITLE);
        						$("#paraMap_memo").val(data.ajaxList[0].MEMO);
        						initJsPlumb();
        						if(paraMapModel != "view"){
        							showCon();
        						}
        					}
        					
        				},
        			error: function(msg){
        					util.closeLoading();
        					util.alert("error:"+msg);
        			  }
        			});
        	 }
        	 
         });
        
        function saveFlow(){
        	var url = "${path}comm/WorkFlowAction_addWorkFlowChartAx.ms";//
        	var temp = "";
        	if(id != null && id != ""){
        		url = "${path}comm/WorkFlowAction_editWorkFlowChartAx.ms";
        		temp = "&paraMap.id="+id;
        	}
        	if($.trim($("#paraMap_title").val()) == null || $.trim($("#paraMap_title").val()) == ""){
        		util.alert("<dict:lang value="标题不能为空" />");
        		$("#paraMap_title").focus();
        		return false;
        	}else if($("#paraMap_title").val().length > 150){
        		util.alert("<dict:lang value="标题不能大于150个字！" />");
        		$("#paraMap_title").focus();
        		return false;        		
        	}
        	else if($("#paraMap_memo").val().length > 2000){
        		util.alert("<dict:lang value="备注不能大于2000个字！" />");
        		$("#paraMap_memo").focus();
        		return false;        		
        	}

        	 $.ajax({
     			type: "POST",
     		    dataType: "json",
     		    url:url,
     		    data: "paraMap.blocks_msg="+getBlocks()+"&paraMap.conn_msg="+getConn()+"&paraMap.title="+$("#paraMap_title").val()+"&paraMap.memo="+$("#paraMap_memo").val()+temp,
     			success: function(data){
     					util.closeLoading();
     					if(data.ajaxMap != null && data.ajaxMap != ""){
							if(data.ajaxMap.msg == "1"){
								alert("<dict:lang value="操作成功！" />");
								if(data.ajaxMap.id != null && data.ajaxMap.id != "" && data.ajaxMap.id != undefined){
									var newUrl = "${path}comm/WorkFlowAction_forEditWorkFlowChart.ms?paraMap.id="+data.ajaxMap.id;
									window.location.href = newUrl;
								}
							}else{
								util.alert("<dict:lang value="操作失败：" />:"+data.ajaxMap.msg);
							}
    						if(window.opener && !window.opener.closed){
    							window.parent.opener.query(window.parent.opener.document.getElementById("searchButtonId"));
    						}							
     					}

     				},
     			error: function(msg){
     					util.closeLoading();
     					util.alert("error:"+msg);
     			  }
     			});			

        }
        </script>
        <script src="${path}plf/js/jsPlumb/workflowchart.js?_mc_res_version=<%=PlfStaticRes.WORKFLOWCHART_JS %>"></script>           
</head>
<body>
	<div class="content-container">
		<div id="left">
			<div class="icon" id="textA"><div class="textA"></div></div>
			<div class="icon" id="xiabanji"><div class="icon_font"><img class="img_cls" src="${path}plf/js/jsPlumb/images/xiabanji.png?_mc_res_version=<%=PlfStaticRes.XIABANJI_PNG %>"/><p><dict:lang value="下板机"/></p></div></div>
			<div class="icon" id="shangbanji"><div class="icon_font"><img class="img_cls" src="${path}plf/js/jsPlumb/images/shangbanji.png?_mc_res_version=<%=PlfStaticRes.SHANGBANJI_PNG%>"/><p><dict:lang value="上板机"/></p></div></div>
			<div class="icon" id="huiliuhan"><div class="icon_font"><img class="img_cls" src="${path}plf/js/jsPlumb/images/huiliuhan.png?_mc_res_version=<%=PlfStaticRes.HUILIUHAN_PNG%>"/><p><dict:lang value="回流焊"/></p></div></div>
			<div class="icon" id="printMachine"><div class="icon_font"><img class="img_cls" src="${path}plf/js/jsPlumb/images/printMachine.png?_mc_res_version=<%=PlfStaticRes.PRINTMACHINE_PNG%>"/><p><dict:lang value="印刷"/></p></div></div>
			<div class="icon" id="AOI"><div class="icon_font"><img class="img_cls" src="${path}plf/js/jsPlumb/images/AOI.png?_mc_res_version=<%=PlfStaticRes.AOI_PNG%>"/><p><dict:lang value="AOI"/></p></div></div>
			<div class="icon" id="tiepian"><div class="icon_font"><img class="img_cls" src="${path}plf/js/jsPlumb/images/tiepian.png?_mc_res_version=<%=PlfStaticRes.TIEPIAN_PNG%>"/><p><dict:lang value="贴片机"/></p></div></div>
			<!-- <div class="icon" id="fushiTiePianNXT"><div class="icon_font"><img class="img_cls" src="${path}plf/js/jsPlumb/images/fushiTiePianNXT.png"/><span><dict:lang value="贴片机 富士NXT"/></span></div></div>
			<div class="icon" id="panasonicTiePianCM"><div class="icon_font"><img class="img_cls" src="${path}plf/js/jsPlumb/images/panasonicTiePianCM.png"/><span><dict:lang value="贴片机 松下CM"/></span></div></div>-->
			<div class="icon" id="repairStation"><div class="icon_font"><img class="img_cls" src="${path}plf/js/jsPlumb/images/repairStation.png?_mc_res_version=<%=PlfStaticRes.REPAIRSTATION_PNG%>"/><p><dict:lang value="维修站"/></p></div></div>
		</div>

		<div id="right">
			<p style="color:#ccc;"><dict:lang value="拖拽到此区域" /></p>
		</div>
		<div id="save">
			<div style="margin:10px 0 5px 0;">
				<dict:lang value="标题" /><span class="Eng">*</span>：
				<input type="text" id="paraMap_title" style="margin-top:5px" title="<dict:lang value="标题" />" class="input_sh"/>
				<div style="margin:5px 0 0 0;">
					<dict:lang value="备注" />：
					<textarea rows="5" style="margin-top:5px" id="paraMap_memo" cols="17"></textarea>
				</div>
			</div>
			<!-- <input type="button" id="edit_mode" value="<dict:lang value="编辑模式" />" style="width:70px;" class="botton_img_add" onclick="showCon()" />
			<input type="button" id="finish_edit" value="<dict:lang value="完成编辑" />" style="width:70px;display:none;" class="botton_img_search" onclick="hideCon()" /><br/><br/> -->
			<input type="button" value="<dict:lang value="提交" />" class="botton_img_add" onclick="saveFlow()" />&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" value="<dict:lang value="清除" />" class="botton_img_search" onclick="reset()" />
			</br></br>
			<div id="color_box" style="margin:5px 0 5px 0; display:none;">
				<dict:lang value="线" /><span id="line_name"></span><dict:lang value="属性" />
				<input type="hidden" id="paraMap_line_id" name="" value=""/>
				<hr style="margin:5px 0 5px -5px;border:none;border-top:1px dotted #00bfff;">
				<dict:lang value="颜色" />：
				<input type="text" id="paraMap_line_color" name="" value="" readOnly class="input_sh"/></br></br>
				<dict:lang value="宽度" />：
				<input type="text" id="paraMap_line_width" name="" value="" class="input_sh"/>
			</div>
			</br></br>
			<div id="icon_box" style="margin:5px 0 5px 0; display:none;">
				<span id="icon_name"></span><dict:lang value="模块属性" />
				<input type="hidden" id="paraMap_icon_id" name="" value=""/>
				<hr style="margin:5px 0 5px -5px;border:none;border-top:1px dotted #00bfff;">
				<dict:lang value="名字方向" />：
				<select id="name_direction">
					<option value="img_cls"><dict:lang value="右" /></option>
					<option value="img_cls_left"><dict:lang value="左" /></option>
					<option value="img_cls_top"><dict:lang value="上" /></option>
					<option value="img_cls_bottom"><dict:lang value="下" /></option>
				</select></br></br>
			</div>
			<input type="hidden" id="colorPickerCancle" name="" value="<dict:lang value="取消" />"/>
			<input type="hidden" id="colorPickerChoose" name="" value="<dict:lang value="选择" />"/>
			<input type="hidden" id="colorPickerLineWidthMsg" name="" value="<dict:lang value="请输入大于零的整数!" />"/>
			<input type="hidden" id="togglePaletteMoreText" name="" value="<dict:lang value="更多" />"/>
			<input type="hidden" id="togglePaletteLessText" name="" value="<dict:lang value="收缩" />"/>
			<input type="hidden" id="iconFontSize" name="" value="<dict:lang value="最多只能8个汉字"/>"/>
		</div>
	</div>
</body>
</html>