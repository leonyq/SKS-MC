<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<title><dict:lang value="视图模型" />
	<dict:lang value="列表" />
</title>
<%@ include file="/plf/common/pub_meta.jsp"%>
<jsp:include page="/plf/common/pub_head.jsp">
	<jsp:param name="popDivWin" value="1" />
	<jsp:param name="layui" value="1" />
</jsp:include>
</head>

<body>

	<div class="all">
		<div class="table_div">
			<form id="searchForm" name="searchForm"
				action="${path}sys/BussModelAction_radioListView.ms" method="post">
				<input type="hidden" id="paraMap_MID" name="paraMap.MID"
					value="<s:property value="paraMap.MID"/>" /> 
				<input type="hidden" id="paraMap_viewId" name="paraMap.viewId"
					value="<s:property value="paraMap.viewId"/>" /> 
				<input type="hidden" id="paraMap_viewCode" name="paraMap.viewCode"
					value="<s:property value="paraMap.viewCode"/>" />  
				<input type="hidden" id="paraMap_viewNameId" name="paraMap.viewNameId"
					value="<s:property value="paraMap.viewNameId"/>" /> 
			    <input type="hidden" id="paraMap_trId" name="paraMap.trId"
					value="<s:property value="paraMap.trId"/>" />
			    <input type="hidden" id="paraMap_whoPath" name="paraMap.whoPath"
					value="<s:property value="paraMap.whoPath"/>" />
				<input type="hidden" id="paraMap_funcId" name="paraMap.funcId"
					value="<s:property value="paraMap.funcId"/>" />
				<input type="hidden" id="paraMap_mcIframeName" name="paraMap.mcIframeName"
					   value="<s:property value="paraMap.mcIframeName"/>" />
					
					<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
				<input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
			</form>
			
			<table id="listTable" class="table_list table-mc-form">
				<thead>
					<tr class="tdcolor">
						<th style="width: 40px"><dict:lang value="序号" />
						</th>
						<th style="width: 40px"></th>
						<%--<th width="20%"><dict:lang value="视图ID" /></th>
			--%>
						<th style="width: 200px"><dict:lang value="视图名称" />
						</th>
						<%--<th width="15%"><dict:lang value="视图编码" /></th>--%>
						<th style="width: 100px"><dict:lang value="视图类型" />
						</th>
						<th style="width: 150px"><dict:lang value="功能菜单" />
						</th>
					</tr>
				<thead>
				<tbody>
					<s:iterator value="listData" status="index">
						<tr class="listDataTr" title="<dict:lang value="双击选中" />"
							style="cursor:pointer">
							<td><s:property value="#index.count" />
							</td>
							<td><input type="radio" name="viewId"
								value="<s:property value="ID"/>" />
							</td>
							<%--<td><s:property value="ID"/></td>--%>
							<td class="VIEW_NAME"><s:property value="VIEW_NAME" />
							</td>
							<%--<td><s:property value="VIEW_MODEL_CODE"/></td>--%>
							<td><dict:viewDict dictCode="VIEW_TYPE"
									dictValue="%{VIEW_TYPE}" />
							</td>
							<td><select name="selectedVal" id="select<s:property value='#index.index' />"  class="mc-list-input-edit">
									<option value="def"><dict:lang value="--请选择--" /></option>
									<s:iterator value="SELECTLIST" >
										<option value="<s:property value="keym"/>"><s:property value="NAME"/>(<s:property value="val"/>)</option>
									</s:iterator>
							</select>
							</td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</div>
		<div id="currentPageDiv" class="table_div"></div>
	<s:include value="/plf/common/layui_pagination.jsp" />

	</div>

	<form id="submitForm" name="submitForm" action="" target="submitFrame"
		method="post">
		<input type="hidden" id="del_id" name="paraMap.ID" /> <input
			type="hidden" id="MID" name="paraMap.MID"
			value="<s:property value="paraMap.MID"/>" />
	</form>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0"
			height="0"></iframe>
	</div>

	<script type="text/javascript">
		inputFocus();
		function query(thisObj) {
			document.forms.searchForm.submit();
			thisObj.onclick = function() {
				util.alert(util.submit_default_info);
			}
			util.showTopLoading();
		}

		function reloadPg(msg) {
			util.alert(msg);
			document.forms.searchForm.submit();
			util.showTopLoading();
		}

		function getUpId() {
			return $("#funcDtoSh_upId").val();
		}

		function init() {
			var tableTrJq = $("#listTable").find("tbody tr");
			_toClickColor(tableTrJq);
			_tongLineColor(tableTrJq);
		}

		$(function() {
			$(".listDataTr").click(function(){
				$(this).find("input[name='viewId']").attr("checked","checked");
				
			});
			var parentFrame = top.document.getElementById("iframe3");

			var isDef = true;
			if(!parentFrame) {//增加在“功能配置”新增、修改页面填写视图ID使用
				var paraMap_mcIframeName = $("#paraMap_mcIframeName").val();
				if(paraMap_mcIframeName) {
					isDef = false;
					parentFrame = top.document.getElementById(paraMap_mcIframeName);
				}
			}

			
			 $(".listDataTr").dblclick(function(){
			var viewId = $(this).find("input[name='viewId']:checked").val();
			var viewName = $(this).children(".VIEW_NAME").text();
			var paraMap_viewId = $("#paraMap_viewId").val();
			var paraMap_viewCode = $("#paraMap_viewCode").val();
			var trId = $("#paraMap_trId").val();
			var paraMap_viewNameId = $("#paraMap_viewNameId").val();
			//视图编码
			var selectKey = $(this).find("select[name='selectedVal']").val();
			var selectVal = $(this).find("select[name='selectedVal']").find("option:selected").text();
			var showName =viewName.trim()+"-"+selectVal;
			if( selectKey=="def" && isDef){
			    util.alert( '<dict:lang value="请选择视图编码" />');
			    return;
			}
			//console.log($("#viewId",window.parent.document).val());
			//var eleViewId = $("#viewId",window.parent.document).val();
			//var eleViewNameId = $("#viewNameId",window.parent.document).val();
			//alert(eleViewId);
			var mcIframeName  =window.parent.name;
			console.log(mcIframeName);
			 var mcWindow = getSrcByIframeName({mcIframeName:mcIframeName,type:'window'});
			 console.log(mcWindow);
			$("#"+paraMap_viewId,parentFrame.contentWindow.document).val(viewId);
			$("#"+paraMap_viewCode,parentFrame.contentWindow.document).val(selectKey);
	        $("input[type='checkbox'][value='"+trId+"']",parentFrame.contentWindow.document).attr("checked","checked");
	        $("#"+paraMap_viewNameId,parentFrame.contentWindow.document).val(showName);
	        var whoPath=$("#paraMap_whoPath").val();
	        $("#"+paraMap_viewNameId,parentFrame.contentWindow.document).attr("title",whoPath+"-"+viewName)
	        mcWindow.closePage();
			//window.parent.parent.closePopWin();
		}); 
	
			$("select[name='selectedVal']").val($("#paraMap_funcId").val());
		});
	</script>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>