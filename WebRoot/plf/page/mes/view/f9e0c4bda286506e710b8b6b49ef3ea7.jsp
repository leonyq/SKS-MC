<%@page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/pub_tag.jsp"%>
<head>
	<%@ include file="/common/pub_meta.jsp"%>
	<title>
		<dict:lang value="采购入库_新增" />
	</title>
	<jsp:include page="/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="datePicker" value="1" />
	</jsp:include>
	<%@ include file="/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/page/common/buss/bussCommJs.jsp"%>
	<script type="text/javascript">
		var addTableTrMap;
	</script>
</head>
<body>
	<div class="all">
		<div>
			<form id="addForm" name="addForm" action="${path}buss/bussModel_addComm.ms" method="post" <bu:formet exeid="%{exeid}" />
				target="submitFrame">
				<input type="hidden" name="exeid" value="${exeid}">
				<s:hidden name="%{@com.more.mes.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
				<s:token />
				<table class="func_table">
					<tr>
						<td width="100%" align="right">
							<input type="button" value="<dict:lang value="提交" />" onclick="add(this);" class="botton_img_add">
							<input type="button" value="<dict:lang value="关闭" />" onclick="parent.closePopWin();" class="botton_img_search">
						</td>
					</tr>
				</table>
	<input type="hidden" name="formIds" value="240e00fb449541a98541a619412c0a7a" />

	<table class="add_table">
	<input type="hidden" name="240e00fb449541a98541a619412c0a7a" value="paraMap0@" />
	<input type="hidden" name="paraMap0@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap0@__DATA_COUNT__" value="1" />
 		<tr>
			<th colspan="4"><span class="Eng">*</span>为必填项</th>
		</tr>
		<tr>
		</tr>
			<td class="tr1 ">入库单号</td>
			<td >
								<input type="text"  id="paraMap0_WR_DOC_NUM" name="paraMap0@0#WR_DOC_NUM" class="_VAL_NULL isSubmit " />
				<span class="Eng">*</span>
			</td>
			<td class="tr1 ">供应商</td>
			<td >
								<input type="text"  id="paraMap0_WR_PROVIDE" name="paraMap0@0#WR_PROVIDE" class="isSubmit " />
			</td>
		</tr>
			<td class="tr1 ">单据类型代码</td>
			<td >
								<input type="text"  id="paraMap0_DT_CODE" name="paraMap0@0#DT_CODE" class="_VAL_NULL isSubmit " />
				<span class="Eng">*</span>
			</td>
			<td class="tr1 ">工单号</td>
			<td >
								<input type="text"  id="paraMap0_PROJECT_ID" name="paraMap0@0#PROJECT_ID" class="isSubmit " />
			</td>
		</tr>
		</tr>
		<tr>
		</tr>
		</tr>
		<tr>
		</tr>
		</tr>
		<tr>
		</tr>
		</tr>
		<tr>
		</tr>
		</tr>
		<tr>
		</tr>
			<td class="tr1 ">录入人</td>
			<td >
								<input type="text"  id="paraMap0_WR_INPUT_NO" name="paraMap0@0#WR_INPUT_NO" class="isSubmit " />
			</td>
			<td class="tr1 ">订单表单ID</td>
			<td >
								<input type="text"  id="paraMap0_ORDER_ID" name="paraMap0@0#ORDER_ID" class="isSubmit " />
			</td>
		</tr>
		</tr>
		<tr>
		</tr>
	</table>
