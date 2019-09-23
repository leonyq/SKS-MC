<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
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
	
			<!-- head里面 -->
  <!-- 产品静态资源 -->
<style>
.setDataCol{
		    width:28px;
		    height:20px;
		    background-image:url(plf/page/mlabel/img/ico-set.png);
		    cursor:pointer;
		    border: 0;
            outline: none;
            background-color:transparent;
}
.setDataCol:hover{
		    background-image:url(plf/page/mlabel/img/ico-set-h.png);
}
.operation p {
	width: 176px;
	margin: 0 auto;
}

.operation span {
	display: inline-block;
	width: 24px;
	height: 24px;
	margin: 0 10px;
	float: left;
	cursor: pointer;
}

.operation span:nth-of-type(1) {
	background-image: url(plf/page/mlabel/img/ico-toTop.png);
}

.operation span:nth-of-type(2) {
	background-image: url(plf/page/mlabel/img/ico-toPre.png);
}

.operation span:nth-of-type(3) {
	background-image: url(plf/page/mlabel/img/ico-toNext.png);
}

.operation span:nth-of-type(4) {
	background-image: url(plf/page/mlabel/img/ico-toBottom.png);
}

.operation span:nth-of-type(1):hover {
	background-image: url(plf/page/mlabel/img/ico-toTop-h.png);
}

.operation span:nth-of-type(2):hover {
	background-image: url(plf/page/mlabel/img/ico-toPre-h.png);
}

.operation span:nth-of-type(3):hover {
	background-image: url(plf/page/mlabel/img/ico-toNext-h.png);
}

.operation span:nth-of-type(4):hover {
	background-image: url(plf/page/mlabel/img/ico-toBottom-h.png);
}

</style>
	<!-- 产品静态资源 -->
