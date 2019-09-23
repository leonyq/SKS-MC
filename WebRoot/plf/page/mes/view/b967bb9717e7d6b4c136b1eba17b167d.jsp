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
	<script type="text/javascript">
		
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
		var addTableTrMap;


	</script>
</head>
<body>
	<div class="edit">
            <div class="hd">
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
			    <div class="optn">
			        <button type="button" onclick="addParentData('${param.piframeId}','${param.viewid}','${exeid}');"><i class="ico ico-save"></i>保存</button>
			        <button type="button" onclick="closeCurrentWindow();"><i class="ico ico-cancel"></i>取消</button>
			    </div>
			</div>
			<div class="bd">
				<form id="addForm" name="addForm" action="${path}buss/bussModel_addComm.ms" method="post" <bu:formet exeid="%{exeid}" />
				target="submitFrame">
			<input type="hidden" name="exeid" value="${exeid}">
			<input type="hidden" name="definedMsg" value="${definedMsg}">
			<input type="hidden" name="trId" value="${param.trId}">
			<input type="hidden" name="data" value="${param.data}">
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
			<s:token />
			<!-- <table class="basic-table">
							<tr>
												<th colspan="4">
													<span class="Eng">*</span>
													<dict:lang value="为必填项" />
												</th>
										</tr>
									</table>-->
		<bu:set name="paraMapObj" value="${dataId}" formId="b9f80468a9fe4b74ada4fceff23db738" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="b9f80468a9fe4b74ada4fceff23db738" />
	<input type="hidden" name="b9f80468a9fe4b74ada4fceff23db738" value="paraMap0@" />
	<input type="hidden" name="paraMap0@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap0@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'1da7e322a2744995a418936d029737db'" />
		<s:set name="_$formId_0" value="'b9f80468a9fe4b74ada4fceff23db738'" />
		<s:set name="_$type" value="'add'" />
		<tr colName='CBD_ITEM_CODE'>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CBD_ITEM_CODE" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
			<bu:td cssClass="dec-self" colNo="CBD_ITEM_CODE" formId="b9f80468a9fe4b74ada4fceff23db738" ><bu:ui colNo="CBD_ITEM_CODE" formId="b9f80468a9fe4b74ada4fceff23db738" value="%{CBD_ITEM_CODE}" type="addpop" formIndex="${param.formid}" trIndex="${param.trid}" /></bu:td>
		<td style="width:120px">&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CBD_ITEM_NAME" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
			<bu:td cssClass="dec-self" colNo="CBD_ITEM_NAME" formId="b9f80468a9fe4b74ada4fceff23db738" ><bu:ui colNo="CBD_ITEM_NAME" formId="b9f80468a9fe4b74ada4fceff23db738" value="%{CBD_ITEM_NAME}" type="addpop" formIndex="${param.formid}" trIndex="${param.trid}" /></bu:td>
		</tr>
		<tr colName='CBD_ITEM_SPEC'>
			<td class="name-six" /><bu:uitn colNo="CBD_ITEM_SPEC" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
			<bu:td cssClass="dec-self" colNo="CBD_ITEM_SPEC" formId="b9f80468a9fe4b74ada4fceff23db738" ><bu:ui colNo="CBD_ITEM_SPEC" formId="b9f80468a9fe4b74ada4fceff23db738" value="%{CBD_ITEM_SPEC}" type="addpop" formIndex="${param.formid}" trIndex="${param.trid}" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CBD_UNITS" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
			<bu:td cssClass="dec-self" colNo="CBD_UNITS" formId="b9f80468a9fe4b74ada4fceff23db738" ><bu:ui colNo="CBD_UNITS" formId="b9f80468a9fe4b74ada4fceff23db738" value="%{CBD_UNITS}" type="addpop" formIndex="${param.formid}" trIndex="${param.trid}" /></bu:td>
		</tr>
		<tr colName='CBD_POINT'>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CBD_POINT" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
			<bu:td cssClass="dec-self" colNo="CBD_POINT" formId="b9f80468a9fe4b74ada4fceff23db738" ><bu:ui colNo="CBD_POINT" formId="b9f80468a9fe4b74ada4fceff23db738" value="%{CBD_POINT}" type="addpop" formIndex="${param.formid}" trIndex="${param.trid}" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CBD_ITEM_NUM" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
			<bu:td cssClass="dec-self" colNo="CBD_ITEM_NUM" formId="b9f80468a9fe4b74ada4fceff23db738" ><bu:ui colNo="CBD_ITEM_NUM" formId="b9f80468a9fe4b74ada4fceff23db738" value="%{CBD_ITEM_NUM}" type="addpop" formIndex="${param.formid}" trIndex="${param.trid}" /></bu:td>
		</tr>
		 <tr colName='CBD_ITEM_SECTION'>
			<td class="name-six" /><bu:uitn colNo="CBD_ITEM_SECTION" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
			<bu:td cssClass="dec-self" colNo="CBD_ITEM_SECTION" formId="b9f80468a9fe4b74ada4fceff23db738" ><bu:ui colNo="CBD_ITEM_SECTION" formId="b9f80468a9fe4b74ada4fceff23db738" value="%{CBD_ITEM_SECTION}" type="addpop" formIndex="${param.formid}" trIndex="${param.trid}" /></bu:td>
		<td>&nbsp;</td>
		    <td class="name-six" /><bu:uitn colNo="CBD_BOTTOM_POINT" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
			<bu:td cssClass="dec-self" colNo="CBD_BOTTOM_POINT" formId="b9f80468a9fe4b74ada4fceff23db738" ><bu:ui colNo="CBD_BOTTOM_POINT" formId="b9f80468a9fe4b74ada4fceff23db738" value="%{CBD_BOTTOM_POINT}" type="addpop" formIndex="${param.formid}" trIndex="${param.trid}" /></bu:td>
		
		</tr>
		<tr colName='CBD_BOTTOM_NUM'>
					
			<td class="name-six" /><bu:uitn colNo="CBD_BOTTOM_NUM" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
			<bu:td cssClass="dec-self" colNo="CBD_BOTTOM_NUM" formId="b9f80468a9fe4b74ada4fceff23db738" ><bu:ui colNo="CBD_BOTTOM_NUM" formId="b9f80468a9fe4b74ada4fceff23db738" value="%{CBD_BOTTOM_NUM}" type="addpop" formIndex="${param.formid}" trIndex="${param.trid}" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CBD_TOP_POINT" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
			<bu:td cssClass="dec-self" colNo="CBD_TOP_POINT" formId="b9f80468a9fe4b74ada4fceff23db738" ><bu:ui colNo="CBD_TOP_POINT" formId="b9f80468a9fe4b74ada4fceff23db738" value="%{CBD_TOP_POINT}" type="addpop" formIndex="${param.formid}" trIndex="${param.trid}" /></bu:td>
		</tr>
		
		<tr colName='CBD_TOP_NUM'>
			<td class="name-six" /><bu:uitn colNo="CBD_TOP_NUM" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
			<bu:td cssClass="dec-self" colNo="CBD_TOP_NUM" formId="b9f80468a9fe4b74ada4fceff23db738" ><bu:ui colNo="CBD_TOP_NUM" formId="b9f80468a9fe4b74ada4fceff23db738" value="%{CBD_TOP_NUM}" type="addpop" formIndex="${param.formid}" trIndex="${param.trid}" /></bu:td>
		
	    	<td>&nbsp;</td>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CBD_ITEM_TYPE" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
			<bu:td cssClass="dec-self" colNo="CBD_ITEM_TYPE" formId="b9f80468a9fe4b74ada4fceff23db738" ><bu:ui colNo="CBD_ITEM_TYPE" formId="b9f80468a9fe4b74ada4fceff23db738" value="%{CBD_ITEM_TYPE}" type="addpop" formIndex="${param.formid}" trIndex="${param.trid}" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="b9f80468a9fe4b74ada4fceff23db738" formIndex="0" />
				<table class="func_table">
				<tr>
					<td width="100%" align="right">
						
					</td>
				</tr>
				</table>
			</form>
		</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

