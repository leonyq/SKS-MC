<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
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
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
    <!-- 产品静态资源 -->
<script type="text/javascript">
        var listIndex;
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
        
		function popItemDiv(index,itemAlias) {
			//$("#" + showId + ",#" + backId).show();
			//$("#" + showId).draggable();
			
			$("#addItem,#backItem").show();
			$("#addItem").draggable();
            $("#paraMapObj_CLD_DISPLAY_WAY_chosen").attr("style","width:200px;");
            listIndex=index;
            backInfoShow();
		}

		function hideDiv(showId, backId) {
			$("#" + showId + ",#" + backId).hide();
			closeDivFp(showId + "pop");
		}
</script>
	<style>
	    #borderFlagSel1_chosen,#printWaySel1_chosen,#barcideTypeSel1_chosen{
	        		z-index:1030;
	    }
	    .chosen-single span{
	        	text-align:left;    
	    } 
	</style>
</head>
<body>
	<div class="edit">
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
            <div class="hd">
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
			    	        <button type="button" onclick="analysis('second_load');"><i class="ico ico-save"></i><dict:lang value="解析" /></button>
			    	        <button type="button" onclick="editInfo();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="456232dd31a0406693c9bc494bd6a702" type="edit" />
	<!--<div style="display:inline-block;width:320px;" >-->
	<div class="mod" style="display:inline-block;width:320px">
	<div class="mod-hd" style="width:320px;">
		<h3 class="tit"><dict:lang value="打印日志数据项" /></h3>
	</div>
	<table class="basic-table scroll" style="display:inline-block;width:380px;margin-top:3px;" id="printTable">
	<input type="hidden" name="formIds" value="456232dd31a0406693c9bc494bd6a702" />
	<input type="hidden" name="456232dd31a0406693c9bc494bd6a702" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="oNames" id="oNames" value="" />
	<input type="hidden" name="colVals" id="colVals" value="" />
	<input type="hidden" name="listFlags" id="listFlags" value="" />
	<input type="hidden" name="itemAlias" id="itemAlias" value="" />
		<s:set name="_$viewId" value="'56c2ba61e939498096f5aff055e5e2f5'" />
		<s:set name="_$formId_1" value="'456232dd31a0406693c9bc494bd6a702'" />
		<s:set name="_$type" value="'edit'"/>
		<tr style="">
			<td class="name"  style="width:105px;"/><dict:lang value="物料料号" /></span></td>
			<bu:td cssClass="dec" colNo="CLD_CODE_ALIAS" formId="456232dd31a0406693c9bc494bd6a702" ><bu:ui colNo="CLD_CODE_ALIAS"  style="width:200px;" formId="456232dd31a0406693c9bc494bd6a702" value="%{CLD_CODE_ALIAS}" formIndex="1" /></bu:td>
		</tr>
		<tr style="">
			<td class="name"  style="width:105px;"/><dict:lang value="物料数量" /></span></td>
			<bu:td cssClass="dec" colNo="CLD_NUM_ALIAS" formId="456232dd31a0406693c9bc494bd6a702" ><bu:ui colNo="CLD_NUM_ALIAS"  style="width:200px;" formId="456232dd31a0406693c9bc494bd6a702" value="%{CLD_NUM_ALIAS}" formIndex="1" /></bu:td>
		</tr>
		
	</table>
	
	<div class="mod-hd" style="width:320px;">
		<h3 class="tit"><dict:lang value="条码数据项" /></h3>
	</div>
	<table class="basic-table scroll" style="display:inline-block;width:380px;margin-top:3px;height: 250px;" id="itemTable">
	<input type="hidden" name="formIds" value="456232dd31a0406693c9bc494bd6a702" />
	<input type="hidden" name="456232dd31a0406693c9bc494bd6a702" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="oNames" id="oNames" value="" />
	<input type="hidden" name="colVals" id="colVals" value="" />
	<input type="hidden" name="codeAlias" id="codeAlias" value="" />
	<input type="hidden" name="numAlias" id="numAlias" value="" />
	<input type="hidden" name="listFlags" id="listFlags" value="" />
	<input type="hidden" name="itemAlias" id="itemAlias" value="" />
		<s:set name="_$viewId" value="'56c2ba61e939498096f5aff055e5e2f5'" />
		<s:set name="_$formId_1" value="'456232dd31a0406693c9bc494bd6a702'" />
		<s:set name="_$type" value="'edit'"/>
		<tr><tr/>
		
	</table>
	</div>
	<table class="basic-table" style="margin-top:3px;display:inline-block;width:470px;height: 300px;float:right;">
	    <tr style="">
			<td class="name"  style="width:105px;"/><span class="dot">*</span><span><dict:lang value="SQL" /></span></td>
			<bu:td cssClass="dec" colNo="CLD_SQL" formId="456232dd31a0406693c9bc494bd6a702" ><bu:ui colNo="CLD_SQL"  style="width:430px;height:300px;" formId="456232dd31a0406693c9bc494bd6a702" value="%{CLD_SQL}" formIndex="1" /></bu:td>
		</tr>
		<tr style="">
			<td class="name"  style="text-align:left;" colspan="2"/><span class="dot">*</span><span><dict:lang value="请按下列格式输入SQL：SELECT 字段1,字段2... FROM 表 WHERE 字段1={参数},参数外面不能加单引号.如果存在多组织机构数据,SQL语句中需要加入组织机构过滤,参数固定为DATA_AUTH" /></span></td>
		</tr>
	</table>
	
	<div id="backItem" class="dialog-mask" style="z-index:1029px;" /></div>
	<div class="dialog dialog-s1" id="addItem" style="display:none;z-index:1030;margin-left:0px;left:56px;top:10px;width:790px;height:480px;">
		<div class="dialog-hd">
			<h3 class="tit">
			<dict:lang value="清单数据源" />
			</h3>
		</div>
		<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addItem','backItem');"></a>
		<div class="dialog-bd-div" style="width:100%;height:calc(100% - 37px);">
			<div class="optn optn_div">
			    <button type="button" onclick="analysisList();"><i class="ico ico-save"></i><dict:lang value="解析"/></button>
				<button type="button" onclick="saveListInfo('addItem','backItem');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv('addItem','backItem');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
			</div>
			<div class="mod" style="display:inline-block;width:320px;float:left;">
    			<table class="basic-table" style="width:320px;margin-top:3px;height: 35px;">
    				<tr>
    					<td class="name"  style="width:85px;"/><dict:lang value="展示方式" /></span></td>
    					<bu:td cssClass="dec" colNo="CLD_DISPLAY_WAY" formId="d0ecbb2b7a0e447bbf4f44f43dccff47" >
    						<bu:ui colNo="CLD_DISPLAY_WAY" formId="d0ecbb2b7a0e447bbf4f44f43dccff47" value="%{CLD_DISPLAY_WAY}" formIndex="1" />
    					</bu:td>
    				</tr>
    			</table>
    			<div class="mod-hd" style="width:255px;margin-left:35px;">
            		<h3 class="tit"><dict:lang value="列设置" /></h3>
            	</div>
            	<div style="height:30px;"  class="datagrid-header-inner1"  id="listTitleDiv">
                	<table class="basic-table"  style="display:inline-block;width:255px;margin-top:3px;margin-left:35px;height: 30px;"  id="listTitleTable">
        			    <tbody>
        			    </tbody>
        			</table>
    			</div>
    			<table class="basic-table scroll"  style="display:inline-block;width:255px;margin-top:0px;margin-left:35px;height: 280px;"  id="listTable">
    			    <tbody>
    			    </tbody>
    			</table>
			</div>
			<table class="basic-table" style="margin-top:3px;display:inline-block;width:400px;height: 300px;">
        	    <tr style="">
        			<td class="name"  style="width:105px;"/><span class="dot">*</span><span><dict:lang value="SQL" /></span></td>
        			<bu:td cssClass="dec" colNo="CLD_SQL" formId="456232dd31a0406693c9bc494bd6a702" ><bu:ui colNo="CLD_SQL"  style="width:400px;height:260px;" id="listSql" name="listSql" formId="456232dd31a0406693c9bc494bd6a702" value="%{CLD_SQL}" formIndex="1" /></bu:td>
        		</tr>
        		<tr style="">
        			<td class="name"  style="text-align:left;" colspan="2"/><span class="dot">*</span><span><dict:lang value="请按下列格式输入SQL：SELECT 字段1,字段2... FROM 表 WHERE 字段1={参数},参数外面不能加单引号；
                     若显示列名需以中文体现，需在查询列重命名。展示方式：选择列表展示时，需对解析结果列进行设置，设置每列列宽；选择数据排列时，解析结果只能返回一个查询列，然后设置每行展示数据个数。" /></span></td>
        		</tr>
        	</table>
			
		</div>

	</div>
	
			<bu:jsVal formId="456232dd31a0406693c9bc494bd6a702" formIndex="1" />
									
			</div>
	</form>	
	</div>	

    
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<!-- js初始化方法 -->
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_11" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script type="text/javascript">
	    $(function() {
	        
	        
                  
		});
		getDataItemInfo();
		var INDEX;
		function getDataItemInfo(){
    	    var labelId=$("input[name='dataId']").val();
    	    util.showLoading("处理中...");
			var getItemUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=e9ac404217274f1498753a50a857922e&formId=%{formId}";
			$.ajax({
				type: "POST",
				dataType: "json",
				url: getItemUrl+"&labelId="+labelId,
				data: "",
				success: function(data) {
					$("#itemTable tbody").empty();
					$("#printTable tbody").empty();
					util.closeLoading();
					var dataMap=data.ajaxMap;
					if(null != data.ajaxList) {
					    	
						var rccList = eval(data.ajaxList);
                        if(rccList.length==0){
                            $("#itemTable tbody:last").append("<tr></tr>");
							$("#itemTable tr:last").append("<td class='name' style='width:155px;'>未配置条码数据项</td>	");
							$("#printTable tbody:last").append("<tr></tr>");
							$("#printTable tr:last").append("<td class='name' style='width:155px;'>未配置条码数据项</td>	");
                        }else{							
                           var wmsSel="";                        
                           var wmsOption = "";
                           $("#itemTable tr:last").append("<td>&nbsp;</td>	");
    						for(var i = 0; i < rccList.length; i++) {
    						    if(rccList[i].TEMPLATE_ID != null){
    						        //新增
    						        wmsOption = "<option value=''>--请选择--</option>";
    						        wmsSel = "<select id='sel"+i+"' name='ss' class=' input isSubmit  _VAL_OjbsData _VAL_DATABASE dept_select' style='width:200px;display:none'>" + wmsOption + "</select>";
    						        if(rccList[i].DATA_ITEMS_NAME == null) rccList[i].DATA_ITEMS_NAME = "";
        							if(rccList[i].DATA_ITEMS_ALIAS == null) rccList[i].DATA_ITEMS_ALIAS = "";
        							if(rccList[i].CLD_SQL == null) rccList[i].CLD_SQL = "";
        							$("#itemTable tbody:last").append("<tr></tr>");
        							$("#itemTable tr:last").append("<td class='name' style='width:105px;display:none;'><input id='itemAlias"+(i + 1)+"' style='width:80px;' value='"+rccList[i].DATA_ITEMS_ALIAS+"' name='ITEMS_ALIAS'/>"+rccList[i].DATA_ITEMS_ALIAS+"</td>	");
        							if(rccList[i].DATA_ITEMS_ALIAS=="Y"){
        							    $("#itemTable tr:last").append("<td class='name' style='width:105px;'><input id='checkbox" + (i + 1) + "' onclick='clickCheckBox("+(i+1)+");' type='checkbox' name='LIST_FLAG' checked='checked'/>&nbsp;"+rccList[i].DATA_ITEMS_NAME+"</td>	");
        							}else{
        							    $("#itemTable tr:last").append("<td class='name' style='width:105px;'><input id='checkbox" + (i + 1) + "' onclick='clickCheckBox("+(i+1)+");' type='checkbox' name='LIST_FLAG'/>&nbsp;"+rccList[i].DATA_ITEMS_NAME+"</td>	");
        							}
        							
        							$("#itemTable tr:last").append("<td style='width:100px;display:none;'/>"+rccList[i].DATA_ITEMS_ALIAS+"</td>");
        							$("#itemTable tr:last").append("<td class='dec' style='width:200px;'>"+wmsSel+"</td>");
        							if(rccList[i].DATA_ITEMS_ALIAS=="Y"){
        							    $("#itemTable tr:last").append("<td class='dec' style='width:60px;'><input type='hidden' id='itemSql" + (i + 1) + "' name='CLD_ITEM_SQL' value=''/><button id='button" + (i + 1) + "'  type='button' onclick='popItemDiv("+(i+1)+");' style='width:60px;' ><i class='ico ico-cancel'></i><dict:lang value='数据源' /></button></td>");
        							}else{
        							    $("#itemTable tr:last").append("<td class='dec' style='width:60px;'><input type='hidden' id='itemSql" + (i + 1) + "' name='CLD_ITEM_SQL' value=''/><button id='button" + (i + 1) + "'  type='button' onclick='popItemDiv("+(i+1)+");' style='width:60px;display:none;' ><i class='ico ico-cancel'></i><dict:lang value='数据源' /></button></td>");
        							}
        							
        							$("#itemTable tr:last").append("<td class='dec' style='width:5px;dispaly:none;'><input type='hidden' id='displayWay" + (i + 1) + "' name='DISPLAY_WAY' value=''/></td>");
                                    $("#itemTable tr:last").append("<td class='dec' style='width:5px;dispaly:none;'><input type='hidden' id='itemInfo" + (i + 1) + "' name='ITEM_INFO' value=''/></td>");        							
        							$("#itemTable tr:last").append("<td  class='dec' style='width:100px;display:none;'/></td>");
        						    $("#itemTable tr:last").append("<td>&nbsp;</td>	");
    						    }
    						    mySetChosen();
                                $("#sel"+i+"_chosen").attr("style","width:200px;");
                                INDEX=i;
    						}
    						if(dataMap.CLASS_ONE_LABEL_ID == null) dataMap.CLASS_ONE_LABEL_ID = "";
							if(dataMap.CLASS_ONE_LABEL_ITEM == null) dataMap.CLASS_ONE_LABEL_ITEM = "";
							if(dataMap.CLASS_TWO_LABEL_ID == null) dataMap.CLASS_TWO_LABEL_ID = "";
							if(dataMap.CLASS_TWO_LABEL_ITEM == null) dataMap.CLASS_TWO_LABEL_ITEM = "";
							if(dataMap.CLASS_THREE_LABEL_ID == null) dataMap.CLASS_THREE_LABEL_ID = "";
							if(dataMap.CLASS_THREE_LABEL_ITEM == null) dataMap.CLASS_THREE_LABEL_ITEM = "";
							if(dataMap.CLASS_ONE_LABEL_ID!="" && dataMap.CLASS_ONE_LABEL_ITEM!=""){
							    var tempIndex=INDEX+1;
							    wmsSel= "<select id='sel_oneLabelItem' name='ss' class=' input isSubmit  _VAL_OjbsData _VAL_DATABASE dept_select' style='width:200px;display:none'>" + wmsOption + "</select>";
							    $("#itemTable tbody:last").append("<tr></tr>");
    							$("#itemTable tr:last").append("<td class='name' style='width:105px;display:none;'>F001</td>	");
    							$("#itemTable tr:last").append("<td class='name' style='width:105px;'><input id='checkbox" + (tempIndex + 1) + "' onclick='clickCheckBox("+(tempIndex+1)+");' type='checkbox' name='LIST_FLAG'/>&nbsp;"+dataMap.CLASS_ONE_LABEL_ITEM+"</td>	");
    							$("#itemTable tr:last").append("<td style='width:100px;display:none;'/>F001</td>");
    							$("#itemTable tr:last").append("<td class='dec' style='width:200px;'>"+wmsSel+"</td>");
    							$("#itemTable tr:last").append("<td  class='dec' style='width:100px;display:none;'/><input type='hidden' value='F001'  id='itemAlias"+(tempIndex + 1)+"'  name='ITEMS_ALIAS'/></td>");
    						    $("#itemTable tr:last").append("<td class='dec' style='width:60px;'><input type='hidden' id='itemSql" + (tempIndex + 1) + "' name='CLD_ITEM_SQL' value=''/><button id='button" + (tempIndex + 1) + "'  type='button' onclick='popItemDiv("+(tempIndex+1)+");' style='width:60px;display:none;' ><i class='ico ico-cancel'></i><dict:lang value='数据源' /></button></td>");
    						    $("#itemTable tr:last").append("<td class='dec' style='width:5px;dispaly:none;'><input type='hidden' id='displayWay" + (tempIndex + 1) + "' name='DISPLAY_WAY' value=''/></td>");
                                $("#itemTable tr:last").append("<td class='dec' style='width:5px;dispaly:none;'><input type='hidden' id='itemInfo" + (tempIndex + 1) + "' name='ITEM_INFO' value=''/></td>");
    						    $("#itemTable tr:last").append("<td>&nbsp;</td>	");
    						    
    						    mySetChosen();
                                $("#sel_oneLabelItem_chosen").attr("style","width:200px;");
							}
							if(dataMap.CLASS_TWO_LABEL_ID!="" && dataMap.CLASS_TWO_LABEL_ITEM!=""){
							    var tempIndex=INDEX+2;
							    wmsSel= "<select id='sel_twoLabelItem' name='ss' class=' input isSubmit  _VAL_OjbsData _VAL_DATABASE dept_select' style='width:200px;display:none'>" + wmsOption + "</select>";
							    $("#itemTable tbody:last").append("<tr></tr>");
    							$("#itemTable tr:last").append("<td class='name' style='width:105px;display:none;'>F002</td>	");
    							$("#itemTable tr:last").append("<td class='name' style='width:105px;'><input id='checkbox" + (tempIndex + 1) + "' onclick='clickCheckBox("+(tempIndex+1)+");' type='checkbox' name='LIST_FLAG'/>&nbsp;"+dataMap.CLASS_TWO_LABEL_ITEM+"</td>	");
    							$("#itemTable tr:last").append("<td style='width:100px;display:none;'/>F002</td>");
    							$("#itemTable tr:last").append("<td class='dec' style='width:200px;'>"+wmsSel+"</td>");
    							$("#itemTable tr:last").append("<td  class='dec' style='width:100px;display:none;'/><input type='hidden' value='F002'  id='itemAlias"+(tempIndex + 1)+"'  name='ITEMS_ALIAS'/></td>");
    						    $("#itemTable tr:last").append("<td class='dec' style='width:60px;'><input type='hidden' id='itemSql" + (tempIndex + 1) + "' name='CLD_ITEM_SQL' value=''/><button id='button" + (tempIndex + 1) + "'  type='button' onclick='popItemDiv("+(tempIndex+1)+");' style='width:60px;display:none;' ><i class='ico ico-cancel'></i><dict:lang value='数据源' /></button></td>");
    						    $("#itemTable tr:last").append("<td class='dec' style='width:5px;dispaly:none;'><input type='hidden' id='displayWay" + (tempIndex + 1) + "' name='DISPLAY_WAY' value=''/></td>");
                                $("#itemTable tr:last").append("<td class='dec' style='width:5px;dispaly:none;'><input type='hidden' id='itemInfo" + (tempIndex + 1) + "' name='ITEM_INFO' value=''/></td>");	
                                $("#itemTable tr:last").append("<td>&nbsp;</td>	");
    						    
    						    mySetChosen();
                                $("#sel_twoLabelItem_chosen").attr("style","width:200px;");
							}
							if(dataMap.CLASS_THREE_LABEL_ID!="" && dataMap.CLASS_THREE_LABEL_ITEM!=""){
							    var tempIndex=INDEX+3;
							    wmsSel= "<select id='sel_threeLabelItem' name='ss' class=' input isSubmit  _VAL_OjbsData _VAL_DATABASE dept_select' style='width:200px;display:none'>" + wmsOption + "</select>";
							    $("#itemTable tbody:last").append("<tr></tr>");
    							$("#itemTable tr:last").append("<td class='name' style='width:105px;display:none;'>F003</td>	");
    							$("#itemTable tr:last").append("<td class='name' style='width:105px;'><input id='checkbox" + (tempIndex + 1) + "' onclick='clickCheckBox("+(tempIndex+1)+");' type='checkbox' name='LIST_FLAG'/>&nbsp;"+dataMap.CLASS_THREE_LABEL_ITEM+"</td>	");
    							$("#itemTable tr:last").append("<td style='width:100px;display:none;'/>F003</td>");
    							$("#itemTable tr:last").append("<td class='dec' style='width:200px;'>"+wmsSel+"</td>");
    							$("#itemTable tr:last").append("<td  class='dec' style='width:100px;display:none;'/><input type='hidden' value='F003' id='itemAlias"+(tempIndex + 1)+"'  name='ITEMS_ALIAS'/></td>");
    						    $("#itemTable tr:last").append("<td class='dec' style='width:60px;'><input type='hidden' id='itemSql" + (tempIndex + 1) + "' name='CLD_ITEM_SQL' value=''/><button id='button" + (tempIndex + 1) + "'  type='button' onclick='popItemDiv("+(tempIndex+1)+");' style='width:60px;display:none;' ><i class='ico ico-cancel'></i><dict:lang value='数据源' /></button></td>");
    						    $("#itemTable tr:last").append("<td class='dec' style='width:5px;dispaly:none;'><input type='hidden' id='displayWay" + (tempIndex + 1) + "' name='DISPLAY_WAY' value=''/></td>");
                                $("#itemTable tr:last").append("<td class='dec' style='width:5px;dispaly:none;'><input type='hidden' id='itemInfo" + (tempIndex + 1) + "' name='ITEM_INFO' value=''/></td>");										
                                $("#itemTable tr:last").append("<td>&nbsp;</td>	");
    						    
    						    mySetChosen();
                                $("#sel_threeLabelItem_chosen").attr("style","width:200px;");
							}
    						
    						wmsSel= "<select id='sel_itemCode' name='ss' class=' input isSubmit  _VAL_OjbsData _VAL_DATABASE dept_select' style='width:200px;display:none'>" + wmsOption + "</select>";
    						$("#printTable tbody:last").append("<tr></tr>");
							$("#printTable tr:last").append("<td class='name' style='width:105px;display:none;'></td>	");
							$("#printTable tr:last").append("<td class='name' style='width:105px;'><dict:lang value='物料料号' /></span></td>	");
							$("#printTable tr:last").append("<td style='width:100px;display:none;'/></td>");
							$("#printTable tr:last").append("<td class='dec' style='width:200px;'>"+wmsSel+"</td>");
							$("#printTable tr:last").append("<td  class='dec' style='width:100px;display:none;'/><input style='width:80px;' value=''  class=' input isSubmit  _VAL_OjbsData ' name='ITEMS_ALIAS'/></td>");
						    $("#printTable tr:last").append("<td>&nbsp;</td>	");
	                        mySetChosen();
                            $("#sel_itemCode_chosen").attr("style","width:200px;");
	
	                        wmsSel= "<select id='sel_itemNum' name='ss' class=' input isSubmit  _VAL_OjbsData _VAL_DATABASE dept_select' style='width:200px;display:none'>" + wmsOption + "</select>";
	                        $("#printTable tbody:last").append("<tr></tr>");
							$("#printTable tr:last").append("<td class='name' style='width:105px;display:none;'></td>	");
							$("#printTable tr:last").append("<td class='name' style='width:105px;'><dict:lang value='物料数量' /></span></td>	");
							$("#printTable tr:last").append("<td style='width:100px;display:none;'/></td>");
							$("#printTable tr:last").append("<td class='dec' style='width:200px;'>"+wmsSel+"</td>");
							$("#printTable tr:last").append("<td  class='dec' style='width:100px;display:none;'/><input style='width:80px;' value=''  class=' input isSubmit  _VAL_OjbsData ' name='ITEMS_ALIAS'/></td>");
						    $("#printTable tr:last").append("<td>&nbsp;</td>	");						
                            
                            mySetChosen();
                            $("#sel_itemNum_chosen").attr("style","width:200px;");
                        }
                        
					}
                    getDataItemInfo2();
				},
				error: function(msg) {
					util.closeLoading();
					utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "300", "");
				}
			});
    	}
    	function getDataItemInfo2(){
    	    var labelId=$("input[name='dataId']").val();
			var getItemUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=d8925db5b4eb451c8c9c2b3c1528354b&formId=%{formId}";
			$.ajax({
				type: "POST",
				dataType: "json",
				url: getItemUrl+"&labelId="+labelId,
				data: "",
				success: function(data) {
				    var dataMap=data.ajaxMap;
					if(null != dataMap){
					    $("#paraMapObj_CLD_SQL").val(dataMap.CLD_SQL);
					    var wmsOption1 =  "<option value='" + dataMap.CLD_CODE_ALIAS + "' selected='selected'>" + dataMap.CLD_CODE_ALIAS + "</option>";
                        var wmsSel = "<select id='sel_itemCode2' name='' class=' input isSubmit  _VAL_OjbsData _VAL_DATABASE dept_select' style='width:200px;display:none;'>" + wmsOption1 + "</select>";                                        
                        $("#printTable tbody tr:eq(0)").find("td:eq(3)").html("");
                        $("#printTable tbody tr:eq(0)").find("td:eq(3)").append(wmsSel);         											
                        mySetChosen();
                        $("#sel_itemCode2_chosen").attr("style","width:200px;");                            						
	
                        var wmsOption2 =  "<option value='" + dataMap.CLD_NUM_ALIAS + "' selected='selected'>" + dataMap.CLD_NUM_ALIAS + "</option>";
                        var wmsSel = "<select id='sel_itemNum2' name='' class=' input isSubmit  _VAL_OjbsData _VAL_DATABASE dept_select' style='width:200px;display:none;'>" + wmsOption2 + "</select>";                                        
                        $("#printTable tbody tr:eq(1)").find("td:eq(3)").html("");
                        $("#printTable tbody tr:eq(1)").find("td:eq(3)").append(wmsSel);    
                        
                        mySetChosen();
                        $("#sel_itemNum2_chosen").attr("style","width:200px;");							
						
						analysis("first_load");
					}
					if(null != data.ajaxList) {
					    	
						var rccList = eval(data.ajaxList);
                        if(rccList.length==0){
                            
                        }else{
                           var dataMap=data.ajaxMap;
                           $("#paraMapObj_CLD_SQL").val(dataMap.CLD_SQL);
                           var wmsOption = "";
       					   
		                    var table1Trs = $("#itemTable tbody tr");
    						for(var i = 0; i < rccList.length; i++) {
                    
                                for(var j=0;j<table1Trs.length;j++){
                                    if(rccList[i].CLD_SQL == null) rccList[i].CLD_SQL = "";
                                    var oName=$("#itemTable tbody tr:eq(" + j + ")").find("td:eq(0)").text();
                                    if(oName==rccList[i].CLD_ITEM_ALIAS){
                                        var wmsOption =  "<option value='" + rccList[i].CLD_COLUMN_NAME + "' selected='selected'>" + rccList[i].CLD_COLUMN_NAME + "</option>";
                                        var wmsSel = "<select id='ss"+i+"' name='' class=' input isSubmit  _VAL_OjbsData _VAL_DATABASE dept_select' style='width:200px;display:none;'>" + wmsOption + "</select>";                                        
                                        $("#itemTable tbody tr:eq(" + j + ")").find("td:eq(3)").html("");
                                        $("#itemTable tbody tr:eq(" + j + ")").find("td:eq(3)").append(wmsSel);
                                        
                                        if(rccList[i].CLD_LIST_FLAG=="Y"){
                                            var checkBoxId="#checkbox"+(j+1);
                                    	    var buttonId="#button"+(j+1);
                                    	    $(checkBoxId).attr("checked","checked");
                                    	    $(buttonId).attr("style","display:block");
                                        }
                                        $("#itemTable tbody tr:eq(" + j + ")").find("td:eq(4) input").val(rccList[i].CLD_SQL);
                                    }
                                    mySetChosen();
                                    $("#ss"+i+"_chosen").attr("style","width:200px;");
                                    
                                }
    						}
    						
                            var wmsOption1 =  "<option value='" + dataMap.CLD_CODE_ALIAS + "' selected='selected'>" + dataMap.CLD_CODE_ALIAS + "</option>";
                            var wmsSel = "<select id='sel_itemCode2' name='' class=' input isSubmit  _VAL_OjbsData _VAL_DATABASE dept_select' style='width:200px;display:none;'>" + wmsOption1 + "</select>";                                        
                            $("#printTable tbody tr:eq(0)").find("td:eq(3)").html("");
                            $("#printTable tbody tr:eq(0)").find("td:eq(3)").append(wmsSel);         											
                            mySetChosen();
                            $("#sel_itemCode2_chosen").attr("style","width:200px;");                            						
		
                            var wmsOption2 =  "<option value='" + dataMap.CLD_NUM_ALIAS + "' selected='selected'>" + dataMap.CLD_NUM_ALIAS + "</option>";
                            var wmsSel = "<select id='sel_itemNum2' name='' class=' input isSubmit  _VAL_OjbsData _VAL_DATABASE dept_select' style='width:200px;display:none;'>" + wmsOption2 + "</select>";                                        
                            $("#printTable tbody tr:eq(1)").find("td:eq(3)").html("");
                            $("#printTable tbody tr:eq(1)").find("td:eq(3)").append(wmsSel);    
                            
                            mySetChosen();
                            $("#sel_itemNum2_chosen").attr("style","width:200px;");							
    						
    						analysis("first_load");
                        }
                        //mySetChosen();
					}

				},
				error: function(msg) {
					utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "300", "");
				}
			});
    	}	
        var analysisFlag;
    	function analysis(loadFlag){
    	    //解析
    	    analysisFlag=false;
    	    var labelSql=$("#paraMapObj_CLD_SQL").val();
    	    if(loadFlag=="second_load"){
    	        util.showLoading("处理中...");
    	    }
    	    var jsondata={"labelSql":labelSql};
			var getItemUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=e4baaff5a53c440784596ea13009a215&formId=%{formId}";
			$.ajax({
				type: "POST",
				dataType: "json",
				url: getItemUrl,
				async:false,
				data:jsondata,
				success: function(data) {
				    
					//$("#itemTable tbody").empty();
					var wmsOption = "";
					var wmsOption2 = "";
					var wmsSel ="";
					util.closeLoading();
					var dataStr=data.ajaxString;
					if(dataStr=="ERROR"){
					    analysisFlag=false;
	 				    utilsFp.confirmIcon(3,"","","", "数据库查询错误",0,"","");
	 				    wmsOption = "<option value=''>--请选择--</option>";
	 				    var table1Trs = $("#itemTable tbody tr");
                        
                        for(var i=0;i<table1Trs.length;i++){
                            wmsSel = "<select id='dd"+i+"' name='' class=' input isSubmit  _VAL_OjbsData _VAL_DATABASE dept_select' style='width:200px;display:none;'>" + wmsOption + "</select>";
                            var tempVal=$("#itemTable tbody tr:eq(" + i + ")").find("td:eq(3) select").val();
                            $("#itemTable tbody tr:eq(" + i + ")").find("td:eq(3)").html("");
                            $("#itemTable tbody tr:eq(" + i + ")").find("td:eq(3)").append(wmsSel);	
    
                	        mySetChosen();
                            
                            $("#dd"+i+"_chosen").attr("style","width:200px;");
                        }
                        
                        var table2Trs = $("#printTable tbody tr");
                        
                        for(var i=0;i<table2Trs.length;i++){
                            wmsSel = "<select id='ddd"+i+"' name='' class=' input isSubmit  _VAL_OjbsData _VAL_DATABASE dept_select' style='width:200px;display:none;'>" + wmsOption + "</select>";
                            var tempVal=$("#printTable tbody tr:eq(" + i + ")").find("td:eq(3) select").val();
                            $("#printTable tbody tr:eq(" + i + ")").find("td:eq(3)").html("");
                            $("#printTable tbody tr:eq(" + i + ")").find("td:eq(3)").append(wmsSel);	
    
                	        mySetChosen();
                            
                            $("#ddd"+i+"_chosen").attr("style","width:200px;");
                        }
	 				    return;
	 				}else{
	 				    analysisFlag=true;
    					if(null != data.ajaxList) {
    						var rccList = eval(data.ajaxList);
    						
                            if(rccList.length==0){
                                wmsOption = "<option value=''>--请选择--</option>";
        	 				    var table1Trs = $("#itemTable tbody tr");
                                
                                for(var i=0;i<table1Trs.length;i++){
                                    wmsSel = "<select id='dd"+i+"' name='' class=' input isSubmit  _VAL_OjbsData _VAL_DATABASE dept_select' style='width:200px;display:none;'>" + wmsOption + "</select>";
                                    var tempVal=$("#itemTable tbody tr:eq(" + i + ")").find("td:eq(3) select").val();
                                    $("#itemTable tbody tr:eq(" + i + ")").find("td:eq(3)").html("");
                                    $("#itemTable tbody tr:eq(" + i + ")").find("td:eq(3)").append(wmsSel);	
            
                        	        mySetChosen();
                                    
                                    $("#dd"+i+"_chosen").attr("style","width:200px;");
                                }
                                
                                var table2Trs = $("#printTable tbody tr");
                                
                                for(var i=0;i<table2Trs.length;i++){
                                    wmsSel = "<select id='ddd"+i+"' name='' class=' input isSubmit  _VAL_OjbsData _VAL_DATABASE dept_select' style='width:200px;display:none;'>" + wmsOption + "</select>";
                                    var tempVal=$("#printTable tbody tr:eq(" + i + ")").find("td:eq(3) select").val();
                                    $("#printTable tbody tr:eq(" + i + ")").find("td:eq(3)").html("");
                                    $("#printTable tbody tr:eq(" + i + ")").find("td:eq(3)").append(wmsSel);	
            
                        	        mySetChosen();
                                    
                                    $("#ddd"+i+"_chosen").attr("style","width:200px;");
                                }
                            }else{	
                                
                                //解析成功
                                if(loadFlag=="second_load"){
                        	        msgPop(data.ajaxMap.alertMsg,"",data.ajaxMap.title,data.ajaxMap.width.ajaxMap,data.height,data.ajaxMap.time,"");
                        	    }
                                
                               //$("#itemTable tr:last").append("<td>&nbsp;</td>	");
                               wmsOption = "<option value=''>--请选择--</option>";
                               //wmsOption2 = "<option value=''>--请选择--</option>";
        						for(var i = 0; i < rccList.length; i++) {
        						    //wmsOption = wmsOption + "<option value='" + rccList[i] + "'>" + rccList[i] + "</option>";
    						        wmsOption2 = wmsOption2 + "<li class='active-result' data-option-array-index='" + (i+1) + "'>" + rccList[i] + "</li>";
							        wmsOption = wmsOption + "<option value='" + rccList[i] + "'>" + rccList[i] + "</option>";
        						} 
        					    //wmsSel = "<select id='dd' name='' class=' input isSubmit  _VAL_OjbsData _VAL_DATABASE dept_select' style='width:200px;display:none;'>" + wmsOption + "</select>";
                            
                                var table1Trs = $("#itemTable tbody tr");
                        
                                for(var i=0;i<table1Trs.length;i++){
                                    wmsSel = "<select id='dd"+i+"' name='' class=' input isSubmit  _VAL_OjbsData _VAL_DATABASE dept_select' style='width:200px;display:none;'>" + wmsOption + "</select>";//
                                    var tempVal=$("#itemTable tbody tr:eq(" + i + ")").find("td:eq(3) select").val();
                                    //$("#itemTable tbody tr:eq(" + i + ")").find("td:eq(3)").html("");
                                    
                                    $("#itemTable tbody tr:eq(" + i + ")").find("td:eq(3)").html("");
                                    $("#itemTable tbody tr:eq(" + i + ")").find("td:eq(3)").append(wmsSel);	
                                    
                                    $("#itemTable tbody tr:eq(" + i + ")").find("td:eq(3) select").val(tempVal);
                        	        mySetChosen();
                                    
                                    $("#dd"+i+"_chosen").attr("style","width:200px;");
                                    
                                    //var tempVal=$("#itemTable tbody tr:eq(" + i + ")").find("td:eq(3) select").val();
                                    //$("#itemTable tbody tr:eq(" + i + ")").find("td:eq(3) select").append(wmsOption);
                                    //$("#itemTable tbody tr:eq(" + i + ")").find("td:eq(3) select").val(tempVal);
                                    //$("#ss"+i+"_chosen ul").append(wmsOption2);
                                    //$("#itemTable tr:eq(" + i + ") .chosen-container .chosen-results").html(wmsOption2);
                                    
                                }
                                
                                
                                
                                var table2Trs = $("#printTable tbody tr");
                                
                                for(var i=0;i<table2Trs.length;i++){
                                    wmsSel = "<select id='ddd"+i+"' name='' class=' input isSubmit  _VAL_OjbsData _VAL_DATABASE dept_select' style='width:200px;display:none;'>" + wmsOption + "</select>";
                                    var tempVal=$("#printTable tbody tr:eq(" + i + ")").find("td:eq(3) select").val();
                                    $("#printTable tbody tr:eq(" + i + ")").find("td:eq(3)").html("");
                                    $("#printTable tbody tr:eq(" + i + ")").find("td:eq(3)").append(wmsSel);	
            
                                    $("#printTable tbody tr:eq(" + i + ")").find("td:eq(3) select").val(tempVal);
                        	        mySetChosen();
                                    
                                    $("#ddd"+i+"_chosen").attr("style","width:200px;");
                                }
                                
                                
                            }
                            
    					}
                        
                    }
				},
				error: function(msg) {
					util.closeLoading();
					utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "300", "");
				}
			});
			return analysisFlag;
    	}
    	
		function editInfo(){
		    
		    if($("#deptLs_data_auth").val()==""){
                _alertValMsg($("#deptLs_data_auth_chosen"), "<dict:lang value="该项不能为空" />");
    	    	return;
            }
		    if($("#paraMapObj_CLD_SQL").val()==""){
                _alertValMsg($("#paraMapObj_CLD_SQL"), "<dict:lang value="该项不能为空" />");
    	    	return;
            }
            var flag=exeAnalysis();
            if(flag==false){
                
            }else{
                addInfo();
            }
    	}
    	function exeAnalysis(){
    	    analysis("first_load");
    	    return analysisFlag;
    	}
    	function addInfo(){
    	    var table1Trs = $("#itemTable tbody tr");
            var oNames="";
            var colVals="";
            var listFlags="";
            var itemAlias="";
            for(var i=0;i<table1Trs.length;i++){
	            
                var oName=$("#itemTable tbody tr:eq(" + i + ")").find("td:eq(0)").text();
                var colVal=$("#itemTable tbody tr:eq(" + i + ")").find("td:eq(3) select").val();
                
                //if(colVal!=""){
                    oNames=oNames+ oName+",";
                    colVals=colVals+ colVal+",";
                //}
            }
            for(var i=0;i<table1Trs.length;i++){
	             var checkBoxId="#checkbox"+(i+1);
	             var oName=$("#itemTable tbody tr:eq(" + i + ")").find("td:eq(0)").text();
	             if($(checkBoxId).attr("checked")=="checked"){
        	        listFlags=listFlags+ "Y,";
        	        itemAlias=itemAlias+ oName+",";
        	     }else{
        	        listFlags=listFlags+ "N,";
        	     }
            }
			$("#oNames").val(oNames);
			$("#colVals").val(colVals);
			$("#listFlags").val(listFlags);
			$("#itemAlias").val(itemAlias);
			
			var codeAlias=$("#printTable tbody tr:eq(0)").find("td:eq(3) select").val();
            var numAlias=$("#printTable tbody tr:eq(1)").find("td:eq(3) select").val();
			$("#codeAlias").val(codeAlias);
			$("#numAlias").val(numAlias);
			document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=9a85b13731cc43d880a409656ae19fa8";
            document.forms.editForm.submit();
    	}
    	
    	function _clear(){
    	    $("#itemTable tbody tr").find("td:eq(3) .chosen-container:last").siblings('.chosen-container').remove()
            $("#printTable tbody tr").find("td:eq(3) .chosen-container:last").siblings('.chosen-container').remove()
    	}
    	
    	function clickCheckBox(index){
    	    var checkBoxId="#checkbox"+index;
    	    var buttonId="#button"+index;
    	    if($(checkBoxId).attr("checked")=="checked"){
    	        $(buttonId).attr("style","display:block");
    	    }else{
    	        $(buttonId).attr("style","display:none");
    	    }
    	}
    	
    	function analysisList(type){
    	    if($('#paraMapObj_CLD_DISPLAY_WAY').val()==""){
    	        _alertValMsg($('#paraMapObj_CLD_DISPLAY_WAY_chosen'),"<dict:lang value="该项不能为空" />");
    	        return;
    	    }
    	    if($('#listSql').val()==""){
    	        _alertValMsg($('#listSql'),"<dict:lang value="该项不能为空" />");
    	        return;
    	    }
    	    var borderFlagOption ="<select id='borderFlagSel1' class='selector1 input isSubmit _VAL_OjbsData dept_select' name='borderFlagSel' style='width:200px;text-align:left' ><option value='Y'>"+"是"+"</option><option value='N'>"+"否"+"</option></select>";
            var barcideTypeOption="<select id='barcideTypeSel1' class='selector1 input isSubmit _VAL_OjbsData dept_select' name='barcideTypeSel' style='width:200px;text-align:left' disabled='disabled'><option value=''>--请选择--</option><option value='code39'>code39</option><option value='code93'>code93</option><option value='EAN8'>EAN8</option><option value='EAN13'>EAN13</option><option value='UPC_E'>UPC_E</option><option value='UPC_A'>UPC_A</option><option value='qrcode'>qrcode</option><option value='pdf47'>pdf47</option></select>";
            var printWayOption="<select id='printWaySel1' class='selector1 input isSubmit _VAL_OjbsData dept_select' name='printWaySel' style='width:200px;text-align:left' onchange='selChange();'><option value='1'>字符</option><option value='2'>条码</option></select>";
            
    	    var diaplayWay=$('#paraMapObj_CLD_DISPLAY_WAY').val();
    	    var listSql=$('#listSql').val();
    	    var jsondata={"diaplayWay":diaplayWay,"listSql":listSql};
    	    util.showLoading("处理中...");
			$.ajax({
				type: "POST",
				dataType: "json",
				url: "buss/bussModel_exeFunc.ms?funcMId=966570718a92453fba119fe78d972d3d",
				data: jsondata,
				async:false,
				success: function(data) {
				    if(type!="check"){
    					$("#listTable tbody").empty();
    					$("#listTitleTable tbody").empty();	
                    }
					util.closeLoading();
					var dataStr=data.ajaxString;
					if(dataStr=="ERROR"){
					    utilsFp.confirmIcon(3,"","","", "数据库查询错误",0,"","");
					    $("#listTable tbody").empty();
					    $("#listTitleTable tbody").empty();
					    $("#listTable").removeClass("dlist-table");
                        $("#listTable").removeClass("table-line");
                        $("#listTitleTable").removeClass("dlist-table");
                        $("#listTitleTable").removeClass("table-line");
                        if(type=="check"){
                            checkFlag=true;
                        }
					}else{
					    if(null != data.ajaxList) {
					    	
    						var rccList = eval(data.ajaxList);
    						
                            if(rccList.length==0){
                                
                            }else{
                               var dataMap=data.ajaxMap;
                               if(diaplayWay=="1"){
                                   //列表显示
                                   if(type!="check"){
                                       $("#listTitleDiv").attr("style","display:block");
                                       $("#listTable").addClass("dlist-table");
                                       $("#listTable").addClass("table-line");
                                       $("#listTitleTable").addClass("dlist-table");
                                       $("#listTitleTable").addClass("table-line");
                                       $("#listTitleTable tbody:last").append("<thead style='width: 255px;'></thead>");
                                       $("#listTitleTable tbody thead:last").append("<tr></tr>");
                                       $("#listTitleTable tbody thead tr:last").append("<th style='width: 123px;text-align: center;'><dict:lang value='列名' /></th>");
                                       $("#listTitleTable tbody thead tr:last").append("<th style='width: 131px;text-align: center;'><dict:lang value='列宽(PX)' /></th>");
                                       for(var i = 0; i < rccList.length; i++) {
                							if(rccList[i] == null) rccList[i] = "";
                							
                							$("#listTable tbody:last").append("<tr id='tr1_" + i + "' ></tr>");
                							$("#listTable tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:123px;text-align: center;'>" + rccList[i] + "</td>");
                							$("#listTable tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:131px;text-align: center;'><input type='text' style='width: 120px;padding:1px;text-align: left;' maxlength='50' maxlength='50' class=' input isSubmit' id='WIDTH_NUM"+(i+1)+"' name='WIDTH_NUM' value='' oninput='OnInput2(event,\"WIDTH_NUM"+(i+1)+"\")'/></td>");
            						 	}
            					   }
                               }else{
                                   //数据排列
                                   if(dataStr=="LEN_ERROR"){
                					    utilsFp.confirmIcon(3,"","","", "解析结果返回多个查询列",0,"","");
                					    $("#listTable tbody").empty();
                					    $("#listTitleTable tbody").empty();
                					    $("#listTable").removeClass("dlist-table");
                                        $("#listTable").removeClass("table-line");
                                        $("#listTitleTable").removeClass("dlist-table");
                                        $("#listTitleTable").removeClass("table-line");
                                        if(type=="check"){
                                            checkFlag=true;
                                        }
                					}else{	
                					    if(type!="check"){
                                            $("#listTable tbody").empty();
                                            $("#listTitleTable tbody").empty();
                                            $("#listTable").removeClass("dlist-table");
                                            $("#listTable").removeClass("table-line");
                                            $("#listTitleTable").removeClass("dlist-table");
                                            $("#listTitleTable").removeClass("table-line");
                                            $("#listTitleDiv").attr("style","display:none");
                                            
                                            $("#listTable tbody:last").append("<tr id='tr1_0' style='display:none;' ></tr>");
                							$("#listTable tr:last").append("<td class='name' style='width:123px;text-align: center;'>"+rccList[0]+"</td>");
                							$("#listTable tr:last").append("<td class='dec' style='width:131px;text-align: center;'></td>");
                							
                                            $("#listTable tbody:last").append("<tr id='tr1_1' style='display:none;'></tr>");
                							$("#listTable tr:last").append("<td class='name' style='width:123px;text-align: center;'>行数</td>");
                							$("#listTable tr:last").append("<td class='dec' style='width:131px;text-align: center;'><input type='text' style='width: 200px;padding:1px;text-align: left;' maxlength='50' maxlength='50' class=' input isSubmit' id='ROW_NUM"+(i+1)+"' name='ROW_NUM' value='' oninput='OnInput2(event,\"ROW_NUM"+(i+1)+"\")'/></td>");
                							
                							$("#listTable tbody:last").append("<tr id='tr1_2' ></tr>");
                							$("#listTable tr:last").append("<td class='name' style='width:123px;text-align: center;'>列数</td>");
                							$("#listTable tr:last").append("<td class='dec' style='width:131px;text-align: center;'><input type='text' style='width: 200px;padding:1px;text-align: left;' maxlength='50' maxlength='50' class=' input isSubmit' id='COL_NUM"+(i+1)+"' name='COL_NUM' value='' oninput='OnInput2(event,\"COL_NUM"+(i+1)+"\")'/></td>");
                                        
                					        $("#listTable tbody:last").append("<tr id='tr1_3' ></tr>");
                        					$("#listTable tr:last").append("<td class='name' style='width:123px;text-align: center;'>打印方式</td>");
                        					$("#listTable tr:last").append("<td class='dec' style='width:131px;text-align: center;'>"+printWayOption+"</td>");
                        					
                                            $("#listTable tbody:last").append("<tr id='tr1_4' ></tr>");
                        					$("#listTable tr:last").append("<td class='name' style='width:123px;text-align: center;'>码制</td>");
                        					$("#listTable tr:last").append("<td class='dec' style='width:131px;text-align: center;'>"+barcideTypeOption+"</td>");
                        										
                                            $("#listTable tbody:last").append("<tr id='tr1_5' ></tr>");
                        					$("#listTable tr:last").append("<td class='name' style='width:123px;text-align: center;'>边框</td>");
                        					$("#listTable tr:last").append("<td class='dec' style='width:131px;text-align: center;'>"+borderFlagOption+"</td>");
                        					
                        					mySetChosen();
                					    }		
                                    }
                               }
                            }
    					}
					}
				},
				error: function(msg) {
				    $("#itemTbody").empty();
					utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "300", "");
					util.closeLoading();				
                    if(type=="check"){
                        checkFlag=true;
                    }
				}
			});
    	}
    	
    	function OnInput2(event,thisObj) {
            var newContent=event.target.value;
            var objId="#"+thisObj;
            //范围值
            if(!(/^(\+|-)?\d+$/.test( newContent))){
				$(objId).val("");
				_alertValMsg($(objId), "<dict:lang value="该项只能输入零或正整数" />");
				flag=true;
            }
        }
        
        $("#paraMapObj_CLD_DISPLAY_WAY").change(function(){
              analysisList();
        });
        
        var checkFlag=false;
        function saveListInfo(showId,backId){
            analysisList("check");
            if(checkFlag==false){
                var itemSqlId="#itemSql"+listIndex;
        	    var displayWayId="#displayWay"+listIndex;
        	    var itemInfoId="#itemInfo"+listIndex;
        	    var displayWay=$('#paraMapObj_CLD_DISPLAY_WAY').val();
        	    $(displayWayId).val(displayWay);
        	    $(itemSqlId).val($('#listSql').val());
        	    var trs = $("#listTable tbody tr");
        	    var itemInfo="";
        	    if(displayWay=="1"){
        	        for(var i = 0; i < trs.length; i++) {
        	            itemInfo+=$("#listTable tbody  tr:eq(" + i + ")").find("td:eq(0)").text();
        	            itemInfo+=",";
        	            if($("#listTable tbody  tr:eq(" + i + ")").find("td:eq(1) input").val()==""){
        	                itemInfo+="80";
        	            }else{
        	                itemInfo+=$("#listTable tbody  tr:eq(" + i + ")").find("td:eq(1) input").val();
        	            }
        	            itemInfo+="&&"
        	        }
        	    }else{
        	        itemInfo+=$("#listTable tbody  tr:eq(0)").find("td:eq(0)").text()+",";
        	        if($("#listTable tbody  tr:eq(1)").find("td:eq(1) input").val()==""){
    	                itemInfo+="20,";
    	            }else{
    	                itemInfo+=$("#listTable tbody  tr:eq(1)").find("td:eq(1) input").val()+",";
    	            }
    	            if($("#listTable tbody  tr:eq(2)").find("td:eq(1) input").val()==""){
    	                itemInfo+="20,";
    	            }else{
    	                itemInfo+=$("#listTable tbody  tr:eq(2)").find("td:eq(1) input").val()+",";
    	            }
    	            itemInfo+=$("#listTable tbody  tr:eq(3)").find("td:eq(1) select").val()+",";
    	            itemInfo+=$("#listTable tbody  tr:eq(4)").find("td:eq(1) select").val()+",";
    	            itemInfo+=$("#listTable tbody  tr:eq(5)").find("td:eq(1) select").val()+",";
        	    }
        	    $(itemInfoId).val(itemInfo);
        	    hideDiv(showId, backId) 
    	    }
        }
        
        function backInfoShow(){
            var labelId=$("input[name='dataId']").val();  //listCodeAlias
            var displayWayId="#displayWay"+listIndex;
            var itemSqlId="#itemSql"+listIndex;
    	    var itemInfoId="#itemInfo"+listIndex;
    	    var itemAliasId="#itemAlias"+listIndex;
    	    var itemInfo=$(itemInfoId).val();
    	    var itemAlias=$(itemAliasId).val();
    	    $("#listTable tbody").empty();
		    $("#listTitleTable tbody").empty();			
            $("#listSql").val("");
            $("#paraMapObj_CLD_DISPLAY_WAY").val("0");
            $("#paraMapObj_CLD_DISPLAY_WAY").trigger("chosen:updated");
            $("#listTable").removeClass("dlist-table");
            $("#listTable").removeClass("table-line");
            $("#listTitleTable").removeClass("dlist-table");
            $("#listTitleTable").removeClass("table-line");
            
            var borderFlagOption ="<select id='borderFlagSel1' class='selector1  input isSubmit _VAL_OjbsData _VAL_DATABASE dept_select' name='borderFlagSel' style='width:200px;text-align:left'><option value='Y'>"+"是"+"</option><option value='N'>"+"否"+"</option></select>";
            var barcideTypeOption="<select id='barcideTypeSel1' class='selector1 input isSubmit _VAL_OjbsData _VAL_DATABASE dept_select' name='barcideTypeSel' style='width:200px;text-align:left'  disabled='disabled'><option value=''>--请选择--</option><option value='code39'>code39</option><option value='code93'>code93</option><option value='EAN8'>EAN8</option><option value='EAN13'>EAN13</option><option value='UPC_E'>UPC_E</option><option value='UPC_A'>UPC_A</option><option value='qrcode'>qrcode</option><option value='pdf47'>pdf47</option></select>";
            var printWayOption="<select id='printWaySel1' class='selector1 input isSubmit _VAL_OjbsData _VAL_DATABASE dept_select' name='printWaySel'  style='width:200px;text-align:left' onchange='selChange();'><option value='1'>字符</option><option value='2'>条码</option></select>";
            
            if($(displayWayId).val()!=""){	
			    $("#listSql").val($(itemSqlId).val());
                if($(displayWayId).val()=="1"){
                   //列表显示
                   $("#paraMapObj_CLD_DISPLAY_WAY").val($(displayWayId).val());
                   $("#paraMapObj_CLD_DISPLAY_WAY").trigger("chosen:updated");
                   $("#listTitleDiv").attr("style","display:block");
                   $("#listTable").addClass("dlist-table");
                   $("#listTable").addClass("table-line");
                   $("#listTitleTable").addClass("dlist-table");
                   $("#listTitleTable").addClass("table-line");
                   $("#listTitleTable tbody:last").append("<thead style='width: 255px;'></thead>");
                   $("#listTitleTable tbody thead:last").append("<tr></tr>");
                   $("#listTitleTable tbody thead tr:last").append("<th style='width: 123px;text-align: center;'><dict:lang value='列名' /></th>");
                   $("#listTitleTable tbody thead tr:last").append("<th style='width: 131px;text-align: center;'><dict:lang value='列宽(PX)' /></th>");
                   var tempStrs=itemInfo.split("&&");
                   
                   for(var i = 0; i < tempStrs.length-1; i++) {
						var tempStrs2=tempStrs[i].split(",");
						$("#listTable tbody:last").append("<tr id='tr1_" + i + "' ></tr>");
						$("#listTable tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:123px;text-align: center;'>" + tempStrs2[0] + "</td>");
						$("#listTable tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:131px;text-align: center;'><input type='text' style='width: 120px;padding:1px;text-align: left;' maxlength='50' maxlength='50' class=' input isSubmit' id='WIDTH_NUM"+(i+1)+"' name='WIDTH_NUM' value='"+tempStrs2[1]+"' oninput='OnInput2(event,\"WIDTH_NUM"+(i+1)+"\")'/></td>");
				 	}
               }else if($(displayWayId).val()=="2"){
                   //数据排列
                    var tempStrs=itemInfo.split(",");
                    $("#paraMapObj_CLD_DISPLAY_WAY").val($(displayWayId).val());
                    $("#paraMapObj_CLD_DISPLAY_WAY").trigger("chosen:updated");
                    $("#listTable tbody").empty();
                    $("#listTitleTable tbody").empty();
                    $("#listTable").removeClass("dlist-table");
                    $("#listTable").removeClass("table-line");
                    $("#listTitleTable").removeClass("dlist-table");
                    $("#listTitleTable").removeClass("table-line");
                    $("#listTitleDiv").attr("style","display:none");
                    
                    $("#listTable tbody:last").append("<tr id='tr1_0' style='display:none;' ></tr>");
					$("#listTable tr:last").append("<td class='name' style='width:123px;text-align: center;'>"+tempStrs[0]+"</td>");
					$("#listTable tr:last").append("<td class='dec' style='width:131px;text-align: center;'></td>");
					
                    $("#listTable tbody:last").append("<tr id='tr1_1' style='display:none;' ></tr>");
					$("#listTable tr:last").append("<td class='name' style='width:123px;text-align: center;'>行数</td>");
					$("#listTable tr:last").append("<td class='dec' style='width:131px;text-align: center;'><input type='text' style='width: 200px;padding:1px;text-align: left;' maxlength='50' maxlength='50' class=' input isSubmit' id='ROW_NUM"+(i+1)+"' name='ROW_NUM' value='' oninput='OnInput2(event,\"ROW_NUM"+(i+1)+"\")'/></td>");
					
					$("#listTable tbody:last").append("<tr id='tr1_2' ></tr>");
					$("#listTable tr:last").append("<td class='name' style='width:123px;text-align: center;'>列数</td>");
					$("#listTable tr:last").append("<td class='dec' style='width:131px;text-align: center;'><input type='text' style='width: 200px;padding:1px;text-align: left;' maxlength='50' maxlength='50' class=' input isSubmit' id='COL_NUM"+(i+1)+"' name='COL_NUM' value='"+tempStrs[2]+"' oninput='OnInput2(event,\"COL_NUM"+(i+1)+"\")'/></td>");
               
                   $("#listTable tbody:last").append("<tr id='tr1_3' ></tr>");
					$("#listTable tr:last").append("<td class='name' style='width:123px;text-align: center;'>打印方式</td>");
					$("#listTable tr:last").append("<td class='dec' style='width:131px;text-align: center;'>"+printWayOption+"</td>");
					
                    $("#listTable tbody:last").append("<tr id='tr1_4' ></tr>");
					$("#listTable tr:last").append("<td class='name' style='width:123px;text-align: center;'>码制</td>");
					$("#listTable tr:last").append("<td class='dec' style='width:131px;text-align: center;'>"+barcideTypeOption+"</td>");
										
                    $("#listTable tbody:last").append("<tr id='tr1_5' ></tr>");
					$("#listTable tr:last").append("<td class='name' style='width:123px;text-align: center;'>边框</td>");
					$("#listTable tr:last").append("<td class='dec' style='width:131px;text-align: center;'>"+borderFlagOption+"</td>");
					
					$("#printWaySel1").val(tempStrs[3]);
					$("#barcideTypeSel1").val(tempStrs[4]);
					if(tempStrs[3]=="1"){
					    $("#barcideTypeSel1").attr("disabled",true);
					    $("#barcideTypeSel1_chosen").attr("disabled",true);
					}else{
					    $("#barcideTypeSel1").removeAttr("disabled");
					    $("#barcideTypeSel1_chosen").removeAttr("disabled");
					}
					$("#borderFlagSel1").val(tempStrs[5]);
					mySetChosen();
               }
            }else{
                //从数据库里查
                var jsondata={"labelId":labelId,"itemAlias":itemAlias,"type":"item"};
                util.showLoading("处理中...");
    			$.ajax({
    				type: "POST",
    				dataType: "json",
    				url: "buss/bussModel_exeFunc.ms?funcMId=d8925db5b4eb451c8c9c2b3c1528354b",
    				data: jsondata,
    				success: function(data) {
    					$("#listTable tbody").empty();
    					$("#listTitleTable tbody").empty();
    					util.closeLoading();
    					var dataStr=data.ajaxString;
    					if(dataStr=="ERROR"){
    					    utilsFp.confirmIcon(3,"","","", "数据库查询错误",0,"","");
    					    $("#listTable tbody").empty();
    					    $("#listTitleTable tbody").empty();
    					    $("#listTable").removeClass("dlist-table");
                            $("#listTable").removeClass("table-line");
                            $("#listTitleTable").removeClass("dlist-table");
                            $("#listTitleTable").removeClass("table-line");				
                            $("#paraMapObj_CLD_DISPLAY_WAY").val("0");
                            $("#paraMapObj_CLD_DISPLAY_WAY").trigger("chosen:updated");
    					}else{
    					    if(null != data.ajaxList) {
    					    	
        						var rccList = eval(data.ajaxList);
        						
                                if(rccList.length==0){
                                    
                                }else{
                                   var diaplayWay=rccList[0].CLD_DISPLAY_WAY
                                   var dataMap=data.ajaxMap;
                                   $("#listSql").val(dataMap.CLD_SQL);
                                   $("#paraMapObj_CLD_DISPLAY_WAY").val(diaplayWay);
                                   $("#paraMapObj_CLD_DISPLAY_WAY").trigger("chosen:updated");
                                   if(diaplayWay=="1"){
                                       //列表显示
                                       $("#listTitleDiv").attr("style","display:block");
                                       $("#listTable").addClass("dlist-table");
                                       $("#listTable").addClass("table-line");
                                       $("#listTitleTable").addClass("dlist-table");
                                       $("#listTitleTable").addClass("table-line");
                                       $("#listTitleTable tbody:last").append("<thead style='width: 255px;'></thead>");
                                       $("#listTitleTable tbody thead:last").append("<tr></tr>");
                                       $("#listTitleTable tbody thead tr:last").append("<th style='width: 123px;text-align: center;'><dict:lang value='列名' /></th>");
                                       $("#listTitleTable tbody thead tr:last").append("<th style='width: 131px;text-align: center;'><dict:lang value='列宽(PX)' /></th>");
                                       for(var i = 0; i < rccList.length; i++) {
                							if(rccList[i] == null) rccList[i] = "";
                							
                							$("#listTable tbody:last").append("<tr id='tr1_" + i + "' ></tr>");
                							$("#listTable tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:123px;text-align: center;'>" + rccList[i].CLD_COLUMN_NAME + "</td>");
                							$("#listTable tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:131px;text-align: center;'><input type='text' style='width: 120px;padding:1px;text-align: left;' maxlength='50' maxlength='50' class=' input isSubmit' id='WIDTH_NUM"+(i+1)+"' name='WIDTH_NUM' value='"+rccList[i].CLD_COLUMN_WIDTH+"' oninput='OnInput2(event,\"WIDTH_NUM"+(i+1)+"\")'/></td>");
            						 	}
                                   }else{
                                       //数据排列
                                        $("#listTable tbody").empty();
                                        $("#listTitleTable tbody").empty();
                                        $("#listTable").removeClass("dlist-table");
                                        $("#listTable").removeClass("table-line");
                                        $("#listTitleTable").removeClass("dlist-table");
                                        $("#listTitleTable").removeClass("table-line");
                                        $("#listTitleDiv").attr("style","display:none");
                                        
                                        $("#listTable tbody:last").append("<tr id='tr1_0' style='display:none;' ></tr>");
            							$("#listTable tr:last").append("<td class='name' style='width:123px;text-align: center;'>"+rccList[0].CLD_COLUMN_NAME+"</td>");
            							$("#listTable tr:last").append("<td class='dec' style='width:131px;text-align: center;'></td>");
            							
                                        $("#listTable tbody:last").append("<tr id='tr1_1' style='display:none;' ></tr>");
            							$("#listTable tr:last").append("<td class='name' style='width:123px;text-align: center;'>行数</td>");
            							$("#listTable tr:last").append("<td class='dec' style='width:131px;text-align: center;'><input type='text' style='width: 200px;padding:1px;text-align: left;' maxlength='50' maxlength='50' class=' input isSubmit' id='ROW_NUM"+(i+1)+"' value='' name='ROW_NUM' value='"+rccList[0].CLD_ROW+"' oninput='OnInput2(event,\"ROW_NUM"+(i+1)+"\")'/></td>");
            							
            							$("#listTable tbody:last").append("<tr id='tr1_2' ></tr>");
            							$("#listTable tr:last").append("<td class='name' style='width:123px;text-align: center;'>列数</td>");
            							$("#listTable tr:last").append("<td class='dec' style='width:131px;text-align: center;'><input type='text' style='width: 200px;padding:1px;text-align: left;' maxlength='50' maxlength='50' class=' input isSubmit' id='COL_NUM"+(i+1)+"' name='COL_NUM' value='"+rccList[0].CLD_COLUMN+"' oninput='OnInput2(event,\"COL_NUM"+(i+1)+"\")'/></td>");
                                        
                                        $("#listTable tbody:last").append("<tr id='tr1_3' ></tr>");
                    					$("#listTable tr:last").append("<td class='name' style='width:123px;text-align: center;'>打印方式</td>");
                    					$("#listTable tr:last").append("<td class='dec' style='width:131px;text-align: center;'>"+printWayOption+"</td>");
                    					
                                        $("#listTable tbody:last").append("<tr id='tr1_4' ></tr>");
                    					$("#listTable tr:last").append("<td class='name' style='width:123px;text-align: center;'>码制</td>");
                    					$("#listTable tr:last").append("<td class='dec' style='width:131px;text-align: center;'>"+barcideTypeOption+"</td>");
                    										
                                        $("#listTable tbody:last").append("<tr id='tr1_5' ></tr>");
                    					$("#listTable tr:last").append("<td class='name' style='width:123px;text-align: center;'>边框</td>");
                    					$("#listTable tr:last").append("<td class='dec' style='width:131px;text-align: center;'>"+borderFlagOption+"</td>");
                    					
                    					$("#printWaySel1").val(rccList[0].CLD_PRINT_WAY);
                    					$("#barcideTypeSel1").val(rccList[0].CLD_BARCODE_TYPE);
                    					if(rccList[0].CLD_PRINT_WAY=="1"){
                    					    $("#barcideTypeSel1").attr("disabled",true);
                    					    $("#barcideTypeSel1_chosen").attr("disabled",true);
                    					}else{
                    					    $("#barcideTypeSel1").removeAttr("disabled");
                    					    $("#barcideTypeSel1_chosen").removeAttr("disabled");
                    					}
                    					$("#borderFlagSel1").val(rccList[0].CLD_BORDER_FLAG);
                    					mySetChosen();
                                   }
                                }
        					}
    					}
    				},
    				error: function(msg) {
    				    $("#itemTbody").empty();
    					utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "300", "");
    					util.closeLoading();
    				}
    			});
            }
        }
        function selChange(){
            var type=$("#printWaySel1").val();	
            if(type=="2"){
			    $("#barcideTypeSel1").removeAttr("disabled");
                $("#barcideTypeSel1_chosen").removeAttr("disabled");
                $("#barcideTypeSel1").trigger("chosen:updated");
                $("#barcideTypeSel1_chosen").trigger("chosen:updated");
            }else{
				$("#barcideTypeSel1").attr("disabled","disabled");
                $("#barcideTypeSel1_chosen").attr("disabled","disabled");							
                $("#barcideTypeSel1").val("");
			    $("#barcideTypeSel1").trigger("chosen:updated");
            }
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
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