<script>
        //全选
     	function getAllItem(){
    		if($("#allSelect").attr("checked")=="checked"){
    			//$("#addItemList :checkbox").attr("checked",true);
    			$("input:checkbox[name='delCheckbox']").attr("checked",true);
    		}else{
    			//$("#addItemList :checkbox").each(function(){
    			//	$(this).attr("checked",false);
    			//});
    			$("input:checkbox[name='delCheckbox']").attr("checked",false);
    		}
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
    
    var analysisIndex;
    function popItemDiv(index) {
        switchTag('tag1','content1','','');
		$("#addItem,#backItem").show();
		$("#addItem").draggable();
		$("#addItem").draggable({cancel:'.dialog-bd-div'});
        $("#paraMapObj_CLD_DISPLAY_WAY_chosen").attr("style","width:200px;");
        analysisIndex=index;
        backInfoShow();
	}

	function hideDiv(showId, backId) {
		$("#" + showId + ",#" + backId).hide();
		closeDivFp(showId + "pop");
	}
	
	var tab_len = 1;

	var currentTag;
	var tabs = "";
	function switchTag(tag, content, url) {
			
		document.getElementById("content1").style.display = "";

		for(i = 1; i < (tab_len + 1); i++) {
			if("tag" + i == tag) {
				document.getElementById(tag).getElementsByTagName("a")[0].className = "selectli1";
				document.getElementById(tag).getElementsByTagName("a")[0].getElementsByTagName("span")[0].className = "selectspan1";
			} else {
				document.getElementById("tag" + i).getElementsByTagName("a")[0].className = "";
				document.getElementById("tag" + i).getElementsByTagName("a")[0].getElementsByTagName("span")[0].className = "";
			}
			$("#" + tag).addClass("current").siblings().removeClass("current");
			if("content" + i == content) {
				currentTag = tag;
				document.getElementById(content).className = "";
			} else {
				document.getElementById("content" + i).className = "hidecontent";
			}
			document.getElementById("content").className = content;
			if(tag=="tag1"){
				$("#analysisBtn").css("display","inline-block");
				$("#saveInfoBtn").css("display","inline-block");
				$("#cancelBtn").css("display","inline-block");
				$("#content1").css("display","block");
				$("#content2").css("display","none");
			}else if(tag=="tag2"){
				$("#content1").css("display","none");
				$("#content2").css("display","block");
				$("#analysisBtn").css("display","none");
				$("#saveInfoBtn").css("display","none");
				$("#cancelBtn").css("display","none");
			}
		}
	}
</script>
</head>
<body>
	<div class="edit">
			<div class="bd" style="border: none">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="0f6bc25a04cd4de5932d12813912b915" type="edit" />
	<div class="mod">
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="基本信息" /></h3>	
    </div>
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="0f6bc25a04cd4de5932d12813912b915" />
	<input type="hidden" id="prefixInd" name="0f6bc25a04cd4de5932d12813912b915" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="dataAuth" id="dataAuth" value="${param.dataAuth}" />
		<s:set name="_$viewId" value="'2e7018d01f1245b8a99c4e45b013bae4'" />
		<s:set name="_$formId_1" value="'0f6bc25a04cd4de5932d12813912b915'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
		    <td class="name" style="width:65px;" /><bu:uitn colNo="CCC_CONFIGURE_TYPE" formId="0f6bc25a04cd4de5932d12813912b915" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="CCC_CONFIGURE_TYPE" formId="0f6bc25a04cd4de5932d12813912b915" ><bu:ui colNo="CCC_CONFIGURE_TYPE" style="width:200px;" formId="0f6bc25a04cd4de5932d12813912b915" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="CCC_CONFIGURE_CODE" formId="0f6bc25a04cd4de5932d12813912b915" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="CCC_CONFIGURE_CODE" formId="0f6bc25a04cd4de5932d12813912b915" ><bu:ui colNo="CCC_CONFIGURE_CODE" style="width:200px;" formId="0f6bc25a04cd4de5932d12813912b915" dataId="${dataId}" formIndex="1" /></bu:td>
		    
		    <td class="name" /><bu:uitn colNo="CCC_CONFIGURE_NAME" formId="0f6bc25a04cd4de5932d12813912b915" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="CCC_CONFIGURE_NAME" formId="0f6bc25a04cd4de5932d12813912b915" ><bu:ui colNo="CCC_CONFIGURE_NAME" style="width:200px;" formId="0f6bc25a04cd4de5932d12813912b915" dataId="${dataId}" formIndex="1" /></bu:td>
		
		    <td class="name" /><bu:uitn colNo="CCC_DEFAULT_FLAG" formId="0f6bc25a04cd4de5932d12813912b915" /></td>
			<bu:td cssClass="dec" colNo="CCC_DEFAULT_FLAG" formId="0f6bc25a04cd4de5932d12813912b915" ><bu:ui colNo="CCC_DEFAULT_FLAG" formId="0f6bc25a04cd4de5932d12813912b915" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="CCC_MEMO" formId="0f6bc25a04cd4de5932d12813912b915" /></td>
			<bu:td cssClass="dec" colNo="CCC_MEMO" style="height:80px;" colspan="7" formId="0f6bc25a04cd4de5932d12813912b915" ><bu:ui colNo="CCC_MEMO"  style="width:100%;height:100%"  formId="0f6bc25a04cd4de5932d12813912b915" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="明细信息" /></h3>	
        &nbsp;&nbsp;&nbsp; <dict:lang value="唯一性管控" /> <input type="checkbox" id="seqFlag" name="seqFlag" disabled="disabled"/>
        <div class="extend-btn" id="addDel" style="float: right;margin-top:5px;margin-bottom:5px;display:none;">
        	<button type="button" onclick="addRow();" style="padding:0;" title="新增">
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
					<div class="datagrid-header" >
						<div class="datagrid-header-inner head1">
                    	<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable0f6bc25a04cd4de5932d12813912b902">
								<tbody>
								<tr class="datagrid-header-row thcolor">
									<td class="datagrid-cell" style="width:30px;"></td>
									<td class="datagrid-cell" style="width:30px;">
									<input type="checkbox" id="allSelect" name="allSelect" onchange="getAllItem();" />
									</td>
									<td class="datagrid-cell" style="width:120px;" ><dict:lang value="码段" /></td >
									<td class="datagrid-cell" style="width:120px;" ><dict:lang value="值域" /></td >
									<td class="datagrid-cell" style="width:80px;" ><dict:lang value="长度" /></td >
									<td class="datagrid-cell" style="width:100px;" ><dict:lang value="填充方式" /></td >
									<td class="datagrid-cell" style="width:100px;" ><dict:lang value="填充字符" /></td >
									<td class="datagrid-cell" style="width:100px;" ><dict:lang value="起始流水号" /></td >
									<td class="datagrid-cell" style="width:100px;"><dict:lang value="流水号计算" /></td>
									<td class="datagrid-cell" style="width:100px;"><dict:lang value="配置" /></td>
									<td class="datagrid-cell" style="width:176px;"><dict:lang value="操作" /></td>
								</tr>
								</tbody>		
							</table>
						</div>
					</div>
					<div class="datagrid-body datagrid-div3 scroll1"   style="height:330px;">
					<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax0f6bc25a04cd4de5932d12813912b902" >
							<tbody id="addItemList" >
							    
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>	

	</div>
	
	<!--<div id="backItem" class="dialog-mask" style="z-index:1029px;" /></div>
	<div class="dialog dialog-s1" id="addItem" style="display:none;z-index:1030;margin-left:0px;left:130px;top:50px;width:790px;height:480px;">
		<div class="dialog-hd">
			<h3 class="tit">
			<dict:lang value="数据源" />
			</h3>
		</div>
		<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addItem','backItem');"></a>
		<div class="dialog-bd-div" style="width:100%;height:calc(100% - 37px);">
			<div class="optn optn_div" style="display:none;">
			    <button type="button" id="analysisBtn" onclick="analysis();"><i class="ico ico-save"></i><dict:lang value="解析"/></button>
				<button type="button" onclick="saveCoufigureInfo('addItem','backItem');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv('addItem','backItem');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
			</div>
			<div class="mod" style="display:inline-block;width:320px;float:left;">
    			<table class="basic-table" style="width:320px;margin-top:3px;height: 35px;">
    				<tr>
    					<td class="name"  style="width:85px;"/><span class="dot">*</span><dict:lang value="配置类型" /></span></td>
    					<bu:td cssClass="dec" colNo="CCD_CONFIGURE_TYPE" formId="c0ccd47c0a6e4315971c1b23cf00548e" >
    						<bu:ui id="configureType" style="width:200px;" colNo="CCD_CONFIGURE_TYPE" formId="c0ccd47c0a6e4315971c1b23cf00548e" dataId="${dataId}" formIndex="1" />
    					</bu:td>
    				</tr>
    				<tr style="">
            			<td class="name"  style="text-align:left;width:85px;padding-left:20px;padding-right:20px;" colspan="2"/><span class="dot">*</span><span>1、若配置类型为传入参数，数据源不可填
            			<br/>&nbsp;&nbsp;&nbsp;2、若配置类型为SQL，请按下列格式输入数据源：SELECT 字段1,字段2... FROM 表 WHERE 字段1={参数},参数外面不能加单引号，允许传入多个参数
                        <br/>&nbsp;&nbsp;&nbsp;3、若配置类型为存储过程，请输入存储过程名称，如P_C_GET_SN</span></td>
            		</tr>
    			</table>
    			
			</div>
			<table class="basic-table" style="margin-top:3px;display:inline-block;width:450px;height: 380px;">
        	    <tr style="">
        			<td class="name"  style="width:105px;"/><span class="dot">*</span><span><dict:lang value="数据源" /></span></td>
        			<bu:td cssClass="dec" colNo="CCD_CONFIGURE_VAL" formId="c0ccd47c0a6e4315971c1b23cf00548e" ><bu:ui colNo="CCD_CONFIGURE_VAL"  style="width:380px;height:380px;" id="configureVal" name="configureVal" formId="c0ccd47c0a6e4315971c1b23cf00548e" value="%{CCD_CONFIGURE_VAL}" formIndex="1" /></bu:td>
        		</tr>
        	</table>
			
		</div>

	</div>-->
	<div id="backItem" class="dialog-mask" style="z-index:1029px;" /></div>
	<div class="dialog dialog-s1" id="addItem" style="display:none;z-index:1030;margin-left:0px;left:130px;top:50px;width:790px;height:480px;">
		<div class="dialog-hd">
			<h3 class="tit">
			<dict:lang value="数据源" />
			</h3>
		</div>
		<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addItem','backItem');"></a>
		<div class="dialog-bd-div" style="width:100%;height:calc(100% - 37px);">
			<div class="optn optn_div">
			    <button type="button" id="analysisBtn" onclick="analysis();"><i class="ico ico-save"></i><dict:lang value="解析"/></button>
				<button type="button" id="saveInfoBtn" onclick="saveCoufigureInfo('addItem','backItem');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" id="cancelBtn" onclick="hideDiv('addItem','backItem');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
			</div>
			<div class="js-tab">
				<DIV id="container" style="padding:0 20px;box-sizing: border-box;background-color: #fff;">
					<DIV class="hd">
						<UL class="tab-list tab">
							<LI id="tag1">
								<A class="selectli1 current" onclick="switchTag('tag1','content1','','');this.blur();" href="javascript:void(0);">
									<SPAN><dict:lang value="配置数据源" /></SPAN> </A>
							</LI>
							<LI id="tag2">
								<A class="" onclick="switchTag('tag2','content2','','');this.blur();" href="javascript:void(0);">
									<SPAN class="selectspan1"><dict:lang value="配置说明" /></SPAN>
								</A>
							</LI>
						</UL>
					</DIV>
					<DIV class="content1" id="content">
						<DIV id="content1" data-tab="tag1">
                			<div class="mod" style="display:inline-block;width:320px;float:left;">
                    			<table class="basic-table" style="width:320px;margin-top:3px;height: 35px;">
                    				<tr>
                    					<td class="name"  style="width:85px;"/><span class="dot">*</span><dict:lang value="配置类型" /></span></td>
                    					<bu:td cssClass="dec" colNo="CCD_CONFIGURE_TYPE" formId="c0ccd47c0a6e4315971c1b23cf00548e" >
                    						<bu:ui id="configureType" style="width:200px;" colNo="CCD_CONFIGURE_TYPE" formId="c0ccd47c0a6e4315971c1b23cf00548e" value="%{CCD_CONFIGURE_TYPE}" formIndex="1" />
                    					</bu:td>
                    				</tr>
                    				<tr style="display:none;">
                            			<td class="name"  style="text-align:left;width:85px;padding-left:20px;padding-right:20px;" colspan="2"/><span class="dot">*</span><span>
                            			1、若配置类型为SQL，请按下列格式输入数据源：SELECT 字段1,字段2... FROM 表 WHERE 字段1={KEY},允许传入多个参数,解析结果只能返回一个查询列,例：SELECT T.LOGIN_NAME FROM SY_USER T WHERE T.NAME={M_NAME}
                                        <br/>&nbsp;&nbsp;&nbsp;2、若配置类型为存储过程，请输入存储过程名称,如P_C_GET_SN
                                        <br/>&nbsp;&nbsp;&nbsp;3、参数需按照以下格式输入：M_NAME:'xxx';M_NUM:5</span></td>
                            		</tr>
                    			</table>
                    			
                			</div>
                			<table class="basic-table" style="margin-top:3px;display:inline-block;width:430px;height: 380px;float:right;">
                        	    <tr style="">
                        			<td class="name"  style="width:105px;"/><span class="dot">*</span><span><dict:lang value="数据源" /></span></td>
                        			<bu:td cssClass="dec" colNo="CCD_CONFIGURE_VAL" formId="c0ccd47c0a6e4315971c1b23cf00548e" ><bu:ui colNo="CCD_CONFIGURE_VAL"  style="width:370px;height:330px;" id="configureVal" name="configureVal" formId="c0ccd47c0a6e4315971c1b23cf00548e" value="%{CCD_CONFIGURE_VAL}" formIndex="1" /></bu:td>
                        		</tr>
                        	</table>						
                        </DIV>					
                    
                        <DIV id="content2" data-tab="tag2" style="display:none">
                			<div class="mod" style="display:inline-block;float:left;">
                    			&nbsp;&nbsp;&nbsp;1、若配置类型为传入参数，数据源不可编辑
                    			<br/>&nbsp;&nbsp;&nbsp;2、若配置类型为SQL，请按下列格式输入数据源：SELECT 字段 FROM 表 WHERE 字段1={KEY},允许传入多个参数,解析结果只能返回一个查询列,例：SELECT T.LOGIN_NAME FROM SY_USER T WHERE T.NAME={M_NAME}
                                <br/>&nbsp;&nbsp;&nbsp;3、若配置类型为存储过程，请输入存储过程名称,如P_C_GET_SN(M_DOC_TYPE,M_DISPATCH_TYPE),无需传出参数
                                <br/>&nbsp;&nbsp;&nbsp;4、若调用接口，则需传入以下参数：configureId(条码ID)、params(参数，如M_NAME:'xxx';M_NUM:5)、codeNum(生成数量),接口路径:数据交互—>N2接口—>HTTP—>条码生成配置接口—>获取条码接口
                                <br/>&nbsp;&nbsp;&nbsp;5、SQL和存储过程都使用以下默认的公用参数传入,如需增加,则需修改具体的代码
                                <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;传入参数：M_PARAM
                                <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;单据号：M_DOC_TYPE(单据类型)、M_DISPATCH_TYPE(收发类型)、M_EMP(员工ID)、M_DATA_AUTH(组织机构)
                                <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;辅料制具料号：M_ITEM_CODE(料号)、M_ITEM_TYPE(辅料/制具类型)、M_EMP(员工ID)、M_DATA_AUTH(组织机构)
                                <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;包装条码：M_EMP(员工号)、M_DATA_AUTH(组织机构)
                                <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;检验单号：M_TEST_STEP(检测阶别)、M_SAMPLE_TYPE(检测类型)、M_EMP(员工号)、M_DATA_AUTH(组织机构)
                			</div>
                        </DIV>
                    </DIV>
				</DIV>
			</div>
		</div>

	</div>
			<bu:jsVal formId="0f6bc25a04cd4de5932d12813912b915" formIndex="1" />
				</form>	
			</div>
		
	</div>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll1','.head1');
  })
})(jQuery)</script>

