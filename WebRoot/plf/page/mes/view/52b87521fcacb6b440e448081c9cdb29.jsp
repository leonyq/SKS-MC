<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="物料组关联" /></title>
	
	<style>
		
		
	    .datagrid-header,.datagrid-div3{
	       width:100% !important;
	      }
	
	
		.bd{
			height:543px !important;
		}
	</style>
	
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
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
	<style type="text/css">
		.x-fieldset{border:1px solid #B5B8C8;padding:10px;margin-botton:10px;display:block;}
	</style>
	<script type="text/javascript">
	function delItemRow(url,groupSn){
	var falg = 0; 
		$("input[name='isSelect1']:checkbox").each(function () { 
			if ($(this).attr("checked")) { 
			falg =1; 
			} 
			});
			if (falg > 0) {
		$("input[name='isSelect1']:checked").each(function() { // 遍历选中的checkbox
	           // var n = $(this).parents("#loadItem tr").index();  // 获取checkbox所在行的顺序
	            var ci_item_code=$(this).val();
	            			$.ajax({
						url:url,
						type:"post",
						data:{"ITEM_CODE":ci_item_code,"groupSn":groupSn},
						success:function(data){
							if(null == data){return ;}
							var suc_Map=data.dataMap;
							//alert('${dataMap.suc_msg}');
							//listAx("submitForm");
							location.reload();
							
						},
						error: function(msg){
							util.closeLoading();
							util.alert("error:"+msg);
		  				}
					});
        	 });
        	 }else
        	 utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少选择一条记录" />",0,"260","");
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
	</script>
</head>
<body>
  <div class="mod" style="margin-top: 37px;hight:405px;">
	<div>
			    	<div class="optn">
			    	        <button type="button" onclick="editCal();"><i class="ico ico-save"></i><dict:lang value="提交" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			<div class="bd" style="padding:0 20px;">
					<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
								<input type="hidden" name="exeid" value="${exeid}">
								<input type="hidden" name="definedMsg" value="${definedMsg}">
								<input type="hidden" name="formId" value="${formId}">
								<input type="hidden" name="iframeId" value="${iframeId}">
								<input type="hidden" name="dataId" value="${dataId}">
										
		<bu:set name="paraMapObj" value="${dataId}" formId="4e26051dfc65446098d440a56f1c41f8" type="edit" />
		
<div class="mod-hd">		
  <h3 class="tit"><dict:lang value="基本信息" /></h3>	
</div>
	<table class="basic-table" id="table1" name="table1">
	<input type="hidden" name="formIds" value="4e26051dfc65446098d440a56f1c41f8" />
	<input type="hidden" name="4e26051dfc65446098d440a56f1c41f8" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'c4c89176f8d54bddacf8a95be0526259'" />
		<s:set name="_$formId_1" value="'4e26051dfc65446098d440a56f1c41f8'" />
		<s:set name="_$type" value="'edit'" />
		<input type="hidden" name="temp_cig_sn" value="${paraMapObj.CIG_SN}"/>
		<tr>
			<td class="name" style="width:76px;"/><span class="dot">*</span><bu:uitn colNo="CIG_SN" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec"  colNo="CIG_SN" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_SN" formId="4e26051dfc65446098d440a56f1c41f8" dataId="${dataId}" formIndex="1"  disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" /></bu:td>
			<td class="name" style="width:76px;"/><span class="dot">*</span><bu:uitn colNo="CIG_NAME" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" style="width:230px;" colNo="CIG_NAME" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_NAME" formId="4e26051dfc65446098d440a56f1c41f8" dataId="${dataId}" formIndex="1" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CIG_TYPE" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_TYPE" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_TYPE" formId="4e26051dfc65446098d440a56f1c41f8" dataId="${dataId}" formIndex="1"  disabled="disabled" /></bu:td>
		</tr>
	</table>
</form>
	<DIV id="content1">
<div class="mod-hd">		
  <h3 class="tit"><dict:lang value="物料信息" /></h3>	
  <div class="extend-btn" style="float:right;margin-top:15px;">
<button href="javascript:void(0);" onclick="selectItem('${paraMapObj.CIG_SN}');" title="<dict:lang value="添加" />"><i class="ico ico-kl-new-add ico-small"></i></button>
<button href="javascript:void(0);" onclick="delItem('${paraMapObj.CIG_SN}');" title="<dict:lang value="删除" />"><i class="ico ico-sc-new-add ico-small"></i></button>
</div>
</div>  
<form id="submitForm" name="submitForm" action="" method="post"
					target="submitFrame">
	
<div class="panel datagrid datagrid-div1">
	<div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view" style="">
			<div class="datagrid-header">
				<div class="datagrid-header-inner" id="datagrid-header-inner" style="width:100%">
				<table id="datagrid-htable" class="datagrid-htable fixedTable  " >
			
					<tbody>
					<tr class="thcolor">
						<td class="datagrid-cell" style="width:20px;"  ></td >
						<td class="datagrid-cell" style="width:20px;" ><input type="checkbox" id="allSelect" name="allSelect"/></td >
						<td class="datagrid-cell" style="width:130px;"  ><dict:lang value="物料料号" /></td >
						<td class="datagrid-cell" style="width:230px;"  ><dict:lang value="物料名称" /></td >
						<td class="datagrid-cell" style="width:180px;"  ><dict:lang value="物料规格" /></td >
						<td class="datagrid-cell"   ><dict:lang value="物料类型" /></td >
					</tr>
					</tbody>
	          </table>
	 </div>
</div>
								
							
	<div class="datagrid-body datagrid-div3" id="datagrid-body" style="height:260px;">
		<table class="datagrid-btable fixedTable" id="itemRe">
					
					<tbody id="addLoadItem">
					<input type="hidden" id="totalPage" value="${page.totalPage}"/>
			<input type="hidden" id="totalRecord" value="${page.totalRecord}"/>
					<c:forEach items="${page.dataList}" var="cdlList" varStatus="status">
								<tr id="${cdlList.rownum}" name="${cdlList.rownum}">
									<td  class="datagrid-cell datagrid-cell-0"  style="text-align: center;width:20px;">
										${status.index+1}
									</td>
									<td class="datagrid-cell datagrid-cell-1"  style="text-align: center;width:20px;" ><input type="checkbox" value="${cdlList.ci_item_code}" name="isSelect1"/></td>
									<td class="datagrid-cell datagrid-cell-2"  style="width:130px;">
										${cdlList.ci_item_code}
										<input type="hidden" name="ci_item_code" value="${cdlList.ci_item_code}"/>
									</td>
									<td class="datagrid-cell datagrid-cell-3"  style="width:230px;" >
										${cdlList.ci_item_name}
										<input type="hidden" name="ci_item_name" value="${cdlList.ci_item_name}"/>
									</td>
									<td class="datagrid-cell datagrid-cell-4"  style="width:180px;">
										${cdlList.ci_item_spec}
										<input type="hidden" name="ci_item_spec" value="${cdlList.ci_item_spec}"/>
									</td>
									<td class="datagrid-cell datagrid-cell-5" >
									<c:if test="${cdlList.ci_item_type==1}"><dict:lang value="原料" /></c:if>
									<c:if test="${cdlList.ci_item_type==2}"><dict:lang value="半成品" /></c:if>
									<c:if test="${cdlList.ci_item_type==3}"><dict:lang value="成品" /></c:if>
									
										<input type="hidden" name="ci_item_type" value="${cdlList.ci_item_type}"/>
									</td>
								</tr>
					</c:forEach>
					</tbody>
	</table>
	</div>
	
</div>
</div>
</form>	
	</div>
		<div id="tempPage">
			<c:choose>
				<c:when test="${isFullScreen==1}">
					<s:include value="/plf/page/fp/paginationAx.jsp?listDataFn=listAx&formId=submitForm11&showLoading=0" />
				</c:when>
				<c:otherwise>
					<%--<s:include value="/plf/page/fp/pagination.jsp?formId=searchForm" />
				--%>
				<s:include value="/plf/page/fp/paginationPopAx.jsp?listDataFn=listAx&formId=submitForm11&showLoading=0" />
				</c:otherwise>
			</c:choose>
			<%-- <bu:jsVal formId="4e26051dfc65446098d440a56f1c41f8" formIndex="1" /> --%>
		</div>							
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	</div>

	<script type="text/javascript">
			var parentWindow;
			$(function(){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
			});
		var isQuery = false;
		//分页相关
		var ajaxPage = new Object();
		var firstTemp = "${page.first}";
		var lastTemp = "${page.last}";
		ajaxPage.currentPage = parseInt("${page.currentPage}");
		ajaxPage.pageRecord = parseInt("${page.pageRecord}");
		ajaxPage.totalPage = parseInt("${page.totalPage}");//总页数
		ajaxPage.totalRecord = parseInt("${page.totalRecord}");//总记录数
		ajaxPage.first = firstTemp == "true" ? true : false;
		ajaxPage.last = lastTemp == "true" ? true : false;
		showPageBar(ajaxPage,"submitForm11");
		
		function listAx(paginationImpl){
		//var url = getItemUrl+"&type=0&groupSn="+'${paraMapObj.CIG_SN}';
		var url = "/mes/buss/bussModel_exeFunc.ms?FUNC_CODE=F2060&funcMId=1065560783de4382970a9f1bb6123661&type=0&groupSn="+'${paraMapObj.CIG_SN}';
		util.showLoading("处理中...");
	  $.ajax({
		type: "POST",
	    dataType: "html",
	    url: url,
	    data: $("#submitForm").serialize()+"&groupSn="+'${paraMapObj.CIG_SN}'+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
		success: function(data){
				var tbodyStr = "";
					var tabContent=$(data).find("#addLoadItem");
					$("#addLoadItem").html(tabContent.html());
					//_GLO_FORM_PAGE_MAP[paginationImpl].totalPage=$("#totalPage").val();
					ajaxPage.currentPage =_GLO_FORM_PAGE_MAP[paginationImpl].currentPage;	
					ajaxPage.pageRecord =_GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
					ajaxPage.totalPage = $("#totalPage").val();
					ajaxPage.totalRecord = $("#totalRecord").val();
					//alert($("#totalPage").val());
					showPageBar(ajaxPage,"submitForm11");
					var tableTrJs =$("#addLoadItem").find("tr");
                                        _tongLineColor(tableTrJs);
					init();

			},
		error: function(msg){
				util.closeLoading();
				util.alert("error:"+msg);
		  }
		});	
	}
		
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
			document.forms.editForm.submit();
			isQuery = true;
		}
		
		//页面刷新时查询物料组里面的物料
	/*$(document).ready(function () {        
    		jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: getItemUrl+"&groupSn="+'${paraMapObj.CIG_SN}',
 			success: function(data){
 				var itemList=data.ajaxList;
 				var tempType;			
 				for(var i = 0;i < itemList.length; i++){
 					if(itemList[i].CI_ITEM_SPEC==null) itemList[i].CI_ITEM_SPEC="";
 					if(itemList[i].CI_ITEM_TYPE!=null){
 					if(itemList[i].CI_ITEM_TYPE==1)		tempType="原料";
 					if(itemList[i].CI_ITEM_TYPE==2)		tempType="半成品";
 					if(itemList[i].CI_ITEM_TYPE==3)		tempType="成品";
 					}else tempType="";
 					$("#hidDiv").append("<input id=temp_"+itemList[i].CI_ITEM_CODE+" name='ci_item_code' type='hidden' value='"+itemList[i].CI_ITEM_CODE+"'>");
					$("#loadItem tbody:last").append("<tr id='"+itemList[i].CI_ITEM_CODE+"'></tr>");
					$("#loadItem tr:last").append("<td align='center' width='90px;'><input type='checkbox' value='"+itemList[i].CI_ITEM_CODE+"' name='isSelect1'/></td>");
					$("#loadItem tr:last").append("<td>"+itemList[i].CI_ITEM_CODE+"</td>");
					$("#loadItem tr:last").append("<td>"+itemList[i].CI_ITEM_NAME+"</td>");
					$("#loadItem tr:last").append("<td>"+itemList[i].CI_ITEM_SPEC+"</td>");
					$("#loadItem tr:last").append("<td>"+tempType+"</td>");
				}
				var tableTrJs = $("#loadItem tbody tr");
				_toClickColor(tableTrJs);
				_tongLineColor(tableTrJs);	
 			},
 			error: function(msg){
				util.closeLoading();
				//utilsFp.alert("error:"+msg);
     				utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
			}
 		});
	});*/
		
		function alertInfo(msg){
			isQuery = false;
			utilsFp.alert(msg);
		}
		
		function reloadPg(msg){
			isQuery = false;
			parentWindow.reloadPg(msg);;
		}
	
		var FORM_COL_ID_D=null;

		
		function init(){
		clickTr('itemRe');
		$("#allSelect").click(function(){
    			if($("#allSelect").attr("checked") == "checked"){
        			$("input[name='isSelect1']").attr("checked","checked");
    			}else{
        			$("input[name='isSelect1']").removeAttr("checked","checked");
    			}
			});
			
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
<bu:script viewId="c4c89176f8d54bddacf8a95be0526259" />
<bu:submit viewId="c4c89176f8d54bddacf8a95be0526259" />
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
