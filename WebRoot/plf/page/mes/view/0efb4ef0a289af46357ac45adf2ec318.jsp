<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head >
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
	<script src="${path}/plf/js/ui/textform/js/jquery.validate.js"></script>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
	<script>
	//加载父ifream中的js\css文件
        $(function(){
        	$("#paraMap1_REVIEW_DATE").val('${dataMap.nowDate}');
        });
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
				//include(scriptList[i].src);
				//alert("include "+scriptList[i].src);
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
	<script type="text/javascript">
		var addTableTrMap;
	</script>
</head>
<body>
	<div class="edit">
            		<div class="hd">
            		<div style="margin-left:10px;"><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0"/><dict:lang value="保存并关闭窗口" /></div>
			    <div class="optn">
			        <button type="button" onclick="add(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			</div>
			<div class="bd">
			<form id="addForm" name="addForm" action="/mes/buss/bussModel_addComm.ms" method="post"  target="submitFrame">
				<input type="hidden" name="exeid" value="8c48a9cf080d435098e1b7e2622ecc91">
				<input type="hidden" name="FUNC_CODE" value="" id="FUNC_CODE"/>
				<input type="hidden" name="struts.token.name" value="token" />
				<input type="hidden" name="iframeId" value="${iframeId}">
<input type="hidden" name="token" value="2MBHWCECOXKWOYQQAVT2SOWC209CKOVI" />

				<div style="padding:1px;" ></div>
		<div class="mod">
<div class="mod-hd">
<h3 class="tit">评审记录人员</h3>
<div class="more">
<a href="javascript:addRow('2d4d0184423b492cabd07b99279a36d2','2');" title="<dict:lang value="添加" />" class="btn-op"><i class="ico ico-add"></i><dict:lang value="添加" /></a>
</div>
</div>
<div class="mod-bd">
<table id="addTable_2d4d0184423b492cabd07b99279a36d2" width="100%" class="glxb-table table-line">
	<input type="hidden" name="formIds" value="2d4d0184423b492cabd07b99279a36d2" />
	<input type="hidden" name="2d4d0184423b492cabd07b99279a36d2" value="paraMap2@" />
	<input type="hidden" name="paraMap2@__LEVEL__" value="2" />
	<input type="hidden" name="paraMap2@__DATA_COUNT__" value="2" />
		<thead>
		<tr>
			<th style="width:50%;"><dict:lang value="评审人员" /></th>
			<th style="width:50%;"><dict:lang value="操作" /></th>
		</tr>
		</thead>
		<tbody>
		<input type="hidden" id="addTable_FORM_COL_ID_D2d4d0184423b492cabd07b99279a36d2" value="779f2a5bc172400b91e553d8dfb505c1" > 
				<textarea id="_addTableTr_2d4d0184423b492cabd07b99279a36d2" style="width:0px;height:0px;display:none;" disabled="disabled" >	
					&lt;tr id=&quot;addTableTr0_2d4d0184423b492cabd07b99279a36d2&quot; &gt; 			&lt;td&gt;				&lt;input type=&quot;hidden&quot;  id=&quot;paraMap1_USER_ID&quot; name=&quot;paraMap2@0#USER_ID&quot; class=&quot;isSubmit &quot; /&gt;
				&lt;div&gt;&lt;nobr&gt;&lt;input editName=&quot;paraMap2@#USER_ID&quot; type=&quot;text&quot;  id=&quot;paraMap1_USER_ID_SHOW&quot; class=&quot;isSubmit &quot; style=&quot;border:1px solid #FFD397;&quot; ondblclick=&quot;_showSelFkSql(this,'add%2C2d4d0184423b492cabd07b99279a36d2%2C06c7d132144b4ee288f3d7217df698da','&#29992;&#25143;ID'); &quot;  readonly=&quot;readonly&quot;   /&gt;&lt;img src=&quot;/mes/plf/images/ContImg25.gif&quot; onclick=&quot;_showSelFkSql_img(this,'paraMap2@0#USER_ID');&quot; style=&quot;cursor: pointer;&quot; title=&quot;&#28857;&#20987;&#36873;&#25321; &#29992;&#25143;ID&quot; /&gt;&lt;/nobr&gt;&lt;/div&gt;
