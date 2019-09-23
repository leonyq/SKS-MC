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
			        <button type="button" onclick="add(this,'${formId}');"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd">
						    			<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms" method="post" <bu:formet exeid="%{exeid}" />
										target="submitFrame">
										<input type="hidden" name="exeid" value="${exeid}">
										<input type="hidden" name="definedMsg" value="${definedMsg}">
										<input type="hidden" name="formId" value="${formId}">
										<input type="hidden" name=iframeId value="${iframeId}">
										<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
										<s:token />
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
		<bu:set name="paraMapObj" value="${dataId}" formId="023e50e6146648b4a5950f10108d1048" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="023e50e6146648b4a5950f10108d1048" />
	<input type="hidden" name="023e50e6146648b4a5950f10108d1048" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'5a8ed39d97064dabb4f170e19a72afd4'" />
		<s:set name="_$formId_1" value="'023e50e6146648b4a5950f10108d1048'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name-three" /><bu:uitn colNo="FIELD_2" formId="023e50e6146648b4a5950f10108d1048" /></td>
			<bu:td cssClass="dec-self" colNo="FIELD_2" formId="023e50e6146648b4a5950f10108d1048" ><bu:ui colNo="FIELD_2" formId="023e50e6146648b4a5950f10108d1048" value="%{FIELD_2}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="FIELD_1" formId="023e50e6146648b4a5950f10108d1048" /></td>
			<bu:td cssClass="dec-self" colNo="FIELD_1" formId="023e50e6146648b4a5950f10108d1048" ><bu:ui colNo="FIELD_1" formId="023e50e6146648b4a5950f10108d1048" value="%{FIELD_1}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="FIELD_3" formId="023e50e6146648b4a5950f10108d1048" /></td>
			<bu:td cssClass="dec-self" colNo="FIELD_3" formId="023e50e6146648b4a5950f10108d1048" ><bu:ui colNo="FIELD_3" formId="023e50e6146648b4a5950f10108d1048" value="%{FIELD_3}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="FIELD_4" formId="023e50e6146648b4a5950f10108d1048" /></td>
			<bu:td cssClass="dec-self" colNo="FIELD_4" formId="023e50e6146648b4a5950f10108d1048" ><bu:ui colNo="FIELD_4" formId="023e50e6146648b4a5950f10108d1048" value="%{FIELD_4}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="023e50e6146648b4a5950f10108d1048" formIndex="1" />		<div style="padding:1px;"></div>

		<div class="mod" >
			<div class="mod-hd"> 
				<h3 class="tit"><dict:lang value="二级表" /></h3>
					<div class="extend-btn" style="float: right;margin-top:15px;">
						<button type="button"    onclick="_addRowExtend('b8940f2372da43f3b00e50534f392e08','2','','','3c79d68f72194aa3b69ed1a4a3b2aadb');"     style="padding:0;" title="<dict:lang value="添加" />">   <i class="ico ico-kl-new-add ico-small"></i>
						</button>
						<button type="button" onclick="_delRowExtend('b8940f2372da43f3b00e50534f392e08','3c79d68f72194aa3b69ed1a4a3b2aadb');"     style="padding:0"   title="<dict:lang value="移除" /> " >   <i class="ico ico-sc-new-add ico-small"></i> 
						</button> 
					</div>
			</div>
			<div class="mod-bd" >
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"   >
						<div class="datagrid-header" >
							<div class="datagrid-header-inner" id="datagrid-header-innerb8940f2372da43f3b00e50534f392e08">
								<bu:addSub formid="023e50e6146648b4a5950f10108d1048" formIndex="2"  selfformid="b8940f2372da43f3b00e50534f392e08" hidecol=""  viewid="" />
							</div>
						</div>
						<div class="datagrid-body datagrid-div3"  style="height:150px" onscroll="ajaxTableScroll(this,'b8940f2372da43f3b00e50534f392e08')">
							<table class="glxb-table" style="width:100%" id="addTable_b8940f2372da43f3b00e50534f392e08" >
								<tbody id="tbody_b8940f2372da43f3b00e50534f392e08" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>
		<div style="padding:1px;"></div>

		<div class="mod" >
			<div class="mod-hd"> 
				<h3 class="tit"><dict:lang value="三级表" /></h3>
					<div class="extend-btn" style="float: right;margin-top:15px;">
						<button type="button"   onclick="_addRowExtend('3c79d68f72194aa3b69ed1a4a3b2aadb','3',getSelectedCountExtend,'b8940f2372da43f3b00e50534f392e08');"    style="padding:0;" title="<dict:lang value="添加" />">   <i class="ico ico-kl-new-add ico-small"></i>
						</button>
						<button type="button" onclick="_delRowExtend('3c79d68f72194aa3b69ed1a4a3b2aadb');"     style="padding:0"   title="<dict:lang value="移除" /> " >   <i class="ico ico-sc-new-add ico-small"></i> 
						</button> 
					</div>
			</div>
			<div class="mod-bd" >
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"   >
						<div class="datagrid-header" >
							<div class="datagrid-header-inner" >
				<bu:addSub formid="023e50e6146648b4a5950f10108d1048" formIndex="3"  selfformid="3c79d68f72194aa3b69ed1a4a3b2aadb" hidecol=""  viewid="" />
							</div>
						</div>
						<div class="datagrid-body datagrid-div3"  style="height:120px">
							<table class="glxb-table" style="width:100%" id="addTable_3c79d68f72194aa3b69ed1a4a3b2aadb" >
								<tbody id="tbody_3c79d68f72194aa3b69ed1a4a3b2aadb" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>

									</form>
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
