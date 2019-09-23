<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
	
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
	
    
     <script type="text/javascript">
	var loaded = 1;
	var tab_len = 2;

	var currentTag;
	var tabs = "";
	function switchTag(tag, content, url) {
		if (currentTag == tag) {
			return false;
		}
		document.getElementById("content2").style.display="";
		//document.getElementById("content3").style.display="";
		//document.getElementById("content4").style.display="";
		for (i = 1; i < (tab_len + 1); i++) {
			if ("tag" + i == tag) {
				document.getElementById(tag).getElementsByTagName("a")[0].className = "selectli1";
				document.getElementById(tag).getElementsByTagName("a")[0]
						.getElementsByTagName("span")[0].className = "selectspan1";
			} else {
				document.getElementById("tag" + i).getElementsByTagName("a")[0].className = "";
				document.getElementById("tag" + i).getElementsByTagName("a")[0]
						.getElementsByTagName("span")[0].className = "";
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
	    if(tag=="tag1"){
				document.getElementById("tag3").style.display="none";
		}
		if(tag=="tag2"){
				document.getElementById("tag3").style.display="";
		}
	}
$(function(){
	$("#tag1").addClass("current");
	$(document.getElementById('T2#WRD_DOC_TYPE')).closest('.group').attr("style","display:none;");
	
})

</script>
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
			    	        <button type="button" onclick="editCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd" style=" height: 550px;">

								<input type="hidden" name="exeid" value="${exeid}">
								<input type="hidden" name="definedMsg" value="${definedMsg}">
								<input type="hidden" name="formId" value="9ce89b8198274a25b7219ad226eda21e">
								<input type="hidden" name=iframeId value="${iframeId}">
								<input type="hidden" name="dataId" value="${dataId}">
										<!-- <table class="basic-table">
											<tr>
												<th colspan="4">
													<span class="Eng">*</span>
													<dict:lang value="为必填项" />
												</th>
											</tr>
										</table>-->
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
		<bu:set name="paraMapObj" value="${dataId}" formId="9ce89b8198274a25b7219ad226eda21e" type="edit" />
		 <div class="js-tab">
					<DIV id="container" style="padding:0 2px;box-sizing: border-box;">
					<!--	<DIV class="hd"> -->
							<UL class="tab-list tab">
								
								<LI id="tag1"><A class=""
									onclick="switchTag('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="基本信息" /></SPAN> </A>
								</LI>
								<LI id="tag2"><A class=""
									onclick="switchTag('tag2','content2','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="机种关联" /></SPAN> </A>
								</LI>
								<LI id="tag3" style="display:none;margin-left:470px;">
    								<div class="extend-btn" id="addDel" style="float: right;margin-top:5px;margin-bottom:5px;">
                                    	<button type="button" onclick="popItemDiv('addItem','backItem');" style="padding:0;" title="选择机种">
                                    		<i class="ico ico-kl-new-add ico-small"></i>
                                    	</button>
                                    	<button type="button" onclick="delRow();" style="padding:0" title="删除">
                                    		<i class="ico ico-sc-new-add ico-small"></i>
                                    	</button>
                                <!--    </div>	 -->						
                                </LI>
							</UL>
						</DIV>
	<DIV class="content1" id="content" style="margin-top: 15px;">
	<DIV id="content1" style="margin-top:4px;" data-tab="tag1">
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="9ce89b8198274a25b7219ad226eda21e" />
	<input type="hidden" name="formId" id="formId1" value='123456'/>
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<input type="hidden" name="9ce89b8198274a25b7219ad226eda21e" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'6d7820259fb247229cae1fa99032528c'" />
		<s:set name="_$formId_1" value="'9ce89b8198274a25b7219ad226eda21e'" />
		<s:set name="_$type" value="'edit'" />
		<tr>
			<td class="name" style="width:80px;"/><span class="dot">*</span><bu:uitn colNo="CT_ID" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<bu:td cssClass="dec" colNo="CT_ID" formId="9ce89b8198274a25b7219ad226eda21e" ><bu:ui colNo="CT_ID" formId="9ce89b8198274a25b7219ad226eda21e" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name"  style="width:80px;"/><span class="dot">*</span><bu:uitn colNo="CT_NAME" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<bu:td cssClass="dec"  style="width:230px;" colNo="CT_NAME" formId="9ce89b8198274a25b7219ad226eda21e" ><bu:ui colNo="CT_NAME" formId="9ce89b8198274a25b7219ad226eda21e" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CT_PRODUCT_STEP" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<bu:td cssClass="dec" colNo="CT_PRODUCT_STEP" formId="9ce89b8198274a25b7219ad226eda21e" ><bu:ui colNo="CT_PRODUCT_STEP" formId="9ce89b8198274a25b7219ad226eda21e" onchange="clearInfo();" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CT_PROCESS_FACE" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<bu:td cssClass="dec" colNo="CT_PROCESS_FACE" formId="9ce89b8198274a25b7219ad226eda21e" ><bu:ui colNo="CT_PROCESS_FACE" formId="9ce89b8198274a25b7219ad226eda21e" onchange="clearInfo();" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CT_ROUTE_CODE" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<bu:td cssClass="dec" colNo="CT_ROUTE_CODE" formId="9ce89b8198274a25b7219ad226eda21e" ><bu:ui colNo="CT_ROUTE_CODE" formId="9ce89b8198274a25b7219ad226eda21e" dataId="${dataId}" formIndex="1"  /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CT_PREPOSE_TECH" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<bu:td cssClass="dec" colNo="CT_PREPOSE_TECH" formId="9ce89b8198274a25b7219ad226eda21e" ><bu:ui colNo="CT_PREPOSE_TECH" formId="9ce89b8198274a25b7219ad226eda21e" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr> 
		    <td class="name" style="width:63px;"/> <bu:uitn colNo="CT_STATION_QTY" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<bu:td cssClass="dec" colNo="CT_STATION_QTY" formId="9ce89b8198274a25b7219ad226eda21e" ><bu:ui colNo="CT_STATION_QTY" formId="9ce89b8198274a25b7219ad226eda21e" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CT_DEFAULT_FLAG" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<bu:td cssClass="dec" colNo="CT_DEFAULT_FLAG" formId="9ce89b8198274a25b7219ad226eda21e" ><bu:ui colNo="CT_DEFAULT_FLAG" formId="9ce89b8198274a25b7219ad226eda21e" dataId="${dataId}" formIndex="1" />
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;<bu:uitn colNo="CT_VALID_FLAG" formId="9ce89b8198274a25b7219ad226eda21e" />
			<bu:ui colNo="CT_VALID_FLAG" formId="9ce89b8198274a25b7219ad226eda21e" dataId="${dataId}" formIndex="1" />
			</bu:td> 
			 
		</tr>
		
		
		<tr>
		<td class="name"/><bu:uitn colNo="CT_MEMO" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<bu:td cssClass="dec" colNo="CT_MEMO" formId="9ce89b8198274a25b7219ad226eda21e" colspan="3"><bu:ui colNo="CT_MEMO" formId="9ce89b8198274a25b7219ad226eda21e" dataId="${dataId}" style="width:100%;height:80px;"  formIndex="1" /></bu:td>
		</tr>
		
	</table>
		</div>
		 <DIV id="content2" style="display:none" data-tab="tag2">
    			<div class="mod" >
			<div class="mod-bd" style="margin-top:5px;border-bottom: none;height:500px;">
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view">
						<div class="datagrid-header">
							<div class="datagrid-header-inner head11 " style="width:100%;" id="datagrid-header-inner1">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" style="width:30px;"></td>
										<td class="datagrid-cell" style="width:30px;">
										<input type="checkbox" id="allSelects" name="allSelect" onchange="getAllItems();" />
										</td>
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="机种" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="机种名称" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="机种规格" /></td >
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll11"   style="height:390px;">
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="addItemInfo" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>	
		</DIV>
		</div>	
		</DIV>
		<div id="backItem" class="dialog-mask" style="z-index:1029px;"/></div>
		<div class="dialog dialog-s1" id="addItem" style="display:none;z-index:1030;margin-left:0px;left:16px;top:10px;width:780px;height:480px;">
			<div class="dialog-hd">
			<h3 class="tit">
			<dict:lang value="选择机种" />
			</h3>
			</div>
				<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addItem','backItem');"></a>
				<div class="dialog-bd-div" style="width:780px;height:430px;">
					<div class="optn optn_div">
			    <button type="button" onclick="addItemList('addItem','backItem');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv('addItem','backItem');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				<button type="button" onclick="searchItemInfo('formId1');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
				         </div>
				      
				<table class="basic-table">
    				<tr>
    			    	<td class="name" /><dict:lang value="机种"/></td>
    					<td class="dec"><input type="text" id="itemCode" name="itemCode" class=" input isSubmit isaddSubmit"/></td>
    					
    					<td class="name" /><dict:lang value="机种名称"/></td>
    					<td class="dec"><input type="text" id="itemName" name="itemName" class=" input isSubmit isaddSubmit"/></td>
    			    </tr>
    			    <tr>
    			    	<td class="name" /><dict:lang value="机种规格"/></td>
    					<td class="dec"><input type="text" id="itemSpce" name="itemSpce" class=" input isSubmit isaddSubmit"/></td>
    			    </tr>
			    </table>
				<div class="panel-ajax1 datagrid datagrid-div1" style="margin-top:10px;"><!--143-->
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
							<div class="datagrid-header">
							<div class="datagrid-header-inner head1"  id="datagrid-header-inner123456">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable123456">
									<tbody>
									<tr class="datagrid-header-row thcolor">
									<td class="datagrid-cell" style="width: 30px;text-align: center;"></td>
									<td class="datagrid-cell" style="width: 30px;text-align: center;"><input type="checkbox" id="item_list_cb"  onchange="getAllItem();" /></td>
									<td class="datagrid-cell" style="width: 212px;text-align: center;"><dict:lang value="机种" /></td>
									<td class="datagrid-cell" style="width: 246px;text-align: center;"><dict:lang value="机种名称" /></td>
									<td class="datagrid-cell" style="width: 246px;text-align: center;"><dict:lang value="机种规格" /></td>									
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll1" style="height:300px;"><!--130-->
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax123456" >
								<tbody id="itemTbody" >
								</tbody>
							</table>
						</div>
						
					</div>
				</div>
				<div style="background-color: white;" id="pageDiv">
                                 <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchItemInfo&formId=formId1&showLoading=0" />
                                 </div>		
				</div>
				

	</div>
			<bu:jsVal formId="9ce89b8198274a25b7219ad226eda21e" formIndex="1" />
								
			</div>
			</form>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>

	<script type="text/javascript">
			var parentWindow;
			$(function(){
			        
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;		
                getInfo();
			});
			
			
			function clearInfo(){
                    $("#addItemInfo").html("");
                }
			
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
			if(!val.valDataBaseSetData()){
                return ;
            }
			//解决附件清空时，无法传到后台的问题;解决checkbox清空时，无法传到后台的问题	
			emptyValToHide('N');
			document.forms.editForm.submit();
			isQuery = true;
		}
		
	
		
		

		//重置	
		function resetForm(){
			$("#editForm")[0].reset();
			$("#paraMapObj_CT_PRODUCT_STEP").trigger("chosen:updated");
			$("#paraMapObj_CT_PROCESS_FACE").trigger("chosen:updated");
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
	 var trrCount=0;
    function getInfo(){
           var CT_ROUTE_CODE = $("#paraMapObj_CT_ROUTE_CODE").val();
           var step =$("#paraMapObj_CT_PRODUCT_STEP").val();
           var face =$("#paraMapObj_CT_PROCESS_FACE").val();
           var id = "${dataId}";
            var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=91bd5516f86e4f33a76e17ed0d3d2e77";
            $.ajax({
                type:"post",
                dataType:"json",
                data:"CT_ROUTE_CODE="+CT_ROUTE_CODE+"&id="+id+"&step="+step+"&face="+face,
                url:loadItemUrl,
                success:function(data){
                    if(null==data){
                        return;
                    }
                    
                    if(null!=data.ajaxString){
                        //var name = eval(data.ajaxString);
                       // alert(name);
                        $("#paraMapObj_CT_ROUTE_CODE_SHOW").val(data.ajaxString);
                    }
                    
                    console.log(data.ajaxList);
                    
                     if(null!=data.ajaxList){
                        var rccList  = eval(data.ajaxList);
                        for(var i=0;i<rccList.length;i++){
                            if(rccList[i].CTM_MODEL_CODE==null) rccList[i].CTM_MODEL_CODE="";
							if(rccList[i].CI_ITEM_NAME==null) rccList[i].CI_ITEM_NAME="";
							if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
                            
                            $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='trr_"+rccList[i].ID+"' ></tr>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1' value='"+rccList[i].ID+"'/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;'>"+rccList[i].CTM_MODEL_CODE+"<input type='hidden' class='CI_ITEM_CODE' name='CI_ITEM_CODE' value='"+rccList[i].CTM_MODEL_CODE+"'/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: center;'>"+rccList[i].CI_ITEM_NAME+"</td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;'>"+rccList[i].CI_ITEM_SPEC+"</td>");
							
							//trrCount++;
                        }
                       
                    }
                    var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
					_tongLineColor(tableTrJs);
					clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
					defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
                    
                },
                error: function(XMLHttpRequest, textStatus, errorThrown){
                  util.closeLoading();
                  var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
                  if (null != sessionstatus && sessionstatus == "noAuthority") {
                  }else{
                    util.alert("error:"+errorThrown);
                  }
         }
            })
        }
        
        
   
			function popItemDiv(showId,backId){
         
          var face = $("#paraMapObj_CT_PROCESS_FACE").val();
          var step = $("#paraMapObj_CT_PRODUCT_STEP").val();
          if(face=="" || step == ""){
              utilsFp.confirmIcon(1,"","","", "请先选择面别和阶别",0,"300","");
          }else{
            $("#itemCode").val("");	
            $("#itemName").val("");
            $("#itemSpce").val("");
		    $("#"+showId+",#"+backId).show();
				$("#"+showId).draggable({cancel:'.dialog-bd-div'});
			
			addItemInfo();
          }
    
            
			
}
function hideDiv(showId,backId){
			$("#"+showId+",#"+backId).hide();
			closeDivFp(showId+"pop");
}
var trCount=0;
//弹出div物料信息
function addItemInfo(){
		util.showLoading("处理中...");
		    var step =$("#paraMapObj_CT_PRODUCT_STEP").val();
           var face =$("#paraMapObj_CT_PROCESS_FACE").val();
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "buss/bussModel_exeFunc.ms?funcMId=544de760a0d648e6a6260288b475fd71",
			    data: "step="+step+"&face="+face,
				success: function(data){
				                 $("#itemTbody").empty();
						util.closeLoading();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							for(var i=0;i<rccList.length;i++){
								if(rccList[i].CI_ITEM_CODE==null) rccList[i].CI_ITEM_CODE="";
								if(rccList[i].CI_ITEM_NAME==null) rccList[i].CI_ITEM_NAME="";
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								$("#datagrid-btable-ajax123456 tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
								$("#datagrid-btable-ajax123456 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								$("#datagrid-btable-ajax123456 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+rccList[i].ID+"' type='checkbox' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax123456 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:212px;text-align: center;'>"+rccList[i].CI_ITEM_CODE+"<input type='hidden' id='CI_ITEM_CODE"+rccList[i].ID+"' value='"+rccList[i].CI_ITEM_CODE+"'/></td>");
								$("#datagrid-btable-ajax123456 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:246px;text-align: center;'>"+rccList[i].CI_ITEM_NAME+"<input type='hidden' id='CI_ITEM_NAME"+rccList[i].ID+"' value='"+rccList[i].CI_ITEM_NAME+"'/></td>");
								$("#datagrid-btable-ajax123456 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:246px;text-align: center;'>"+rccList[i].CI_ITEM_SPEC+"<input type='hidden' id='CI_ITEM_SPEC"+rccList[i].ID+"' value='"+rccList[i].CI_ITEM_SPEC+"'/></td>");
								trCount++;
							}
							
						}
						pageFun(data.ajaxPage,"formId1");
							var tableTrJs = $("#datagrid-btable-ajax123456 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax123456');
							defTableWidthRewrite("123456");
						
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
//div物料信息分页
var paginationImpl = {};
function searchItemInfo(paginationImpl){
	var isFirstLoad = firstLoadThisPage(paginationImpl);
    	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
    	var itemCode = $.trim($("#itemCode").val());
    	var itemName = $.trim($("#itemName").val());
    	var itemSpce = $.trim($("#itemSpce").val());
    	var step =$("#paraMapObj_CT_PRODUCT_STEP").val();
         var face =$("#paraMapObj_CT_PROCESS_FACE").val();
    	util.showLoading("处理中...");
    	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: "buss/bussModel_exeFunc.ms?funcMId=544de760a0d648e6a6260288b475fd71",
			    data:{
			        
			        "itemCode":itemCode,
			        "itemName":itemName,
			        "itemSpce":itemSpce,
			        "step":step,
			        "face":face,
			        "page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			        "page.pageRecord":_GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
			    },
			   // data: "paraMap.type=1&paraMap.itemCode="+itemCode+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				success: function(data){
				                 $("#itemTbody").empty();
						util.closeLoading();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							for(var i=0;i<rccList.length;i++){
								if(rccList[i].CI_ITEM_CODE==null) rccList[i].CI_ITEM_CODE="";
								if(rccList[i].CI_ITEM_NAME==null) rccList[i].CI_ITEM_NAME="";
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								$("#datagrid-btable-ajax123456 tbody:last").append("<tr id='tr1_"+((currentPage-1)*pageRecord+(i+1))+"' ></tr>");
								$("#datagrid-btable-ajax123456 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#datagrid-btable-ajax123456 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+rccList[i].ID+"' type='checkbox' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax123456 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:212px;text-align: center;'>"+rccList[i].CI_ITEM_CODE+"<input type='hidden' id='CI_ITEM_CODE"+rccList[i].ID+"' value='"+rccList[i].CI_ITEM_CODE+"'/></td>");
								$("#datagrid-btable-ajax123456 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:246px;text-align: center;'>"+rccList[i].CI_ITEM_NAME+"<input type='hidden' id='CI_ITEM_NAME"+rccList[i].ID+"' value='"+rccList[i].CI_ITEM_NAME+"'/></td>");
								$("#datagrid-btable-ajax123456 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:246px;text-align: center;'>"+rccList[i].CI_ITEM_SPEC+"<input type='hidden' id='CI_ITEM_SPEC"+rccList[i].ID+"' value='"+rccList[i].CI_ITEM_SPEC+"'/></td>");
								trCount++;
							}
							
						}
						pageFun(data.ajaxPage,"formId1");
							var tableTrJs = $("#datagrid-btable-ajax123456 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax123456');
							defTableWidthRewrite("123456");
						
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
function getAllItem(){
		if($("#item_list_cb").attr("checked")=="checked"){
			$("#itemTbody :checkbox").attr("checked",true);
		}else{
			$("#itemTbody :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	} 
	
function getAllItems(){
		if($("#allSelects").attr("checked")=="checked"){
			$("#addItemInfo :checkbox").attr("checked",true);
		}else{
			$("#addItemInfo :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	}       	
        	//保存选择的物料
        function addItemList(showId,backId){
        	var len = $("#addItemInfo tr").length;
        	$("#itemTbody :checkbox").each(function(){
        			if($(this).attr("checked")){
        			    if (!$("#trr"+$(this).attr("id")).length) {
        					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='trr"+$(this).attr("id")+"' ></tr>");
        					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(len+1)+"</td>");
        					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
        					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;'>"+$("#CI_ITEM_CODE"+$(this).attr("id")).val()+"<input type='hidden' name='CI_ITEM_CODE' value='"+$("#CI_ITEM_CODE"+$(this).attr("id")).val()+"'/></td>");
        					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: center;'>"+$("#CI_ITEM_NAME"+$(this).attr("id")).val()+"</td>");
        					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;'>"+$("#CI_ITEM_SPEC"+$(this).attr("id")).val()+"</td>");
        					
        
        					len = len+1;
        					trrCount++;
        					var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
        					_tongLineColor(tableTrJs);
        					clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');	
        					defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
        
                    }	
        			}
        	})
        	$("#itemTbody").empty();
        	
        	hideDiv(showId,backId);
        	trCount=0;
        	$("#item_list_cb").attr("checked",false);
        }
        
        	function delRow(){
        	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 :checkbox").each(function(){
        		if($(this).attr("checked")){
        			var trid = $(this).parent().parent().attr("id");
        			
        			$("#"+trid).remove();
        		}
        	});
        	reSort("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
        	var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
        	_tongLineColor(tableTrJs);
        	clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
        	defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
        }
//重新排序
function reSort(objid){
         
         var i = 1;
         $("#"+objid+" tbody tr").each(function(){
         
         $(this).find("td").eq(0).text(i);
         
         i++;
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
         function editCal(){
			
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
               
                        
                        
                        var len = $("#addItemInfo tr").length;
                        if(len<=0){
                           //utilsFp.confirmIcon(1,"","","", "%{getText("请至少添加一条物料信息")}",0,"260","");
                           utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少添加一条机种信息" />",0,"260","");
                           return;
                        }
                        var ctId = $("#paraMapObj_CT_ID").val();
  document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=752dc9c97736427ea45a9bde48cad552&ctId="+ctId;
  document.forms.editForm.submit();
}         
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script>(function($){
  $(window).on('load',function(){
    //setPopScroll('.datagrid-body','.datagrid-header-inner');
    setPopScroll('.scroll11','.head11');
    setPopScroll('.scroll1','.head1');
  //   setPopScroll(''.scroll2');
   // setPopScroll('.scroll1');
   // setPopScroll('.scroll2');
  })
})(jQuery)</script>
    <script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