&lt;/td&gt;			&lt;td&gt;&lt;a href=&quot;javascript:void(0);&quot; onclick=&quot;delRow(this);&quot; title=&quot;?&#31227;&#38500;&#34892;&quot;&gt;&lt;img src=&quot;/mes/plf/style/css1/images/m_rm.gif&quot; /&gt;&lt;/a&gt;&lt;/td&gt;		&lt;/tr&gt;		</textarea>
<script> 
 
</script>
		</tbody>
	</table>
</div>
</div>

				<table class="basic-table" >
	<input type="hidden" name="formIds" value="48144a83dd8d48bfb2efd478b3e61934" />
	<input type="hidden" name="48144a83dd8d48bfb2efd478b3e61934" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="paraMap1@0#STATE" value="1" />
	<s:set name="_$viewId" value="'8c48a9cf080d435098e1b7e2622ecc91'" />
		<s:set name="_$formId_1" value="'48144a83dd8d48bfb2efd478b3e61934'" />
		<s:set name="_$type" value="'add'" />
			<tr>
			<td class="name " style="width: 65px;"><span class="dot">*</span><bu:uitn colNo="RESPOMSOBLE" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
			<td class="dec"><bu:ui colNo="RESPOMSOBLE" formId="48144a83dd8d48bfb2efd478b3e61934" value="%{RESPOMSOBLE}" formIndex="1" cssClass="_VAL_NULL isSubmit" /></td>
			<td class="name "><span class="dot">*</span><bu:uitn colNo="MODNAME" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
			<td class="dec" style="width:230px;"><bu:ui colNo="MODNAME" formId="48144a83dd8d48bfb2efd478b3e61934" value="%{MODNAME}" formIndex="1" cssClass="_VAL_NULL isSubmit" /></td>
		</tr>
		<tr>
			<td class="name " style="width: 65px;"><span class="dot">*</span><bu:uitn colNo="PROJECT" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
			<td class="dec"><bu:ui colNo="PROJECT" formId="48144a83dd8d48bfb2efd478b3e61934" value="%{PROJECT}" formIndex="1" cssClass="_VAL_NULL isSubmit" /></td>
			<td class="name "><span class="dot">*</span><bu:uitn colNo="PRIORITY" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
			<td class="dec"><bu:ui colNo="PRIORITY" formId="48144a83dd8d48bfb2efd478b3e61934" value="%{PRIORITY}" formIndex="1" cssClass="_VAL_NULL isSubmit" /></td>
		</tr>
		<tr >
			<td class="name " style="width: 65px;"><span class="dot">*</span><bu:uitn colNo="REVIEW_DATE" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
			<td class="dec"><bu:ui colNo="REVIEW_DATE" formId="48144a83dd8d48bfb2efd478b3e61934" value="%{REVIEW_DATE}" formIndex="1" cssClass="_VAL_NULL isSubmit" /></td>
			<td class="name "><span class="dot">*</span><bu:uitn colNo="STATE" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
			<td class="dec"><bu:ui colNo="STATE" formId="48144a83dd8d48bfb2efd478b3e61934" value="%{STATE}" formIndex="1" disabled="disabled"/></td>
		</tr>
		<tr>
			<td class="name " style="width: 65px;"><bu:uitn colNo="CODE_PATH" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
			<td class="dec" colspan="3"><bu:ui colNo="CODE_PATH" formId="48144a83dd8d48bfb2efd478b3e61934" value="%{CODE_PATH}" formIndex="1" /></td>
		</tr>
		<tr>
			<td class="name " style="width: 65px;"><span class="dot">*</span><bu:uitn colNo="CODE_DETAIL" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
			<td class="dec" colspan="3" style="height:80px;"><bu:ui colNo="CODE_DETAIL" formId="48144a83dd8d48bfb2efd478b3e61934" value="%{CODE_DETAIL}" formIndex="1"  style="width:100%" cssClass="_VAL_NULL isSubmit" /></td>
		</tr>
		<tr>
			<td class="name " style="width: 65px;"><span class="dot">*</span><bu:uitn colNo="IMPROVE_USER" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
			<td class="dec"><bu:ui colNo="IMPROVE_USER" formId="48144a83dd8d48bfb2efd478b3e61934" value="%{IMPROVE_USER}" formIndex="1" disabled="disabled"/></td>
			<td class="name "><span class="dot">*</span><bu:uitn colNo="IMPROVE_DATE" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
			<td class="dec"><bu:ui colNo="IMPROVE_DATE" formId="48144a83dd8d48bfb2efd478b3e61934" value="%{IMPROVE_DATE}" formIndex="1" /></td>
		</tr>
		<tr>
			<td class="name " style="width: 65px;"><span class="dot">*</span><bu:uitn colNo="IMPROVE_REMARK" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
			<td class="dec" colspan="3" style="height:80px;"><bu:ui colNo="IMPROVE_REMARK" formId="48144a83dd8d48bfb2efd478b3e61934" value="%{IMPROVE_REMARK}" formIndex="1"  style="width:100%" cssClass="_VAL_NULL isSubmit" /></td>
		</tr>
		<tr>
			<td class="name " style="width: 65px;"><span class="dot">*</span><bu:uitn colNo="CHECK_USER" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
			<td class="dec"><bu:ui colNo="CHECK_USER" formId="48144a83dd8d48bfb2efd478b3e61934" value="%{CHECK_USER}" formIndex="1" cssClass="_VAL_NULL isSubmit" /></td>
			<td class="name "><span class="dot">*</span><bu:uitn colNo="CHECK_DATE" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
			<td class="dec"><bu:ui colNo="CHECK_DATE" formId="48144a83dd8d48bfb2efd478b3e61934" value="%{CHECK_DATE}" formIndex="1" cssClass="_VAL_NULL isSubmit" /></td>
		</tr>
		<%--<tr>
			<td class="name " style="width: 65px;"><span class="dot">*</span><bu:uitn colNo="STATE" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
			<td class="dec" colspan="3"><bu:ui colNo="STATE" formId="48144a83dd8d48bfb2efd478b3e61934" value="%{STATE}" formIndex="1" /></td>
		</tr>
		--%><tr>
			<td class="name " style="width: 65px;"><span class="dot">*</span><bu:uitn colNo="CHECK_REMARK" formId="48144a83dd8d48bfb2efd478b3e61934" /></td>
			<td class="dec" colspan="3" style="height:80px;"><bu:ui colNo="CHECK_REMARK" formId="48144a83dd8d48bfb2efd478b3e61934" value="%{IMPROVE_REMARK}" formIndex="1" style="width:100%" cssClass="_VAL_NULL isSubmit" /></td>
		</tr>
		
	</table>
	<script type="text/javascript">
    function valData(){
    var checkRes = true;
    return checkRes;    }
  </script>
 
			  <script type="text/javascript">
    function valData(){
    var checkRes = true;
    return checkRes;    }
  </script>
			</form>
		</div>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0"
			height="0"></iframe>
	</div>
	<bu:script viewId="17bfd4fb60894b059bd3a8f4bf41d9be" />

	<script type="text/javascript">

</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

	<script type="text/javascript">
	function init(){
		initEditDataLs();
		$(".<s:property value="%{@com.more.mes.common.tags.mes.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
		
		/*
		var formIds = $("input[type='hidden'][name='formIds']").val();
		var formIdLs = formIds.split(",");
		for(var i=0,j=formIdLs.length;i<j;i++){
			getEditRows(formIdLs[i],"0");
		}
		*/	
	}//初始化方法
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
