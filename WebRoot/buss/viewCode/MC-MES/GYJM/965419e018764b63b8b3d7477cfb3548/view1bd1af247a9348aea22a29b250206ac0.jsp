<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
</head>
<body>
	<div class="edit">
            <div class="hd">
          
			    	<div class="optn">
			    	        <button type="button" onclick="editSave(this);"><i class="ico ico-save"></i><dict:lang value="提交" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i>取消</button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd">
					<form id="editForm" name="editForm" action="${path}buss/bussModel_editComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
								<input type="hidden" name="exeid" value="${exeid}">
								<input type="hidden" name="definedMsg" value="${definedMsg}">
								<input type="hidden" name="formId" value="881411561f8f4940ac22575c4b8f02ef">
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
		<bu:set name="paraMapObj" value="${dataId}" formId="881411561f8f4940ac22575c4b8f02ef" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="881411561f8f4940ac22575c4b8f02ef" />
	<input type="hidden" name="881411561f8f4940ac22575c4b8f02ef" value="paraMap2@" />
	<input type="hidden" name="paraMap2@__LEVEL__" value="2" />
	<input type="hidden" name="paraMap2@__DATA_COUNT__" value="2" />
		<s:set name="_$viewId" value="'1bd1af247a9348aea22a29b250206ac0'" />
		<s:set name="_$formId_1" value="'881411561f8f4940ac22575c4b8f02ef'" />
		<s:set name="_$type" value="'edit'" />
		<tr>
			<td class="name" /><span class="dot"></span><bu:uitn colNo="CB_ITEM_CODE" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<bu:td cssClass="dec" colNo="CB_ITEM_CODE" formId="881411561f8f4940ac22575c4b8f02ef" ><bu:ui colNo="CB_ITEM_CODE" formId="881411561f8f4940ac22575c4b8f02ef" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="T2#CI_ITEM_NAME" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<bu:td cssClass="dec" colNo="T2#CI_ITEM_NAME" formId="881411561f8f4940ac22575c4b8f02ef" ><bu:ui colNo="T2#CI_ITEM_NAME" formId="881411561f8f4940ac22575c4b8f02ef" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="T2#CI_ITEM_SPEC" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<bu:td cssClass="dec" colNo="T2#CI_ITEM_SPEC" formId="881411561f8f4940ac22575c4b8f02ef" ><bu:ui colNo="T2#CI_ITEM_SPEC" formId="881411561f8f4940ac22575c4b8f02ef" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="CB_VER" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<bu:td cssClass="dec" colNo="CB_VER" formId="881411561f8f4940ac22575c4b8f02ef" ><bu:ui colNo="CB_VER" formId="881411561f8f4940ac22575c4b8f02ef" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot"></span><bu:uitn colNo="CB_STATUS" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<bu:td cssClass="dec" colNo="CB_STATUS" formId="881411561f8f4940ac22575c4b8f02ef" ><bu:ui colNo="CB_STATUS" formId="881411561f8f4940ac22575c4b8f02ef" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" /><span class="dot"></span><bu:uitn colNo="CB_DEFAULT" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<bu:td cssClass="dec" colNo="CB_DEFAULT" formId="881411561f8f4940ac22575c4b8f02ef" ><bu:ui colNo="CB_DEFAULT" formId="881411561f8f4940ac22575c4b8f02ef" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CB_REMARK" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<td class="dec" colspan="3"><bu:ui colNo="CB_REMARK" formId="881411561f8f4940ac22575c4b8f02ef" dataId="${dataId}" formIndex="1" /></td>
		</tr>
	</table>
		<script type="text/javascript">
    function valData(){
		var checkRes = true;
		return checkRes;		}
  </script>
	<div style="padding:1px;" ></div>