<script type="text/javascript">
	
		$(function(){
		
		var parentWindow = $(window.parent.document).contents().find("#"+'${param.piframeId}')[0].contentWindow;
		var cells = document.getElementsByTagName("td");
		if('${param.relcol}' != '')
		{
			$("table").find("tr").each(function(i,item){
				if($(item).attr('colName') == '${paraMap.relcolName}')
				{
					$(item).remove();
				}
			});
		}
		if('${param.col}' != '')
		{
			//console.log(cells.length);
			for (var i = 0;i< cells.length;i++)
			{
				if($(cells[i]).hasClass("dec-self"))
				{	
					var temp = parentWindow.findTr('td_' + '${param.col}' + '#' + $(cells[i]).attr("colno"));
					if(temp == null || typeof(temp) == 'undefind')
					{
						continue;
					}
					else
					{
						var itemCopy = new Array();
						$(cells[i]).children().each(function(i,item){
							//console.log(item);
							//console.log(item.nodeName);
							if(item.nodeName != 'SCRIPT')
							{
								item.remove();
							}
							else
							{
								itemCopy.push($(item).clone());
								item.remove();	
							}
						});
						//$(cells[i]).empty();
						if(temp.children().length > 0 && temp.children().hasClass("dept_select")){
							$(cells[i]).append($(temp.children()[0]).css("display","block"));
						}else{
							$(cells[i]).append(temp.children());
						}
						for(var j = 0; j < itemCopy.length ;j++)
						{
							$(cells[i]).append(itemCopy[j]);
						}
					}
				}
			}
		}
	});
	
	
	
	
	function init(){
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
		
	}//初始化方法
		
	$.fn.serializeObject = function()
	{
		var o = {};
		var a = this.serializeArray();
		$.each(a, function()
		{
			if (o[this.name]){
				if( !o[this.name].push){
					o[this.name] = [o[this.name]];
				}
				o[this.name].push(this.value || '');
			}
			else{
				o[this.name] = this.value || '';	
			}
		});
		return o;
	}

	function addParentData(e,exeid,viewid)
	{
	    if(!val.valNullData()){
			return ;
		}
		if(!valData()){
			return ;
		}
		if(!val.valOjbsData()){
			return ;
		}
		var parentWindows = $(window.parent.document).contents().find("#"+e)[0].contentWindow;
		var data = $("#addForm").serializeObject();
		var cp = $("table tr .dec-self").clone(1);
		
		var col = '${param.col}';
		if(col == '')
		{
			col = parentWindows.addData(e,exeid,viewid);
		}
		$("table").find("td").each(function(i,item){
				parentWindows.editData($(item).children(),col ,$(item).attr("colno"));
		});

		closeTopPopWinFp(window.frameElement.id + "pop");
	}
	function closeCurrentWindow()
	{
		closeTopPopWinFp(window.frameElement.id + "pop");
	}
	
	
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
