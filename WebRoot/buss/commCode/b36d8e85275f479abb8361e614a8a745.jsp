<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/pub_tag.jsp"%>
<head>
	<title><dict:lang value="选择数据" /></title>
	<%@ include file="/common/pub_meta.jsp"%>
	<jsp:include page="/common/pub_head.jsp" >
			<jsp:param name="datePicker" value="1" />
	</jsp:include>
</head>
<body>

	<div class="all">
		<div>
		<form id="searchForm" name="searchForm" action="" method="post">
				  <table class="search_table">
    <tr>
      <td width="90%">
			<s:iterator value="#request.titleLs" id="title">
      <div class="search_div"><div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" title="??不等于 ?过滤"><s:property value="title"/></div>
      <s:set name="titleVal" value="%{title}" />
      <div class ="search_value">	<input type="text"  id="paraMap2_<s:property value="title"/>" name="paraMap2.<s:property value="title"/>" value="<s:property value="%{paraMap2[#title]}"/>" class="input_sh" style="width:132px;" /></div>
      </div>
      </s:iterator>
			<div style="margin-left: 3px;margin-top: 3px;float: left;text-align: center;" ><input type="button" value="查询" onclick="search();" class="botton_img_search" /></div>
			</td>
      </tr>
  </table>
		
		</form>
			<form id="submitForm" name="submitForm" action="" method="post" target="submitFrame">
				<table id="add_table" class="table_list">
					<thead>
							<th>&nbsp;&nbsp;</th>
							<th>序号</th>
							<s:iterator value="#request.titleLs" id="title">
							<th><s:property value="title"/></th>
							</s:iterator>
					</thead>
					<tbody>
						<s:iterator value="#request.dataLs" id="data" status="seq">
						<tr style="cursor: pointer;" onclick="selectVal(this,'<s:property value="key"/>','<s:property value="value"/>');" 
						ondblclick="selectVal(this,'<s:property value="key"/>','<s:property value="value"/>',true);">
							<td width="18px;"><input type="radio" name="selectValue" ></td>
							<td><s:property value="#seq.count"/></td>
							<s:iterator value="dataLa" id="val">
							<td><s:property value="#val"/></td>
							</s:iterator>
						</tr>
						</s:iterator>
					</tbody>
				</table>
			</form>
		</div>

	<div class="center">
		<s:include value="/common/pagination.jsp?formId=searchForm&resetSearchVal=resetSearchVal" />
	</div>
		<br>
		<div class="ptop_1 txac">
			<input id="submit_but" type="button" value="<dict:lang value="提交" />" onclick="add();" class="botton_img_add">
			&nbsp;&nbsp;
			<input type="button" value="<dict:lang value="清空" />" onclick="clearSel();" class="botton_img_add">
			&nbsp;&nbsp;
			<input type="button" value="<dict:lang value="关闭" />" onclick="parent.closePopWin();" class="botton_img_search">
		</div>
		<br>

	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<script type="text/javascript">
	
	function search(){
		document.forms.searchForm.submit();
	}

	function add(){
		if(null == _key){
			util.alert("<dict:lang value="选择项不能为空" />");
			return false;
		}
		<s:if test="null == #request.ccbFun || \"\" == #request.ccbFun">
		parent._setSelValue(_key,_value,_resObj);
		</s:if>
		<s:else>
		parent.${ccbFun}(_key,_value,_resObj);<%-- 加入自定义回调函数 --%>
		</s:else>
		parent.closePopWin();
	}
	
	function clearSel(){
		<s:if test="null == #request.ccbFun || \"\" == #request.ccbFun">
		parent._setSelValue("","",null);
		</s:if>
		<s:else>
		parent.${ccbFun}("","",null);<%-- 加入自定义回调函数 --%>
		</s:else>
		parent.closePopWin();
	}
	
	var _key;
	var _value;
	var _resObj = new Object();
	function selectVal(thisObj,key,value,isClose){
		_key = key;
		_value = value;
		$(thisObj).find("td").each(function(seq) {
			if(seq>1){
			}
		});
		extVals=$(thisObj).find("td");
		<s:iterator value="#request.titleLs" id="title" status="seq">
			_resObj.<s:property value="title"/>=extVals.eq(<s:property value="#seq.count"/>+1).text();
		</s:iterator>
		$(thisObj).find("input[type='radio'][name='selectValue']").eq(0).prop("checked",true);
		if(isClose){add();}
	}
	
	function init(){
		var tableTrJq = $("#add_table tbody tr");
		_toClickColor(tableTrJq);
		_tongLineColor(tableTrJq);
	}
</script>

</body>
<%@ include file="/common/pub_end.jsp"%>