<div class="mod">
<div class="mod-hd">
<h3 class="tit">BOM清单明细</h3>
<div class="more">
<a href="javascript:addRow('b9f80468a9fe4b74ada4fceff23db738','1');" title="?添加" class="btn-op" ><i class="ico ico-add"></i>?添加</a>
</div>
</div>
<div class="mod-bd">	<table id="addTable_b9f80468a9fe4b74ada4fceff23db738" width="100%" class="glxb-table table-line" >
	<input type="hidden" name="formIds" value="b9f80468a9fe4b74ada4fceff23db738" />
	<input type="hidden" name="b9f80468a9fe4b74ada4fceff23db738" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<thead>
		<tr class="tdcolor">
			<th class="tr1 " width="15%;"><span class="dot"></span>料号</th>
			<th class="tr1 " width="10%;">料号名称</th>
			<th class="tr1 " width="10%;">料号规格</th>
			<th class="tr1 " width="10%;"><span class="dot"></span>单位</th>
			<th class="tr1 " width="15%;"><span class="dot"></span>点位</th>
			<th class="tr1 " width="10%;">用量</th>
			<th class="tr1 " width="10%;">物料阶别</th>
			<th class="tr1 ">物料类型</th>
			<th>操作</th>
		</tr>
		</thead>
		<tbody>
		<input type="hidden" id="addTable_FORM_COL_ID_Db9f80468a9fe4b74ada4fceff23db738" value="3a6a195ea82c4ebbaaaacc3ee52c6438" > 		<textarea id="_addTableTr_b9f80468a9fe4b74ada4fceff23db738" style="width:0px;height:0px;display:none;" disabled="disabled" >		&lt;tr id=&quot;addTableTr0_b9f80468a9fe4b74ada4fceff23db738&quot;  &gt; 			&lt;td style=&quot;position:relative;padding-left:5px;padding-top:5px;&quot; width=&quot;15%;&quot;&gt;				&lt;input type=&quot;hidden&quot;  id=&quot;paraMapObj_0_CBD_ITEM_CODE&quot; name=&quot;paraMap1@0#CBD_ITEM_CODE&quot; class=&quot;_VAL_NULL isSubmit input&quot; /&gt;
				&lt;input editName=&quot;paraMap1@0#CBD_ITEM_CODE&quot; type=&quot;text&quot;  id=&quot;paraMapObj_0_CBD_ITEM_CODE_SHOW&quot; class=&quot;input _VAL_NULL isSubmit input&quot; ondblclick=&quot;_showSelFkSql(this,'edit%2Cb9f80468a9fe4b74ada4fceff23db738%2Ce39c1a17560c40639118d30ce3414d6b','&#26009;&#21495;','','%7B%22WP_WIDTH%22%3A%22600%22%2C%22WP_HEIGHT%22%3A%22600%22%2C%22WP_FULL_SCREEN%22%3A%220%22%7D','38d3b500-8f0f-4dbd-81ef-bfb6eff75a6e');&quot;  readonly=&quot;readonly&quot;   /&gt;&lt;button type=&quot;button&quot; class=&quot;ico ico-search&quot; onclick=&quot;_showSelFkSql_img(this,'paraMap1@0#CBD_ITEM_CODE');&quot; title=&quot;&#28857;&#20987;&#36873;&#25321; &#26009;&#21495;&quot; &gt;&lt;/button&gt;

