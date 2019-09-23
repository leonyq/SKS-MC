<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
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
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;"><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0"/><dict:lang value="保存并关闭窗口" /></div>
			    <div class="optn">
			        <button type="button" onclick="add(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd">
						    			<form id="addForm" name="addForm" action="${path}buss/bussModel_addComm.ms" method="post" <bu:formet exeid="%{exeid}" />
										target="submitFrame">
										<input type="hidden" name="exeid" value="${exeid}">
										<input type="hidden" name="definedMsg" value="${definedMsg}">
										<input type="hidden" name=iframeId value="${iframeId}">
										<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
										<s:token />
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
		<bu:set name="paraMapObj" value="${dataId}" formId="cdbf4e637fb14cd2abca8771c28268d8" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="cdbf4e637fb14cd2abca8771c28268d8" />
	
	//todo paraMap1 改为paraMap0
	<input type="hidden" name="cdbf4e637fb14cd2abca8771c28268d8" value="paraMap0@" />
	<input type="hidden" name="paraMap0@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap0@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'d91d395d958c478aab898e6d6ebbc008'" />
		<s:set name="_$formId_1" value="'cdbf4e637fb14cd2abca8771c28268d8'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name-three" /><bu:uitn colNo="UUID" formId="cdbf4e637fb14cd2abca8771c28268d8" /></td>
			<bu:td cssClass="dec-self" colNo="UUID" formId="cdbf4e637fb14cd2abca8771c28268d8" ><bu:ui colNo="UUID" formId="cdbf4e637fb14cd2abca8771c28268d8" value="%{UUID}" formIndex="0" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="UUNAME" formId="cdbf4e637fb14cd2abca8771c28268d8" /></td>
			<bu:td cssClass="dec-self" colNo="UUNAME" formId="cdbf4e637fb14cd2abca8771c28268d8" ><bu:ui colNo="UUNAME" formId="cdbf4e637fb14cd2abca8771c28268d8" value="%{UUNAME}" formIndex="0" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="TEST" formId="cdbf4e637fb14cd2abca8771c28268d8" /></td>
			<bu:td cssClass="dec-self" colNo="TEST" formId="cdbf4e637fb14cd2abca8771c28268d8" ><bu:ui colNo="TEST" formId="cdbf4e637fb14cd2abca8771c28268d8" value="%{TEST}" formIndex="0" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="cdbf4e637fb14cd2abca8771c28268d8" formIndex="1" />		<div style="padding:1px;"></div>

<!--begin-->
	<div style="padding:1px;" ></div>
<div class="mod">
<div class="mod-hd">
<h3 class="tit">测试弹出新增级联</h3>
<div class="more">
<a onclick="showAddPopWin('f28e888470274e45b90a63f55d64ebb1')" title="添加" class="btn-op" ><i class="ico ico-add"></i>添加</a>
</div>
</div>
<div class="mod-bd">	<table id="addTable_f28e888470274e45b90a63f55d64ebb1" width="100%" class="glxb-table table-line" >
	<input type="hidden" name="formIds" value="f28e888470274e45b90a63f55d64ebb1" />
	<input type="hidden" name="f28e888470274e45b90a63f55d64ebb1" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<thead>
		<tr>
			<th class="tr1 ">UUNAME</th>
			<th>操作</th>
		</tr>
		</thead>
		<tbody>
		<input type="hidden" id="addTable_FORM_COL_ID_Df28e888470274e45b90a63f55d64ebb1" value="0ef8b50df2ec49e9b4384d1d3fbc7447" > 		<textarea id="_addTableTr_f28e888470274e45b90a63f55d64ebb1" style="width:0px;height:0px;display:none;" disabled="disabled" >		&lt;tr id=&quot;addTableTr0_f28e888470274e45b90a63f55d64ebb1&quot; &gt; 			&lt;td style=&quot;position:relative;padding-left:5px;&quot; class=&quot;dec&quot;&gt;				&lt;input type=&quot;text&quot;  id=&quot;paraMap0_UUNAME&quot; name=&quot;paraMap1@0#UUNAME&quot; class=&quot; input isSubmit &quot; /&gt;
&lt;/td&gt;			&lt;td&gt;&lt;a href=&quot;javascript:void(0);&quot; onclick=&quot;delRow(this);&quot; title=&quot;?&#31227;&#38500;&#34892;&quot;&gt;&lt;img src=&quot;/mes/plf/style/css1/images/m_rm.gif&quot; /&gt;&lt;/a&gt;&lt;/td&gt;		&lt;/tr&gt;		</textarea>
<script>

</script>
		</tbody>
	</table>
</div>
</div>
  <script type="text/javascript">
    function valData(){
    var checkRes = true;
    return checkRes;    }
	function showAddPopWin(exeid)
	{
		var piframeId = window.frameElement.id;
		var url = "/mes/buss/bussModel_forAddCommPop.ms?exeid=" + exeid + "&piframeId=" + piframeId;
		showPopWinFp(url, 800, 400,"","test","新增","");
	}
	function showEditPopWin(exeid,e)
	{
		var piframeId = window.frameElement.id;
		var id = $(e).parent().parent()[0].id;
		console.log($(e).parent().siblings().find("input"));
		var inputs = $(e).parent().siblings().find("input");
		var data = "{";
		for(var i = 0,len = inputs.length; i < len; i++)
		{
			if(i == len - 1)
			{
				data += "\"" + inputs[i].id + "\":\"" + inputs[i].value + "\"";
			}				
			else
			{
				data += "\"" + inputs[i].id + "\":\"" + inputs[i].value + "\",";
			}
		}
		data = data + "}";
		var url = "/mes/buss/bussModel_forAddCommPop.ms?exeid=" + exeid + "&piframeId=" + piframeId + "&data=" + data +"&trId=" + id;
		showPopWinFp(url, 800, 400,"","test","新增","");
	}
	
	function addData(data,exeid){
		var colParams = "";
		addRowPop(exeid,'1', colParams,data);
		
	}
	
	function editData(data,exeid,trId)
	{
		var json = eval('('+ data +')');
		var name = null;
		var colId = trId.substring('addTableTr'.length,trId.indexOf('_'));
		
		var paramMap = document.getElementsByName('f28e888470274e45b90a63f55d64ebb1')[0].value;
		for(var item in json)
		{
			if(item.indexOf('paraMap0@0#') == 0)
			{
				name = item.substring(item.indexOf('paraMap0@0#') + 'paraMap0@0#'.length);
				console.log(paramMap + colId + '#'+ name);
				console.log(document.getElementsByName(paramMap + colId + '#'+ name)[0]);
				if(document.getElementsByName(paramMap + colId + '#'+ name)[0] != null)
				{
					document.getElementsByName(paramMap + colId + '#'+ name)[0].value = json[item];	
				}
			}
		}
		document.getElementById(trId);
	}
	
	function findData(trId){
		var tr = document.getElementById(trId);
		console.log(trId);
		console.log(tr);
		var inputs = tr.getElementsByTagName("input");
		var data = "{";
		var map = "\"" + trId + "_key\":" + "[";
		for(var i = 0,len = inputs.length; i < len; i++)
		{
			data += "\"" + inputs[i].id + "\":\"" + inputs[i].value + "\",";
			if(i == len - 1)
			{
				map += "\"" + inputs[i].id + "\"";
			}				
			else
			{
				map += "\"" + inputs[i].id + "\",";
			}
		}
		map += "]";
		data += map;
		data = data + "}";
		var result = data;
		return result;
	}
	
  </script>
  <!--end-->
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

<script type="text/javascript">
	function init(){
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
