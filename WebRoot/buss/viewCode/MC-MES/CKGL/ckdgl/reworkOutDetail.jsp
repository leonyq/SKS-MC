<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_18" />
	<jsp:param name="location" value="beforePageLoad" />
</jsp:include>
<style type="text/css">
	#myTable .input {
		width:210px !important;
	}
</style>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title>
		<dict:lang value="修改" />
	</title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
		<style type="text/css">	
    	#addSecondItemDetail .chosen-container {
    	    position: initial
    	}
    	#addItemInfo .chosen-container {
    	    position: initial
    	}
	</style>
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
		/*
		if(tag=="tag1"){
			listAjaxTable("2f1adeb396c4403b8fea545ec6317938");
			$("#allSelect").removeAttr("checked");
		}
		if(tag=="tag2"){
			searchItemDetail();
			$("#allSelect1").removeAttr("checked");
		}
		*/
	}
$(function(){
	$("#tag1").addClass("current");
	$(document.getElementById('T2#WRD_DOC_TYPE')).closest('.group').attr("style","display:none;");
	
})

</script>
	<!-- head里面 -->
	<script type="text/javascript">
		
		var wmsOption;
		
		//获取仓库信息
		function getWmsSel() {
			$.ajax({
				type: "POST",
				dataType: "json",
				url: "buss/bussModel_exeFunc.ms?funcMId=36ab8790932148f59643b4cf74962e00"+"&dataAuth=${param.dataAuth}",
				data: "",
				success: function(data) {
					//console.log(data.ajaxMap.samplList);
					wmsOption = "<option value=''>--请选择--</option>";
					if(null == data) { return; }
					if(null != data.ajaxList) {
						var rccList = eval(data.ajaxList);
						for(var i = 0; i < rccList.length; i++) {
							wmsOption = wmsOption + "<option value='" + rccList[i].WA_AREA_SN + "'>" + rccList[i].WA_AREA_NAME + "</option>";
						}
					}
					getItem();

				},
				error: function(msg) {
					util.closeLoading();
					utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "300", "");
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
		//重新排序
		function reSort(objid) {

			var i = 1;
			$("#" + objid + " tbody tr").each(function() {

				$(this).find("td").eq(0).text(i);

				i++;
			});
		}
		//全选
		function getAllItem() {
			if($("#item_list_cb").attr("checked") == "checked") {
				$("#itemTbody :checkbox").attr("checked", true);
			} else {
				$("#itemTbody :checkbox").each(function() {
					$(this).attr("checked", false);
				});
			}
		}
		//全选1
		function getAllPo() {
			if($("#po_list_cb").attr("checked") == "checked") {
				$("#poInfoTbody :checkbox").attr("checked", true);
			} else {
				$("#poInfoTbody :checkbox").each(function() {
					$(this).attr("checked", false);
				});
			}
		}
		//全选2
		function getAllItems() {
			if($("#allSelects").attr("checked") == "checked") {
				$("#addItemInfo :checkbox").attr("checked", true);
			} else {
				$("#addItemInfo :checkbox").each(function() {
					$(this).attr("checked", false);
				});
			}
		}
		
		function OnInput2(event,thisObj) {
            var newContent=event.target.value;
            var objId="#"+thisObj;
            //范围值
            if(!/^-?\d*$/.test(newContent)){
				$(objId).val("");
				_alertValMsg($(objId), "<dict:lang value="该项只能输入数字" />");
				flag=true;
            }
        }
		function OnPropChanged (event) {
            if (event.propertyName.toLowerCase () == "value") {
                //alert ("The new content2: " + event.srcElement.value);
            }
        }
		
	</script>
</head>

<body style="background-color: white;">
	<div class="edit">
		<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
		<div class="hd" style="display: none;">
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
		    	        <button type="button" onclick="editInfo();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
    					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
    					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
		    </div>

		</div>
	<div class="bd" style="height:550px;border:0">

		<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
			<jsp:param name="modelName" value="VIEW_TYPE_18" />
			<jsp:param name="location" value="editForm" />
		</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="bc3be8856f4f4b09bd75be3a5f1c5b5f" type="edit" />
		<div class="js-tab">
					<DIV id="container" style="padding:0 2px;box-sizing: border-box;">
						<DIV class="hd">
							<UL class="tab-list tab">
								
								<LI id="tag1"><A class=""
									onclick="switchTag('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="基本信息" /></SPAN> </A>
								</LI>
								<LI id="tag2"><A class=""
									onclick="switchTag('tag2','content2','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="单据明细" /></SPAN> </A>
								</LI>
							</UL>
						</DIV>
			<DIV class="content1" id="content" style="margin-top: 15px;">
			<DIV id="content1" style="margin-top:4px;" data-tab="tag1">
			<table class="basic-table" id="myTable">
				<input type="hidden" id="docNum" name="docNum" value="" />
				<input type="hidden" name="formIds" value="bc3be8856f4f4b09bd75be3a5f1c5b5f" />
				<input type="hidden" name="formId" id="formId2" value='bc3be8856f4f4b09bd75be3a5f1c5b02'/>
				<input type="hidden" name="bc3be8856f4f4b09bd75be3a5f1c5b5f" value="paraMap1@" />
				<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
				<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
				<s:set name="_$viewId" value="'54518be531bd425abec431bb4e97fc0c'" />
				<s:set name="_$formId_1" value="'bc3be8856f4f4b09bd75be3a5f1c5b5f'" />
				<s:set name="_$type" value="'detail'" />
				<tr>
					<td class="name" style="width:69px;"/>
					<bu:uitn colNo="WOI_DOC_NUM" formId="bc3be8856f4f4b09bd75be3a5f1c5b5f" />
					</td>
					<bu:td cssClass="dec" colNo="WOI_DOC_NUM" formId="bc3be8856f4f4b09bd75be3a5f1c5b5f">
						<bu:ui colNo="WOI_DOC_NUM" style="width:210px;" formId="bc3be8856f4f4b09bd75be3a5f1c5b5f" dataId="${dataId}" formIndex="1" /></bu:td>

					<td class="name" style="width:69px;"/>
					<bu:uitn colNo="T5#WDT_TYPE_NAME" formId="bc3be8856f4f4b09bd75be3a5f1c5b5f" />
					</td>
					<bu:td cssClass="dec" colNo="T5#WDT_TYPE_NAME" formId="bc3be8856f4f4b09bd75be3a5f1c5b5f">
						<bu:ui colNo="T5#WDT_TYPE_NAME" style="width:210px;" formId="bc3be8856f4f4b09bd75be3a5f1c5b5f" dataId="${dataId}" formIndex="1" /></bu:td>

					<td class="name" style="width:69px;"/>
					<bu:uitn colNo="T2#WOD_DISPATCH_SN" formId="bc3be8856f4f4b09bd75be3a5f1c5b5f" />
					</td>
					<bu:td cssClass="dec"  colNo="T2#WOD_DISPATCH_SN" formId="bc3be8856f4f4b09bd75be3a5f1c5b5f">
						<bu:ui colNo="T2#WOD_DISPATCH_SN" style="width:210px;" formId="bc3be8856f4f4b09bd75be3a5f1c5b5f" dataId="${dataId}" formIndex="1" /></bu:td>

				</tr>
				<tr>
					<td class="name" />
					<bu:uitn colNo="T2#WOD_OUTSTOCK_DATE" formId="bc3be8856f4f4b09bd75be3a5f1c5b5f" />
					</td>
					<bu:td cssClass="dec" colNo="T2#WOD_OUTSTOCK_DATE" formId="bc3be8856f4f4b09bd75be3a5f1c5b5f">
						<bu:ui colNo="T2#WOD_OUTSTOCK_DATE" style="width:210px;" formId="bc3be8856f4f4b09bd75be3a5f1c5b5f" dataId="${dataId}" formIndex="1" /></bu:td>

					<td class="name" /><bu:uitn colNo="T2#WOD_URGENT_FLAG" formId="bc3be8856f4f4b09bd75be3a5f1c5b5f" /></td>
			        <bu:td cssClass="dec" colNo="T2#WOD_URGENT_FLAG" formId="bc3be8856f4f4b09bd75be3a5f1c5b5f" >
			        <bu:ui colNo="T2#WOD_URGENT_FLAG" formId="bc3be8856f4f4b09bd75be3a5f1c5b5f" dataId="${dataId}" formIndex="1" />
			        <bu:uitn colNo="T2#WOD_ERP_FLAG" formId="bc3be8856f4f4b09bd75be3a5f1c5b5f" />
			        <bu:ui colNo="T2#WOD_ERP_FLAG" formId="bc3be8856f4f4b09bd75be3a5f1c5b5f" dataId="${dataId}" formIndex="1" />
			        </bu:td>

                	<td class="name" />
					<bu:uitn colNo="T2#WOD_STATUS" formId="bc3be8856f4f4b09bd75be3a5f1c5b5f" />
					</td>
					<bu:td cssClass="dec" colNo="T2#WOD_STATUS" formId="bc3be8856f4f4b09bd75be3a5f1c5b5f">
						<bu:ui colNo="T2#WOD_STATUS" style="width:200px;" formId="bc3be8856f4f4b09bd75be3a5f1c5b5f" dataId="${dataId}" formIndex="1" /></bu:td>
				</tr>

				<tr>
					<td class="name" />
					<bu:uitn colNo="T2#WOD_MEMO" formId="bc3be8856f4f4b09bd75be3a5f1c5b5f" />
					</td>
					<bu:td cssClass="dec" colNo="T2#WOD_MEMO" formId="bc3be8856f4f4b09bd75be3a5f1c5b5f" style="height:80px;" colspan="5">
						<bu:ui colNo="T2#WOD_MEMO" style="width:100%;height:100%" formId="bc3be8856f4f4b09bd75be3a5f1c5b5f" dataId="${dataId}" formIndex="1" /></bu:td>

				</tr>
			</table>
			</div>
			<DIV id="content2" style="display:none" data-tab="tag2">
			<div class="extend-btn" id="addDel" style="display: none; float: right;margin-top:5px;margin-bottom:5px;">
				<button type="button" onclick="popItemDiv('addItem','backItem');" style="padding:0;" title="选择料站表">
					<i class="ico ico-kl-new-add ico-small"></i>
				</button>
				<button type="button" onclick="popPoInfoDiv('addPoInfo','backPoInfo');" style="padding:0;" title="选择制令单"><!--popPoInfoDiv('addPoInfo','backPoInfo');-->
					<i class="ico ico-kl-new-add ico-small"></i>
				</button>
				<button type="button" onclick="delRow();" style="padding:0" title="删除">
					<i class="ico ico-sc-new-add ico-small"></i>
				</button>
			</div>
			<div class="mod">
				<div class="mod-bd" style="margin-top:5px;border-bottom: none;height:500px;">
					<div class="panel datagrid datagrid-div1">
						<div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view">
							<div class="datagrid-header" style="">
								<div class="datagrid-header-inner" style="width:100%;" >
									<table class="datagrid-htable fixedTable  " id="datagrid-htablebc3be8856f4f4b09bd75be3a5f1c5b02" >
										<tbody>
											<tr class="datagrid-header-row datagrid-title-ajax">
												<td class="datagrid-cell" style="width:30px;"></td>
												<td class="datagrid-cell" style="width:30px;">
													<input type="checkbox" id="allSelects" name="allSelect" onchange="getAllItems();" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="物料料号" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="物料名称" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="物料规格" />
												</td>
												<td class="datagrid-cell" style="width:100px;">
													<dict:lang value="标准包装数量" />
												</td>
												<td class="datagrid-cell" style="width:80px;">
													<dict:lang value="计划数量" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="仓库" />
												</td>
												<td class="datagrid-cell" style="width:150px;">
													<dict:lang value="出库日期" />
												</td>
												<td style="display:none;width: 150px;text-align: center;"></td>
    							                <td style="display:none;width: 150px;text-align: center;"></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="datagrid-body datagrid-div3 scroll" style="height:425px;">
								<table class="datagrid-htable fixedTable dlist-table table-line" style="table-layout:fixed;"  id="datagrid-btable-ajaxbc3be8856f4f4b09bd75be3a5f1c5b02">
									<tbody id="addItemInfo">
										
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		</div>
	
	<bu:jsVal formId="bc3be8856f4f4b09bd75be3a5f1c5b5f" formIndex="1" />

	</div>
	</form>
	</div>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<script type="text/javascript">
		$(function() {
			//$("#paraMap1_WRD_CREATE_MAN").val($("#curUser").val());
			$("#paraMap1_WOI_PRO_FACE_chosen").css("width","200px");
			$("#docNum").val($("#paraMapObj_WOI_DOC_NUM").val());
		  	getWmsSel();
			getItem();
		})
		
		
		//根据入库单号获取对应物料信息
		function getItem(){ 
		//console.log(itemUrl);
		
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
		    	dataType: "json",
		    	url: "buss/bussModel_exeFunc.ms?funcMId=180ceb236daf4bd2bf0ea90a133b7ee0"+"&docNum="+$("#paraMapObj_WOI_DOC_NUM").val()+"&dataAuth=${param.dataAuth}",
		    	data: "",
				success: function(data){
		        	$("#addItemInfo").empty();
					util.closeLoading();
					if(null == data){return ;}
					if(null != data.ajaxList){
						var rccList = eval(data.ajaxList);
						for(var i=0;i<rccList.length;i++){
							if(rccList[i].ITEM_NAME==null) rccList[i].ITEM_NAME="";
							if(rccList[i].ITEM_SPEC==null) rccList[i].ITEM_SPEC="";
							if(rccList[i].PLAN_NUM==null) rccList[i].PLAN_NUM="";
							if(rccList[i].MIN_PACK==null) rccList[i].MIN_PACK="";
							if(rccList[i].MO_NUMBER==null) rccList[i].MO_NUMBER="";
							if(rccList[i].DELIVERY_DATE==null) rccList[i].DELIVERY_DATE="";
							
							var wmsSel = "<select id='wmsSel_" + (i+ 1) + "' name='wmsSelect' class=' input isSubmit _VAL_OjbsData dept_select' style='width:120px;'  disabled='disabled'>" + wmsOption + "</select>";
							/*
							$("#itemInfo tbody:last").append("<tr id='trr" + (i+ 1) + "' ></tr>");
							$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + (i + 1) + "</td>");
							$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
							$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:120px;text-align: center;'>" + rccList[i].ITEM_CODE + "<input type='hidden' name='ITEM_CODE' value='" + rccList[i].ITEM_CODE + "'/></td>");
							$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: center;'>" + rccList[i].ITEM_NAME + "</td>");
							$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;'>" + rccList[i].ITEM_SPEC + "</td>");
							$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:100px;text-align: center;padding:0;'><input type='text' style='width: 90px;padding:0;text-align: right;background-color:white;border:1px solid #ccc;'  disabled='disabled' class=' input isSubmit' id='CI_MIN_PACK"+(i+1)+"' name='MIN_PACK' value='"+rccList[i].MIN_PACK+"' oninput='OnInput2(event,\"CI_MIN_PACK"+(i+1)+"\")'/></td>");
							$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:80px;text-align: right;'>" + rccList[i].PLAN_NUM + "</td>");
							$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: right;display:none;'><input type='hidden' name='PLAN_NUM' value='" + rccList[i].PLAN_NUM + "'/></td>");
							$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:120px;padding:0;'>" + wmsSel + "</td>");
							$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:150px;text-align: center;display:none;'><input type='hidden' name='MO_NUMBER' value='" + rccList[i].MO_NUMBER + "'/></td>");
							$("#itemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='text-align: center;padding:0;'><input style='width:130px;padding:0;' disabled='disabled' name='DELIVERY_DATE' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})' value='"+rccList[i].DELIVERY_DATE+"'/></td>");
							*/
							
							var temps="<tr id='trr" + (i+ 1) + "' >"
							         +"<td  style='width:30px;text-align: center;'>" + (i + 1) + "</td>"			
                                    +"<td  style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1' value='"+rccList[i].ID+"'/><input type='hidden' name='itemId' value='"+rccList[i].ID+"'/></td>"
                                    +"<td  style='width:120px;text-align: center;'>" + rccList[i].ITEM_CODE + "<input type='hidden' name='ITEM_CODE' value='" + rccList[i].ITEM_CODE + "'/></td>"
                                    +"<td  style='width:120px;text-align: center;'>" + rccList[i].ITEM_NAME + "</td>"
                                    +"<td  style='width:120px;text-align: center;'>" + rccList[i].ITEM_SPEC + "</td>"
                                    +"<td  style='width:100px;text-align: center;padding:0;'><input type='text' disabled='disabled' style='width: 90px;padding:0;text-align: right;' maxlength='50' class=' input isSubmit' id='CI_MIN_PACK"+(i+ 1)+"' name='MIN_PACK' value='"+rccList[i].MIN_PACK+"' oninput='OnInput2(event,\"CI_MIN_PACK"+(i+ 1)+"\")'/></td>"
                                    +"<td  style='width:80px;text-align: right;'>" + rccList[i].PLAN_NUM + "</td>"
                                    
                                    +"<td  style='width:120px;padding:0;'>" + wmsSel + "</td>"
                                    
                                    +"<td  style='width:150px;text-align: center;padding:0;'><input style='width:130px;padding:0;' name='OUTSTOCK_DATE' disabled='disabled' class=' input isSubmit  _VAL_OjbsData WdateNomorl' onfocus='WdatePicker({skin:\"blue\",dateFmt:\"yyyy-MM-dd\"})' value='"+rccList[i].DELIVERY_DATE+"'/></td>"
                                    +"<td  style='width:150px;text-align: right;display:none;'><input type='hidden' name='PLAN_NUM' value='" + rccList[i].PLAN_NUM + "'/></td>"
							        +"<td  style='width:150px;text-align: center;display:none;'><input type='hidden' name='MO_NUMBER' value='" + rccList[i].MO_NUMBER + "'/></td>"
						$("#datagrid-btable-ajaxbc3be8856f4f4b09bd75be3a5f1c5b02").append(temps);
							
							//mySetChosen();//设置下拉框样式
							$("#wmsSel_"+(i+1)).val(rccList[i].WH_CODE);
							$("#wmsSel_"+(i+1)).trigger("chosen:updated");
							$("#wmsSel_"+(i+1)+"_chosen").attr("style","width:120px;");
							//trrCount++;
						}	
					
						var tableTrJs = $("#datagrid-btable-ajaxbc3be8856f4f4b09bd75be3a5f1c5b02 tbody tr");
						_tongLineColor(tableTrJs);
						clickTr('datagrid-btable-ajaxbc3be8856f4f4b09bd75be3a5f1c5b02');
						defTableWidthRewrite('bc3be8856f4f4b09bd75be3a5f1c5b02');
					}
				
				},
				error: function(msg){
					util.closeLoading();
					utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
			    }
			});
		}
		//点击行寄选中该行
		function clickTr(tableId) {
			$("#" + tableId + " tr").unbind("click");
			$("#" + tableId + " tr input[type=checkbox]").unbind("click");
			$("#" + tableId + " tr").on("click", function(e) {
				var trId = $(this).attr("id");
				if($("#" + trId + " :checkbox").attr("checked")) {
					$("#" + trId + " :checkbox").prop("checked", false);
					$("#" + trId).css("background-color", "");
				} else {
					$("#" + tableId + " input[type='checkbox']").each(function() {
						if($(this).attr("checked")) {
							$(this).prop("checked", false);
							$(this).parents("tr").css("background-color", "");
						}
					});
					$("#" + trId + " :checkbox").prop("checked", true);
					$("#" + trId).css("background-color", "#d3eafc");
				}
			});

			$("#" + tableId + " tr input[type=checkbox]").click(function(e) {
				e.stopPropagation();
				var style = $(this).parents("tr").attr("style");
				if(style && style.indexOf("background-color") > -1) {
					$(this).parents("tr").css("background-color", "");
				} else {
					$(this).parents("tr").css("background-color", "#d3eafc");
				}
			});
		}
		/*function checkVal(){  //标准包装数量   
			var tempVal;
			var tempId;
			var tempFlag1;
			for(var i=1;i<=trrCount;i++){
				tempVal = $("#CI_MIN_PACK_"+i).val();
				if(tempVal==null) continue;
				if(tempVal!=""){
					tempId = document.getElementById("CI_MIN_PACK_"+i);
					tempFlag1 = checkNum(tempVal,tempId);
				}
				if(tempFlag1=="0")
				return "0";
			}
			
		}*/
	</script>
	</script>
	<!-- js初始化方法 -->
	 <script type="text/javascript">
                 var parentWindow;
                    $(function(){
                         parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
                         $('.dialog-bd',parent.document).css('background-color','#fff');
                    });
                var isQuery = false;
                function edit(thisObj){
                    if(isQuery){util.alert("?数据正在提交，请稍候...");}
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
                
                /*function alertInfo(msg){
                    isQuery = false;
                    utilsFp.alert(msg);
                }*/
                
                function reloadPg(msg){
                    isQuery = false;
                    parentWindow.reloadPg(msg);;
                }
        
                //重置    
                function resetForm(){
                    $("#editForm")[0].reset();
                }
                        
                
                
                function init(){
                    if($("#leftTable-kz").length>0){
                        $("#leftTable-kz").show();
                    }
                    
                    if($("#leftTable").length>0){
                        $("#leftTable").show();
                    }
                    if($("input[type='hidden'][name='formIds']").length>1){
                        initEditDataLs();
                    }
                    /*
                    var formIds = $("input[type='hidden'][name='formIds']").val();
                    var formIdLs = formIds.split(",");
                    for(var i=0,j=formIdLs.length;i<j;i++){
                        getEditRows(formIdLs[i],"0");
                    }
                    */
                }
                
        
            
         </script>
	 <script>
	    (function($){
            $(window).on('load',function(){
            setPopScroll('.scroll','.datagrid-header-inner');
    	  })
        })(jQuery)
     </script>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_18" />
	<jsp:param name="location" value="pageOver" />
</jsp:include>