&lt;script type=&quot;text/javascript&quot;&gt;
function cbFun(key,val,obj){
	_thisSelObj.value = val;
	var editName=$(_thisSelObj).attr(&quot;editName&quot;);
	$(&quot;input[name='&quot;+editName+&quot;']&quot;).val(key);
	//var editObj = &quot;input[type='hidden'][name='&quot;+$(_thisSelObj).attr(&quot;editName&quot;)+&quot;']&quot;;
	if(null!=obj){
		var indx = editName.indexOf(&quot;#&quot;);
		var CB_ITEM_NAME = editName.substring(0,indx)+&quot;#&quot;+&quot;CBD_ITEM_NAME&quot;;
		$(&quot;input[name='&quot;+CB_ITEM_NAME+&quot;']&quot;).val(obj.eq(4).text());
		var CB_ITEM_SPEC = editName.substring(0,indx)+&quot;#&quot;+&quot;CBD_ITEM_SPEC&quot;;
		$(&quot;input[name='&quot;+CB_ITEM_SPEC+&quot;']&quot;).val(obj.eq(5).text());
		var CB_ITEM_TYPE = editName.substring(0,indx)+&quot;#&quot;+&quot;CBD_ITEM_TYPE&quot;;
		var str='';
		if(obj.eq(8).text()==1){
			str='PCB';
		}else{
			str='&#29289;&#26009;';
		}
		$(&quot;input[name='&quot;+CB_ITEM_TYPE+&quot;']&quot;).val(str);
	}
	_thisSelObj.focus();
}

&lt;/script&gt;&lt;/td&gt;			&lt;td style=&quot;position:relative;padding-left:5px;padding-top:5px;&quot; width=&quot;10%;&quot;&gt;				&lt;input type=&quot;text&quot;  id=&quot;paraMapObj_0_CBD_ITEM_NAME&quot; name=&quot;paraMap1@0#CBD_ITEM_NAME&quot; class=&quot;isSubmit input&quot; disabled=&quot;disabled&quot;  /&gt;
&lt;/td&gt;			&lt;td style=&quot;position:relative;padding-left:5px;padding-top:5px;&quot; width=&quot;10%;&quot;&gt;				&lt;input type=&quot;text&quot;  id=&quot;paraMapObj_0_CBD_ITEM_SPEC&quot; name=&quot;paraMap1@0#CBD_ITEM_SPEC&quot; class=&quot;isSubmit input&quot; disabled=&quot;disabled&quot;  /&gt;
&lt;/td&gt;			&lt;td style=&quot;position:relative;padding-left:5px;padding-top:5px;&quot; width=&quot;10%;&quot;&gt;				&lt;input type=&quot;text&quot;  id=&quot;paraMapObj_0_CBD_UNITS&quot; name=&quot;paraMap1@0#CBD_UNITS&quot; class=&quot;_VAL_NULL isSubmit input&quot; /&gt;
&lt;/td&gt;			&lt;td style=&quot;position:relative;padding-left:5px;padding-top:5px;&quot; width=&quot;15%;&quot;&gt;				&lt;input type=&quot;text&quot;  id=&quot;paraMapObj_0_CBD_POINT&quot; name=&quot;paraMap1@0#CBD_POINT&quot; class=&quot;_VAL_NULL isSubmit input&quot; /&gt;
&lt;/td&gt;			&lt;td style=&quot;position:relative;padding-left:5px;padding-top:5px;&quot; width=&quot;10%;&quot;&gt;				&lt;input type=&quot;text&quot;  id=&quot;paraMapObj_0_CBD_ITEM_NUM&quot; name=&quot;paraMap1@0#CBD_ITEM_NUM&quot; class=&quot;isSubmit input&quot; /&gt;
&lt;/td&gt;			&lt;td style=&quot;position:relative;padding-left:5px;padding-top:5px;&quot; width=&quot;10%;&quot;&gt;				&lt;input type=&quot;text&quot;  id=&quot;paraMapObj_0_CBD_ITEM_SECTION&quot; name=&quot;paraMap1@0#CBD_ITEM_SECTION&quot; class=&quot;isSubmit input&quot; /&gt;
&lt;/td&gt;			&lt;td style=&quot;position:relative;padding-left:5px;padding-top:5px;&quot;&gt;				&lt;input type=&quot;text&quot;  id=&quot;paraMapObj_0_CBD_ITEM_TYPE&quot; name=&quot;paraMap1@0#CBD_ITEM_TYPE&quot; disabled=&quot;disabled&quot; class=&quot;isSubmit input&quot; /&gt;
&lt;/td&gt;			&lt;td&gt;&lt;a href=&quot;javascript:void(0);&quot; onclick=&quot;delEditRow(this,'','b9f80468a9fe4b74ada4fceff23db738');&quot; title=&quot;?&#21024;&#38500;&#25968;&#25454;&quot;&gt;&lt;img src=&quot;/mes/plf/style/css1/images/m_rm.gif&quot; /&gt;&lt;/a&gt;&lt;/td&gt;		&lt;/tr&gt;		</textarea>
<script>

</script>
		</tbody>
	</table>
</div>
</div>


									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<bu:script viewId="1bd1af247a9348aea22a29b250206ac0" />
<script type="text/javascript">
		alert(1)
			var parentWindow;
			$(function(){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
			});
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
			document.forms.editForm.submit();
			isQuery = true;
		}
		
		function alertInfo(msg){
			isQuery = false;
			utilsFp.alert(msg);
		}
		
		function reloadPg(msg){
			isQuery = false;
			parentWindow.reloadPg(msg);;
		}

		//重置	
		function resetForm(){
			$("#editForm")[0].reset();
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
		    data:{'paraMap.FORMID':tableId,
		    'paraMap.formIndex':formIndex,
		    'paraMap.FORM_COL_ID_D':FORM_COL_ID_D,
		    'paraMap.trIndex':curRowSeq,
		    'paraMap.formidFirstId':formidFirstId,
		    'paraMap.subFormId':subFormId,
		    'paraMap.subRelColId':subRelColId,
		    'paraMap.relColVal':relColVal},
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
			initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
			/*
			var formIds = $("input[type='hidden'][name='formIds']").val();
			var formIdLs = formIds.split(",");
			for(var i=0,j=formIdLs.length;i<j;i++){
				getEditRows(formIdLs[i],"0");
			}
			*/
		}
		function initEditDataLs(){
		getEditRows("b9f80468a9fe4b74ada4fceff23db738","1","881411561f8f4940ac22575c4b8f02ef","b9f80468a9fe4b74ada4fceff23db738","3a6a195ea82c4ebbaaaacc3ee52c6438","${dataId}");
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
	  <script type="text/javascript">	 
	function init(){
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
	$('#paraMapObj_0_CBD_ITEM_SECTION').bind('keyup', function () {
             if( ! /^([\d]+|([\d]+[.]?|[\d]+[.]?[\d]+))$/.test(this.value)){
             	this.value='';
             //	$('#_alertValMsgDiv2').css('display','block');
             _alertValMsg($('#paraMapObj_0_CBD_ITEM_SECTION'),"<dict:lang value="该项只能为数字" />");
             }
         });

</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
