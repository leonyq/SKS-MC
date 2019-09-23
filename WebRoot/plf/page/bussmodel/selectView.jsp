<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title><dict:lang value="关联视图选择" /></title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/pub_head.jsp" />
</head>
<body>

	<div class="all">
		<div>
			<form id="submitForm" name="submitForm" >
				<table id="add_table" class="table_list">
					<tbody>
						<tr>
							<td width="30%" class="tr1">
								<dict:lang value="模型"/>
							</td>
							<td width="70%">
								<select id="paraMap_MODEL" name="paraMap.MODEL" style="width: 99%;" onchange="listView(this);">
										<option value=""><dict:lang value="--请选择--" /></option>
									<s:iterator value="listData">
										<option value="<s:property value='ID'/>">
											<s:property value='M_NAME' />
										</option>
									</s:iterator>
								</select>
							</td>
						</tr>
						<tr>
							<td class="tr1">
								<dict:lang value="关联视图"/>
							</td>
							<td>
								<select id="paraMap_VIEW" name="paraMap.VIEW" style="width: 99%;">
										<option value=""><dict:lang value="--请选择--" /></option>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>

		<div class="ptop_10 txac">
			<input type="button" value="<dict:lang value="提交" />" onclick="add(this);" class="botton_img_add">
			&nbsp;&nbsp;
			<input type="button" value="<dict:lang value="关闭" />" onclick="parent.closePopWin();" class="botton_img_search">
		</div>

	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<script type="text/javascript">
	
	function alertInfo(msg){
		util.alert(msg);
	}
	
	function reloadPg(msg){
		parent.closePopWin();
		window.parent.reloadPg(msg);
	}
	
	function add(){
		if(null == $("#paraMap_VIEW").val() || "" == $("#paraMap_VIEW").val()){
			util.alert("<dict:lang value="关联视图" /> <dict:lang value="不能为空" />");
			return false;
		}
		parent.setBackVal($("#paraMap_VIEW").val(),$("#paraMap_VIEW option:selected").text());
		parent.closePopWin();
	}
	
	function listView(thisObj){
		util.showLoading();
		var viewJqObj = $(thisObj);
		var viewColJqObj = $("#paraMap_VIEW");
		viewColJqObj.empty();
		var url = "${path}sys/BussModelAction_listViewByMidAx.ms";
	    jQuery.ajax({
			type: "POST",
	    dataType: "json",
	    url: url,
	    data: {"paraMap.MID":viewJqObj.val()},
			success: function(data){
				if(null == data){return;}
				if(null !=data.ajaxList && data.ajaxList.length >0){
					jQuery.each(data.ajaxList, function(i, map) {
						viewColJqObj.append("<option value='"+map.ID+"'>"+map.VIEW_NAME+"</option>");
					});
				}
				util.closeLoading();
			},
			error: function(msg){
				util.alert("error:"+msg);
				util.closeLoading();
			}
		});
	}
	
	function init(){
	}
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>