<div style="padding:1px;" ></div>
	<input type="hidden" name="formIds" value="2497a3c406d548f185f6e42e2a29ca29" />
	<input type="hidden" name="2497a3c406d548f185f6e42e2a29ca29" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<table id="addTable_2497a3c406d548f185f6e42e2a29ca29" class="table_list" >
		<thead>
 		<tr>
			<th colspan="28">[入库单明细]&nbsp;&nbsp;<span class="Eng">*</span>为必填项&nbsp;&nbsp;<a href="javascript:addRow('2497a3c406d548f185f6e42e2a29ca29','1');" title="追加"><img src="/mes/style/css1/images/button_add.gif" /></a></th>
		</tr>
		<tr class="tdcolor">
			<th class="tr1 ">物料代码</th>
			<th class="tr1 ">物料名称</th>
			<th class="tr1 ">物料规格</th>
			<th class="tr1 ">单位</th>
			<th class="tr1 ">计划数量</th>
			<th class="tr1 ">实收数量</th>
			<th class="tr1 ">传票号</th>
			<th class="tr1 ">供应商编号</th>
			<th>操作</th>
		</tr>
		</thead>
		<tbody>
		<textarea id="_addTableTr_2497a3c406d548f185f6e42e2a29ca29" style="width:0px;height:0px;display:none;" disabled="disabled" >		<tr id="addTableTr0_2497a3c406d548f185f6e42e2a29ca29" > 		<input type="hidden" id="addTable_FORM_COL_ID_D" value="278dac00c5a047b9958520c0a23b90da" > 			<td>				<input type="hidden"  name="paraMap1@0#WRD_ITEM_CODE" class="isSubmit " />
				<div><nobr><input editName="paraMap1@0#WRD_ITEM_CODE" type="text"  class="isSubmit " style="border:1px solid #FFD397;" ondblclick="_showSelFkSql(this,'%7B%22CUSTOM_CALL_BACK_FUNCTION%22%3A%22cbFun%22%2C%22sql%22%3A%22select+T.CO_ITEM_CODE+KEY%2C+T.CO_ITEM_CODE+VAL%2C+T.CO_ITEM_CODE%2C+T.CO_ITEM_NAME%2C+T.CO_ITEM_SPEC%5Cr%5Cn++from+B_CO_ITEM+T%5Cr%5Cn%22%2C%22CUSTOM_CALL_BACK_FUNCTION_CONTENT%22%3A%22function+cbFun%28key%2Cval%2Cobj%29%7B%5Cr%5Cn%5Ct%5Ct%2F%2Falert%28%5C%22key%3D%5C%22%2Bkey%2B%5C%22+%2Cval%3D%5C%22%2Bval%2B%5C%22+%2Cobj%3D%5C%22%2Bobj.CO_ITEM_NAME%29%3B%5Cr%5Cn%5Ct%5Ct_thisSelObj.value+%3D+val%3B%5Cr%5Cn%5Ct%5Ctvar+editName%3D%24%28_thisSelObj%29.attr%28%5C%22editName%5C%22%29%3B%5Cr%5Cn%5Ct%5Ct%24%28%5C%22input%5Bname%3D%27%5C%22%2BeditName%2B%5C%22%27%5D%5C%22%29.val%28key%29%3B%5Cr%5Cn%5Ct%5Ct%2F%2Fvar+editObj+%3D+%5C%22input%5Btype%3D%27hidden%27%5D%5Bname%3D%27%5C%22%2B%24%28_thisSelObj%29.attr%28%5C%22editName%5C%22%29%2B%5C%22%27%5D%5C%22%3B%5Cr%5Cn%5Ct%5Ct%2F%2Falert%28%24%28_thisSelObj%29.parent%28%29.parent%28%29.parent%28%29.find%28editObj%29.eq%280%29.val%28%29%29%3B%5Cr%5Cn%5Ct%5Ctif%28null%21%3Dobj%29%7B%5Cr%5Cn%5Ct%5Ct%5Ctvar+indx+%3D+editName.indexOf%28%5C%22%23%5C%22%29%3B%5Cr%5Cn%5Ct%5Ct%5Ctvar+CO_ITEM_NAME+%3D+editName.substring%280%2Cindx%29%2B%5C%22%23%5C%22%2B%5C%22CO_ITEM_NAME%5C%22%3B%5Cr%5Cn%5Ct%5Ct%5Ct%24%28%5C%22input%5Bname%3D%27%5C%22%2BCO_ITEM_NAME%2B%5C%22%27%5D%5C%22%29.val%28obj.CO_ITEM_NAME%29%3B%5Cr%5Cn%5Ct%5Ct%5Ctvar+CO_ITEM_SPEC+%3D+editName.substring%280%2Cindx%29%2B%5C%22%23%5C%22%2B%5C%22CO_ITEM_SPEC%5C%22%3B%5Cr%5Cn%5Ct%5Ct%5Ct%24%28%5C%22input%5Bname%3D%27%5C%22%2BCO_ITEM_SPEC%2B%5C%22%27%5D%5C%22%29.val%28obj.CO_ITEM_SPEC%29%3B%5Cr%5Cn%5Ct%5Ct%7D%5Cr%5Cn%5Ct%5Ct_thisSelObj.focus%28%29%3B%5Cr%5Cn%7D%22%7D','物料代码'); "  readonly="readonly"   /><img src="/mes/images/ContImg25.gif" onclick="_showSelFkSql_img(this,'paraMap1@0#WRD_ITEM_CODE');" style="cursor: pointer;" title="?点击选择 物料代码" /></nobr></div>

