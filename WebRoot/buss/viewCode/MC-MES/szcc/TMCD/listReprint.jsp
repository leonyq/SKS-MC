<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
  <%@ include file="/buss/inc_files/inc_dev.jsp"%>
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
	    <script src="${path}plf/page/mlabel/page/labelDesigner/js/jscolor.js"></script>
    <script src="${path}plf/page/mlabel/page/labelDesigner/js/colpick.js"></script>
    <script src="${path}plf/page/mlabel/page/labelDesigner/js/topo.js?version=<%=PRINT_TOPO_JS%>"></script>
	<script type="text/javascript" src="${path}plf/page/mlabel/page/labelDesigner/js/jtopo-min1.js"></script>
	<script src="${path}plf/page/mlabel/page/labelDesigner/js/toHex.js"></script>
	<script src="${path}plf/page/mlabel/page/labelDesigner/js/spectrum.js"></script>
	<script src="${path}plf/page/mlabel/page/labelDesigner/js/businessTopo.js?version=<%=PRINT_BUSINESSTOPO_JS%>"></script>
	<script language="javascript" src="${path}plf/page/mlabel/page/labelDesigner/js/morePrint.js"></script>
	<script src="http://localhost:18000/CLodopfuncs.js?priority=0"></script>
    <script src="http://localhost:8000/CLodopfuncs.js?priority=1"></script>
     <object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>
	<!-- head里面 -->
	<script type="text/javascript">
		
		function getWmsSel() {
		var getWmsSelUrl="${path}buss/bussModel_exeFunc.ms?funcMId=ebfaa86092be4dba8f5720a2d5cda7c2";
			$.ajax({
				type: "POST",
				async:false,
				dataType: "json",
				url: getWmsSelUrl,
				data: "",
				success: function(data) {
					
					$("#paraMap1_WRC_TEMPLATE_ID").empty();
					//wmsOption = "<option value=''>--请选择--</option>";
					$("#paraMap1_WRC_TEMPLATE_ID").append("<option value=''>--请选择--</option>");
					if(null == data) { return; }
					if(null != data.ajaxList) {
						var rccList = eval(data.ajaxList);
						for(var i = 0; i < rccList.length; i++) {	
                            if(rccList[i].LABEL_ID == null) rccList[i].LABEL_ID = "";
    						if(rccList[i].LABEL_NAME == null) rccList[i].LABEL_NAME = "";
    						if(rccList[i].LABELCSS == null) rccList[i].LABELCSS = "";
							//wmsOption = wmsOption + "<option value='" + rccList[i].LABEL_ID + "'><input type='hidden' id='"+rccList[i].LABEL_ID+"' value='"+rccList[i].LABELCSS+"'/>" + rccList[i].LABEL_NAME + "</option>";
						
						    $("#paraMap1_WRC_TEMPLATE_ID").append("<option value='" + rccList[i].LABEL_ID + "' labelCss='"+rccList[i].LABELCSS+"'>" + rccList[i].LABEL_NAME + "</option>");
						}
						$("#paraMap1_WRC_TEMPLATE_ID").trigger("chosen:updated");
						mySetChosen();
						$("paraMap1_WRC_TEMPLATE_ID").attr("style","width:200px;");
					}
					
				},
				error: function(msg) {
				    if(msg.readyState!=0){	
    					util.closeLoading();
    					utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "300", "");	
                    }
				}
			});
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
        		if(item.id!=""&&item.id.indexOf("#")<0){
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
	<!-- 产品静态资源 -->

	
</head>
<body>
	<div style="display: none;width: 100%">
		<iframe id="iframeHtml" src="${path}buss/bussModel.ms?exeid=03eace6e392f403398c843b5a2e4e158"></iframe>
	</div>
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
			    	<!--<button type="button" onclick="autoPrintInfo();"><i class="ico ico-save"></i><dict:lang value="自动打印" /></button>
			        <button type="button" onclick="loadInfo();"><i class="ico ico-save"></i><dict:lang value="加载" /></button>-->
			        <button type="button" onclick="loadListInfo();"><i class="ico ico-save"></i><dict:lang value="预览" /></button>
			        <button type="button" onclick="saveInfo();"><i class="ico ico-save"></i><dict:lang value="打印" /></button>
			    </div>
			   
			</div>
			<div class="bd" style="height:400px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="fd43d63021be4eadb08e73d0ac80b243" type="add" />
	<div class="scroll3" style="width:440px;height:344px;display:inline-block;margin-top: 10px;">
	    
	    <div class="name"  style="float:left;width:30px;text-align:right;"><dict:lang value="模板" /></div>
	    <div style="width:400px; height: 250px;border: 1px solid #ccc;float:left;margin-left: 5px;margin-bottom: 12px;" id="canvasDiv">
	       <canvas   id="canvas" width=400; height=250></canvas>
    	</div>
    	
    	<table class="basic-table" style="margin-top:3px;width:440px;">
    	    <tr style="display:none;">
    			<td class="name"  style="width:65px;"/><bu:uitn colNo="WRC_ITEM_CODE" formId="fd43d63021be4eadb08e73d0ac80b243" /></td>
    			<bu:td cssClass="dec"	 style="width:230px;" colNo="WRC_ITEM_CODE" formId="fd43d63021be4eadb08e73d0ac80b243" ><bu:ui colNo="WRC_ITEM_CODE" disabled="disabled" formId="fd43d63021be4eadb08e73d0ac80b243" value="%{WRC_ITEM_CODE}" formIndex="1" /></bu:td>
    		    <td>&nbsp;</td>
    		</tr>
    	    <tr>
    			<td class="name" style="width:30px;padding:0;vertical-align: top;"/><dict:lang value="备注" /></td><!--<bu:uitn colNo="WRC_MEMO" formId="fd43d63021be4eadb08e73d0ac80b243" />-->
    			<bu:td cssClass="dec" style="padding:0" colNo="WRC_MEMO" formId="fd43d63021be4eadb08e73d0ac80b243" >
    			    <bu:ui colNo="WRC_MEMO"  style="height:80px;width:402px;margin-left:5px;" formId="fd43d63021be4eadb08e73d0ac80b243" value="%{WRC_MEMO}" formIndex="1" />	
                </bu:td>
            </tr>
    	</table>
	</div>
	
	<div style="height:352px;display:inline-block;width:290px;float:right;">
	<table class="basic-table" style="">
	    <s:set name="_$viewId" value="'713456b3b70d40da8b171c99d14f0460'" />
		<s:set name="_$formId_1" value="'fd43d63021be4eadb08e73d0ac80b243'" />
		<s:set name="_$type" value="'add'" />
		<tr>
      <td class="name" /><bu:uitn colNo="WRC_AUTO_FLAG" formId="fd43d63021be4eadb08e73d0ac80b243" /></td>
      <bu:td cssClass="dec" colNo="WRC_AUTO_FLAG" formId="fd43d63021be4eadb08e73d0ac80b243" >
          <bu:ui colNo="WRC_AUTO_FLAG" formId="fd43d63021be4eadb08e73d0ac80b243" value="%{WRC_AUTO_FLAG}" formIndex="1" />
          &nbsp;
            </bu:td>
        <td class="name" />分页带表头</td>
      <bu:td cssClass="dec" colNo="WRC_AUTO_FLAG" formId="fd43d63021be4eadb08e73d0ac80b243" >
          <bu:ui colNo="WRC_AUTO_FLAG" name="titleFlag" id="titleFlag" formId="fd43d63021be4eadb08e73d0ac80b243" value="%{WRC_AUTO_FLAG}" formIndex="1" />
      &nbsp;&nbsp;&nbsp;页码打印
          <bu:ui colNo="WRC_AUTO_FLAG" formId="fd43d63021be4eadb08e73d0ac80b243" value="%{WRC_AUTO_FLAG}" formIndex="1" id="numPrint"  />
      </bu:td>
      
    </tr>
		
	    <td class="name" style="width:75px;"/><span class="dot">*</span><span><dict:lang value="条码模板" /></span></td>
		<bu:td cssClass="dec" style="width:200px;" colspan="3" colNo="WRC_TEMPLATE_ID" formId="fd43d63021be4eadb08e73d0ac80b243" ><bu:ui style="width:200px;" colNo="WRC_TEMPLATE_ID" formId="fd43d63021be4eadb08e73d0ac80b243" value="%{WRC_TEMPLATE_ID}" formIndex="1" /></bu:td>
		<td >&nbsp;</td>
		
	</table>
	<table class="basic-table scroll" style="width:290px;height: 282px;display: inline-block;" id="itemTable">
	<input type="hidden" id ="curUser" name="curUser" value=<s:property value='%{#session[@com.more.fw.core.common.method.Constants@SESSION_USERDTO_KEY].name}'/>
	<input type="hidden" name="formIds" value="fd43d63021be4eadb08e73d0ac80b243" />
	<input type="hidden" name="fd43d63021be4eadb08e73d0ac80b243" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" id="itemSn" name="itemSn" value="" />
	<input type="hidden" id="itemCode" name="itemCode" value="" />
	<input type="hidden" id="itemNum" name="itemNum" value="0" />
	<input type="hidden" id="addType" name="addType" value="" />
	<input type="hidden" id="labelId" name="labelId" value="" />
		<s:set name="_$viewId" value="'713456b3b70d40da8b171c99d14f0460'" />
		<s:set name="_$formId_1" value="'fd43d63021be4eadb08e73d0ac80b243'" />
		<s:set name="_$type" value="'add'" />
		<tr style="display:none;">
		    <td class="name" style="width:75px;"/><span class="dot">*</span><span><dict:lang value="输入SN" /></span></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="WRC_NEW_SN" formId="fd43d63021be4eadb08e73d0ac80b243" ></bu:td>
    		<td style="width:20px;">&nbsp;</td>
		</tr>
				
		
	</table>
	<div id="resDiv" style="height:30px">
	    <span style="display:inline-block;width:100px;height:30px;background-color:green;color:white;border-radius:5px;text-align:center;line-height:30px;display:none;">打印成功</span>
	</div>
	</div>
	<!----------------------------------------------------------------------------------------------------------------------------->
	<!--<div style="width:423px;height:420px;display:inline-block;">
	    <div style="width:403px; height: 250px;border: 1px solid #ccc;	display:inline-block; float:right;margin-top:8px;" id="canvasDiv">
	       <canvas   id="canvas" width=400; height=250></canvas>
    	</div>
    	<table class="basic-table" style="margin-top:3px;width:423px;">
    	    <tr style="display:none;">
    			<td class="name"  style="width:65px;"/><bu:uitn colNo="WRC_ITEM_CODE" formId="fd43d63021be4eadb08e73d0ac80b243" /></td>
    			<bu:td cssClass="dec"	 style="width:230px;" colNo="WRC_ITEM_CODE" formId="fd43d63021be4eadb08e73d0ac80b243" ><bu:ui colNo="WRC_ITEM_CODE" disabled="disabled" formId="fd43d63021be4eadb08e73d0ac80b243" value="%{WRC_ITEM_CODE}" formIndex="1" /></bu:td>
    		    <td>&nbsp;</td>
    		</tr>
    	    <tr>
    			<td class="name"  style="width:10px;"/><bu:uitn colNo="WRC_MEMO" formId="fd43d63021be4eadb08e73d0ac80b243" /></td>
    			<bu:td cssClass="dec"  colspan="3" colNo="WRC_MEMO" formId="fd43d63021be4eadb08e73d0ac80b243" ><bu:ui colNo="WRC_MEMO"  style="height:80px;" formId="fd43d63021be4eadb08e73d0ac80b243" value="%{WRC_MEMO}" formIndex="1" /></bu:td>
            </tr>
    	</table>
	</div>-->
	<!----------------------------------------------------------------------------------------------------------------------------->
	
    <!-- <div style="width:535px; height: 305px;border: 1px solid #ccc;	display:inline-block; float:right;margin-top:8px;">
	 <canvas   id="canvas" width=535; height=305></canvas>
	</div>
	<table class="basic-table" style="margin-top:3px;">
	    <tr style="display:none;">
			<td class="name"  style="width:65px;"/><bu:uitn colNo="WRC_ITEM_CODE" formId="fd43d63021be4eadb08e73d0ac80b243" /></td>
			<bu:td cssClass="dec"	 style="width:230px;" colNo="WRC_ITEM_CODE" formId="fd43d63021be4eadb08e73d0ac80b243" ><bu:ui colNo="WRC_ITEM_CODE" disabled="disabled" formId="fd43d63021be4eadb08e73d0ac80b243" value="%{WRC_ITEM_CODE}" formIndex="1" /></bu:td>
		    <td>&nbsp;</td>
		</tr>
	    <tr>
			<td class="name"  style="width:105px;"/><bu:uitn colNo="WRC_MEMO" formId="fd43d63021be4eadb08e73d0ac80b243" /></td>
			<bu:td cssClass="dec"  colspan="3" colNo="WRC_MEMO" formId="fd43d63021be4eadb08e73d0ac80b243" ><bu:ui colNo="WRC_MEMO"  style="height:80px;" formId="fd43d63021be4eadb08e73d0ac80b243" value="%{WRC_MEMO}" formIndex="1" /></bu:td>
        </tr>
	</table>-->
	<!--<div style="width: 540px; height: 360px;display: inline-block;margin-bottom:5px;border: 1px solid #ccc;">
	     条码模板 
	</div>-->
			<bu:jsVal formId="fd43d63021be4eadb08e73d0ac80b243" formIndex="1" />
				
			</div>
		 </form>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script type="text/javascript">
        var printTempleCode=1;
		localStorage.printTempleCode=1;
        localStorage.printStatus=1;
        var LABELCSS="";
        var labelIdStr="";
        var listSource;
        var timeInterval;
        var validateType;
        var localLabelId="";
        
	    $(function() {
	        $("#numPrint_1").attr("checked","checked");
	       	initContext();//初始化内容
			$("#paraMap1_WRC_REPRINT_EMP").val($("#curUser").val());
            $("#paraMap1_WRC_NEW_SN").attr("placeholder","请输入输入SN,按Enter键");
            
            getWmsSel();
            localLabelId=localStorage.getItem("LOCAL_LABLE_ID3");
            if(localLabelId!=null && localLabelId!=""){
                $("#paraMap1_WRC_TEMPLATE_ID").val(localLabelId);
                $("#paraMap1_WRC_TEMPLATE_ID").trigger("chosen:updated");
                LABELCSS=$("#paraMap1_WRC_TEMPLATE_ID").find("option:selected").attr("LABELCSS");
                labelIdStr=localLabelId;
                showObjectInfo(LABELCSS);
                loadLabelInfo(localLabelId);
            }
		})
		
		$("#paraMap1_WRC_TEMPLATE_ID").change(function(){
			$("#resDiv").html("");
		    getSNInfoFlag=false;
    	    var labelId=$(this).val();
    	    localStorage.setItem("LOCAL_LABLE_ID3",labelId);
    	    $("#labelId").val(labelId);
    	    labelIdStr=labelId;
    	    LABELCSS=$(this).find("option:selected").attr("LABELCSS");
    	    //showObjectInfo(LABELCSS);
    	    if(labelIdStr==""){
    	    	$("#itemTable tbody").empty();
    	    	showObjectInfo(LABELCSS);
    	    }else{
    	    	showObjectInfo(LABELCSS);
    	    	changeCanvasWidth();
    	    	loadLabelInfo(labelId);
    	    }
    	});
    	function loadLabelInfo(labelId){
    	    util.showLoading("处理中...");
    	    //$("#itemTable tbody").empty();
			var getItemUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=726db88c12b5498bbba83d7a1548cdd4&formId=%{formId}";
				console.log(labelId);
			var jsondata={"labelId":labelId};
			$.ajax({
				type: "POST",
				dataType: "json",
				url: getItemUrl,
				data: jsondata,
				success: function(data) {
				
				    $("#itemTable tbody").empty();
					util.closeLoading();
					var dataMap=data.ajaxMap;
					
					if(null != data.ajaxList) {
					    	
						var rccList = eval(data.ajaxList);
						if(labelId!=""){
						    $("#itemTable tbody:last").append("<tr></tr>");
    						$("#itemTable tr:last").append("<td class='name' style='width:75px;'><span class='dot'>*</span>输入SN</td>	");
    						$("#itemTable tr:last").append("<td  class='name' style='width:65px;display:none;'/><span class='dot'>*</span></td>");
    						$("#itemTable tr:last").append("<td class='dec' style='width:200px;'><textarea style='width:200px;height:80px;' class=' input isSubmit  _VAL_OjbsData ' id='WRC_NEW_SN' placeholder='请输入输入SN,按Enter键' onkeydown='getItemInfo(event);'></textarea></td>");
						
							$("#itemTable tr:last").append("<td>&nbsp;</td>	");
							for(var i = 0; i < rccList.length; i++) {
								if(rccList[i].DATA_ITEMS_NAME == null) rccList[i].DATA_ITEMS_NAME = "";
								if(rccList[i].DATA_ITEMS_ALIAS == null) rccList[i].DATA_ITEMS_ALIAS = "";
								$("#itemTable tbody:last").append("<tr></tr>");
								$("#itemTable tr:last").append("<td class='name' style='width:105px;display:none;'>"+rccList[i].DATA_ITEMS_ALIAS+"</td>	");
								$("#itemTable tr:last").append("<td class='name' style='width:75px;'>"+rccList[i].DATA_ITEMS_NAME+"</td>	");
								$("#itemTable tr:last").append("<td  class='name' style='width:0px;display:none;'/><dict:lang value='"+rccList[i].DATA_ITEMS_NAME+"' /></td>");//onchange oninput event
								$("#itemTable tr:last").append("<td class='dec' style='width:200px;'><input style='width:200px;' class=' input isSubmit  _VAL_OjbsData '   oninput='OnInput(event)'  id='"+rccList[i].DATA_ITEMS_ALIAS+"' /></td>");
							    $("#itemTable tr:last").append("<td class='dec' style='width:200px;display:none;'><input style='width:200px;' class=' input isSubmit  _VAL_OjbsData ' id='' style='display:none;' value='"+rccList[i].DATA_ITEMS_NAME+"' /></td>");
							    $("#itemTable tr:last").append("<td>&nbsp;</td>	");
							    //var inputId="#"+rccList[i].CLD_COLUMN_NAME;
							    //$(inputId).bind('input propertychange', function() {  
             						//OnInput();
            					//}); 
							}
						
							console.log(data.ajaxMap);
							if(dataMap.CLASS_ONE_LABEL_ID == null) dataMap.CLASS_ONE_LABEL_ID = "";
    						if(dataMap.CLASS_ONE_LABEL_ITEM == null) dataMap.CLASS_ONE_LABEL_ITEM = "";
    						if(dataMap.CLASS_TWO_LABEL_ID == null) dataMap.CLASS_TWO_LABEL_ID = "";
    						if(dataMap.CLASS_TWO_LABEL_ITEM == null) dataMap.CLASS_TWO_LABEL_ITEM = "";
    						if(dataMap.CLASS_THREE_LABEL_ID == null) dataMap.CLASS_THREE_LABEL_ID = "";
    						if(dataMap.CLASS_THREE_LABEL_ITEM == null) dataMap.CLASS_THREE_LABEL_ITEM = "";
    						if(dataMap.CLASS_ONE_LABEL_ID!="" && dataMap.CLASS_ONE_LABEL_ITEM!=""){
    						    $("#itemTable tbody:last").append("<tr></tr>");
    							$("#itemTable tr:last").append("<td class='name' style='width:105px;display:none;'>F001</td>	");
    							$("#itemTable tr:last").append("<td class='name' style='width:75px;'>"+dataMap.CLASS_ONE_LABEL_ITEM+"</td>	");
    							$("#itemTable tr:last").append("<td  class='name' style='width:0px;display:none;'/><dict:lang value='"+dataMap.CLASS_ONE_LABEL_ITEM+"' /></td>");//onchange oninput event
    							$("#itemTable tr:last").append("<td class='dec' style='width:200px;'><input style='width:200px;' class=' input isSubmit  _VAL_OjbsData '   oninput='OnInput(event)'  id='F001' /></td>");
    						    $("#itemTable tr:last").append("<td class='dec' style='width:200px;display:none;'><input style='width:200px;' class=' input isSubmit  _VAL_OjbsData ' id='' style='display:none;' value='"+dataMap.CLASS_ONE_LABEL_ITEM+"' /></td>");
    						    $("#itemTable tr:last").append("<td>&nbsp;</td>	");
    						}
    						if(dataMap.CLASS_TWO_LABEL_ID!="" && dataMap.CLASS_TWO_LABEL_ITEM!=""){
    						    $("#itemTable tbody:last").append("<tr></tr>");
    							$("#itemTable tr:last").append("<td class='name' style='width:105px;display:none;'>F002</td>	");
    							$("#itemTable tr:last").append("<td class='name' style='width:75px;'>"+dataMap.CLASS_TWO_LABEL_ITEM+"</td>	");
    							$("#itemTable tr:last").append("<td  class='name' style='width:0px;display:none;'/><dict:lang value='"+dataMap.CLASS_TWO_LABEL_ITEM+"' /></td>");//onchange oninput event
    							$("#itemTable tr:last").append("<td class='dec' style='width:200px;'><input style='width:200px;' class=' input isSubmit  _VAL_OjbsData '   oninput='OnInput(event)'  id='F002' /></td>");
    						    $("#itemTable tr:last").append("<td class='dec' style='width:200px;display:none;'><input style='width:200px;' class=' input isSubmit  _VAL_OjbsData ' id='' style='display:none;' value='"+dataMap.CLASS_TWO_LABEL_ITEM+"' /></td>");
    						    $("#itemTable tr:last").append("<td>&nbsp;</td>	");
    						}
    						if(dataMap.CLASS_THREE_LABEL_ID!="" && dataMap.CLASS_THREE_LABEL_ITEM!=""){
    						    $("#itemTable tbody:last").append("<tr></tr>");
    							$("#itemTable tr:last").append("<td class='name' style='width:105px;display:none;'>F003</td>	");
    							$("#itemTable tr:last").append("<td class='name' style='width:75px;'>"+dataMap.CLASS_THREE_LABEL_ITEM+"</td>	");
    							$("#itemTable tr:last").append("<td  class='name' style='width:0px;display:none;'/><dict:lang value='"+dataMap.CLASS_THREE_LABEL_ITEM+"' /></td>");//onchange oninput event
    							$("#itemTable tr:last").append("<td class='dec' style='width:200px;'><input style='width:200px;' class=' input isSubmit  _VAL_OjbsData '   oninput='OnInput(event)'  id='F003' /></td>");
    						    $("#itemTable tr:last").append("<td class='dec' style='width:200px;display:none;'><input style='width:200px;' class=' input isSubmit  _VAL_OjbsData ' id='' style='display:none;' value='"+dataMap.CLASS_THREE_LABEL_ITEM+"' /></td>");
    						    $("#itemTable tr:last").append("<td>&nbsp;</td>	");
    						}
						}
					}
				},
				error: function(msg) {
				    if(msg.readyState!=0){	
					util.closeLoading();
					utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "300", "");	
                    					}
				}
			});
    	}
    	var getSNInfoFlag=false;
    	$("#WRC_NEW_SN").keyup(function(){
    		textAlignDetail();
    	});
    	//$("#WRC_NEW_SN").keydown(function(event){
    	function getItemInfo(event){
　　　　		if(event.keyCode == 13){
　　　　　　		var itemSn = $("#WRC_NEW_SN").val();
　　　　　　		$("#itemSn").val(itemSn);
　　　　　　		var jsondata={"itemSn":""+itemSn+"","labelId":labelIdStr};
　　　　　　		if(itemSn!=""){
　　　　　　		    var url="${path}buss/bussModel_exeFunc.ms?funcMId=481a5dcb612c447ba891eea9c16f4e51&formId=%{formId}&type=3";
    			        jQuery.ajax({
    			 			type: "POST",
    			 	   		dataType: "json",
    			 	    	url: url,
    			 	    	data:jsondata,
    			 			success: function(data){
    			 			    
    			 				var dataMap=data.ajaxMap;
    			 				var dataStr=data.ajaxString;
    			 				var rccList = eval(data.ajaxList);
    			 				//console.log(dataStr);
    			 				
    			 				
    			 				if(dataStr=="ERROR"){
    			 				    utilsFp.confirmIcon(3,"","","", "未知错误",0,"","");
    			 				    if($("#paraMap1_WRC_AUTO_FLAG_1").is(":checked")){
	                                    $("#resDiv").html("");
	               						$("#resDiv").append("<span style='display:inline-block;width:100px;height:30px;background-color:red;color:white;border-radius:5px;text-align:center;line-height:30px;'>打印失败</span>");
	                                }
    			 				    return;
    			 				}else if(dataStr=="FALSE"){
    			 				    utilsFp.confirmIcon(3,"","","", "输入SN不存在,请更换",0,"","");
    			 				    $("#WRC_NEW_SN").val("");
    			 				    
                                    $("#WRC_NEW_SN").focus();
                                    loadLabelInfo(labelIdStr);
                                    showObjectInfo(LABELCSS);
                                    if($("#paraMap1_WRC_AUTO_FLAG_1").is(":checked")){
	                                    $("#resDiv").html("");
	               						$("#resDiv").append("<span style='display:inline-block;width:100px;height:30px;background-color:red;color:white;border-radius:5px;text-align:center;line-height:30px;'>打印失败</span>");
	                                }
                                    return;
    			 				}else if(dataStr=="SQLFALSE"){
    			 				    utilsFp.confirmIcon(3,"","","", "未配置数据源",0,"","");
    			 				    $("#WRC_NEW_SN").val("");
    			 				    
                                    $("#WRC_NEW_SN").focus();
                                    loadLabelInfo(labelIdStr);
                                    showObjectInfo(LABELCSS);
                                    
                                    return;
    			 				}else if(dataStr=="SQLFALSE2"){
    			 				    utilsFp.confirmIcon(3,"","","", "数据源配置错误",0,"","");
    			 				    $("#WRC_NEW_SN").val("");
    			 				    
                                    $("#WRC_NEW_SN").focus();
                                    loadLabelInfo(labelIdStr);
                                    showObjectInfo(LABELCSS);
                                    
                                    return;
    			 				}else if(dataStr=="SQLFALSE3"){
    			 				    utilsFp.confirmIcon(3,"","","", "传入参数个数与数据源配置不一致",0,"","");
    			 				    $("#WRC_NEW_SN").val("");
    			 				    
                                    $("#WRC_NEW_SN").focus();
                                    loadLabelInfo(labelIdStr);
                                    showObjectInfo(LABELCSS);
                                    
                                    return;
    			 				}else{
    			 				    getSNInfoFlag=true;
    			 				    var wmsOption="";
    			 				    //for(var i=0;i<rccList.length;i++){
    			 				        //wmsOption = "<option value=''>--请选择--</option>";	
                                        //wmsOption = wmsOption + "<option value='" + rccList[i].LABEL_ID + "'><input type='hidden' id='"+rccList[i].LABEL_ID+"' value='"+rccList[i].LABELCSS+"'/>" + rccList[i].LABEL_NAME + "</option>";
    			 				    //}
	                                var table1Trs = $("#itemTable tbody tr");
	                                var dataSource={};
	                                var dataSource2={};
                                    for(var i = 0; i < rccList.length; i++) {
                                        for(var j=0;j<table1Trs.length;j++){
                                            var oName=$("#itemTable tbody tr:eq(" + j + ")").find("td:eq(0)").text();
                                            if(oName==rccList[i].CLD_ITEM_ALIAS){
                                                if(rccList[i].CLD_ITEM_VALUE=="" ){ //|| rccList[i].CLD_DISPLAY_WAY!="0"
                                                    $("#itemTable tbody tr:eq(" + j + ")").find("td:eq(3) input").attr("disabled",false);
                                                }else{
                                                    $("#itemTable tbody tr:eq(" + j + ")").find("td:eq(3) input").attr("disabled",true);	
                                                }
                                                $("#itemTable tbody tr:eq(" + j + ")").find("td:eq(3) input").val(rccList[i].CLD_ITEM_VALUE);
                                            }
                                            if(dataMap.CLD_CODE_ALIAS==rccList[i].CLD_COLUMN_NAME){
                                                var itemCodeId="#"+rccList[i].CLD_ITEM_ALIAS;
    			 				                $("#itemCode").val($(itemCodeId).val());
                                            }
                                            if(dataMap.CLD_NUM_ALIAS==rccList[i].CLD_COLUMN_NAME){
                                                var itemNumId="#"+rccList[i].CLD_ITEM_ALIAS;
                                                $("#itemNum").val($(itemNumId).val());
                                            }
                                        }
                                        //dataSource["ITEM_INFO"+i]=rccList[i];
            						} 
                                    dataSource["ITEM_INFO"]=rccList;
            						var table1Trs = $("#itemTable tbody tr");
							        for(var j=0;j<table1Trs.length;j++){
										var labelName=$.trim($("#itemTable tbody tr:eq(" + j + ")").find("td:eq(1)").text());
							            var labelVal=$.trim($("#itemTable tbody tr:eq(" + j + ")").find("td:eq(3) input").val());
							            dataSource2[labelName]=labelVal;
							            //传数据
							            //转 加上带分页带表头标志
							        }
							        if($("#titleFlag_1").is(":checked")){
                            	        dataSource["CLD_TITLE_FLAG"]="Y";
                            	    }else{
                            	        dataSource["CLD_TITLE_FLAG"]="N";
                            	    }
						            
						            //调接口
						            //////////////////////////////////////////////////////////////////////////////////////////////////
						            listSource=dataSource;
						            changeDataSourceInfo(dataSource);
						            //changeDataSourceInfo(dataSource2);
						            textAlignDetail();
    			 				}
    			 				if($.trim($("#WRC_STORAGE_POSITION").val())=="车间"){
    			 				    $("#paraMap1_WRC_NEW_NUM").attr("disabled",false);
    			 				    $("#addType").val("2");
    			 				}
    			 				
    			 				if($("#paraMap1_WRC_AUTO_FLAG_1").is(":checked")){
                                    printPreview();
                                    $("#resDiv").html("");
               						$("#resDiv").append("<span style='display:inline-block;width:100px;height:30px;background-color:green;color:white;border-radius:5px;text-align:center;line-height:30px;'>打印成功</span>");
                                    $("#WRC_NEW_SN").val("");
                                    $("#WRC_NEW_SN").focus();
                                    loadLabelInfo(labelIdStr);
                                    addInfo();
                                }
    			 				
    			 			},
    			 			error: function(XMLHttpRequest, textStatus, errorThrown){		
                                if(msg.readyState!=0){	
        			 				util.closeLoading();
        			 				var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
        			 				if (null != sessionstatus && sessionstatus == "noAuthority") {
        			 				}else{
        			 			    }								
                                }
    			 	    }
    			    });
　　　　	    }
　　　　    }
		
　　    }; 
		function saveInfo(){
		    $("#addType").val("3");
	        localStorage.printStatus=2;
			localStorage.printTempleCode=2;
		    console.log($("#addType").val())
			localStorage.printResult=1;
		    if($.trim($("#paraMap1_WRC_TEMPLATE_ID").val())==""){
                _alertValMsg($("#paraMap1_WRC_TEMPLATE_ID_chosen"), "<dict:lang value="该项不能为空" />");
                $("#resDiv").html("");
    	    	return;
            }
	        if($("#deptLs_data_auth").val()==""){
                _alertValMsg($("#deptLs_data_auth_chosen"), "<dict:lang value="该项不能为空" />");
                $("#resDiv").html("");
    	    	return;
            }
			if($("#WRC_NEW_SN").val()==""){
                _alertValMsg($("#WRC_NEW_SN"), "<dict:lang value="该项不能为空" />");
                $("#resDiv").html("");
    	    	return;
            }
            if(getSNInfoFlag==false){
                utilsFp.confirmIcon(3,"","","", "请输入输入SN,按Enter键",0,"","");
                return;
            }
            if($("#titleFlag_1").is(":checked")){
            	listSource["CLD_TITLE_FLAG"]="Y";
    	    }else{
    	    	listSource["CLD_TITLE_FLAG"]="N";
    	    }
            listSource["LABELCSS"]=LABELCSS;
            
            localStorage.printListSource=JSON.stringify(listSource);
            
           	if(listSource.CLD_TITLE_FLAG=="Y"){
            	localStorage.cldTitleFlag="Y";
            	$("#iframeHtml").attr("src","${path}buss/bussModel.ms?exeid=2b607fd998ad431ab6a6619777a26fef");
           		validateType=2;
           		timeInterval = window.setInterval(validateLocalResult,1000)
            }else{
            	$("#iframeHtml").attr("src","${path}buss/bussModel.ms?exeid=03eace6e392f403398c843b5a2e4e158");
            	localStorage.cldTitleFlag="N";
            	validateType=2;
           		timeInterval = window.setInterval(validateLocalResult,1000);
            }
            
            addInfo();
	        printStatusRead();
            localStorage.printTempleCode=3;
            
    	}
    	function loadListInfo(){
    		localStorage.printResult=1;
    	    if($.trim($("#paraMap1_WRC_TEMPLATE_ID").val())==""){
                _alertValMsg($("#paraMap1_WRC_TEMPLATE_ID_chosen"), "<dict:lang value="该项不能为空" />");
                $("#resDiv").html("");
    	    	return;
            }
	        if($("#WRC_NEW_SN").val()==""){
                _alertValMsg($("#WRC_NEW_SN"), "<dict:lang value="该项不能为空" />");
                $("#resDiv").html("");
    	    	return;
            }
            if(getSNInfoFlag==false){
                utilsFp.confirmIcon(3,"","","", "请输入输入SN,按Enter键",0,"","");
                return;
            }
            if($("#titleFlag_1").is(":checked")){
            	listSource["CLD_TITLE_FLAG"]="Y";
    	    }else{
    	    	listSource["CLD_TITLE_FLAG"]="N";
    	    }
            listSource["LABELCSS"]=LABELCSS;
            
            localStorage.printListSource=JSON.stringify(listSource);
          /* window.open("${path}buss/bussModel.ms?exeid=03eace6e392f403398c843b5a2e4e158"); */
            if(listSource.CLD_TITLE_FLAG=="Y"){
            	localStorage.cldTitleFlag="Y";
            	//window.open("${path}buss/bussModel.ms?exeid=2b607fd998ad431ab6a6619777a26fef");
            	$("#iframeHtml").attr("src","${path}buss/bussModel.ms?exeid=2b607fd998ad431ab6a6619777a26fef");
           		//document.getElementById('iframeHtml').contentWindow.location.reload(true);
            	validateType=1;
           		timeInterval = window.setInterval(validateLocalResult,1000)
            }else{
            	$("#iframeHtml").attr("src","${path}buss/bussModel.ms?exeid=03eace6e392f403398c843b5a2e4e158");
            	localStorage.cldTitleFlag="N";
            	validateType=1;
           		timeInterval = window.setInterval(validateLocalResult,1000);
            }
            
    	}
    	function addInfo(){
    		document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=03df979df7564be78c96d16558acffdc";
            document.forms.addForm.submit();
    	}
    	function loadInfo(){
    	    var table1Trs = $("#itemTable tbody tr");
    	    var dataSource={};
	        for(var j=0;j<table1Trs.length;j++){
				var labelName=$.trim($("#itemTable tbody tr:eq(" + j + ")").find("td:eq(1)").text());
	            var labelVal=$.trim($("#itemTable tbody tr:eq(" + j + ")").find("td:eq(3) input").val());
	            dataSource[labelName]=labelVal;
	            //dataSource["title"]=labelVal;
	        }
	        changeDataSourceInfo(dataSource);
	        textAlignDetail();
            //console.log(dataSource);
            //调接口
            $("#WRC_NEW_SN").focus();
    	}
    	var autoLoaclVal=localStorage.getItem("WRC_AUTO_FLAG2");
    	if(autoLoaclVal==null || autoLoaclVal==""){
    	    if($("#paraMap1_WRC_AUTO_FLAG_1").is(":checked")){
    	        localStorage.setItem("WRC_AUTO_FLAG2","Y");
    	    }else{
    	        localStorage.setItem("WRC_AUTO_FLAG2","N");
    	    }
    	}else{
    	    if(autoLoaclVal=="Y"){
    	        $("#paraMap1_WRC_AUTO_FLAG_1").prop("checked",true); 
    	    }else{
    	        $("#paraMap1_WRC_AUTO_FLAG_1").prop("checked",false); 
    	    }
    	}
    	$("#paraMap1_WRC_AUTO_FLAG_1").click(function(){
    	    localStorage.removeItem("WRC_AUTO_FLAG2");
            if($(this).attr("checked"))
            {
                localStorage.setItem("WRC_AUTO_FLAG2","Y");
            }
            else
            {
                localStorage.setItem("WRC_AUTO_FLAG2","N");
            }
         });
    	function autoPrintInfo(){
    		//自动打印
    		if($("#paraMap1_WRC_TEMPLATE_ID").val()==""){
                _alertValMsg($("#paraMap1_WRC_TEMPLATE_ID"), "<dict:lang value="该项不能为空" />");
    	    	return;
            }
            if(getSNInfoFlag==false){
                utilsFp.confirmIcon(3,"","","", "请输入输入SN,按Enter键",0,"","");
 			    $("#WRC_NEW_SN").val("");
            }
            //获取自动打印标志 
            //var autoFlag=$("#paraMap1_WRC_AUTO_FLAG_1").val();
            //if($("#paraMap1_WRC_AUTO_FLAG_1").is(":checked")){
            printPreview();
            $("#resDiv").html("");
            $("#resDiv").append("<span style='display:inline-block;width:100px;height:30px;background-color:green;color:white;border-radius:5px;text-align:center;line-height:30px;'>打印成功</span>");
            //}
    		$("#WRC_NEW_SN").focus();
    	}
    	//if($("#paraMap1_WRC_AUTO_FLAG_1").is(":checked")){
            //autoPrintInfo();
        //} 
        function OnInput (event) {
            //alert ("The new content1: " + event.target.value);
            var newContent=event.target.value;
            var table1Trs = $("#itemTable tbody tr");
    	    var dataSource={};
	        for(var j=0;j<table1Trs.length;j++){
	        		var labelName=$.trim($("#itemTable tbody tr:eq(" + j + ")").find("td:eq(1)").text());
	            	var labelVal=$("#itemTable tbody tr:eq(" + j + ")").find("td:eq(3) input").val();
	            	dataSource[labelName]=labelVal;
	        	
	        }
            
            //调接口
            changeDataSourceInfo(dataSource);
            textAlignDetail();
        }
        function printInfoNotitle(type){
			LODOP.PRINT_INIT("");
		 	var paperWidthValue=paperWidth+"mm";
	     	var paperHeightValue=paperHeight+"mm";
	     	var html=$("#iframeHtml").contents().find("body").html();
	     	LODOP.SET_PRINT_PAGESIZE(1,paperWidthValue,paperHeightValue);
	     	LODOP.ADD_PRINT_HTM("0","-10mm",paperWidthValue,paperHeightValue,html);
	    	LODOP.SET_PRINT_STYLEA(0,"ItemType",2);
	    	if ($("#numPrint_1").prop("checked")) {
	    	 	LODOP.ADD_PRINT_HTM(1,600,300,100,"<span style='font-size:12px'>总页号</span>：<font ><span tdata='pageNO' style='font-size:12px'>第##页</span>/<span tdata='pageCount' style='font-size:12px'>共##页</span></font>");
				LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
	    	 }
	    	if(type==1){
	    		LODOP.PREVIEW(); 
	    	}else{
	    		LODOP.PRINT();
	    	}
			
			
		}
		/**
	 	 * 分页带表头
	 	*/
		 function printInfoTitle(type){
		 		var topMaxHeight=parseInt(localStorage.topMaxHeight);//纸张头部高度
			 	var buttomMaxHeight=parseInt(localStorage.buttomMaxHeight);//纸张底部高度
			 	var paperWidthNext=parseFloat(paperWidth)*794/210;//纸张占用宽度像素
			 	var paperHeightNext=parseFloat(paperHeight)*1123/297;//纸张占用高度像素
			 	var paperWidthValue=paperWidth+"mm";//纸张宽度
	     		var paperHeightValue=paperHeight+"mm";//纸张高度
	     		LODOP.SET_PRINT_PAGESIZE(1,paperWidthValue,paperHeightValue);
		     	var strStyle="<style> table,td,th {border-width: 1px;border-style: solid;border-collapse: collapse}</style>";
		     	if(paperHeightNext>500){//纸张是否超出500像素
		     		paperHeightNext=paperHeightNext-buttomMaxHeight-topMaxHeight;
		     		var paperHeightNextValue=paperHeightNext-60;
		     		LODOP.ADD_PRINT_TABLE(topMaxHeight,"-10mm",196,paperHeightNextValue,strStyle+$("#iframeHtml").contents().find("#div2").html());//打印table内容
		     	}else{
		     		paperHeightNext=paperHeightNext-buttomMaxHeight-topMaxHeight;
		     		LODOP.ADD_PRINT_TABLE(topMaxHeight,"-10mm",196,paperHeightNext,strStyle+$("#iframeHtml").contents().find("#div2").html());
		     	}
		     	topMaxHeightTemp=topMaxHeight+30;
				LODOP.ADD_PRINT_HTM(26,"-10mm","90%",topMaxHeightTemp,$("#iframeHtml").contents().find("#div1").html());//打印头部内容	
				LODOP.SET_PRINT_STYLEA(0,"ItemType",1);	
				var paperHeightNext2 = paperHeightNext+topMaxHeight;
				LODOP.ADD_PRINT_HTM(paperHeightNext2,"-10mm","90%",buttomMaxHeight,$("#iframeHtml").contents().find("#div3").html());//打印底部内容
				LODOP.SET_PRINT_STYLEA(0,"ItemType",1);	
				if ($("#numPrint_1").prop("checked")) {
	    	 		LODOP.ADD_PRINT_HTM(1,600,300,100,"<span style='font-size:12px'>总页号</span>：<font ><span tdata='pageNO' style='font-size:12px'>第##页</span>/<span tdata='pageCount' style='font-size:12px'>共##页</span></font>");
					LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
	    		}
	    	if(type==1){
	    		LODOP.PREVIEW(); 
	    	}else{
	    		LODOP.PRINT();
	    	}
		}
		
		 //验证打印结果
		function validateLocalResult(){
			if( localStorage.printResult==2){
				window.clearTimeout(timeInterval);//去掉定时器 
				if(localStorage.cldTitleFlag=="Y"){
					printInfoTitle(validateType);
				}else{
					printInfoNotitle(validateType);
				}
				
			}
		}
		
		//验证打印结果
		function changeCanvasWidth(){
			
			var containerXValue=container.x;
			var containerYValue=container.y;
			for(var i=0;i<nodeArray.length;i++){
				nodeArray[i].x=nodeArray[i].x-300;
				nodeArray[i].y=nodeArray[i].y-200;
			}
			container.x=container.x-300;
			container.y=container.y-200;
			
		}
		
    </script>
<script>(function($){
  $(window).on('load',function(){
   setPopScroll('.scroll','.datagrid-header-inner');
   setPopScroll('.scroll1','.datagrid-header-inner1');
   setPopScroll('.scroll2','.datagrid-header-inner2');
    setPopScroll('.scroll3');
  })
})(jQuery)</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