<script>
        var INDEX=0;
        var codeSegentOption;
    	var itemValOption1;
    	var itemValOption2;
    	var fillTypeOption;						
	
    	$(function(){
    		getSelVal();
    		getInfoBfShow();
    	});
    	
    	function getInfoBfShow(){
    	    var dataId=$("input[name='dataId']").val();
    	    var dataAuth=$("#dataAuth").val();
    	    util.showLoading("处理中...");
    	    //修改页面  回填明细信息
    	    var getInfoUrl="${path}buss/bussModel_exeFunc.ms?funcMId=235fde9d8aa0447d97217587c404d0b2";
    	    var jsondata={"dataId":dataId,"dataAuth":dataAuth};
    		$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: getInfoUrl,
			    data: jsondata,
				success: function(data){
					util.closeLoading();
					if(null == data){return ;}
					if(null != data.ajaxList) {
					    $("#addItemList").empty();
					    var rccList = eval(data.ajaxList);
					    INDEX=rccList.length;
					    var codeSegentSel;
            			var fillTypeSel;					
                        var tempSel;								
                        var itemValSel1;						
                        var itemValSel2;
                        var tempInput;
					    for(var i = 0; i < rccList.length; i++) {
                            if(rccList[i].CODE_SEGENT == null) rccList[i].CODE_SEGENT = "";
    						if(rccList[i].ITEM_VALUE == null) rccList[i].ITEM_VALUE = "";
    						if(rccList[i].ITEM_LEN == null) rccList[i].ITEM_LEN = "";
    						if(rccList[i].FILL_TYPE == null) rccList[i].FILL_TYPE = "";
    						if(rccList[i].FILL_CHAR == null) rccList[i].FILL_CHAR = "";
    						if(rccList[i].START_SEQ == null) rccList[i].START_SEQ = "";
    						if(rccList[i].START_RESET==null) rccList[i].START_RESET="";
    						if(rccList[i].CONFIGURE_TYPE==null) rccList[i].CONFIGURE_TYPE="";
    						if(rccList[i].CONFIGURE_VAL==null) rccList[i].CONFIGURE_VAL="";
		
                            codeSegentSel = "<select id='codeSegentSel_"+i+"' disabled='disabled' name='CODE_SEGENT'  onchange='onChangeCodeSegent("+i+");' class=' input isSubmit _VAL_OjbsData dept_select' style='width:120px;display: none;disabled:disabled;'>"+ codeSegentOption +"</select>";			
                			fillTypeSel = "<select id='fillTypeSel_"+i+"' disabled='disabled' name='FILL_TYPE' class=' input isSubmit _VAL_OjbsData dept_select' style='width:100px;display: none;'>"+ fillTypeOption +"</select>";
    						itemValSel1="<select id='itemValSel_"+i+"' disabled='disabled' name='ITEM_VALUE' class=' input isSubmit _VAL_OjbsData dept_select' style='width:120px;display: none;'>"+ itemValOption1 +"</select>";
		                    itemValSel2="<select id='itemValSel_"+i+"' disabled='disabled' name='ITEM_VALUE' class=' input isSubmit _VAL_OjbsData dept_select' style='width:120px;display: none;'>"+ itemValOption2 +"</select>";	
		                    //tempInput="<input class=' input isSubmit'  style='width: 120px;display:none;' id='itemVal_"+i+"' name='ITEM_VALUE' value=''/>";
    						if(rccList[i].CODE_SEGENT=="1"){
    						    //数据项
    						    $("#addItemList").append("<tr id='trr_"+i+"' name='trname' style='height:30px;' ></tr>");
                    			$("#addItemList tr:last").append("<td id='' style='width: 30px;text-align: center;'></td>");
                    			$("#addItemList tr:last").append("<td style='width: 30px;text-align: center;'><input id='"+i+"'  type='checkbox' /></td>");
                    			
                                $("#addItemList tr:last").append("<td id='td1_"+i+"' style='width: 120px;'>"+codeSegentSel+"</td>");
                                $("#addItemList tr:last").append("<td id='td2_"+i+"' style='width: 120px;overflow: visible;padding:0;'></td>");//<input class=' input isSubmit'  style='width: 100px;display:none;' id='itemVal_"+INDEX+"' name='ITEM_VALUE' value=''/>
                                $("#addItemList tr:last").append("<td id='td3_"+i+"' style='width: 80px;overflow: visible;padding:0;' ><input class=' input isSubmit'   style='width: 80px;display:none;' id='itemLen_"+i+"' name='ITEM_LEN' value=''/></td>");
                                $("#addItemList tr:last").append("<td id='td4_"+i+"' style='width: 100px;overflow: visible;padding:0;' >"+fillTypeSel+"</td>");
                                $("#addItemList tr:last").append("<td id='td5_"+i+"' style='width: 100px;overflow: visible;padding:0;' ><input class=' input isSubmit'   style='width: 100px;display:none;' id='fillChar_"+i+"' name='FILL_CHAR' value=''/></td>");
                                $("#addItemList tr:last").append("<td id='td6_"+i+"' style='width: 100px;overflow: visible;padding:0;'><input class=' input isSubmit'   style='width: 100px;display:none;' id='startSeq_"+i+"' name='START_SEQ' value=''/></td>");
                                if(rccList[i].START_RESET=="Y"){
                                    $("#addItemList tr:last").append("<td id='td7_"+i+"' style='width: 100px;text-align: center;padding:0;'><input type='checkbox' disabled='disabled' checked='checked' name='START_RESET' id='startReset_"+i+"' /></td>");
                                }else if(rccList[i].START_RESET=="N"){
                                    $("#addItemList tr:last").append("<td id='td7_"+i+"' style='width: 100px;text-align: center;padding:0;'><input type='checkbox' disabled='disabled' name='START_RESET' id='startReset_"+i+"' /></td>");
                                }
                                $("#addItemList tr:last").append("<td id='td8_"+i+"' style='width: 100px;text-align: center;overflow: visible;padding:0;' ><button id='configureBtn_"+i+"' class='setDataCol' type='button' onclick='popItemDiv("+i+");' ></button><input style='width: 100px;display:none;' id='configureType_"+i+"' name='CONFIGURE_TYPE' value='"+rccList[i].VALUE+"'/><input style='width: 100px;display:none;' id='configureVal_"+i+"' name='CONFIGURE_VAL' value='"+rccList[i].CONFIGURE_VAL+"'/></td>");
                                $("#addItemList tr:last").append("<td id='td9_"+i+"' style='width: 176px;text-align: center;padding:0;' class='operation'><p style='width:176px;'><span style='width:24px;'></span><span style='width:24px;'></span><span style='width:24px;'></span><span style='width:24px;'></span></p></td>");
                                
                    			mySetChosen();//设置下拉框样式
                    			
                    			$("#fillTypeSel_"+i+"_chosen").attr("style","width:100px;");
                    			$("#fillTypeSel_"+i+"_chosen").hide();
                    			$("#codeSegentSel_"+i+"_chosen").attr("style","width:120px;");
                    			$("#codeSegentSel_"+i).val(rccList[i].CODE_SEGENT);
                    			$("#codeSegentSel_"+i).trigger("chosen:updated");
    						}else if(rccList[i].CODE_SEGENT=="2"){
    						    //文本
    						    tempInput="<input class=' input isSubmit'  style='width: 120px;' readonly='readonly' id='itemVal_"+i+"' name='ITEM_VALUE' value='"+rccList[i].ITEM_VALUE+"'/>";
    						    $("#addItemList").append("<tr id='trr_"+i+"' name='trname' style='height:30px;' ></tr>");
                    			$("#addItemList tr:last").append("<td id='' style='width: 30px;text-align: center;'></td>");
                    			$("#addItemList tr:last").append("<td style='width: 30px;text-align: center;'><input id='"+i+"'  type='checkbox' /></td>");
                    			
                                $("#addItemList tr:last").append("<td id='td1_"+i+"' style='width: 120px;'>"+codeSegentSel+"</td>");
                                $("#addItemList tr:last").append("<td id='td2_"+i+"' style='width: 120px;overflow: visible;padding:0;'>"+tempInput+"</td>");//<input class=' input isSubmit'  style='width: 100px;display:none;' id='itemVal_"+INDEX+"' name='ITEM_VALUE' value=''/>
                                $("#addItemList tr:last").append("<td id='td3_"+i+"' style='width: 80px;overflow: visible;padding:0;' ><input class=' input isSubmit'   style='width: 80px;display:none;' id='itemLen_"+i+"' name='ITEM_LEN' value=''/></td>");
                                $("#addItemList tr:last").append("<td id='td4_"+i+"' style='width: 100px;overflow: visible;padding:0;' >"+fillTypeSel+"</td>");
                                $("#addItemList tr:last").append("<td id='td5_"+i+"' style='width: 100px;overflow: visible;padding:0;' ><input class=' input isSubmit'   style='width: 100px;display:none;' id='fillChar_"+i+"' name='FILL_CHAR' value=''/></td>");
                                $("#addItemList tr:last").append("<td id='td6_"+i+"' style='width: 100px;overflow: visible;padding:0;'><input class=' input isSubmit'   style='width: 100px;display:none;' id='startSeq_"+i+"' name='START_SEQ' value=''/></td>");
                                if(rccList[i].START_RESET=="Y"){
                                    $("#addItemList tr:last").append("<td id='td7_"+i+"' style='width: 100px;text-align: center;padding:0;'><input type='checkbox' disabled='disabled' checked='checked' name='START_RESET' id='startReset_"+i+"' /></td>");
                                }else if(rccList[i].START_RESET=="N"){
                                    $("#addItemList tr:last").append("<td id='td7_"+i+"' style='width: 100px;text-align: center;padding:0;'><input type='checkbox' disabled='disabled' name='START_RESET' id='startReset_"+i+"' /></td>");
                                }
                                $("#addItemList tr:last").append("<td id='td8_"+i+"' style='width: 100px;text-align: center;overflow: visible;padding:0;' ><button id='configureBtn_"+i+"' class='setDataCol' type='button' onclick='popItemDiv("+i+");' style='display:none;' ></button><input style='width: 100px;display:none;' id='configureType_"+i+"' name='CONFIGURE_TYPE' value=''/><input style='width: 100px;display:none;' id='configureVal_"+i+"' name='CONFIGURE_VAL' value=''/></td>");
                                $("#addItemList tr:last").append("<td id='td9_"+i+"' style='width: 176px;text-align: center;padding:0;' class='operation'><p style='width:176px;'><span style='width:24px;'></span><span style='width:24px;'></span><span style='width:24px;'></span><span style='width:24px;'></span></p></td>");
                                
                    			mySetChosen();//设置下拉框样式
                    			
                    			$("#fillTypeSel_"+i+"_chosen").attr("style","width:100px;");
                    			$("#fillTypeSel_"+i+"_chosen").hide();
                    			$("#codeSegentSel_"+i+"_chosen").attr("style","width:120px;");
                    			$("#codeSegentSel_"+i).val(rccList[i].CODE_SEGENT);
                    			$("#codeSegentSel_"+i).trigger("chosen:updated");
    						}else if(rccList[i].CODE_SEGENT=="3"){
    						    //日期变量			
    						    $("#addItemList").append("<tr id='trr_"+i+"' name='trname' style='height:30px;' ></tr>");
                    			$("#addItemList tr:last").append("<td id='' style='width: 30px;text-align: center;'></td>");
                    			$("#addItemList tr:last").append("<td style='width: 30px;text-align: center;'><input id='"+i+"'  type='checkbox' /></td>");
                    			
                                $("#addItemList tr:last").append("<td id='td1_"+i+"' style='width: 120px;'>"+codeSegentSel+"</td>");
                                $("#addItemList tr:last").append("<td id='td2_"+i+"' style='width: 120px;overflow: visible;padding:0;'>"+itemValSel2+"</td>");//<input class=' input isSubmit'  style='width: 100px;display:none;' id='itemVal_"+INDEX+"' name='ITEM_VALUE' value=''/>
                                $("#addItemList tr:last").append("<td id='td3_"+i+"' style='width: 80px;overflow: visible;padding:0;' ><input class=' input isSubmit'   style='width: 80px;display:none;' id='itemLen_"+i+"' name='ITEM_LEN' value=''/></td>");
                                $("#addItemList tr:last").append("<td id='td4_"+i+"' style='width: 100px;overflow: visible;padding:0;' >"+fillTypeSel+"</td>");
                                $("#addItemList tr:last").append("<td id='td5_"+i+"' style='width: 100px;overflow: visible;padding:0;' ><input class=' input isSubmit'   style='width: 100px;display:none;' id='fillChar_"+i+"' name='FILL_CHAR' value=''/></td>");
                                $("#addItemList tr:last").append("<td id='td6_"+i+"' style='width: 100px;overflow: visible;padding:0;'><input class=' input isSubmit'   style='width: 100px;display:none;' id='startSeq_"+i+"' name='START_SEQ' value=''/></td>");
                                if(rccList[i].START_RESET=="Y"){
                                    $("#addItemList tr:last").append("<td id='td7_"+i+"' style='width: 100px;text-align: center;padding:0;'><input type='checkbox' disabled='disabled' checked='checked' name='START_RESET' id='startReset_"+i+"' /></td>");
                                }else if(rccList[i].START_RESET=="N"){
                                    $("#addItemList tr:last").append("<td id='td7_"+i+"' style='width: 100px;text-align: center;padding:0;'><input type='checkbox' disabled='disabled' name='START_RESET' id='startReset_"+i+"' /></td>");
                                }
                                $("#addItemList tr:last").append("<td id='td8_"+i+"' style='width: 100px;text-align: center;overflow: visible;padding:0;' ><button id='configureBtn_"+i+"' class='setDataCol' type='button' onclick='popItemDiv("+i+");' style='display:none;' ></button><input style='width: 100px;display:none;' id='configureType_"+i+"' name='CONFIGURE_TYPE' value=''/><input style='width: 100px;display:none;' id='configureVal_"+i+"' name='CONFIGURE_VAL' value=''/></td>");
                                $("#addItemList tr:last").append("<td id='td9_"+i+"' style='width: 176px;text-align: center;padding:0;' class='operation'><p style='width:176px;'><span style='width:24px;'></span><span style='width:24px;'></span><span style='width:24px;'></span><span style='width:24px;'></span></p></td>");
                                
                    			mySetChosen();//设置下拉框样式
                    			$("#codeSegentSel_"+i+"_chosen").attr("style","width:120px;");
                    			$("#codeSegentSel_"+i).val(rccList[i].CODE_SEGENT);
                    			$("#codeSegentSel_"+i).trigger("chosen:updated");
                    			
                    			
                    			$("#fillTypeSel_"+i+"_chosen").attr("style","width:100px;");
                    			$("#fillTypeSel_"+i+"_chosen").hide();
                    			$("#itemValSel_"+i+"_chosen").attr("style","width:120px;");
                    			$("#itemValSel_"+i).val(rccList[i].ITEM_VALUE);
                    			$("#itemValSel_"+i).trigger("chosen:updated");
    						}else if(rccList[i].CODE_SEGENT=="4"){
    						    //流水号		
    						    $("#addItemList").append("<tr id='trr_"+i+"' name='trname' style='height:30px;' ></tr>");
                    			$("#addItemList tr:last").append("<td id='' style='width: 30px;text-align: center;'></td>");
                    			$("#addItemList tr:last").append("<td style='width: 30px;text-align: center;'><input id='"+i+"'  type='checkbox' /></td>");
                    			
                                $("#addItemList tr:last").append("<td id='td1_"+i+"' style='width: 120px;'>"+codeSegentSel+"</td>");
                                $("#addItemList tr:last").append("<td id='td2_"+i+"' style='width: 120px;overflow: visible;padding:0;'>"+itemValSel1+"</td>");//<input class=' input isSubmit'  style='width: 100px;display:none;' id='itemVal_"+INDEX+"' name='ITEM_VALUE' value=''/>
                                $("#addItemList tr:last").append("<td id='td3_"+i+"' style='width: 80px;overflow: visible;padding:0;' ><input class=' input isSubmit'  readonly='readonly'  style='width: 80px;' id='itemLen_"+i+"' name='ITEM_LEN' value='"+rccList[i].ITEM_LEN+"'/></td>");
                                $("#addItemList tr:last").append("<td id='td4_"+i+"' style='width: 100px;overflow: visible;padding:0;' >"+fillTypeSel+"</td>");
                                $("#addItemList tr:last").append("<td id='td5_"+i+"' style='width: 100px;overflow: visible;padding:0;' ><input class=' input isSubmit'  readonly='readonly'  style='width: 100px;' id='fillChar_"+i+"' name='FILL_CHAR' value='"+rccList[i].FILL_CHAR+"'/></td>");
                                $("#addItemList tr:last").append("<td id='td6_"+i+"' style='width: 100px;overflow: visible;padding:0;'><input class=' input isSubmit'   readonly='readonly' style='width: 100px;' id='startSeq_"+i+"' name='START_SEQ' value='"+rccList[i].START_SEQ+"'/></td>");
                                if(rccList[i].START_RESET=="Y"){
                                    $("#addItemList tr:last").append("<td id='td7_"+i+"' style='width: 100px;text-align: center;padding:0;'><input type='checkbox' disabled='disabled' checked='checked' name='START_RESET' id='startReset_"+i+"' /></td>");
                                }else if(rccList[i].START_RESET=="N"){
                                    $("#addItemList tr:last").append("<td id='td7_"+i+"' style='width: 100px;text-align: center;padding:0;'><input type='checkbox' disabled='disabled' name='START_RESET' id='startReset_"+i+"' /></td>");
                                }
                                $("#addItemList tr:last").append("<td id='td8_"+i+"' style='width: 100px;text-align: center;overflow: visible;padding:0;' ><button id='configureBtn_"+i+"' class='setDataCol' type='button' onclick='popItemDiv("+i+");' style='display:none;' ></button><input style='width: 100px;display:none;' id='configureType_"+i+"' name='CONFIGURE_TYPE' value=''/><input style='width: 100px;display:none;' id='configureVal_"+i+"' name='CONFIGURE_VAL' value=''/></td>");
                                $("#addItemList tr:last").append("<td id='td9_"+i+"' style='width: 176px;text-align: center;padding:0;' class='operation'><p style='width:176px;'><span style='width:24px;'></span><span style='width:24px;'></span><span style='width:24px;'></span><span style='width:24px;'></span></p></td>");
                                
                    			mySetChosen();//设置下拉框样式
                    			$("#codeSegentSel_"+i+"_chosen").attr("style","width:120px;");
                    			$("#codeSegentSel_"+i).val(rccList[i].CODE_SEGENT);
                    			$("#codeSegentSel_"+i).trigger("chosen:updated");
                    			
                    			$("#itemValSel_"+i+"_chosen").attr("style","width:120px;");
                    			$("#itemValSel_"+i).val(rccList[i].ITEM_VALUE);
                    			$("#itemValSel_"+i).trigger("chosen:updated");
                    			
                    			$("#fillTypeSel_"+i+"_chosen").attr("style","width:100px;");
                    			$("#fillTypeSel_"+i+"_chosen").show();
                    			$("#fillTypeSel_"+i).val(rccList[i].FILL_TYPE);
                    			$("#fillTypeSel_"+i).trigger("chosen:updated");
                    			
    						}
						}
						reSort("addItemList");
            			var tableTrJs = $("#addModelList tr");
            			_tongLineColor(tableTrJs);
            			//clickTr('addItemList');
            			//defTableWidthRewrite("0f6bc25a04cd4de5932d12813912b902");
					}
					
				},
			    error: function(msg){
			        if(msg.readyState!=0){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");		
                    }
			  	}
			});
    	}
    	
        //获取相关下拉框
	    function getSelVal(){
	        var dataAuth=$("#dataAuth").val();
	        var jsondata={"dataAuth":dataAuth};
	        //新增页面 获取下拉框
    	    var getNeedSelUrl="${path}buss/bussModel_exeFunc.ms?funcMId=906cfe6b65f944bbb9ffbebd0670d098";
    		$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: getNeedSelUrl,
			    data: 	jsondata,
			    async:false,
				success: function(data){
						//console.log(data.ajaxMap.samplList);
						codeSegentOption = "<option value=''>--请选择--</option>";
						itemValOption1 = "<option value=''>--请选择--</option>";
						itemValOption2 = "<option value=''>--请选择--</option>";
						fillTypeOption = "<option value='0'>--请选择--</option>";
						if(null == data){return ;}
						if(null != data.ajaxMap){
							var codeSegentList =data.ajaxMap.codeSegentList;
							var itemValList1 =data.ajaxMap.itemValList1; //值域--进制
							var itemValList2 =data.ajaxMap.itemValList2; //值域--非进制
							var fillTypeList =data.ajaxMap.fillTypeList;
							//console.log(samplList);
							for(var i = 0;i < codeSegentList.length; i++){
								codeSegentOption = codeSegentOption + "<option value='"+codeSegentList[i].CODE+"'>"+codeSegentList[i].VAL+"</option>";
							}
							for(var j = 0;j < itemValList1.length; j++){
								itemValOption1 = itemValOption1 + "<option value='"+itemValList1[j].CODE+"'>"+itemValList1[j].VAL+"</option>";
							}
							for(var j = 0;j < itemValList2.length; j++){
								itemValOption2 = itemValOption2 + "<option value='"+itemValList2[j].CODE+"'>"+itemValList2[j].VAL+"</option>";
							}
							for(var k = 0;k < fillTypeList.length; k++){
								fillTypeOption = fillTypeOption + "<option value='"+fillTypeList[k].CODE+"'>"+fillTypeList[k].VAL+"</option>";
							}
						}
						
					},
				    error: function(msg){
				        if(msg.readyState!=0){
    						util.closeLoading();
    						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");		
                        }
				  	}
				});
	        }
		
        function backInfoShow(){
            //回填数据源
            var configureTypeId="#configureType_"+analysisIndex;
		    var configureValId="#configureVal_"+analysisIndex;
		    var tempConfigureType = $(configureTypeId).val();
            var tempConfigureVal = $(configureValId).val();
            $('#configureType').val(tempConfigureType);
            $('#configureType').trigger("chosen:updated");
            $('#configureVal').val(tempConfigureVal);
        }

        //重新排序
        function sort(block) {
            $(block +' .tableBody  tr').find('td:eq(0)').each(function (i, elem) {
                $(elem).html(i + 1);
            });
        }
        
        function sortBar(block) {
            $(block +'  tr').find('td:eq(0)').each(function (i, elem) {
                $(elem).html(i + 1);
            });
            previewBarData();
        }

        function reSort(objid){
            var i = 1;
         	$("#"+objid+" tr").each(function(){
                $(this).find("td").eq(0).text(i);
                i++;
            });
        }
</script>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_18" />
        <jsp:param name="location" value="jsLoading" />
  	</jsp:include>
  	
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