<script type="text/javascript">
function cbFun(key,val,obj){
		//alert("key="+key+" ,val="+val+" ,obj="+obj.CO_ITEM_NAME);
		_thisSelObj.value = val;
		var editName=$(_thisSelObj).attr("editName");
		$("input[name='"+editName+"']").val(key);
		//var editObj = "input[type='hidden'][name='"+$(_thisSelObj).attr("editName")+"']";
		//alert($(_thisSelObj).parent().parent().parent().find(editObj).eq(0).val());
		if(null!=obj){
			var indx = editName.indexOf("#");
			var CO_ITEM_NAME = editName.substring(0,indx)+"#"+"CO_ITEM_NAME";
			$("input[name='"+CO_ITEM_NAME+"']").val(obj.CO_ITEM_NAME);
			var CO_ITEM_SPEC = editName.substring(0,indx)+"#"+"CO_ITEM_SPEC";
			$("input[name='"+CO_ITEM_SPEC+"']").val(obj.CO_ITEM_SPEC);
		}
		_thisSelObj.focus();
}
</script></td>			<td>				<input type="text"  name="paraMap1@0#CO_ITEM_NAME" class="isSubmit " disabled="disabled"  />
</td>			<td>				<input type="text"  name="paraMap1@0#CO_ITEM_SPEC" class="isSubmit " disabled="disabled"  />
</td>			<td>				<input type="text"  name="paraMap1@0#COMP_UNIT" class="isSubmit " />
</td>			<td>				<input type="text"  name="paraMap1@0#WRD_PLAN_NUM" class="isSubmit " />
</td>			<td>				<input type="text"  name="paraMap1@0#WRD_RECEIVE_NUM" class="isSubmit " />
</td>			<td>				<input type="text"  name="paraMap1@0#WRD_TICKET_NUM" value="3c467ddb043948c7aca0c37a2f5f0345" class="isSubmit " />
</td>			<td>				<input type="text"  name="paraMap1@0#SUPPLIER_CODE" class="isSubmit " disabled="disabled"  />
</td>			<td><a href="javascript:void(0);" onclick="delRow(this);" title="?移除行"><img src="/mes/style/css1/images/m_rm.gif" /></a></td>		</tr>		</textarea>
<script>

</script>
		</tbody>
	</table>
	</table>
	<script type="text/javascript">
    function valData(){
		var checkRes = true;
		return checkRes;		}
  </script>

			</form>
		</div>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>


		<bu:script viewId="c878c67e778d40418cc94ea361b6e784" />
	
	<script type="text/javascript">
    
	function init(){
		var tableTrJs = $(".table_list tbody tr");
		_toClickColor(tableTrJs);
		_tongLineColor(tableTrJs);
	}

</script>

	<jsp:include page="/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/common/pub_end.jsp"%>
