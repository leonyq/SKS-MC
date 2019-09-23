<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
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
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="inHead" />
  </jsp:include> 
	<!-- head里面 -->
	
	<!-- 产品静态资源 -->
<script type="text/javascript">
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
			    	        <button type="button" onclick="analysis('second_load');"><i class="ico ico-save"></i><dict:lang value="解析" /></button>
			    	        <button type="button" onclick="editInfo();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="1b93e70af7b84ddf8ddb462e287b9087" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="1b93e70af7b84ddf8ddb462e287b9087" />
	<input type="hidden" id="prefixInd" name="1b93e70af7b84ddf8ddb462e287b9087" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'b666fa48ce64479287c25e9cc650aa05'" />
		<s:set name="_$formId_1" value="'1b93e70af7b84ddf8ddb462e287b9087'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td style="width:65px;" class="name" /><span class="dot">*</span><bu:uitn colNo="CDS_ADD_TYPE" formId="1b93e70af7b84ddf8ddb462e287b9087" /></td>
			<bu:td cssClass="dec" colNo="CDS_ADD_TYPE" formId="1b93e70af7b84ddf8ddb462e287b9087" ><bu:ui colNo="CDS_ADD_TYPE" formId="1b93e70af7b84ddf8ddb462e287b9087" value="%{CDS_ADD_TYPE}" formIndex="1" /></bu:td>
			
			<td style="width:65px;" class="name" /><span class="dot">*</span><bu:uitn colNo="CDS_DEVICE_TYPE" formId="1b93e70af7b84ddf8ddb462e287b9087" /></td>
			<bu:td cssClass="dec" colNo="CDS_DEVICE_TYPE" formId="1b93e70af7b84ddf8ddb462e287b9087" ><bu:ui  colNo="CDS_DEVICE_TYPE" formId="1b93e70af7b84ddf8ddb462e287b9087" value="%{CDS_DEVICE_TYPE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td style="width:65px;" class="name" /><span class="dot">*</span><bu:uitn colNo="CDS_DEVICE_SN" formId="1b93e70af7b84ddf8ddb462e287b9087" /></td>
			<bu:td cssClass="dec" colNo="CDS_DEVICE_SN" formId="1b93e70af7b84ddf8ddb462e287b9087" ><bu:ui colNo="CDS_DEVICE_SN" formId="1b93e70af7b84ddf8ddb462e287b9087" value="%{CDS_DEVICE_SN}" formIndex="1" /></bu:td>
			
			<td style="width:65px;" class="name" /><bu:uitn colNo="CDS_AREA_SN" formId="1b93e70af7b84ddf8ddb462e287b9087" /></td>
			<bu:td cssClass="dec" colNo="CDS_AREA_SN" formId="1b93e70af7b84ddf8ddb462e287b9087" ><bu:ui colNo="CDS_AREA_SN" formId="1b93e70af7b84ddf8ddb462e287b9087" value="%{CDS_AREA_SN}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td style="width:65px;" class="name" /><bu:uitn colNo="CDS_AREA_NAME" formId="1b93e70af7b84ddf8ddb462e287b9087" /></td>
			<bu:td cssClass="dec" colNo="CDS_AREA_NAME" formId="1b93e70af7b84ddf8ddb462e287b9087" ><bu:ui colNo="CDS_AREA_NAME" formId="1b93e70af7b84ddf8ddb462e287b9087" value="%{CDS_AREA_NAME}" formIndex="1" /></bu:td>
			
			<td style="width:65px;" class="name" /><bu:uitn colNo="CREATE_USER" formId="1b93e70af7b84ddf8ddb462e287b9087" /></td>
			<bu:td cssClass="dec" colNo="CREATE_USER" formId="1b93e70af7b84ddf8ddb462e287b9087" ><bu:ui colNo="CREATE_USER" formId="1b93e70af7b84ddf8ddb462e287b9087" value="%{CREATE_USER}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td style="width:65px;"  class="name" /><span class="dot">*</span><bu:uitn colNo="CDS_DATA" formId="1b93e70af7b84ddf8ddb462e287b9087" /><span><dict:lang value="(SQL)" /></span></td>
			<bu:td colspan='3' cssClass="dec" colNo="CDS_DATA" formId="1b93e70af7b84ddf8ddb462e287b9087" ><bu:ui colNo="CDS_DATA" style="width:608px;height:150px;" formId="1b93e70af7b84ddf8ddb462e287b9087" value="%{CDS_DATA}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td colspan='4' class="name"  style="text-align:left;" /><span class="dot">*</span><span><dict:lang value="请按下列格式输入SQL：SELECT 字段1,字段2... FROM 表 WHERE 字段1={参数}"/></span>
           <span>,</span><span><dict:lang value="参数外面不能加单引号"/>,</span>
            <span><dict:lang value="查询结果以字段作为表头"/>,</span>
            <span><dict:lang value="如有需要中文请将字段as为所需要的名称"/></span></td>
		</tr>
	</table>
			<bu:jsVal formId="1b93e70af7b84ddf8ddb462e287b9087" formIndex="1" />
				
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

        function  getAreaNameBySn(){
            var snKey=$("#paraMap1_CDS_DEVICE_SN").val();
            var getSnUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=dd7145ed956545f88ca02f5efa75e338";
            $.ajax({
				type: "POST",
				dataType: "json",
				url: getSnUrl,
				data: {
				    "snKey":snKey
				},
				success: function(data) {
				    var dataMap=data.ajaxMap;
				    $("#paraMap1_CDS_AREA_SN").val(dataMap.CD_DEVICE_SN);
				    $("#paraMap1_CDS_AREA_NAME").val(dataMap.CA_NAME); 
				    
				},
				error: function(msg) {
				     $("#paraMap1_CDS_AREA_SN").val("");
            	     $("#paraMap1_CDS_AREA_NAME").val("");
				//	utilsFp.confirmIcon(3, "", "", "",  "该设备SN未找到配置数据", 0, "300", "");
				}
			});
        
        }

		$("#paraMap1_CREATE_USER").val('${dataMap.name}');
				
		$("#paraMap1_CDS_ADD_TYPE").change(function(event) {
            	if($("#paraMap1_CDS_ADD_TYPE").val()==0){
            	$("#paraMap1_CDS_DEVICE_SN_SHOW").removeAttr("disabled");
            	$("#paraMap1_CDS_AREA_SN").removeAttr("disabled");
            	$("#paraMap1_CDS_AREA_NAME").removeAttr("disabled");
                $("#paraMap1_CDS_DEVICE_TYPE").val("");
            	$("#paraMap1_CDS_DEVICE_TYPE").attr("disabled","disabled");
            	$("#paraMap1_CDS_DEVICE_TYPE").trigger("chosen:updated");
           // $("#paraMap1_CDS_DEVICE_TYPE_chosen").attr("display","none");
            	}
            	if($("#paraMap1_CDS_ADD_TYPE").val()==1){
                	$("#paraMap1_CDS_DEVICE_TYPE").removeAttr("disabled");
                	$("#paraMap1_CDS_DEVICE_TYPE").trigger("chosen:updated");
            	     $("#paraMap1_CDS_DEVICE_SN_SHOW").val("");
            	     $("#paraMap1_CDS_AREA_SN").val("");
            	     $("#paraMap1_CDS_AREA_NAME").val("");
            	     $("#paraMap1_CDS_DEVICE_SN_SHOW").attr("disabled","disabled");
            	     $("#paraMap1_CDS_AREA_SN").attr("disabled","disabled");
            	     $("#paraMap1_CDS_AREA_NAME").attr("disabled","disabled");
            	}
        });

        var analysisFlag;
    	function analysis(loadFlag){
    	    //解析
    	    analysisFlag=false;
    	    var labelSql=$("#paraMap1_CDS_DATA").val();
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
				data: jsondata,
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
		    if($("#paraMap1_CDS_ADD_TYPE").val()==""){
		        _alertValMsg($("#paraMap1_CDS_ADD_TYPE_chosen"), "<dict:lang value="该项不能为空" />");
    	    	return;
		    }
		         if($("#paraMap1_CDS_ADD_TYPE").val()==0){
		             if($("#paraMap1_CDS_DEVICE_SN_SHOW").val()==""){
		             _alertValMsg($("#paraMap1_CDS_DEVICE_SN_SHOW"), "<dict:lang value="该项不能为空" />");
    	            	return;			             
		             }
		          }
		         if($("#paraMap1_CDS_ADD_TYPE").val()==1){
		             if($("#paraMap1_CDS_DEVICE_TYPE").val()==""){
		               _alertValMsg($("#paraMap1_CDS_DEVICE_TYPE_chosen"), "<dict:lang value="该项不能为空" />");
    	            	return;		  		             
		             }					
          
		           }
		   
		    if($("#deptLs_data_auth").val()==""){
                _alertValMsg($("#deptLs_data_auth_chosen"), "<dict:lang value="该项不能为空" />");
    	    	return;
            }
		    if($("#paraMap1_CDS_DATA").val()==""){
                _alertValMsg($("#paraMap1_CDS_DATA"), "<dict:lang value="该项不能为空" />");
    	    	return;
            }
            var flag=exeAnalysis();
            if(flag==false){
                
            }else{
            document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=3198285a4c2a43c086dc1c1fb642860f";
            document.forms.addForm.submit();
            }
    	}
    	function exeAnalysis(){
    	    analysis("first_load");
    	    return analysisFlag;
    	}
    	
    	function _clear(){
    	    $("#itemTable tbody tr").find("td:eq(3) .chosen-container:last").siblings('.chosen-container').remove()
            $("#printTable tbody tr").find("td:eq(3) .chosen-container:last").siblings('.chosen-container').remove()
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
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
